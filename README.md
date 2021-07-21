# CUBE 2 DCTL

Written entirely in the 🥰 bodge-y 🥰 language of autohotkey 

This will recursively go through a directory and create a DCTL of it.

it will automatically rename the file to be the same as the `.cube` but with a `.dctl` extension 


## 🚨🚨🚨 WARNING 🚨🚨🚨

If you run the `cubetodctl_withdeletion.ahk\exe` then it will also delete the original .cube file 

# PLEASE BACKUP ANY LUT FOLDERS BEFORE RUNNING THEM ON YOUR SYSTEM

WHEN THE FOLDER DIALOGUE COMES UP YOU MUST SELECT A FOLDER OR THE SCRIPT WILL RECUSIRVELY GO THROUGH THE ENTIRE FOLDER EVEN IF YOU PRESS CANCEL,


# Customise Script
you can change where the scripts default folder is by changing the last part `(the file part)` of this line of code in the script

```
FileSelectFolder, Folder21 , C:\ProgramData\Blackmagic Design\DaVinci Resolve\Support\LUT
```

# LEGAL
As per license.md

For the developers' and authors' protection, the GPL clearly explains
that there is no warranty for this free software.  For both users' and
authors' sake, the GPL requires that modified versions be marked as
changed, so that their problems will not be attributed erroneously to
authors of previous versions.

You run this software at entirely your own risk