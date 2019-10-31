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
local ball3
local ball4
local beam1
local beam2
local topWall
local rightWall
local leftWall


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

beam1 = display.newImage("Images/beam.png", 0, 0)
beam1.x = display.contentCenterX/5
beam1.y = display.contentCenterY*1.65
beam1.x = display.contentWidth/10
beam1.y = display.contentHeight/1.3
beam1.xScale =  3
beam1.yScale =  3

-- rotate the beam -60 degrees so its on an angle 
beam1:rotate(-45)

-- send it to the back layer
beam1:toBack()

-- add to physics
physics.addBody(beam1, "static", {friction=5, bounce=5})

beam2 = display.newImage("Images/beam.png", 0, 0)
beam2.x = display.contentCenterX/5
beam2.y = display.contentCenterY*1.65
beam2.x = display.contentWidth/1.1
beam2.y = display.contentHeight/1.3
beam2.xScale = 3
beam2.yScale = 3

-- rotate beam2
beam2:rotate(45)

-- send it to the back layer
beam2:toBack()

physics.addBody(beam2, "static", {friction=5, bounce=5})

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
	ball1 = display.newImage("Images/super_ball.png", 1, 1)

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})

	ball1.xScale = 3
	ball1.yScale = 3
end

----------------------------------------------------------------------------------------------------------------------------------------

local function secondBall()
	ball2 = display.newImage("Images/super_ball.png", 100, 1)

	-- adding to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})

	ball2.xScale = 2
	ball2.yScale = 2
end 

local function ThirdBall()
	ball3 = display.newImage("Images/super_ball.png", 100, 1)

	-- adding to physics
	physics.addBody(ball3, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})

	ball3.xScale = 4
	ball3.yScale = 4
end


local function FourthBall()
	ball4 = display.newImage("Images/super_ball.png", 100, 1)

	-- adding to physics
	physics.addBody(ball4, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})

	ball4.xScale = 5
	ball4.yScale = 5
end


topWall = display.newRect(0, 0, display.contentWidth*2, 5)
rightWall = display.newRect(1024, 0, 5, display.contentHeight*2)
leftWall = display.newRect(0, 0,  5, display.contentHeight*2)

physics.addBody(topWall, "static", {density=1.0, friction=0.5})
topWall = display.newRect(0, 0, display.contentWidth*2, 5)
rightWall = display.newRect(1024, 0, 5, display.contentHeight*2)
leftwall = display.newRect(0, 0, 5, display.contentHeight*2)
leftWall = display.newRect(0, 0, 5, display.contentHeight*2)

physics.addBody(topWall, "static", {density=1.0, friction=0.5})
physics.addBody(rightWall, "static", {density=1.0, friction=0.5})
physics.addBody(leftWall, "static", {density=1.0, friction=0.5})

topWall.isVisible = false
rightWall.isVisible = false 
leftWall.isVisible = false
-------------------------------------------------------------------------------------------------------------------------------------------
-- Timee=r delays - call each function after the given millisecond 
-------------------------------------------------------------------------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
timer.performWithDelay(1000, ThirdBall)
timer.performWithDelay(700, FourthBall)	