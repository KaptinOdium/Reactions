local tbl = 
{
	[2] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Necron Draws ",
				uuid = "223a999e-537a-efda-fc69-6be8df0cffce",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "68de7610-c070-693c-d968-5e52b16294e0",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "AutoSim - Necron adds trial",
				uuid = "8db6d746-bdb9-9cad-9f1a-c4f09866f5e3",
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
									"c0b52f4a-80f3-5386-9d49-770768a96d55",
									true,
								},
							},
							name = "[AutoSim] Necron add forecast",
							uuid = "7539fa41-17cd-bd20-b364-074da7d9ac45",
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
							},
							name = "Samurai",
							uuid = "c0b52f4a-80f3-5386-9d49-770768a96d55",
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
				uuid = "e62c66a7-aac0-d653-a433-92dce3648481",
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
				uuid = "49512898-948e-6dac-f119-d42e44ba4a08",
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
				uuid = "474c89e4-2f67-0a28-46cf-cc8ebc92cf34",
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
				uuid = "54de302d-aa6d-23e1-77bb-e09f29b6f85d",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "c911b7f3-5285-df47-7464-bc2d7a7fbd03",
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
				uuid = "64c5fad7-1227-0343-25cc-3fc5c8ad7cc7",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "014676c5-dd7f-4821-453f-172be26e3495",
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
				uuid = "0e9b7af9-731b-f2fd-1776-b603135ff769",
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
				uuid = "57200e5f-b650-5a63-25df-441de587948f",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "28dd68ed-7af5-4fc1-53df-43c3cc849a7d",
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
				uuid = "ded25c24-7b5b-6328-3c80-3412ea66b894",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "15c88f4e-41c3-a692-78d7-daf4ec57961e",
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
				uuid = "0f6d95e3-fe02-d2df-08e4-2b193279f913",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "6a0ea341-39c4-156d-6836-fd1f913b6111",
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
				uuid = "d4789ea8-85b5-20a4-91a8-7a8ea711dd18",
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
				uuid = "93ff5dc8-f379-ed5c-540c-089a075fc218",
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
				uuid = "cc1c0f16-15d0-6fba-a8ba-5054a604c946",
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
				uuid = "d10bf0f5-ec9a-5e89-4c49-c8cf0263cf85",
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
				uuid = "6eedab3a-72fe-d396-18e3-cdd8d893deea",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "3a59ed1c-14d1-4288-02e2-f222051adeac",
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
				uuid = "5a026b2b-5477-d927-0f09-10d1542dcfbb",
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
				uuid = "4410c53a-ade7-5c76-26da-fd241a73670a",
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
				uuid = "1c66932b-ef29-4d27-6936-4d6d527a7e9b",
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
				uuid = "e522e82e-f531-6ab2-9c2f-54fce901435e",
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
				uuid = "ae1f7837-d8d0-72bb-a09c-7e058c9d1b67",
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
				uuid = "fb832c51-f63a-e015-9a7d-886b7bffd401",
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
				uuid = "1f54b0ae-3968-ffca-3e15-02b857502e7e",
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
				uuid = "4809eb72-1d74-f5c6-eac3-cb8ce9db5f42",
			},
			inheritanceRoot = "store\\anyone\\extremes\\necron\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "SAM burst",
				uuid = "2f1f796a-a568-acc0-8301-145c1c9b6566",
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
							actionLua = "-- Native gates: SAM, Necron content 14093, targetable=false, timeline >=195.\nlocal boss=TensorCore.mGetEntity(eventArgs.entityID)\nif not boss or Argus.getEntityModel(boss)~=18699 then self.used=true return end\nlocal s=data.kaptinNecronSamCD\nif s and s.bossID~=boss.id then self.used=true return end\nif not s then\n    s={bossID=boss.id}\n    data.kaptinNecronSamCD=s\nend\n-- SAM v1 DoT safeguard only; AutoSim chooses cooldowns.\nif not s.active then\n    if type(ACR_TensorWeeb4_DoTs)~=\"boolean\" then self.used=true return end\n    s.previousDoTs=ACR_TensorWeeb4_DoTs\n    s.active=true\n    ACR_TensorWeeb4_DoTs=false\nend\nif s.darknessSeen then s.abyssStarted=true end\nself.used=true\n",
							conditions = 
							{
								
								{
									"1ec81f2c-0b0a-b285-912b-642ce0bf09fa",
									true,
								},
								
								{
									"f4b51b75-dd7c-8a1d-a5b3-1cce46dcce44",
									true,
								},
								
								{
									"29f2de98-52d7-8cba-8ef3-98eee8b2f681",
									true,
								},
							},
							name = "[SAM] Hold DoTs through both add phases",
							uuid = "81847a49-3792-1f90-9b70-83c4ff64fe4a",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 14093,
							name = "Necron",
							uuid = "1ec81f2c-0b0a-b285-912b-642ce0bf09fa",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgType = 3,
							eventBoolValue = 2,
							name = "Untargetable",
							uuid = "f4b51b75-dd7c-8a1d-a5b3-1cce46dcce44",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 14,
							jobIDList = 
							{
								34,
							},
							name = "Samurai",
							uuid = "29f2de98-52d7-8cba-8ef3-98eee8b2f681",
							version = 3,
						},
					},
				},
				displayPath = "SAM burst",
				eventType = 26,
				loop = true,
				mechanicTime = 199.5,
				name = "[SAM] Hold DoTs through both add phases",
				timeRange = true,
				timelineIndex = 44,
				timerEndOffset = 75.5,
				timerStartOffset = -4.5,
				uuid = "e4dd40d8-973a-dbf3-ae12-9c9b28ca21d3",
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
							actionLua = "-- Runs only after the second departure; first add-wave return must not release.\nlocal s=data.kaptinNecronSamCD\nif not s or not s.active or not s.abyssStarted then return end\nlocal player=TensorCore.mGetPlayer()\nlocal boss=TensorCore.mGetEntity(s.bossID)\nif not player or not player.alive or not boss or not boss.alive\n    or not boss.targetable or not boss.attackable then return end\nif boss.contentid~=14093 or Argus.getEntityModel(boss)~=18699 then return end\nlocal p=player.pos\nif p.x<82 or p.x>118 or p.z<85 or p.z>115 or math.abs(p.y)>=5\n    or math.abs(p.y-boss.pos.y)>=5 then return end\nif type(s.previousDoTs)==\"boolean\" then ACR_TensorWeeb4_DoTs=s.previousDoTs end\ns.active=false\nself.used=true\n",
							conditions = 
							{
								
								{
									"3fc96e1d-07ba-1369-8546-16af47924f92",
									true,
								},
								
								{
									"45aef1c7-a7da-d84f-ba92-3d30373ad6fc",
									true,
								},
							},
							name = "[SAM] Restore DoTs on Necron return",
							uuid = "bb45c3cb-e64e-bb8e-a494-adcbbbe9dc32",
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
							jobIDList = 
							{
								34,
							},
							name = "Samurai",
							uuid = "3fc96e1d-07ba-1369-8546-16af47924f92",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinNecronSamCD\nreturn s~=nil and s.active==true and s.abyssStarted==true",
							name = "Abyss hold active",
							uuid = "45aef1c7-a7da-d84f-ba92-3d30373ad6fc",
							version = 3,
						},
					},
				},
				displayPath = "SAM burst",
				mechanicTime = 199.5,
				name = "[SAM] Restore DoTs on Necron return",
				throttleTime = 250,
				timeRange = true,
				timelineIndex = 44,
				timerEndOffset = 700.5,
				timerStartOffset = -4.5,
				uuid = "7bf3e60f-509a-d52f-9b6f-905605c86f24",
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
							actionLua = "-- TensorReactions clears data before OnWipe; restore from its documented snapshot.\nlocal previous=eventArgs.oldData\nlocal s=previous and previous.kaptinNecronSamCD\nif s and s.active then\n    if type(s.previousDoTs)==\"boolean\" then ACR_TensorWeeb4_DoTs=s.previousDoTs end\n    s.active=false\nend\nself.used=true\n",
							name = "[SAM] Restore DoTs on wipe",
							uuid = "6828453a-fc45-78a0-864a-478364458733",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "SAM burst",
				eventType = 9,
				loop = true,
				mechanicTime = 199.5,
				name = "[SAM] Restore DoTs on wipe",
				timeRange = true,
				timelineIndex = 44,
				timerEndOffset = 700.5,
				timerStartOffset = -229.5,
				uuid = "773ca843-39d1-2498-8068-a71f270cfac8",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "AutoSim - Necron adds trial",
				uuid = "04a64068-1e22-4273-9b72-5d302b8380a0",
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
									"91709a38-e04f-7f1e-838c-40fea8efc2f7",
									true,
								},
								
								{
									"36e535c3-4fe5-8df6-ae17-70494927e4c2",
									true,
								},
								
								{
									"6868395e-bb95-eb78-aff1-39123ff30d52",
									true,
								},
								
								{
									"01c277ed-dc9c-2975-97ba-7e6cd41ba4fb",
									true,
								},
							},
							name = "[AutoSim] Follow Necron departures and bridge",
							uuid = "492cfd93-366b-63da-bace-87f93fcecf88",
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
							},
							name = "Samurai",
							uuid = "91709a38-e04f-7f1e-838c-40fea8efc2f7",
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
							uuid = "36e535c3-4fe5-8df6-ae17-70494927e4c2",
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
							uuid = "6868395e-bb95-eb78-aff1-39123ff30d52",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinNecronAutoSim\nreturn s~=nil and s.stage<6",
							name = "Forecast initialized",
							uuid = "01c277ed-dc9c-2975-97ba-7e6cd41ba4fb",
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
				uuid = "d1937ca9-f40b-a5b8-aee1-5a797a850053",
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
									"46933984-46b7-00e0-bfa9-4ee0eb7e621e",
									true,
								},
								
								{
									"b34c0d63-22ef-90e8-b30e-84ebb9196869",
									true,
								},
							},
							name = "[AutoSim] Correct slow adds and personal return",
							uuid = "d66eb80b-92bb-0c99-a6f8-8a5c80681a8e",
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
							},
							name = "Samurai",
							uuid = "46933984-46b7-00e0-bfa9-4ee0eb7e621e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinNecronAutoSim\nreturn s~=nil and s.stage>0 and s.stage<6",
							name = "Add sequence active",
							uuid = "b34c0d63-22ef-90e8-b30e-84ebb9196869",
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
				uuid = "5d4dcb21-4f34-af89-99ec-64c1c3fbb266",
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
				name = "SAM burst",
				uuid = "a89d713a-cb7e-109e-bf07-be49d3a1b328",
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
							actionLua = "-- Native gate: Darkness of Eternity channel 44580, SAM only.\nlocal boss=TensorCore.mGetEntity(eventArgs.entityID)\nif not boss or boss.contentid~=14093 or Argus.getEntityModel(boss)~=18699 then self.used=true return end\nlocal s=data.kaptinNecronSamCD\nif not s then\n    s={bossID=boss.id}\n    data.kaptinNecronSamCD=s\nend\nif s.bossID==boss.id then s.darknessSeen=true end\nself.used=true\n",
							conditions = 
							{
								
								{
									"e2d05252-606f-9a44-9e96-846717a15d48",
									true,
								},
								
								{
									"703ad590-b0a9-d95d-bc67-f1450255bf89",
									true,
								},
							},
							name = "[SAM] Track Darkness before Abyss",
							uuid = "aee70914-5665-3cec-8e30-d31d8939bfc2",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgType = 2,
							eventSpellID = 44580,
							name = "Darkness of Eternity",
							uuid = "e2d05252-606f-9a44-9e96-846717a15d48",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 14,
							jobIDList = 
							{
								34,
							},
							name = "Samurai",
							uuid = "703ad590-b0a9-d95d-bc67-f1450255bf89",
							version = 3,
						},
					},
				},
				displayPath = "SAM burst",
				eventType = 3,
				mechanicTime = 250.8,
				name = "[SAM] Track Darkness before Abyss",
				timeRange = true,
				timelineIndex = 50,
				timerEndOffset = 19.2,
				timerStartOffset = -25.8,
				uuid = "49175e27-6970-a012-9eaf-a4fdb15c8822",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "AutoSim - Necron adds trial",
				uuid = "e5526207-447e-c73b-9bc4-37502534de80",
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
									"1a6fafa5-b1cd-0084-974d-ed2392e065e4",
									true,
								},
								
								{
									"fcc4d742-f571-ae3d-9d6a-c1c46e57822a",
									true,
								},
								
								{
									"ab8cf0b5-2a4f-f640-9a02-6f72f4dac277",
									true,
								},
								
								{
									"682653aa-60e8-8b00-9c4f-c8274aa427f4",
									true,
								},
							},
							name = "[AutoSim] Follow Abyss hand uptime",
							uuid = "531a4aa4-55d9-1121-b500-6007852aa80e",
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
							},
							name = "Samurai",
							uuid = "1a6fafa5-b1cd-0084-974d-ed2392e065e4",
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
							uuid = "fcc4d742-f571-ae3d-9d6a-c1c46e57822a",
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
							uuid = "ab8cf0b5-2a4f-f640-9a02-6f72f4dac277",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinNecronAutoSim\nreturn s~=nil and s.stage>=3 and s.stage<6",
							name = "Mandatory Abyss",
							uuid = "682653aa-60e8-8b00-9c4f-c8274aa427f4",
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
				uuid = "01950e2e-6db5-f5a1-b696-ff4ac9b36a75",
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
				uuid = "87a03dd7-00b8-40ab-ffef-a3e5e6638707",
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
				uuid = "9da0b2bc-c56c-e890-475d-f9dadfbe1dec",
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
				uuid = "d5895c22-c974-95ae-94f0-d60446f2f892",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "228abce4-761e-e340-b7be-9e2eda4e8774",
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
				uuid = "8eca457d-3d47-6489-43d3-a423752ffbad",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "07427e23-e051-822f-c174-cd81f09c9b73",
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
				uuid = "2f984112-626a-c23e-7bd6-86941f81ae62",
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
				uuid = "d1feace3-9496-abaf-0808-26bdf50b1013",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "68c9ea41-22ae-c71d-3dab-00638ff6a811",
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
				uuid = "51eda380-6859-4284-47ad-dd8e90695990",
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
				uuid = "804f6f7f-840d-4593-7542-cd2da5170d0f",
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
				uuid = "1483d64e-f962-2102-500e-3ac0eb12dd1e",
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
				uuid = "2798afed-abb8-d831-c4ab-a3bfcb3fe17d",
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
				uuid = "e14e87dc-b7d6-7ab8-302b-823ae5762c6c",
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
				uuid = "2976c885-1016-6491-4cda-402b549a4a35",
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
				uuid = "e80b0838-021c-ce04-c2c1-1d7eedea0868",
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
				uuid = "b044fe2f-7336-0543-61f1-840d693c7d1f",
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
				uuid = "a2f9193e-8cf7-cb52-755a-b378e29a70ae",
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
				uuid = "803e5dd0-05ca-6574-a1f1-f19a582f5280",
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
				uuid = "9e35a4eb-ab9c-a1ef-1aa6-eea5456f005b",
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
				uuid = "a4549a85-632e-dac9-ad29-6c0bcf781c35",
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
				uuid = "b1a954b6-ad30-a242-dab3-a1e85a1fb2c6",
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
				uuid = "85e27367-0cd3-5ff3-2128-26a1fff59857",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "88cb31b5-176c-3871-a0a1-97072b5acc45",
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
				uuid = "75452c01-9af1-b28d-195f-ab8746dc1d71",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "2b320167-c18b-86d3-1a01-db55a0d7ae77",
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
				uuid = "3221b312-56e7-4f26-7a1c-93f4220b2062",
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
				uuid = "4cdc7ee3-1793-53b7-634e-2d1d6fe8e213",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "6b535c41-8d24-74a5-5523-fcc392801a11",
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
				uuid = "22de4897-5d16-170b-1d30-d69992674f27",
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
				uuid = "a8348738-f884-9d7c-ba41-738a52c0b888",
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
				uuid = "7ec344e5-0103-8de9-f3fb-dc3b1fe21375",
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
				uuid = "e6259d66-78d7-f81a-a4e8-eb2cebd6d276",
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
				uuid = "33f4031b-c428-cd87-a231-dc05a8d88dab",
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
				uuid = "cc3bad4a-f6c8-5776-d99e-3dfce74305ba",
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
				uuid = "0b7c4bea-b38a-8cd6-7d50-7ad892e6e7ba",
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
				uuid = "d3d38909-9c4e-5b9d-c4de-37d32805ecb9",
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
				uuid = "1dd6eb3e-b2ef-4b92-5652-b6d85d7842ae",
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
				uuid = "00fa72f0-a9d0-e384-cc72-e6b6cf8e1f60",
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
				uuid = "3f3daf25-2f40-87d9-1b3c-0e4765b44115",
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
				uuid = "930cbb7f-fc27-a8cb-7c45-89dd5884ebef",
			},
			inheritanceRoot = "Necron Draws ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\necron\\main",
				uuid = "1d543f0d-c5f8-a529-40e3-4683c303895d",
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
				uuid = "09042966-bf94-b1c2-a5ab-42b4e2783496",
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
				uuid = "508d99d1-f636-d2cd-8a43-fa2f69a683c1",
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
				uuid = "0329e5b7-74f6-e533-32f4-b3095ea2ae27",
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
				uuid = "a4628915-e4fb-7a09-c2f0-1e3330317945",
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
				uuid = "e1e43b3e-ef92-783a-06d9-d454d49becce",
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