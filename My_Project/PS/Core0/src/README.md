# This document contains various code templates

---

## ` Pseudocode `

<details>
<summary> 1. EMIO </summary>

```C
#include <stdint.h>
#include <stdio.h>
#include "xparameters.h"
#include "xgpiops.h"
#include "sleep.h"

#define PS_LED 15u
#define PL_KEY 54u //EMIO0

uint8_t flag = 0;

int main(void){
    XGpioPs PsGpio_target;
    XGpioPs_Config *PsGpio_ptr;
    PsGpio_ptr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_BASEADDR);
    XGpioPs_CfgInitialize(&PsGpio_target, PsGpio_ptr, PsGpio_ptr->BaseAddr);
    
    XGpioPs_SetDirectionPin(&PsGpio_target, PS_LED, 1);
    XGpioPs_SetDirectionPin(&PsGpio_target, PL_KEY, 0);
    XGpioPs_SetOutputEnablePin(&PsGpio_target, PS_LED, 1);
    while(1){
        flag = ~flag;
        XGpioPs_WritePin(&PsGpio_target, PS_LED, flag);
        if(XGpioPs_ReadPin(&PsGpio_target, PL_KEY) == 0){
            XGpioPs_WritePin(&PsGpio_target, PS_LED, 1);
        }
        sleep(1);
    }
}
```
</details>


<details>
<summary> 2. GIC </summary>

```C
#include <stdint.h>
#include <stdbool.h>
#include "xparameters.h"
#include "xgpiops.h"
#include "sleep.h"
#include "xil_exception.h"
#include "xscugic.h"  

#define PS_LED_PIN 15u
#define PL_KEY_PIN 54u //EMIO0

volatile uint8_t intr_flag;
XGpioPs gpio_inst;
XGpioPs_Config *gpio_config_ptr;
XScuGic gic_inst;
XScuGic_Config *gic_config_ptr;

void bsp_gpio_init(XGpioPs *gpio_inst, XGpioPs_Config *gpio_ptr, u32 id, u32 dir);
void bsp_gic_init(XGpioPs *gpio_inst, XScuGic *gic_inst, XScuGic_Config *gic_ptr, u32 id);
void XGpioPs_TogglePin(const XGpioPs *InstancePtr, uint32_t id);
static void Intr_Handler(void *callback_ref);

int main(void){
    bsp_gpio_init(&gpio_inst, gpio_config_ptr, PS_LED_PIN, 1);
    bsp_gpio_init(&gpio_inst, gpio_config_ptr, PL_KEY_PIN, 0);
    bsp_gic_init(&gpio_inst, &gic_inst, gic_config_ptr, PL_KEY_PIN);

    while(1){
        if(intr_flag == true){
            XGpioPs_TogglePin(&gpio_inst, PS_LED_PIN);
            intr_flag = false;
        }
        sleep(1);
    }
}

void bsp_gpio_init(XGpioPs *gpio_inst, XGpioPs_Config *gpio_ptr, u32 id, u32 dir){
    if(gpio_ptr == NULL){
        gpio_ptr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_BASEADDR);
        XGpioPs_CfgInitialize(gpio_inst, gpio_ptr, gpio_ptr->BaseAddr);
    }
    XGpioPs_SetDirectionPin(gpio_inst, id, dir);
    if(dir == 1) XGpioPs_SetOutputEnablePin(gpio_inst, id, 1);
}

void bsp_gic_init(XGpioPs *gpio_inst, XScuGic *gic_inst, XScuGic_Config *gic_ptr, u32 id){
    if(gic_ptr == NULL){
        gic_ptr = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
        XScuGic_CfgInitialize(gic_inst, gic_ptr, gic_ptr->CpuBaseAddress);
    }

    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, gic_inst);
    Xil_ExceptionEnable();

    XScuGic_Connect(gic_inst, XPAR_XGPIOPS_0_INTR, Intr_Handler, (void*)gpio_inst);
    XScuGic_Enable(gic_inst, XPAR_XGPIOPS_0_INTR);
    XGpioPs_SetIntrTypePin(gpio_inst, id, XGPIOPS_IRQ_TYPE_EDGE_FALLING);
    XGpioPs_IntrEnablePin(gpio_inst, id);
}

void XGpioPs_TogglePin(const XGpioPs *InstancePtr, uint32_t id){
    static uint8_t flag = 0;
    flag = ~flag;
    XGpioPs_WritePin(InstancePtr, id, flag);
}

static void Intr_Handler(void *callback_ref){
    XGpioPs *gpio_inst = (XGpioPs*)callback_ref;
    if(XGpioPs_IntrGetStatusPin(gpio_inst, PL_KEY_PIN) && XGpioPs_IntrGetEnabledPin(gpio_inst, PL_KEY_PIN)){
        intr_flag = true;
        XGpioPs_IntrClearPin(gpio_inst, PL_KEY_PIN);
    }
}
```

</details>

<details>
<summary> 3. AXI </summary>

```C
#include "xgpio.h"

#define AXI_GPIO_CHANNEL_1 1u

XGpio axi_gpio_inst;

XGpio_Initialize(&axi_gpio_inst, XPAR_AXI_GPIO_0_BASEADDR);
XGpio_SetDataDirection(&axi_gpio_inst, 1, 1);

XScuGic_SetPriorityTriggerType(&gic_inst, XPAR_FABRIC_XGPIO_0_INTR + 32u, 0xa0, 0x01);
XScuGic_Connect(&gic_inst, XPAR_FABRIC_XGPIO_0_INTR + 32u, axi_intr_handler, &axi_gpio_inst);
XGpio_InterruptEnable(&axi_gpio_inst, XGPIO_IR_CH1_MASK);
XGpio_InterruptGlobalEnable(&axi_gpio_inst);
XScuGic_Enable(&gic_inst, XPAR_FABRIC_XGPIO_0_INTR + 32u);

static void axi_intr_handler(void *arg){
    XGpio *axi_gpio_inst_ptr = (XGpio*)arg;
    if(XGpio_DiscreteRead(axi_gpio_inst_ptr, 1) == 0){
        axi_gpio_intr_flag = 1;
        XGpio_InterruptClear(axi_gpio_inst_ptr, XGPIO_IR_CH1_MASK);
    }
}
```
</details>

<details>
<summary> 4. UART </summary>

```C
#include "xuartps.h"

XUartPs uart_inst;
XUartPs_Config *uart_cfg_ptr;

uart_cfg_ptr = XUartPs_LookupConfig(XPAR_XUARTPS_0_BASEADDR);
XUartPs_CfgInitialize(&uart_inst, uart_cfg_ptr, uart_cfg_ptr->BaseAddress);
if(XUartPs_SelfTest(&uart_inst) != XST_SUCCESS) xil_printf("Uart Initialization Failed");
XUartPs_SetOperMode(&uart_inst, XUARTPS_OPER_MODE_NORMAL);
XUartPs_SetBaudRate(&uart_inst, 115200);
XUartPs_SetFifoThreshold(&uart_inst, 1); // Hardware FIFO Threshold: 1~63

XUartPs_SetInterruptMask(&uart_inst, XUARTPS_IXR_RXOVR); //Interrupt trigger mode
XScuGic_Connect(&gic_inst, XPAR_XUARTPS_1_INTR, uart_intr_handler, &uart_inst);
XScuGic_Enable(&gic_inst, XPAR_XUARTPS_1_INTR);
XScuTimer_Start(&timer_inst);

static void uart_intr_handler(void *arg){
    XUartPs *uart_inst_ptr = (XUartPs*)arg;
    static u8 rx_buffer[64];
    static u16 rx_len;
    u32 flag = XUartPs_ReadReg(uart_inst_ptr->Config.BaseAddress, XUARTPS_SR_OFFSET);
    flag &= XUARTPS_SR_RXOVR | XUARTPS_SR_RXEMPTY;
    if(flag & XUARTPS_SR_RXOVR){
        rx_len += XUartPs_Recv(uart_inst_ptr, rx_buffer, sizeof(rx_buffer));
        if(rx_len == sizeof(rx_buffer)){
            uart_intr_flag = 1;
            rx_len = 0;
            memcpy(uart1_buffer, rx_buffer, sizeof(rx_buffer));
        }
        XUartPs_WriteReg(uart_inst_ptr->Config.BaseAddress, XUARTPS_SR_OFFSET, XUARTPS_IXR_RXOVR);
    }
}
```
</details>

<details>
<summary> 5. TIMER </summary>

```C
#include "xscutimer.h"

#define TIMER_LOAD_VALUE 0x9ec969f

XScuTimer timer_inst;
XScuTimer_Config *timer_cfg_ptr;

timer_cfg_ptr = XScuTimer_LookupConfig(XPAR_XSCUTIMER_0_BASEADDR);
XScuTimer_CfgInitialize(&timer_inst, timer_cfg_ptr, timer_cfg_ptr->BaseAddr);
XScuTimer_LoadTimer(&timer_inst, TIMER_LOAD_VALUE);
XScuTimer_EnableAutoReload(&timer_inst);

XScuGic_Connect(&gic_inst, XPAR_SCUTIMER_INTR, timer_intr_handler, &timer_inst);
XScuTimer_EnableInterrupt(&timer_inst);
XScuGic_Enable(&gic_inst, XPAR_SCUTIMER_INTR);

static void timer_intr_handler(void *arg){
    XScuTimer *timer_inst_ptr = (XScuTimer*)arg;
    if(XScuTimer_IsExpired(timer_inst_ptr)){
        timer_intr_flag = 1;
        XScuTimer_ClearInterruptStatus(timer_inst_ptr);
    }
}
```
</details>
