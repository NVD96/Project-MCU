   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  50                     ; 18 int main()
  50                     ; 19 {
  52                     	switch	.text
  53  0000               _main:
  57                     ; 20 	Clock_setup();//goi lai ham
  59  0000 ad3d          	call	_Clock_setup
  61                     ; 21 	GPIO_setup();//goi lai ham
  63  0002 ad59          	call	_GPIO_setup
  65                     ; 22 	GPIO_Write(GPIOB,0xFF);//tat het LED
  67  0004 4bff          	push	#255
  68  0006 ae5005        	ldw	x,#20485
  69  0009 cd0000        	call	_GPIO_Write
  71  000c 84            	pop	a
  72  000d               L12:
  73                     ; 25 			GPIO_WriteLow(LED_PORT,LED1_PIN);//goi muc 0 ra LED1
  75  000d 4b01          	push	#1
  76  000f ae5005        	ldw	x,#20485
  77  0012 cd0000        	call	_GPIO_WriteLow
  79  0015 84            	pop	a
  80                     ; 26 			GPIO_WriteLow(LED_PORT,LED2_PIN);//goi muc 0 ra LED2
  82  0016 4b02          	push	#2
  83  0018 ae5005        	ldw	x,#20485
  84  001b cd0000        	call	_GPIO_WriteLow
  86  001e 84            	pop	a
  87                     ; 27 			delay_ms(100);
  89  001f ae0064        	ldw	x,#100
  90  0022 cd0000        	call	_delay_ms
  92                     ; 28 			GPIO_WriteHigh(LED_PORT,LED1_PIN);//goi muc 1 ra LED1
  94  0025 4b01          	push	#1
  95  0027 ae5005        	ldw	x,#20485
  96  002a cd0000        	call	_GPIO_WriteHigh
  98  002d 84            	pop	a
  99                     ; 29 			GPIO_WriteHigh(LED_PORT,LED2_PIN);//goi muc 1 ra LED2
 101  002e 4b02          	push	#2
 102  0030 ae5005        	ldw	x,#20485
 103  0033 cd0000        	call	_GPIO_WriteHigh
 105  0036 84            	pop	a
 106                     ; 30 			delay_ms(100);
 108  0037 ae0064        	ldw	x,#100
 109  003a cd0000        	call	_delay_ms
 112  003d 20ce          	jra	L12
 140                     ; 38 void Clock_setup()
 140                     ; 39 {
 141                     	switch	.text
 142  003f               _Clock_setup:
 146                     ; 41 			CLK_DeInit();   
 148  003f cd0000        	call	_CLK_DeInit
 150                     ; 42 			CLK_HSECmd(ENABLE); 
 152  0042 a601          	ld	a,#1
 153  0044 cd0000        	call	_CLK_HSECmd
 155                     ; 43 			CLK_ClockSwitchCmd(ENABLE);
 157  0047 a601          	ld	a,#1
 158  0049 cd0000        	call	_CLK_ClockSwitchCmd
 160                     ; 44 			CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);//f_CPU = f_Master/2 = 8MHz;Configure the HSE prescaler         
 162  004c a681          	ld	a,#129
 163  004e cd0000        	call	_CLK_SYSCLKConfig
 165                     ; 45 			CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 167  0051 4b00          	push	#0
 168  0053 4b00          	push	#0
 169  0055 ae01b4        	ldw	x,#436
 170  0058 cd0000        	call	_CLK_ClockSwitchConfig
 172  005b 85            	popw	x
 173                     ; 46 }
 176  005c 81            	ret
 201                     ; 52 void GPIO_setup()
 201                     ; 53 {
 202                     	switch	.text
 203  005d               _GPIO_setup:
 207                     ; 55 	    GPIO_DeInit(GPIOD);
 209  005d ae500f        	ldw	x,#20495
 210  0060 cd0000        	call	_GPIO_DeInit
 212                     ; 56       GPIO_DeInit(GPIOC);
 214  0063 ae500a        	ldw	x,#20490
 215  0066 cd0000        	call	_GPIO_DeInit
 217                     ; 57       GPIO_DeInit(GPIOA);
 219  0069 ae5000        	ldw	x,#20480
 220  006c cd0000        	call	_GPIO_DeInit
 222                     ; 58       GPIO_DeInit(GPIOE);
 224  006f ae5014        	ldw	x,#20500
 225  0072 cd0000        	call	_GPIO_DeInit
 227                     ; 59       GPIO_DeInit(GPIOB);   
 229  0075 ae5005        	ldw	x,#20485
 230  0078 cd0000        	call	_GPIO_DeInit
 232                     ; 60       GPIO_DeInit(GPIOF);
 234  007b ae5019        	ldw	x,#20505
 235  007e cd0000        	call	_GPIO_DeInit
 237                     ; 62       GPIO_Init(LED_PORT,LED1_PIN|LED2_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
 239  0081 4be0          	push	#224
 240  0083 4b03          	push	#3
 241  0085 ae5005        	ldw	x,#20485
 242  0088 cd0000        	call	_GPIO_Init
 244  008b 85            	popw	x
 245                     ; 64 }
 248  008c 81            	ret
 261                     	xdef	_main
 262                     	xdef	_GPIO_setup
 263                     	xdef	_Clock_setup
 264                     	xref	_delay_ms
 265                     	xref	_GPIO_WriteLow
 266                     	xref	_GPIO_WriteHigh
 267                     	xref	_GPIO_Write
 268                     	xref	_GPIO_Init
 269                     	xref	_GPIO_DeInit
 270                     	xref	_CLK_SYSCLKConfig
 271                     	xref	_CLK_ClockSwitchConfig
 272                     	xref	_CLK_ClockSwitchCmd
 273                     	xref	_CLK_HSECmd
 274                     	xref	_CLK_DeInit
 293                     	end
