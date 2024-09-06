import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/object"
import "CoreLibs/math"

import "scripts/player"

local pd <const> = playdate
local gfx <const> = pd.graphics
local ldtk <const> = LDtk

ldtk.load("levels/world.ldtk", false)


class("GameScene").extends()

function GameScene:init()
    GameScene.super.init(self)
    self:goToLevel("Level_0")
end

function GameScene:goToLevel(level_name)
    gfx.sprite.removeAll()
    --gfx.image.removeAll()
    self.spawnX = 0
    self.spawnY = 0

    --self.player = Player(self.spawnX,self.spawnY)
    
    for layer_name, layer in pairs(ldtk.get_layers(level_name)) do
        if layer.tiles then
            local tilemap = ldtk.create_tilemap(level_name, layer_name)

            local layerSprite = gfx.sprite.new()
            layerSprite:setTilemap(tilemap)
            layerSprite:setCenter(0,0)
            layerSprite:moveTo(0,0)
            layerSprite:setZIndex(layer.zIndex)
            layerSprite:add()

            local emptyTiles = ldtk.get_empty_tileIDs(level_name, "Solid", layer_name)
            if emptyTiles then
                gfx.sprite.addWallSprites(tilemap, emptyTiles)
            end


        end
    end

end
