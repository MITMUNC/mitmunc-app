-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


widget = require( "widget" )
require "utils"

-- Override debug: comment out line below for debug mode
-- _G.print = function() end 



print("App Start")

-- multi level tree of event data:
--   First level array is the day
--      Second level array is the events withend the day
local eventsData = { 
	{ day = "Monday", 
		{ time = "8:00AM-\n9:00AM", event = "Event D1-1" },
		{ time = "9:00AM-\n10:00AM", event = "Event D1-2" },
	},
	{ day = "Tuesday", 
		{ time = "8:00AM-\n9:00AM", event = "Event D2-1" },
		{ time = "9:00AM-\n10:00AM", event = "Event D2-2" },
	},
	{ day = "Wednesday", 
		{ time = "8:00AM-\n9:00AM", event = "Event D3-1 - Line overflow test of what happens" },
		{ time = "9:00AM-\n10:00AM", event = "Event D3-2" },
		{ time = "11:00AM-\n12:00AM", event = "Event D3-3" },
		{ time = "1:00PM-\n2:00AM", event = "Event D3-4" },
	},
	{ day = "Thursday", 
		{ time = "8:00AM-\n9:00AM", event = "Event D4-1" },
		{ time = "9:00AM-\n9:00AM", event = "Event D4-2" },
	},
	{ day = "Friday",
		{ time = "8:00AM-\n9:00AM", event = "Event D5-1" },
		{ time = "9:00AM-\n9:30AM", event = "Event D5-2" },
		{ time = "11:00AM-\n12:00AM", event = "Event D5-3" },
		{ time = "1:00PM-\n2:00AM", event = "Event D5-4" },
	},
}

local md = display.newGroup()  -- main display 
local tableView

local function initBackground()
	md.bg = display.newImageRect( md, "assets/mybackground.png", display.contentWidth, 
		display.contentHeight )
	md.bg.x = display.contentCenterX
	md.bg.y = display.contentCenterY
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
end

-- Creates all the screen element for the UI
local function initMainDisplay()
	-- Create a list view
	createTableView()
end
 

------ Begin main init code  ---------------------------------------------

initBackground()
initMainDisplay()

