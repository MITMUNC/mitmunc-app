-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a white background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor( 1 )	-- white
	
	-- create some text
	local title = display.newText( "pdf here", display.contentCenterX, 125, native.systemFont, 32 )
	title:setFillColor( 0 )	-- black

	--https://docs.coronalabs.com/plugin/CoronaProvider_native_popup_quickLook/showPopup.html
	--https://forums.coronalabs.com/topic/59898-show-a-pdf-file-inside-an-app/
	local platformName = system.getInfo( "platform" )
	if ( platformName == "android" ) or (platformName == "win32") then 
		local wasOpened = system.openURL(system.pathForFile("test.pdf")) -- theoretically opens pdf if the phone has a pdf viewer
		if (wasOpened) then
	   		-- PDF was opened successfully by the default PDF viewer.
	   		-- Note that your app will be suspended when this happens.
		else
			--showMessage("Sorry, you must download a PDF viewer in order to view this document.")
	   		-- A PDF viewer is not available on the device.
	   		-- You can ask the user nicely to install one in order to view PDF files.
		end

	end
	--if (platformName == "ios") or (platformName == ) then
		local quickLookOptions = 
		{
		    files =
		  	{
		        { filename="test.pdf", baseDir=system.ResourceDirectory },
		    },
		    startIndex = 1,
		    listener = quickLookListener
		}
		native.showPopup( "quickLook", quickLookOptions )
	--end
	


	
	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( title )
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
