-- Title: NumericTextFields
-- Name: Josias
-- Course: ICS3C
-- This program displays a math question and asks the user to answer in a numeric textfield 
-- terminal if the user gets the answer right it say correct! and ask the user another question 
-- if not it says incorrect! and asks the user another question 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 124/255, 249/255, 199/255)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- create local variables 
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local points = 0

-- variables for the timer
local totalSeconds = 15
local secondsLeft = 15
local clockText
local countDownTimer

local lives = 4
local heart1
local heart2
local heart3
local heart4

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in the next text object
	questionObject.text = randomNumber1 .. "+" .. randomNumber2
	
	correctAnswer = randomNumber1 - randomNumber2

	-- create question in the next text object
	questionObject.text = randomNumber1 .. "-" .. randomNumber2	

	correctAnswer = randomNumber1 * randomNumber2

	-- create question in the next text object
	questionObject.text = randomNumber1 .. "x" .. randomNumber2	

	correctAnswer = randomNumber1 / randomNumber2

	-- create question in the next text object
	questionObject.text = randomNumber1 .. "÷" .. randomNumber2

end	

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function Hideincorrect()
    incorrectObject.isVisible = false
    AskQuestion()
end    

local function NumericFieldListener( event )

     -- User begins editing "numericfield"
    if ( event.phase == "began" ) then 

        --clear the text field 
        event.target.text = ""

    elseif (event.phase == "submitted") then 

         -- when the answer is sumbmitted (enter key is pressed) set the user input to user's answer
         userAnswer = tonumber(event.target.text)
         print ("*****testing")

         --if the users answer and the correct answer are the same :
        if (userAnswer == correctAnswer) then
         	
            print ("*****testing")
         	correctObject.isVisible = true
         	timer.performWithDelay(2000, HideCorrect)
            
            -- give a point if user gets the correct answer
            points = points + 1

            -- update it in the display object
            pointsText.text = "Points = " .. points 

        else
          lives = lives - 1
          print ("*****testing")
          incorrectObject.isVisible = true 
          timer.performWithDelay(2000, Hideincorrect)

            if (lives == 3) then
              	heart4.isVisible = false
             
            elseif (lives == 2) then
				heart3.isVisible = false

		    elseif (lives == 1) then
			 	heart2.isVisible = false

		    elseif (lives == 0) then 
				heart1.isVisible = false 
		 	end 
		  
                




         end

     end
     
end

local function UpdateTime()
	-- decrement the number of sceonds 
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object 
	clockText.text = "Time Left = " .. secondsleft .. ""

	if (secondsleft == 0 ) then 
		-- reset the number of seconds left 
		secondsLeft = totalSeconds
		lives = lives - 1

		-- *** IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND, AND SHOW A YOU LOSE IIMAGE
		-- AND CANCEL THE TIMER REMOVE THE THIRD HEART BY MAKING IT INVISIBLE 
		if (lives == 3) then
			heart4.isVisible = false

		elseif (lives == 2) then
			heart2.isVisible = false

		elseif (lives == 1) then 
			heart1.isVisible = false 
		end 
		
		-- *** CALL THE FUNCTION TO ASK A NEW QUESTION
	end
end

-- function that calls the timer 
local function StartTimer()
	-- create a countdown timer that loops infinitely 
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end	





-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--OBJECT CREATION
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(155/255, 42/255, 198/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject.isVisible = false

-- Create the incorrect text object and make it visible
incorrectObject = display.newText( "incorrect", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "default"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

-- display the amount of points as text object
pointsText = display.newText("Points = " .. points, display.contentWidth/3, display.contentHeight/3, nil,50)

-- create the lives to display ont the screen 
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth  * 7/8
heart1.y = display.contentHeight * 1/7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6/8
heart2.y = display.contentHeight * 1/7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 3.5/5.5
heart3.y = display.contentHeight * 1/7

heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 1.5/2.9
heart4.y = display.contentHeight * 1/7

clockText = display.newText("Time Left= " .. secondsLeft, display.contentWidth*1/8, display.contentHeight*1/7, nil, 50)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()         