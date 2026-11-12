```c
/* ============================================================================
 * Led_Project —— PS 侧主程序
 *
 * 【架构】
 *   LED 完全由 PL 侧逻辑驱动，PS 只负责"供时钟"：
 *
 *     PS 的 FCLK_CLK0 (50 MHz)
 *          └─> counter_0/sys_clk   （PL 里的 module_ref 实例，源码 PL/.../Src/led.v）
 *              counter_0/led_out ──> FPGA 引脚 J16 ──> LED
 *
 *   counter 参数 CNT_MAX = 24_999_999：
 *     50 MHz / 25,000,000 = 0.5 秒翻转一次  ->  LED 以 1 Hz 闪烁
 *
 * 【为什么 main() 几乎是空的】
 *   Zynq 的时钟不是软件开的。ps7_init() 在 main() 之前就把所有 PLL 和
 *   FCLK 配好了（由 FSBL 或调试器调用）。所以这里不需要、也做不到
 *   "打开时钟" —— 没有 STM32 那样的 RCC->AHB1ENR 外设使能位。
 *
 *   PS 侧真正要紧的两件事都不写在这个文件里：
 *     1. ps7_init()     -> 配 PLL / FCLK0 = 50 MHz
 *     2. 下载 bitstream  -> 让 PL 里真的有 counter 这个电路
 *
 *   如果 LED 不闪，99% 是第 2 件没做（调试配置里没指定 .bit 文件）。
 * ============================================================================ */

#include <stdio.h>
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpiops.h"
#include "sleep.h"

#define PS_LED 15u

int main(void)
{
    // xil_printf("\r\n=====================================\r\n");
    // xil_printf("  Led_Project  (PS side is alive)\r\n");
    // xil_printf("=====================================\r\n");
    // xil_printf("  CPU  clock : %u Hz\r\n", (unsigned int)XPAR_CPU_CORE_CLOCK_FREQ_HZ);
    // xil_printf("  UART clock : %u Hz\r\n", (unsigned int)XPAR_UART0_CLOCK_FREQ);
    // xil_printf("  PL   clock : 50000000 Hz (FCLK_CLK0)\r\n");
    // xil_printf("-------------------------------------\r\n");
    // xil_printf("  LED (J16) should blink at 1 Hz.\r\n");
    // xil_printf("  It is driven by PL logic, not by PS.\r\n");
    // xil_printf("  Dark LED -> bitstream not programmed.\r\n");
    // xil_printf("=====================================\r\n\r\n");

    unsigned int flag = 0;
    XGpioPs Psgpio_target;
    XGpioPs_Config *Psgpio_ptr;
    Psgpio_ptr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_BASEADDR);
    XGpioPs_CfgInitialize(&Psgpio_target, Psgpio_ptr, Psgpio_ptr->BaseAddr);

    XGpioPs_SetDirectionPin(&Psgpio_target, PS_LED, 1);
    XGpioPs_SetOutputEnablePin(&Psgpio_target, PS_LED, 1);

    while (1) {
        flag = ~flag;
        XGpioPs_WritePin(&Psgpio_target, PS_LED, flag);
        sleep(1);
        xil_printf("[tick] PS alive, PL counter running\r\n");
    }

    return 0;
}
```

```c
#include "xparameters.h"
#include "xgpiops.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xplatform_info.h"
#include <xil_printf.h>
#include "sleep.h"
#include <stdio.h>

#define PS_LED1 0   /* PS_LED1 固定为 mio0 */
#define PS_LED2 9   /* ps_led2 固定为 mio9 */
#define PS_KEY1 10  /* PS_KEY1 固定为 mio10 */

/* 定义 ID 方便操作 */
#define GPIO_ID     XPAR_XGPIOPS_0_DEVICE_ID
#define INTC_ID     XPAR_SCUGIC_SINGLE_DEVICE_ID
#define GPIO_INT_ID XPAR_XGPIOPS_0_INTR

static void intr_handler(void *callback_ref);
int init_interrupt(XScuGic *gic_ins_ptr, XGpioPs *gpio, u16 GpioIntrId);

u8 intr_flag;           /* 中断标志 */
XGpioPs Psgpio_target;  /* 实例化 gpio */
XScuGic Cur_int;        /* 实例化通用中断控制器 */

int main(void)
{
    int status;
    u8 key_flag = 0;
    XGpioPs_Config *Psgpio_ptr;

    /* 查找 GPIOPS 配置信息 */
    Psgpio_ptr = XGpioPs_LookupConfig(GPIO_ID);
    if (Psgpio_ptr == NULL) {
        return XST_FAILURE;
    }

    /* 初始化 GPIOPS */
    XGpioPs_CfgInitialize(&Psgpio_target, Psgpio_ptr, Psgpio_ptr->BaseAddr);

    /* 设置 PS_KEY 引脚为输入模式 */
    XGpioPs_SetDirectionPin(&Psgpio_target, PS_KEY1, 0);

    /* 设置 PS_LED 引脚为输出模式 */
    XGpioPs_SetDirectionPin(&Psgpio_target, PS_LED1, 1);
    XGpioPs_SetDirectionPin(&Psgpio_target, PS_LED2, 1);
    XGpioPs_SetOutputEnablePin(&Psgpio_target, PS_LED1, 1);
    XGpioPs_SetOutputEnablePin(&Psgpio_target, PS_LED2, 1);

    /* 初始化引脚默认状态：高电平 */
    XGpioPs_WritePin(&Psgpio_target, PS_LED1, 1);
    XGpioPs_WritePin(&Psgpio_target, PS_LED2, 1);

    /* 初始化中断处理函数 */
    status = init_interrupt(&Cur_int, &Psgpio_target, GPIO_INT_ID);
    if (status != XST_SUCCESS) {
        xil_printf("Interrupt system init failed!\r\n");
        return XST_FAILURE;
    }

    /* 死循环检测按键中断 */
    while (1) {
        if (intr_flag) {
            usleep(15000);  /* 软件延时消抖 */
            if (XGpioPs_ReadPin(&Psgpio_target, PS_KEY1) == 0) {
                key_flag = ~key_flag;
                XGpioPs_WritePin(&Psgpio_target, PS_LED1, key_flag);
                XGpioPs_WritePin(&Psgpio_target, PS_LED2, ~key_flag);
            }
            intr_flag = FALSE;
        }
    }

    return XST_SUCCESS;
}

/* 中断处理函数 */
static void intr_handler(void *callback_ref)
{
    XGpioPs *gpio = (XGpioPs *) callback_ref;

    /* 检测引脚状态 */
    if (XGpioPs_IntrGetStatusPin(gpio, PS_KEY1)
        && XGpioPs_IntrGetEnabledPin(gpio, PS_KEY1)) {
        intr_flag = TRUE;
        /* 清除按键中断 */
        XGpioPs_IntrClearPin(&Psgpio_target, PS_KEY1);
    }
}

/* 中断初始化函数 */
int init_interrupt(XScuGic *gic_ins_ptr, XGpioPs *gpio, u16 GpioIntrId)
{
    int status;
    XScuGic_Config *Int_config;

    /* 查找中断配置信息 */
    Int_config = XScuGic_LookupConfig(INTC_ID);
    if (NULL == Int_config) {
        return XST_FAILURE;
    }

    /* 初始化中断 */
    status = XScuGic_CfgInitialize(gic_ins_ptr, Int_config, Int_config->CpuBaseAddress);
    if (status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    /* 中断异常使能 */
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
                                 (Xil_ExceptionHandler) XScuGic_InterruptHandler,
                                 gic_ins_ptr);
    Xil_ExceptionEnable();

    /* 设置中断处理函数 */
    status = XScuGic_Connect(gic_ins_ptr, GpioIntrId, intr_handler, (void *) gpio);
    if (status != XST_SUCCESS) {
        return status;
    }

    /* 使能 gpio 为中断 */
    XScuGic_Enable(gic_ins_ptr, GpioIntrId);

    /* 设置中断类型为下降沿触发 */
    XGpioPs_SetIntrTypePin(gpio, PS_KEY1, XGPIOPS_IRQ_TYPE_EDGE_FALLING);

    /* 正式开启中断 */
    XGpioPs_IntrEnablePin(gpio, PS_KEY1);

    return XST_SUCCESS;
}
```
