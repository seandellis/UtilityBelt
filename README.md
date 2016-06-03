# UtilityBelt

A collection of scripts and tools I've written to make it easier to get things done.

![](https://d262ilb51hltx0.cloudfront.net/max/800/1*qqAMQF2vTAs0qKaCYboW1g.jpeg)
*My utility belt. Shark repellent spray not included.*

----

# Open Latest Screenshot

#### The Problem
When doing UI design, I often need to capture screenshots from the iOS Simulator and open them in Photoshop to check spacing and ensure everything is aligned to a whole pixel.
Instead of hunting for your screenshots and dragging them into Photoshop, save yourself time by pairing this script with [FastScripts](https://red-sweater.com/fastscripts/) or [Keyboard Maestro](http://keyboardmaestro.com).

#### What does it do?

Opens all screenshots created in the last minute or the latest screenshot in Photoshop.

#### How does it work?

This script searches your Desktop for files that start with *Screen Shot* or within the Screenshots folder inside Dropbox for files starting with *Screenshot*. If you’ve changed their destination folder you’ll need to adjust the script.

Download [Open Latest Screenshot](https://raw.githubusercontent.com/seandellis/UtilityBelt/master/Applications/Photoshop/Open%20Latest%20Screenshot.applescript) *(right click and Save As…)*

### Setting up FastScripts

1.  Download [FastScripts](https://red-sweater.com/fastscripts/) and copy it to your Applications folder.
1.  Open FastScripts.
1.  Open the Finder.
1.  Select Go → Go to Folder…
1.  Type or paste the following into the dialog: */Library/Scripts*  This will open a Finder window with your Scripts folder.
1.  If you don’t have one, create a new folder named Applications.
1.  Create a folder named Photoshop. If you’re using Photoshop CC or above you’ll need to name it Photoshop CC.
1.  Download [Open Latest Screenshot](https://raw.githubusercontent.com/seandellis/UtilityBelt/master/Applications/Photoshop/Open%20Latest%20Screenshot.applescript) and copy it to the Photoshop folder.
1.  Open Photoshop.
1.  *Open Latest Screenshot* should now appear in the FastScripts menu.  
**Tip***: If you hold down the command key when selecting it you can assign a keyboard shortcut. I recommend control + O.*

***** 
*Photo credits: *Batman’s Utility Belt by [Michael Crawford](http://www.mwctoys.com/REVIEW_123013a.htm). Caricature by [@levitzo](https://twitter.com/levitzo).

