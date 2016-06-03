# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
#  Open Latest Screenshot
#  v1.1 / 2015-01-27
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
#  Author: Sean Dellis / 2015
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# Description
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# * Open all Screenshots created in the last minute or the most recent Screenshot.
# * Searches within ~/Desktop for files named "Screen Shot *" or within ~/Dropbox/Screenshots for files named "Screenshot *".
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# Change Log
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# 2016-04-15 / Sean Dellis
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# * Change application call to use "com.adobe.photoshop" to work regardless of Photoshop version
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# 2015-01-27 / Sean Dellis
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# * Add Standardized Header
# * Rearrange functions to run more quickly
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

checkForScreenshots()

on checkForScreenshots()
	
	-- checks for screenshots in ~/Desktop
	set desktopPath to POSIX path of (path to desktop)
	set desktopPath to my trim(desktopPath, -1) -- trims / from end of path to fix extra character
	
	-- finds screenshots created in the last minute
	set latestScreenshots to findLatestFileMatching(desktopPath, "'Screen Shot *'")
	
	if latestScreenshots = false then
		
		-- checks for screenshots in Dropbox screenshots folder
		set userPath to POSIX path of (path to home folder)
		set dropboxScreenshotsPath to (userPath & "Dropbox/Screenshots")
		
		-- finds screenshots created in the last minute
		set latestScreenshots to findLatestFileMatching(dropboxScreenshotsPath, "'Screenshot *'")
		
	end if
	
	if latestScreenshots = false then
		display dialog "I can't find any Screenshots in ~/Desktop or ~/Dropbox/Screenshots."
	else
		openFiles(latestScreenshots)
	end if
	
end checkForScreenshots

on findLatestFileMatching(searchPath, searchTerm)
	-- returns all files that have been created in the last minute or if none match then return the latest file
	
	try
		
		-- finds all files created in the last minute that contain searchTerm
		set latestFiles to "find " & searchPath & " -type f -mmin -1 -maxdepth 1 -iname " & searchTerm
		set latestFileList to do shell script latestFiles
		
		if (count of latestFileList) > 1 then
			
			-- returns all files created in the last minute
			set returnList to split(latestFileList, return)
			return returnList
			
		else
			
			-- finds all files that match the searchTerm
			set allFiles to "find " & searchPath & " -type f -maxdepth 1 -iname " & searchTerm
			set allFileList to do shell script allFiles
			
			-- returns the last file created
			set returnList to split(allFileList, return)
			set returnList to item -1 of returnList
			return returnList as list
			
		end if
		
	on error
		-- no results found
		return false
	end try
	
end findLatestFileMatching

on openFiles(fileList)
	repeat with i in fileList
		tell application id "com.adobe.Photoshop"
			activate
			open alias i
		end tell
	end repeat
end openFiles

to split(someText, delimiter)
	set AppleScript's text item delimiters to delimiter
	set someText to someText's text items
	set AppleScript's text item delimiters to {""} --> restore delimiters to default value
	return someText
end split

on trim(t, n)
	if n > 0 then
		return text (n + 1) thru -1 of t
	else
		return text 1 thru (n - 1) of t
	end if
end trim
