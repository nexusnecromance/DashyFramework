--Sonic's Function
import "var"
import "collision"

import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/object"
import "CoreLibs/math"

local pd <const> = playdate

function playerupdate()
    --sonic.xspeed -= sonic.jumpforce * math.sin(sonic.groundangle);
    --sonic.yspeed -= sonic.jumpforce * math.cos(sonic.groundangle);

    if (pd.buttonIsPressed("left")) then
        if (sonic.groundspeed > 0) then --if moving to the right
            sonic.groundspeed -= decelerationspeed  --decelerate
            if (sonic.groundspeed <= 0) then
                sonic.groundspeed = -0.5 --emulate deceleration quirk
            end
        elseif (sonic.groundspeed > -topspeed) then --if moving to the left
            sonic.groundspeed -= accelerationspeed  --accelerate
            if (sonic.groundspeed <= -topspeed) then
                sonic.groundspeed = -topspeed --impose top speed limit
            end
        end
    end

    if (pd.buttonIsPressed("right")) then
        if (sonic.groundspeed < 0) then --if moving to the left
            sonic.groundspeed += decelerationspeed --decelerate
            if (sonic.groundspeed >= 0) then
                sonic.groundspeed = 0.5 --emulate deceleration quirk
            end
        elseif (sonic.groundspeed < topspeed) then --if moving to the right
            sonic.groundspeed += accelerationspeed --accelerate
            if (sonic.groundspeed >= topspeed) then
                sonic.groundspeed = topspeed --impose top speed limit
            end
        end
    end

    if (not pd.buttonIsPressed("left") and not pd.buttonIsPressed("right")) then
        sonic.groundspeed -= math.min(math.abs(sonic.groundspeed), friction) * math.sin(sonic.groundspeed) --decelerate
    end

    sonic.x+=sonic.groundspeed


    if sonic.isgrounded==false then
        sonic.yspeed+=gravityforce
    end
    if sonic.y>240+sonic.heightrad then
        sonic.y=0-sonic.heightrad
        sonic.yspeed=0
    end

    if enginecollision(sonic,a,0) then
        sonic.isgrounded=true
    end

    sonic.x+=sonic.xspeed
    sonic.y+=sonic.yspeed
end