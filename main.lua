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

-- more global variables
local BUTTON_DIMENSION = 32
local TAB_BAR_HEIGHT = 50

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

-- create a tabBar widget

-- table to setup buttons
local tabButtons = {
	{ label="Home", defaultFile="tabbar_1.png", overFile="tabbar_1.png", width = 32, height = 32, onPress=onHome, selected=true },
	{ label="Schedule", defaultFile="tabbar_2.png", overFile="tabbar_2.png", width = 32, height = 32, onPress=onSchedule },
	{ label="Committees", defaultFile="tabbar_3.png", overFile="tabbar_3.png", width = 32, height = 32, onPress=onCommittees },
	{ label="Map", defaultFile="tabbar_4.png", overFile="tabbar_4.png", width = 32, height = 32, onPress=onMap },
	{ label="Merchandise", defaultFile="tabbar_5.png", overFile="tabbar_5.png", width = 32, height = 32, onPress=onMerchandise },
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar{
	top = display.contentHeight - TAB_BAR_HEIGHT,	-- 50 is default height for tabBar widget
	buttons = tabButtons
}
tabBar.height = TAB_BAR_HEIGHT


onHome()	-- invoke home tab button's onPress event manually
