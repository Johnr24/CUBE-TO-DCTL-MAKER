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
FileDelete %Folder21%\mega.dctl
Loop,  %Folder21%\*.cube,  , 1
{
SplitPath, A_LoopFileName, , , , trimmedname, 
FileRead, lutcontents, %A_LoopFileDir%/%A_LoopFileName%
FileRead, topofcontent_p1, %A_ScriptDir%/first_half_of_file_part_1.dctl
FileRead, topofcontent_p2, %A_ScriptDir%/first_half_of_file_part_2.dctl
FileRead, bottom_p1, %A_ScriptDir%/bottom_name_embeded_part_1.dctl
FileAppend,%topofcontent_p1%%trimmedname%%topofcontent_p2%%lutcontents%%bottom_p1%, %A_LoopFileDir%/mega.dctl
}

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
FileAppend, %UIdefineP1%%UIlutvar%%UIdefineP2%%UIlutname%%UIdefineP3%,  %Folder21%\mega.dctl
FileRead, DR_p1, device_run_p1.dctl
FileAppend, %DR_p1%, %Folder21%\mega.dctl


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
FileDelete %Folder21%\ifstatements.dctl
FileDelete %Folder21%\UI_DEFINE.dctl
FileDelete %Folder21%\filenames_var.dctl
FileDelete %Folder21%\filenames.dctl
ExitApp