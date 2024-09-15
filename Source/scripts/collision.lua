--The collision funcion for object terrain
import "CoreLibs/graphics"
import "CoreLibs/sprites"

--import libraries
import "scripts/libraries/LDtk"

local pd <const> = playdate
local gfx <const> = pd.graphics

function enginecollision(obj,sensor,ID)
    collide=false

	--obj=tbl(needs x,y,w,h)
	local x=obj.x
	local y=obj.y
	local w=obj.widthrad
	local h=obj.heightrad
	local p=obj.pushradius
	local g=obj.groundangle
	local m=obj.groundmode

	--collision box local vars
	local anchorx=0
	local anchory=0
	local linex=0
	local liney=0

	if     sensor=="a" then
		if m=="floor" then
			anchorx=x-w
			anchory=y+h

			linex=x-w
			liney=y
		elseif m=="rightwall" then

		elseif m=="ceiling" then

		elseif m=="leftwall" then

		end
	elseif sensor=="b" then
		if m=="floor" then
			anchorx=x+w
			anchory=y+h

			linex=x+w
			liney=y
		elseif m=="rightwall" then

		elseif m=="ceiling" then

		elseif m=="leftwall" then
			
		end
	elseif sensor=="c" then
		if m=="floor" then
			anchorx=x-w
			anchory=y-h
		elseif m=="rightwall" then

		elseif m=="ceiling" then

		elseif m=="leftwall" then
			
		end
	elseif sensor=="d" then
		if m=="floor" then
			anchorx=x+w
			anchory=y-h
		elseif m=="rightwall" then

		elseif m=="ceiling" then

		elseif m=="leftwall" then
			
		end
	elseif sensor=="e" then
		if m=="floor" then
			anchorx=x-p
			if (g==0) then anchory=obj.y+8 else anchory=obj.y end
		elseif m=="rightwall" then

		elseif m=="ceiling" then

		elseif m=="leftwall" then
			
		end
	elseif sensor=="f" then
		if m=="floor" then
			anchorx=x+p
			if (g==0) then anchory=y+8 else anchory=y end
		elseif m=="rightwall" then

		elseif m=="ceiling" then

		elseif m=="leftwall" then
			
		end
	end

	gfx.sprite:updatesEnabled()

	gfx.sprite:setCollideRect(pd.geometry.rect.new(anchorx, anchory, linex, liney))
	
	if gfx.sprite:alphaCollision(gfx.tilemap:getTiles(ID))==true then
		collide=true
	else
		collide=false
	end

	return collide
end