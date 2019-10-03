-- Title: AreaOfRectangleAndCircle
-- Name: Josias.N 
-- Course: ICS3C
-- This program displays a rectangle and shows its area

-- create my local variable 
local areaText
local textSize = 300
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle 

-- set the background colour of my screen.Remember that colors are between 0 and 1.
display.setDefault("background", 28/255, 123/225, 243/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 10

-- set the colour of the rectangle
myRectangle:setFillColor(0.8, 0.2, 0.3)

myRectangle:setStrokeColor(0, 0, 0)

-- calculate the area 
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with the width of \n" ..
    widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
    areaOfRectangle .. " pixels².", 0, 0, Arial, 40)  

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the color of the newText
areaText:setTextColor(0, 0, 0)