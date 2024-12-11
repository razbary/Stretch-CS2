# Stretch-CS2

* Tired of slow alt-tabbing when playing with a stretched resolution in Counter Strike? This AHK Script solves that problem completely!*

This is an AutoHotkey (AHK) script that allows users to:
- Input custom screen resolution settings (width and height).
- Browse and select the path to cs2.exe (Counter-Strike 2).
- Automatically change the screen resolution before launching the game.
- Restore the original resolution after the game is closed.

# Prerequisites
To use this script, you need to have AutoHotkey installed on your computer.

Adjust the scaling settings in your GPU control panel.
For Nvidia Users (Nvidia Control Panel):

- Open Nvidia Control Panel:
   - Right-click on your desktop and select NVIDIA Control Panel from the context menu.
- Adjust Desktop Size and Position:
   - In the Nvidia Control Panel, navigate to Display > Adjust desktop size and position.
   - Select Full-screen under the Scaling section.
   - Check the box labeled Override the scaling mode set by games and programs.
   - Click Apply to save your changes.
- Stretch Scaling:
   - Select Full-screen scaling mode to ensure the resolution is stretched across the screen as per your settings.
   - Click OK.

- For AMD Users (AMD Radeon Settings):
- Open AMD Radeon Settings:
   - Right-click on your desktop and select AMD Radeon Settings (or AMD Catalyst Control Center, depending on your version).
- Navigate to Display Settings:
   - Click on the Display tab in the AMD Radeon Settings window.
- Set Scaling Mode:
   - Scroll down to the Scaling Mode section.
   - Select Full Panel or Maintain Aspect Ratio.
   - If the game resolution does not fit properly, select Full Panel to stretch the image to fit the entire screen.
- Save Changes:
   - Click Apply to confirm your settings.

Set Counter Strike to fullscreen-windowed if you want to alt-tab even faster.

# Installing AHK
- Go to the official AutoHotkey website: https://www.autohotkey.com/.
- Download the latest version of AutoHotkey.
- Run the installer and follow the installation instructions.

# Running the Script:
- Double-click the .ahk script to run it.

# Script Features
- You manually set the screen width and height that will be applied before the game starts.
- Browse for cs2.exe: The script allows you to browse and select the cs2.exe executable.
- Resolution Restoration: Once the game (cs2.exe) is closed, the script automatically restores your original screen resolution.

# Troubleshooting
- "Invalid cs2.exe Path" Error
  - If you encounter an "Invalid cs2.exe path" error, make sure you:
    - Browse to the correct path where cs2.exe is located.
    - Double-check that you've selected the correct executable.

- Screen Resolution Not Changing
  - Ensure that the resolution you've entered is valid for your monitor.
  - Verify that your graphics card supports the resolution you're trying to apply.
  - Check if any other programs or games are preventing the resolution change (some applications lock the screen resolution while they are running).
