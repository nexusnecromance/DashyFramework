--this file is for storing variables and fast calculations

import "CoreLibs/math"
import "scripts/Player"

class("Var").extends("Player")

--Sonic's Player Variables
Player = {x = 0,
		 y = 0+(240/2),
		 xspeed = 0,
		 yspeed = 0,
		 groundspeed = 0,
		 groundangle = 0,
		 widthrad = 9,
		 heightrad = 19,
		 jumpforce = 6.5,
		 pushradius = 10,
		 isgrounded = false,
		 groundmode = "floor", --four modes: "floor", "rightwall", "ceiling", "leftwall"
		 accelerationspeed = 0.046875*2,
		 decelerationspeed = 0.5*2,
		 friction = 0.046875*2,
		 topspeed = 6*2,
		 gravityforce = 0.21875*2
		 }




--A list of Sine and Cosine values for fast calculations
sincoslist = {0,6,12,18,25,31,37,43,49,56,62,68,74,80,86,92,97,103,109,115,120,126,131,136,142,147,152,157,162,167,171,176,181,185,189,193,197,201,205,209,212,216,219,222,225,228,231,234,236,238,241,243,244,246,248,249,251,252,253,254,254,255,255,255,
256,255,255,255,254,254,253,252,251,249,248,246,244,243,241,238,236,234,231,228,225,222,219,216,212,209,205,201,197,193,189,185,181,176,171,167,162,157,152,147,142,136,131,126,120,115,109,103,97,92,86,80,74,68,62,56,49,43,37,31,25,18,12,6,
0,-6,-12,-18,-25,-31,-37,-43,-49,-56,-62,-68,-74,-80,-86,-92,-97,-103,-109,-115,-120,-126,-131,-136,-142,-147,-152,-157,-162,-167,-171,-176,-181,-185,-189,-193,-197,-201,-205,-209,-212,-216,-219,-222,-225,-228,-231,-234,-236,-238,-241,-243,-244,-246,-248,-249,-251,-252,-253,-254,-254,-255,-255,-255,
-256,-255,-255,-255,-254,-254,-253,-252,-251,-249,-248,-246,-244,-243,-241,-238,-236,-234,-231,-228,-225,-222,-219,-216,-212,-209,-205,-201,-197,-193,-189,-185,-181,-176,-171,-167,-162,-157,-152,-147,-142,-136,-131,-126,-120,-115,-109,-103,-97,-92,-86,-80,-74,-68,-62,-56,-49,-43,-37,-31,-25,-18,-12,-6}
--Returns a sine value from -256 to 255 (this is done for precision in the original game, divide the result by 256 to get a typical -1 to 1 decimal result)
function angle_hex_sin(hex_ang)
	list_index = hex_ang%256
	return sincoslist[list_index]
end
--Returns a cosine value from -256 to 255 (this is done for precision in the original game, divide the result by 256 to get a typical -1 to 1 decimal result)
function angle_hex_cos(hex_ang)
	list_index = (hex_ang + 64)%256
	return sincoslist[list_index]
end
--Hex angles, used for specific calculations
anglelist = {0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,6,6,6,6,6,6,6,7,7,7,7,7,7,8,8,8,8,8,8,8,9,9,9,9,9,9,10,10,10,10,10,10,10,11,11,11,11,11,11,11,12,12,12,12,12,12,12,13,13,13,13,13,13,13,14,14,14,14,14,14,14,15,15,15,15,15,15,15,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,0}
--Returns a hex angle representing a direction from one point to another. 
--Effectively, these points are represented by [0, 0] and [xdist, ydist]
function angle_hex_point_direction(xdist, ydist)
	--Default
	if (xdist == 0) and (ydist == 0) then return 64 end
		
	--Force positive
	xx = math.abs(xdist)
	yy = math.abs(ydist)
		
	angle = 0;
		
	--Get initial angle
	if yy >= xx then
		compare = (xx * 256)/yy
		angle = 64 - anglelist[compare]
	else
		compare = (yy * 256)/xx
		angle = anglelist[compare]
    end
		
	--Check angle
	if xdist <= 0 then
		angle = -angle;
		angle += 128;
    end
	if ydist <= 0 then
		angle = -angle
		angle += 256
    end
		
	return angle
end

--Returns a degree angle converted from a hex angle
function angle_hex_to_degrees(hex_ang)
	return ((256 - hex_ang)/256)*360;
end
--Returns a hex angle converted from a degree angle
function angle_degrees_to_hex(deg_ang)
	return floor(((360 - deg_ang)/360)*256);
end

--I took all of this from the Physics guide, but I understand how it all works... I think