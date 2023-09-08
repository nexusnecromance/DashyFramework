import "var"
import "player"
import "collision"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/object"
import "CoreLibs/math"

local pd <const> = playdate
local gfx <const> = pd.graphics


local function initialize()
    --playdate.display.setRefreshRate(50) -- Sets framerate to 50 fps
    --local sonicanim = gfx.image.new("images/sonicanim_idle")
    --[[gfx.pushContext(sonicanim)
        gfx.image:drawCentered(sonicanim)
    gfx.popContext()]]


end
initialize()

local function playerdraw()
    --image:draw(sonic.x, sonic.y)
    gfx.drawRect (sonic.x-sonic.widthrad, sonic.y-sonic.heightrad, sonic.widthrad*2+1, sonic.heightrad*2+1)
    gfx.drawPixel(sonic.x,sonic.y)
end

function pd.update()
    gfx.clear()
    gfx.sprite.update()

    playerupdate()
    playerdraw()

    pd.drawFPS(0,0)
end
--pd.debugDraw()