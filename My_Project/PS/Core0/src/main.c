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
