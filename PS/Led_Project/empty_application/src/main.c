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
#include "xscugic.h"
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
