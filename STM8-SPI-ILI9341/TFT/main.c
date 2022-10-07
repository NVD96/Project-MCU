#include "stm8s.h"
#include "stm8s_gpio.h"
#include "stm8s_spi.h"
#include "stm8s_delay.h"
#include "stm8s_conf.h"

#define LCD_W 240
#define LCD_H 320

#define WHITE         	 0xFFFF
#define BLACK         	 0x0000	  
#define BLUE         	 0x001F  
#define BRED             0XF81F
#define GRED 		 0XFFE0
#define GBLUE		 0X07FF
#define RED           	 0xF800
#define MAGENTA       	 0xF81F
#define GREEN         	 0x07E0
#define CYAN          	 0x7FFF
#define YELLOW        	 0xFFE0
#define BROWN 		 0XBC40 
#define BRRED 		 0XFC07 
#define GRAY  		 0X8430 
#define DARKBLUE      	 0X01CF	
#define LIGHTBLUE      	 0X7D7C	 
#define GRAYBLUE       	 0X5458 
#define LIGHTGREEN     	 0X841F 
#define LGRAY 	         0XC618 
#define LGRAYBLUE        0XA651 
#define LBBLUE           0X2B12


void TFT_io();
void TFT_Start();
void TFT_Stop();
void TFT_SPI_Tx(uint8_t data1);//send data 8bit
void TFT_Cmd(uint8_t data2);//send command 8bit
void TFT_RS();
void TFT_Init();
void TFT_Write16BIT(uint8_t data3, uint8_t data4);
void setaddrWindown(int color);
void SetColor(uint8_t data5, uint8_t data6);
void clock_setup(void);//Phai cai dat ham clock khi dung SPI


void main( void )
{
 clock_setup();
 TFT_io();
 TFT_RS();
 delay_ms(1000);
 TFT_Init();

  while(1){
    for(uint8_t k = 1; k<=100; k++){ 
   setaddrWindown(k);
   SetColor(0xFF, 0xE0);
    }
  }

}


void TFT_io(){
  GPIO_DeInit(GPIOC);
  GPIO_DeInit(GPIOD);
  GPIO_DeInit(GPIOB);
  GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST); //LED
  GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST); //SCK
  GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST); //MOSI
  GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST); //CS
  GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); //DC
  GPIO_Init(GPIOD, GPIO_PIN_1, GPIO_MODE_OUT_PP_HIGH_FAST); //RESET (Phai ket noi chan RESET thi TFT moi lam viec)
  SPI_DeInit();
  SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_2, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_LOW, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_1LINE_TX, SPI_NSS_SOFT, 0x07);
  SPI_Cmd(ENABLE);
}

void TFT_Start(){
  GPIO_WriteLow(GPIOC, GPIO_PIN_4);
}
void TFT_Stop(){
  GPIO_WriteHigh(GPIOC, GPIO_PIN_4);
}

void clock_setup(void){
     CLK_DeInit();
     CLK_HSICmd(ENABLE);
     while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
     CLK_ClockSwitchCmd(ENABLE);
     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);                
     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);     
     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
}
void TFT_SPI_Tx(uint8_t data1){
  SPI_SendData(data1);
  while(!SPI_GetFlagStatus(SPI_FLAG_TXE)){GPIO_WriteLow(GPIOB, GPIO_PIN_5);}
  GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
}
void TFT_Cmd(uint8_t data2){
  GPIO_WriteLow(GPIOC, GPIO_PIN_3);
  TFT_SPI_Tx(data2);
  GPIO_WriteHigh(GPIOC, GPIO_PIN_3);
}

void TFT_RS(){
    while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0x01);      //
    TFT_Stop();
}

void TFT_Init(){
    while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xEF);      //
    TFT_SPI_Tx(0x03);
    TFT_SPI_Tx(0x80);
    TFT_SPI_Tx(0x02);
    TFT_Stop();
  
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xCF);      //
    TFT_SPI_Tx(0x00);
    TFT_SPI_Tx(0xC1);
    TFT_SPI_Tx(0x30);
    TFT_Stop();
  
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xED);      //
    TFT_SPI_Tx(0x64);
    TFT_SPI_Tx(0x03);
    TFT_SPI_Tx(0x12);
    TFT_SPI_Tx(0x81);
    TFT_Stop();
    
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xE8);      //
    TFT_SPI_Tx(0x85);
    TFT_SPI_Tx(0x00);
    TFT_SPI_Tx(0x78);
    TFT_Stop();

        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xCB);      //
    TFT_SPI_Tx(0x39);
    TFT_SPI_Tx(0x2C);
    TFT_SPI_Tx(0x00);
    TFT_SPI_Tx(0x34);
    TFT_SPI_Tx(0x02);
    TFT_Stop();
 
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xF7);      //
    TFT_SPI_Tx(0x20);
    TFT_Stop();
    
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xEA);      //
    TFT_SPI_Tx(0x00);
    TFT_SPI_Tx(0x00);
    TFT_Stop();
  
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xC0);      //
    TFT_SPI_Tx(0x23);
    TFT_Stop();
   
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xC1);      //
    TFT_SPI_Tx(0x10);
    TFT_Stop();
   
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xC5);      //
    TFT_SPI_Tx(0x3E);
    TFT_SPI_Tx(0x28);
    TFT_Stop();

        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xC7);      //
    TFT_SPI_Tx(0x86);
    TFT_Stop();
   
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0x36);      //
    TFT_SPI_Tx(0x48);
    TFT_Stop();
   
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0x37);      //
    TFT_SPI_Tx(0x00);
    TFT_Stop();
   
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0x3A);      //
    TFT_SPI_Tx(0x55);
    TFT_Stop();
   
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xB1);      //
    TFT_SPI_Tx(0x00);
    TFT_SPI_Tx(0x18);
    TFT_Stop();

        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xB6);      //
    TFT_SPI_Tx(0x08);
    TFT_SPI_Tx(0x82);
    TFT_SPI_Tx(0x27);
    TFT_Stop();
 
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xF2);      //
    TFT_SPI_Tx(0x00);
    TFT_Stop();

        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0x26);      //
    TFT_SPI_Tx(0x01);
    TFT_Stop();
    
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xE0);      //
    TFT_SPI_Tx(0x0F);
    TFT_SPI_Tx(0x31);
    TFT_SPI_Tx(0x2B);
    TFT_SPI_Tx(0x0C);
    TFT_SPI_Tx(0x0E);
    TFT_SPI_Tx(0x08);
    TFT_SPI_Tx(0x4E);
    TFT_SPI_Tx(0xF1);
    TFT_SPI_Tx(0x37);
    TFT_SPI_Tx(0x07);
    TFT_SPI_Tx(0x10);
    TFT_SPI_Tx(0x03);
    TFT_SPI_Tx(0x0E);
    TFT_SPI_Tx(0x09);
    TFT_SPI_Tx(0x00);
    TFT_Stop();
    
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0xE1);      //
    TFT_SPI_Tx(0x00);
    TFT_SPI_Tx(0x0E);
    TFT_SPI_Tx(0x14);
    TFT_SPI_Tx(0x03);
    TFT_SPI_Tx(0x11);
    TFT_SPI_Tx(0x07);
    TFT_SPI_Tx(0x31);
    TFT_SPI_Tx(0xC1);
    TFT_SPI_Tx(0x48);
    TFT_SPI_Tx(0x08);
    TFT_SPI_Tx(0x0F);
    TFT_SPI_Tx(0x0C);
    TFT_SPI_Tx(0x31);
    TFT_SPI_Tx(0x36);
    TFT_SPI_Tx(0x0F);
    TFT_Stop();
    
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0x11);
    TFT_Stop();
   
        while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0x29);
    TFT_Stop();
 
    while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Cmd(0x36);      //
    TFT_SPI_Tx(0x08);
    TFT_Stop();

}

void TFT_Write16BIT(uint8_t data3, uint8_t data4){
  TFT_SPI_Tx(data3);
  TFT_SPI_Tx(data4);
}

void setaddrWindown(int color){
  while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
  TFT_Cmd(0x2A);
  TFT_Write16BIT(0x00, color);
  TFT_Write16BIT(0x00, color);
  TFT_Stop();
  while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
  TFT_Cmd(0x2B);
  TFT_Write16BIT(0x00, 0x05);
  TFT_Write16BIT(0x00, 0x05);
  TFT_Stop();
  
  while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
  TFT_Cmd(0x2C);
  TFT_Stop();
  
}

void SetColor(uint8_t data5, uint8_t data6){
    while(SPI_GetFlagStatus(SPI_FLAG_BSY));
    TFT_Start();
    TFT_Write16BIT(data5, data6);
    TFT_Stop();
    
}