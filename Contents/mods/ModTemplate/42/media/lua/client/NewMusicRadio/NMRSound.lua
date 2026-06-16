NMRSound = {
    	emitter = nil,
    	id = nil,
    	x = 0,
    	y = 0,
    	z = 0,
    	volume = 1,
    	volumeModifier = 1,
    	sound3D = false,
}

function NMRSound:new()
    	local o = {}
	setmetatable(o, self)
    	self.__index = self
	return o
end

function NMRSound:setEmitter(emitter)
    	self.emitter = emitter
end

function NMRSound:play(sound)
    	local hasEmitter = self.emitter
    	local hadId = self.id

    	if hasEmitter then
        	self:stop()
    	else
        	self.emitter = IsoWorld.instance:getFreeEmitter()
        	self.emitter:setPos(self.x, self.y, self.z)
    	end
    	local gameSound = GameSounds.getSound(sound)
    	local gameSoundClip = gameSound:getRandomClip()
    	self.id = self.emitter:playClip(gameSoundClip, nil)
    	self.emitter:setVolume(self.id, self.volume * self.volumeModifier)
    	self.emitter:set3D(self.id, self.sound3D)
    	self.emitter:tick()
end

function NMRSound:stop()
    	if self.emitter and self.id then
        	self.emitter:stopSound(self.id)
    	end
    	self.id = nil
end

function NMRSound:isPlaying()
    	if not self.id then 
		return false 
	end
    	return self.emitter and self.emitter:isPlaying(self.id)
end

function NMRSound:setVolume(value)
    	self.volume = value
    	if self.id then
        	self.emitter:setVolume(self.id, self.volume * self.volumeModifier)
        	self.emitter:tick()
    	end
end
function NMRSound:setVolumeModifier(value)
    	self.volumeModifier = value
    	if self.id then
        	self:setVolume(self.volume)
    	end
end

function NMRSound:setPos(x,y,z)
    	self.x = x
    	self.y = y
    	self.z = z or 0
    	self:set3D(true)
    
    	if self.emitter then
        	self.emitter:setPos(x, y, z)
        	self.emitter:tick()
    	end
end

function NMRSound:setPosAtObject(obj)
    	if not obj then 
		return 
	end
    	self:setPos(obj:getX(), obj:getY(), obj:getZ())
end

function NMRSound:set3D(bool)
    	if bool == nil then 
		bool = true 
	end
    	self.sound3D = bool
    	if self.id then
        	self.emitter:set3D(self.id, self.sound3D)
        	self.emitter:tick()
    	end
end