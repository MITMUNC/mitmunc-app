-----------------------------------------------------------------------------------------
--
-- schedule.lua
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
    local title = display.newText( "Schedule", display.contentCenterX, 50, native.systemFont, 32 )
    title:setFillColor( 1 ) -- black

    local subtitle = display.newText( "Friday", display.contentCenterX, title.y+60, native.systemFont, 24 )
    subtitle:setFillColor( 0.8 ) -- gray - black
    
    local one = display.newText( "3-5PM: Delegation Check-In \n     Marriot Ballroom Lobby", display.contentCenterX, subtitle.y+60, native.systemFont, 16 )
    one:setFillColor( 0.9 ) -- gray - black
    local two = display.newText( "5-6PM: Opening Ceremonies \n     Marriot Ballroom", display.contentCenterX, one.y+60, native.systemFont, 16 )
    one:setFillColor( 0.9 ) -- gray - black
    local three = display.newText( "7:30PM- 9:30PM: Committee Session I \n    E51 (Tang Center) Classrooms", display.contentCenterX, two.y+60, native.systemFont, 16 )
    one:setFillColor( 0.9 ) -- gray - black

    local subtitle2 = display.newText( "Saturday", display.contentCenterX, three.y+90, native.systemFont, 24 )
    subtitle:setFillColor( 0.8 ) -- gray - black
    
    local four = display.newText( "9:30AM-12:30PM: Committee Session II", display.contentCenterX, subtitle2.y+40, native.systemFont, 16 )
    four:setFillColor( 0.9 ) -- gray - black
    local five = display.newText( "12:30PM-2PM: Lunch Break", display.contentCenterX, four.y+60, native.systemFont, 16 )
    one:setFillColor( 0.9 ) -- gray - black
    local six = display.newText( "2PM-5PM: Committee Session III", display.contentCenterX, five.y+60, native.systemFont, 16 )
    one:setFillColor( 0.9 ) -- gray - black
    local seven = display.newText( "5PM-6:30PM: Dinner Break", display.contentCenterX, six.y+60, native.systemFont, 16 )
    seven:setFillColor( 0.9 ) -- gray - black
    local eight = display.newText( "6:30PM-8:30 PM: Committee Session IV", display.contentCenterX, seven.y+60, native.systemFont, 16 )
    one:setFillColor( 0.9 ) -- gray - black
    local nine = display.newText( "7PM: Advisor Meeting \nE51 (Tang Center) Room 361", display.contentCenterX, eight.y+60, native.systemFont, 16 )
    one:setFillColor( 0.9 ) -- gray - black
    local ten = display.newText( "9:30PM-12 AM: Delegate Dance \nLobdell, Building W20 (Student Center)", display.contentCenterX, nine.y+60, native.systemFont, 16 )
    one:setFillColor( 0.9 ) -- gray - black


    local subtitle3 = display.newText( "Friday", display.contentCenterX, ten.y+90, native.systemFont, 24 )
    subtitle:setFillColor( 0.8 ) -- gray - black
    
    local eleven = display.newText( "9:30AM-11:30 PM: Committee Session V", display.contentCenterX, subtitle3.y+40, native.systemFont, 16 )
    eleven:setFillColor( 0.9 ) -- gray - black
    local twelve = display.newText( "11:30PM-1 PM: Lunch Break", display.contentCenterX, eleven.y+60, native.systemFont, 16 )
    one:setFillColor( 0.9 ) -- gray - black
    local thirteen = display.newText( "1 PM: Closing Ceremonies \n     Kresge Auditorium", display.contentCenterX, twelve.y+60, native.systemFont, 16 )
    one:setFillColor( 0.9 ) -- gray - black


    -- all objects must be added to group (e.g. self.view)
    sceneGroup:insert( background )
    sceneGroup:insert( scrollView )
    scrollView:insert( title )
    scrollView:insert( subtitle )
    scrollView:insert( subtitle2 )
    scrollView:insert( subtitle3 )
    scrollView:insert( one )
    scrollView:insert( two )
    scrollView:insert( three )
    scrollView:insert( four )
    scrollView:insert( five )
    scrollView:insert( six )
    scrollView:insert( seven )
    scrollView:insert( eight )
    scrollView:insert( nine )
    scrollView:insert( ten )
    scrollView:insert( eleven )
    scrollView:insert( twelve )
    scrollView:insert( thirteen )




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
