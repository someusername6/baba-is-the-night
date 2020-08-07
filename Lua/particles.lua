--[[

Script to add new particle effects.

It adds new entries to the 'particletypes' table, without erasing existing ones.

]]--

-- Add elements only if they are not available yet
if (particletypes["red dust"] == nil) then
	particletypes["red dust"] = {
			amount = 50,
			animation = 1,
			colour = {2, 0},
			extra = 
				function(unitid)
					local unit = mmf.newObject(unitid)
					
					unit.values[YVEL] = math.random(-3,-1)
					
					unit.scaleX = unit.values[YVEL] * -0.363
					unit.scaleY = unit.values[YVEL] * -0.363
				end,
		}
		
	particletypes["golden leaves"] = {
			amount = 10,
			animation = {9, 10},
			colour = {0, 3},
			extra = 
				function(unitid)
					local unit = mmf.newObject(unitid)
					
					if (math.random(1,4) == 1) then
						MF_setcolour(unitid,2,4)
						
						unit.strings[COLOUR] = tostring(2) .. "," .. tostring(4)
					end
					
					local size = math.random(3,6)
					unit.scaleX = size * 0.2
					unit.scaleY = size * 0.2
					
					unit.values[XVEL] = math.random(-30,-10) * 0.2
					unit.values[YVEL] = math.random(0,10) * 0.1
					unit.flags[INFRONT] = true
				end,
		}
		
	particletypes["golden leaflets"] = {
			amount = 10,
			animation = {9, 10},
			colour = {0, 3},
			extra = 
				function(unitid)
					local unit = mmf.newObject(unitid)
					
					if (math.random(1,4) == 1) then
						MF_setcolour(unitid,2,4)
						
						unit.strings[COLOUR] = tostring(2) .. "," .. tostring(4)
					end
					
					local size = math.random(3,6)
					unit.scaleX = size * 0.1
					unit.scaleY = size * 0.1
					
					unit.values[XVEL] = math.random(-30,-10) * 0.1
					unit.values[YVEL] = math.random(0,10) * 0.05
					unit.flags[INFRONT] = true
				end,
		}

	particletypes["purple clouds"] = {
		amount = 100,
		animation = 2,
		colour = {3, 0},
		extra = 
			function(unitid)
				local unit = mmf.newObject(unitid)
				
				unit.scaleX = 2 + math.random(-30,30) * 0.02
				unit.scaleY = unit.scaleX * 0.45
				
				unit.values[YVEL] = 0
				unit.values[XVEL] = unit.scaleX * 0.2
			end,
		}
end