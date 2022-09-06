/**
  ******************************************************************************
  * Ten Tep      :        stm8s_delay.h
  * Tac Gia      :        www.hocdientu123.vn
  * Ngay         :        01-08-2019
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM8S_DELAY_H
#define __STM8S_DELAY_H
#include "stm8s.h" 
#define F_CPU 				16000000UL 
#define dly_const			(F_CPU / 16000000.0F) 


void delay_us(unsigned int  value);
void delay_ms(unsigned int value);
#endif /* __STM8S_DELAY_H*/