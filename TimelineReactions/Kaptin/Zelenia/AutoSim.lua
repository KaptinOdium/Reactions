local tbl = 
{
	
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "-- Shared SAM/VPR encounter forecast. Deathless SAM baseline:\n-- 20261007-2159-1271-3 (420.015s); VPR2208 corroborates ~7m (418.469s).\n-- Orb damage remains normal uptime. Only the gap after the last orb dies\n-- is FullDowntime. The 5% buff forecast represents the observed DNC window,\n-- not every party buff. Verify this trial with the next SAM/VPR clear.\nlocal api = TensorCore.API.TensorACR\nlocal s = {orbEnd = 143.859, back = 147.547, stage = 0, orbs = {}}\nfunction s.apply()\n    api.setAutoSimKillTime(s.back + 272.468)\n    api.clearAutoSimPhases(\"FullDowntime\")\n    api.clearAutoSimPhases(\"RaidBuff\")\n    if s.back > s.orbEnd then\n        api.addAutoSimPhase(\"FullDowntime\", s.orbEnd, s.back)\n    end\n    api.addAutoSimPhase(\"RaidBuff\", 7.484, 27.484, 1.05)\n    for cycle = 0, 2 do\n        -- Project ordinary 120s repeats, not the clear's unusually late\n        -- fourth party burst just before the kill.\n        local a = s.back + 8.281 + 120 * cycle\n        api.addAutoSimPhase(\"RaidBuff\", a, a + 20, 1.05)\n    end\nend\nfunction s.finish(t)\n    s.orbEnd = math.min(s.orbEnd, t)\n    s.back, s.stage = t, 4\n    s.apply()\nend\ns.apply()\ndata.kaptinZeleniaAutoSim = s\nself.used = true\n",
							conditions = 
							{
								
								{
									"c4e35f67-0712-55f2-bf22-2cbc182659a1",
									true,
								},
							},
							name = "[AutoSim] Zelenia clear and orb forecast",
							uuid = "ed2a806c-d728-f540-b964-ae476a5ccb7d",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 14,
							dequeueIfLuaFalse = true,
							jobIDList = 
							{
								34,
								41,
							},
							name = "Samurai or Viper",
							uuid = "c4e35f67-0712-55f2-bf22-2cbc182659a1",
							version = 3,
						},
					},
				},
				eventType = 16,
				loop = true,
				mechanicTime = 11.4,
				name = "[AutoSim] Zelenia clear and orb forecast",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = -11.4,
				timerStartOffset = -71.4,
				uuid = "b5cb594a-b76c-c69c-9e72-5542e52490bc",
				version = 2,
			},
		},
	}, 
	[15] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "-- Main boss content/model gates are native/linked conditions.\nlocal s = data.kaptinZeleniaAutoSim\nlocal t = TensorCore.API.TensorACR.getAutoSimTime()\ns.bossID = eventArgs.entityID\nif s.stage == 0 and not eventArgs.isTargetable and t >= 85 and t < 115 then\n    s.orbEnd, s.back = t + 48.546, t + 52.234\n    s.stage = 1\n    s.apply()\nelseif s.stage > 0 and s.stage < 4 and eventArgs.isTargetable then\n    -- The actual return supersedes all estimated orb/travel durations.\n    s.finish(t)\nend\nself.used = true\n",
							conditions = 
							{
								
								{
									"86cb5800-cf8a-cfc5-a02f-b5fe5a8585a4",
									true,
								},
								
								{
									"15e4da1b-1137-e4f0-bdfb-da2742627cf1",
									true,
								},
								
								{
									"528d038d-4429-c879-8d91-df940bd18d42",
									true,
								},
								
								{
									"c8a165f6-4ad8-a7fd-beda-2e6356a59069",
									true,
								},
							},
							name = "[AutoSim] Follow Zelenia departure and return",
							uuid = "28917e0e-5d11-08c4-87b7-04aa5bdf6433",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 14,
							dequeueIfLuaFalse = true,
							jobIDList = 
							{
								34,
								41,
							},
							name = "Samurai or Viper",
							uuid = "86cb5800-cf8a-cfc5-a02f-b5fe5a8585a4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 13861,
							name = "Zelenia",
							uuid = "15e4da1b-1137-e4f0-bdfb-da2742627cf1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return Argus.getEntityModel(eventArgs.entityID) == 18374",
							dequeueIfLuaFalse = true,
							name = "Main model",
							uuid = "528d038d-4429-c879-8d91-df940bd18d42",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinZeleniaAutoSim\nreturn s~=nil and s.stage<4",
							name = "Forecast active",
							uuid = "c8a165f6-4ad8-a7fd-beda-2e6356a59069",
							version = 3,
						},
					},
				},
				eventType = 26,
				loop = true,
				mechanicTime = 93.5,
				name = "[AutoSim] Follow Zelenia departure and return",
				timeRange = true,
				timelineIndex = 15,
				timerEndOffset = 126.5,
				timerStartOffset = -13.5,
				uuid = "aeaa4c70-d4a9-792c-bf1e-8c0338b9e767",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinZeleniaAutoSim\nlocal t = TensorCore.API.TensorACR.getAutoSimTime()\nlocal id = eventArgs.entityID\nif eventArgs.isTargetable then\n    s.orbs[id] = true\n    if s.stage < 2 then\n        s.orbEnd, s.back = t + 48.296, t + 51.984\n        s.stage = 2\n        s.apply()\n    end\nelseif s.orbs[id] ~= nil then\n    s.orbs[id] = false\n    s.firstOrbDeath = true\nend\nif s.stage == 2 then\n    local count, active = 0, 0\n    for _, live in pairs(s.orbs) do\n        count = count + 1\n        if live then active = active + 1 end\n    end\n    if count >= 4 and active == 0 then\n        -- Faster orb kills do not necessarily bring the boss back sooner.\n        -- Keep the scheduled return until its real event supersedes it.\n        s.orbEnd, s.back, s.stage = t, math.max(s.back, t + 3.688), 3\n        s.apply()\n    end\nend\nself.used = true\n",
							conditions = 
							{
								
								{
									"f6492bbd-b50c-a136-8d64-b522e85bffde",
									true,
								},
								
								{
									"951295bf-57f6-096a-ba6f-3a0b2d915fc4",
									true,
								},
								
								{
									"5ccd18f1-3495-7ec0-8e36-4b1554c3a8e6",
									true,
								},
								
								{
									"4cefd915-c792-42d4-b752-c97aa5e55c1d",
									true,
								},
							},
							name = "[AutoSim] Follow four Roseblood Drops",
							uuid = "ab41086a-4d58-c646-9a4c-a088ff34dad4",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 14,
							dequeueIfLuaFalse = true,
							jobIDList = 
							{
								34,
								41,
							},
							name = "Samurai or Viper",
							uuid = "f6492bbd-b50c-a136-8d64-b522e85bffde",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 13860,
							name = "Roseblood Drop",
							uuid = "951295bf-57f6-096a-ba6f-3a0b2d915fc4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return Argus.getEntityModel(eventArgs.entityID) == 18370",
							dequeueIfLuaFalse = true,
							name = "Main model",
							uuid = "5ccd18f1-3495-7ec0-8e36-4b1554c3a8e6",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinZeleniaAutoSim\nreturn s~=nil and s.stage<4",
							name = "Forecast active",
							uuid = "4cefd915-c792-42d4-b752-c97aa5e55c1d",
							version = 3,
						},
					},
				},
				eventType = 26,
				loop = true,
				mechanicTime = 93.5,
				name = "[AutoSim] Follow four Roseblood Drops",
				timeRange = true,
				timelineIndex = 15,
				timerEndOffset = 126.5,
				timerStartOffset = -13.5,
				uuid = "9ab44301-bd8a-112c-a9c2-f80681c6c1f7",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "-- 250ms recovery during this one add phase, using cached IDs only.\nlocal s = data.kaptinZeleniaAutoSim\nlocal t = TensorCore.API.TensorACR.getAutoSimTime()\nlocal boss = s.bossID and TensorCore.mGetEntity(s.bossID)\nif boss and boss.alive and boss.targetable and boss.attackable then\n    s.finish(t)\n    self.used = true\n    return\nend\nlocal changed = false\nif s.stage == 1 or s.stage == 2 then\n    local count, active = 0, 0\n    for id, wasActive in pairs(s.orbs) do\n        count = count + 1\n        local orb = TensorCore.mGetEntity(id)\n        if wasActive and (not orb or (orb.alive and orb.targetable)) then\n            -- An unloaded handle is not evidence of death.\n            active = active + 1\n        elseif orb and (not orb.alive or not orb.targetable) then\n            s.orbs[id] = false\n            s.firstOrbDeath = true\n        end\n    end\n    if count >= 4 and active == 0 then\n        s.orbEnd, s.back, s.stage = t, math.max(s.back, t + 3.688), 3\n        changed = true\n    elseif t >= s.orbEnd - 0.5 then\n        -- Do not let a slow or partly unobserved orb phase become downtime.\n        s.orbEnd, s.back = t + 1, math.max(s.back, t + 4.688)\n        changed = true\n    end\nelseif s.stage == 3 and t >= s.back - 0.5 then\n    s.back = t + 1\n    changed = true\nend\nif changed then s.apply() end\nself.used = true\n",
							conditions = 
							{
								
								{
									"ba80dbb0-546c-114d-8dbc-e3340a8c4fc3",
									true,
								},
								
								{
									"fcc037b3-4037-dbe5-89d2-a34ad21cba8e",
									true,
								},
							},
							name = "[AutoSim] Correct slow orbs and missed return",
							uuid = "af9dcfa8-5da8-21cb-93ef-164cf9435ba2",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 14,
							dequeueIfLuaFalse = true,
							jobIDList = 
							{
								34,
								41,
							},
							name = "Samurai or Viper",
							uuid = "ba80dbb0-546c-114d-8dbc-e3340a8c4fc3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinZeleniaAutoSim\nreturn s~=nil and s.stage>0 and s.stage<4",
							name = "Orb sequence active",
							uuid = "fcc037b3-4037-dbe5-89d2-a34ad21cba8e",
							version = 3,
						},
					},
				},
				loop = true,
				mechanicTime = 93.5,
				name = "[AutoSim] Correct slow orbs and missed return",
				throttleTime = 250,
				timeRange = true,
				timelineIndex = 15,
				timerEndOffset = 126.5,
				timerStartOffset = -8.5,
				uuid = "16a9f9dc-3d13-ad00-b800-25093e712e53",
				version = 2,
			},
		},
	},
	inheritedProfiles = 
	{
	},
	timelineName = "zelenia-ex",
	version = "1.0.1",
}



return tbl