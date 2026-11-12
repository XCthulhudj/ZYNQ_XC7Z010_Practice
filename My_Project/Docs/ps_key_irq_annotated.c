#include <stdint.h>
#include <stdbool.h>
#include "xparameters.h"   /* 器件参数：基地址、中断号 */
#include "xgpiops.h"       /* PS GPIO 驱动 */
#include "sleep.h"         /* sleep / usleep */
#include "xil_exception.h" /* IRQ 异常向量注册 */
#include "xscugic.h"       /* GIC 中断控制器驱动 */

/* PS 端 LED：MIO15，MIO 的编号范围是 0~53 */
#define PS_LED_PIN 15u
/* PL 按键：EMIO GPIO0。板级封装脚 M19 -> BD 的
 * GPIO_EMIO_KEY[0] -> PS 侧编号 54（第 0 个 EMIO） */
#define PL_KEY_PIN 54u

volatile uint8_t intr_flag;      /* ISR 置位，main 消费 */
XGpioPs gpio_inst;               /* GPIO 实例，ISR 也要用 */
XGpioPs_Config *gpio_config_ptr; /* BSS 默认 0，等价 NULL */
XScuGic gic_inst;                /* GIC 实例 */
XScuGic_Config *gic_config_ptr;

void bsp_gpio_init(XGpioPs *gpio_inst, XGpioPs_Config *gpio_ptr,
                   u32 id, u32 dir);
void bsp_gic_init(XGpioPs *gpio_inst, XScuGic *gic_inst,
                  XScuGic_Config *gic_ptr, u32 id);
void XGpioPs_TogglePin(const XGpioPs *InstancePtr, uint32_t id);
static void Intr_Handler(void *callback_ref);

int main(void)
{
    /* LED 配成输出，按键配成输入 */
    bsp_gpio_init(&gpio_inst, gpio_config_ptr, PS_LED_PIN, 1);
    bsp_gpio_init(&gpio_inst, gpio_config_ptr, PL_KEY_PIN, 0);
    /* 配 GIC：把 PL_KEY_PIN 的下降沿中断接到 Intr_Handler */
    bsp_gic_init(&gpio_inst, &gic_inst, gic_config_ptr, PL_KEY_PIN);

    while (1) {
        if (intr_flag == true) {      /* 有按键事件 */
            XGpioPs_TogglePin(&gpio_inst, PS_LED_PIN);
            intr_flag = false;        /* 清标志，等下一次 */
        }
        sleep(1);                     /* 1s 轮询，响应慢 */
    }
}

/* 配置一个引脚：id 是引脚号，dir=1 输出 / 0 输入 */
void bsp_gpio_init(XGpioPs *gpio_inst, XGpioPs_Config *gpio_ptr,
                   u32 id, u32 dir)
{
    if (gpio_ptr == NULL) {        /* 首次：查表 + 初始化驱动 */
        gpio_ptr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_BASEADDR);
        XGpioPs_CfgInitialize(gpio_inst, gpio_ptr, gpio_ptr->BaseAddr);
    }
    /* 形参按值传递，外面的 gpio_config_ptr 仍是 NULL，
       所以第二次调用会再初始化一遍；能跑，但不优雅 */
    XGpioPs_SetDirectionPin(gpio_inst, id, dir);
    if (dir == 1) {                /* 输出脚必须打开 OEN */
        XGpioPs_SetOutputEnablePin(gpio_inst, id, 1);
    }
}

/* 初始化 GIC，并把 GPIO 中断挂到自己的处理函数 */
void bsp_gic_init(XGpioPs *gpio_inst, XScuGic *gic_inst,
                  XScuGic_Config *gic_ptr, u32 id)
{
    if (gic_ptr == NULL) {         /* 首次：查表 + 初始化 GIC */
        gic_ptr = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
        XScuGic_CfgInitialize(gic_inst, gic_ptr, gic_ptr->CpuBaseAddress);
    }

    /* 把 GIC 总入口挂到 IRQ 异常向量，并打开 IRQ */
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
                                 (Xil_ExceptionHandler)XScuGic_InterruptHandler,
                                 gic_inst);
    Xil_ExceptionEnable();

    /* XPAR_XGPIOPS_0_INTR 展开为 XPS_GPIO_INT_ID = 52，
       即 Zynq GPIO 在 GIC 里的中断号；回调参数 = GPIO 实例 */
    XScuGic_Connect(gic_inst, XPAR_XGPIOPS_0_INTR, Intr_Handler,
                    (void *)gpio_inst);
    XScuGic_Enable(gic_inst, XPAR_XGPIOPS_0_INTR);

    /* 按键按下时电平 1 -> 0，用下降沿触发 */
    XGpioPs_SetIntrTypePin(gpio_inst, id, XGPIOPS_IRQ_TYPE_EDGE_FALLING);
    XGpioPs_IntrEnablePin(gpio_inst, id); /* 使能该引脚中断 */
}

/* 翻转 LED：flag 在 0 / 0xFF 之间跳，
   WritePin 内部只取 bit0，所以结果仍是 0/1 */
void XGpioPs_TogglePin(const XGpioPs *InstancePtr, uint32_t id)
{
    static uint8_t flag = 0;
    flag = ~flag;          /* 建议写 flag = !flag; 更清楚 */
    XGpioPs_WritePin(InstancePtr, id, flag);
}

/* 中断服务：确认状态和使能 -> 置标志 -> 清中断源 */
static void Intr_Handler(void *callback_ref)
{
    XGpioPs *gpio_inst = (XGpioPs *)callback_ref;

    if (XGpioPs_IntrGetStatusPin(gpio_inst, PL_KEY_PIN) &&
        XGpioPs_IntrGetEnabledPin(gpio_inst, PL_KEY_PIN)) {
        intr_flag = true;             /* 干活交给 main */
        XGpioPs_IntrClearPin(gpio_inst, PL_KEY_PIN);
    }
}
