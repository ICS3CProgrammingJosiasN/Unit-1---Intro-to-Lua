-- Title: HelloWorld
-- Name: Josias N'guessan
-- Course: ICS3C
-- This program displays Hello to the simulator 
-- And to the command terminal

-- print to command terminal
print ("Hello Josias")
print ("This class is AWESOME!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets backgroung colour 
display.setDefault("background",153/255,204/255,255/255)

--make the text object display my name 
textObject= display.newText("hello Josias",400,400, nil, 50)

-- change the text color
textObject:setTextColor(0/255, 0/255, 0/255)

-- displays text on the screen at position x=400 y=400 with
-- a default font style and font size 40
textObject = display.newText("By, Josias Nguessan",500,500,nil, 40)