   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  45                     ; 53 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  45                     ; 54 {
  46                     	switch	.text
  47  0000               f_NonHandledInterrupt:
  51                     ; 58 }
  54  0000 80            	iret
  76                     ; 66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  76                     ; 67 {
  77                     	switch	.text
  78  0001               f_TRAP_IRQHandler:
  82                     ; 71 }
  85  0001 80            	iret
 107                     ; 78 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 107                     ; 79 
 107                     ; 80 {
 108                     	switch	.text
 109  0002               f_TLI_IRQHandler:
 113                     ; 84 }
 116  0002 80            	iret
 138                     ; 91 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 138                     ; 92 {
 139                     	switch	.text
 140  0003               f_AWU_IRQHandler:
 144                     ; 96 }
 147  0003 80            	iret
 169                     ; 103 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 169                     ; 104 {
 170                     	switch	.text
 171  0004               f_CLK_IRQHandler:
 175                     ; 108 }
 178  0004 80            	iret
 201                     ; 115 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 201                     ; 116 {
 202                     	switch	.text
 203  0005               f_EXTI_PORTA_IRQHandler:
 207                     ; 120 }
 210  0005 80            	iret
 233                     ; 127 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 233                     ; 128 {
 234                     	switch	.text
 235  0006               f_EXTI_PORTB_IRQHandler:
 239                     ; 132 }
 242  0006 80            	iret
 265                     ; 139 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 265                     ; 140 {
 266                     	switch	.text
 267  0007               f_EXTI_PORTC_IRQHandler:
 271                     ; 144 }
 274  0007 80            	iret
 297                     ; 151 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 297                     ; 152 {
 298                     	switch	.text
 299  0008               f_EXTI_PORTD_IRQHandler:
 303                     ; 156 }
 306  0008 80            	iret
 329                     ; 163 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 329                     ; 164 {
 330                     	switch	.text
 331  0009               f_EXTI_PORTE_IRQHandler:
 335                     ; 168 }
 338  0009 80            	iret
 360                     ; 215 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 360                     ; 216 {
 361                     	switch	.text
 362  000a               f_SPI_IRQHandler:
 366                     ; 220 }
 369  000a 80            	iret
 392                     ; 227 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 392                     ; 228 {
 393                     	switch	.text
 394  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 398                     ; 232 }
 401  000b 80            	iret
 424                     ; 239 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 424                     ; 240 {
 425                     	switch	.text
 426  000c               f_TIM1_CAP_COM_IRQHandler:
 430                     ; 244 }
 433  000c 80            	iret
 456                     ; 277  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 456                     ; 278  {
 457                     	switch	.text
 458  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 462                     ; 282  }
 465  000d 80            	iret
 488                     ; 289  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 488                     ; 290  {
 489                     	switch	.text
 490  000e               f_TIM2_CAP_COM_IRQHandler:
 494                     ; 294  }
 497  000e 80            	iret
 520                     ; 304  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 520                     ; 305  {
 521                     	switch	.text
 522  000f               f_TIM3_UPD_OVF_BRK_IRQHandler:
 526                     ; 309  }
 529  000f 80            	iret
 552                     ; 316  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 552                     ; 317  {
 553                     	switch	.text
 554  0010               f_TIM3_CAP_COM_IRQHandler:
 558                     ; 321  }
 561  0010 80            	iret
 583                     ; 382 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 583                     ; 383 {
 584                     	switch	.text
 585  0011               f_I2C_IRQHandler:
 589                     ; 387 }
 592  0011 80            	iret
 615                     ; 395  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 615                     ; 396  {
 616                     	switch	.text
 617  0012               f_UART2_TX_IRQHandler:
 621                     ; 400  }
 624  0012 80            	iret
 647                     ; 407  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 647                     ; 408  {
 648                     	switch	.text
 649  0013               f_UART2_RX_IRQHandler:
 653                     ; 412  }
 656  0013 80            	iret
 678                     ; 461  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 678                     ; 462  {
 679                     	switch	.text
 680  0014               f_ADC1_IRQHandler:
 684                     ; 466  }
 687  0014 80            	iret
 710                     ; 487  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 710                     ; 488  {
 711                     	switch	.text
 712  0015               f_TIM4_UPD_OVF_IRQHandler:
 716                     ; 492  }
 719  0015 80            	iret
 742                     ; 500 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 742                     ; 501 {
 743                     	switch	.text
 744  0016               f_EEPROM_EEC_IRQHandler:
 748                     ; 505 }
 751  0016 80            	iret
 763                     	xdef	f_EEPROM_EEC_IRQHandler
 764                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 765                     	xdef	f_ADC1_IRQHandler
 766                     	xdef	f_UART2_TX_IRQHandler
 767                     	xdef	f_UART2_RX_IRQHandler
 768                     	xdef	f_I2C_IRQHandler
 769                     	xdef	f_TIM3_CAP_COM_IRQHandler
 770                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 771                     	xdef	f_TIM2_CAP_COM_IRQHandler
 772                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 773                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 774                     	xdef	f_TIM1_CAP_COM_IRQHandler
 775                     	xdef	f_SPI_IRQHandler
 776                     	xdef	f_EXTI_PORTE_IRQHandler
 777                     	xdef	f_EXTI_PORTD_IRQHandler
 778                     	xdef	f_EXTI_PORTC_IRQHandler
 779                     	xdef	f_EXTI_PORTB_IRQHandler
 780                     	xdef	f_EXTI_PORTA_IRQHandler
 781                     	xdef	f_CLK_IRQHandler
 782                     	xdef	f_AWU_IRQHandler
 783                     	xdef	f_TLI_IRQHandler
 784                     	xdef	f_TRAP_IRQHandler
 785                     	xdef	f_NonHandledInterrupt
 804                     	end
