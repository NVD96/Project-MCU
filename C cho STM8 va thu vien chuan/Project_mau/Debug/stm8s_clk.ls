   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     .const:	section	.text
  17  0000               _HSIDivFactor:
  18  0000 01            	dc.b	1
  19  0001 02            	dc.b	2
  20  0002 04            	dc.b	4
  21  0003 08            	dc.b	8
  22  0004               _CLKPrescTable:
  23  0004 01            	dc.b	1
  24  0005 02            	dc.b	2
  25  0006 04            	dc.b	4
  26  0007 08            	dc.b	8
  27  0008 0a            	dc.b	10
  28  0009 10            	dc.b	16
  29  000a 14            	dc.b	20
  30  000b 28            	dc.b	40
  59                     ; 72 void CLK_DeInit(void)
  59                     ; 73 {
  61                     	switch	.text
  62  0000               _CLK_DeInit:
  66                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  68  0000 350150c0      	mov	20672,#1
  69                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  71  0004 725f50c1      	clr	20673
  72                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  74  0008 35e150c4      	mov	20676,#225
  75                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  77  000c 725f50c5      	clr	20677
  78                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  80  0010 351850c6      	mov	20678,#24
  81                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  83  0014 35ff50c7      	mov	20679,#255
  84                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  86  0018 35ff50ca      	mov	20682,#255
  87                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  89  001c 725f50c8      	clr	20680
  90                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  92  0020 725f50c9      	clr	20681
  94  0024               L52:
  95                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  97  0024 c650c9        	ld	a,20681
  98  0027 a501          	bcp	a,#1
  99  0029 26f9          	jrne	L52
 100                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 102  002b 725f50c9      	clr	20681
 103                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 105  002f 725f50cc      	clr	20684
 106                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 108  0033 725f50cd      	clr	20685
 109                     ; 88 }
 112  0037 81            	ret
 168                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 168                     ; 100 {
 169                     	switch	.text
 170  0038               _CLK_FastHaltWakeUpCmd:
 174                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 176                     ; 104   if (NewState != DISABLE)
 178  0038 4d            	tnz	a
 179  0039 2706          	jreq	L75
 180                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 182  003b 721450c0      	bset	20672,#2
 184  003f 2004          	jra	L16
 185  0041               L75:
 186                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 188  0041 721550c0      	bres	20672,#2
 189  0045               L16:
 190                     ; 114 }
 193  0045 81            	ret
 228                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 228                     ; 122 {
 229                     	switch	.text
 230  0046               _CLK_HSECmd:
 234                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 236                     ; 126   if (NewState != DISABLE)
 238  0046 4d            	tnz	a
 239  0047 2706          	jreq	L101
 240                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 242  0049 721050c1      	bset	20673,#0
 244  004d 2004          	jra	L301
 245  004f               L101:
 246                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 248  004f 721150c1      	bres	20673,#0
 249  0053               L301:
 250                     ; 136 }
 253  0053 81            	ret
 288                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 288                     ; 144 {
 289                     	switch	.text
 290  0054               _CLK_HSICmd:
 294                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 296                     ; 148   if (NewState != DISABLE)
 298  0054 4d            	tnz	a
 299  0055 2706          	jreq	L321
 300                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 302  0057 721050c0      	bset	20672,#0
 304  005b 2004          	jra	L521
 305  005d               L321:
 306                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 308  005d 721150c0      	bres	20672,#0
 309  0061               L521:
 310                     ; 158 }
 313  0061 81            	ret
 348                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 348                     ; 167 {
 349                     	switch	.text
 350  0062               _CLK_LSICmd:
 354                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 356                     ; 171   if (NewState != DISABLE)
 358  0062 4d            	tnz	a
 359  0063 2706          	jreq	L541
 360                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 362  0065 721650c0      	bset	20672,#3
 364  0069 2004          	jra	L741
 365  006b               L541:
 366                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 368  006b 721750c0      	bres	20672,#3
 369  006f               L741:
 370                     ; 181 }
 373  006f 81            	ret
 408                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 408                     ; 190 {
 409                     	switch	.text
 410  0070               _CLK_CCOCmd:
 414                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 416                     ; 194   if (NewState != DISABLE)
 418  0070 4d            	tnz	a
 419  0071 2706          	jreq	L761
 420                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 422  0073 721050c9      	bset	20681,#0
 424  0077 2004          	jra	L171
 425  0079               L761:
 426                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 428  0079 721150c9      	bres	20681,#0
 429  007d               L171:
 430                     ; 204 }
 433  007d 81            	ret
 468                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 468                     ; 214 {
 469                     	switch	.text
 470  007e               _CLK_ClockSwitchCmd:
 474                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 476                     ; 218   if (NewState != DISABLE )
 478  007e 4d            	tnz	a
 479  007f 2706          	jreq	L112
 480                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 482  0081 721250c5      	bset	20677,#1
 484  0085 2004          	jra	L312
 485  0087               L112:
 486                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 488  0087 721350c5      	bres	20677,#1
 489  008b               L312:
 490                     ; 228 }
 493  008b 81            	ret
 529                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 529                     ; 239 {
 530                     	switch	.text
 531  008c               _CLK_SlowActiveHaltWakeUpCmd:
 535                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 537                     ; 243   if (NewState != DISABLE)
 539  008c 4d            	tnz	a
 540  008d 2706          	jreq	L332
 541                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 543  008f 721a50c0      	bset	20672,#5
 545  0093 2004          	jra	L532
 546  0095               L332:
 547                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 549  0095 721b50c0      	bres	20672,#5
 550  0099               L532:
 551                     ; 253 }
 554  0099 81            	ret
 713                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 713                     ; 264 {
 714                     	switch	.text
 715  009a               _CLK_PeripheralClockConfig:
 717  009a 89            	pushw	x
 718       00000000      OFST:	set	0
 721                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 723                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 725                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 727  009b 9e            	ld	a,xh
 728  009c a510          	bcp	a,#16
 729  009e 2633          	jrne	L123
 730                     ; 271     if (NewState != DISABLE)
 732  00a0 0d02          	tnz	(OFST+2,sp)
 733  00a2 2717          	jreq	L323
 734                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 736  00a4 7b01          	ld	a,(OFST+1,sp)
 737  00a6 a40f          	and	a,#15
 738  00a8 5f            	clrw	x
 739  00a9 97            	ld	xl,a
 740  00aa a601          	ld	a,#1
 741  00ac 5d            	tnzw	x
 742  00ad 2704          	jreq	L62
 743  00af               L03:
 744  00af 48            	sll	a
 745  00b0 5a            	decw	x
 746  00b1 26fc          	jrne	L03
 747  00b3               L62:
 748  00b3 ca50c7        	or	a,20679
 749  00b6 c750c7        	ld	20679,a
 751  00b9 2049          	jra	L723
 752  00bb               L323:
 753                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 755  00bb 7b01          	ld	a,(OFST+1,sp)
 756  00bd a40f          	and	a,#15
 757  00bf 5f            	clrw	x
 758  00c0 97            	ld	xl,a
 759  00c1 a601          	ld	a,#1
 760  00c3 5d            	tnzw	x
 761  00c4 2704          	jreq	L23
 762  00c6               L43:
 763  00c6 48            	sll	a
 764  00c7 5a            	decw	x
 765  00c8 26fc          	jrne	L43
 766  00ca               L23:
 767  00ca 43            	cpl	a
 768  00cb c450c7        	and	a,20679
 769  00ce c750c7        	ld	20679,a
 770  00d1 2031          	jra	L723
 771  00d3               L123:
 772                     ; 284     if (NewState != DISABLE)
 774  00d3 0d02          	tnz	(OFST+2,sp)
 775  00d5 2717          	jreq	L133
 776                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 778  00d7 7b01          	ld	a,(OFST+1,sp)
 779  00d9 a40f          	and	a,#15
 780  00db 5f            	clrw	x
 781  00dc 97            	ld	xl,a
 782  00dd a601          	ld	a,#1
 783  00df 5d            	tnzw	x
 784  00e0 2704          	jreq	L63
 785  00e2               L04:
 786  00e2 48            	sll	a
 787  00e3 5a            	decw	x
 788  00e4 26fc          	jrne	L04
 789  00e6               L63:
 790  00e6 ca50ca        	or	a,20682
 791  00e9 c750ca        	ld	20682,a
 793  00ec 2016          	jra	L723
 794  00ee               L133:
 795                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 797  00ee 7b01          	ld	a,(OFST+1,sp)
 798  00f0 a40f          	and	a,#15
 799  00f2 5f            	clrw	x
 800  00f3 97            	ld	xl,a
 801  00f4 a601          	ld	a,#1
 802  00f6 5d            	tnzw	x
 803  00f7 2704          	jreq	L24
 804  00f9               L44:
 805  00f9 48            	sll	a
 806  00fa 5a            	decw	x
 807  00fb 26fc          	jrne	L44
 808  00fd               L24:
 809  00fd 43            	cpl	a
 810  00fe c450ca        	and	a,20682
 811  0101 c750ca        	ld	20682,a
 812  0104               L723:
 813                     ; 295 }
 816  0104 85            	popw	x
 817  0105 81            	ret
1005                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1005                     ; 310 {
1006                     	switch	.text
1007  0106               _CLK_ClockSwitchConfig:
1009  0106 89            	pushw	x
1010  0107 5204          	subw	sp,#4
1011       00000004      OFST:	set	4
1014                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1016  0109 aeffff        	ldw	x,#65535
1017  010c 1f03          	ldw	(OFST-1,sp),x
1018                     ; 313   ErrorStatus Swif = ERROR;
1020                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1022                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1024                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1026                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1028                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1030  010e c650c3        	ld	a,20675
1031  0111 6b01          	ld	(OFST-3,sp),a
1032                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1034  0113 7b05          	ld	a,(OFST+1,sp)
1035  0115 a101          	cp	a,#1
1036  0117 264b          	jrne	L544
1037                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1039  0119 721250c5      	bset	20677,#1
1040                     ; 331     if (ITState != DISABLE)
1042  011d 0d09          	tnz	(OFST+5,sp)
1043  011f 2706          	jreq	L744
1044                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1046  0121 721450c5      	bset	20677,#2
1048  0125 2004          	jra	L154
1049  0127               L744:
1050                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1052  0127 721550c5      	bres	20677,#2
1053  012b               L154:
1054                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1056  012b 7b06          	ld	a,(OFST+2,sp)
1057  012d c750c4        	ld	20676,a
1059  0130 2007          	jra	L754
1060  0132               L354:
1061                     ; 346       DownCounter--;
1063  0132 1e03          	ldw	x,(OFST-1,sp)
1064  0134 1d0001        	subw	x,#1
1065  0137 1f03          	ldw	(OFST-1,sp),x
1066  0139               L754:
1067                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1069  0139 c650c5        	ld	a,20677
1070  013c a501          	bcp	a,#1
1071  013e 2704          	jreq	L364
1073  0140 1e03          	ldw	x,(OFST-1,sp)
1074  0142 26ee          	jrne	L354
1075  0144               L364:
1076                     ; 349     if(DownCounter != 0)
1078  0144 1e03          	ldw	x,(OFST-1,sp)
1079  0146 2706          	jreq	L564
1080                     ; 351       Swif = SUCCESS;
1082  0148 a601          	ld	a,#1
1083  014a 6b02          	ld	(OFST-2,sp),a
1085  014c 2002          	jra	L174
1086  014e               L564:
1087                     ; 355       Swif = ERROR;
1089  014e 0f02          	clr	(OFST-2,sp)
1090  0150               L174:
1091                     ; 390   if(Swif != ERROR)
1093  0150 0d02          	tnz	(OFST-2,sp)
1094  0152 2767          	jreq	L515
1095                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1097  0154 0d0a          	tnz	(OFST+6,sp)
1098  0156 2645          	jrne	L715
1100  0158 7b01          	ld	a,(OFST-3,sp)
1101  015a a1e1          	cp	a,#225
1102  015c 263f          	jrne	L715
1103                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1105  015e 721150c0      	bres	20672,#0
1107  0162 2057          	jra	L515
1108  0164               L544:
1109                     ; 361     if (ITState != DISABLE)
1111  0164 0d09          	tnz	(OFST+5,sp)
1112  0166 2706          	jreq	L374
1113                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1115  0168 721450c5      	bset	20677,#2
1117  016c 2004          	jra	L574
1118  016e               L374:
1119                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1121  016e 721550c5      	bres	20677,#2
1122  0172               L574:
1123                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1125  0172 7b06          	ld	a,(OFST+2,sp)
1126  0174 c750c4        	ld	20676,a
1128  0177 2007          	jra	L305
1129  0179               L774:
1130                     ; 376       DownCounter--;
1132  0179 1e03          	ldw	x,(OFST-1,sp)
1133  017b 1d0001        	subw	x,#1
1134  017e 1f03          	ldw	(OFST-1,sp),x
1135  0180               L305:
1136                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1138  0180 c650c5        	ld	a,20677
1139  0183 a508          	bcp	a,#8
1140  0185 2704          	jreq	L705
1142  0187 1e03          	ldw	x,(OFST-1,sp)
1143  0189 26ee          	jrne	L774
1144  018b               L705:
1145                     ; 379     if(DownCounter != 0)
1147  018b 1e03          	ldw	x,(OFST-1,sp)
1148  018d 270a          	jreq	L115
1149                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1151  018f 721250c5      	bset	20677,#1
1152                     ; 383       Swif = SUCCESS;
1154  0193 a601          	ld	a,#1
1155  0195 6b02          	ld	(OFST-2,sp),a
1157  0197 20b7          	jra	L174
1158  0199               L115:
1159                     ; 387       Swif = ERROR;
1161  0199 0f02          	clr	(OFST-2,sp)
1162  019b 20b3          	jra	L174
1163  019d               L715:
1164                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1166  019d 0d0a          	tnz	(OFST+6,sp)
1167  019f 260c          	jrne	L325
1169  01a1 7b01          	ld	a,(OFST-3,sp)
1170  01a3 a1d2          	cp	a,#210
1171  01a5 2606          	jrne	L325
1172                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1174  01a7 721750c0      	bres	20672,#3
1176  01ab 200e          	jra	L515
1177  01ad               L325:
1178                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1180  01ad 0d0a          	tnz	(OFST+6,sp)
1181  01af 260a          	jrne	L515
1183  01b1 7b01          	ld	a,(OFST-3,sp)
1184  01b3 a1b4          	cp	a,#180
1185  01b5 2604          	jrne	L515
1186                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1188  01b7 721150c1      	bres	20673,#0
1189  01bb               L515:
1190                     ; 406   return(Swif);
1192  01bb 7b02          	ld	a,(OFST-2,sp)
1195  01bd 5b06          	addw	sp,#6
1196  01bf 81            	ret
1334                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1334                     ; 416 {
1335                     	switch	.text
1336  01c0               _CLK_HSIPrescalerConfig:
1338  01c0 88            	push	a
1339       00000000      OFST:	set	0
1342                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1344                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1346  01c1 c650c6        	ld	a,20678
1347  01c4 a4e7          	and	a,#231
1348  01c6 c750c6        	ld	20678,a
1349                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1351  01c9 c650c6        	ld	a,20678
1352  01cc 1a01          	or	a,(OFST+1,sp)
1353  01ce c750c6        	ld	20678,a
1354                     ; 425 }
1357  01d1 84            	pop	a
1358  01d2 81            	ret
1493                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1493                     ; 437 {
1494                     	switch	.text
1495  01d3               _CLK_CCOConfig:
1497  01d3 88            	push	a
1498       00000000      OFST:	set	0
1501                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1503                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1505  01d4 c650c9        	ld	a,20681
1506  01d7 a4e1          	and	a,#225
1507  01d9 c750c9        	ld	20681,a
1508                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1510  01dc c650c9        	ld	a,20681
1511  01df 1a01          	or	a,(OFST+1,sp)
1512  01e1 c750c9        	ld	20681,a
1513                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1515  01e4 721050c9      	bset	20681,#0
1516                     ; 449 }
1519  01e8 84            	pop	a
1520  01e9 81            	ret
1585                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1585                     ; 460 {
1586                     	switch	.text
1587  01ea               _CLK_ITConfig:
1589  01ea 89            	pushw	x
1590       00000000      OFST:	set	0
1593                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1595                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1597                     ; 465   if (NewState != DISABLE)
1599  01eb 9f            	ld	a,xl
1600  01ec 4d            	tnz	a
1601  01ed 2719          	jreq	L527
1602                     ; 467     switch (CLK_IT)
1604  01ef 9e            	ld	a,xh
1606                     ; 475     default:
1606                     ; 476       break;
1607  01f0 a00c          	sub	a,#12
1608  01f2 270a          	jreq	L166
1609  01f4 a010          	sub	a,#16
1610  01f6 2624          	jrne	L337
1611                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1611                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1613  01f8 721450c5      	bset	20677,#2
1614                     ; 471       break;
1616  01fc 201e          	jra	L337
1617  01fe               L166:
1618                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1618                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1620  01fe 721450c8      	bset	20680,#2
1621                     ; 474       break;
1623  0202 2018          	jra	L337
1624  0204               L366:
1625                     ; 475     default:
1625                     ; 476       break;
1627  0204 2016          	jra	L337
1628  0206               L137:
1630  0206 2014          	jra	L337
1631  0208               L527:
1632                     ; 481     switch (CLK_IT)
1634  0208 7b01          	ld	a,(OFST+1,sp)
1636                     ; 489     default:
1636                     ; 490       break;
1637  020a a00c          	sub	a,#12
1638  020c 270a          	jreq	L766
1639  020e a010          	sub	a,#16
1640  0210 260a          	jrne	L337
1641                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1641                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1643  0212 721550c5      	bres	20677,#2
1644                     ; 485       break;
1646  0216 2004          	jra	L337
1647  0218               L766:
1648                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1648                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1650  0218 721550c8      	bres	20680,#2
1651                     ; 488       break;
1652  021c               L337:
1653                     ; 493 }
1656  021c 85            	popw	x
1657  021d 81            	ret
1658  021e               L176:
1659                     ; 489     default:
1659                     ; 490       break;
1661  021e 20fc          	jra	L337
1662  0220               L737:
1663  0220 20fa          	jra	L337
1698                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1698                     ; 501 {
1699                     	switch	.text
1700  0222               _CLK_SYSCLKConfig:
1702  0222 88            	push	a
1703       00000000      OFST:	set	0
1706                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1708                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1710  0223 a580          	bcp	a,#128
1711  0225 2614          	jrne	L757
1712                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1714  0227 c650c6        	ld	a,20678
1715  022a a4e7          	and	a,#231
1716  022c c750c6        	ld	20678,a
1717                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1719  022f 7b01          	ld	a,(OFST+1,sp)
1720  0231 a418          	and	a,#24
1721  0233 ca50c6        	or	a,20678
1722  0236 c750c6        	ld	20678,a
1724  0239 2012          	jra	L167
1725  023b               L757:
1726                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1728  023b c650c6        	ld	a,20678
1729  023e a4f8          	and	a,#248
1730  0240 c750c6        	ld	20678,a
1731                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1733  0243 7b01          	ld	a,(OFST+1,sp)
1734  0245 a407          	and	a,#7
1735  0247 ca50c6        	or	a,20678
1736  024a c750c6        	ld	20678,a
1737  024d               L167:
1738                     ; 515 }
1741  024d 84            	pop	a
1742  024e 81            	ret
1798                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1798                     ; 524 {
1799                     	switch	.text
1800  024f               _CLK_SWIMConfig:
1804                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1806                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1808  024f 4d            	tnz	a
1809  0250 2706          	jreq	L1101
1810                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1812  0252 721050cd      	bset	20685,#0
1814  0256 2004          	jra	L3101
1815  0258               L1101:
1816                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1818  0258 721150cd      	bres	20685,#0
1819  025c               L3101:
1820                     ; 538 }
1823  025c 81            	ret
1847                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1847                     ; 548 {
1848                     	switch	.text
1849  025d               _CLK_ClockSecuritySystemEnable:
1853                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1855  025d 721050c8      	bset	20680,#0
1856                     ; 551 }
1859  0261 81            	ret
1884                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1884                     ; 560 {
1885                     	switch	.text
1886  0262               _CLK_GetSYSCLKSource:
1890                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1892  0262 c650c3        	ld	a,20675
1895  0265 81            	ret
1958                     ; 569 uint32_t CLK_GetClockFreq(void)
1958                     ; 570 {
1959                     	switch	.text
1960  0266               _CLK_GetClockFreq:
1962  0266 5209          	subw	sp,#9
1963       00000009      OFST:	set	9
1966                     ; 571   uint32_t clockfrequency = 0;
1968                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1970                     ; 573   uint8_t tmp = 0, presc = 0;
1974                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1976  0268 c650c3        	ld	a,20675
1977  026b 6b09          	ld	(OFST+0,sp),a
1978                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1980  026d 7b09          	ld	a,(OFST+0,sp)
1981  026f a1e1          	cp	a,#225
1982  0271 2641          	jrne	L7601
1983                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1985  0273 c650c6        	ld	a,20678
1986  0276 a418          	and	a,#24
1987  0278 6b09          	ld	(OFST+0,sp),a
1988                     ; 581     tmp = (uint8_t)(tmp >> 3);
1990  027a 0409          	srl	(OFST+0,sp)
1991  027c 0409          	srl	(OFST+0,sp)
1992  027e 0409          	srl	(OFST+0,sp)
1993                     ; 582     presc = HSIDivFactor[tmp];
1995  0280 7b09          	ld	a,(OFST+0,sp)
1996  0282 5f            	clrw	x
1997  0283 97            	ld	xl,a
1998  0284 d60000        	ld	a,(_HSIDivFactor,x)
1999  0287 6b09          	ld	(OFST+0,sp),a
2000                     ; 583     clockfrequency = HSI_VALUE / presc;
2002  0289 7b09          	ld	a,(OFST+0,sp)
2003  028b b703          	ld	c_lreg+3,a
2004  028d 3f02          	clr	c_lreg+2
2005  028f 3f01          	clr	c_lreg+1
2006  0291 3f00          	clr	c_lreg
2007  0293 96            	ldw	x,sp
2008  0294 1c0001        	addw	x,#OFST-8
2009  0297 cd0000        	call	c_rtol
2011  029a ae2400        	ldw	x,#9216
2012  029d bf02          	ldw	c_lreg+2,x
2013  029f ae00f4        	ldw	x,#244
2014  02a2 bf00          	ldw	c_lreg,x
2015  02a4 96            	ldw	x,sp
2016  02a5 1c0001        	addw	x,#OFST-8
2017  02a8 cd0000        	call	c_ludv
2019  02ab 96            	ldw	x,sp
2020  02ac 1c0005        	addw	x,#OFST-4
2021  02af cd0000        	call	c_rtol
2024  02b2 201c          	jra	L1701
2025  02b4               L7601:
2026                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2028  02b4 7b09          	ld	a,(OFST+0,sp)
2029  02b6 a1d2          	cp	a,#210
2030  02b8 260c          	jrne	L3701
2031                     ; 587     clockfrequency = LSI_VALUE;
2033  02ba aef400        	ldw	x,#62464
2034  02bd 1f07          	ldw	(OFST-2,sp),x
2035  02bf ae0001        	ldw	x,#1
2036  02c2 1f05          	ldw	(OFST-4,sp),x
2038  02c4 200a          	jra	L1701
2039  02c6               L3701:
2040                     ; 591     clockfrequency = HSE_VALUE;
2042  02c6 ae2400        	ldw	x,#9216
2043  02c9 1f07          	ldw	(OFST-2,sp),x
2044  02cb ae00f4        	ldw	x,#244
2045  02ce 1f05          	ldw	(OFST-4,sp),x
2046  02d0               L1701:
2047                     ; 594   return((uint32_t)clockfrequency);
2049  02d0 96            	ldw	x,sp
2050  02d1 1c0005        	addw	x,#OFST-4
2051  02d4 cd0000        	call	c_ltor
2055  02d7 5b09          	addw	sp,#9
2056  02d9 81            	ret
2155                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2155                     ; 605 {
2156                     	switch	.text
2157  02da               _CLK_AdjustHSICalibrationValue:
2159  02da 88            	push	a
2160       00000000      OFST:	set	0
2163                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2165                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2167  02db c650cc        	ld	a,20684
2168  02de a4f8          	and	a,#248
2169  02e0 1a01          	or	a,(OFST+1,sp)
2170  02e2 c750cc        	ld	20684,a
2171                     ; 611 }
2174  02e5 84            	pop	a
2175  02e6 81            	ret
2199                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2199                     ; 623 {
2200                     	switch	.text
2201  02e7               _CLK_SYSCLKEmergencyClear:
2205                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2207  02e7 721150c5      	bres	20677,#0
2208                     ; 625 }
2211  02eb 81            	ret
2364                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2364                     ; 635 {
2365                     	switch	.text
2366  02ec               _CLK_GetFlagStatus:
2368  02ec 89            	pushw	x
2369  02ed 5203          	subw	sp,#3
2370       00000003      OFST:	set	3
2373                     ; 636   uint16_t statusreg = 0;
2375                     ; 637   uint8_t tmpreg = 0;
2377                     ; 638   FlagStatus bitstatus = RESET;
2379                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2381                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2383  02ef 01            	rrwa	x,a
2384  02f0 9f            	ld	a,xl
2385  02f1 a4ff          	and	a,#255
2386  02f3 97            	ld	xl,a
2387  02f4 4f            	clr	a
2388  02f5 02            	rlwa	x,a
2389  02f6 1f01          	ldw	(OFST-2,sp),x
2390  02f8 01            	rrwa	x,a
2391                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2393  02f9 1e01          	ldw	x,(OFST-2,sp)
2394  02fb a30100        	cpw	x,#256
2395  02fe 2607          	jrne	L1421
2396                     ; 649     tmpreg = CLK->ICKR;
2398  0300 c650c0        	ld	a,20672
2399  0303 6b03          	ld	(OFST+0,sp),a
2401  0305 202f          	jra	L3421
2402  0307               L1421:
2403                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2405  0307 1e01          	ldw	x,(OFST-2,sp)
2406  0309 a30200        	cpw	x,#512
2407  030c 2607          	jrne	L5421
2408                     ; 653     tmpreg = CLK->ECKR;
2410  030e c650c1        	ld	a,20673
2411  0311 6b03          	ld	(OFST+0,sp),a
2413  0313 2021          	jra	L3421
2414  0315               L5421:
2415                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2417  0315 1e01          	ldw	x,(OFST-2,sp)
2418  0317 a30300        	cpw	x,#768
2419  031a 2607          	jrne	L1521
2420                     ; 657     tmpreg = CLK->SWCR;
2422  031c c650c5        	ld	a,20677
2423  031f 6b03          	ld	(OFST+0,sp),a
2425  0321 2013          	jra	L3421
2426  0323               L1521:
2427                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2429  0323 1e01          	ldw	x,(OFST-2,sp)
2430  0325 a30400        	cpw	x,#1024
2431  0328 2607          	jrne	L5521
2432                     ; 661     tmpreg = CLK->CSSR;
2434  032a c650c8        	ld	a,20680
2435  032d 6b03          	ld	(OFST+0,sp),a
2437  032f 2005          	jra	L3421
2438  0331               L5521:
2439                     ; 665     tmpreg = CLK->CCOR;
2441  0331 c650c9        	ld	a,20681
2442  0334 6b03          	ld	(OFST+0,sp),a
2443  0336               L3421:
2444                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2446  0336 7b05          	ld	a,(OFST+2,sp)
2447  0338 1503          	bcp	a,(OFST+0,sp)
2448  033a 2706          	jreq	L1621
2449                     ; 670     bitstatus = SET;
2451  033c a601          	ld	a,#1
2452  033e 6b03          	ld	(OFST+0,sp),a
2454  0340 2002          	jra	L3621
2455  0342               L1621:
2456                     ; 674     bitstatus = RESET;
2458  0342 0f03          	clr	(OFST+0,sp)
2459  0344               L3621:
2460                     ; 678   return((FlagStatus)bitstatus);
2462  0344 7b03          	ld	a,(OFST+0,sp)
2465  0346 5b05          	addw	sp,#5
2466  0348 81            	ret
2512                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2512                     ; 688 {
2513                     	switch	.text
2514  0349               _CLK_GetITStatus:
2516  0349 88            	push	a
2517  034a 88            	push	a
2518       00000001      OFST:	set	1
2521                     ; 689   ITStatus bitstatus = RESET;
2523                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2525                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2527  034b a11c          	cp	a,#28
2528  034d 2611          	jrne	L7031
2529                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2531  034f c450c5        	and	a,20677
2532  0352 a10c          	cp	a,#12
2533  0354 2606          	jrne	L1131
2534                     ; 699       bitstatus = SET;
2536  0356 a601          	ld	a,#1
2537  0358 6b01          	ld	(OFST+0,sp),a
2539  035a 2015          	jra	L5131
2540  035c               L1131:
2541                     ; 703       bitstatus = RESET;
2543  035c 0f01          	clr	(OFST+0,sp)
2544  035e 2011          	jra	L5131
2545  0360               L7031:
2546                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2548  0360 c650c8        	ld	a,20680
2549  0363 1402          	and	a,(OFST+1,sp)
2550  0365 a10c          	cp	a,#12
2551  0367 2606          	jrne	L7131
2552                     ; 711       bitstatus = SET;
2554  0369 a601          	ld	a,#1
2555  036b 6b01          	ld	(OFST+0,sp),a
2557  036d 2002          	jra	L5131
2558  036f               L7131:
2559                     ; 715       bitstatus = RESET;
2561  036f 0f01          	clr	(OFST+0,sp)
2562  0371               L5131:
2563                     ; 720   return bitstatus;
2565  0371 7b01          	ld	a,(OFST+0,sp)
2568  0373 85            	popw	x
2569  0374 81            	ret
2605                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2605                     ; 730 {
2606                     	switch	.text
2607  0375               _CLK_ClearITPendingBit:
2611                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2613                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2615  0375 a10c          	cp	a,#12
2616  0377 2606          	jrne	L1431
2617                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2619  0379 721750c8      	bres	20680,#3
2621  037d 2004          	jra	L3431
2622  037f               L1431:
2623                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2625  037f 721750c5      	bres	20677,#3
2626  0383               L3431:
2627                     ; 745 }
2630  0383 81            	ret
2665                     	xdef	_CLKPrescTable
2666                     	xdef	_HSIDivFactor
2667                     	xdef	_CLK_ClearITPendingBit
2668                     	xdef	_CLK_GetITStatus
2669                     	xdef	_CLK_GetFlagStatus
2670                     	xdef	_CLK_GetSYSCLKSource
2671                     	xdef	_CLK_GetClockFreq
2672                     	xdef	_CLK_AdjustHSICalibrationValue
2673                     	xdef	_CLK_SYSCLKEmergencyClear
2674                     	xdef	_CLK_ClockSecuritySystemEnable
2675                     	xdef	_CLK_SWIMConfig
2676                     	xdef	_CLK_SYSCLKConfig
2677                     	xdef	_CLK_ITConfig
2678                     	xdef	_CLK_CCOConfig
2679                     	xdef	_CLK_HSIPrescalerConfig
2680                     	xdef	_CLK_ClockSwitchConfig
2681                     	xdef	_CLK_PeripheralClockConfig
2682                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2683                     	xdef	_CLK_FastHaltWakeUpCmd
2684                     	xdef	_CLK_ClockSwitchCmd
2685                     	xdef	_CLK_CCOCmd
2686                     	xdef	_CLK_LSICmd
2687                     	xdef	_CLK_HSICmd
2688                     	xdef	_CLK_HSECmd
2689                     	xdef	_CLK_DeInit
2690                     	xref.b	c_lreg
2691                     	xref.b	c_x
2710                     	xref	c_ltor
2711                     	xref	c_ludv
2712                     	xref	c_rtol
2713                     	end
