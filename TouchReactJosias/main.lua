-- Title: TouchReact
-- Name: Josias
-- Course: ICS3C
-- This program displays a blue button on the screen when the user clicks on the button
-- it disappears and the red button appears in its place the word clicked in a different colour appears.

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set background colour 
display.setDefault ("background", 153/255, 204/255, 255/255)

local boingSound = audio.loadSound( "Sounds/BoingSoundEffect.mp3" )
local boingSoundChannel

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set its position and make it visible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png",198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisble
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none 
-- Description: when blue button is clicked, it will make the text appear with the red button,
-- and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
        boingSoundChannel = audio.play(boingSound)
    end

    if (touch.phase == "ended") then
    	blueButton.isVisible = true 
    	redButton.isVisible = false
    	textObject.isVisible = false
    end
end
local function RedButtonListener(touch)
    if (touch.phase == "began") then
        blueButton.isVisible = true
        redButton.isVisible = false
        textObject.isVisible = false
    end

    if (touch.phase == "ended") then
        blueButton.isVisible = true 
        redButton.isVisible = false
        textObject.isVisible = false
    end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener) 
redButton:addEventListener("touch", RedButtonListener)
