-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local display = require("display")
local graphics = require("graphics")
local scene = composer.newScene()
local widget = require ( "widget" )

function scene:create( event )
	
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

	-- temporary white background
	--local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	--background:setFillColor( 1 )	-- white

 
	-- Makes things scroll
	local sceneGroup = self.view
	local scrollView = widget.newScrollView(
	    {
	        top = 0,
	        left = 0,
	        width = display.contentHeight,
	        height = display.contentHeight - 50,
	        scrollWidth = 600,
	        scrollHeight = 800,
	        hideBackground = true
	    }
	)

	--giving it a background
	local background = display.newImageRect( "dome.jpg", display.contentWidth, 200)
	background.x = display.contentCenterX
	background.y = 100

	--gradient background
	local morebackground = display.newRect(display.contentWidth / 2 ,display.contentHeight / 2, display.contentWidth, display.contentHeight)
	local gradient = {
    	type="gradient",
    	color1={ 140/256,24/256,27/256}, color2={ 0.8, 0.8, 0.8 }, direction="down"
	}
	morebackground:setFillColor( gradient )


	local icon = display.newImage("mitmuncLogo2017.png", display.contentCenterX, 100)

	-- create some text
	
	local newTextParams = { text = "February 9 - 11, 2018", 
						x = display.contentCenterX, 
						y = icon.y + 230, 
						width = 310, height = 310, 
						font = native.systemFont, fontSize = 14, 
						align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 1 ) -- white


	-- adding buttons
	local function myButtonEvent ( event )
    	if event.phase == "ended" then
        	print( "You pressed and released the "..event.target.id.." button!" )
        	if event.target.id == 'button_1' then
        		composer.gotoScene( 'pdf_button_1')
        	end
    	end
    	if ( event.phase == "moved" ) then  -- continues scrolling if touch on button moves more than 10 pixels
    		local dy = math.abs( ( event.y - event.yStart ) )
    		if ( dy > 10 ) then
        		scrollView:takeFocus( event )
    		end
		end
	end

	local button_1 = widget.newButton
	{
		 id = 'button_1',
		 left = 0,
		 top = icon.y + 100,
		 width = display.contentWidth, 
		 height = 75,
		 label = "Position Paper Guidelines",
		 onEvent = myButtonEvent ,
		 shape = "rect",
		 labelColor = { default={ 1 }, over={ 1 } },
		 fillColor = { default={140/256,24/256,27/256,1}, over={140/256,24/256,27/256,0.5} }

	}

	--button_1:setFillColor(1,0,0)--( 138, 26, 31 )
	--setfillColor = { default={ 1, 0.2, 0.5, 0.7 }, over={ 1, 0.2, 0.5, 1 } }
	-- button_1.alpha = 0.5  -- controls opacity

	local button_2 = widget.newButton
	{
		 id = 'button_2',
		 left = 0,
		 top = button_1.y + 50,
		 width = display.contentWidth, 
		 height = 75,
		 shape = "rect",
		 label = "What to Bring",
		 onEvent = myButtonEvent ,
		 labelColor = { default={ 1 }, over={ 1 } },
		 fillColor = { default={140/256,24/256,27/256,1}, over={140/256,24/256,27/256,0.5} }

	}

	local button_3 = widget.newButton
	{
		 id = 'button_3',
		 left = 0,
		 top = button_2.y + 50,
		 width = display.contentWidth, 
		 height = 75,
		 shape = "rect",
		 label = "Parliamentary Procedure",
		 onEvent = myButtonEvent ,
		 fillColor = { default={140/256,24/256,27/256,1}, over={140/256,24/256,27/256,0.5} },
		 labelColor = { default={ 1 }, over={ 1 } }

	}

	local button_4 = widget.newButton
	{
		 id = 'button_4',
		 left = 0,
		 top = button_3.y + 50,
		 width = display.contentWidth, 
		 height = 75,
		 shape = "rect",
		 label = "Resolution Writing",
		 onEvent = myButtonEvent ,
		 fillColor = { default={140/256,24/256,27/256,1}, over={140/256,24/256,27/256,0.5} },
		 labelColor = { default={ 1 }, over={ 1 } }

	}



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
	-- icon.x = display.contentCenterX
	-- icon.y = display.contentCenterY
	-- fitImage(icon, 200, 200, false)



	-- all objects must be added to group (e.g. self.view)
	scrollView:insert( background )
	scrollView:insert( summary )
	scrollView:insert( icon )
	scrollView:insert( button_1 )
	scrollView:insert( button_2 )
	scrollView:insert( button_3 )
	scrollView:insert( button_4 )
	sceneGroup:insert(morebackground)
	sceneGroup:insert( scrollView )


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