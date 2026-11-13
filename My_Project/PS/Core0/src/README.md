# This document contains various code templates

---

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
#include <stdint.h>
#include "xparameters.h"
#include "xgpiops.h"
#include "xgpio.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "sleep.h"

#define PS_LED_PIN 15u
#define PL_EMIO_KEY_PIN 54u
#define GPIO_CHANNEL_1 1u

volatile uint8_t emio_intr_flag;
volatile uint8_t axi_gpio_intr_flag;
XGpioPs gpio_inst;
XGpioPs_Config *gpio_cfg_ptr;
XScuGic gic_inst;
XScuGic_Config *gic_cfg_ptr;
XGpio axi_gpio_inst;

void bsp_gpio_init(void);
void bsp_gic_init(void);
static void emio_intr_handler(void *arg);
static void axio_intr_handler(void *arg);
void XGpioPs_TogglePin(const XGpioPs *InstancePtr, uint32_t id);

int main (void){
    bsp_gpio_init();
    bsp_gic_init();

    while(1){
        if(emio_intr_flag){
            emio_intr_flag = 0;
            XGpioPs_TogglePin(&gpio_inst, PS_LED_PIN);
        }
        if(axi_gpio_intr_flag){
            axi_gpio_intr_flag = 0;
            XGpioPs_TogglePin(&gpio_inst, PS_LED_PIN);
        }
        msleep(20);
    }
}

void bsp_gpio_init(void){
    gpio_cfg_ptr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_BASEADDR);
    XGpioPs_CfgInitialize(&gpio_inst, gpio_cfg_ptr, gpio_cfg_ptr->BaseAddr);
    XGpioPs_SetDirectionPin(&gpio_inst, PS_LED_PIN, 1);
    XGpioPs_SetDirectionPin(&gpio_inst, PL_EMIO_KEY_PIN, 0);
    XGpioPs_SetOutputEnablePin(&gpio_inst, PS_LED_PIN, 1);
    XGpioPs_WritePin(&gpio_inst, PS_LED_PIN, 0);

    XGpio_Initialize(&axi_gpio_inst, XPAR_AXI_GPIO_0_BASEADDR);
    XGpio_SetDataDirection(&axi_gpio_inst, GPIO_CHANNEL_1, 1);
}

void bsp_gic_init(void){
    gic_cfg_ptr = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
    XScuGic_CfgInitialize(&gic_inst, gic_cfg_ptr, gic_cfg_ptr->CpuBaseAddress);
    XScuGic_Connect(&gic_inst, XPAR_XGPIOPS_0_INTR, emio_intr_handler, &gpio_inst);
    XScuGic_Enable(&gic_inst, XPAR_XGPIOPS_0_INTR);
    XGpioPs_SetIntrTypePin(&gpio_inst, PL_EMIO_KEY_PIN, XGPIOPS_IRQ_TYPE_EDGE_FALLING);
    XGpioPs_IntrEnablePin(&gpio_inst, PL_EMIO_KEY_PIN);

    XGpio_InterruptEnable(&axi_gpio_inst, XGPIO_IR_CH1_MASK);
    XGpio_InterruptGlobalEnable(&axi_gpio_inst);
    XScuGic_SetPriorityTriggerType(&gic_inst, XPAR_FABRIC_XGPIO_0_INTR + 32u, 0xa0, 0x01);
    XScuGic_Connect(&gic_inst, XPAR_FABRIC_XGPIO_0_INTR + 32u, axio_intr_handler, &axi_gpio_inst);
    XScuGic_Enable(&gic_inst, XPAR_FABRIC_XGPIO_0_INTR + 32u);

    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, &gic_inst);
    Xil_ExceptionEnable();
}

static void emio_intr_handler(void *arg){
    XGpioPs *gpio_inst_ptr = (XGpioPs*)arg;
    if(XGpioPs_IntrGetStatusPin(gpio_inst_ptr, PL_EMIO_KEY_PIN) && XGpioPs_IntrGetEnabledPin(gpio_inst_ptr, PL_EMIO_KEY_PIN)){
        emio_intr_flag = 1;
        XGpioPs_IntrClearPin(gpio_inst_ptr, PL_EMIO_KEY_PIN);
    }
}

static void axio_intr_handler(void *arg){
    XGpio *axi_gpio_inst_ptr = (XGpio*)arg;
    XGpio_InterruptDisable(axi_gpio_inst_ptr, XGPIO_IR_CH1_MASK);
    if(XGpio_DiscreteRead(axi_gpio_inst_ptr, GPIO_CHANNEL_1) == 0){
        axi_gpio_intr_flag = 1;
    }
    XGpio_InterruptClear(axi_gpio_inst_ptr, XGPIO_IR_CH1_MASK);
    XGpio_InterruptEnable(axi_gpio_inst_ptr, XGPIO_IR_CH1_MASK);
}

void XGpioPs_TogglePin(const XGpioPs *InstancePtr, uint32_t id){
    static uint8_t flag = 0;
    flag = !flag;
    XGpioPs_WritePin(InstancePtr, id, flag);
}
```
</details>
