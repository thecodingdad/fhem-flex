# fhem-flex
Flex style for FHEMWEB

## Features

* Scales for each display size (min width: 350px)
* Devices/Readings/Attributes arrange automatically (as reasonably as possible)
* Sliders, Selects, Inputs, Plots scale automatically (as reasonably as possible)
* Menu is hideable. Default behaviour: menu will be shown if device-width is >800px, otherwise it will be hidden.
* Additional menu icon-buttons for reboot, update, update check, reread Icons, reload myUtils, save and (if possible) save check. The buttons can be hidden if desired.
* Menu and main content can be scrolled independently of each other
* Colors can be freely defined using a simple scheme (6 colors) or a detailed scheme (43 colors). There are three default presets: bright, dark and fhem. Additionally, you can save your own presets.
* Settings will be stored locally as cookies, in order to allow different schemes on different devices. It is also possible to store the settings as an attribute of the current FHEMWEB-device. Hint: color presets will always be stored as an attribute of the current FHEMWEB-device.
* The header (with the commandline) is always fixed at the top and has several (customizable) functionalities:
  - Shows a digital clock
  - Shows the current room/device name
  - Shows information/error messages (like "connection lost")
  - Additional button for raw-code input (thanks to rudolphkoenig)
  - Commandline history will be stored and can be operated in the same way as with a shell (up/down keys). CTRL+ENTER puts the current content in brackets "{}" (thanks to FHEMAN)
  - Devices can be searched by name: from the third character onwards, devices are suggested in a list and can be selected using the up/down keys (thanks to Phill and ThoTo)

## Potential bugs

* Style was tested using chrome/firefox and partially IE
* Probably some FHEM modules produce unstyled HTML output
* Create an issue if you found a bug or write it here: https://forum.fhem.de/index.php/topic,101749.0.html

## Installation

Issue the following commands to install/update via FHEMs update mechanism

### add repository

`update add https://raw.githubusercontent.com/nagel86/fhem-flex/master/controls_fhem-flex.txt`

### trigger update

`update all https://raw.githubusercontent.com/nagel86/fhem-flex/master/controls_fhem-flex.txt`
