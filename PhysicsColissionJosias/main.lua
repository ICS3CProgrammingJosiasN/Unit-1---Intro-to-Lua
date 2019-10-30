-- Title: PhysicsAndCollisions
-- Name: Josias
-- Course: ICS3C
-- This program...

--------------------------------------------------------------------------------------------------------------------------------------
--Local Variables
--------------------------------------------------------------------------------------------------------------------------------------
local physics = require("physics")
local ground
local bkg 
local ball1
local ball2 
local beam

--------------------------------------------------------------------------------------------------------------------------------------
-- Funtion Calls 
--------------------------------------------------------------------------------------------------------------------------------------
-- start physics 
physics.start()

--------------------------------------------------------------------------------------------------------------------------------------
--Objects
--------------------------------------------------------------------------------------------------------------------------------------

--Ground
ground = display.newImage("Images/ground.png", 0, 0)
ground.x = display.contentWidth/2
ground.y = display.contentHeight/1

-- change the width to be the same as the screen
ground.width = display.contentWidth

-- add to physics 
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

beam = display.newImage("Images/beam.png", 0, 0)
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65
beam.x = display.contentWidth/10
beam.y = display.contentHeight/1.3
beam.xScale =  3
beam.yScale =  3

-- rotate the beam -60 degrees so its on an angle 
beam:rotate(-45)

-- send it to the back layer
beam:toBack()

-- add to physics
physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

bkg = display.newImage("Images/bkg.png", 0, 0)

-- set the x and y pos 
bkg.x = display.contentCenterX
bkg.y = display.contentCenterY

bkg.xScale =  2
bkg.yScale =  2

-- send to back 
bkg:toBack()

--------------------------------------------------------------------------------------------------------------------------------------
--functions
--------------------------------------------------------------------------------------------------------------------------------------

-- create the first ball
local function firstBall()

	-- creating first ball 
	ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})

	ball1.xScale = 3
	ball1.yScale = 3
end

----------------------------------------------------------------------------------------------------------------------------------------

local function secondBall()
	ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- adding to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})

	ball2.xScale = 1.5
	ball2.yScale = 1.5
end 

-------------------------------------------------------------------------------------------------------------------------------------------
-- Timee=r delays - call each function after the given millisecond 
-------------------------------------------------------------------------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)	