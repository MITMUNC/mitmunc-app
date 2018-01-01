-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local display = require("display")
local graphics = require("graphics")
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a white background to fill screen
	-- local function fitImage( displayObject, fitWidth, fitHeight, enlarge )
	-- --
	-- -- first determine which edge is out of bounds
	-- --
	-- 	local scaleFactor = fitHeight / displayObject.height 
	-- 	local newWidth = displayObject.width * scaleFactor
	-- 	if newWidth &gt; fitWidth then
	-- 		scaleFactor = fitWidth / displayObject.width 
	-- 	end
	-- 	if not enlarge and scaleFactor > 1 then
	-- 		return
	-- 	end
	-- 	displayObject:scale( scaleFactor, scaleFactor )
	-- end

	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor( 1 )	-- white
	
	-- create some text
	local title = display.newText( "MITMUNC X", display.contentCenterX, 50, native.systemFont, 32 )
	title:setFillColor( 0 )	-- black
	
	local newTextParams = { text = "February 9 - 11, 2018 \n MIT", 
						x = display.contentCenterX, 
						y = title.y + 175, 
						width = 310, height = 310, 
						font = native.systemFont, fontSize = 14, 
						align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 0 ) -- black

	-- local options = 
	-- {
	-- 	width = 70,
 --    	height = 41, 
 --    	numFrames = 2
	-- }
	-- local imageSheet = graphics.newImageSheet("mitmuncLogo2017.png", options)
	-- local obj = display.newImageRect( imageSheet, 1, 70, 41 )
	-- obj.x, obj.y = 100, 100
	-- display.newImageSheet(imageSheet)
	local icon = display.newImage("mitmuncLogo2017.png", display.contentCenterX, title.y + 150)
	-- icon.x = display.contentCenterX
	-- icon.y = display.contentCenterY
	-- fitImage(icon, 200, 200, false)

	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( title )
	sceneGroup:insert( summary )
	sceneGroup:insert( icon )

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene