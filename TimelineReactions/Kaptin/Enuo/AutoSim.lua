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
							actionLua = "-- Enuo forecast from seven deathless clears in report vzgHDBrdVaQY2Tpx.\n-- Original pull time is stable through the timeline's adds sync jumps.\n-- Median boss return 257.609s; median remaining fight 280.468s (8:58 total).\n-- Six of seven observed remaining durations fit +/-20s; the slowest does not.\n-- This is an empirical planning range, not a promise about this party's kill.\n-- Actual departure, add entry, Beacon death, and boss return remain authoritative.\n-- Adds remain attackable uptime. Preserve automatic raid buffs, AoE estimates,\n-- movement uncertainty, action holds, and target assignments.\nlocal api = TensorCore.API.TensorACR\nlocal s = {\n    bossOut = 154.546, addsIn = 174.765,\n    beaconOut = 249.328, back = 257.609,\n    afterReturn = 280.468, stage = 0\n}\nfunction s.apply()\n    api.setAutoSimKillTime(s.back + s.afterReturn)\n    api.clearAutoSimPhases(\"FullDowntime\")\n    if s.addsIn > s.bossOut then\n        api.addAutoSimPhase(\"FullDowntime\", s.bossOut, s.addsIn)\n    end\n    if not s.suppressSecondGap and s.back > s.beaconOut then\n        api.addAutoSimPhase(\"FullDowntime\", s.beaconOut, s.back)\n    end\n    -- setAutoSimKillTime removes automatic uncertainty; replace it explicitly.\n    api.clearAutoSimUncertainty()\n    api.addAutoSimUncertainty(0, 3)\n    api.addAutoSimUncertainty(s.addsIn, 5)\n    api.addAutoSimUncertainty(s.back, 20)\nend\nfunction s.boss(t, targetable, id)\n    if id then s.bossID = id end\n    if not targetable and s.stage == 0 and t >= 125 and t < 185 then\n        local shift = t - s.bossOut\n        s.bossOut = t\n        s.addsIn = s.addsIn + shift\n        s.beaconOut = s.beaconOut + shift\n        s.back = s.back + shift\n        s.stage = 1\n        s.apply()\n    elseif targetable and s.stage >= 1 and s.stage < 4 and t > s.addsIn then\n        -- The observed return always wins over the adds' predicted duration.\n        s.back = t\n        s.beaconOut = math.min(s.beaconOut, t)\n        s.suppressSecondGap = false\n        s.stage = 4\n        s.apply()\n    end\nend\nfunction s.shadow(t, targetable, id)\n    if id then s.shadowID = id end\n    if targetable and s.stage == 1 then\n        local shift = t - s.addsIn\n        s.addsIn = t\n        s.beaconOut = s.beaconOut + shift\n        s.back = s.back + shift\n        s.stage = 2\n        s.apply()\n    end\nend\nfunction s.beacon(t, targetable, id)\n    if id then s.beaconID = id end\n    if targetable then s.beaconSeenTargetable = true end\n    if not targetable and s.stage >= 2 and s.stage < 3 then\n        s.beaconOut = t\n        s.back = t + 8.282\n        s.stage = 3\n        s.suppressSecondGap = false\n        s.apply()\n    end\nend\nfunction s.progress(t)\n    -- Run at 250ms only while the real adds transition is active. Entity IDs\n    -- come from the narrowly gated targetability events; never scan the world.\n    if s.stage < 1 or s.stage >= 4 then return end\n    local boss = s.bossID and TensorCore.mGetEntity(s.bossID)\n    if boss and boss.alive and boss.targetable and t > s.addsIn then\n        s.boss(t, true)\n        return\n    end\n    if s.stage == 1 then\n        local add = s.shadowID and TensorCore.mGetEntity(s.shadowID)\n        if add and add.alive and add.targetable then s.shadow(t, true) end\n    end\n    if s.stage == 2 then\n        local beacon = s.beaconID and TensorCore.mGetEntity(s.beaconID)\n        if s.beaconSeenTargetable and beacon\n            and (not beacon.alive or not beacon.targetable) then\n            s.beacon(t, false)\n        elseif not s.suppressSecondGap and t >= s.beaconOut - 1 then\n            -- No observed Beacon resolution yet. Withdraw the stale upcoming\n            -- gap once so a slower add clear cannot become false downtime.\n            -- Missing/unloaded entities are never treated as a confirmed death.\n            s.suppressSecondGap = true\n            s.apply()\n        end\n    end\n    if s.stage == 3 and t >= s.back - 0.5 and boss\n        and boss.alive and not boss.targetable then\n        -- A delayed boss return extends the real, already-started gap at most\n        -- once per second. An observed return immediately supersedes it.\n        s.back = t + 1.5\n        s.apply()\n    end\nend\ns.apply()\ndata.kaptinEnuoVprAutoSim = s\nself.used = true\n",
							conditions = 
							{
								
								{
									"3b694ee7-2afc-efe8-ac92-1a0d5c0e8e8f",
									true,
								},
							},
							name = "[AutoSim] Enuo clear and adds forecast",
							uuid = "07b23419-6581-dbe2-b0d0-8eb38a6fbc60",
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
								41,
							},
							name = "Viper",
							uuid = "3b694ee7-2afc-efe8-ac92-1a0d5c0e8e8f",
							version = 3,
						},
					},
				},
				eventType = 16,
				loop = true,
				mechanicTime = 14.2,
				name = "[AutoSim] Enuo clear and adds forecast",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = -14.2,
				timerStartOffset = -74.2,
				uuid = "85ae2aa4-33de-73d0-bcf9-c7432a9e3cfa",
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
							actionLua = "-- Enuo forecast from seven deathless clears in report vzgHDBrdVaQY2Tpx.\n-- Original pull time is stable through the timeline's adds sync jumps.\n-- Median boss return 257.609s; median remaining fight 280.468s (8:58 total).\n-- Six of seven observed remaining durations fit +/-20s; the slowest does not.\n-- This is an empirical planning range, not a promise about this party's kill.\n-- Actual departure, add entry, Beacon death, and boss return remain authoritative.\n-- Adds remain attackable uptime. Preserve automatic raid buffs, AoE estimates,\n-- movement uncertainty, action holds, and target assignments.\nlocal api = TensorCore.API.TensorACR\nlocal s = {\n    bossOut = 154.546, addsIn = 174.765,\n    beaconOut = 249.328, back = 257.609,\n    afterReturn = 280.468, stage = 0\n}\nfunction s.apply()\n    api.setAutoSimKillTime(s.back + s.afterReturn)\n    api.clearAutoSimPhases(\"FullDowntime\")\n    if s.addsIn > s.bossOut then\n        api.addAutoSimPhase(\"FullDowntime\", s.bossOut, s.addsIn)\n    end\n    if not s.suppressSecondGap and s.back > s.beaconOut then\n        api.addAutoSimPhase(\"FullDowntime\", s.beaconOut, s.back)\n    end\n    -- setAutoSimKillTime removes automatic uncertainty; replace it explicitly.\n    api.clearAutoSimUncertainty()\n    api.addAutoSimUncertainty(0, 3)\n    api.addAutoSimUncertainty(s.addsIn, 5)\n    api.addAutoSimUncertainty(s.back, 20)\nend\nfunction s.boss(t, targetable, id)\n    if id then s.bossID = id end\n    if not targetable and s.stage == 0 and t >= 125 and t < 185 then\n        local shift = t - s.bossOut\n        s.bossOut = t\n        s.addsIn = s.addsIn + shift\n        s.beaconOut = s.beaconOut + shift\n        s.back = s.back + shift\n        s.stage = 1\n        s.apply()\n    elseif targetable and s.stage >= 1 and s.stage < 4 and t > s.addsIn then\n        -- The observed return always wins over the adds' predicted duration.\n        s.back = t\n        s.beaconOut = math.min(s.beaconOut, t)\n        s.suppressSecondGap = false\n        s.stage = 4\n        s.apply()\n    end\nend\nfunction s.shadow(t, targetable, id)\n    if id then s.shadowID = id end\n    if targetable and s.stage == 1 then\n        local shift = t - s.addsIn\n        s.addsIn = t\n        s.beaconOut = s.beaconOut + shift\n        s.back = s.back + shift\n        s.stage = 2\n        s.apply()\n    end\nend\nfunction s.beacon(t, targetable, id)\n    if id then s.beaconID = id end\n    if targetable then s.beaconSeenTargetable = true end\n    if not targetable and s.stage >= 2 and s.stage < 3 then\n        s.beaconOut = t\n        s.back = t + 8.282\n        s.stage = 3\n        s.suppressSecondGap = false\n        s.apply()\n    end\nend\nfunction s.progress(t)\n    -- Run at 250ms only while the real adds transition is active. Entity IDs\n    -- come from the narrowly gated targetability events; never scan the world.\n    if s.stage < 1 or s.stage >= 4 then return end\n    local boss = s.bossID and TensorCore.mGetEntity(s.bossID)\n    if boss and boss.alive and boss.targetable and t > s.addsIn then\n        s.boss(t, true)\n        return\n    end\n    if s.stage == 1 then\n        local add = s.shadowID and TensorCore.mGetEntity(s.shadowID)\n        if add and add.alive and add.targetable then s.shadow(t, true) end\n    end\n    if s.stage == 2 then\n        local beacon = s.beaconID and TensorCore.mGetEntity(s.beaconID)\n        if s.beaconSeenTargetable and beacon\n            and (not beacon.alive or not beacon.targetable) then\n            s.beacon(t, false)\n        elseif not s.suppressSecondGap and t >= s.beaconOut - 1 then\n            -- No observed Beacon resolution yet. Withdraw the stale upcoming\n            -- gap once so a slower add clear cannot become false downtime.\n            -- Missing/unloaded entities are never treated as a confirmed death.\n            s.suppressSecondGap = true\n            s.apply()\n        end\n    end\n    if s.stage == 3 and t >= s.back - 0.5 and boss\n        and boss.alive and not boss.targetable then\n        -- A delayed boss return extends the real, already-started gap at most\n        -- once per second. An observed return immediately supersedes it.\n        s.back = t + 1.5\n        s.apply()\n    end\nend\ns.apply()\ndata.kaptinEnuoVprAutoSim = s\nself.used = true\n",
							conditions = 
							{
								
								{
									"a6c1fd62-3c89-8ed3-bf69-d1c8c415d499",
									true,
								},
								
								{
									"25714a79-b1b6-2cc2-a248-912f0f4b70de",
									true,
								},
								
								{
									"29b8c2b5-9b9d-335f-897f-296d60c7ee01",
									true,
								},
							},
							name = "[AutoSim] Forecast when no countdown",
							uuid = "1f24ec31-0086-535c-9b1a-2dbb9e818a90",
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
								41,
							},
							name = "Viper",
							uuid = "a6c1fd62-3c89-8ed3-bf69-d1c8c415d499",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "25714a79-b1b6-2cc2-a248-912f0f4b70de",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return data.kaptinEnuoVprAutoSim==nil and TensorCore.API.TensorACR.getAutoSimTime()>0",
							name = "Missing forecast",
							uuid = "29b8c2b5-9b9d-335f-897f-296d60c7ee01",
							version = 3,
						},
					},
				},
				loop = true,
				mechanicTime = 14.2,
				name = "[AutoSim] Forecast when no countdown",
				throttleTime = 250,
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = -9.2,
				timerStartOffset = -14.2,
				uuid = "6de3c16d-1a70-e245-bcb8-2d6254c43375",
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
							actionLua = "-- Native contentID 14749 plus modelID 19905 gate: only the real Enuo.\nlocal s = data.kaptinEnuoVprAutoSim\nif s then\n    s.boss(TensorCore.API.TensorACR.getAutoSimTime(), eventArgs.isTargetable, eventArgs.entityID)\nend\nself.used = true\n",
							conditions = 
							{
								
								{
									"a32bd0c0-b3ce-48ff-9157-c555f5de3e69",
									true,
								},
								
								{
									"bd6ab2a1-6020-db7b-9081-42ca0bb71630",
									true,
								},
								
								{
									"cb5268e8-d826-6a6a-aa41-6600f860a41c",
									true,
								},
								
								{
									"fbdd9a8f-d2fc-a1e7-b9f9-e5612eaa0ead",
									true,
								},
							},
							name = "[AutoSim] Enuo departure and return",
							uuid = "92e7d1bb-22b1-785c-8f15-7d1b3f87d51f",
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
								41,
							},
							name = "Viper",
							uuid = "a32bd0c0-b3ce-48ff-9157-c555f5de3e69",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 14749,
							name = "Enuo",
							uuid = "bd6ab2a1-6020-db7b-9081-42ca0bb71630",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return Argus.getEntityModel(eventArgs.entityID)==19905",
							dequeueIfLuaFalse = true,
							name = "Main model",
							uuid = "cb5268e8-d826-6a6a-aa41-6600f860a41c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinEnuoVprAutoSim\nreturn s~=nil and s.stage<4",
							name = "Forecast active",
							uuid = "fbdd9a8f-d2fc-a1e7-b9f9-e5612eaa0ead",
							version = 3,
						},
					},
				},
				eventType = 26,
				loop = true,
				mechanicTime = 14.2,
				name = "[AutoSim] Enuo departure and return",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 1785.8,
				timerStartOffset = 85.8,
				uuid = "7bed35b0-bcde-9674-85fa-76eec493580d",
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
							actionLua = "-- Native contentID 14752 plus modelID 19911 gate: attackable Looming Shadow.\nlocal s = data.kaptinEnuoVprAutoSim\nif s then\n    s.shadow(TensorCore.API.TensorACR.getAutoSimTime(), eventArgs.isTargetable, eventArgs.entityID)\nend\nself.used = true\n",
							conditions = 
							{
								
								{
									"706210fc-24b3-3aae-8a66-25973d5654f7",
									true,
								},
								
								{
									"405cd9d3-d5ab-bc0b-864c-4a1686c884e8",
									true,
								},
								
								{
									"31dcbb96-1f74-fa29-a07d-507d9cde9fee",
									true,
								},
								
								{
									"5f05db41-2c49-1f94-a281-451c0400829f",
									true,
								},
							},
							name = "[AutoSim] Looming Shadow uptime",
							uuid = "ab621780-03e7-fac5-972d-1e22d173a47f",
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
								41,
							},
							name = "Viper",
							uuid = "706210fc-24b3-3aae-8a66-25973d5654f7",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 14752,
							name = "Looming Shadow",
							uuid = "405cd9d3-d5ab-bc0b-864c-4a1686c884e8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return Argus.getEntityModel(eventArgs.entityID)==19911",
							dequeueIfLuaFalse = true,
							name = "Main model",
							uuid = "31dcbb96-1f74-fa29-a07d-507d9cde9fee",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinEnuoVprAutoSim\nreturn s~=nil and s.stage<4",
							name = "Forecast active",
							uuid = "5f05db41-2c49-1f94-a281-451c0400829f",
							version = 3,
						},
					},
				},
				eventType = 26,
				loop = true,
				mechanicTime = 14.2,
				name = "[AutoSim] Looming Shadow uptime",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 1785.8,
				timerStartOffset = 85.8,
				uuid = "2cd0d783-6eb3-3c0f-ba1c-0740defc905a",
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
							actionLua = "-- Native contentID 14754 plus modelID 19915 gate: Beacon in the Dark.\nlocal s = data.kaptinEnuoVprAutoSim\nif s then\n    s.beacon(TensorCore.API.TensorACR.getAutoSimTime(), eventArgs.isTargetable, eventArgs.entityID)\nend\nself.used = true\n",
							conditions = 
							{
								
								{
									"db8b9c36-8b13-f5cd-b152-022545895bb1",
									true,
								},
								
								{
									"53b8bc13-aebc-b8f5-9343-460e5db05faa",
									true,
								},
								
								{
									"421320bf-311e-d9d6-a438-8f365341ca21",
									true,
								},
								
								{
									"42ab5a6a-47b4-0635-bbbc-93aa854733e3",
									true,
								},
							},
							name = "[AutoSim] Beacon death and return gap",
							uuid = "c7e8a597-ea47-92a8-8c9e-816819772822",
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
								41,
							},
							name = "Viper",
							uuid = "db8b9c36-8b13-f5cd-b152-022545895bb1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 14754,
							name = "Beacon in the Dark",
							uuid = "53b8bc13-aebc-b8f5-9343-460e5db05faa",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return Argus.getEntityModel(eventArgs.entityID)==19915",
							dequeueIfLuaFalse = true,
							name = "Main model",
							uuid = "421320bf-311e-d9d6-a438-8f365341ca21",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinEnuoVprAutoSim\nreturn s~=nil and s.stage<4",
							name = "Forecast active",
							uuid = "42ab5a6a-47b4-0635-bbbc-93aa854733e3",
							version = 3,
						},
					},
				},
				eventType = 26,
				loop = true,
				mechanicTime = 14.2,
				name = "[AutoSim] Beacon death and return gap",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 1785.8,
				timerStartOffset = 85.8,
				uuid = "a28d6b99-5bf9-c404-a4ac-4c97314502a2",
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
							actionLua = "-- OnUpdate, 250ms; native VPR/ACR guards, linked state gate stages 1 through 3.\nlocal s = data.kaptinEnuoVprAutoSim\nif s then s.progress(TensorCore.API.TensorACR.getAutoSimTime()) end\nself.used = true\n",
							conditions = 
							{
								
								{
									"c1b1cf7c-1930-1b85-b962-6f349734bde3",
									true,
								},
								
								{
									"ecd6d08c-62ae-05e9-b5dd-d6964cf77e9a",
									true,
								},
								
								{
									"4e7f99ad-37f8-f9cc-8644-4c68a88cd285",
									true,
								},
							},
							name = "[AutoSim] Correct slow adds and late return",
							uuid = "2c63cb7a-2d12-af54-b6c5-680a7dd97bb9",
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
								41,
							},
							name = "Viper",
							uuid = "c1b1cf7c-1930-1b85-b962-6f349734bde3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "ecd6d08c-62ae-05e9-b5dd-d6964cf77e9a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinEnuoVprAutoSim\nreturn s~=nil and s.stage>=1 and s.stage<4",
							name = "Adds sequence active",
							uuid = "4e7f99ad-37f8-f9cc-8644-4c68a88cd285",
							version = 3,
						},
					},
				},
				loop = true,
				mechanicTime = 14.2,
				name = "[AutoSim] Correct slow adds and late return",
				throttleTime = 250,
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 1785.8,
				timerStartOffset = 85.8,
				uuid = "d19998eb-7287-575b-be11-220bb72783a0",
				version = 2,
			},
		},
	},
	inheritedProfiles = 
	{
	},
	timelineName = "enuo-ex",
	version = "1.0.1",
}



return tbl