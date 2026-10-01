local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "e17c17cb-3187-918f-27ac-45c1155c4c1b",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "44ebd76f-836d-eb85-86df-2bbe1b94794b",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "fd5fc8fe-4b67-b9c1-9043-d990ca29355d",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Retired old OT",
				uuid = "82d3db72-eef7-b685-9b86-790f7f06261e",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"ad34166d-8310-0d40-bb05-e383667b531f",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "OT - Rampart",
							uuid = "fe4f63dd-9cf3-a38f-9e35-377485130197",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "ad34166d-8310-0d40-bb05-e383667b531f",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 10.172,
				name = "[DRK R1][OT] Rampart 00:06 - superseded",
				timelineIndex = 1,
				timerOffset = -3.398,
				uuid = "68616e57-6668-4bc2-b7b0-0c4dba1fdba8",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "2ac4da93-e81c-a590-a1fc-841327a1f787",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"cb6d9764-7799-1652-b582-7b7b424af3fc",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "fca73e4a-4694-9779-9d83-345857b3657e",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "cb6d9764-7799-1652-b582-7b7b424af3fc",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 10.172,
				name = "[DRK R1][MT] Reprisal 00:07",
				timelineIndex = 1,
				timerOffset = -2.998,
				uuid = "46bf178c-39da-c366-9302-2939b4ce66d3",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"c12db5f3-2837-3c0f-9830-4d757469a69a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "10a3ebf2-46dd-0f74-ac55-6882cae83c64",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "c12db5f3-2837-3c0f-9830-4d757469a69a",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 10.172,
				name = "[DRK R1][MT] Rampart 00:14",
				timelineIndex = 1,
				timerOffset = 3.872,
				uuid = "f3ad028c-ea84-a10c-8498-184927515a4b",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\DPS Coach",
				uuid = "67288c4e-7e4c-132e-b469-f60291b44ce3",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\DPS Automation",
				uuid = "ea7ad47d-8345-546a-9555-5a88396cd9fb",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				actions = 
				{
				},
				conditions = 
				{
				},
				displayPath = "Rank 1\\DPS Automation",
				execute = "local player=TensorCore.mGetPlayer()\nif player==nil or player.job~=32 then self.used=true return end\nlocal selected=gACRSelectedProfiles and gACRSelectedProfiles[player.job] or nil\nif type(selected)~=\"string\" or _G[\"ACR_\"..selected..\"_TankStance\"]~=\"mt\" then self.used=true return end\nTensorCore.API.TensorACR.holdActionUntil(846,Now()+2500,1)\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 10.172,
				name = "[DRK Opt][MT] Hold Potion to 01:55",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 103.105,
				timerStartOffset = -10.172,
				uuid = "b8f59577-d6a0-990e-8ccb-1e438f9507cd",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
				},
				conditions = 
				{
				},
				displayPath = "Rank 1\\DPS Automation",
				execute = "local player=TensorCore.mGetPlayer()\nif player==nil or player.job~=32 then self.used=true return end\nlocal selected=gACRSelectedProfiles and gACRSelectedProfiles[player.job] or nil\nif type(selected)~=\"string\" or _G[\"ACR_\"..selected..\"_TankStance\"]~=\"mt\" then self.used=true return end\nTensorCore.API.TensorACR.holdActionUntil(3639,Now()+2500,1)\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 10.172,
				name = "[DRK Opt][MT] Hold Salted Earth to 02:09",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 117.564,
				timerStartOffset = 86.328,
				uuid = "0caeafa0-dfed-2410-80bb-2b34a725b39c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
				},
				conditions = 
				{
				},
				displayPath = "Rank 1\\DPS Automation",
				execute = "local player=TensorCore.mGetPlayer()\nif player==nil or player.job~=32 then self.used=true return end\nlocal selected=gACRSelectedProfiles and gACRSelectedProfiles[player.job] or nil\nif type(selected)~=\"string\" or _G[\"ACR_\"..selected..\"_TankStance\"]~=\"mt\" then self.used=true return end\nTensorCore.API.TensorACR.holdActionUntil(846,Now()+2500,1)\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 10.172,
				name = "[DRK Opt][MT] Hold Potion to 07:58",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 465.926,
				timerStartOffset = 372.328,
				uuid = "f0236df7-ba0b-003c-ad83-bf052d260cc3",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "e2673b79-d7ed-ff46-bd08-e2bb00a5c43b",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "c6bb4a33-0aaa-80f3-9377-348e3e0b6e58",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"df04f316-9605-29bf-877e-0438bd57da4a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "15b14e36-c9c8-c85a-96fc-2bafcd31a46a",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "df04f316-9605-29bf-877e-0438bd57da4a",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 18.328,
				name = "[DRK R1][MT] Dark Mind 00:14",
				timelineIndex = 2,
				timerOffset = -3.613,
				uuid = "d957bc1d-8f7d-543e-9c79-0f77897f0eeb",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"3efc9eca-0019-3620-9d3c-7068407ff752",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "647bd664-cf05-7d76-93fe-5069a5ef56df",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "3efc9eca-0019-3620-9d3c-7068407ff752",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 18.328,
				name = "[DRK R1][MT] The Blackest Night 00:19",
				timelineIndex = 2,
				timerOffset = 0.799,
				uuid = "f95118db-0717-9902-a055-e9d8092bf1a3",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "12196604-c55c-57a3-9227-0ea4fe163e77",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"f7a4d9e6-cfbc-175d-9e02-d9f1af5c01ba",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "5d63d4a0-25e8-92d1-a4c2-ca858ea378ff",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "f7a4d9e6-cfbc-175d-9e02-d9f1af5c01ba",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 20.344,
				name = "[DRK R1][MT] Oblation 00:20",
				timelineIndex = 3,
				timerOffset = -0.065,
				uuid = "9ac06bf0-7233-150f-bdf9-fcb7cb2ea316",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "0be251a8-e397-6c8f-b073-171829a069fa",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "0c3c7ed9-c479-ba8e-a479-92a79c46bf7d",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "3af684d0-a6d8-dd7b-97bf-d26562aad728",
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
							actionID = 3629,
							conditions = 
							{
								
								{
									"0075555f-e83f-fd49-a5d1-a2386e9ca0e4",
									true,
								},
								
								{
									"cc56179b-c625-508a-8770-fc34987f436d",
									true,
								},
								
								{
									"7e24d055-7568-357c-ab50-29ba9b3c9648",
									true,
								},
								
								{
									"d2580ea8-a3d8-bced-8917-dd8c1f09d907",
									true,
								},
								
								{
									"1f94666b-d44c-2390-b594-e875ab624054",
									true,
								},
								
								{
									"71d24476-0d42-e3d8-9837-a091f8908e21",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Hotbar_Grit",
							name = "Grit - self",
							uuid = "51b0f352-dcc2-eb2d-9792-64d161ec0367",
							variableTogglesType = 2,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "0075555f-e83f-fd49-a5d1-a2386e9ca0e4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "cc56179b-c625-508a-8770-fc34987f436d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "7e24d055-7568-357c-ab50-29ba9b3c9648",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "d2580ea8-a3d8-bced-8917-dd8c1f09d907",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 3629,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "1f94666b-d44c-2390-b594-e875ab624054",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 743,
							category = "Self",
							name = "Grit missing",
							uuid = "71d24476-0d42-e3d8-9837-a091f8908e21",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 20.344,
				name = "[WAR+DRK][OT] Grit 00:04 - Build second enmity",
				timeRange = true,
				timelineIndex = 3,
				timerEndOffset = -15.315,
				timerOffset = 2.299,
				timerStartOffset = -16.315,
				uuid = "ea5d0892-8cf1-62c0-bed9-ddc372d12d2e",
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
							actionID = 36927,
							conditions = 
							{
								
								{
									"db854d05-afde-a9ab-9f3e-6918c65285c1",
									true,
								},
								
								{
									"ad561ea6-89cf-c742-83fc-08284d8cd7af",
									true,
								},
								
								{
									"d7a55d22-5c11-830d-bf88-f0fa90a4fe27",
									true,
								},
								
								{
									"17f3753a-1545-7ac6-a254-064dad91c4d5",
									true,
								},
								
								{
									"fb0da638-6f2d-b45c-b732-13b4ef5295d9",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "Shadowed Vigil - self",
							uuid = "c50d3977-85a9-90da-b12a-f4957cc28ada",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "db854d05-afde-a9ab-9f3e-6918c65285c1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "ad561ea6-89cf-c742-83fc-08284d8cd7af",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "d7a55d22-5c11-830d-bf88-f0fa90a4fe27",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "17f3753a-1545-7ac6-a254-064dad91c4d5",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 36927,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "fb0da638-6f2d-b45c-b732-13b4ef5295d9",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 20.344,
				name = "[WAR+DRK][OT] Shadowed Vigil 00:17 - Hardcore",
				timeRange = true,
				timelineIndex = 3,
				timerEndOffset = -2.71,
				timerOffset = -0.826,
				timerStartOffset = -3.71,
				uuid = "5941e68d-c71f-12b9-94f5-264186e615e0",
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
							actionID = 25754,
							conditions = 
							{
								
								{
									"99c605db-78f1-dc08-a57c-68827a766899",
									true,
								},
								
								{
									"38980f5d-70af-1482-8b84-4de655b99263",
									true,
								},
								
								{
									"9da61e12-ce50-0ecc-a4f3-60b80a7db866",
									true,
								},
								
								{
									"7c9b082c-50d7-3ae4-bff7-8f7516aa319a",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "Oblation - self",
							uuid = "1436046d-3d72-3f2a-8b70-0c536f362d67",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "99c605db-78f1-dc08-a57c-68827a766899",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "38980f5d-70af-1482-8b84-4de655b99263",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "9da61e12-ce50-0ecc-a4f3-60b80a7db866",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "7c9b082c-50d7-3ae4-bff7-8f7516aa319a",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 20.344,
				name = "[WAR+DRK][OT] Oblation 00:24 - Hardcore",
				timeRange = true,
				timelineIndex = 3,
				timerEndOffset = 4.768,
				timerOffset = 0.665,
				timerStartOffset = 3.768,
				uuid = "edd075e2-59be-3bfe-956a-c52462db00fe",
				version = 2,
			},
		},
	}, 
	[5] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "4b47351f-6296-14fb-11a1-4bf54c97d3af",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[6] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "f0d4ecc2-1502-fcee-eb73-2eec117d63d2",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "1a6ba6f3-5ec3-5faf-a270-6a1a513ebc9d",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "c1389817-874c-ea0b-ad63-d37f7a8b2b92",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"a1eebbc4-23f2-ae4b-9944-ca339361ebbf",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "8bf3af6b-524d-7d47-963f-b950ddc5ca93",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "a1eebbc4-23f2-ae4b-9944-ca339361ebbf",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 45.5,
				name = "[DRK R1][MT] Dark Missionary 00:44",
				timelineIndex = 6,
				timerOffset = -1.058,
				uuid = "c096ed3e-a470-7e03-85f4-de77c94beca6",
				version = 2,
			},
		},
	},
	[7] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "74200ca7-f7c8-51f0-8f06-14a3cbdb3f36",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "80737b98-f497-6b56-8e26-ef942abf943f",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "a8425d45-cdbc-0aaf-a959-0be69951556b",
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
							actionID = 7535,
							conditions = 
							{
								
								{
									"09e08100-c665-87da-9655-811402e560ad",
									true,
								},
								
								{
									"c65c979b-fb8b-1f57-9d35-ccf8f674e011",
									true,
								},
								
								{
									"f06340dd-7c8b-bbe9-9ad5-00c9da96563c",
									true,
								},
								
								{
									"c70e5e23-bab1-1f6a-a8ed-94a5e710313a",
									true,
								},
								
								{
									"51d5335d-f80d-ccc8-b6f5-24d547590c76",
									true,
								},
								
								{
									"ec1f8310-0573-b8ce-ab34-cddb501a8713",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "Reprisal - self",
							uuid = "dd56ec8a-686d-63ec-bda2-b2fd1aea7df3",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "09e08100-c665-87da-9655-811402e560ad",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "c65c979b-fb8b-1f57-9d35-ccf8f674e011",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "f06340dd-7c8b-bbe9-9ad5-00c9da96563c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "c70e5e23-bab1-1f6a-a8ed-94a5e710313a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7535,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "51d5335d-f80d-ccc8-b6f5-24d547590c76",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 4,
							inRangeValue = 5,
							name = "Boss in Reprisal radius",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "ec1f8310-0573-b8ce-ab34-cddb501a8713",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				enabled = false,
				mechanicTime = 46.704,
				name = "[WAR+DRK][OT] Reprisal 00:45 - Brutal Rain",
				timeRange = true,
				timelineIndex = 7,
				timerEndOffset = -1.104,
				timerOffset = -4.311,
				timerStartOffset = -2.104,
				uuid = "253f9193-fae9-7cd6-9e22-38cb67a6248c",
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
							actionID = 32067,
							conditions = 
							{
								
								{
									"614f243c-ce3f-8526-954b-f920abb3112a",
									true,
								},
								
								{
									"b45eb31d-cd7c-3af0-96f3-1661f348fe37",
									true,
								},
								
								{
									"e543485b-4c85-3abd-9064-32bcf6852bef",
									true,
								},
								
								{
									"6e851e9a-a9b7-31ee-9a60-9ac80eda3013",
									true,
								},
								
								{
									"466ef035-ab21-21c9-b0ea-c900723a6587",
									true,
								},
								
								{
									"f55ec0f5-b1ee-3879-a7f0-437f48decb35",
									false,
								},
							},
							endIfUsed = true,
							name = "Release Grit - self",
							uuid = "405c29e8-3fd7-bd23-9250-ac8cc80558a6",
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "614f243c-ce3f-8526-954b-f920abb3112a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "b45eb31d-cd7c-3af0-96f3-1661f348fe37",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "e543485b-4c85-3abd-9064-32bcf6852bef",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "6e851e9a-a9b7-31ee-9a60-9ac80eda3013",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 32067,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "466ef035-ab21-21c9-b0ea-c900723a6587",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 743,
							category = "Self",
							name = "Grit missing",
							uuid = "f55ec0f5-b1ee-3879-a7f0-437f48decb35",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 46.704,
				name = "[WAR+DRK][OT] Release Grit 00:46 - WAR keeps boss",
				timeRange = true,
				timelineIndex = 7,
				timerEndOffset = 0.679,
				timerStartOffset = -0.321,
				uuid = "c19f1329-7196-c8c4-9f65-ff355ef9eac9",
				version = 2,
			},
		},
	},
	[8] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "b5eca110-55f8-e6e4-305b-10a69776eee0",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[11] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "1256347e-fd16-594b-b536-e1e29665f266",
			},
			objectType = "folder",
		},
	},
	[12] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "b90bfdd3-8068-291f-029d-6e611154a3e3",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[14] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "e42e571d-499e-78c1-a44c-1abff394526d",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[15] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "0a8568ca-71fe-7c3e-cebd-320c1a8c13da",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[29] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\DPS Coach",
				uuid = "ed856704-1489-cfbe-a54b-8d83ec73199d",
			},
			objectType = "folder",
		},
	},
	[31] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "a49f721a-54f7-7fc6-b5b3-6ee8ba2f5240",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "2619b58d-bfec-09b6-8856-47df32b4dad8",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "79849b48-7503-5e50-81fb-7c2c8e3a5b9c",
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
							actionID = 16471,
							conditions = 
							{
								
								{
									"bd0a1bfa-8882-5920-8fbd-476988bed75b",
									true,
								},
								
								{
									"161f3e52-3229-8f42-a8d6-378ae4f6fd4d",
									true,
								},
								
								{
									"dce27f96-0dd7-908a-a1d8-249e138be6aa",
									true,
								},
								
								{
									"2f3bd448-f287-396a-863b-2a988fb7ec07",
									true,
								},
								
								{
									"287a520d-9821-3538-a2ef-02c7c2520d34",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "Dark Missionary - self",
							uuid = "25b4b66f-d2ab-779a-8acf-0d20c47449db",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "bd0a1bfa-8882-5920-8fbd-476988bed75b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "161f3e52-3229-8f42-a8d6-378ae4f6fd4d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "dce27f96-0dd7-908a-a1d8-249e138be6aa",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "2f3bd448-f287-396a-863b-2a988fb7ec07",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 16471,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "287a520d-9821-3538-a2ef-02c7c2520d34",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 120.407,
				name = "[WAR+DRK][OT] Dark Missionary 01:55 - Coffinfiller / Half Moon",
				timeRange = true,
				timelineIndex = 31,
				timerEndOffset = -4.892,
				timerOffset = 2.612,
				timerStartOffset = -5.892,
				uuid = "a098f375-c69d-9711-be14-77c09be71708",
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
							actionID = 7535,
							conditions = 
							{
								
								{
									"d90aa464-c3cd-be62-af8f-13bbe897819a",
									true,
								},
								
								{
									"a180b0eb-da3f-c300-9a8a-08d21c9133a3",
									true,
								},
								
								{
									"fc8df0aa-daff-7e1e-9b09-a8c3d3a3516d",
									true,
								},
								
								{
									"d1edc320-e373-7e89-9672-1cd9e9b8d97a",
									true,
								},
								
								{
									"61d38030-21a8-d06d-a091-c19b6a739cc4",
									true,
								},
								
								{
									"ad4fa454-ad03-be6f-9873-b235c19c5936",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "Reprisal - self",
							uuid = "54dc2efe-4e91-a502-9f1c-78d8a3b781cd",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "d90aa464-c3cd-be62-af8f-13bbe897819a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "a180b0eb-da3f-c300-9a8a-08d21c9133a3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "fc8df0aa-daff-7e1e-9b09-a8c3d3a3516d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "d1edc320-e373-7e89-9672-1cd9e9b8d97a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7535,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "61d38030-21a8-d06d-a091-c19b6a739cc4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 4,
							inRangeValue = 5,
							name = "Boss in Reprisal radius",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "ad4fa454-ad03-be6f-9873-b235c19c5936",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 120.407,
				name = "[WAR+DRK][OT] Reprisal 01:57 - Coffinfiller / Half Moon",
				timeRange = true,
				timelineIndex = 31,
				timerEndOffset = -2.753,
				timerOffset = -0.944,
				timerStartOffset = -3.753,
				uuid = "37271d4f-791e-7070-ae86-98286452da5d",
				version = 2,
			},
		},
	},
	[32] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "d0039b61-bcea-086d-eba5-d0d3c0d117f1",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[34] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "71b247bf-daaa-59e3-16c8-2a1de51a090f",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "c41bd669-f98c-084d-9b03-878484c7c439",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"e3f173e7-de4c-7129-9056-a7158767db2d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "c9ec3524-6812-72d1-b5a1-e3e0417b1d96",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "e3f173e7-de4c-7129-9056-a7158767db2d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 137.532,
				name = "[DRK R1][MT] Reprisal 02:14",
				timelineIndex = 34,
				timerOffset = -2.709,
				uuid = "372cf2e8-7088-c09b-b777-4ba7f6dfd4e3",
				version = 2,
			},
		},
	},
	[36] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "4fc9bbe0-efac-ee30-8bf1-3099cc1f5506",
			},
			objectType = "folder",
		},
	},
	[37] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "f22e71e2-76cb-f0f6-ad72-04f4264253b2",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[39] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "8331b1b0-07e0-18fc-8662-b4fe87a0d740",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[41] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "b3371ebf-d845-8dd3-5cfe-bbc1269ee00f",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[45] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "c559cb8a-4c8d-b2ec-82ac-72fff9fdee27",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "4328fcd4-31ed-cf10-8627-96873bdd512f",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"9ba75458-1a3f-e606-a28e-8bfa2187a9ed",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "a6eed2e8-3f93-9746-8e60-a6f2167575e4",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "9ba75458-1a3f-e606-a28e-8bfa2187a9ed",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 198.766,
				name = "[DRK R1][MT] Rampart 03:22",
				timelineIndex = 45,
				timerOffset = 3.902,
				uuid = "6eb4a8dc-c220-cf87-889a-d0bc7dc587db",
				version = 2,
			},
		},
	},
	[46] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "4684e243-1db8-6df7-9b1a-f9918641a3db",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"218ec542-166b-3a1b-a797-9cb3a90650cb",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "8991136f-9aaf-0c49-9371-77fe56d9fafd",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "218ec542-166b-3a1b-a797-9cb3a90650cb",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 207.251,
				name = "[DRK R1][MT] Reprisal 03:23",
				timelineIndex = 46,
				timerOffset = -3.921,
				uuid = "1d3757da-cae8-e3a5-b708-217619220933",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "04b02a53-0ff0-1793-93ad-800c73681ee2",
			},
			objectType = "folder",
		},
	},
	[48] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "52b17b30-c140-43a2-a913-8e099c8ade11",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"e92edf88-0565-3bf4-81cb-d0f7509cfc09",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "81f9fc50-6fe9-f2e6-9218-aa3f1b4fbf45",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "e92edf88-0565-3bf4-81cb-d0f7509cfc09",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 211.251,
				name = "[DRK R1][MT] Dark Mind 03:30",
				timelineIndex = 48,
				timerOffset = -0.524,
				uuid = "03a8b8f8-33fa-1b76-944c-d537898c969a",
				version = 2,
			},
		},
	},
	[49] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "e70209e6-e536-8786-9451-4ca3ff18bf65",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"6e942ce2-e2e4-fbc3-8da6-27024a146fea",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "f5b24119-25f0-2711-a9f4-38ba5ccc3882",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "6e942ce2-e2e4-fbc3-8da6-27024a146fea",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 213.251,
				name = "[DRK R1][MT] Oblation 03:32",
				timelineIndex = 49,
				timerOffset = -0.607,
				uuid = "85f5f01e-7bcf-b64f-b47a-c5e59cddf243",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "72e6af12-c45b-282e-9946-178b37e53f99",
			},
			objectType = "folder",
		},
	},
	[50] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "be46840a-609c-5997-bc61-d2ec552e8f1a",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "d0c47cbc-4eec-86a4-af65-265a517002fe",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"29e58e69-3992-495a-9301-6c2e5caab8b2",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "8c565bb0-226d-5a8e-bb76-29aaaab373e2",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "29e58e69-3992-495a-9301-6c2e5caab8b2",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 218.142,
				name = "[DRK R1][MT] The Blackest Night 03:37",
				timelineIndex = 50,
				timerOffset = -0.411,
				uuid = "88ee23dc-bb44-3251-bd1d-18573c2beb30",
				version = 2,
			},
		},
	},
	[51] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "ce7bf129-fcc0-0117-bc94-9f26f929baed",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "0a245116-21e1-8b94-ada1-ee8e3904e3aa",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "4316d090-cbe9-d969-8752-149ebe335ec6",
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
							actionID = 7531,
							conditions = 
							{
								
								{
									"94fc339e-7c0a-f163-b2b0-2b1b671cb618",
									true,
								},
								
								{
									"f41bfd1c-24ef-79e9-a319-51251ce66a4d",
									true,
								},
								
								{
									"72f04eea-8070-2e1b-994a-94384d6308bc",
									true,
								},
								
								{
									"ee075797-f3e7-dcbe-8231-945a34e3a044",
									true,
								},
								
								{
									"fc5d8e9a-c8b1-9fe3-bde8-bb88c8b10263",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "Rampart - self",
							uuid = "c4e2f773-2292-bdd6-9639-f536930a12d6",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "94fc339e-7c0a-f163-b2b0-2b1b671cb618",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "f41bfd1c-24ef-79e9-a319-51251ce66a4d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "72f04eea-8070-2e1b-994a-94384d6308bc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "ee075797-f3e7-dcbe-8231-945a34e3a044",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7531,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "fc5d8e9a-c8b1-9fe3-bde8-bb88c8b10263",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 220.142,
				name = "[WAR+DRK][OT] Rampart 03:34 - Hardcore",
				timeRange = true,
				timelineIndex = 51,
				timerEndOffset = -4.708,
				timerOffset = 3.27,
				timerStartOffset = -5.708,
				uuid = "fe601321-6454-6c05-b72a-edb4ead01849",
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
							actionID = 3634,
							conditions = 
							{
								
								{
									"74907c03-79b9-b8b3-b8e8-d4670e26ea65",
									true,
								},
								
								{
									"2a518b43-5ce9-f901-9d4b-e9fa47278e2a",
									true,
								},
								
								{
									"7f7b1a1a-e0fa-623f-a94e-96572063769a",
									true,
								},
								
								{
									"51065bad-3b0d-2aa0-b0ea-424859b6e672",
									true,
								},
								
								{
									"a4b404a8-e60d-dcb0-80d0-ed29b34f3888",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "Dark Mind - self",
							uuid = "f71785a5-c804-a1e3-94dc-34ed69cee9d9",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "74907c03-79b9-b8b3-b8e8-d4670e26ea65",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "2a518b43-5ce9-f901-9d4b-e9fa47278e2a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "7f7b1a1a-e0fa-623f-a94e-96572063769a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "51065bad-3b0d-2aa0-b0ea-424859b6e672",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 3634,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "a4b404a8-e60d-dcb0-80d0-ed29b34f3888",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 220.142,
				name = "[WAR+DRK][OT] Dark Mind 03:35 - Hardcore",
				timeRange = true,
				timelineIndex = 51,
				timerEndOffset = -4.085,
				timerOffset = -0.086,
				timerStartOffset = -5.085,
				uuid = "2bec47b7-d931-68ac-87b1-6d773af31d58",
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
							actionID = 25754,
							conditions = 
							{
								
								{
									"6cc4b23d-eac8-4635-b499-874b01002eb2",
									true,
								},
								
								{
									"65acaaec-e220-fcdd-8944-da1e97541aab",
									true,
								},
								
								{
									"23623481-fe4a-9f55-881f-7f249d720ee0",
									true,
								},
								
								{
									"a76b6dae-afad-d0e3-8dfb-1740ceecb64d",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "Oblation - self",
							uuid = "b5c686cd-00f0-b1f3-a92d-915511ac7734",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "6cc4b23d-eac8-4635-b499-874b01002eb2",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "65acaaec-e220-fcdd-8944-da1e97541aab",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "23623481-fe4a-9f55-881f-7f249d720ee0",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "a76b6dae-afad-d0e3-8dfb-1740ceecb64d",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 220.142,
				name = "[WAR+DRK][OT] Oblation 03:37 - Hardcore",
				timeRange = true,
				timelineIndex = 51,
				timerEndOffset = -2.479,
				timerOffset = -0.683,
				timerStartOffset = -3.479,
				uuid = "4cb8e20a-1f67-f268-92e9-9549a85581d4",
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
							actionID = 7393,
							conditions = 
							{
								
								{
									"faa6d07a-643d-0880-8994-86e0fb9d20db",
									true,
								},
								
								{
									"63df446f-972c-b705-a9db-fad189c3670a",
									true,
								},
								
								{
									"f64d7177-3a9c-cfbc-8ea1-0a75f7ec2c92",
									true,
								},
								
								{
									"07dc75ab-e77b-f971-85b2-0c058c964107",
									true,
								},
								
								{
									"394a65c9-709b-222c-9a9e-6bb2b3ebdd9f",
									true,
								},
								
								{
									"42121087-2f4f-491b-8cb7-197938ea116d",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "The Blackest Night - self",
							uuid = "3ffc86bf-5927-a0ad-83ce-ccead13de360",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "faa6d07a-643d-0880-8994-86e0fb9d20db",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "63df446f-972c-b705-a9db-fad189c3670a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "f64d7177-3a9c-cfbc-8ea1-0a75f7ec2c92",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "07dc75ab-e77b-f971-85b2-0c058c964107",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7393,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "394a65c9-709b-222c-9a9e-6bb2b3ebdd9f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 3,
							mpType = 2,
							mpValue = 3000,
							name = "TBN 3000 MP",
							uuid = "42121087-2f4f-491b-8cb7-197938ea116d",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 220.142,
				name = "[WAR+DRK][OT] The Blackest Night 03:37 - Hardcore",
				timeRange = true,
				timelineIndex = 51,
				timerEndOffset = -1.946,
				timerOffset = -0.072,
				timerStartOffset = -2.946,
				uuid = "91e1944c-77b1-59cf-a0b7-9e3ea3ddb350",
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
							actionID = 25754,
							conditions = 
							{
								
								{
									"3474c064-3e97-fc87-bb7c-2ca67d4edde9",
									true,
								},
								
								{
									"2104e818-1c0e-90a9-877d-85f8ac7add35",
									true,
								},
								
								{
									"d1d5ecd5-7c33-a54b-884d-80424d58f93b",
									true,
								},
								
								{
									"0368510e-44f1-d596-844a-dc5fd1c63fb8",
									true,
								},
								
								{
									"9595e025-b414-98ed-8fad-7d6e5eb19914",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "Oblation - WAR",
							targetType = "Other Tank",
							uuid = "604e6482-9df1-e228-a56b-ab6bd462a81e",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "3474c064-3e97-fc87-bb7c-2ca67d4edde9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "2104e818-1c0e-90a9-877d-85f8ac7add35",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "d1d5ecd5-7c33-a54b-884d-80424d58f93b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "0368510e-44f1-d596-844a-dc5fd1c63fb8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 4,
							inRangeValue = 30,
							name = "Co-tank in range",
							partyTargetType = "Other Tank",
							uuid = "9595e025-b414-98ed-8fad-7d6e5eb19914",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 220.142,
				name = "[WAR+DRK][OT] Oblation 03:44 - Hardcore",
				timeRange = true,
				timelineIndex = 51,
				timerEndOffset = 5.309,
				timerOffset = 0.876,
				timerStartOffset = 4.309,
				uuid = "f27d13d4-7e07-b5c3-9a27-9bbf1bc684c0",
				version = 2,
			},
		},
	},
	[53] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "f1c2483c-50f6-8d40-7bb0-ab6a338c100c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[54] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "034962d1-717e-d7a5-a828-be363af5bb04",
			},
			objectType = "folder",
		},
	},
	[58] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "a2f763ad-8a26-cdf1-ce82-827f09bdf87d",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "8eff2479-23c0-0166-b3f4-89817b97dcf3",
			},
			objectType = "folder",
		},
	},
	[59] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "bfa8daf1-4e7e-326f-964a-8cd2ae53dfd6",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "a300b444-c17f-aae2-97eb-971fe6e0835d",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "d8b80c11-8b62-0cd9-9b10-f3bd217c3bfc",
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
							actionID = 16471,
							conditions = 
							{
								
								{
									"988464f2-5147-ef10-87af-97d3442c3a0f",
									true,
								},
								
								{
									"8297915c-5740-96a5-aa0e-eb152427db7c",
									true,
								},
								
								{
									"23931965-2dad-d72f-a1fd-7ce8ea352060",
									true,
								},
								
								{
									"471e01c7-55c9-c111-922b-517413f2ee4a",
									true,
								},
								
								{
									"26c8a445-7af6-a30e-9c3a-9bfb4de4a89d",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "Dark Missionary - self",
							uuid = "806d1cef-fbdb-2090-9e8d-05df9f6366ef",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "988464f2-5147-ef10-87af-97d3442c3a0f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "8297915c-5740-96a5-aa0e-eb152427db7c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "23931965-2dad-d72f-a1fd-7ce8ea352060",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "471e01c7-55c9-c111-922b-517413f2ee4a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 16471,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "26c8a445-7af6-a30e-9c3a-9bfb4de4a89d",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 256.673,
				name = "[WAR+DRK][OT] Dark Missionary 04:15 - Brutal Rain",
				timeRange = true,
				timelineIndex = 59,
				timerEndOffset = -0.883,
				timerOffset = 3.732,
				timerStartOffset = -1.883,
				uuid = "bda1b067-a650-c9f0-b646-9de6f9bfc60f",
				version = 2,
			},
		},
	},
	[60] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "52c4ec3e-1168-01e2-1042-090c4b2585ce",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "0a73b7d9-e59c-82e5-9811-ba4ad70ea743",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"e5b1a3c6-cc25-5387-ba73-515d6dc6f71e",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "60aba7dd-17fc-9091-8cfe-f1e49737a4c0",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "e5b1a3c6-cc25-5387-ba73-515d6dc6f71e",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 257.751,
				name = "[DRK R1][MT] Dark Missionary 04:17",
				timelineIndex = 60,
				timerOffset = -0.012,
				uuid = "c408e75f-cdd5-4226-835e-6e8f30673066",
				version = 2,
			},
		},
	},
	[66] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "ee2bd1ec-a62f-9de8-8809-835e47a6223c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[67] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "612e991f-71a6-91eb-4422-456115d76f6f",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "b892d66c-c8ca-91e9-bd4a-f48c3f5da849",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "4ece1b6d-fd70-0d00-8206-6c3c2c58dc97",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Retired old OT",
				uuid = "eca79e93-1f93-cbd4-af95-9ce6a808dbaa",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"2404c84a-bd7c-4eff-82f2-52f94865278e",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_Provoke",
							name = "OT - Provoke",
							uuid = "a4c17d8d-3cd8-97ef-84d1-814fceb295c0",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "2404c84a-bd7c-4eff-82f2-52f94865278e",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 283.095,
				name = "[DRK R1][OT] Provoke 04:37 - superseded",
				timelineIndex = 67,
				timerOffset = -5.341,
				uuid = "67fb62c7-63b5-8060-b2ef-0756ceceb50a",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "e5b1d64f-5e1c-c134-a12f-d23b33e23be9",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"4dbe7e6d-38a3-8c32-b8dc-e8994133c2d3",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ShirkMouse",
							name = "MT - Shirk",
							targetType = "Other Tank",
							uuid = "408fbc64-84fe-f851-81c7-a49899a24550",
							variableIsHover = true,
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "4dbe7e6d-38a3-8c32-b8dc-e8994133c2d3",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 283.095,
				name = "[DRK R1][MT] Shirk 04:39",
				timelineIndex = 67,
				timerOffset = -3.419,
				uuid = "eab1108b-a5c9-599e-b468-5d1c3468634f",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"c958d6ee-ae87-7a26-818c-215c22f2298c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "355a92ff-5a22-c41e-8098-9afd1e1995de",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "c958d6ee-ae87-7a26-818c-215c22f2298c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 283.095,
				name = "[DRK R1][MT] Reprisal 04:40",
				timelineIndex = 67,
				timerOffset = -2.663,
				uuid = "f0c969ae-b8ab-0077-8853-c9578bcfba26",
				version = 2,
			},
		},
	},
	[68] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "3313b3a6-32b2-3aaa-37ea-ec547b65e536",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "3aa62bb3-81c9-4265-a5f8-6b6d6205e2b8",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"3ea5e717-dd7b-c40b-baf1-661d562ed10d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "dd0bb36d-0820-e844-a879-e706b3200bc4",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "3ea5e717-dd7b-c40b-baf1-661d562ed10d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 284.001,
				name = "[DRK R1][MT] Dark Mind 04:48",
				timelineIndex = 68,
				timerOffset = 4.183,
				uuid = "24fff52a-34cc-69fb-ab21-e8b35e5fa343",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"8bffd600-c8bb-41b4-b524-7e44dcb4d216",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "f2d808dd-67d8-247e-942e-b2b1f49773f9",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "8bffd600-c8bb-41b4-b524-7e44dcb4d216",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 284.001,
				name = "[DRK R1][MT] Oblation 04:49",
				timelineIndex = 68,
				timerOffset = 5.525,
				uuid = "e0f3ac30-e089-a1ef-b529-8bc2dad0b2bc",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "5a847599-d2c1-9c65-81fa-ec3226643efa",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "3eba3b83-e950-1080-885c-922aa7d75314",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "e5b871e8-7007-f566-b3a9-cec6422d4f46",
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
							actionID = 7535,
							conditions = 
							{
								
								{
									"84a03110-ad55-0899-9715-1523861e3012",
									true,
								},
								
								{
									"badb8344-570b-91f2-936c-91d678cb011c",
									true,
								},
								
								{
									"b8872651-13f7-77eb-b903-1c07ee6ba926",
									true,
								},
								
								{
									"53a54f8b-ba16-f100-bad5-f431544ac283",
									true,
								},
								
								{
									"cb39a295-c692-d800-9f6f-ea75fa755798",
									true,
								},
								
								{
									"3f6c6940-9d75-74ae-9988-07abfc7260ec",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "Reprisal - self",
							uuid = "bbd3943b-a8b7-af8c-8b19-fe819372ae30",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "84a03110-ad55-0899-9715-1523861e3012",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "badb8344-570b-91f2-936c-91d678cb011c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "b8872651-13f7-77eb-b903-1c07ee6ba926",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "53a54f8b-ba16-f100-bad5-f431544ac283",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7535,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "cb39a295-c692-d800-9f6f-ea75fa755798",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 4,
							inRangeValue = 5,
							name = "Boss in Reprisal radius",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "3f6c6940-9d75-74ae-9988-07abfc7260ec",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 284.001,
				name = "[WAR+DRK][OT] Reprisal 04:41 - Sadistic Screech",
				timeRange = true,
				timelineIndex = 68,
				timerEndOffset = -2.217,
				timerOffset = 0.718,
				timerStartOffset = -3.217,
				uuid = "f0fa2050-feba-6ff6-bbad-d6327775db33",
				version = 2,
			},
		},
	},
	[69] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "b9ae8c73-c1c9-e4d7-a79c-c9c18576f9ed",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"6af24e47-b8c1-7da0-9f83-5b121fe6f0a1",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "08853a5d-3cd6-66b6-9005-65a411c4ca1e",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "6af24e47-b8c1-7da0-9f83-5b121fe6f0a1",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 296.251,
				name = "[DRK R1][MT] The Blackest Night 04:52",
				timelineIndex = 69,
				timerOffset = -4.188,
				uuid = "4fdfde09-77ae-081f-b508-8ddcc0c64a28",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "04bb9004-a52a-9b2b-9496-ec1a776fa510",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "0b88a15a-36d2-ad00-8fce-9d77733e1d9c",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "833fa320-45b8-a704-99b8-8d7c5df215e6",
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
							actionID = 3634,
							conditions = 
							{
								
								{
									"c8dae759-9f18-8bbc-aa17-ee72c1cfbe46",
									true,
								},
								
								{
									"ca68fc3b-ac5a-2bbf-834c-de3990ca3ed8",
									true,
								},
								
								{
									"0fdaaedf-d22a-dc13-b1d1-5d3eee6a6c68",
									true,
								},
								
								{
									"f054a401-ef5e-cac2-b7a6-65cd4b176eee",
									true,
								},
								
								{
									"79fb9661-112e-e41c-922a-f68021bca9d7",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "Dark Mind - self",
							uuid = "6fe01a35-f862-5c51-b362-02b4c1110c62",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "c8dae759-9f18-8bbc-aa17-ee72c1cfbe46",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "ca68fc3b-ac5a-2bbf-834c-de3990ca3ed8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "0fdaaedf-d22a-dc13-b1d1-5d3eee6a6c68",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "f054a401-ef5e-cac2-b7a6-65cd4b176eee",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 3634,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "79fb9661-112e-e41c-922a-f68021bca9d7",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 296.251,
				name = "[WAR+DRK][OT] Dark Mind 04:50 - Electrocution / Plummet",
				timeRange = true,
				timelineIndex = 69,
				timerEndOffset = -4.934,
				timerOffset = -0.02,
				timerStartOffset = -5.934,
				uuid = "829305e0-4ac3-4c91-9d53-04936e9bc10c",
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
							actionID = 25754,
							conditions = 
							{
								
								{
									"1aaed0a2-6fbd-549c-8c59-d6605b7663c4",
									true,
								},
								
								{
									"233d4a89-a4dd-2b51-bd59-f47736fc7f7e",
									true,
								},
								
								{
									"1f9f9634-6dcc-ef54-9406-c746275b34ee",
									true,
								},
								
								{
									"3be76d92-4b91-726d-8aa3-13eded81b634",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "Oblation - self",
							uuid = "1b1cdb5f-bf5a-c1f2-aee8-9bf5d124421f",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "1aaed0a2-6fbd-549c-8c59-d6605b7663c4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "233d4a89-a4dd-2b51-bd59-f47736fc7f7e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "1f9f9634-6dcc-ef54-9406-c746275b34ee",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "3be76d92-4b91-726d-8aa3-13eded81b634",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 296.251,
				name = "[WAR+DRK][OT] Oblation 04:51 - Electrocution / Plummet",
				timeRange = true,
				timelineIndex = 69,
				timerEndOffset = -4.219,
				timerOffset = 0.74,
				timerStartOffset = -5.219,
				uuid = "a3c865c9-1ab0-c12e-a34e-b29800fa96c9",
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
							actionID = 7393,
							conditions = 
							{
								
								{
									"af915788-8300-116a-92e1-ecbfe48df129",
									true,
								},
								
								{
									"262042b1-28a9-149a-90ca-12652848c490",
									true,
								},
								
								{
									"44527a4c-746b-410c-b9a0-e86c5a3191b7",
									true,
								},
								
								{
									"3790bfd9-d2bd-8067-8368-c3ec867c696b",
									true,
								},
								
								{
									"3fef9fa2-d14a-e45f-94c7-4ab5cf7b491a",
									true,
								},
								
								{
									"2ac1faed-49ac-c510-b8f6-d617dbd60a48",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "The Blackest Night - self",
							uuid = "a439a4ea-68bb-1998-81cf-7f13d15bfa0a",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "af915788-8300-116a-92e1-ecbfe48df129",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "262042b1-28a9-149a-90ca-12652848c490",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "44527a4c-746b-410c-b9a0-e86c5a3191b7",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "3790bfd9-d2bd-8067-8368-c3ec867c696b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7393,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "3fef9fa2-d14a-e45f-94c7-4ab5cf7b491a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 3,
							mpType = 2,
							mpValue = 3000,
							name = "TBN 3000 MP",
							uuid = "2ac1faed-49ac-c510-b8f6-d617dbd60a48",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 296.251,
				name = "[WAR+DRK][OT] The Blackest Night 04:53 - Electrocution / Plummet",
				timeRange = true,
				timelineIndex = 69,
				timerEndOffset = -1.859,
				timerOffset = -0.365,
				timerStartOffset = -2.859,
				uuid = "73f00c3c-83e5-1b0d-8549-ae9ce4e21a8e",
				version = 2,
			},
		},
	},
	[71] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\DPS Coach",
				uuid = "2fc154da-f6a5-aedb-a92f-be4a6997cb01",
			},
			objectType = "folder",
		},
	},
	[72] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "318a0321-8fea-d59b-ba93-34704fb220de",
			},
			objectType = "folder",
		},
	},
	[73] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "31b3e5dc-09d6-6dd1-baa6-1af557cc3331",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"72478cc6-c10f-5efb-8db9-50a7c06336f1",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "e465a1ed-bf0b-18cc-ac38-e602e6be31cf",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "72478cc6-c10f-5efb-8db9-50a7c06336f1",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 305.236,
				name = "[DRK R1][MT] Rampart 05:04",
				timelineIndex = 73,
				timerOffset = -0.466,
				uuid = "80b8257a-6e46-3e78-ba93-ca38d02f2ce8",
				version = 2,
			},
		},
	},
	[75] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "1e2c64f4-0de6-4d23-b183-da40be446962",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "fbe7d839-0e21-586b-8126-370eaf27013f",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "46cc288c-db12-7aac-b5fd-c24d71accbe7",
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
							actionID = 7531,
							conditions = 
							{
								
								{
									"6deff0b8-f7b9-7a05-9fc4-2bb91389b52d",
									true,
								},
								
								{
									"7f7aa7a2-a4d0-e469-86e3-bac47c9872d4",
									true,
								},
								
								{
									"47fdb045-d1d8-4df7-ab21-f9026fc2b067",
									true,
								},
								
								{
									"f52d035e-f292-ba16-8da6-898dd7d222d8",
									true,
								},
								
								{
									"de940b24-9f5e-4ea5-af55-c60525f0c501",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "Rampart - self",
							uuid = "d59f7878-004d-6891-9789-ebedcc55277c",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "6deff0b8-f7b9-7a05-9fc4-2bb91389b52d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "7f7aa7a2-a4d0-e469-86e3-bac47c9872d4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "47fdb045-d1d8-4df7-ab21-f9026fc2b067",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "f52d035e-f292-ba16-8da6-898dd7d222d8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7531,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "de940b24-9f5e-4ea5-af55-c60525f0c501",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 314.376,
				name = "[WAR+DRK][OT] Rampart 05:09 - Electrocution / Plummet",
				timeRange = true,
				timelineIndex = 75,
				timerEndOffset = -4.489,
				timerOffset = -3.481,
				timerStartOffset = -5.489,
				uuid = "4993fba7-2f1b-f735-a9e3-e57a0ced8c21",
				version = 2,
			},
		},
	},
	[80] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "e77abb06-385b-3ff3-b4fb-776b1f01b3cb",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"6fb0725e-1f50-049f-b87b-1b5cf8822a9a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "MT - Shadowed Vigil",
							uuid = "979fe2f8-a3ae-0a4b-8863-c079b6339800",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "6fb0725e-1f50-049f-b87b-1b5cf8822a9a",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 330.985,
				name = "[DRK R1][MT] Shadowed Vigil 05:27",
				timelineIndex = 80,
				timerOffset = -3.145,
				uuid = "07e1f4cf-bc0a-6050-a660-af670c650baf",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"401e61fa-5e35-9e45-abe1-bb5ddf647fe6",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "c9da1250-5b82-ac07-a5e1-79f9f1881f68",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "401e61fa-5e35-9e45-abe1-bb5ddf647fe6",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 330.985,
				name = "[DRK R1][MT] The Blackest Night 05:30",
				timelineIndex = 80,
				timerOffset = -0.603,
				uuid = "3d12496a-1868-6529-a992-fc71d62f53f1",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "a4401caf-b52b-a47d-896e-0afe46070c4f",
			},
			objectType = "folder",
		},
	},
	[81] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "0b6c2e23-3c52-b92a-9bef-038effd6e5b3",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "22a26b44-3e48-6b63-9d53-597a347c618c",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "6425c7a2-0991-2b15-9980-7f6a01fa89f9",
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
							actionID = 36927,
							conditions = 
							{
								
								{
									"cd41f2c6-a7cb-d411-92f6-5ac37d3918b8",
									true,
								},
								
								{
									"863a0486-5643-6c47-88df-1cd3242843c1",
									true,
								},
								
								{
									"9f74cd06-9d8c-952f-8365-3d45c70e0db3",
									true,
								},
								
								{
									"5480766c-ce90-0f81-867a-90f902ea6b1a",
									true,
								},
								
								{
									"afeccd05-2391-e71b-8a58-3da27ace0eee",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "Shadowed Vigil - self",
							uuid = "6d9571da-ca5e-c449-a421-71e29d866428",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "cd41f2c6-a7cb-d411-92f6-5ac37d3918b8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "863a0486-5643-6c47-88df-1cd3242843c1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "9f74cd06-9d8c-952f-8365-3d45c70e0db3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "5480766c-ce90-0f81-867a-90f902ea6b1a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 36927,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "afeccd05-2391-e71b-8a58-3da27ace0eee",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 332.517,
				name = "[WAR+DRK][OT] Shadowed Vigil 05:30 - Electrocution / Plummet",
				timeRange = true,
				timelineIndex = 81,
				timerEndOffset = -1.903,
				timerOffset = -0.652,
				timerStartOffset = -2.903,
				uuid = "e40223ab-7d1d-cd1e-ad38-5ade6d29c5f2",
				version = 2,
			},
		},
	},
	[82] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "a72ca194-a390-f5e4-bf16-6a56e387b627",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"a855b1f1-2457-66fd-855a-d358f77da01c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "78859284-734b-68ec-9c91-23e029d60865",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "a855b1f1-2457-66fd-855a-d358f77da01c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 332.72,
				name = "[DRK R1][MT] Oblation 05:32",
				timelineIndex = 82,
				timerOffset = 0.117,
				uuid = "ab4ab0ae-ad5e-dff7-ba5c-acb8d62d9bbb",
				version = 2,
			},
		},
	},
	[84] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "191b0e19-cf22-1c7e-ada2-8cc8be33ddf8",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "e9273532-b0e7-024d-84ce-31f679be991b",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Retired old OT",
				uuid = "0e9e068f-10ba-29f5-bbd6-f8de05b43f4f",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"de6ae25d-8cdc-2529-ae50-1c213c1eb32c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "OT - Living Dead",
							uuid = "5158a86e-b4a9-8cc9-a5f2-cb9d15bb3323",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "de6ae25d-8cdc-2529-ae50-1c213c1eb32c",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 349.142,
				name = "[DRK R1][OT] Living Dead 05:50 - superseded",
				timelineIndex = 84,
				timerOffset = 1.776,
				uuid = "d5d10909-c1ed-2aa5-93f1-c993a57e988c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "7f77cdb0-634f-d48a-87df-560df8bbf071",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"4c723025-a037-5942-8826-9ef51fc0f9d9",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "e8754cf0-e9eb-f350-8cb0-41478fb99f02",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "4c723025-a037-5942-8826-9ef51fc0f9d9",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 349.142,
				name = "[DRK R1][MT] Dark Missionary 05:50",
				timelineIndex = 84,
				timerOffset = 1.686,
				uuid = "f8de3300-b7c5-6b2a-b541-d1893c77a568",
				version = 2,
			},
		},
	},
	[85] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "968c7571-0ba9-c0ab-b918-2699c7efc490",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"c4b202bb-e7d6-cd3f-a2d0-025fbe8bd7ad",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "98a73e36-6600-d864-a7fa-10e4f972ed47",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "c4b202bb-e7d6-cd3f-a2d0-025fbe8bd7ad",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 355.501,
				name = "[DRK R1][MT] Reprisal 05:52",
				timelineIndex = 85,
				timerOffset = -2.927,
				uuid = "634f8201-f6f9-cf49-ba08-9babb8de48b5",
				version = 2,
			},
		},
	},
	[86] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "3ea56b48-3fb0-8545-8b29-1eeaea0f72c8",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"6070cced-7ed6-7793-a493-fcf8a6f5861f",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_Provoke",
							name = "MT - Provoke",
							uuid = "f37cc28f-0528-ee49-8641-c6ea8d6a1e72",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "6070cced-7ed6-7793-a493-fcf8a6f5861f",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 356.407,
				name = "[DRK R1][MT] Provoke 06:00",
				timelineIndex = 86,
				timerOffset = 3.824,
				uuid = "3ee5dcfa-5c73-3bf6-883d-b30f2f2957c0",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "567c9e68-59bb-5698-aefc-d3c2656812fe",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "a80698e2-338a-bc50-b805-315ed866112d",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "4e17b36d-ca0b-2fdf-a8ca-dd5b0022d3f1",
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
							actionID = 16471,
							conditions = 
							{
								
								{
									"b7ceddb9-a499-7fba-bd80-647bae83088b",
									true,
								},
								
								{
									"b3f32dfb-c600-dd8b-b6a2-e7cd7273084a",
									true,
								},
								
								{
									"091defb3-1dc7-d5a1-bd4d-ca73aeec164a",
									true,
								},
								
								{
									"36d2cf95-c030-021b-8208-ba15b7e244ff",
									true,
								},
								
								{
									"fe1aec7e-9916-4148-b300-08b1e8d905a1",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "Dark Missionary - self",
							uuid = "3b8ef2d6-5d33-fe38-81e2-96221d409b96",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "b7ceddb9-a499-7fba-bd80-647bae83088b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "b3f32dfb-c600-dd8b-b6a2-e7cd7273084a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "091defb3-1dc7-d5a1-bd4d-ca73aeec164a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "36d2cf95-c030-021b-8208-ba15b7e244ff",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 16471,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "fe1aec7e-9916-4148-b300-08b1e8d905a1",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 356.407,
				name = "[WAR+DRK][OT] Dark Missionary 05:47 - Explosion / Sadistic Screech",
				timeRange = true,
				timelineIndex = 86,
				timerEndOffset = -8.81,
				timerOffset = -0.36,
				timerStartOffset = -9.81,
				uuid = "1bd00d02-42b0-f157-82ef-5433d84328de",
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
							actionID = 7535,
							conditions = 
							{
								
								{
									"28c13f4b-320f-88d9-bb64-6dbf0a586b80",
									true,
								},
								
								{
									"d34d7cbd-a5cf-22d9-b84c-6f0400117edc",
									true,
								},
								
								{
									"3d95f2b3-9a54-cb88-8b14-218cd0b57a23",
									true,
								},
								
								{
									"e9675fe5-d1ac-b8d6-8b07-d2ebf0a3b0ea",
									true,
								},
								
								{
									"b2da127d-f478-589d-9c61-5935c691be4a",
									true,
								},
								
								{
									"47fcc4cf-492c-19c0-a8a3-f3a13d1a1bf5",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "Reprisal - self",
							uuid = "b1bb001b-de3b-c92f-b7a6-6cfe2d69cd3b",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "28c13f4b-320f-88d9-bb64-6dbf0a586b80",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "d34d7cbd-a5cf-22d9-b84c-6f0400117edc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "3d95f2b3-9a54-cb88-8b14-218cd0b57a23",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "e9675fe5-d1ac-b8d6-8b07-d2ebf0a3b0ea",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7535,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "b2da127d-f478-589d-9c61-5935c691be4a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 4,
							inRangeValue = 5,
							name = "Boss in Reprisal radius",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "47fcc4cf-492c-19c0-a8a3-f3a13d1a1bf5",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 356.407,
				name = "[WAR+DRK][OT] Reprisal 05:47 - Explosion / Sadistic Screech",
				timeRange = true,
				timelineIndex = 86,
				timerEndOffset = -8.142,
				timerOffset = 0.187,
				timerStartOffset = -9.142,
				uuid = "4eab30a8-c27c-3ee8-9048-7eb4d1209c7e",
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
							actionID = 25754,
							conditions = 
							{
								
								{
									"ebf78857-37be-bdaf-b3d0-7b30bd53c8a4",
									true,
								},
								
								{
									"78f25067-62db-4015-a7f2-4779e9734d8e",
									true,
								},
								
								{
									"62f79b3d-b308-a203-86f4-c9a4374a3afc",
									true,
								},
								
								{
									"03fe4191-e91d-da69-9009-afb838d38a28",
									true,
								},
								
								{
									"add000f4-74ec-0265-804a-f2ece394e3ee",
									true,
								},
							},
							endIfUsed = true,
							name = "Oblation - WAR",
							targetType = "Other Tank",
							uuid = "8f4462ac-c970-1605-b012-0a7cf90fb58f",
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "ebf78857-37be-bdaf-b3d0-7b30bd53c8a4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "78f25067-62db-4015-a7f2-4779e9734d8e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "62f79b3d-b308-a203-86f4-c9a4374a3afc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "03fe4191-e91d-da69-9009-afb838d38a28",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 4,
							inRangeValue = 30,
							name = "Co-tank in range",
							partyTargetType = "Other Tank",
							uuid = "add000f4-74ec-0265-804a-f2ece394e3ee",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 356.407,
				name = "[WAR+DRK][OT] Oblation 05:54 - Explosion / Sadistic Screech",
				timeRange = true,
				timelineIndex = 86,
				timerEndOffset = -1.461,
				timerStartOffset = -2.461,
				uuid = "713f9ba2-be48-f295-b0f1-c8f388675d12",
				version = 2,
			},
		},
	},
	[87] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "612a8735-96b6-c68b-a373-d4b0ad2d3999",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "8f12764a-62c2-9472-8851-f74d858f9df5",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Retired old OT",
				uuid = "9a560f6c-a414-84ce-b5cd-7407cbbaecc3",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"8fcfa922-9ccc-5e61-b581-5d55130d24ef",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ShirkMouse",
							name = "OT - Shirk",
							targetType = "Other Tank",
							uuid = "e9d77aa2-2a7b-b08d-9443-608284bec9d7",
							variableIsHover = true,
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "8fcfa922-9ccc-5e61-b581-5d55130d24ef",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 365.345,
				name = "[DRK R1][OT] Shirk 06:01 - superseded",
				timelineIndex = 87,
				timerOffset = -3.95,
				uuid = "ab4c8477-0afe-4810-90d6-c068f1db68a4",
				version = 2,
			},
		},
	},
	[88] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "0b9e4180-3e66-9d0c-6bc1-e882633cb610",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[90] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "591e5aa1-03b5-caad-89f5-1bc3620acb31",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[92] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "1c1a412b-62ce-8c37-941c-e29989d719bb",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\DPS Coach",
				uuid = "b7ef3986-8d7b-c9c9-9b96-352c22134491",
			},
			objectType = "folder",
		},
	},
	[96] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "c87fc785-e100-bba0-afd0-5c84fc74874f",
			},
			objectType = "folder",
		},
	},
	[97] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "6cb4b77e-bde4-1a6f-9ad3-a9563779fea1",
			},
			objectType = "folder",
		},
	},
	[99] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "5842f7dc-8957-4c31-99af-bc856d863f1d",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "c373d111-f9c2-fe9b-a3fb-c284a8feb1a7",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "30e94438-f7fe-3d60-8809-94909ac08301",
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
							actionID = 7531,
							conditions = 
							{
								
								{
									"ff32ceb6-80ff-69c9-b1b5-5894c6a989a3",
									true,
								},
								
								{
									"1a311e23-25a1-e037-8710-a0a9555b75cc",
									true,
								},
								
								{
									"17fd475c-759e-f77f-ac94-d2abb5877b75",
									true,
								},
								
								{
									"53e517ad-aabe-a101-bd7e-8841da90415f",
									true,
								},
								
								{
									"491d75d9-d052-921b-87ce-23f367408317",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "Rampart - self",
							uuid = "635f8d03-aedd-afec-b985-0a757f2a7b09",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "ff32ceb6-80ff-69c9-b1b5-5894c6a989a3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "1a311e23-25a1-e037-8710-a0a9555b75cc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "17fd475c-759e-f77f-ac94-d2abb5877b75",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "53e517ad-aabe-a101-bd7e-8841da90415f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7531,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "491d75d9-d052-921b-87ce-23f367408317",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 408.642,
				name = "[WAR+DRK][OT] Rampart 06:42 - Ultrasonic pair",
				timeRange = true,
				timelineIndex = 99,
				timerEndOffset = -5.204,
				timerOffset = 0.822,
				timerStartOffset = -6.204,
				uuid = "de9eba46-7299-d597-968d-518b0728e7b5",
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
							actionID = 3634,
							conditions = 
							{
								
								{
									"da3f6111-62b4-d4e9-8ff0-e06e51d0e84e",
									true,
								},
								
								{
									"0870301a-cefd-d69c-b3f7-e0990f801944",
									true,
								},
								
								{
									"77559e7f-d005-23d8-addd-849496eb8af7",
									true,
								},
								
								{
									"955447c7-0284-0ea7-a70f-b8245f4fd363",
									true,
								},
								
								{
									"cf751362-2a6f-f9ac-8074-bac7485f5283",
									true,
								},
								
								{
									"e0e7035f-b99c-d668-92b0-7445deaf5562",
									true,
								},
								
								{
									"6047c534-f708-6500-b173-ab8c0b9efd2b",
									true,
								},
								
								{
									"0dcef0de-894f-9bcf-89ed-e8051f3ce8d4",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "Dark Mind - self",
							uuid = "bf5e3b9d-cb24-fda2-8aaa-a332ae81deee",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "da3f6111-62b4-d4e9-8ff0-e06e51d0e84e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "0870301a-cefd-d69c-b3f7-e0990f801944",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "77559e7f-d005-23d8-addd-849496eb8af7",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "955447c7-0284-0ea7-a70f-b8245f4fd363",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 3634,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "cf751362-2a6f-f9ac-8074-bac7485f5283",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							channelCheckSpellID = 45980,
							conditionType = 5,
							name = "Vamp casting Spread",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "e0e7035f-b99c-d668-92b0-7445deaf5562",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							channelCheckTimeRemain = 3.965,
							channelCheckType = 3,
							comparator = 2,
							conditionType = 5,
							name = "Within weave window",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "6047c534-f708-6500-b173-ab8c0b9efd2b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							channelCheckTimeRemain = 2.965,
							channelCheckType = 3,
							conditionType = 5,
							name = "Before cast deadline",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "0dcef0de-894f-9bcf-89ed-e8051f3ce8d4",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 408.642,
				name = "[WAR+DRK][OT] Dark Mind - Ultrasonic Spread, either order",
				timeRange = true,
				timelineIndex = 99,
				timerEndOffset = 6.359,
				timerOffset = 0.06,
				timerStartOffset = -6,
				uuid = "a830c935-1133-ed12-ba22-6908f9415a35",
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
							actionID = 7393,
							conditions = 
							{
								
								{
									"3fdfa66f-b534-87fa-b8a4-ec7a848e78b3",
									true,
								},
								
								{
									"48765d6a-1488-25d0-aef7-9ba2f89d2181",
									true,
								},
								
								{
									"2254a1e7-886a-4a5f-ae21-fb4af2556924",
									true,
								},
								
								{
									"a1dd252e-148c-ea2f-9b04-c5cfbab8c4e6",
									true,
								},
								
								{
									"17724f75-ff1c-3436-a953-7233be591e67",
									true,
								},
								
								{
									"7e78113f-56ad-bcee-a0d5-a2d8eb60c329",
									true,
								},
								
								{
									"ae9a5a87-e99c-7377-9039-681d531cd6a3",
									true,
								},
								
								{
									"037398d1-b2ff-6826-879b-c735464d8106",
									true,
								},
								
								{
									"87554e61-8a63-a191-9f7d-3a5ac693e05c",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "The Blackest Night - self",
							uuid = "d4acd93f-678d-5448-aacb-951c7460deaf",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "3fdfa66f-b534-87fa-b8a4-ec7a848e78b3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "48765d6a-1488-25d0-aef7-9ba2f89d2181",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "2254a1e7-886a-4a5f-ae21-fb4af2556924",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "a1dd252e-148c-ea2f-9b04-c5cfbab8c4e6",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7393,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "17724f75-ff1c-3436-a953-7233be591e67",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 3,
							mpType = 2,
							mpValue = 3000,
							name = "TBN 3000 MP",
							uuid = "7e78113f-56ad-bcee-a0d5-a2d8eb60c329",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							channelCheckSpellID = 45980,
							conditionType = 5,
							name = "Vamp casting Spread",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "ae9a5a87-e99c-7377-9039-681d531cd6a3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							channelCheckTimeRemain = 1.427,
							channelCheckType = 3,
							comparator = 2,
							conditionType = 5,
							name = "Within weave window",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "037398d1-b2ff-6826-879b-c735464d8106",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							channelCheckTimeRemain = 0.427,
							channelCheckType = 3,
							conditionType = 5,
							name = "Before cast deadline",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "87554e61-8a63-a191-9f7d-3a5ac693e05c",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 408.642,
				name = "[WAR+DRK][OT] The Blackest Night - Ultrasonic Spread, either order",
				timeRange = true,
				timelineIndex = 99,
				timerEndOffset = 6.359,
				timerOffset = 0.171,
				timerStartOffset = -6,
				uuid = "66b24362-7951-870f-b96e-c1d375723bdc",
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
							actionID = 25754,
							conditions = 
							{
								
								{
									"0e630525-b5c1-238d-9565-3282229a4b19",
									true,
								},
								
								{
									"9d77662e-70ea-534e-b2f0-51c6975ba93c",
									true,
								},
								
								{
									"c084188a-2e3b-29ed-9b83-7d4d3dcdbaf4",
									true,
								},
								
								{
									"c4e65ad8-458f-d6d7-8458-5a05f7ec8e58",
									true,
								},
								
								{
									"7f33c9d2-62d0-c6a9-b34a-b7f03adf8df0",
									true,
								},
								
								{
									"5c99bd0f-98ae-857b-82d8-5294638c7b61",
									true,
								},
								
								{
									"50c3a5c5-f6f5-20b9-8ba7-2a1d289c6073",
									true,
								},
							},
							endIfUsed = true,
							name = "Oblation - self",
							uuid = "94e31c0f-99c7-9c6a-80d4-6f6fccb80ce9",
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "0e630525-b5c1-238d-9565-3282229a4b19",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "9d77662e-70ea-534e-b2f0-51c6975ba93c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "c084188a-2e3b-29ed-9b83-7d4d3dcdbaf4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "c4e65ad8-458f-d6d7-8458-5a05f7ec8e58",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							channelCheckSpellID = 45980,
							conditionType = 5,
							name = "Vamp casting Spread",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "7f33c9d2-62d0-c6a9-b34a-b7f03adf8df0",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							channelCheckTimeRemain = 3.296,
							channelCheckType = 3,
							comparator = 2,
							conditionType = 5,
							name = "Within weave window",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "5c99bd0f-98ae-857b-82d8-5294638c7b61",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							channelCheckTimeRemain = 2.296,
							channelCheckType = 3,
							conditionType = 5,
							name = "Before cast deadline",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "50c3a5c5-f6f5-20b9-8ba7-2a1d289c6073",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 408.642,
				name = "[WAR+DRK][OT] Oblation - Ultrasonic Spread, either order",
				timeRange = true,
				timelineIndex = 99,
				timerEndOffset = 6.359,
				timerStartOffset = -6,
				uuid = "031edf76-6da0-9a86-9a9a-855031dacfe3",
				version = 2,
			},
		},
	},
	[101] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "d03c0315-041b-08d8-afa3-086b3abb403c",
			},
			objectType = "folder",
		},
	},
	[103] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "95d4c6aa-1c18-47ac-8cca-63a7551cb640",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "f487b7be-6bd0-fe79-9cc5-286abb32c794",
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
							actionID = 7535,
							conditions = 
							{
								
								{
									"208bba1e-7879-804e-aea9-aa6e473edd14",
									true,
								},
								
								{
									"9dbb7587-06bd-6618-93c2-c91ff2c92e1e",
									true,
								},
								
								{
									"4bc3c809-d25a-742e-bcca-9df695321ee6",
									true,
								},
								
								{
									"519bd097-8dc2-1edb-bac9-6069102a3c8a",
									true,
								},
								
								{
									"327bec3d-ee30-abf3-9063-b73b13e69054",
									true,
								},
								
								{
									"e10bd527-3804-08fd-8475-a6c492b2a107",
									true,
								},
							},
							endIfUsed = true,
							name = "Reprisal - self",
							uuid = "a9016b45-ecd0-cd93-8796-8b841ff05cfb",
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "208bba1e-7879-804e-aea9-aa6e473edd14",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "9dbb7587-06bd-6618-93c2-c91ff2c92e1e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "4bc3c809-d25a-742e-bcca-9df695321ee6",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "519bd097-8dc2-1edb-bac9-6069102a3c8a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7535,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "327bec3d-ee30-abf3-9063-b73b13e69054",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 4,
							inRangeValue = 5,
							name = "Boss in Reprisal radius",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "e10bd527-3804-08fd-8475-a6c492b2a107",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 415.438,
				name = "[WAR+DRK][OT] Reprisal 06:51 - Ultrasonic Amp / Ultrasonic Spread",
				timeRange = true,
				timelineIndex = 103,
				timerEndOffset = -3.333,
				timerStartOffset = -4.333,
				uuid = "58d0483a-cdef-947f-9594-8bf2c7bf27fd",
				version = 2,
			},
		},
	},
	[105] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "746f82cd-7bd1-31af-b320-8ccdff9769af",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"1b46db2e-8077-cf23-971b-b2963a853cb3",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "f16615cd-83c2-5be6-a84c-8a228cd2cfd4",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "1b46db2e-8077-cf23-971b-b2963a853cb3",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 422.625,
				name = "[DRK R1][MT] Reprisal 07:02",
				timelineIndex = 105,
				timerOffset = 0.032,
				uuid = "3f5948ff-cb65-28f7-b288-2bd885a8bf38",
				version = 2,
			},
		},
	},
	[110] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "6a17d3ad-e061-37af-b5dd-1ad6b30c4dbe",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"6ed786d2-bf5f-333c-bd3a-32feb7f7fa9e",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "a63533da-6b2f-75cd-96c0-595f19621742",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "6ed786d2-bf5f-333c-bd3a-32feb7f7fa9e",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 430.281,
				name = "[DRK R1][MT] Rampart 07:10",
				timelineIndex = 110,
				timerOffset = -0.099,
				uuid = "0364e962-22be-ca08-ae65-7c4c3ccda59b",
				version = 2,
			},
		},
	},
	[113] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "077923e9-a1e4-81fc-acab-eb187d1e0eeb",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"fde8ef27-4504-89c2-8239-89eb2e597cad",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "570bc789-b25d-ca73-9605-20fd1b40b079",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "fde8ef27-4504-89c2-8239-89eb2e597cad",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 435.219,
				name = "[DRK R1][MT] The Blackest Night 07:15",
				timelineIndex = 113,
				timerOffset = -0.042,
				uuid = "1feb5e04-4bd3-263d-be39-9fbfeab55fe8",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"dfa77ba2-a5da-082a-97ba-994be1cb2bc5",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "741e0128-3052-c01c-8b8e-69a9bd4fe4d1",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "dfa77ba2-a5da-082a-97ba-994be1cb2bc5",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 435.219,
				name = "[DRK R1][MT] Dark Mind 07:15",
				timelineIndex = 113,
				timerOffset = 0.619,
				uuid = "b05b756f-cf1e-84bc-bb46-b01e400990c8",
				version = 2,
			},
		},
	},
	[115] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "3fd14529-b73a-0af5-5a2c-401710004239",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[116] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "b84cbd59-9841-f4e3-8fcd-77165d9b9b30",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "fafafbad-3dba-fe52-b3e1-6db3679899c4",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "c8d0a376-6fe6-837b-bfca-1c8988dcf135",
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
							actionID = 16471,
							conditions = 
							{
								
								{
									"0cf6be48-20bb-640a-b3f9-92018c2e1411",
									true,
								},
								
								{
									"f73f958a-b87c-b257-8ab9-6ff6fecfa72a",
									true,
								},
								
								{
									"55bacd80-7a78-dc67-a70a-f1c7632ec26d",
									true,
								},
								
								{
									"c13b0546-6ce0-da17-9eac-5f86182957bc",
									true,
								},
								
								{
									"54b9093c-dadb-c565-8c8c-136b30db6cb2",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "Dark Missionary - self",
							uuid = "1d7ae33c-99d6-d3f8-82fb-5db0d7428e95",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "0cf6be48-20bb-640a-b3f9-92018c2e1411",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "f73f958a-b87c-b257-8ab9-6ff6fecfa72a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "55bacd80-7a78-dc67-a70a-f1c7632ec26d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "c13b0546-6ce0-da17-9eac-5f86182957bc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 16471,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "54b9093c-dadb-c565-8c8c-136b30db6cb2",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 442.188,
				name = "[WAR+DRK][OT] Dark Missionary 07:21 - Pulping Pulse",
				timeRange = true,
				timelineIndex = 116,
				timerEndOffset = -0.3,
				timerOffset = -1.0069999694824,
				timerStartOffset = -1.3,
				uuid = "c58c18e5-1f71-36d2-8ec9-6ddaf31e1468",
				version = 2,
			},
		},
	},
	[118] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "c29ff8c2-d5f3-cfa6-fb73-42f836ded4d2",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "bb14f659-3d3a-ce91-9df8-d83bbdf37a7b",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"af951ed4-f6dc-940f-8850-5ad9d0bd0445",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "2c00618f-f488-cc13-a89d-4397c427c23d",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "af951ed4-f6dc-940f-8850-5ad9d0bd0445",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 451.266,
				name = "[DRK R1][MT] Dark Missionary 07:31",
				timelineIndex = 118,
				timerOffset = -0.233,
				uuid = "c1c68017-63f0-b8d8-910c-ca538b061336",
				version = 2,
			},
		},
	},
	[119] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "8c4afaf8-2050-8ac5-abdb-60d3b363fe78",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"2f27baf9-94d0-85b4-85ae-607eecb6dc72",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "0ee96ebe-3bce-aa63-9ba2-495def245008",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "2f27baf9-94d0-85b4-85ae-607eecb6dc72",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 452.469,
				name = "[DRK R1][MT] The Blackest Night 07:32",
				timelineIndex = 119,
				timerOffset = 0.396,
				uuid = "fae19146-2cda-2ece-a9c8-693ca4568c02",
				version = 2,
			},
		},
	},
	[120] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "2e7142e1-d3df-7805-b249-e20bfe0d80b1",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[131] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\DPS Coach",
				uuid = "54921805-ba42-ce81-8610-eaacae598dac",
			},
			objectType = "folder",
		},
	},
	[135] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "b6060b05-19c0-5a41-bdab-87bac309193e",
			},
			objectType = "folder",
		},
	},
	[136] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "3cc2b0df-9e38-cdb5-9914-5076c3d3e6aa",
			},
			objectType = "folder",
		},
	},
	[142] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "4d9f7c35-72e3-b761-b12b-478f646ac285",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "4d0c6fd8-c703-dcce-8bff-a19e69636a7a",
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
							aType = "ACR",
							conditions = 
							{
								
								{
									"02b1e43f-8aaf-5c8d-abfa-7da95f3e71b7",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "c3382d1b-622c-a252-8f7b-f1442414c12a",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "02b1e43f-8aaf-5c8d-abfa-7da95f3e71b7",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 495.812,
				name = "[DRK R1][MT] Reprisal 08:15",
				timelineIndex = 142,
				timerOffset = 0.187,
				uuid = "a9ac3326-cace-8b02-9fd7-e07421633d86",
				version = 2,
			},
		},
	},
	[143] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "19aa5139-90ee-ef03-a06d-89413717f259",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "a70f0535-b8f5-9196-9d5f-85a8aef82e98",
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
							actionID = 7535,
							conditions = 
							{
								
								{
									"01d7906b-98d0-bc71-92a7-b652f72676ae",
									true,
								},
								
								{
									"32adae83-c08e-e928-b04c-b72a534ccf49",
									true,
								},
								
								{
									"6bd16e49-e0d8-1003-9092-fba3ff4b51b8",
									true,
								},
								
								{
									"3e5cdbff-28cf-e760-98b1-835748cda804",
									true,
								},
								
								{
									"918150ac-dfb0-eefa-a9d1-afadcc8cfedc",
									true,
								},
								
								{
									"fc1e25ae-1ae3-c615-93ee-879668a93f1b",
									true,
								},
							},
							endIfUsed = true,
							name = "Reprisal - self",
							uuid = "cd83a0f0-9a95-2964-b8c5-d7f7ece7c610",
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "01d7906b-98d0-bc71-92a7-b652f72676ae",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "32adae83-c08e-e928-b04c-b72a534ccf49",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "6bd16e49-e0d8-1003-9092-fba3ff4b51b8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "3e5cdbff-28cf-e760-98b1-835748cda804",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7535,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "918150ac-dfb0-eefa-a9d1-afadcc8cfedc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 4,
							inRangeValue = 5,
							name = "Boss in Reprisal radius",
							partyTargetName = "Vamp Fatale",
							partyTargetType = "Named Target",
							uuid = "fc1e25ae-1ae3-c615-93ee-879668a93f1b",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 497.062,
				name = "[WAR+DRK][OT] Reprisal 08:14 - Brutal Rain",
				timeRange = true,
				timelineIndex = 143,
				timerEndOffset = -1.996,
				timerStartOffset = -2.996,
				uuid = "bdb0b2cc-edb5-5c42-ac80-a4713fde8739",
				version = 2,
			},
		},
	},
	[144] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "3047480b-1492-63bf-8ce2-56719a2e5a5b",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[148] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "34a853e7-d054-ff33-64f0-434d357b8bb7",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[149] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "d945d974-2611-cdb0-af11-34ba686c43c4",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[155] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "7fc35b46-55ef-3dd1-8664-6e7f0c1df22d",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "9146223c-76ac-a7f8-9b1f-c42369e44575",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "929709c4-3c6e-d439-ba34-6c7d540fa216",
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
							actionID = 36927,
							conditions = 
							{
								
								{
									"96f0f3f4-f9aa-6281-a41c-57b4fc7dfe63",
									true,
								},
								
								{
									"c0ee67ad-96dd-67f0-82b5-5c7e523951dc",
									true,
								},
								
								{
									"fc722183-0fef-05e0-a3e9-4c252160e1bf",
									true,
								},
								
								{
									"ce2239c5-5aae-1132-a276-2315970f6911",
									true,
								},
								
								{
									"feb058be-4342-a9f1-80ad-99fb6e3ef59b",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "Shadowed Vigil - self",
							uuid = "0c5435f8-49a5-f7e1-b5c1-b350f14cfc7a",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "96f0f3f4-f9aa-6281-a41c-57b4fc7dfe63",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "c0ee67ad-96dd-67f0-82b5-5c7e523951dc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "fc722183-0fef-05e0-a3e9-4c252160e1bf",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "ce2239c5-5aae-1132-a276-2315970f6911",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 36927,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "feb058be-4342-a9f1-80ad-99fb6e3ef59b",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 536.578,
				name = "[WAR+DRK][OT] Shadowed Vigil 08:51 - Hardcore 3 - prog fallback",
				timeRange = true,
				timelineIndex = 155,
				timerEndOffset = -4.5,
				timerOffset = 0.119,
				timerStartOffset = -5.5,
				uuid = "cb8bf45f-990e-015d-9f7d-8d8935e98cf0",
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
							actionID = 7393,
							conditions = 
							{
								
								{
									"bac8c212-a092-06a1-9f1c-3156902f9751",
									true,
								},
								
								{
									"520f8d32-19f0-7378-b9e4-0feb31596abc",
									true,
								},
								
								{
									"fb0b72c9-00b4-7599-bd86-ccdb7786c9f4",
									true,
								},
								
								{
									"fa2d65e2-6d35-ab10-93da-c2ff7f7d1ea8",
									true,
								},
								
								{
									"a7720f06-41e9-c783-9b96-0cb97b831b14",
									true,
								},
								
								{
									"cb499d74-96fc-4f4c-910f-d1ee1860e324",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "The Blackest Night - self",
							uuid = "7288280d-698c-3f79-902d-649376ee8339",
							variableTogglesType = 3,
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "bac8c212-a092-06a1-9f1c-3156902f9751",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "520f8d32-19f0-7378-b9e4-0feb31596abc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "fb0b72c9-00b4-7599-bd86-ccdb7786c9f4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "fa2d65e2-6d35-ab10-93da-c2ff7f7d1ea8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7393,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "a7720f06-41e9-c783-9b96-0cb97b831b14",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 3,
							mpType = 2,
							mpValue = 3000,
							name = "TBN 3000 MP",
							uuid = "cb499d74-96fc-4f4c-910f-d1ee1860e324",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 536.578,
				name = "[WAR+DRK][OT] The Blackest Night 08:54 - Hardcore 3 - prog fallback",
				timeRange = true,
				timelineIndex = 155,
				timerEndOffset = -1.3,
				timerOffset = 0.306,
				timerStartOffset = -2.3,
				uuid = "e30a6d83-3107-7d30-8e11-a89f15d122e2",
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
							actionID = 3634,
							conditions = 
							{
								
								{
									"0b70a7d4-ddb3-b89c-8d2c-18f54775d15e",
									true,
								},
								
								{
									"c6c068b3-743c-95a0-9662-6c49e2572381",
									true,
								},
								
								{
									"3dbc9fc2-95a1-d774-9845-b4d2ef8ba414",
									true,
								},
								
								{
									"4e3d6f6f-cdf6-35c3-ad63-96406849999b",
									true,
								},
								
								{
									"010fe41f-1238-70a1-9b77-e64e6a617cf2",
									true,
								},
							},
							endIfUsed = true,
							name = "Dark Mind - self",
							uuid = "6f930e29-b131-2764-8497-28a546bd501c",
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "0b70a7d4-ddb3-b89c-8d2c-18f54775d15e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "c6c068b3-743c-95a0-9662-6c49e2572381",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "3dbc9fc2-95a1-d774-9845-b4d2ef8ba414",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "4e3d6f6f-cdf6-35c3-ad63-96406849999b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 3634,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "010fe41f-1238-70a1-9b77-e64e6a617cf2",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 536.578,
				name = "[WAR+DRK][OT] Dark Mind 08:52 - Hardcore 3 - prog fallback",
				timeRange = true,
				timelineIndex = 155,
				timerEndOffset = -3.2,
				timerStartOffset = -4.2,
				uuid = "5f0ea22b-ae06-e889-85ff-a7614ec86c85",
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
							actionID = 25754,
							conditions = 
							{
								
								{
									"fae53b2c-d66c-6349-a5c7-9b5e1cfa6fbc",
									true,
								},
								
								{
									"a77aa8f5-6d42-8500-9e00-c69584b0affc",
									true,
								},
								
								{
									"ba12d8b8-e38c-78e9-99f7-e35a9f9c6338",
									true,
								},
								
								{
									"4bb5ad78-e78e-9c74-983d-981655169a29",
									true,
								},
							},
							endIfUsed = true,
							name = "Oblation - self",
							uuid = "a7ab7bc0-41b5-28c3-8a66-c57769fe778c",
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
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "fae53b2c-d66c-6349-a5c7-9b5e1cfa6fbc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "a77aa8f5-6d42-8500-9e00-c69584b0affc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "WARRIOR",
							name = "WAR co-tank",
							partyTargetType = "Other Tank",
							uuid = "ba12d8b8-e38c-78e9-99f7-e35a9f9c6338",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "4bb5ad78-e78e-9c74-983d-981655169a29",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 536.578,
				name = "[WAR+DRK][OT] Oblation 08:53 - Hardcore 3 - prog fallback",
				timeRange = true,
				timelineIndex = 155,
				timerEndOffset = -2.4,
				timerStartOffset = -3.4,
				uuid = "c28b632d-e606-a08b-bd90-98178b1c790f",
				version = 2,
			},
		},
	},
	[157] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "24ccd477-6324-ce7b-eb0e-f001c06503c7",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[168] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "1f30c455-6bf9-f381-e099-b21f0ad12e25",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	[170] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m9s\\main",
				uuid = "f169f8a4-2c4d-1560-35df-f1deefc86f74",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m9s\\main",
			objectType = "folder",
		},
	},
	inheritedProfiles = 
	{
		"store\\anyone\\savage6\\m9s\\main",
	},
	timelineName = "r9s",
	version = "1.5.0",
}



return tbl