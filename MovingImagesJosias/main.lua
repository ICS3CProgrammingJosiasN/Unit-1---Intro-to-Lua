-- Title: MovingObjects
-- Name: Josias.N 
-- Course: ICS3C
-- This program moves a beetleship across the screen and then makes it fade out.

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)


-- local variables
local backgroundSound
local backgroundSoundChannel

-- Sound
local backgroundSound = audio.loadSound( "Sound/bkgMusic.mp3")
local backgroundSoundChannel

-- global variables
scrollSpeed = 3

-- background image with the width and height 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- character image with width and height
local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

-- set the initial x and y position of the beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- set the initial x and y position of the rocketship
rocketship.x = 1000
rocketship.y = display.contentHeight/2

-- make it face the opposite direction
rocketship:scale(-1,1)


-- Function: Moveship
-- Input: this function accepts an event listener
-- Output: none
-- Description:  This fuction adds the scroll speed to the x-value of the ship
local function Moveship(event)
	backgroundSoundChannel = audio.play(backgroundSound)
    -- add the scroll speed to the x-value of the ship
    beetleship.x = beetleship.x + scrollSpeed
    -- change the tansparency of the ship every time it moves so that it fades out 
    beetleship.alpha = beetleship.alpha + 0.01
end 


-- Function: Moverocketship
-- Input: this function accepts an event listener
-- Output: none
-- Description:  This fuction adds the scroll speed to the x-value of the ship
local function Moverocketship(event)
	-- add the scroll speed to the x-value of the ship
	rocketship.x = rocketship.x - scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out 
	rocketship.alpha = rocketship.alpha + 0.01
end	

-- MoveShip will be able over and over again
Runtime:addEventListener("enterFrame", Moveship)

-- MoveRocketShip will be able over and over again
Runtime:addEventListener("enterFrame", Moverocketship)