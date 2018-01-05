-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local widget = require( "widget" )
local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view
    
    -- Called when the scene's view does not exist.
    -- 
    -- INSERT code here to initialize the scene
    -- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
    
    -- create a white background to fill screen
    local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
    background:setFillColor( 0 )    -- white
    
    -- create some text
    local title = display.newText( "Committees", display.contentCenterX, 0, native.systemFont, 32 )
    title:setFillColor( 1 ) -- black

    -- local newTextParams = { text = "Loaded by the second tab's\n\"onPress\" listener\nspecified in the 'tabButtons' table", 
    --                         x = display.contentCenterX + 10, 
    --                         y = title.y + 215, 
    --                         width = 310, 
    --                         height = 310, 
    --                         font = native.systemFont, 
    --                         fontSize = 14, 
    --                         align = "center" }

    -- local summary = display.newText( newTextParams )
    -- summary:setFillColor( 0 ) -- black
    
    -- local rect = display.newRect( 160, 240, 200, 200 )
    local committees = {"UNSC", "DISEC", "Futuristic", "HRC", "UNECLAC", "WHO", "UNEP", "Historical",
                        "EU", "WTO", "IMF", "IAEA", "ASEAN", "UNHCR", "UNHCR", "SPECPOL", "ECOSOC"}
    local function handleButtonEvent( event )
        if ( "ended" == event.phase ) then
            print( "Button was pressed and released" )
            end
    end

    -- for loop to create committee buttons
    for i=1, #committees do

        local button = widget.newButton(
        {
            id = committees[i],
            label = committees[i],
            onEvent = handleButtonEvent,
            emboss = false,
            shape = "roundedRect",
            width = 200,
            height = 40,
            top = 30*i,
            cornerRadius = 2,
            fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
            strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
            strokeWidth = 4
        }
        )
        
    end


    -- local unsc_button = widget.newButton(
    -- {
    --     id = "unsc_button",
    --     label = "UNSC",
    --     onEvent = handleButtonEvent,
    --     emboss = false,
    --     shape = "roundedRect",
    --     width = 200,
    --     height = 40,
    --     top = 30,
    --     cornerRadius = 2,
    --     fillColor = { default={163/255,32/255,53/255}, over={163/255,32/255,53/255} },
    --     strokeColor = { default={1, 1, 1}, over={163/255,32/255,16/255} },
    --     strokeWidth = 4
    -- }
    -- )

    -- unsc_button.x = display.contentCenterX

    -- all objects must be added to group (e.g. self.view)
    button.x = display.contentCenterX
    sceneGroup:insert( background )
    sceneGroup:insert( title )
    sceneGroup:insert( button )

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
