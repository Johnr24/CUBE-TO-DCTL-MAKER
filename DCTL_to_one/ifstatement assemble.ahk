#SingleInstance, Force
#KeyHistory, 0
SetBatchLines, -1
ListLines, Off
SendMode Input ; Forces Send and SendRaw to use SendInput buffering for speed.
SetTitleMatchMode, 3 ; A window's title must exactly match WinTitle to be a match.
SetWorkingDir, %A_ScriptDir%
SplitPath, A_ScriptName, , , , thisscriptname
#MaxThreadsPerHotkey, 1 ; no re-entrant hotkey handling
; DetectHiddenWindows, On
; SetWinDelay, -1 ; Remove short delay done automatically after every windowing command except IfWinActive and IfWinExist
; SetKeyDelay, -1, -1 ; Remove short delay done automatically after every keystroke sent by Send or ControlSend
; SetMouseDelay, -1 ; Remove short delay done automatically after Click and MouseMove/Click/Drag

FileSelectFolder, Folder21 , ;C:\ProgramData\Blackmagic Design\DaVinci Resolve\Support\LUT
FileDelete %Folder21%\ifstatements.dctl

Loop,  %Folder21%\*.cube,  , 1
{
    If (A_Index > 1)
    {
        Goto, elseloop
    }
    Else
    SplitPath, A_LoopFileName, , , , trimmedname,
    trimednamevar = %trimmedname%_var 
    reser = %trimmedname%_res
    FileRead, ifstatement_p1, ifstatement_p1.dctl
    FileRead, ifstatement_p2, ifstatement_p2.dctl
    FileRead, ifstatement_p3, ifstatement_p3.dctl
    FileRead, ifstatement_p4, ifstatement_p4.dctl
    FileRead, ifstatement_p5, ifstatement_p5.dctl
    FileAppend,%ifstatement_p1%%trimednamevar%%ifstatement_p2%%reser%%ifstatement_p3%%trimmedname%%ifstatement_p4%%reser%%ifstatement_p5% , %A_LoopFileDir%/ifstatements.dctl
}

elseloop:
Loop,  %Folder21%\*.cube,  , 1
{
    If (A_Index < 2 )
    {
        continue
    }
    SplitPath, A_LoopFileName, , , , trimmedname, 
    trimednamevar = %trimmedname%_var
    reser = %trimmedname%_res
    FileRead, ifstatement_p1, else_ifstatement_p1.dctl
    FileRead, ifstatement_p2, ifstatement_p2.dctl
    FileRead, ifstatement_p3, ifstatement_p3.dctl
    FileRead, ifstatement_p4, ifstatement_p4.dctl
    FileRead, ifstatement_p5, ifstatement_p5.dctl
    FileAppend,%ifstatement_p1%%trimednamevar%%ifstatement_p2%%reser%%ifstatement_p3%%trimmedname%%ifstatement_p4%%reser%%ifstatement_p5% , %A_LoopFileDir%/ifstatements.dctl
}
FileRead, ifstatement_p6, ifstatement_p6.dctl
FileAppend, %ifstatement_p6%, %Folder21%\ifstatements.dctl
FileRead, ifstatements_file, %Folder21%\ifstatements.dctl
FileAppend, %ifstatements_file%, %Folder21%\mega.dctl

ExitApp