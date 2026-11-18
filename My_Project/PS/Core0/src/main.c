#include <stdint.h>
#include <string.h>
#include "xparameters.h"
#include "xgpiops.h"
#include "xgpio.h"
#include "xscugic.h"
#include "xscutimer.h"
#include "xuartps.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include "sleep.h"

#include "breath_led.h"

#define PS_LED_PIN 15u
#define PL_EMIO_KEY_PIN 54u
#define AXI_GPIO_CHANNEL_1 1u

#define TIMER_LOAD_VALUE 0x9ec969f

volatile uint8_t emio_intr_flag;
volatile uint8_t axi_gpio_intr_flag;
volatile uint8_t timer_intr_flag;
volatile uint8_t uart_intr_flag;
uint8_t uart1_buffer[64];

XGpioPs gpio_inst;
XGpioPs_Config *gpio_cfg_ptr;
XGpio axi_gpio_inst;
XScuGic gic_inst;
XScuGic_Config *gic_cfg_ptr;
XScuTimer timer_inst;
XScuTimer_Config *timer_cfg_ptr;
XUartPs uart_inst;
XUartPs_Config *uart_cfg_ptr;

void bsp_gpio_init(void);
void bsp_timer_init(void);
void bsp_uart_init(void);
void bsp_gic_init(void);
static void emio_intr_handler(void *arg);
static void axi_intr_handler(void *arg);
static void timer_intr_handler(void *arg);
static void uart_intr_handler(void *arg);
void XGpioPs_TogglePin(const XGpioPs *InstancePtr, u32 id);

int main(void){
    bsp_gpio_init();
    bsp_timer_init();
    bsp_gic_init();
    // BREATH_LED_mWriteReg(XPAR_XBREATH_LED_NUM_INSTANCES)
    while(1){
        if(emio_intr_flag){
            emio_intr_flag = 0;
        }
        if(axi_gpio_intr_flag){
            axi_gpio_intr_flag = 0;
        }
        if(timer_intr_flag){
            timer_intr_flag = 0;
            XGpioPs_TogglePin(&gpio_inst, PS_LED_PIN);
        }
        if(uart_intr_flag){
            uart_intr_flag = 0;
            // handle
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
    XGpio_SetDataDirection(&axi_gpio_inst, 1, 1);
}

void bsp_timer_init(void){
    timer_cfg_ptr = XScuTimer_LookupConfig(XPAR_XSCUTIMER_0_BASEADDR);
    XScuTimer_CfgInitialize(&timer_inst, timer_cfg_ptr, timer_cfg_ptr->BaseAddr);
    XScuTimer_LoadTimer(&timer_inst, TIMER_LOAD_VALUE);
    XScuTimer_EnableAutoReload(&timer_inst);
}

void bsp_uart_init(void){
    uart_cfg_ptr = XUartPs_LookupConfig(XPAR_XUARTPS_0_BASEADDR);
    XUartPs_CfgInitialize(&uart_inst, uart_cfg_ptr, uart_cfg_ptr->BaseAddress);
    if(XUartPs_SelfTest(&uart_inst) != XST_SUCCESS) xil_printf("Uart Initialization Failed");

    XUartPs_SetOperMode(&uart_inst, XUARTPS_OPER_MODE_NORMAL);
    XUartPs_SetBaudRate(&uart_inst, 115200);
    XUartPs_SetFifoThreshold(&uart_inst, 1); // Hardware FIFO Threshold: 1~63
}

void bsp_gic_init(void){
    gic_cfg_ptr = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
    XScuGic_CfgInitialize(&gic_inst, gic_cfg_ptr, gic_cfg_ptr->CpuBaseAddress);

    XGpioPs_SetIntrTypePin(&gpio_inst, PL_EMIO_KEY_PIN, XGPIOPS_IRQ_TYPE_EDGE_FALLING);
    XScuGic_Connect(&gic_inst, XPAR_XGPIOPS_0_INTR, emio_intr_handler, &gpio_inst);
    XGpioPs_IntrEnablePin(&gpio_inst, PL_EMIO_KEY_PIN);
    XScuGic_Enable(&gic_inst, XPAR_XGPIOPS_0_INTR);

    XScuGic_SetPriorityTriggerType(&gic_inst, XPAR_FABRIC_XGPIO_0_INTR + 32u, 0xa0, 0x01);
    XScuGic_Connect(&gic_inst, XPAR_FABRIC_XGPIO_0_INTR + 32u, axi_intr_handler, &axi_gpio_inst);
    XGpio_InterruptEnable(&axi_gpio_inst, XGPIO_IR_CH1_MASK);
    XGpio_InterruptGlobalEnable(&axi_gpio_inst);
    XScuGic_Enable(&gic_inst, XPAR_FABRIC_XGPIO_0_INTR + 32u);

    XScuGic_Connect(&gic_inst, XPAR_SCUTIMER_INTR, timer_intr_handler, &timer_inst);
    XScuTimer_EnableInterrupt(&timer_inst);
    XScuGic_Enable(&gic_inst, XPAR_SCUTIMER_INTR);

    XUartPs_SetInterruptMask(&uart_inst, XUARTPS_IXR_RXOVR); //Interrupt trigger mode
    XScuGic_Connect(&gic_inst, XPAR_XUARTPS_1_INTR, uart_intr_handler, &uart_inst);
    XScuGic_Enable(&gic_inst, XPAR_XUARTPS_1_INTR);

    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, &gic_inst);
    Xil_ExceptionEnable();

    XScuTimer_Start(&timer_inst);
}

static void emio_intr_handler(void *arg){
    XGpioPs *gpio_inst_ptr = (XGpioPs*)arg;
    if(XGpioPs_IntrGetStatusPin(gpio_inst_ptr, PL_EMIO_KEY_PIN)){ //"XGpioPs_ReadPin(gpio_inst_ptr, PL_EMIO_KEY_PIN) == 0" is also ok
        emio_intr_flag = 1;
        XGpioPs_IntrClearPin(gpio_inst_ptr, PL_EMIO_KEY_PIN);
    }
}
static void axi_intr_handler(void *arg){
    XGpio *axi_gpio_inst_ptr = (XGpio*)arg;
    if(XGpio_DiscreteRead(axi_gpio_inst_ptr, 1) == 0){
        axi_gpio_intr_flag = 1;
        XGpio_InterruptClear(axi_gpio_inst_ptr, XGPIO_IR_CH1_MASK);
    }
}
static void timer_intr_handler(void *arg){
    XScuTimer *timer_inst_ptr = (XScuTimer*)arg;
    if(XScuTimer_IsExpired(timer_inst_ptr)){
        timer_intr_flag = 1;
        XScuTimer_ClearInterruptStatus(timer_inst_ptr);
    }
}
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
void XGpioPs_TogglePin(const XGpioPs *InstancePtr, u32 id){
    static uint8_t flag = 0;
    flag = !flag;
    XGpioPs_WritePin(InstancePtr, id, flag);
}
