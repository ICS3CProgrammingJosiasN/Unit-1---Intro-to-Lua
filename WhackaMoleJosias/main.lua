-- Title: WhackAMole
-- Name: Josias
-- Course: ICS3C
-- This program places a random object on the screen. If the user clicks on it in time,
-- the score increases by 1  
-------------------------------------------------------------------Varaibles----------------------------------------------------------------------------------------
-- local variables 
local backgroundImage
local mole
local points = 0
local pointsText 


-----------------------------------------------------------------creating Images--------------------------------------------------------


-- Creating Background
backgroundImage = display.newImageRect("Images/grass background.png", 1304, 769 )
backgroundImage.x = display.contentCenterX
backgroundImage.y = display.contentCenterY

-- Creating and setting position 
mole = display.newImage("Images/mole.png", 0.5, 0.5 ) 
mole.x = display.contentCenterX
mole.y = display.contentCenterY
mole.xScale = 0.3
mole.yScale = 0.3

-- make mole invisible 
mole.isVisible = false 

-- adding points 
-- display the amount of points as a text object 
pointsText = display.newText("Points = " .. points, 512, 100, nil, 50)

-------------------------------------------------------functions-------------------------------------------------------------------------

--this functtion makes the mole appear in a random (x,y) position on the screen
-- before calling the Hide function 
function Popup()

	--- Choosing a Random position on the screen between 0 and the size of the screen 
	mole.x = math.random(0, display.contentWidth)
	mole.y = math.random(0, display.contentHeight)
	mole.isVisible = true
	timer.performWithDelay(800, Hide) 
end 

-- This function calls the PopUp function after 3 seconds
function PopupDelay(  )
	timer.performWithDelay(3000, Popup)
end

-- this function makes the mole invisible and the calls the PopUpDelay function 
function Hide()
	-- Changing Visibility
	mole.isVisible = false 
	PopupDelay()
end 

-- this function starts the game 
function Gamestart()
	PopupDelay()
end 

-- This function increments the score only if the mole is clicked. it then displays the 
-- new score 
function Whacked( event )
	-- If touch phase just started
	if (event.phase == "began") then 
	   points = points + 1 
	   pointsText.text = "Points = " .. points
	end    
end 


---------------------------------------------------Event Listener----------------------------------------------------------------------------------------
-- i add the event Listener to the moles so that if the mole is touched, the Whacked function 
-- is called 
mole:addEventListener( "touch", Whacked )

----------------------------------------------------Start the game--------------------------------------------------------------------------------------------------\\
Gamestart()

