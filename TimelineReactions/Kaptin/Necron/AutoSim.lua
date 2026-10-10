local tbl = 
{
	[2] = 
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
							actionLua = "-- Necron AutoSim trial, SAM v1 / VPR v2.5.\n-- Baseline: deathless SAM clear 20261009-2319-1296-2, 433.969 seconds.\n-- ADD_VALUE is an experimental scoring preference, not actual resistance.\n-- The 5% raid-buff forecast represents the observed DNC windows, not a\n-- complete reconstruction of every party buff. Recheck with the next clear.\n-- No target-slot, AoE, movement, positional, CD, or action-hold overrides.\nlocal api = TensorCore.API.TensorACR\nlocal s = {\n    firstStart = 200.968, firstEnd = 230.859,\n    depart = 247.203, arrive = 261.281,\n    handsEnd = 282.171, back = 296.875,\n    stage = 0, hands = {}, addValue = 0.2,\n}\nfunction s.apply()\n    api.setAutoSimKillTime(s.back + 137.094)\n    -- This profile owns these three forecast types. Rebuild at significant\n    -- transitions rather than keeping IDs across reset/schedule replacement.\n    api.clearAutoSimPhases(\"FullDowntime\")\n    api.clearAutoSimPhases(\"BossModifier\")\n    api.clearAutoSimPhases(\"RaidBuff\")\n    local function phase(kind, a, b, value)\n        if b > a then api.addAutoSimPhase(kind, a, b, value) end\n    end\n    phase(\"BossModifier\", s.firstStart, s.firstEnd, s.addValue)\n    phase(\"BossModifier\", s.arrive, s.handsEnd, s.addValue)\n    phase(\"FullDowntime\", s.depart, s.arrive)\n    phase(\"FullDowntime\", s.handsEnd, s.back)\n    phase(\"RaidBuff\", 7.657, 27.657, 1.05)\n    phase(\"RaidBuff\", 127.828, 147.828, 1.05)\n    phase(\"RaidBuff\", s.back + 6.578, s.back + 26.578, 1.05)\n    phase(\"RaidBuff\", s.back + 126.438, s.back + 146.438, 1.05)\nend\ns.apply()\ndata.kaptinNecronAutoSim = s\nself.used = true\n",
							conditions = 
							{
								
								{
									"eac45fba-7b05-5d81-94d9-e15031d521d8",
									true,
								},
							},
							name = "[AutoSim] Necron add forecast",
							uuid = "dfccd203-926b-4517-9cb3-4e43ed29c602",
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
							uuid = "eac45fba-7b05-5d81-94d9-e15031d521d8",
							version = 3,
						},
					},
				},
				eventType = 16,
				loop = true,
				mechanicTime = 14.8,
				name = "[AutoSim] Necron add forecast",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = -14.8,
				timerStartOffset = -74.8,
				uuid = "dccf724c-af70-2a70-9b7c-be54af0e9858",
				version = 2,
			},
		},
	},
	[44] = 
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
							actionLua = "-- Native gate: main Necron content ID; linked Lua gate verifies model18699.\nlocal s = data.kaptinNecronAutoSim\nlocal t = TensorCore.API.TensorACR.getAutoSimTime()\nif s.stage == 0 and not eventArgs.isTargetable and t >= 190 and t < 225 then\n    s.bossID = eventArgs.entityID\n    s.firstStart = t\n    s.stage = 1\n    s.apply()\nelseif s.bossID == eventArgs.entityID then\n    if s.stage == 1 and eventArgs.isTargetable then\n        s.firstEnd = t\n        s.depart, s.arrive = t + 16.344, t + 30.422\n        s.handsEnd, s.back = t + 51.312, t + 66.016\n        s.stage = 2\n        s.apply()\n    elseif s.stage == 2 and not eventArgs.isTargetable then\n        s.depart, s.arrive = t, t + 14.078\n        s.handsEnd, s.back = t + 34.968, t + 49.672\n        s.stage = 3\n        s.apply()\n    end\nend\nself.used = true\n",
							conditions = 
							{
								
								{
									"53536110-ad8a-42fd-958c-3f8b2708c5b9",
									true,
								},
								
								{
									"ebc23dec-7497-bbb7-8c68-318c64e1d2a3",
									true,
								},
								
								{
									"a312930b-da8f-8815-919c-61b757719fdb",
									true,
								},
								
								{
									"98315554-6dfc-8a56-9de8-1adbe1faf75d",
									true,
								},
							},
							name = "[AutoSim] Follow Necron departures and bridge",
							uuid = "f522e8dc-ee6d-84ff-bf88-62931d0cd876",
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
							uuid = "53536110-ad8a-42fd-958c-3f8b2708c5b9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 14093,
							name = "Necron",
							uuid = "ebc23dec-7497-bbb7-8c68-318c64e1d2a3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return Argus.getEntityModel(eventArgs.entityID) == 18699",
							dequeueIfLuaFalse = true,
							name = "Main boss model",
							uuid = "a312930b-da8f-8815-919c-61b757719fdb",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinNecronAutoSim\nreturn s~=nil and s.stage<6",
							name = "Forecast initialized",
							uuid = "98315554-6dfc-8a56-9de8-1adbe1faf75d",
							version = 3,
						},
					},
				},
				eventType = 26,
				loop = true,
				mechanicTime = 199.5,
				name = "[AutoSim] Follow Necron departures and bridge",
				timeRange = true,
				timelineIndex = 44,
				timerEndOffset = 200.5,
				timerStartOffset = -14.5,
				uuid = "7ab1303a-9723-11a6-830d-445f8ab5ab80",
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
							actionLua = "-- Bounded 250ms poll during mandatory adds only. Tracks already known IDs;\n-- no entity-list scans, model internals, or frame callbacks.\nlocal s = data.kaptinNecronAutoSim\nlocal t = TensorCore.API.TensorACR.getAutoSimTime()\nlocal boss = s.bossID and TensorCore.mGetEntity(s.bossID)\nlocal player = TensorCore.mGetPlayer()\n-- Boss visibility alone is insufficient: the player must be back upstairs.\nif s.stage >= 3 and boss and boss.alive and boss.targetable and boss.attackable\n    and player and player.alive then\n    local p = player.pos\n    if p.x >= 82 and p.x <= 118 and p.z >= 85 and p.z <= 115\n        and math.abs(p.y) < 5 and math.abs(p.y - boss.pos.y) < 5 then\n        -- If a hand's death event was missed, do not leave a future add\n        -- valuation interval or a no-target gap after the player's return.\n        s.arrive = math.min(s.arrive, t)\n        s.handsEnd = math.min(s.handsEnd, t)\n        s.back = t\n        s.stage = 6\n        s.apply()\n        self.used = true\n        return\n    end\nend\nlocal changed = false\nif s.stage == 1 and t >= s.firstEnd - 0.5 then\n    s.firstEnd = t + 1\n    s.depart, s.arrive = s.firstEnd + 16.344, s.firstEnd + 30.422\n    s.handsEnd, s.back = s.firstEnd + 51.312, s.firstEnd + 66.016\n    changed = true\nelseif s.stage == 2 and t >= s.depart - 0.5 then\n    s.depart, s.arrive = t + 1, t + 15.078\n    s.handsEnd, s.back = t + 35.968, t + 50.672\n    changed = true\nelseif s.stage == 3 and t >= s.arrive - 0.5 then\n    s.arrive = t + 1\n    s.handsEnd, s.back = s.arrive + 20.890, s.arrive + 35.594\n    changed = true\nelseif s.stage == 4 then\n    local count, active = 0, 0\n    for id, wasActive in pairs(s.hands) do\n        count = count + 1\n        local hand = TensorCore.mGetEntity(id)\n        if wasActive and (not hand or (hand.alive and hand.targetable)) then\n            active = active + 1\n        elseif hand and (not hand.alive or not hand.targetable) then\n            s.hands[id] = false\n        end\n    end\n    if count >= 2 and active == 0 then\n        s.handsEnd, s.back = t, t + 14.704\n        s.stage = 5\n        changed = true\n    elseif t >= s.handsEnd - 0.5 then\n        s.handsEnd, s.back = t + 1, t + 15.704\n        changed = true\n    end\nelseif s.stage == 5 and t >= s.back - 0.5 then\n    s.back = t + 1\n    changed = true\nend\nif changed then s.apply() end\nself.used = true\n",
							conditions = 
							{
								
								{
									"4c4c2b01-cce9-0341-8119-03f96ff404f4",
									true,
								},
								
								{
									"565ef16a-3ef9-99d0-a277-e62c7df642ce",
									true,
								},
							},
							name = "[AutoSim] Correct slow adds and personal return",
							uuid = "c93d3e90-5dfb-91a4-8d1b-9dcedd9b9a69",
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
							uuid = "4c4c2b01-cce9-0341-8119-03f96ff404f4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinNecronAutoSim\nreturn s~=nil and s.stage>0 and s.stage<6",
							name = "Add sequence active",
							uuid = "565ef16a-3ef9-99d0-a277-e62c7df642ce",
							version = 3,
						},
					},
				},
				loop = true,
				mechanicTime = 199.5,
				name = "[AutoSim] Correct slow adds and personal return",
				throttleTime = 250,
				timeRange = true,
				timelineIndex = 44,
				timerEndOffset = 200.5,
				timerStartOffset = -9.5,
				uuid = "f4c02b80-e696-2a2f-9763-1c45de5fd4af",
				version = 2,
			},
		},
	},
	[50] = 
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
							actionLua = "-- Native content14094 gate plus model18701 gate: the two local Abyss hands.\nlocal s = data.kaptinNecronAutoSim\nlocal t = TensorCore.API.TensorACR.getAutoSimTime()\nif s.stage == 3 and eventArgs.isTargetable then\n    s.arrive = t\n    s.handsEnd, s.back = t + 20.890, t + 35.594\n    s.stage = 4\n    s.apply()\nend\nif s.stage == 4 then\n    s.hands[eventArgs.entityID] = eventArgs.isTargetable\n    local count, active = 0, 0\n    for _, alive in pairs(s.hands) do\n        count = count + 1\n        if alive then active = active + 1 end\n    end\n    if count >= 2 and active == 0 then\n        s.handsEnd, s.back = t, t + 14.704\n        s.stage = 5\n        s.apply()\n    end\nend\nself.used = true\n",
							conditions = 
							{
								
								{
									"1e23b5c3-a5fb-8ca9-a439-50af7dd66840",
									true,
								},
								
								{
									"1c5f672e-566a-7ff2-b910-8afebcf92b99",
									true,
								},
								
								{
									"2e06db94-3687-8889-b329-26d5faca45aa",
									true,
								},
								
								{
									"6297b39a-65e9-5a49-93c2-8635a8d2301f",
									true,
								},
							},
							name = "[AutoSim] Follow Abyss hand uptime",
							uuid = "81579f46-e772-ef11-8740-e4b4c04c87c7",
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
							uuid = "1e23b5c3-a5fb-8ca9-a439-50af7dd66840",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 14094,
							name = "Hands",
							uuid = "1c5f672e-566a-7ff2-b910-8afebcf92b99",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return Argus.getEntityModel(eventArgs.entityID) == 18701",
							dequeueIfLuaFalse = true,
							name = "Abyss hand model",
							uuid = "2e06db94-3687-8889-b329-26d5faca45aa",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinNecronAutoSim\nreturn s~=nil and s.stage>=3 and s.stage<6",
							name = "Mandatory Abyss",
							uuid = "6297b39a-65e9-5a49-93c2-8635a8d2301f",
							version = 3,
						},
					},
				},
				eventType = 26,
				loop = true,
				mechanicTime = 250.8,
				name = "[AutoSim] Follow Abyss hand uptime",
				timeRange = true,
				timelineIndex = 50,
				timerEndOffset = 149.2,
				timerStartOffset = -20.8,
				uuid = "c01d30ec-345e-b08c-bc9d-3b73d25bcba3",
				version = 2,
			},
		},
	},
	inheritedProfiles = 
	{
	},
	timelineName = "necron-ex",
	version = "1.0.1",
}



return tbl