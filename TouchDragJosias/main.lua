-- Title: TouchAndDrag
-- Name: Josias
-- Course: ICS3C
-- This program displays images that react to a person's finger.

-- hide status bar
display.setStatusBar(display.HideStatusbar)

-- local Variables. I am still trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local girl3 = display.newImageRect("Images/girl3.png", 150, 150)
local girl3Width = girl3.width
local girl3Height = girl3.height 

local girl4 = display.newImageRect("Images/girl4.png", 150, 150)
local girl4Width = girl4.width
local girl4Height = girl4.height 

-- my boolean variables to keep track of which object i touched first
local alreadyTouchedYellowGirl = false
local alreadyTouchedBlueGirl = false

-- set the initial x and y position of myImage
girl3.x = 400
girl3.y = 500

girl4.x = 300 
girl4.y = 200

-- Function: girl4Listener 
-- Input: touch listener
-- Output: nonr 
-- Description: when girl4 is touched, move her
local function girl3Listener(touch)
	
	if (touch.phase == "began") then
		if (alreadyTouchedgirl3 == false) then
			alreadyTouchedgirl4 = true
		end
	end

	if (touch.phase == "moved") and (alreadyTouchedgirl4 == true) then
		girl4.x = touch.x
		girl4.y = touch.y
	end
	
	if (touch.phase == "ended") then
	    alreadyTouchedgirl3 = false
	    alreadyTouchedgirl4 = false
	end	
end 

-- add the respective listeners to each object
girl3:addEventListener("touch", girl3Listener)	

-- Function: girl4Listener 
-- Input: touch listener
-- Output: nonr 
-- Description: when girl4 is touched, move her
local function girl4Listener(touch)
	
	if (touch.phase == "began") then
		if (alreadyTouchedgirl4 == false) then
			alreadyTouchedgirl3 = true
		end
	end

	if (touch.phase == "moved") and (alreadyTouchedgirl3 == true) then
		girl3.x = touch.x
		girl3.y = touch.y
	end
	
	if (touch.phase == "ended") then
	    alreadyTouchedgirl4 = false
	    alreadyTouchedgirl3 = false
	end	
end 

-- add the respective listeners to each object
girl4:addEventListener("touch", girl4Listener)	