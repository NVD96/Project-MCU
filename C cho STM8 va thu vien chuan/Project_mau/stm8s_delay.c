
/**
  ******************************************************************************
  * Ten Tep      :        stm8s_delay.c
  * Tac Gia      :        www.hocdientu123.vn
  * Ngay         :        01-08-2019
  ******************************************************************************
  */
#include "stm8s_delay.h"
/*******************************************************************************
Noi Dung      :   Tao delay_us
Tham Bien     :   value
Tra Ve        :   Khong.
*******************************************************************************/

void delay_us(unsigned int  value)
{
	register unsigned int loops =  (dly_const * value) ;
	
	while(loops)
	{
		_asm ("nop");
		loops--;
	};
}
/*******************************************************************************
Noi Dung      :   Tao delay_ms
Tham Bien     :   value
Tra Ve        :   Khong.
*******************************************************************************/
void delay_ms(unsigned int  value)
{
	while(value)
	{
		delay_us(1000);
		value--;
	};
}
