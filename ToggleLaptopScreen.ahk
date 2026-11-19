#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent

; Put two .ico files next to the script, or edit these paths
IconOn  := A_ScriptDir "\laptop-on.ico"
IconOff := A_ScriptDir "\laptop-off.ico"

LaptopIsOn() => MonitorGetCount() > 1

UpdateIcon(*) {
    on := LaptopIsOn()
    file := on ? IconOn : IconOff
    if FileExist(file)
        TraySetIcon(file)
    else
        TraySetIcon("shell32.dll", on ? 16 : 110)   ; placeholder icons
    A_IconTip := on ? "Laptop screen: ON (click to turn off)"
                    : "Laptop screen: OFF (click to turn on)"
}

Toggle(*) {
    ; 0x80 = SDC_APPLY, 0x8 = external only (laptop off), 0x4 = extend (laptop on)
    flags := 0x80 | (LaptopIsOn() ? 0x8 : 0x4)
    DllCall("User32\SetDisplayConfig", "UInt", 0, "Ptr", 0, "UInt", 0, "Ptr", 0, "UInt", flags)
}

A_TrayMenu.Delete()
A_TrayMenu.Add("Toggle laptop screen", Toggle)
A_TrayMenu.Add("Exit", (*) => ExitApp())
A_TrayMenu.Default := "Toggle laptop screen"
A_TrayMenu.ClickCount := 1

; Refresh the icon whenever Windows changes the display setup,
; including changes made via Win+P or by unplugging the monitor
OnMessage(0x7E, (*) => SetTimer(UpdateIcon, -500))   ; WM_DISPLAYCHANGE

UpdateIcon()

^!l::Toggle()   ; optional hotkey: Ctrl+Alt+L