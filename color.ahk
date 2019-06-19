#NoEnv
#MaxThreadsperHotkey 2
#SingleInstance ignore
SendMode Input

^!z::  ; Control+Alt+Z hotkey.
MouseGetPos X, Y
PixelGetColor, OutputVar, X, Y
MsgBox "The color at the current cursor position is %OutputVar% and the mousepos is %X%, %Y%" 
return