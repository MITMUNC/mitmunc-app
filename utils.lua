--- utils.lua --------------------------------
--
-- utility functions
-- These functions should are designed to reliatent upon the system
-- and code in here making it importable into other applications
--
---------------------------------------------


-- global platform vars
platformName = system.getInfo( "platform" )  -- android, win32, ios
environmentName = system.getInfo( "environment" )  -- simulator, device
--print( "p=", platformName, "e=", environmentName)



-- encapsulate display mode os specifics

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

-- This function displays the contents of table
local function print_r( t ) 
    local print_r_cache={}
        local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                local tLen = #t
                for i = 1, tLen do
                    local val = t[i]
                    if (type(val)=="table") then
                        print(indent.."#["..i.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(i)+8))
                        print(indent..string.rep(" ",string.len(i)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."#["..i..'] => "'..val..'"')
                    else
                        print(indent.."#["..i.."] => "..tostring(val))
                    end
                end
                for pos,val in pairs(t) do
                    if type(pos) ~= "number" or math.floor(pos) ~= pos or (pos < 1 or pos > tLen) then
                        if (type(val)=="table") then
                            print(indent.."["..pos.."] => "..tostring(t).." {")
                            sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                            print(indent..string.rep(" ",string.len(pos)+6).."}")
                        elseif (type(val)=="string") then
                            print(indent.."["..pos..'] => "'..val..'"')
                        else
                            print(indent.."["..pos.."] => "..tostring(val))
                        end
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    
   if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end

   print()
end

ignoreObjectEvent = function( event )
	return true
end






-- local function fitImage( displayObject, fitWidth, fitHeight )
--     --
--     -- first determine which edge is out of bounds
--     --
--     local scaleFactor = fitHeight / displayObject.height 
--     local newWidth = displayObject.width * scaleFactor
--     if newWidth &gt; fitWidth then
--         scaleFactor = fitWidth / displayObject.width 
--     end
--     if scaleFactor > 1 then
--         return
--     end
--     displayObject:scale( scaleFactor, scaleFactor )
-- end

function relayoutScreen( landscape )
    print( "landscape", landscape )

end

resizeListener = function( event )
	print("RESIZE EVENT")
	--displayData()
    relayoutScreen( system.orientation:find("landscape") ~= nil )
end
Runtime:addEventListener( "resize", resizeListener )



--[[
-- Called when a key event has been received
local function onKeyEvent( event )
   -- Print which key was pressed down/up
    local message = "Key '" .. event.keyName .. "' was pressed " .. event.phase
    print( message )
   -- If the "back" or escape key was pressed on Android or Windows/WinPhone, prevent it from backing out of the app
    if event.keyName == "back" or event.keyName == "escape" then
        if event.phase == "up" then
            print ("bkeyl", backKeySubListener )
            if backKeySubListener ~= nil then
                -- what happens here on a home button call
                if inCall then
                    inCallCount = inCallCount + 1
                    print("Back key sublistener call still in process")
                    if inCallCount > 3 then
                        inCallCount = 0
                        inCall = false
                        return false -- somethings wrong, bail out
                    end
                    return true  -- keep waiting
                end
                print("Calling back key sublistener")
                inCall = true
                backKeySubListener()  -- sublistner active, call and ignore key here
                -- what if this call doesn't return fast and the user does another back key?
                inCall = false
                inCallCount = 0
                return true
            end
        else
            if introGroup.isVisible then
                if event.keyName == "escape" then
                    native.requestExit()
                    return true
                end
                return false  -- also time to exit game
            end
        end
        return true  -- we handled back processing
    end
 
    -- IMPORTANT! Return false to indicate that this app is NOT overriding the received key
    -- This lets the operating system execute its default handling of the key
    return false
end
if platformName ~= "ios" then  -- ios doesn't have keys - ugh
    Runtime:addEventListener( "key", onKeyEvent )  
end
]]


