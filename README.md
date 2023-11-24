# ahk-scripts

A collection of productivity boosting AutoHotkey scripts for Windows power users.


## 📌 Table of Contents
- [Components](#components)
	- [App Switcher](#app-switcher)
	- [Dynamic Shortcuts](#dynamic-shortcuts)
	- [Editing Keys](#editing-keys)
	- [App Opener](#app-opener)
	- [Windows Management](#windows-management)
	- [Paste Without Formatting](#paste-without-formatting)
	- [Key Mappings](#key-mappings)
- [Getting Started](#getting-started)
	- [Prerequisites](#prerequisites)
	- [Running](#running)
	- [Enable on Start Up](#enable-on-start-up)
- [Making Changes](#making-changes)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)


## 🚀 Components

### App Switcher

Rapidly switch between open windows of the same app using a single shortcut. Much faster than using the default Windows Task Switcher.

For example using `RAlt + N` will switch between all open Notepad windows in turn with the most recently used Notepad window first. 

Customise the script to add all your favourite applications.

### Dynamic Shortcuts

Are you constantly switching between windows and then having to find the open window again? This script enables you to dynamically assign a shortcut to the currently active window so that you can easily switch back to it with a single shortcut.

Use `RAlt + Shift + {num}` to assign a shortcut to the current active window. Then use `RAlt + {num}` to switch back to that window at anytime.

### Editing Keys

Switches all character keys on the keyboard to become navigational for faster editing without having to move your hands off the home row. For example `J` becomes `Down`, `K` becomes `Up`.

Press `RAlt` to toggle between keyboard modes.

### App Opener

Adds shortcuts to open a new instance of a specified app. For example, set `RAlt + F1` to open a new browser window using a specific profile.

### Windows Management

Adds hotkeys for common Windows management

- `RAlt + Esc`:  Close window
- `RAlt + +`: Maximise window
- `RAlt + -`: Minimise window
- `Right Alt + BackTick`: Move window between monitors

### Paste Without Formatting

When `Ctrl + Shift + V` is pressed the script will paste the current clipboard contents as plain text with all formatting removed.

This functionality has since been added to [Microsoft PowerToys](https://learn.microsoft.com/en-us/windows/powertoys/paste-as-plain-text)

### KeyMappings

A place to add common key mappings.

- `Caps Lock` => `Ctrl`


## ⚙️ Getting Started

### Prerequisites

Auto Hotkey v1.x must be installed. For installation details see their [website](https://www.autohotkey.com) or install via Windows Package Manager.

```PowerShell
winget install -e --id AutoHotkey.AutoHotkey
```


> [!IMPORTANT]
> In order for some of the scripts to [correctly function with UWP app windows](https://www.autohotkey.com/docs/v1/FAQ.htm#uac), you must be running the [UIA version of AutoHotkey.](https://www.autohotkey.com/docs/v1/Program.htm#Installer_uiAccess)
> 
> To run the UIA version:
> - From the installer (`c:\Program Files\AutoHotkey\installer.ahk`).
> - Select modify, 64 bit, then select the option to `Add 'Run with UI Access' to context menus`.

### Running

1. Clone the repository to a local directory.
2. Run `Startup.ahk`.

### Enable on Start Up

1. Create a Windows shortcut to the UIA version of AutoHotkey. Append the path of `Startup.ahk` to the target. The target should look something like:

`"C:\Program Files\AutoHotkey\AutoHotkeyU64_UIA.exe" "C:\MyGitPath\ahk-scripts\Startup.ahk"`

2. Place the shortcut in the `%AppData%\Microsoft\Windows\Start Menu\Programs\Startup` directory.


## 📝 Making Changes  
  
The scripts avoid adding hotkeys to specific applications. To add your favourite apps the following scripts should be modified. See the comments within the scripts for more details.
### App Switcher

1. Add an app group under the `RegisterAppSwitcherGroups` function.
```
GroupAdd, Notepad, ahk_exe notepad.exe ; Notepad
```
2. Add a hotkey
```
RAlt & n:: ActivateAppGroup("Notepad", AppDataLocal . "c:\Windows\System32\notepad.exe")
```

### App Opener

1. Add your hotkey mappings to lunch a new app window to the end of the file.

### Key Mappings

1. Add your hotkey mappings to the end of the file.


## 🎯 Roadmap

- Support v2 of Auto Hotkey.


## 🪄 Contributing

Additions, improvements and feedback are all welcome. 

The general rule is that I've tried to keep the scripts helpful for everyone. So instead of including a script with a hotkey to **my** favourite app, the script should allow setting a hotkey to **any** app.


## ⚖️ Licence

This project is licensed under the [MIT Licence](https://github.com/dattiimo/ahk-scripts/blob/main/LICENSE)


## 🔗 Acknowledgements

- [Auto Hotkey](https://www.autohotkey.com)