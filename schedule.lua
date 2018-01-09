-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- multi level tree of event data:
--   First level array is the day
--      Second level array is the events within the day
local eventsData = { 
	{ day = "Friday", 
		{ time = "3:00PM-5:00PM", event = "Delegation Check-In" },
		{ time = "5:00PM-6:00PM", event = "Opening Ceremony" },
		{ time = "6:30PM-9:00PM", event = "Committee Session I" },
		{ time = "7:00PM", event = "Advisor Check-In Meeting" },
	},
	{ day = "Saturday", 
		{ time = "8:00AM-9:00AM", event = "Event D4-1" },
		{ time = "9:00AM-9:00AM", event = "Event D4-2" },
	},
	{ day = "Sunday",
		{ time = "8:00AM-9:00AM", event = "Event D5-1" },
		{ time = "9:00AM-9:30AM", event = "Event D5-2" },
		{ time = "11:00AM-12:00AM", event = "Event D5-3" },
		{ time = "1:00PM-2:00AM", event = "Event D5-4" },
	},
}

-- Creates the table view and populates it from the eventsData data structure
local function createTableView()
	-- Create the widget
	local yLoc = 50
	local sideWidth = 20
	tableView = widget.newTableView( {
        left = 0,
        top = yLoc,
        height = display.contentHeight-yLoc- 10,
        width = display.contentWidth-sideWidth*2,
        onRowRender = onRowRender,
        onRowTouch = onRowTouch,
        listener = scrollListener,
        hideBackground = true,
        --topPadding = 30,
        --bottomPadding = 30,
        isBounceEnabled = false,
	} )
    tableView.x = display.contentCenterX
    -- Insert day rows into the tableView
	for i = 1, #eventsData do
	    local rowHeight = 90
	    --local rowColor = { default={1,1,1}, over={1,0.5,0,0.2} }
	    local rowColor = { default={0.8,0.8,0.8,0.9} }
	    --local lineColor = { 0.5, 0.5, 0.5 }
	 
	    tableView:insertRow( {
            isCategory = true,
            rowHeight = rowHeight,
            rowColor = rowColor,
            params = { id = i }
	    } )
        for j = 1, #eventsData[i] do
	    	local rowColor = { default={0.9,0.9,0.9,0.9}, over={ .8, 1, .8, 0.9 } }
	    	rowHeight = 80
	    	tableView:insertRow( {
	            isCategory = false,
	            rowHeight = rowHeight,
	            rowColor = rowColor,
	            params = { id = i, subId = j }
	        } )
         end
	end
    return tableView
end

local function onRowRender( event )
   -- Get reference to the row group
    local row = event.row
 
    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth
    local rowTitle
    local rowTitleE
 
  	print("Render Row:", row.index)
 	if row.isCategory then
	    --local rowTitle = display.newText( row, eventsData[row.index].day, 0, 0, nil, 24 )
		rowTitle = display.newText( {parent=row, text=eventsData[row.params.id].day, 
			font=native.systemFontBold, fontSize=35} )    
	    rowTitle:setFillColor( 0,0,255 )
 	    rowTitle.x = 20
	else
		--print("...", row.index, id, row.params.subId)
		local infoTime = eventsData[row.params.id][row.params.subId].time
		local infoEvent = eventsData[row.params.id][row.params.subId].event
		rowTitle = display.newText( {parent=row, text=infoTime, align="left", height=rowHeight, width=rowWidth-40,
			font=native.systemFont, fontSize=30})
		rowTitle:setFillColor( 0,.5,0 )
		rowTitle.x = 25
		rowTitleE = display.newText( {parent=row, text=infoEvent, align="left", height=rowHeight, width=rowWidth-100,
			font=native.systemFont, fontSize=30})
		rowTitleE:setFillColor( 0,0,0 )
		rowTitleE.x = 155
		rowTitleE.anchorX = 0
		rowTitleE.y = rowHeight/2
	end

    -- Align the label left and vertically centered
    rowTitle.anchorX = 0
    rowTitle.y = rowHeight/2
    row.lineColor = { 0,0,0 }
end

-- This function is called when an event is touched.
local function onRowTouch( event )
	row = event.row
	print("Touch", row.index )
end

function scene:create( event )
	local sceneGroup = self.view
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a white background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor( 1 )	-- white
	
	-- create a header bar background for the title
	local headerBar = display.newRect( display.contentCenterX, 0, display.contentWidth, display.contentHeight*.1 )
	headerBar:setFillColor( .3 )	-- red?????

	-- create title
	local title = display.newText( "Conference Schedule", display.contentCenterX, 0, native.systemFont, 32 )
	title:setFillColor( 0 )	-- black

    -- create the calendar

	
	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( headerBar )
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
