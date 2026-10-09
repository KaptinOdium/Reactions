local tbl = 
{
	[2] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "fcc4ff11-ceb8-7acd-1f2a-d04b600d4921",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "17d39e97-b7b1-bb13-c3ed-a4a996de0187",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "AutoSim - Necron adds trial",
				uuid = "e0d8ca11-8628-3c43-aab5-8922497422f4",
			},
			objectType = "folder",
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
							actionLua = "-- Necron AutoSim trial, SAM v1 / VPR v2.5.\n-- Baseline: deathless SAM clear 20261009-2319-1296-2, 433.969 seconds.\n-- ADD_VALUE is an experimental scoring preference, not actual resistance.\n-- The 5% raid-buff forecast represents the observed DNC windows, not a\n-- complete reconstruction of every party buff. Recheck with the next clear.\n-- No target-slot, AoE, movement, positional, CD, or action-hold overrides.\nlocal api = TensorCore.API.TensorACR\nlocal s = {\n    firstStart = 200.968, firstEnd = 230.859,\n    depart = 247.203, arrive = 261.281,\n    handsEnd = 282.171, back = 296.875,\n    stage = 0, hands = {}, addValue = 0.2,\n}\nfunction s.apply()\n    api.setAutoSimKillTime(s.back + 137.094)\n    -- This profile owns these three forecast types. Rebuild at significant\n    -- transitions rather than keeping IDs across reset/schedule replacement.\n    api.clearAutoSimPhases(\"FullDowntime\")\n    api.clearAutoSimPhases(\"BossModifier\")\n    api.clearAutoSimPhases(\"RaidBuff\")\n    local function phase(kind, a, b, value)\n        if b > a then api.addAutoSimPhase(kind, a, b, value) end\n    end\n    phase(\"BossModifier\", s.firstStart, s.firstEnd, s.addValue)\n    phase(\"BossModifier\", s.arrive, s.handsEnd, s.addValue)\n    phase(\"FullDowntime\", s.depart, s.arrive)\n    phase(\"FullDowntime\", s.handsEnd, s.back)\n    phase(\"RaidBuff\", 7.657, 27.657, 1.05)\n    phase(\"RaidBuff\", 127.828, 147.828, 1.05)\n    phase(\"RaidBuff\", s.back + 6.578, s.back + 26.578, 1.05)\n    phase(\"RaidBuff\", s.back + 126.438, s.back + 146.438, 1.05)\nend\ns.apply()\ndata.kaptinNecronAutoSim = s\nself.used = true\n",
							conditions = 
							{
								
								{
									"7d74bd26-3b90-8494-a8a2-97dcff8c6023",
									true,
								},
							},
							name = "[AutoSim] Necron add forecast",
							uuid = "5cbffbf2-daa2-080c-a383-e77be981a513",
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
							uuid = "7d74bd26-3b90-8494-a8a2-97dcff8c6023",
							version = 3,
						},
					},
				},
				displayPath = "AutoSim - Necron adds trial",
				eventType = 16,
				loop = true,
				mechanicTime = 14.8,
				name = "[AutoSim] Necron add forecast",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = -14.8,
				timerStartOffset = -74.8,
				uuid = "238bc5c6-64af-cd35-9756-fb0318c9dcce",
				version = 2,
			},
		},
	},
	[4] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "26ab6afb-14cc-692f-d633-62e1ec0e8e8b",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[6] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "28e9591b-13f5-f7af-342e-b4952fcb4b0b",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[7] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "225e234a-0780-843e-c054-acace0d7141a",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "49d8a60c-35fa-b230-b646-2996cb39d17c",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[9] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "9cac8eb4-afe8-ada0-57af-0852f8ac8b44",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "47be24be-4ec2-b4ea-0e53-4f347362fd6e",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[10] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "dba77870-181a-1ea4-fee5-9cbaf7008040",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[12] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "a135b79a-6acc-816e-7113-2c90e4264d6a",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "d60d0cfc-33c3-6700-43ab-aeba4c28552c",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[13] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "19eab4a5-47e3-3d79-ac5e-84abde97a5f5",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "3a9e868b-6225-32ff-db4e-9b899b3b463b",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[16] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "bd0beef6-9627-fa72-85cc-a90cb19737c6",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "dbc347e8-ca95-dbd4-9c9b-9976248fe4d8",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[17] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "206beca1-0580-f0fd-d83e-7a27c6e51131",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[19] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "87fe62e1-6817-8335-512b-2ce3b78d33d1",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[20] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "71e0396f-8700-44d3-5c31-1ffd470c44ff",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[23] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "3ceb6870-7046-d324-3077-e39276eb00a0",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[24] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "d316f773-d656-5b4f-9e93-6c792d7be903",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "f4f4a7f1-4007-af3d-812f-11ff2e2e26e1",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[25] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "8ab911c2-dbd1-2bde-52cd-4600be957bb2",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[26] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "9f13f653-95b5-9ecf-2878-526dfc6366c3",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[27] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "08532402-de1f-74de-6eca-4da452856712",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[28] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "ddd6eb37-4798-b01b-f6dd-a305f1f5f587",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[30] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "14da5b2e-3c11-2a12-723e-86ec9b57677e",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[32] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "bc928564-7b2d-6bc8-1d4c-6d76a56080f4",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[40] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "917a4df3-b2e7-8c1f-bb2f-c1cde4ea6a63",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[44] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "45f4bf8f-9e8f-d2c3-c83d-27216beb0dbf",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "AutoSim - Necron adds trial",
				uuid = "c597e371-99f6-df9e-ad7c-caabeefe098c",
			},
			objectType = "folder",
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
							actionLua = "-- Native gate: main Necron content ID; linked Lua gate verifies model18699.\nlocal s = data.kaptinNecronAutoSim\nlocal t = TensorCore.API.TensorACR.getAutoSimTime()\nif s.stage == 0 and not eventArgs.isTargetable and t >= 190 and t < 225 then\n    s.bossID = eventArgs.entityID\n    s.firstStart = t\n    s.stage = 1\n    s.apply()\nelseif s.bossID == eventArgs.entityID then\n    if s.stage == 1 and eventArgs.isTargetable then\n        s.firstEnd = t\n        s.depart, s.arrive = t + 16.344, t + 30.422\n        s.handsEnd, s.back = t + 51.312, t + 66.016\n        s.stage = 2\n        s.apply()\n    elseif s.stage == 2 and not eventArgs.isTargetable then\n        s.depart, s.arrive = t, t + 14.078\n        s.handsEnd, s.back = t + 34.968, t + 49.672\n        s.stage = 3\n        s.apply()\n    end\nend\nself.used = true\n",
							conditions = 
							{
								
								{
									"d481b6e5-d813-5a74-a8a7-759e32c04e50",
									true,
								},
								
								{
									"0800d723-17e0-c395-b035-f01373152094",
									true,
								},
								
								{
									"f1dda382-8868-e0b1-9cc6-0ddcbc0960a1",
									true,
								},
								
								{
									"be45b4b0-a1fc-c88b-a2cb-f4313eb21cbc",
									true,
								},
							},
							name = "[AutoSim] Follow Necron departures and bridge",
							uuid = "9f0928c0-696f-2065-be46-597791b74e18",
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
							uuid = "d481b6e5-d813-5a74-a8a7-759e32c04e50",
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
							uuid = "0800d723-17e0-c395-b035-f01373152094",
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
							uuid = "f1dda382-8868-e0b1-9cc6-0ddcbc0960a1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinNecronAutoSim\nreturn s~=nil and s.stage<6",
							name = "Forecast initialized",
							uuid = "be45b4b0-a1fc-c88b-a2cb-f4313eb21cbc",
							version = 3,
						},
					},
				},
				displayPath = "AutoSim - Necron adds trial",
				eventType = 26,
				loop = true,
				mechanicTime = 199.5,
				name = "[AutoSim] Follow Necron departures and bridge",
				timeRange = true,
				timelineIndex = 44,
				timerEndOffset = 200.5,
				timerStartOffset = -14.5,
				uuid = "0e1a7e50-73ba-b3d8-94f4-5f246ccc3391",
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
									"b9a96f17-97a8-5995-acf1-3ab2c88ace2f",
									true,
								},
								
								{
									"8221f15d-4540-bb7b-b8a7-737c8333f56e",
									true,
								},
							},
							name = "[AutoSim] Correct slow adds and personal return",
							uuid = "0f88f085-3b86-eec2-b4d7-aa272f196f89",
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
							uuid = "b9a96f17-97a8-5995-acf1-3ab2c88ace2f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinNecronAutoSim\nreturn s~=nil and s.stage>0 and s.stage<6",
							name = "Add sequence active",
							uuid = "8221f15d-4540-bb7b-b8a7-737c8333f56e",
							version = 3,
						},
					},
				},
				displayPath = "AutoSim - Necron adds trial",
				loop = true,
				mechanicTime = 199.5,
				name = "[AutoSim] Correct slow adds and personal return",
				throttleTime = 250,
				timeRange = true,
				timelineIndex = 44,
				timerEndOffset = 200.5,
				timerStartOffset = -9.5,
				uuid = "d2a94836-8fba-8ea7-860c-4d739fac1b1a",
				version = 2,
			},
		},
	},
	[50] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "AutoSim - Necron adds trial",
				uuid = "f310c4f3-4954-d45f-b30e-7e11e2dd2dd5",
			},
			objectType = "folder",
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
							actionLua = "-- Native content14094 gate plus model18701 gate: the two local Abyss hands.\nlocal s = data.kaptinNecronAutoSim\nlocal t = TensorCore.API.TensorACR.getAutoSimTime()\nif s.stage == 3 and eventArgs.isTargetable then\n    s.arrive = t\n    s.handsEnd, s.back = t + 20.890, t + 35.594\n    s.stage = 4\n    s.apply()\nend\nif s.stage == 4 then\n    s.hands[eventArgs.entityID] = eventArgs.isTargetable\n    local count, active = 0, 0\n    for _, alive in pairs(s.hands) do\n        count = count + 1\n        if alive then active = active + 1 end\n    end\n    if count >= 2 and active == 0 then\n        s.handsEnd, s.back = t, t + 14.704\n        s.stage = 5\n        s.apply()\n    end\nend\nself.used = true\n",
							conditions = 
							{
								
								{
									"c534aeed-bcc7-3ef6-9544-2ff12cb14c72",
									true,
								},
								
								{
									"63e1aa3d-45de-a96e-b90e-379982d56a27",
									true,
								},
								
								{
									"946ca666-0eb0-ae23-96c2-5e47cfa94f1f",
									true,
								},
								
								{
									"14c7a705-4620-f033-ab23-878145eb9d20",
									true,
								},
							},
							name = "[AutoSim] Follow Abyss hand uptime",
							uuid = "51183b2a-a677-f767-b6f2-1e4308d29498",
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
							uuid = "c534aeed-bcc7-3ef6-9544-2ff12cb14c72",
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
							uuid = "63e1aa3d-45de-a96e-b90e-379982d56a27",
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
							uuid = "946ca666-0eb0-ae23-96c2-5e47cfa94f1f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinNecronAutoSim\nreturn s~=nil and s.stage>=3 and s.stage<6",
							name = "Mandatory Abyss",
							uuid = "14c7a705-4620-f033-ab23-878145eb9d20",
							version = 3,
						},
					},
				},
				displayPath = "AutoSim - Necron adds trial",
				eventType = 26,
				loop = true,
				mechanicTime = 250.8,
				name = "[AutoSim] Follow Abyss hand uptime",
				timeRange = true,
				timelineIndex = 50,
				timerEndOffset = 149.2,
				timerStartOffset = -20.8,
				uuid = "dedbcb13-98f4-e5bd-aac1-33f62b3cc5e1",
				version = 2,
			},
		},
	},
	[56] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "c7c756ca-c252-137e-b571-e2b81ff443da",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[57] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "471652d5-29bf-a249-b657-fcb3d885ede5",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[59] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "26ae79af-61f2-513b-f92b-91911b74633f",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "a9fcf51d-f7e3-afb9-2134-7917f9f976cd",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[61] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "7bca0750-1457-5e3c-9982-e9969b1d4220",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "b41b3f7a-ed1f-53c6-04ca-3888489c316a",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[62] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "4327706b-33d7-4f77-d1eb-93757113e89b",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[63] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "9678fb7a-35f7-bd06-c33b-920ca119daca",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "7ac81b5c-9ba4-1c18-9de0-52769203358c",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[64] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "1fbb5335-c3cb-08d9-5ae2-0dabbbe32a65",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[65] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "48997636-0913-5dca-3b39-8f9c234582e6",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[66] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "c22222e7-0c07-097b-dc93-54895ffe2e17",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[67] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "2c343848-7aff-3f6c-44f0-67bae5546cb8",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[68] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "02437dc1-60c8-f47d-d970-893fd936ca31",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[69] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "0d733128-2636-f294-b289-c2ae37c707b8",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[71] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "c7d638f5-9de1-23e1-9a80-805b7932c805",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[74] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "9ad5cac6-46ee-efda-6b07-8d3cdebc2856",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[77] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "1de33d17-e6d8-914b-9bed-9d715ac0a0e7",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[80] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "0827f119-e52b-ff2d-65e8-ffa341cded29",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[81] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "90ec408e-42fc-e822-42fb-8868b724c8de",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[83] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "7b9c45c4-d99e-f798-a0d7-aeb281509a54",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[84] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "54eee9c3-8f95-a88f-877e-40adbfe27e33",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[85] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "3bc3fa12-b288-689e-df64-1ae49a5c1462",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "79e780f4-7ae7-f510-59e9-510ece1a6724",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[87] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "7ae03bc8-1cf3-d314-37ab-f0aef17a17d8",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "1720feb2-d591-789e-6249-ae40aa225c22",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[88] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "a06c8407-60fc-91fb-da09-e2894af39537",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[89] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "7f9d05f6-b9fe-312a-33a4-439074284ec6",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "da7e8ee8-cff4-c7ec-4266-f5ba234b2bd8",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[90] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "897458c2-c6b6-a7e6-20e0-ed64bd50c2b2",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[91] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "f3afeef1-5f54-4f65-a2a6-1b732ce96de1",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[92] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "0a6dad44-88c5-91b8-d18b-2e62201744f4",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[93] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "9dcf3d53-036f-5317-4200-2811fb1eadc3",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[94] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "f6e927fe-ec0d-566a-4272-d990232143ee",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[95] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "3471506f-09d0-b77b-2b02-8e69099d5bff",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[97] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "1e2ed8ef-1485-0d9b-7d49-617d0f76671f",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[98] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "ab7a83e0-7fd1-db34-9f13-adaa778b1370",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[99] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "2436383b-646a-92af-a9ab-ca354850cd0b",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[105] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "14d947cb-5821-ab5f-6ec3-cf212896ca9b",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[106] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "74efa65a-3286-5bee-6055-eaecaeb02aea",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[108] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "c2828284-43d1-11d0-c78a-c592894960d4",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "e984b2ae-b09a-11fa-0a77-6474cbcc0e5e",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	[110] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "3599d33d-9766-3d09-d312-4b9b7b33cd4d",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[111] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "ac53ffb2-e169-9f3e-6c05-dec04491ac42",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[113] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "4e77d968-0a1c-ccb4-592b-abeaf90dc5b8",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[115] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "432841ae-71ff-74c2-2739-e67cb3fbd6be",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
	},
	[123] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "bfd325c9-1236-2e25-52b2-0667e699d939",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
	},
	inheritedProfiles = 
	{
		"store\\anyone\\extremes\\necron\\main",
		"Necron Draws ",
	},
	timelineName = "necron-ex",
	version = "1.0.1",
}



return tbl