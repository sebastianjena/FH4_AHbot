#NoEnv
/*
Car List:
TEST - LEFT, 5, RIGHT, 8
DONE 911 '19 - LEFT, 26, RIGHT, 7
DONE bone shaker - RIGHT, 44, RIGHT, 1 
DONE x-class - LEFT, 46, LEFT, 1
DONE Golf - LEFT, 5, RIGHT, 9
DONE Chevy ZR2 - RIGHT, 24, RIGHT, 4
DONE Capri FE - RIGHT 34 RIGHT 9
DONE hw mustang - RIGHT, 44, RIGHT, 2 
DONE hw rip rod - RIGHT, 44, LEFT, 2 
DONE 812 - RIGHT 32, LEFT 16
DONE SVT Raptor - RIGHT, 34, LEFT, 11
DONE M3 GTR - RIGHT 17, RIGHT 12
DONE honda prelude - RIGHT 42. LEFT 4
DONE Pontiac GTO '65 - LEFT 27, RIGHT 1'
DONE Chevy 396 '1967' - RIGHT, 24, RIGHT, 2
DONE 599xx - RIGHT 32, LEFT 17
DONE 911 PO - LEFT, 26, RIGHT, 7
DONE 720s PO - LEFT - 48, RIGHT 5
DONE Chevy Camaro PO - RIGHT 24 RIGHT 8
DONE DB11 PO RIGHT 10 RIGHT 2
Nissan GTR PO LEFT 37 RIGHT 7
*/

;Car Manufacturer
; Enter direction in braces {LEFT OR RIGHT}
MANDIR = {RIGHT}
; Enter number of times
MANNUM = 24

 
;Car Model
; Enter direction in braces {LEFT OR RIGHT}
MODELDIR = {RIGHT}
; Enter number of times
MODELNUM = 8

; max money
MONEY = 30
HOWMANY = 1
FOUNDCAR = 0


#MaxThreadsperHotkey 2
q::
Loop, 10000
{
	Loop
	{ ; be sure we returned to main menu
		PixelGetColor, PixColor, 603, 702
		if (PixColor = "0xFFFFFF")
		{
			Send {Enter}
			Sleep, 35 ; 35
			break
		}
	}
	
	; search options

	Loop
	{
		PixelGetColor, PixColor, 659, 391
		if (PixColor = "0x93B700")
		{
			break
		}
	}
	Loop, 6
	{
		Send {Up}
		Sleep, 30 ; 35
	}
	Loop, %MANNUM%
	{
		Send %MANDIR%
		Sleep, 40 ; 40
	}

	Send {Down}
	Sleep, 35 ; 35

	Loop, %MODELNUM%
	{
		Send %MODELDIR%
		Sleep, 35 ; 40
	}
	Loop, 4
	{
		Send {Down}
		Sleep, 30 ; 35		
	}
	Loop, %MONEY%
	{
		Send {Right}
		Sleep, 30 ; 35
	}

	Send {Down}
	Sleep, 30
	Send {Enter}
	Sleep, 30	

	; cars list

	Sleep, 1100 ; 1100
	PixelGetColor, PixColor0, 161, 326
	if (PixColor0 = "0xFFFFFF")
	{
		FOUNDCAR = 1
		Loop
		{
			; click when site loaded
			PixelGetColor, PixColor, 264, 401
			if (PixColor != "0xFFFFFF")
			{
				Send {Y}
				break
			}
		}
	}
	else
	{
		Send {Esc}
		Sleep, 30
	}

	if(FOUNDCAR = 1)
	{
		Loop
		{
			PixelGetColor, PixColor, 974, 559
			if (PixColor = "0xFFFFFF")
			{
				Send {Down}
				Sleep, 30
				Send {Enter}
				Sleep, 30	
				break
			}
		}

		Loop
		{
			PixelGetColor, PixColor, 883, 445
			if (PixColor = "0xFFFFFF")
			{
				Send {Enter}
				break
			}
		}
		
		; check if bought
		Sleep 10000
		Send {Enter}
		Sleep, 5000
		Send {Esc}
		Sleep, 5000
		Send {Enter}
		Sleep, 5000
		Loop
		{
			PixelGetColor, PixColor, 179, 797
			if (PixColor = "0xFFFFFF")
			{
				FOUNDCAR = 0
				HOWMANY--
				Send {Esc}
				Sleep, 2000
				Send {Esc}
				Sleep, 2000
				break
			}
			if(HOWMANY = 0) 
			{
				return
			}
		}				
	}

Sleep, 1000 ; 1800
}