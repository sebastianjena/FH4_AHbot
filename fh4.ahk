#NoEnv

/*
Car List:
TEST - LEFT, 5, RIGHT, 8
911 '19 - LEFT, 26, RIGHT, 7


*/


;Car Manufacturer
; Enter direction in braces {LEFT OR RIGHT}
MANDIR = {LEFT}
; Enter number of times
MANNUM = 5
 
;Car Model
; Enter direction in braces {LEFT OR RIGHT}
MODELDIR = {RIGHT}
; Enter number of times
MODELNUM = 8

; max money
MONEY = 35


FOUNDCAR = 0
MAYBE = 1


#MaxThreadsperHotkey 2
q::
Loop, 50
{
	Loop
	{ ; be sure we returned to main menu
		PixelGetColor, PixColor, 603, 702
		if (PixColor = "0xFFFFFF")
		{
			Send {Enter}
			Sleep, 30
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
		Sleep, 30
	}
	Loop, %MANNUM%
	{
		Send %MANDIR%
		Sleep, 30
	}

	Send {Down}
	Sleep, 30

	Loop, %MODELNUM%
	{
		Send %MODELDIR%
		Sleep, 30
	}
	Loop, 4
	{
		Send {Down}
		Sleep, 30		
	}
	Loop, %MONEY%
	{
		Send {Right}
		Sleep, 30
	}

	Send {Down}
	Sleep, 30
	Send {Enter}
	Sleep, 30	

	; cars list

	Sleep, 1100
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
				Send {Enter}
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
			PixelGetColor, PixColor, 142, 634
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
			PixelGetColor, PixColor, 1220, 418
			if (PixColor = "0xFFFFFF")
			{
				Sleep, 30
				Send {Enter}
				return
			}
		}		
	}

Sleep, 1750
}