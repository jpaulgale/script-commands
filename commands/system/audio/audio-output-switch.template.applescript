#!/usr/bin/osascript

# How to use this script?
# It's a template which needs further setup. Duplicate the file,
# remove `.template.` from the filename,
# Replace all instances of <Device Name> with the name of your desired audio output device

# @raycast.schemaVersion 1
# @raycast.title Switch Audio to <Device Name>
# @raycast.mode silent

# @raycast.packageName Audio
# @raycast.icon 🔊

# @raycast.author mmerle
# @raycast.authorURL https://github.com/mmerle
# @raycast.description Switch audio output to desired device.

set myDevices to "<Device Name>"

tell application "System Settings"
	activate
	reveal anchor "output" of pane id "com.apple.Sound-Settings.extension"
end tell

delay 3

tell application "System Events"
	tell application process "System Settings"
		set theRows to (every row of table 1 of scroll area 1 of group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Sound")
		repeat with myDevice in myDevices
			set theDevice to myDevice as string
			repeat with aRow in theRows
				if name of first item of static text of group 1 of UI element 1 of aRow is equal to theDevice then
					set selected of aRow to true
					exit repeat
				end if
			end repeat
		end repeat
	end tell
end tell

quit application "System Settings"
do shell script "echo Audio switched to <Device Name>"
