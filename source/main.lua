-- BEGIN INITIALIZATION FOR THE PROGRAM

-- importing built in scripts
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/object"
import "CoreLibs/math"

-- importing custom scripts
import "scripts/var"
import "scripts/player"
import "scripts/collision"

local pd <const> = playdate
local gfx <const> = pd.graphics


-- for debug 
Player(0,0)


function pd:init()
    
    -- the code below is for debug playtesting before the final. do not tamper with this.
    
    --playdate.display.setRefreshRate(50) -- Sets framerate to 50 fps
    --local sonicanim = gfx.image.new("images/sonicanim_idle")
    --[[gfx.pushContext(sonicanim)
        gfx.image:drawCentered(sonicanim)
    gfx.popContext()]]



end
--init()


function pd.update()
    gfx.clear()
    gfx.sprite.update()
    pd.timer.updateTimers()
    --pd.update()
    --pd.draw()

    pd.drawFPS(0,0)
end
--pd.debugDraw()

function pd.draw()
    --image:draw(sonic.x, sonic.y)
    gfx.drawRect (Player.x-Player.widthrad, Player.y-Player.heightrad, Player.widthrad*2+1, Player.heightrad*2+1)
    gfx.drawPixel(Player.x,Player.y)
end
