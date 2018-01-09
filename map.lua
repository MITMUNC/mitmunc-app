-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require ( "widget" )

function scene:create( event )
end

function scene:show( event )
	local sceneGroup = self.view

	local phase = event.phase
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen


		
	elseif phase == "did" then
		local sceneGroup = self.view
		local phase = event.phase
		
		local platformName = system.getInfo( "platform" )
	    --print(platformName)
	    if (platformName == "ios") or (platformName == "macos") or (platformName == "tvos") then  -- alternatively: https://github.com/boostup/Corona-SDK-Simple-PDF-Reader
			webView = native.newWebView( display.contentWidth / 2, display.contentHeight / 2 - 50, display.contentWidth, display.contentHeight) 
			webView:request("map.pdf",  system.ResourceDirectory )
			webView.oriX = webView.x; webView.oriY = webView.y 
	        webView.alpha = 1; webView.oldAlpha = 1 
	       	webView.name = "webViewName" 
	       	sceneGroup.webView = webView
	       	sceneGroup:insert ( webView )
	    end
	    if ( platformName == "android" ) or (platformName == "win32") or (platformName == "winphone") then 
			local wasOpened = system.openURL(system.pathForFile("map.pdf")) -- theoretically opens pdf if the phone has a pdf viewer
			if (wasOpened) then
		   		-- PDF was opened successfully by the default PDF viewer.
		   		-- Note that your app will be suspended when this happens.
			else
				native.showAlert("Error","Sorry, you must download a PDF viewer in order to view this document.")
		   		-- A PDF viewer is not available on the device.
			end	
    	end 
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc. ]]--
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	local webView = sceneGroup.webView
	
	if event.phase == "will" then

		if webView and webView.removeSelf then  -- removes pdf (webview) when you click to a different tab
            webView:removeSelf()
            webView = nil
        end
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		if webView and webView.removeSelf then  -- removes pdf (webview) when you click to a different tab
            webView:removeSelf()
            webView = nil
        end
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