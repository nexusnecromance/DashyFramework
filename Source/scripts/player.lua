--Sonic's Function
import "scripts/var"
import "scripts/collision"
import "scripts/gameScene"

import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/object"
import "CoreLibs/math"

local pd <const> = playdate
local gfx <const> = pd.graphics

class("Player", PlayerConfig).extends(gfx.sprite)

function Player:init(x,y)
    Player.super.init(self)

    --initialize player sprites
    local playerImage = gfx.image.new("images/sonicanim_idle")
    self:setImage(playerImage)

    self:setZIndex(1000)
    self:setCenter(0,0)
    self:moveTo(x,y)


    --gfx.pushContext(playerImage)
    --gfx.popContext()
    --self:add()
 --remove these variables once we can grab them from the var.lua
end

-- local playerObject = Player(0,0)
-- playerObject:add()

function Player:update()
    --sonic.xspeed -= sonic.jumpforce * math.sin(sonic.groundangle);
    --sonic.yspeed -= sonic.jumpforce * math.cos(sonic.groundangle);

    print(self.x .." ".. self.y)

    if (pd.buttonIsPressed("left")) or (pd.kButtonLeft) then
        if (self.groundspeed > 0) then --if moving to the right
            self.groundspeed -= decelerationspeed  --decelerate
            if (self.groundspeed <= 0) then
                self.groundspeed = -0.5 --emulate deceleration quirk
            end
        elseif (self.groundspeed > -topspeed) then --if moving to the left
            self.groundspeed -= accelerationspeed  --accelerate
            if (self.groundspeed <= -topspeed) then
                self.groundspeed = -topspeed --impose top speed limit
            end
        end
    end

    if (pd.buttonIsPressed("right")) or (pd.kButtonRight) then
        if (self.groundspeed < 0) then --if moving to the left
            self.groundspeed += decelerationspeed --decelerate
            if (self.groundspeed >= 0) then
                self.groundspeed = 0.5 --emulate deceleration quirk
            end
        elseif (self.groundspeed < topspeed) then --if moving to the right
            self.groundspeed += accelerationspeed --accelerate
            if (self.groundspeed >= topspeed) then
                self.groundspeed = topspeed --impose top speed limit
            end
        end
    end

    if (not pd.buttonIsPressed("left") and not pd.buttonIsPressed("right")) then --and not (friction > self.groundspeed) then
        self.groundspeed -= math.min(math.abs(self.groundspeed), friction) * math.sin(self.groundspeed) --decelerate
    end

    self.x += self.groundspeed


    if self.isgrounded==false then
        self.yspeed+=gravityforce
    end
    if self.y>240+self.heightrad then
        self.y=0-self.heightrad
        self.yspeed=0
    end

    --[[if enginecollision(sonic,a,0) then
        sonic.isgrounded=true
    end]]

    self.x += self.xspeed
    self.y += self.yspeed

    playerObject:moveTo(self.x,self.y)
end