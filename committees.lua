-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local widget = require( "widget" )
local scene = composer.newScene()
local display = require("display")
local graphics = require("graphics")

function scene:create( event )
    local sceneGroup = self.view
    local scrollView = widget.newScrollView(
	    {
	        top = 0,
	        left = 0,
	        width = display.contentHeight,
	        height = display.contentHeight - 50,
	        scrollWidth = 600,
	        scrollHeight = 800,
	        hideBackground = true  -- transparent
	    }
	)
    local committees = {"UNSC", "DISEC", "Futuristic", "HRC", "UNECLAC", "WHO", "UNEP", "Historical",
                        "EU", "WTO", "IMF", "IAEA", "ASEAN", "UNHCR", "UNHRC", "SPECPOL", "ECOSOC"}
    -- local function handleButtonEvent( event )
    --     if ( "ended" == event.phase ) then
    --         print( "Button was pressed and released" )
    --         end
    -- end
    local function handleButtonEvent ( event )
    	if event.phase == "ended" then
        	-- print( "You pressed and released the "..event.target.id.." button!" )
        	local platformName = system.getInfo( "platform" )
        	print(platformName)
        	if (platformName == "ios") or (platformName == "macos") or (platformName == "tvos") then  -- alternatively: https://github.com/boostup/Corona-SDK-Simple-PDF-Reader
				webView = native.newWebView( display.contentWidth / 2, display.contentHeight / 2 - 50, display.contentWidth, display.contentHeight) 
				webView:request(event.target.id..".pdf",  system.ResourceDirectory )
				webView.oriX = webView.x; webView.oriY = webView.y 
        		webView.alpha = 1; webView.oldAlpha = 1 
       			webView.name = "webViewName" 
       			sceneGroup.webView = webView
       			sceneGroup:insert ( webView)
        	end
        	if ( platformName == "android" ) or (platformName == "win32") or (platformName == "winphone") then 
				local wasOpened = system.openURL(system.pathForFile(event.target.id..".pdf")) -- theoretically opens pdf if the phone has a pdf viewer
				if (wasOpened) then
	   				-- PDF was opened successfully by the default PDF viewer.
	   				-- Note that your app will be suspended when this happens.
				else
					native.showAlert("Error","Sorry, you must download a PDF viewer in order to view this document.")
	   					-- A PDF viewer is not available on the device.
	   					-- You can ask the user nicely to install one in order to view PDF files.
			end

	end
    	end
    	if ( event.phase == "moved" ) then  -- continues scrolling if touch on button moves more than 10 pixels
    		local dy = math.abs( ( event.y - event.yStart ) )
    		if ( dy > 10 ) then
        		scrollView:takeFocus( event )
    		end
		end
	end
    -- Called when the scene's view does not exist.
    -- 
    -- INSERT code here to initialize the scene
    -- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
    
    local background = display.newRect(display.contentWidth / 2 ,display.contentHeight / 2, display.contentWidth, display.contentHeight)
	local gradient = {
    	type="gradient",
    	color1={ 140/256,24/256,27/256}, color2={ 0, 0, 0 }, direction="down"
	}
	background:setFillColor( gradient )

    -- create some text
    local title = display.newText( "Committees", display.contentCenterX, 50, native.systemFont, 32 )
    title:setFillColor( 1 ) -- black

    -- Couldn't figure out table view in time so manually inserted buttons for each committee
    local unsc_button = widget.newButton(
        {
            id = "UNSC",
            label = "UNSC",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = title.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

    local disec_button = widget.newButton(
        {
            id = "DISEC",
            label = "DISEC",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = unsc_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

   	local futuristic_button = widget.newButton(
        {
            id = "Futuristic",
            label = "Futuristic",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = disec_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

   	local hrc_button = widget.newButton(
        {
            id = "HRC",
            label = "HRC",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = futuristic_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

   	local uneclac_button = widget.newButton(
        {
            id = "UNECLAC",
            label = "UNECLAC",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = hrc_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

   	local who_button = widget.newButton(
        {
            id = "WHO",
            label = "WHO",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = uneclac_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

   	local unep_button = widget.newButton(
        {
            id = "UNEP",
            label = "UNEP",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = who_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

   	local historical_button = widget.newButton(
        {
            id = "Historical",
            label = "Historical",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = unep_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

   	local eu_button = widget.newButton(
        {
            id = "EU",
            label = "EU",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = historical_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

   	local wto_button = widget.newButton(
        {
            id = "WTO",
            label = "WTO",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = eu_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

   	local imf_button = widget.newButton(
        {
            id = "IMF",
            label = "IMF",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = wto_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

   	local iaea_button = widget.newButton(
        {
            id = "IAEA",
            label = "IAEA",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = imf_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

   	local asean_button = widget.newButton(
        {
            id = "ASEAN",
            label = "ASEAN",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = iaea_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

   	local unhcr_button = widget.newButton(
        {
            id = "UNHCR",
            label = "UNHCR",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = asean_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

  

   	local specpol_button = widget.newButton(
        {
            id = "SPECPOL",
            label = "SPECPOL",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = unhcr_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

   	local ecosoc_button = widget.newButton(
        {
            id = "ECOSOC",
            label = "ECOSOC",
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = specpol_button.y+30,
            left = 60,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )

    -- all objects must be added to group (e.g. self.view)
    sceneGroup:insert( background )
    sceneGroup:insert( scrollView )
    scrollView:insert( title )
    scrollView:insert( unsc_button )
    scrollView:insert( disec_button )
    scrollView:insert( futuristic_button )
    scrollView:insert( hrc_button )
    scrollView:insert( uneclac_button )
    scrollView:insert( who_button )
    scrollView:insert( unep_button )
    scrollView:insert( historical_button )
    scrollView:insert( eu_button )
    scrollView:insert( wto_button )
    scrollView:insert( imf_button )
    scrollView:insert( iaea_button )
    scrollView:insert( asean_button )
    scrollView:insert( unhcr_button )
    scrollView:insert( specpol_button )
    scrollView:insert( ecosoc_button )




    -- sceneGroup:insert( summary )
    -- sceneGroup:insert( unsc_button )
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
