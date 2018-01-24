-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require ( "widget" )

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

	local function myButtonEvent ( event )  -- links to the MITMUNC website
    	if event.phase == "ended" then
			system.openURL("http://www.mitmunc.org")
    	end
    end
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a gradient background to fill screen
	local background = display.newRect(display.contentWidth / 2 ,display.contentHeight / 2, display.contentWidth, display.contentHeight)
	local gradient = {
    	type="gradient",
    	color1={ 140/256,24/256,27/256}, color2={ 0, 0, 0 }, direction="down"
	}
	background:setFillColor( gradient )
	
	-- create some text
	local title = display.newText( "Merchandise", display.contentCenterX, 50, native.systemFont, 32 )
	title:setFillColor( 1 )	

	local tang_picture = display.newImage("tang.jpg", display.contentCenterX, title.y + 125)
	tang_picture:scale( 0.70, 0.70 )
	
	local newTextParams = { text = "During conference, MITMUNC X merchandise will be sold on the first floor of the MIT Tang Center (E51), located at 70 Memorial Dr, Cambridge, MA.", 
						x = display.contentCenterX, 
						y = tang_picture.y + 250, 
						width = display.contentWidth - 20, height = 310, 
						font = native.systemFont, fontSize = 12, 
						align = "center"}
	local merch1 = display.newText( newTextParams )
	merch1:setFillColor( 1 ) 

	--charity picture
	local irc_picture = display.newImage("irc_logo.png", 75, merch1.y)
	irc_picture:scale( 0.5, 0.5)

	local newTextParams = { text = "Charity Cause:\n \nAny donations are welcome on our website!\n", 
						x = display.contentCenterX + 60, 
						y = irc_picture.y + 115, 
						width = display.contentWidth - 150, height = 310, 
						font = native.systemFont, fontSize = 12, 
						align = "center"}
	local irc_text = display.newText( newTextParams )

	local mitmunc_link = widget.newButton
	{
		 id = 'mitmunc_link',
		 left = 175,
		 top =  450,
		 width = display.contentWidth, 
		 height = 30,
		 shape = "rect",
		 label = "www.mitmunc.org",
		 onEvent = myButtonEvent ,
		 labelColor = { default={ 1 }, over={ 1 } },
		 textOnly = "true",
		 fontSize = 12

	}

	--chocolate gavels photo
	local gavel_picture = display.newImage("chocolate_gavel.jpeg", 110, merch1.y + 150)
	gavel_picture:scale( 0.40, 0.40)

	local newTextParams = { text = "Gavel Grams\n \n \n $3\n", 
						x = display.contentCenterX + 95, 
						y = gavel_picture.y + 130, 
						width = display.contentWidth - 150, height = 310, 
						font = native.systemFont, fontSize = 12, 
						align = "center"}
	local gavel_text = display.newText( newTextParams )

	--tshirt photo
	local tshirt_picture = display.newImage("tshirt.png", 110, gavel_picture.y + 150)
	tshirt_picture:scale( 0.23, 0.23)

	local newTextParams = { text = "T-shirt\n \n \n $12\n", 
						x = display.contentCenterX + 95, 
						y = tshirt_picture.y + 130, 
						width = display.contentWidth - 150, height = 310, 
						font = native.systemFont, fontSize = 12, 
						align = "center"}
	local tshirt_text = display.newText( newTextParams )

	--hoodie photo
	local hoodie_picture = display.newImage("hoodie.png", 110, tshirt_picture.y + 150)
	hoodie_picture:scale( 0.23, 0.23)

	local newTextParams = { text = "Hoodie\n \n \n $20\n", 
						x = display.contentCenterX + 95, 
						y = hoodie_picture.y + 130, 
						width = display.contentWidth - 150, height = 310, 
						font = native.systemFont, fontSize = 12, 
						align = "center"}
	local hoodie_text = display.newText( newTextParams )



	
	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( scrollView )
	scrollView:insert( title )
	scrollView:insert( merch1 )
	scrollView:insert( tang_picture )
	scrollView:insert( irc_picture )
	scrollView:insert( irc_text )
	scrollView:insert( mitmunc_link )
	scrollView:insert( gavel_picture )
	scrollView:insert( gavel_text )
	scrollView:insert( tshirt_picture )
	scrollView:insert( tshirt_text )
	scrollView:insert( hoodie_picture )
	scrollView:insert( hoodie_text )
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
