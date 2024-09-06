-- BEGIN INITIALIZATION FOR THE PROGRAM

-- importing built in scripts
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/math"

-- importing custom libraries
import "scripts/libraries/LDtk"

-- importing custom scripts
import "scripts/var"
import "scripts/player"
import "scripts/gameScene"
import "scripts/collision"

local pd <const> = playdate
local gfx <const> = pd.graphics

--local playerObject = Player(0,0)
GameScene()

function pd.init()
    
    -- the code below is for debug playtesting before the final. do not tamper with this.
    
    --playdate.display.setRefreshRate(50) -- Sets framerate to 50 fps
    --local sonicanimate = gfx.image.new("images/sonicanim_idle")
    --gfx.pushContext(sonicanimate)
    --gfx.image:drawCentered(sonicanimate)
    --gfx.popContext()

    --playerObject:add()


end

function pd.update()

    gfx.clear()
    gfx.sprite.update()
    pd.timer.updateTimers()
    --pd.update()
    pd.draw()

    pd.drawFPS(0,0)
end

function pd.draw()
    --image:draw(sonic.x, sonic.y)
    --gfx.drawRect(Player.x-Player.widthrad, Player.y-Player.heightrad, Player.widthrad*2+1, Player.heightrad*2+1)
    --gfx.draw
end
