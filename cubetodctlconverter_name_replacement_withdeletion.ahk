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

Loop,  %Folder21%\*.cube,  , 1
{
SplitPath, A_LoopFileName, , , , trimmedname, 
FileRead, lutcontents, %A_LoopFileDir%/%A_LoopFileName%
FileRead, topofcontent, %A_ScriptDir%/first_half_of_file.dctl
FileRead, bottomofcontent, %A_ScriptDir%/bottom.dctl
FileAppend,%topofcontent%%lutcontents%%bottomofcontent%, %A_LoopFileDir%/%trimmedname%.dctl
;FileDelete, %A_LoopFileDir%/%A_LoopFileName%
}
ExitApp, 