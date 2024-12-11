#Persistent
#SingleInstance force
SetTitleMatchMode, 2
DetectHiddenWindows, On

; Function to get current screen resolution
GetCurrentResolution() {
    VarSetCapacity(Device_Mode, 156, 0)
    NumPut(156, Device_Mode, 36)
    DllCall("EnumDisplaySettingsA", UInt, 0, UInt, -1, UInt, &Device_Mode)
    Width := NumGet(Device_Mode, 108, "UInt")
    Height := NumGet(Device_Mode, 112, "UInt")
    ColorDepth := NumGet(Device_Mode, 104, "UInt")
    return {Width: Width, Height: Height, ColorDepth: ColorDepth}
}

; Function to change resolution
ChangeResolution(Screen_Width, Screen_Height, Color_Depth) {
    VarSetCapacity(Device_Mode, 156, 0)
    NumPut(156, Device_Mode, 36)
    DllCall("EnumDisplaySettingsA", UInt, 0, UInt, -1, UInt, &Device_Mode)
    NumPut(0x5c0000, Device_Mode, 40)
    NumPut(Color_Depth, Device_Mode, 104)
    NumPut(Screen_Width, Device_Mode, 108)
    NumPut(Screen_Height, Device_Mode, 112)
    Return DllCall("ChangeDisplaySettingsA", UInt, &Device_Mode, UInt, 0)
}

; Create GUI for resolution input
Gui, Add, Text,, Enter the width for the edited resolution:
Gui, Add, Edit, vEditedWidth
Gui, Add, Text,, Enter the height for the edited resolution:
Gui, Add, Edit, vEditedHeight
Gui, Add, Button, default, OK

; Browse button to select the cs2.exe file
Gui, Add, Button, gBrowse, Browse for cs2.exe
Gui, Add, Text,, Selected Path:
Gui, Add, Edit, vAppPath, ; Default path is empty
Gui, Show,, Resolution Input
Return

; When the OK button is clicked
ButtonOK:
Gui, Submit
if (EditedWidth = "" || EditedHeight = "") {
    MsgBox, Please enter valid values for both width and height. Exiting script.
    ExitApp
}

; Construct edited resolution
NormalResolution := GetCurrentResolution()
EditedResolution := {Width: EditedWidth, Height: EditedHeight, ColorDepth: NormalResolution.ColorDepth}

; Change resolution before opening CS2
ChangeResolution(EditedResolution.Width, EditedResolution.Height, EditedResolution.ColorDepth)

; Check if user selected a valid path for cs2.exe
if (AppPath = "" || !FileExist(AppPath)) {
    MsgBox, Invalid cs2.exe path. Exiting script.
    ExitApp
}

; Launch the game
Run, %AppPath%

; Wait for game to exit and restore resolution
Loop {
    Process, Exist, cs2.exe
    if (!ErrorLevel) {
        ChangeResolution(NormalResolution.Width, NormalResolution.Height, NormalResolution.ColorDepth)
        break
    }
    Sleep, 1000
}

Return

; Browse button function
Browse:
FileSelectFile, AppPath, 3, C:\Program Files (x86)\Steam\steamapps\common, Select cs2.exe, Executable Files (*.exe)
if (AppPath != "") {
    GuiControl,, AppPath, %AppPath%
}
Return
