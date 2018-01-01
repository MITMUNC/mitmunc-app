-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"


-- event listeners for tab buttons:
local function onHome( event )
	composer.gotoScene( "home" )
end

local function onSchedule( event )
	composer.gotoScene( "schedule" )
end

local function onCommittees( event )
	composer.gotoScene( "committees" )
end

local function onMap( event )
	composer.gotoScene( "map" )
end

local function onMerchandise( event )
	composer.gotoScene( "merchandise" )
end

-- create a tabBar widget with two buttons at the bottom of the screen

-- table to setup buttons
local tabButtons = {
	{ label="Home", defaultFile="home.png", overFile="home-down.png", width = 32, height = 32, onPress=onHome, selected=true },
	{ label="Schedule", defaultFile="button1.png", overFile="button1-down.png", width = 32, height = 32, onPress=onSchedule },
	{ label="Committees", defaultFile="button1.png", overFile="button1-down.png", width = 32, height = 32, onPress=onCommittees },
	{ label="Map", defaultFile="pin.png", overFile="pin-down.png", width = 32, height = 32, onPress=onMap },
	{ label="Merchandise", defaultFile="button1.png", overFile="button1-down.png", width = 32, height = 32, onPress=onMerchandise },
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar{
	top = display.contentHeight - 50,	-- 50 is default height for tabBar widget
	buttons = tabButtons
}


onCommittees()	-- invoke home tab button's onPress event manually
