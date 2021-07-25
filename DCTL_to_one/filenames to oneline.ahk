#SingleInstance, Force
#KeyHistory, 0
SetBatchLines, -1
ListLines, Off
SendMode Input ; Forces Send and SendRaw to use SendInput buffering for speed.
SetTitleMatchMode, 3 ; A window's title must exactly match WinTitle to be a match.
SetWorkingDir, %A_ScriptDir%
#MaxMem 4096 
SplitPath, A_ScriptName, , , , thisscriptname
#MaxThreadsPerHotkey, 8 ; no re-entrant hotkey handling
; DetectHiddenWindows, On
; SetWinDelay, -1 ; Remove short delay done automatically after every windowing command except IfWinActive and IfWinExist
; SetKeyDelay, -1, -1 ; Remove short delay done automatically after every keystroke sent by Send or ControlSend
; SetMouseDelay, -1 ; Remove short delay done automatically after Click and MouseMove/Click/Drag

FileSelectFolder, Folder21 , ;C:\ProgramData\Blackmagic Design\DaVinci Resolve\Support\LUT
FileDelete, %Folder21%/filenames.dctl
FileDelete, %Folder21%/filenames_var.dctl
FileDelete, %Folder21%\UI_DEFINE.dctl

Loop,  %Folder21%\*.cube,  , 1
{
SplitPath, A_LoopFileName, , , , trimmedname, 
trimmedname2 = %trimmedname% ,
trimedname2var = %trimmedname%_var , 
FileAppend, %trimmedname2%, %A_LoopFileDir%/filenames.dctl
FileAppend, %trimedname2var%, %A_LoopFileDir%/filenames_var.dctl
}

FileRead, UIlutname, %Folder21%\filenames.dctl
FileRead, UIlutvar, %Folder21%\filenames_var.dctl
FileRead, UIdefineP1, UI_DEFINE_p1.dctl
FileRead, UIdefineP2, UI_DEFINE_p2.dctl
FileRead, UIdefineP3, UI_DEFINE_p3.dctl
FileAppend, %UIdefineP1%%UIlutvar%%UIdefineP2%%UIlutname%%UIdefineP3%,  %Folder21%\UI_DEFINE.dctl
ExitApp