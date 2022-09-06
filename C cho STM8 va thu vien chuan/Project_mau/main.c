/*==========================//=================================================
  * Ten Tep      :        main.c
  * Tac Gia      :        www.hocdientu123.vn
  * Ngay         :        01-08-2019
  * Tom Tat      :        Chuong trinh dieu khien Led don.
==========================//=================================================*/
//===========================khai bao cac thu vien can su dung==============//
#include "main.h"
//===========================khai bao cac chan vao ra======================//
#define LED_PORT  GPIOB//khai bao lED o PORTB
#define LED1_PIN  GPIO_PIN_0//khai bao LED1 o chan PB0
#define LED2_PIN  GPIO_PIN_1//khai bao LED1 o chan PB1
//============================khai bao bien va hang==========================//
//============================khai bao ham==================================//
void Clock_setup(void);//thiet lap xung clk cho MCU
void GPIO_setup(void);//thiet lap GPIO
//============================HAM MAIN=======================================//
int main()
{
	Clock_setup();//goi lai ham
	GPIO_setup();//goi lai ham
	GPIO_Write(GPIOB,0xFF);//tat het LED
	while (1)
	{
			GPIO_WriteLow(LED_PORT,LED1_PIN);//goi muc 0 ra LED1
			GPIO_WriteLow(LED_PORT,LED2_PIN);//goi muc 0 ra LED2
			delay_ms(100);
			GPIO_WriteHigh(LED_PORT,LED1_PIN);//goi muc 1 ra LED1
			GPIO_WriteHigh(LED_PORT,LED2_PIN);//goi muc 1 ra LED2
			delay_ms(100);
	}
}
/*******************************************************************************
Noi Dung      :   Thiet lap xung clk cho MCU
Tham Bien     :   Khong.
Tra Ve        :   Khong.
*******************************************************************************/
void Clock_setup()
{
			//KHAI BAO XUNG CLK
			CLK_DeInit();   
			CLK_HSECmd(ENABLE); 
			CLK_ClockSwitchCmd(ENABLE);
			CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);//f_CPU = f_Master/2 = 8MHz;Configure the HSE prescaler         
			CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
}
/*******************************************************************************
Noi Dung      :   Thiet lap GPIO
Tham Bien     :   Khong.
Tra Ve        :   Khong.
*******************************************************************************/
void GPIO_setup()
{
		///RESET CAC PORT
	    GPIO_DeInit(GPIOD);
      GPIO_DeInit(GPIOC);
      GPIO_DeInit(GPIOA);
      GPIO_DeInit(GPIOE);
      GPIO_DeInit(GPIOB);   
      GPIO_DeInit(GPIOF);
		//KHAI BAO CAC CHAN VAO RA
      GPIO_Init(LED_PORT,LED1_PIN|LED2_PIN,GPIO_MODE_OUT_PP_LOW_FAST);

}