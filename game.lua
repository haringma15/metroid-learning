config = require "config"
spritelist = require "spritelist"

local _M = {}

-- 7E:0A1C - 7E:0A1D    Samus's current position/state
-- 7E:0AF6 - 7E:0AF7    Samus's X position in pixels
-- 7E:0AF8 - 7E:0AF9    Samus's sub-pixel X position
-- 7E:0AFA - 7E:0AFB    Samus's Y position in pixels
-- 7E:0AFC - 7E:0AFD    Samus's sub-pixel Y position
-- 7E:0AFE - 7E:0AFF    Samus's X radius
-- 7E:0B00 - 7E:0B01    Samus's Y radius
-- 7E:0B02 - 7E:0B03    What kind of collision detection to use for Samus. 03 = below, 02 = above, 01 = right, 00 = left
-- 7E:0B04 - 7E:0B05    Samus's X position on screen (0AF6 - 0911)
-- 7E:0B06 - 7E:0B07    Samus's Y position on screen (0AFA - 0915)
function _M.getPositions()
	marioX = memory.read_s16_le(0x94)
	marioY = memory.read_s16_le(0x96)
		
	local layer1x = memory.read_s16_le(0x1A);
	local layer1y = memory.read_s16_le(0x1C);
		
	_M.screenX = marioX-layer1x
	_M.screenY = marioY-layer1y
end

-- 7E:09C2 - 7E:09C3    Samus's health
function _M.getHealth()
	local health = memory.readbyte(0x09C2)
	return health
end

-- 7E:09C6 - 7E:09C7    Samus's missiles
function _M.getScore()
	local scoreLeft = memory.read_s16_le(0x0F34)
	local scoreRight = memory.read_s16_le(0x0F36)
	local score = ( scoreLeft * 10 ) + scoreRight
	return score
end

-- 7E:09CA - 7E:09CB    Samus's super missiles

-- 7E:09CE - 7E:09CF    Samus's power bombs

-- 7E:09D6 - 7E:09D7    Samus's reserve tanks

function _M.getLives()
	local lives = memory.readbyte(0x0DBE) + 1
	return lives
end

function _M.writeLives(lives)
	memory.writebyte(0x0DBE, lives - 1)
end

function _M.getPowerup()
	local powerup = memory.readbyte(0x0019)
	return powerup
end

function _M.writePowerup(powerup)
	memory.writebyte(0x0019, powerup)
end


function _M.getMarioHit(alreadyHit)
	local timer = memory.readbyte(0x1497)
	if timer > 0 then
		if alreadyHit == false then
			return true
		else
			return false
		end
	else
		return false
	end
end

function _M.getMarioHitTimer()
	local timer = memory.readbyte(0x1497)
	return timer
end

function _M.getTile(dx, dy)
	x = math.floor((marioX+dx+8)/16)
	y = math.floor((marioY+dy)/16)
		
	return memory.readbyte(0x1C800 + math.floor(x/0x10)*0x1B0 + y*0x10 + x%0x10)
end

function _M.getSprites()
	local sprites = {}
	for slot=0,11 do
		local status = memory.readbyte(0x14C8+slot)
		if status ~= 0 then
			spritex = memory.readbyte(0xE4+slot) + memory.readbyte(0x14E0+slot)*256
			spritey = memory.readbyte(0xD8+slot) + memory.readbyte(0x14D4+slot)*256
			sprites[#sprites+1] = {["x"]=spritex, ["y"]=spritey, ["good"] = spritelist.Sprites[memory.readbyte(0x009e + slot) + 1]}
		end
	end		
		
	return sprites
end

function _M.getExtendedSprites()
	local extended = {}
	for slot=0,11 do
		local number = memory.readbyte(0x170B+slot)
		if number ~= 0 then
			spritex = memory.readbyte(0x171F+slot) + memory.readbyte(0x1733+slot)*256
			spritey = memory.readbyte(0x1715+slot) + memory.readbyte(0x1729+slot)*256
			extended[#extended+1] = {["x"]=spritex, ["y"]=spritey, ["good"]  =  spritelist.extSprites[memory.readbyte(0x170B + slot) + 1]}
		end
	end		
		
	return extended
end

function _M.getInputs()
	_M.getPositions()
	
	sprites = _M.getSprites()
	extended = _M.getExtendedSprites()
	
	local inputs = {}
	local inputDeltaDistance = {}
	
	local layer1x = memory.read_s16_le(0x1A);
	local layer1y = memory.read_s16_le(0x1C);
	
	
	for dy=-config.BoxRadius*16,config.BoxRadius*16,16 do
		for dx=-config.BoxRadius*16,config.BoxRadius*16,16 do
			inputs[#inputs+1] = 0
			inputDeltaDistance[#inputDeltaDistance+1] = 1
			
			tile = _M.getTile(dx, dy)
			if tile == 1 and marioY+dy < 0x1B0 then
				inputs[#inputs] = 1
			end
			
			for i = 1,#sprites do
				distx = math.abs(sprites[i]["x"] - (marioX+dx))
				disty = math.abs(sprites[i]["y"] - (marioY+dy))
				if distx <= 8 and disty <= 8 then
					inputs[#inputs] = sprites[i]["good"]
					
					local dist = math.sqrt((distx * distx) + (disty * disty))
					if dist > 8 then
						inputDeltaDistance[#inputDeltaDistance] = mathFunctions.squashDistance(dist)
					end
				end
			end

			for i = 1,#extended do
				distx = math.abs(extended[i]["x"] - (marioX+dx))
				disty = math.abs(extended[i]["y"] - (marioY+dy))
				if distx < 8 and disty < 8 then
					inputs[#inputs] = extended[i]["good"]
					local dist = math.sqrt((distx * distx) + (disty * disty))
					if dist > 8 then
						inputDeltaDistance[#inputDeltaDistance] = mathFunctions.squashDistance(dist)
					end
				end
			end
		end
	end
	
	return inputs, inputDeltaDistance
end

function _M.clearJoypad()
	controller = {}
	for b = 1,#config.ButtonNames do
		controller["P1 " .. config.ButtonNames[b]] = false
	end
	joypad.set(controller)
end

return _M