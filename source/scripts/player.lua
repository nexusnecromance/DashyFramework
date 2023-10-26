--Sonic's Function
import "scripts/var"
import "scripts/collision"

import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/object"
import "CoreLibs/math"

local pd <const> = playdate
local gfx <const> = pd.graphics

class("Player").extends(gfx.sprite)

function Player:init(x,y)
    local playerImage = gfx.image.new("images/sonicanim_idle")
    self:setImage(playerImage)
    self:moveTo(x,y)
    self:add()

    Player.groundspeed = 0;

end

function Player.update()
    --sonic.xspeed -= sonic.jumpforce * math.sin(sonic.groundangle);
    --sonic.yspeed -= sonic.jumpforce * math.cos(sonic.groundangle);

    if (pd.buttonIsPressed("left")) then
        if (Player.groundspeed > 0) then --if moving to the right
            Player.groundspeed -= decelerationspeed  --decelerate
            if (Player.groundspeed <= 0) then
                Player.groundspeed = -0.5 --emulate deceleration quirk
            end
        elseif (Player.groundspeed > -topspeed) then --if moving to the left
            Player.groundspeed -= accelerationspeed  --accelerate
            if (Player.groundspeed <= -topspeed) then
                Player.groundspeed = -topspeed --impose top speed limit
            end
        end
    end

    if (pd.buttonIsPressed("right")) then
        if (Player.groundspeed < 0) then --if moving to the left
            Player.groundspeed += decelerationspeed --decelerate
            if (Player.groundspeed >= 0) then
                Player.groundspeed = 0.5 --emulate deceleration quirk
            end
        elseif (Player.groundspeed < topspeed) then --if moving to the right
            Player.groundspeed += accelerationspeed --accelerate
            if (Player.groundspeed >= topspeed) then
                Player.groundspeed = topspeed --impose top speed limit
            end
        end
    end

    if (not pd.buttonIsPressed("left") and not pd.buttonIsPressed("right")) and not (friction > Player.groundspeed) then
        Player.groundspeed -= math.min(math.abs(Player.groundspeed), friction) * math.sin(Player.groundspeed) --decelerate
    end

    Player.x+=Player.groundspeed


    if Player.isgrounded==false then
        Player.yspeed+=gravityforce
    end
    if Player.y>240+Player.heightrad then
        Player.y=0-Player.heightrad
        Player.yspeed=0
    end

    --[[if enginecollision(sonic,a,0) then
        sonic.isgrounded=true
    end]]

    Player.x+=Player.xspeed
    Player.y+=Player.yspeed
end