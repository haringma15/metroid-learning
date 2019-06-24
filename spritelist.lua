local _M = {}

_M.Sprites = {}

-- Neutral stuff; does not affect score (needs to be sorted)
_M.NeutralSprites = {
				0xB6D3,		-- Mapping Station
				0xB6DF,		-- Energy Refill Station
				0xB6EB,		-- Missile Refill Station
				0xB76F,		-- Save Station
				0xBAF4,		-- Special Grey Door, pointing right
				0xC826,		-- Normal opened Gate
				0xC82A,		-- Closed Gate of some machine
				0xC82E,		-- Upside down opened Gate
				0xC832,		-- Upside down closed Gate
				0xC836,		-- Gate control
				0xC83A,		-- Upside down Gate control
				0xC842,		-- Grey Door Shell, pointing left
				0xC848,		-- Grey Door Shell, pointing right
				0xC84E,		-- Grey Door Shell on floor
				0xC854,		-- Grey Door Shell on ceiling
				0xC85A,		-- Yellow Door Shell, pointing left
				0xC860,		-- Yellow Door Shell, pointing right
				0xC866,		-- Yellow Door Shell on floor
				0xC86C,		-- Yellow Door Shell on ceiling
				0xC872,		-- Green Door Shell, pointing left
				0xC878,		-- Green Door Shell, pointing right
				0xC87E,		-- Green Door Shell on floor
				0xC884,		-- Green Door Shell on ceiling
				0xC88A,		-- Pink Door Shell, pointing left
				0xC890,		-- Pink Door Shell, pointing right
				0xC896,		-- Pink Door Shell on floor
				0xC89C,		-- Pink Door Shell on ceiling
				0xC8CA,		-- Closed Gate
				0xD07F,		-- Upper half of Samus' ship
				0xD0BF,		-- Lower half of Samus' ship
				0xD0FF,		-- Probably something that belongs to Samus' ship (could also be an enemy, really not sure)
				0xD6EA,		-- Crumbling Chozo
				0xD70C,		-- Upper left corner of the glass tube in Maridia
				0xDB48,		-- Eye Door Piece, eye looking right
				0xDB4C,		-- Eye Door Piece, pointing top right
				0xDB52,		-- Eye Door Piece, pointing bottom right
				0xDB56,		-- Eye Door Piece, eye looking left
				0xDB5A,		-- Eye Door Piece, pointing top left
				0xDB60,		-- Eye Door Piece, pointing bottom left
				0xDF59,		-- Electrical Outlet, pointing left
				0xDF5D,		-- Diagonal Electrical Outlet, pointing bottom right
				0xDF61,		-- Diagonal Electrical Outlet, pointing top right
				0xDF69,		-- Broken Diagonal Electrical Outlet, pointing bottom right
				0xDF6D,		-- Broken Diagonal Electrical Outlet, pointing top right
				0xDF71,		-- Electrical Outlet, pointing right
				0xDF75,		-- Diagonal Electrical Outlet, pointing bottom left
				0xDF79,		-- Diagonal Electrical Outlet, pointing top left
				0xDF81,		-- Broken Diagonal Electrical Outlet, pointing bottom left
				0xDF85		-- Broken Diagonal Electrical Outlet, pointing top left
			}

-- Good stuff; affects the score positively (needs to be sorted)
_M.GoodSprites = {
				0xEED7,		-- Energy item
				0xEEDB,		-- Missile Item
				0xEEDF,		-- Item
				0xEEE3,		-- Item
				0xEEE7,		-- Item
				0xEEEB,		-- Item
				0xEEEF,		-- Item
				0xEEF3,		-- Item
				0xEEF7,		-- Item
				0xEEFB,		-- Item
				0xEEFF,		-- Item
				0xEF03,		-- Item
				0xEF07,		-- Item
				0xEF0B,		-- Item
				0xEF0F,		-- Item
				0xEF13,		-- Item
				0xEF17,		-- Item
				0xEF1B,		-- Item
				0xEF1F,		-- Item
				0xEF23,		-- Item
				0xEF27,		-- Item
				0xEF2B,		-- Energy Item in Chozo ball
				0xEF2F,		-- Missile Item in Chozo ball
				0xEF33,		-- Item in Chozo ball
				0xEF37,		-- Item in Chozo ball
				0xEF3B,		-- Item in Chozo ball
				0xEF3F,		-- Item in Chozo ball
				0xEF43,		-- Item in Chozo ball
				0xEF47,		-- Item in Chozo ball
				0xEF4B,		-- Item in Chozo ball
				0xEF4F,		-- Item in Chozo ball
				0xEF53,		-- Item in Chozo ball
				0xEF57,		-- Item in Chozo ball
				0xEF5B,		-- Item in Chozo ball
				0xEF5F,		-- Item in Chozo ball
				0xEF63,		-- Item in Chozo ball
				0xEF67,		-- Item in Chozo ball
				0xEF6B,		-- Item in Chozo ball
				0xEF6F,		-- Item in Chozo ball
				0xEF73,		-- Item in Chozo ball
				0xEF77,		-- Item in Chozo ball
				0xEF7B,		-- Item in Chozo ball
				0xEF7F,		-- Energy Item hidden in scenery
				0xEF83,		-- Missile Item hidden in scenery
				0xEF87,		-- Item hidden in scenery
				0xEF8B,		-- Item hidden in scenery
				0xEF8F,		-- Item hidden in scenery
				0xEF93,		-- Item hidden in scenery
				0xEF97,		-- Item hidden in scenery
				0xEF9B,		-- Item hidden in scenery
				0xEF9F,		-- Item hidden in scenery
				0xEFA3,		-- Item hidden in scenery
				0xEFA7,		-- Item hidden in scenery
				0xEFAB,		-- Item hidden in scenery
				0xEFAF,		-- Item hidden in scenery
				0xEFB3,		-- Item hidden in scenery
				0xEFB7,		-- Item hidden in scenery
				0xEFBB,		-- Item hidden in scenery
				0xEFBF,		-- Item hidden in scenery
				0xEFC3,		-- Item hidden in scenery
				0xEFC7,		-- Item hidden in scenery
				0xEFCB,		-- Item hidden in scenery
				0xEFCF		-- Item hidden in scenery
			}

-- Bad stuff; affects the score negatively (needs to be sorted)
_M.BadSprites = {
				0xB70B,		-- Elevator Base
				0xCEBF,		-- BOYON (slime alike enemy)
				0xCEFF,		-- STOKE (dinosaur)
				0xCF3F,		-- KAME (big turtle)
				0xCF7F,		-- Turtle that ducks into its shell when jumped on
				0xCFBF,		-- PUYO (tentacle)
				0xCFFF,		-- SABOTEN (plant alike enemy)
				0xD03F,		-- TOGE (spiky helmet)
				0xD13F,		-- Fireplace?
				0xD17F,		-- Pin eye?
				0xD1BF,		-- MULTI (fireball)
				0xD1FF,		-- Falling rocks?
				0xD23F,		-- RINKA (ring of fire?)
				0xD27F,		-- Crab beetle? Beetle crab?
				0xD2BF,		-- Rocket jellyfish?
				0xD2FF,		-- Bat?
				0xD33F,		-- Dolphin bird
				0xD37F,		-- OUM (rolled up caterpillar)
				0xD3BF,		-- HIRU (manta ray)
				0xD3FF,		-- RIPPER2 (green-ish rocket turtle?)
				0xD43F,		-- RIPPER2 (red rocket turtle)
				0xD47F,		-- RIPPER (brown turtle beetle)
				0xD4BF,		-- DRAGON (Possessor type A)
				0xD4FF,		-- SHUTTER (gate?)
				0xD53F,		-- SHUTTER2 (gate?)
				0xD57F,		-- SHUTTER2 (horizontal gate?)
				0xD5BF,		-- SHUTTER2 (another ate?)
				0xD5FF,		-- SHUTTER2 (something that pushes you through floor)
				0xD63F,		-- WAVER (tipex)
				0xD67F,		-- Spiral drop beetle
				0xD6BF,		-- HOTARY (Fly?)
				0xD6DE,		-- Upper right corner of mother brains glass
				0xD6FF,		-- FISH
				0xD73F,		-- it's an elevator
				0xD77F,		-- KANI (big crab)
				0xD7BF,		-- OUMU (caterpillar?)
				0xD7FF,		-- KAMER (mecha bird?)
				0xD83F,		-- KAMER (corrupt mapping station?)
				0xD87F,		-- SBUG (glitch fly)
				0xD8BF,		-- SBUG (never used)
				0xD8FF,		-- Metroid
				0xD93F,		-- SSIDE (stronger two legged beetle)
				0xD97F,		-- SDEATH (fat two legged beetle)
				0xD9BF,		-- SIDE (beetle, no power)
				0xD9FF,		-- SIDE (beetle, with power)
				0xDA3F,		-- DESGEEGA (stronger fat two legged beetle)
				0xDA7F,		-- Flying beetle
				0xDABF,		-- DESGEEGA (blue ball)
				0xDAFF,		-- Metroid without AI
				0xDB3F,		-- BANG (Possessor Type C)
				0xDB7F,		-- Spiral drop bat
				0xDBBF,		-- Yard (snail with shell)
				0xDBFF,		-- REFLEC (enemy that shoots projectiles back. never used)
				0xDC3F,		-- HZOOMER (slimey flower)
				0xDC7F,		-- ZEELA (thing with big eyes)
				0xDCBF,		-- NOVA (phoenix)
				0xDCFF,		-- ZOOMER (Xelalotl)
				0xDD3F,		-- MZOOMER (grey Xelalotl)
				0xDD7F,		-- Green big metroid
				0xDDBF,		-- Crocomire
				0xDDFF,		-- Crocomire skeleton
				0xDE3F,		-- Draygon's Body
				0xDE7F,		-- Draygon's Eye
				0xDEBF,		-- Draygon's Tail
				0xDEFF,		-- Draygon's Arms
				0xDF3F,		-- Spore spawn of a boss
				0xDF7F,		-- Spore spawn of a boss, but darker
				0xDFBF,		-- RSTONE (stone that falls down from the ceiling)
				0xDFFF,		-- KZAN (spikey flying platofrm)
				0xE03F,		-- Connection to KZAN
				0xE07F,		-- HIBASHI (Possessor Type A)
				0xE0BF,		-- PUROMI (beads)
				0xE0FF,		-- lil Kraid
				0xE13F,		-- Ceres Ridley
				0xE17F,		-- Ridley
				0xE1BF,		-- Ridley (front)
				0xE1FF,		-- Jellyfish?
				0xE23F,		-- Door?
				0xE27F,		-- Zebetites (maybe spawns enemies)
				0xE2BF,		-- Kraid
				0xE2FF,		-- Kraid's arm
				0xE33F,		-- Spikey foot?
				0xE37F,		-- Foot spikey?
				0xE3BF,		-- A spikey foot?
				0xE3FF,		-- An actual foot?
				0xE43F,		-- A claw?
				0xE47F,		-- Another spikey foot?
				0xE4BF,		-- Phantoon main
				0xE4FF,		-- Phantoon pieces
				0xE53F,		-- Phantoon Pieces 2
				0xE57F,		-- Phantoon Pieces 3
				0xE5BF,		-- Kill the animals mammal
				0xE5FF,		-- Kill the animal bird (Possessor Type B)
				0x563F,		-- EBI (Possessor Type B)
				0xE67F,		-- EBI attachment
				0xE6BF,		-- EYE (round wall camera)
				0xE6FF,		-- FUNE (morbol)
				0xE73F,		-- NAMI (alien head)
				0xE77F,		-- Amalgamation of Terror and Disgust
				0xE7BF,		-- HAND (not an actual hand)
				0xE7FF,		-- KAGO (trypophobia example)
				0xE83F,		-- LAVAMAN (Possessor Type ?)
				0xE87F,		-- Chozo insect?
				0xE8BF,		-- PUU (Possessor Type ?)
				0xE8FF,		-- ROBO (training dummy)
				0xE93F,		-- ROBO (fatter training dummy)
				0xE97F,		-- PIPE (virus)
				0xE9BF,		-- Seahorse
				0xE9FF,		-- ATOMIC (blown up frog)
				0xEA3F,		-- SPA (sparkling virus)
				0xEA7F,		-- KOMA (blue ape skull)
				0xEABF,		-- HACHI1 (flying gorilla)
				0xEAFF,		-- HACHI1's wings
				0xEB3F,		-- HACHI2 (flying insect)
				0xEB7F,		-- HACHI2's wings
				0xEBBF,		-- HACHI3 (flying insect-gorilla)
				0xEBFF,		-- HACHI3's wings
				0xEC3F,		-- Mother Brain Part 1
				0xEC7F,		-- Mother Brain Part 2
				0xECBF,		-- Large Metroid
				0xECFF,		-- Mother Brain's moving parts
				0xED3F,		-- Chozo
				0xED7F,		-- Hopper remains
				0xEDBF,		-- Unusable Enemy, makes Hopper remains function properly
				0xEDFF,		-- Spikey turtle
				0xEE3F,		-- Armadillo
				0xEE7F,		-- Thin spiral-drop bat
				0xEEBF,		-- The big metroid
				0xEEFF,		-- Grey Torizo
				0xEF3F,		-- Projectile of Grey Torizo
				0xEF7F,		-- Yellow Torizo
				0xEFBF,		-- Projectile of Yellow Torizo
				0xEFFF,		-- Screaming head
				0xF03F,		-- Yellow Ridley statue
				0xF07F,		-- DORI (two armed / no legged thing)
				0xF0BF,		-- Shattering shards of Maridia Tube
				0xF0FF,		-- Yellow space pirate?
				0xF153,		-- Mini-Oub?
				0xF193,		-- ZEB (sword beetle)
				0xF1D3,		-- ZEBBO (lil wasp)
				0xF213,		-- GAMET (has 5 pieces)
				0xF253,		-- GEEGA (unidentifiable object)
				0xF293,		-- BOTOON (worm)
				0xF2D3,		-- Kill the animals mammal, again
				0xF313,		-- Kill the animals bird, again
				0xF353,		-- BATTA1 (Climbing pirate of Crateria)
				0xF393,		-- BATTA1Br (Climbing pirate of Brinstar)
				0xF3D3,		-- BATTA1No (Climbing pirate of Norfair)
				0xF413,		-- BATTA1Na (Climbing pirate of Lower Norfair)
				0xF453,		-- BATTA1Ma (Climbing pirate of Maridia)
				0xF493,		-- BATTA1Tu	(Climbing pirate of Tourian)
				0xF4D3,		-- BATTA2 (Fighting pirate of Crateria)
				0xF513,		-- BATTA2Br (Fighting pirate of Brinstar)
				0xF553,		-- BATTA2No (Fighting pirate of Norfair)
				0xF593,		-- BATTA2Na (Fighting pirate of Lower Norfair)
				0xF5D3,		-- BATTA2Ma (Fighting pirate of Maridia)
				0xF613,		-- BATTA2Tu (Fighting priate of Tourian)
				0xF653,		-- BATTA3 (Shooting pirate of Crateria)
				0xF693,		-- BATTA3Br (Shooting pirate of Brinstar)
				0xF6D3,		-- BATTA3No (Shooting pirate of Norfair)
				0xF713,		-- BATTA3Na (Shooting pirate of Lower Norfair)
				0xF753,		-- BATTA3Ma (Shooting pirate of Maridia)
				0xF793		-- BATTA3Tu (Shooting pirate of Tourian)
			}

function _M.InitSpriteList()
    local k = 1
    local j = 1
    for i=1, 256 do
        local isGood = (k <= #_M.GoodSprites) and (_M.GoodSprites[k] == i - 1)
        local isNeutral = (j <= #_M.NeutralSprites) and (_M.NeutralSprites[j] == i - 1)
        if isGood then
            k = k + 1
            _M.Sprites[#_M.Sprites + 1] = 1
        elseif isNeutral then
            j = j + 1
            _M.Sprites[#_M.Sprites + 1] = 0
        else
            _M.Sprites[#_M.Sprites + 1] = -1
        end
    end
end

_M.extSprites = {}

-- Stuff that spawns but does not affect score
_M.ExtNeutralSprites = {
    0xB63B,		-- Continuation PLM right
	0xB63F,		-- Continuation PLM left
	0xB643,		-- Continuation PLM down
	0xB647,		-- Continuation PLM up
	0xB703		-- Scroll PLM
}

-- Stuff that spawns and negatively affects score
_M.ExtBadSprites = {
    0xB8AC,		-- Rising Lava
	0xDF65,		-- Electrical Outlet Charge, left
	0xDF7D		-- Electrical Outlet Charge, right
}

function _M.InitExtSpriteList()
    local j = 1
    for i=1, 21 do
        local isExtNeutral = (j <= #_M.ExtNeutralSprites) and (_M.ExtNeutralSprites[j] == i - 1)
        if isExtNeutral then
            j = j + 1
            _M.extSprites[#_M.extSprites + 1] = 0
        else
            _M.extSprites[#_M.extSprites + 1] = -1
        end
    end
end

return _M