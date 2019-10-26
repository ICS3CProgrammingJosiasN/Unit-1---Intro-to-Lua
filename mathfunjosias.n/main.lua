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
local randomNumber3
local randomNumber4
local tempRandomNumber
local userAnswer
local correctAnswer
local correctAnswer1
local randomOperator







--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomOperator = math.random(1, 4)
	randomNumber1 = math.random(1, 10)
	randomNumber2 = math.random(1, 10)
	

	if (randomOperator == 1) then 
		-- calculate the correct answer 
		correctAnswer = randomNumber1 + randomNumber2

		questionObject.text = randomNumber1 .. "+".. randomNumber2 .."="

  	elseif (randomOperator == 2) then 

    	if (randomNumber1 < randomNumber2)then
    		tempRandomNumber = randomNumber1
    		randomNumber1 = randomNumber2
    		randomNumber2 = tempRandomNumber
    	end	
    	
    	correctAnswer = randomNumber1 - randomNumber2

    	questionObject.text = randomNumber1 .. "-".. randomNumber2 .."="

  	elseif (randomOperator == 3) then
    	correctAnswer = randomNumber1 * randomNumber2 
    	
    	questionObject.text = randomNumber1 .. "*".. randomNumber2 .."="

 	elseif (randomOperator == 4) then
    	correctAnswer1 = randomNumber1 * randomNumber2
   	 	correctAnswer = correctAnswer1 / randomNumber1
    	questionObject.text = correctAnswer1 .."/" .. randomNumber1 .. "="	

  	end	

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
      		correctObject.isVisible = true 
        	timer.performWithDelay(2000, HideCorrect)
            -- clear Text 
        	event.target.text = ""


        else incorrectObject.isVisible = true 
        	timer.performWithDelay(2000, HideinCorrect)
			-- clear text 
         	event.target.text = ""
	
		end

    end
     
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






-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()        