# Laptop Screen Toggle

A tiny AutoHotkey v2 script that puts a one-click laptop display switch in your Windows system tray. If you use a laptop with an external monitor and only want the built-in screen on occasionally, this replaces the Win+P menu with a single click.

Created for personal use. I don't prefer to keep the laptop screen on all the time while I use my external monitor. I would only turn it on while playing games or other scenarios where I may need more screen space so this is just a little time-saver.

Click the tray icon to switch between “external display only” and “extend”
The icon changes to show whether the laptop screen is currently on or off
Stays in sync if you change displays another way, such as `Win+P` or unplugging the monitor
Optional global hotkey (`Ctrl+Alt+L`)
Uses the Windows `SetDisplayConfig` API directly, so no Win+P flyout appears.

## Setup
1. Install AutoHotkey v2.
2. Keep `laptop-on.ico` and `laptop-off.ico` in the same folder as the script.
3. Run the script, and optionally put a shortcut to it in shell:startup to launch at login.
