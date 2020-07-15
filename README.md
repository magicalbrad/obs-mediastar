# OBS Studio/MediaStar Pro Integration
Adds additional hotkey support to facilitate controlling OBS Studio with MediaStar Pro show control remote control. Currently it doesn't do much, only adding support for two new hotkeys. I may add additional functionality later. Who knows?

As this simply adds additional hotkey support, this script should work with most any remote, or directly from the keyboard.

It adds the following hotkeys:
  * **next scene** - Advances to next scene. Does nothing if the last scene is currently active.
  * **previous scene** - Goes back to previous scene. Does nothing if the first scene is currently active.
 
To use, simply download the mediastar.lua script to your computer. ([Download Zip File](https://github.com/magicalbrad/obs-mediastar/archive/master.zip)) Load it into OBS Studio from the Tools->Scripts menu. Once loaded, the new hotkey options should appear in the Hotkeys area of the OBS settings.
  
## MediaStar Pro Usage
OBS works well with the standard MediaStar profile, as all the keypresses map to function keys.

The easiest way to set the hotkeys is to open the hotkey settings, place the cursor in the appropriate hotkey field, and hit the desired remote button.

## Notes
I am not affiliated with either OBS Studio or MediaStar Pro. I'm merely a user who wanted the two to work together better for my purposes. I'm making it available for anyone else who wants to use as well. So, if your needs happen to align with mine, enjoy!

I am a programmer, but this is my first time working with the Lua language. Also this is my first attempt at an OBS Studio script. So forgive any newbie errors. (Remember what you paid for this little script!)

If you find problems or have suggestions, feel free to open an issue. No guarantee I'll do anytthing, but you never know.
