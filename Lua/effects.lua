--[[

Script to recolor some visual effects.

It works this way:

- Saves the original 'effects' and 'doeffect' functions
- Defines new 'doeffect' function that just stores its parameters
- When calling 'effects', instead build a table with all calls (including new / overwritten ones),
then call the original 'doeffect' function on each table entry.

]]--

if (original_doeffect == nil) then
	original_doeffect = doeffect
	original_effects = effects
	effect_map = {}
end

function effects(timer)
	original_effects(timer)

	doeffect(timer,nil,"win","unlock",1,2,20,{0,3})    -- WIN particles are recolored white
	doeffect(timer,nil,"best","unlock",6,30,2,{0,3})   -- BEST particles are recolored white
	doeffect(timer,nil,"bloody","glow",1,200,2,{2,1})  -- new effect, red tele / bubbling blood
	
	for word3, v in pairs(effect_map) do
		original_doeffect(v.timer, v.word2, word3, v.particle, v.count, v.chance, v.timing, v.colour, v.specialrule, v.layer)
	end
end

function doeffect(timer,word2_,word3,particle,count,chance,timing,colour,specialrule_,layer_)
	effect_map[word3] = {
		timer = timer,
		word2 = word2_,
		particle = particle,
		count = count,
		chance = chance,
		timing = timing,
		colour = colour,
		specialrule = specialrule_,
		layer = layer_,
	}
end