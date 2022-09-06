#include<regx52.h>

sbit LCD_RS = P2^6;
sbit LCD_EN = P2^7;
sbit LCD_RW = P2^5;	 
#define LCD_DATA P0	 // Khai b�o ch�n data.

void Delay_ms(unsigned int t) //H�m delay
{
	unsigned int x, y ;
	for(x=0;x<t;x++)
	{
	 for(y = 0; y<120;y++)
	}
}

void Lcd_cmd(unsigned char cmd)	  //H�m g?i l?nh ra LCD

{ 

   LCD_RW =0;// Ch?n ch? d? ghi
   LCD_RS =0;// Ch?n ch? d? ghi l?nh
   LCD_DATA =cmd;// cmd l� l?nh c?n g?i ra m�n h�nh
   LCD_EN = 0; 						  
   LCD_EN =1;
   if(cmd<=0x02){
   Delay_ms(2);
   }
   else{
   Delay_ms(1);}

}
void Lcd_Char_Cp(char c)//H�m hi?n th? 1 k� t? t?i v? tr� con tr?
{
   LCD_RW =0;
   LCD_RS =1; //Ch?n ch? d? g?i d? li?u
   LCD_DATA =c;	 //K� t? c?n g?i ra m�n h�nh
   LCD_EN = 0;
   LCD_EN =1;
   Delay_ms(1);

}
void Lcd_Out_Cp(char *str)// H�m g?i chu?i k� t? t?i v? tr� con tr?

{

unsigned char i=0;
while(str[i]!=0)  //G?i t?ng k� t? c?a chu?i d?n khi g?p k� t? null
{
	 Lcd_Char_Cp(str[i]);
	 i++;
}

}


void Lcd_Out(unsigned char row, unsigned char col, char *str)		//H�m Di chuy?n v? tr� con tr? d?n v? tr� b?t k� v� in chu?i ra m�n h�nh
{
 	unsigned char cmd;

	// Di chuy?n con tr? d?n v? tr� c?n thi?t
	cmd = (row==1?0x80:0xC0) + col - 1;
	Lcd_cmd(cmd);
	Lcd_Out_Cp(str);

}


void Lcd_Init() //H�m kh?i t?o LCD
{

 Lcd_cmd(0x30);
 Delay_ms(5);
 Lcd_cmd(0x30);
 Delay_ms(1);
 Lcd_cmd(0x30);
 Lcd_cmd(0x38);	  // S? d�ng hi?n th? l� 2, c? ch? 5x8
 Lcd_cmd(0x01);	  // x�a m�n h�nh
 Lcd_cmd(0x0C);	  //B?t hi?n th? v� t?t con tr? c�c b?n c� th? d�ng l?nh 0xE0 d? b?t hi?n th? v� b?t con tr?



}


main()

{
 
Lcd_Init();
Lcd_Out(1,4,"Dien Tu 3M")	;   //In d�ng "Dien Tu 3M" ra h�ng 1 v� c?t 4 tr�n m�n h�nh
Lcd_Out(2,3,"Chotroihn.Vn")	;  //In d�ng "Chotroihn.vn" ra h�ng 2 v� c?t 3 tr�n m�n h�nh
while(1)
{
}
}