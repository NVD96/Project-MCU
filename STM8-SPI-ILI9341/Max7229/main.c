#include "stm8s.h"
#include "stm8s_conf.h"
#include "stm8s103_SPI.h"
#include "stm8s_max72xx.h"
#include "stm8s_delay.h"

void clock_setup(void);
void GPIO_setup(void);

 
void main()
{          
    clock_setup();
    GPIO_setup();
    SPI_setup();
    MAX7219_init();
    while(1){
    display_clear();
    delay_ms(2000);
    for(int n=0; n<=26; n++){
    display_char(n);
    delay_ms(10000);
      }
    }
    

}
 
 
void clock_setup(void)
{
     CLK_DeInit();
                
 
     CLK_HSICmd(ENABLE);
     while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
     CLK_ClockSwitchCmd(ENABLE);
     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);                
     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
     DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
                
     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
 
}
 
 
void GPIO_setup(void)
{
     GPIO_DeInit(GPIOC);
     GPIO_Init(GPIOC,GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
     GPIO_Init(GPIOC,GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);
}