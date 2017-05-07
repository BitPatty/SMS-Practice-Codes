#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdarg.h>
#include <string.h>
#include "inc/sms.h"

/*
	Experimental ingame timer using a textbox to display the current time. 
	
	Will be replaced with the builtin in game timer in the future
*/

J2DTextBox textBox;

static unsigned int start;
unsigned int timerValue;

//Once per frame
void OnDraw2D(J2DOrthoGraph* graphics)
{
	Vector mariopos = **gpMarioPos;

	unsigned int t_min, t_sec, t_msec, t_ticksInMsec;

    //EXT: IGT Flag
	unsigned int *fpTimerState 	= (unsigned int *)0x817F0100;


	/*
        The Wii north bridge is clocked at 243 MHz instead of 162MHz (GCN) which gives us 243MHz/4 = 60.75 MHz for the I/O clock.
		
		Dirty solution but works 99% of the time.
	*/

	t_ticksInMsec = (unsigned int)((double)((unsigned int)(OSGetTime() >> 15) & 0xDFFFFFFF)/(60750.0/32768.0));

	
	//Timer
	
	if ((unsigned int)*fpTimerState == 0) {
		start = t_ticksInMsec;
		*fpTimerState = 1;
	}

	if((unsigned int)*fpTimerState <= 1) timerValue = t_ticksInMsec - start;

	t_min = timerValue / 60000;
	t_sec = (timerValue / 1000) % 60;
	t_msec = timerValue % 1000;

	snprintf(J2DTextBox_GetStringPtr(&textBox),128*sizeof(char*),"TIME: %02d:%02d.%03d",t_min,t_sec,t_msec);

	//Run replaced branch
	J2DGrafContext_Setup2D((J2DGrafContext*)graphics);

	J2DScreen_Draw((J2DScreen*)&textBox, 0, 0, (J2DGrafContext*)graphics, 0x81);
}


//Stage load
void OnSetup(MarDirector* director)
{
 	JUTRect textRect;

	//Run replaced branch
	MarDirector_SetupObjects(director);

	//setup timer box
	char* info;
	info = (char*)malloc(128*sizeof(char*));

	JUTRect_Set(&textRect, 0, 0, 512, 512);
	J2DTextBox_Create(&textBox, 0, &textRect, GameFont, GameStrTable, 2, 0);
	J2DTextBox_SetString(&textBox,info);
}