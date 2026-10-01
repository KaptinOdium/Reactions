local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "4ca61c1b-f7eb-887f-3187-50a1b05543ab",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "5e5ce738-0477-fc05-98f4-5843ea6e5018",
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
									"e44361a2-03b4-86ac-926a-e77b4a05af17",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "2bbdbe95-001b-35af-b9b0-e187a946ca36",
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
							uuid = "e44361a2-03b4-86ac-926a-e77b4a05af17",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 10.203,
				name = "[DRK R1][MT] Rampart 00:06",
				timelineIndex = 1,
				timerOffset = -3.741,
				uuid = "d18322de-c2a6-42e6-b185-4878030cd016",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "c6a146bc-9709-31f1-8d0d-e6a6e28399e7",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "0cb4626f-d1f4-cb1f-b86c-caa8eb9c99ff",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "2f04029f-0e2e-a0f2-ae9e-559ef20976fb",
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
									"926344c3-2f7d-b669-8b2c-0a69b4aac254",
									true,
								},
								
								{
									"19ca6a0b-7f33-01a3-9775-3418a7206bcf",
									true,
								},
								
								{
									"d79c6dec-5b7b-2aa7-a8b4-e5083573c31b",
									true,
								},
								
								{
									"226b1d59-7c21-4a62-acbb-5530f204bc6e",
									true,
								},
								
								{
									"93cea559-7bd8-3010-a7f6-f8c2fc927a9b",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "Dark Missionary - self",
							uuid = "2d6db820-01fa-9a98-93e2-9621f6f9f612",
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
							uuid = "926344c3-2f7d-b669-8b2c-0a69b4aac254",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "19ca6a0b-7f33-01a3-9775-3418a7206bcf",
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
							uuid = "d79c6dec-5b7b-2aa7-a8b4-e5083573c31b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "226b1d59-7c21-4a62-acbb-5530f204bc6e",
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
							uuid = "93cea559-7bd8-3010-a7f6-f8c2fc927a9b",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 10.203,
				name = "[WAR+DRK][OT] Dark Missionary 00:07 - Crown of Arcadia",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = -1.827,
				timerOffset = 2.75,
				timerStartOffset = -2.827,
				uuid = "7a92d7fe-0649-3793-951d-a6fe3cc55792",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\DPS Automation",
				uuid = "d86c73bd-3ea5-69ca-b496-5cd080c2b3b5",
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
				mechanicTime = 10.203,
				name = "[DRK Opt][MT] Hold Potion to 04:58",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 286.48,
				timerStartOffset = 259.797,
				uuid = "6d33949b-43cd-493f-b1b8-999a0466b38b",
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
				mechanicTime = 10.203,
				name = "[DRK Opt][MT] Hold Salted Earth to 10:09",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 596.86,
				timerStartOffset = 545.297,
				uuid = "a9041234-3aa6-69b5-a09d-4fa3756d1986",
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
				mechanicTime = 10.203,
				name = "[DRK Opt][MT] Hold Potion to 10:05",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 593.02,
				timerStartOffset = 554.797,
				uuid = "d31aa30e-f43a-2a27-b263-9fc164fff605",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "0445cce0-0f94-1ee4-5af8-a2ba55d16bb0",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "8941962e-ec6c-8a67-b3d6-7c266a000a3d",
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
									"aedd7ca9-9fba-e093-ba61-332db6c4a888",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "MT - Shadowed Vigil",
							uuid = "40618db1-bcad-df33-ab74-b1720c371e8e",
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
							uuid = "aedd7ca9-9fba-e093-ba61-332db6c4a888",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 17.25,
				name = "[DRK R1][MT] Shadowed Vigil 00:13",
				timelineIndex = 2,
				timerOffset = -3.347,
				uuid = "bdbae638-7955-9f02-9222-fc3b7fc14976",
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
				uuid = "ac450c93-a462-abe2-98b0-562cc7f9532a",
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
									"7d61b476-2cd0-1472-b2b0-2dfed92d2dc4",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "ed0d20b7-dc8c-51d9-b1f4-4db2efbce4b8",
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
							uuid = "7d61b476-2cd0-1472-b2b0-2dfed92d2dc4",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 23.453,
				name = "[DRK R1][MT] Dark Mind 00:20",
				timelineIndex = 3,
				timerOffset = -2.684,
				uuid = "62f4d8ea-e965-0a67-8fc2-6474628ac1be",
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
									"daf5d9f2-eecd-ecd6-a88c-69ea79413a96",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "4bc6008c-b979-f040-a57e-7a94b56ef98e",
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
							uuid = "daf5d9f2-eecd-ecd6-a88c-69ea79413a96",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 23.453,
				name = "[DRK R1][MT] Oblation 00:21",
				timelineIndex = 3,
				timerOffset = -2.059,
				uuid = "a68c7035-e18e-8fa1-bad0-071f2c7c148c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "708b8bee-b918-490e-b6c6-95fabce63cad",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "572cc4c4-6965-8a29-9dc2-9631ee1089e4",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Retired old OT",
				uuid = "e0b2c5b8-b8c3-1305-88cc-93dc49379fd9",
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
									"07103c90-3a8d-932b-9ae3-8a7f5c5bf287",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "OT - The Blackest Night",
							uuid = "9f39b077-ec89-990e-b4d2-45045ccd43c9",
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
							uuid = "07103c90-3a8d-932b-9ae3-8a7f5c5bf287",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 23.453,
				name = "[DRK R1][OT] The Blackest Night 00:20 - superseded",
				timelineIndex = 3,
				timerOffset = -2.505,
				uuid = "8c3e461b-90c5-01d3-9e01-148401698e7e",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "c0fa89ff-71e5-be9e-ad87-168159ead08c",
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
									"2de6a98f-4c7e-66c5-93c9-2b69c71f9df4",
									true,
								},
								
								{
									"975ceda0-748e-3bf4-9b07-75def97e16f7",
									true,
								},
								
								{
									"f315af6a-ca32-0c2f-a59f-4088b9813959",
									true,
								},
								
								{
									"9c4a2b52-91f8-2d88-8fe1-a11cc7e8a6dd",
									true,
								},
								
								{
									"609ba75e-e0ad-54e5-a9f4-fef6daf0be59",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "Shadowed Vigil - self",
							uuid = "06740e85-9549-a3ab-a300-9a0b8917a487",
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
							uuid = "2de6a98f-4c7e-66c5-93c9-2b69c71f9df4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "975ceda0-748e-3bf4-9b07-75def97e16f7",
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
							uuid = "f315af6a-ca32-0c2f-a59f-4088b9813959",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "9c4a2b52-91f8-2d88-8fe1-a11cc7e8a6dd",
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
							uuid = "609ba75e-e0ad-54e5-a9f4-fef6daf0be59",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 23.453,
				name = "[WAR+DRK][OT] Shadowed Vigil 00:21 - Raw Steel",
				timeRange = true,
				timelineIndex = 3,
				timerEndOffset = -1.419,
				timerOffset = 1.249,
				timerStartOffset = -2.419,
				uuid = "7f19a9b6-eb73-3dab-a5b5-d36730e064a6",
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
							actionID = 7537,
							conditions = 
							{
								
								{
									"e2c51c31-bc31-613a-94e4-916e58fe60b9",
									true,
								},
								
								{
									"c2594e65-e489-b85c-8ff6-de2def71300a",
									true,
								},
								
								{
									"4f5afb51-3c7d-0250-aa90-242d961b1d44",
									true,
								},
								
								{
									"96ca4f31-b80d-cd70-ac42-afd4897e47a3",
									true,
								},
								
								{
									"1269241d-8d0f-f0e0-a227-e0d457fea8ba",
									true,
								},
								
								{
									"162d43d8-a10c-2c33-90c9-f223045aa6ae",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Hotbar_ShirkMouse",
							name = "Shirk - WAR",
							targetType = "Other Tank",
							uuid = "18ed30c3-e22e-7b8f-9d7a-9d4ef3d3dbf9",
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
							category = "Self",
							conditionType = 13,
							jobValue = "DARKKNIGHT",
							name = "DRK",
							uuid = "e2c51c31-bc31-613a-94e4-916e58fe60b9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "c2594e65-e489-b85c-8ff6-de2def71300a",
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
							uuid = "4f5afb51-3c7d-0250-aa90-242d961b1d44",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "96ca4f31-b80d-cd70-ac42-afd4897e47a3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7537,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "1269241d-8d0f-f0e0-a227-e0d457fea8ba",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 4,
							inRangeValue = 25,
							name = "Co-tank in range",
							partyTargetType = "Other Tank",
							uuid = "162d43d8-a10c-2c33-90c9-f223045aa6ae",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 23.453,
				name = "[WAR+DRK][OT] Shirk 00:23 - Raw Steel",
				timeRange = true,
				timelineIndex = 3,
				timerEndOffset = 0.054,
				timerOffset = -4.219,
				timerStartOffset = -0.946,
				uuid = "313278df-edb7-23a1-b64d-086e36086095",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "62e3d062-8946-f57e-8a52-47d82166a9b2",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "78bff88f-0c35-b88b-6e38-df3dd902861f",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "071adc7f-d6c0-6e95-827b-3bb03abd5bb7",
			},
			objectType = "folder",
		},
	}, 
	[8] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "46f25a56-8532-c5fa-d051-bfa4f500f2a6",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[10] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "d1ef5ee1-ce55-4aad-bf26-ad1074dbe511",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "d5c0b4ec-b735-3c8d-ab25-bf46d157eaa4",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Retired old OT",
				uuid = "7a389f1c-38be-3846-958b-7f6a8cfd5581",
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
									"18754cd0-c788-d2cc-a253-6750884740f7",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "OT - Reprisal",
							uuid = "a9ffb0ec-0c8d-df6a-919d-83679013367e",
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
							uuid = "18754cd0-c788-d2cc-a253-6750884740f7",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 54.64,
				name = "[DRK R1][OT] Reprisal 00:54 - superseded",
				timelineIndex = 10,
				timerOffset = -0.142,
				uuid = "1ad31a76-1b59-f69f-9c64-4cade82ec370",
				version = 2,
			},
		},
	},
	[12] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "98b0d485-20b1-01f1-64cc-8c338dd04e55",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[13] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "378b9800-986e-d2fc-17b7-3cc6e4d94c90",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[14] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "501e57af-5f8d-e8c3-8b4c-c1212aec16ff",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[17] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "f299157c-38b9-437b-85aa-1499059a8649",
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
									"5778517d-cc9a-47c6-8da2-1f70839ede52",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "33f6682c-c0e0-5376-83ab-421b08d98c15",
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
							uuid = "5778517d-cc9a-47c6-8da2-1f70839ede52",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 86.967,
				name = "[DRK R1][MT] Dark Missionary 01:26",
				timelineIndex = 17,
				timerOffset = -0.372,
				uuid = "ec8a84a9-5129-b0e0-9b20-fce4b26d4404",
				version = 2,
			},
		},
	},
	[18] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "afddfe63-7355-3e0f-48f2-dc15456fcc73",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[25] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "444db437-7ebe-a4eb-1e84-1e350c548507",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[26] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "baeea75c-690d-c2f0-6243-73de46f1102c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[28] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "488a8bdd-ee9d-284b-a0dd-52ca4e19bbf0",
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
									"7d2d998b-f823-d3cc-89c4-b8754400f837",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "e0bf387a-fc0c-d758-b008-62138b1dfd8e",
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
							uuid = "7d2d998b-f823-d3cc-89c4-b8754400f837",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 113.45,
				name = "[DRK R1][MT] Reprisal 01:53",
				timelineIndex = 28,
				timerOffset = -0.073,
				uuid = "9d197398-0172-15c0-a4d3-6ed6c00e0bdd",
				version = 2,
			},
		},
	},
	[29] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "ae4728a7-91b3-659e-a1a6-8186b422c0a8",
			},
			objectType = "folder",
		},
	},
	[30] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "9d4af7c9-e679-48c5-c4e6-f5efa531ea59",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "7fba664e-2c6f-8d31-b68d-0d438e4c7ee6",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "bb1e7d68-c5b9-e89a-9a84-461bec71fa11",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "29186b70-aa5d-4104-a3ec-94ebb9e62c59",
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
									"c08b6ed9-89df-c0e1-81ec-bfd9761b7c3d",
									true,
								},
								
								{
									"1b41ad11-632b-40b7-955d-faf781fa5fb0",
									true,
								},
								
								{
									"b7e955b3-86ac-c6f2-b989-c48d571e3271",
									true,
								},
								
								{
									"4052db42-6073-8081-84b3-9155df249c6a",
									true,
								},
								
								{
									"e0323c39-dbd6-932b-9105-561109b033f6",
									true,
								},
								
								{
									"e5ff58e5-2388-a169-8594-fb07b9805c04",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "Reprisal - self",
							uuid = "054937f0-207d-4280-933c-7b11d51d355d",
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
							uuid = "c08b6ed9-89df-c0e1-81ec-bfd9761b7c3d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "1b41ad11-632b-40b7-955d-faf781fa5fb0",
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
							uuid = "b7e955b3-86ac-c6f2-b989-c48d571e3271",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "4052db42-6073-8081-84b3-9155df249c6a",
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
							uuid = "e0323c39-dbd6-932b-9105-561109b033f6",
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
							partyTargetName = "The Tyrant",
							partyTargetType = "Named Target",
							uuid = "e5ff58e5-2388-a169-8594-fb07b9805c04",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 121.403,
				name = "[WAR+DRK][OT] Reprisal 01:52 - Crown of Arcadia",
				timeRange = true,
				timelineIndex = 30,
				timerEndOffset = -8.465,
				timerOffset = 2.616,
				timerStartOffset = -9.465,
				uuid = "8ee4c5dc-8791-6b21-85db-0db24f0e8f04",
				version = 2,
			},
		},
	},
	[31] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "dc1abc99-58bd-044a-a562-25d7e10c954b",
			},
			objectType = "folder",
		},
	},
	[33] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "80500bbd-7c2b-6efd-b8b4-f201d341cc71",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "2b16a3be-71ec-6e43-9fc7-56cea93eaca0",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "6dc9c1e5-62fc-ad33-b441-2afa30ce8af7",
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
									"b5f4cd5b-ef77-eb10-856c-315795b8c0da",
									true,
								},
								
								{
									"96a44081-b53a-9147-9d19-0960054b15ec",
									true,
								},
								
								{
									"fac5bf4e-3399-e8ac-b746-52ea587fbfa1",
									true,
								},
								
								{
									"aaf90f32-7797-4f93-be2c-47afd66dda2a",
									true,
								},
								
								{
									"99094429-1d6b-5991-96a3-8053a8223860",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "Dark Missionary - self",
							uuid = "8386ba5f-3953-acdc-bf19-d7107b28e758",
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
							uuid = "b5f4cd5b-ef77-eb10-856c-315795b8c0da",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "96a44081-b53a-9147-9d19-0960054b15ec",
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
							uuid = "fac5bf4e-3399-e8ac-b746-52ea587fbfa1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "aaf90f32-7797-4f93-be2c-47afd66dda2a",
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
							uuid = "99094429-1d6b-5991-96a3-8053a8223860",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 140.606,
				name = "[WAR+DRK][OT] Dark Missionary 02:17 - Dance of Domination",
				timeRange = true,
				timelineIndex = 33,
				timerEndOffset = -2.216,
				timerOffset = -1.544,
				timerStartOffset = -3.216,
				uuid = "81249061-11d5-d6d6-ba6e-5af3a23d5c83",
				version = 2,
			},
		},
	},
	[39] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "6460097c-a7bd-7788-4052-8cea5e84114c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "f1e63514-2206-7d0c-ad32-ec822bcaa3a4",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "e12d1aff-5975-41d5-9cbb-1a233a4ff49e",
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
							actionID = 7537,
							conditions = 
							{
								
								{
									"4fde2f4b-8eaa-dfe1-8317-53236ec3b565",
									true,
								},
								
								{
									"46209156-1247-6b39-a33b-73d7456f6017",
									true,
								},
								
								{
									"c55edf1d-f426-30af-80a4-927804dfab46",
									true,
								},
								
								{
									"ff16f599-c20c-6365-a6e3-d6988ecfde04",
									true,
								},
								
								{
									"3b68b66e-a244-49d7-b7d6-7434cff2d977",
									true,
								},
								
								{
									"3bd0e8a3-115f-f363-93aa-1a2ee10c4da0",
									true,
								},
							},
							endIfUsed = true,
							name = "Shirk - WAR",
							targetType = "Other Tank",
							uuid = "764e407a-8722-0316-a489-6aeedfc553a1",
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
							uuid = "4fde2f4b-8eaa-dfe1-8317-53236ec3b565",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "46209156-1247-6b39-a33b-73d7456f6017",
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
							uuid = "c55edf1d-f426-30af-80a4-927804dfab46",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "ff16f599-c20c-6365-a6e3-d6988ecfde04",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7537,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "3b68b66e-a244-49d7-b7d6-7434cff2d977",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 4,
							inRangeValue = 25,
							name = "Co-tank in range",
							partyTargetType = "Other Tank",
							uuid = "3bd0e8a3-115f-f363-93aa-1a2ee10c4da0",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 144.7,
				name = "[WAR+DRK][OT] Shirk 02:24 - Dance of Domination",
				timeRange = true,
				timelineIndex = 39,
				timerEndOffset = 0.009,
				timerStartOffset = -0.991,
				uuid = "5126edc3-9118-bbcf-8163-3c33174f79c2",
				version = 2,
			},
		},
	},
	[40] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "87e69ebc-3a2e-4a20-7906-4a7e495c868c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[41] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "d43991b1-3d49-d125-fbf5-0d8b5248d581",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[42] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "611c97da-a5a9-ff05-8e36-85d61377fa87",
			},
			objectType = "folder",
		},
	},
	[43] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "b1f62a17-2888-345b-4a8f-14d5bcdd59e7",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "085ebdc3-627d-e598-b7af-ffd92744fe48",
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
									"5a4150da-f37e-e0ce-8484-e05f6a4a0516",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "9e24274d-10e9-8de0-99f1-bf7496e2736e",
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
							uuid = "5a4150da-f37e-e0ce-8484-e05f6a4a0516",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 155.794,
				name = "[DRK R1][MT] Rampart 02:36",
				timelineIndex = 43,
				timerOffset = 1.02,
				uuid = "96a21147-5f4d-e37a-847c-84c9f370d3b0",
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
									"3b17ec83-b1bb-259d-9d55-b59fc65a13c2",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "5aebb357-aec9-4330-928e-102ddf44c423",
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
							uuid = "3b17ec83-b1bb-259d-9d55-b59fc65a13c2",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 155.794,
				name = "[DRK R1][MT] Dark Mind 02:38",
				timelineIndex = 43,
				timerOffset = 2.528,
				uuid = "5be7a2a8-86cb-ceb0-96ca-5ab89b50153e",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "d22b6b9d-8b1f-e42c-be48-e74e8a969170",
			},
			objectType = "folder",
		},
	},
	[44] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "2c0da1e8-b042-1fb4-f954-f61291ae5b38",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "a63d1cd3-b767-6986-942f-d5e66e1174ad",
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
									"3ac09811-00dc-9e6f-8cb0-4dc83d101edd",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "34c0ac46-6620-8fec-a619-9e7421f15512",
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
							uuid = "3ac09811-00dc-9e6f-8cb0-4dc83d101edd",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 161.887,
				name = "[DRK R1][MT] Oblation 02:38",
				timelineIndex = 44,
				timerOffset = -2.899,
				uuid = "2edac88b-20d2-2eb3-88fb-240d59bd4b33",
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
									"49c575f7-cf45-1892-a889-85a22551ebe1",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "31a6754c-a5a4-1738-875c-b334ca7b5400",
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
							uuid = "49c575f7-cf45-1892-a889-85a22551ebe1",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 161.887,
				name = "[DRK R1][MT] The Blackest Night 02:40",
				timelineIndex = 44,
				timerOffset = -0.902,
				uuid = "f1752434-0440-bd92-b03f-cd7ff257f711",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "d689b5a9-3491-1155-acdd-c70702c69d72",
			},
			objectType = "folder",
		},
	},
	[45] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "9a80f94d-b06b-a709-e7aa-dd7fc1d6549d",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "b71880a8-a1ad-06d3-8bf1-ba4081958391",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "235a7a96-d748-3d5b-aaf6-a6c3133d120c",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "f66e857a-d5fa-adf2-ac6a-c393de87e089",
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
							actionID = 25754,
							conditions = 
							{
								
								{
									"05c6736a-4092-879b-a0ea-f1f67d6ee884",
									true,
								},
								
								{
									"f03d6ffe-7c79-e0ab-8a76-640e70d03a6c",
									true,
								},
								
								{
									"03106ca4-1bd8-9e45-b487-202417f9f2f4",
									true,
								},
								
								{
									"cf92539d-b8c7-48b1-99a3-8d34e7be1801",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "Oblation - self",
							uuid = "21d555b0-f4b0-1b3d-ba06-dea8b7aab0f5",
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
							uuid = "05c6736a-4092-879b-a0ea-f1f67d6ee884",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "f03d6ffe-7c79-e0ab-8a76-640e70d03a6c",
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
							uuid = "03106ca4-1bd8-9e45-b487-202417f9f2f4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "cf92539d-b8c7-48b1-99a3-8d34e7be1801",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 162.981,
				name = "[WAR+DRK][OT] Oblation 02:36 - Heavy Hitter / Impact / Raw Steel",
				timeRange = true,
				timelineIndex = 45,
				timerEndOffset = -5.603,
				timerOffset = 3.017,
				timerStartOffset = -6.603,
				uuid = "f85d4c1c-53f4-aa31-80c7-49c3d13ea0a6",
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
									"7db9fb10-6046-388e-8bae-f45459a138af",
									true,
								},
								
								{
									"3cf3f84f-79e8-8851-8c20-5ed1d3c27b9d",
									true,
								},
								
								{
									"bb5d074a-d4b6-8305-adf6-2fe278bddd7f",
									true,
								},
								
								{
									"3d86671f-a54e-2bad-b25f-e87688964531",
									true,
								},
								
								{
									"4acfefcd-e4e7-32d8-bae0-cf7b8621b6d2",
									true,
								},
								
								{
									"b065cc2a-1eba-702f-9e99-450ee2d60f01",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "The Blackest Night - self",
							uuid = "e876379c-d877-309a-88d2-d700751fe17f",
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
							uuid = "7db9fb10-6046-388e-8bae-f45459a138af",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "3cf3f84f-79e8-8851-8c20-5ed1d3c27b9d",
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
							uuid = "bb5d074a-d4b6-8305-adf6-2fe278bddd7f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "3d86671f-a54e-2bad-b25f-e87688964531",
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
							uuid = "4acfefcd-e4e7-32d8-bae0-cf7b8621b6d2",
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
							uuid = "b065cc2a-1eba-702f-9e99-450ee2d60f01",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 162.981,
				name = "[WAR+DRK][OT] The Blackest Night 02:38 - Heavy Hitter / Impact / Raw Steel",
				timeRange = true,
				timelineIndex = 45,
				timerEndOffset = -3.507,
				timerOffset = -0.635,
				timerStartOffset = -4.507,
				uuid = "36a80446-6a2a-208d-a5a5-6098e0c6b379",
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
							actionID = 7531,
							conditions = 
							{
								
								{
									"948d19e6-cd02-f1ff-9098-f26c231dee6b",
									true,
								},
								
								{
									"34dc1f31-b3bd-1bf8-a781-8fc51a7be125",
									true,
								},
								
								{
									"96bb80d9-6311-a88e-a10f-6a29ca3ec27f",
									true,
								},
								
								{
									"a6d79e41-06f0-9c31-a4b5-029b78fd257b",
									true,
								},
								
								{
									"3c9ae56e-c2b2-b2a9-b1bc-947a5ddd1ea5",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "Rampart - self",
							uuid = "48b2e0e8-ced6-1c11-9f28-95f189b3f409",
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
							uuid = "948d19e6-cd02-f1ff-9098-f26c231dee6b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "34dc1f31-b3bd-1bf8-a781-8fc51a7be125",
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
							uuid = "96bb80d9-6311-a88e-a10f-6a29ca3ec27f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "a6d79e41-06f0-9c31-a4b5-029b78fd257b",
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
							uuid = "3c9ae56e-c2b2-b2a9-b1bc-947a5ddd1ea5",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 162.981,
				name = "[WAR+DRK][OT] Rampart 02:39 - Heavy Hitter / Impact / Raw Steel",
				timeRange = true,
				timelineIndex = 45,
				timerEndOffset = -2.837,
				timerOffset = 1.013,
				timerStartOffset = -3.837,
				uuid = "c7b5b84b-3359-e730-b481-54997b4c31f5",
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
									"9ea5e1cc-8007-cb28-82a2-473e6ef4c2e1",
									true,
								},
								
								{
									"4823d5e3-250f-3f9f-a9f7-fe6cd751eec1",
									true,
								},
								
								{
									"58c53139-926c-2b6c-836e-2c3825d0003f",
									true,
								},
								
								{
									"ecc1e079-b91a-8cf5-abe6-e3e4100611c5",
									true,
								},
								
								{
									"5663d161-8d52-624e-801c-47a17c0f9fac",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "Dark Mind - self",
							uuid = "b84a22b3-d4e2-7893-8a5d-2542717566cd",
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
							uuid = "9ea5e1cc-8007-cb28-82a2-473e6ef4c2e1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "4823d5e3-250f-3f9f-a9f7-fe6cd751eec1",
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
							uuid = "58c53139-926c-2b6c-836e-2c3825d0003f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "ecc1e079-b91a-8cf5-abe6-e3e4100611c5",
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
							uuid = "5663d161-8d52-624e-801c-47a17c0f9fac",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 162.981,
				name = "[WAR+DRK][OT] Dark Mind 02:40 - Heavy Hitter / Impact / Raw Steel",
				timeRange = true,
				timelineIndex = 45,
				timerEndOffset = -2.214,
				timerOffset = -2.366,
				timerStartOffset = -3.214,
				uuid = "d9795de8-6607-a76f-9d97-20c5f63baa1a",
				version = 2,
			},
		},
	},
	[48] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "1cf61fb4-bf59-a1e8-37ee-0d8679687684",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[49] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "1d1fa709-2dcc-f94d-022e-92f34d17f899",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[53] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "aac800e3-1ea2-46fb-9f5c-e64add7354ef",
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
									"db84cbe1-37fc-e7a3-9ee3-53ded583ddc7",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "72a36598-195a-f5c5-beb3-9a941e3c5c30",
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
							uuid = "db84cbe1-37fc-e7a3-9ee3-53ded583ddc7",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 202.168,
				name = "[DRK R1][MT] Dark Missionary 03:20",
				timelineIndex = 53,
				timerOffset = -1.275,
				uuid = "704fd20f-1d02-d532-85cb-743d33dee938",
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
									"c36a6721-9705-5321-a9fa-38d170ed551b",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "cb082e5a-cb95-835e-8912-c2175cefa1cf",
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
							uuid = "c36a6721-9705-5321-a9fa-38d170ed551b",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 202.168,
				name = "[DRK R1][MT] Reprisal 03:21",
				timelineIndex = 53,
				timerOffset = -0.566,
				uuid = "e06ec27d-4cbc-ab35-beb9-b4b616c42bd7",
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
				name = "Rank 1\\MT",
				uuid = "66ea7794-a676-ac66-b05e-4612a376b069",
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
									"5c75a2de-1db5-5477-a3df-c79a44c61f81",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "MT - Living Dead",
							uuid = "fd4ad5fe-9010-977a-9879-0f61886aeff7",
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
							uuid = "5c75a2de-1db5-5477-a3df-c79a44c61f81",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 218.871,
				name = "[DRK R1][MT] Living Dead 03:40",
				timelineIndex = 60,
				timerOffset = 2.113,
				uuid = "484e0394-da04-3431-af70-e750cc0ff380",
				version = 2,
			},
		},
	},
	[61] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "2bffe2af-da5f-7513-a2b3-901d06cda1ff",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "6c413229-2617-58ab-b011-58daee732c7b",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "436b7255-3d40-1341-9282-d02465e93edd",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Retired old OT",
				uuid = "43067b48-001b-fba0-b8bd-4825549a8d87",
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
									"b9243391-05ed-9e6b-81cd-f57f972cf0de",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "OT - Living Dead",
							uuid = "01c2a660-d538-80e8-8191-ef1f383ae0b9",
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
							uuid = "b9243391-05ed-9e6b-81cd-f57f972cf0de",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 225.152,
				name = "[DRK R1][OT] Living Dead 03:43 - superseded",
				timelineIndex = 61,
				timerOffset = -2.125,
				uuid = "c232c2ab-badf-11af-bc29-c1df60fce21b",
				version = 2,
			},
		},
	},
	[62] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "5d29f314-bd1a-36b8-ba77-0f261e763864",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[63] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "661d41ff-94bf-5e05-bf13-870726dd9d60",
			},
			objectType = "folder",
		},
	},
	[64] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "3954ec2e-5cde-b41a-2a39-c20c98290efe",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "54853b79-36da-f562-ab63-a1f3efe5d5d8",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "21ba70da-221a-1a27-9799-70a5de21e38b",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "98ae1b5a-bef5-4e6f-99b7-8d66309983db",
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
									"03272a8a-5d7e-76b1-93af-218e2a132897",
									true,
								},
								
								{
									"5de9fbdf-1a56-6e31-9676-ff24acf7c694",
									true,
								},
								
								{
									"2c16b534-06f1-57b5-88e2-b3bc14d90d44",
									true,
								},
								
								{
									"bcf75b54-fb4f-e32f-b47c-a122f2327685",
									true,
								},
								
								{
									"8036b7a4-ffe5-c2bd-9105-28d354f89413",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "Dark Missionary - self",
							uuid = "e1359e9a-f52e-41a3-a3aa-2ad44235f311",
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
							uuid = "03272a8a-5d7e-76b1-93af-218e2a132897",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "5de9fbdf-1a56-6e31-9676-ff24acf7c694",
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
							uuid = "2c16b534-06f1-57b5-88e2-b3bc14d90d44",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "bcf75b54-fb4f-e32f-b47c-a122f2327685",
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
							uuid = "8036b7a4-ffe5-c2bd-9105-28d354f89413",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 239.246,
				name = "[WAR+DRK][OT] Dark Missionary 03:55 - One and Only",
				timeRange = true,
				timelineIndex = 64,
				timerEndOffset = -3.284,
				timerOffset = -1.544,
				timerStartOffset = -4.284,
				uuid = "cc37cd6d-39db-966e-b745-f9248977d765",
				version = 2,
			},
		},
	},
	[65] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "ec031fb4-d446-3679-ada5-ea0e80ec372e",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "bac15513-dd30-be7f-96a7-00bbed51b464",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Retired old OT",
				uuid = "5d479e2e-6b5b-db0b-97f3-4c1f0a0a1da1",
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
									"e57aa7c7-a8ef-9eea-ab00-7ba824723bbe",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "OT - Dark Mind",
							uuid = "2654e78a-a9c0-bf71-8ac1-31526b89dbc2",
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
							uuid = "e57aa7c7-a8ef-9eea-ab00-7ba824723bbe",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 251.449,
				name = "[DRK R1][OT] Dark Mind 04:06 - superseded",
				timelineIndex = 65,
				timerOffset = -5.294,
				uuid = "4b5d8a9e-3cdc-edf7-b4c9-37670baa062d",
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
									"e34d2383-4b45-11a1-8459-5a821db5fb06",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "OT - Oblation",
							uuid = "77407a50-b597-00db-b099-8ce736f1a5aa",
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
							uuid = "e34d2383-4b45-11a1-8459-5a821db5fb06",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 251.449,
				name = "[DRK R1][OT] Oblation 04:06 - superseded",
				timelineIndex = 65,
				timerOffset = -4.625,
				uuid = "770c6b4e-4ed5-a3b7-a4b1-4c610f887f4b",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "a46b7678-3849-19d9-8b29-87d231e1e543",
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
									"0dfa8587-1b06-6110-9661-00e7ce416b77",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "MT - Shadowed Vigil",
							uuid = "bd6d3dae-8004-bb6b-9ae0-87b3d2966308",
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
							uuid = "0dfa8587-1b06-6110-9661-00e7ce416b77",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 251.449,
				name = "[DRK R1][MT] Shadowed Vigil 04:08",
				timelineIndex = 65,
				timerOffset = -2.889,
				uuid = "3b1dbba2-0b00-a7af-a7d9-fd6be26d58ce",
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
									"16ab5221-1b63-4d06-9d13-3d229c230afa",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "f24aec78-29e4-4327-afc9-e85a32c18312",
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
							uuid = "16ab5221-1b63-4d06-9d13-3d229c230afa",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 251.449,
				name = "[DRK R1][MT] Dark Mind 04:09",
				timelineIndex = 65,
				timerOffset = -2.266,
				uuid = "5a1f335c-5073-31b9-8070-b3598a331da5",
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
				name = "Rank 1\\OT",
				uuid = "18cc5bd8-9805-9308-af40-e2bd6c2ddd01",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "33fdf1d5-8fe8-b821-94ab-71161adb1733",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Retired old OT",
				uuid = "2251ee35-8f95-c64e-8419-94822d1662eb",
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
									"f657ce5c-0b4a-c541-b81b-6bbc69e9fa08",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "OT - The Blackest Night",
							uuid = "cd31918c-683a-6bda-9292-5ace0949b99e",
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
							uuid = "f657ce5c-0b4a-c541-b81b-6bbc69e9fa08",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 254.886,
				name = "[DRK R1][OT] The Blackest Night 04:14 - superseded",
				timelineIndex = 68,
				timerOffset = -0.846,
				uuid = "7a285e1b-02fe-97c7-a10b-a933cf9f6152",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "93f8760e-de3c-a240-bcfd-ed5e0335b51d",
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
							actionID = 7537,
							conditions = 
							{
								
								{
									"10d8d4be-463a-975e-a695-c675fcdc1868",
									true,
								},
								
								{
									"8373c419-2e98-ffbf-8530-605da11b3ec3",
									true,
								},
								
								{
									"4eaae844-c3ea-38cd-ab39-ebccd9931bbb",
									true,
								},
								
								{
									"9e2fd8f4-554d-a73c-9b28-c309bef07987",
									true,
								},
								
								{
									"dc78cdde-a936-f193-92a6-7ea5623e203a",
									true,
								},
								
								{
									"3a80a709-7e57-e4a9-aad8-a324eab094cd",
									true,
								},
							},
							endIfUsed = true,
							name = "Shirk - WAR",
							targetType = "Other Tank",
							uuid = "14dc4263-c947-4898-b589-5fcaefc3efc6",
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
							uuid = "10d8d4be-463a-975e-a695-c675fcdc1868",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "8373c419-2e98-ffbf-8530-605da11b3ec3",
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
							uuid = "4eaae844-c3ea-38cd-ab39-ebccd9931bbb",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "9e2fd8f4-554d-a73c-9b28-c309bef07987",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7537,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "dc78cdde-a936-f193-92a6-7ea5623e203a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 4,
							inRangeValue = 25,
							name = "Co-tank in range",
							partyTargetType = "Other Tank",
							uuid = "3a80a709-7e57-e4a9-aad8-a324eab094cd",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 254.886,
				name = "[WAR+DRK][OT] Shirk 04:24 - Great Wall of Fire",
				timeRange = true,
				timelineIndex = 68,
				timerEndOffset = 10.561,
				timerStartOffset = 8.561,
				uuid = "c901c320-4818-63c9-b0ea-3239156eb9cd",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "2a7d8932-3734-2512-9a4c-0be3cec374d8",
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
									"25c468bf-5f51-f24d-851c-60a07d399d29",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "745dafc6-1435-0630-b8e1-db06561d5ac3",
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
							uuid = "25c468bf-5f51-f24d-851c-60a07d399d29",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 254.886,
				name = "[DRK R1][MT] The Blackest Night 04:14",
				timelineIndex = 68,
				timerOffset = -0.668,
				uuid = "1b94f56f-6436-ebb3-938e-dc0de5e1ef0f",
				version = 2,
			},
		},
	},
	[72] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "27737f4b-2bab-723f-ac84-7aad1bcf861b",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[79] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "fa978ed8-ad7b-ad2c-46f3-8aae2b52dfa8",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[80] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "4694ce51-a2d3-48e4-a5ac-8cf4a8381568",
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
									"e7f1d53c-f716-a473-993b-7393b0190dab",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "39cb4361-31fe-ed6d-9072-508b00a2c665",
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
							uuid = "e7f1d53c-f716-a473-993b-7393b0190dab",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 298.714,
				name = "[DRK R1][MT] Oblation 04:56",
				timelineIndex = 80,
				timerOffset = -2.521,
				uuid = "81bd162b-5dfd-5941-994d-28ed0881a199",
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
									"62398b2f-c664-1bcf-af91-a84da34d8e58",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "fef64d55-e0bb-d85c-9af7-b99cc4823a73",
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
							uuid = "62398b2f-c664-1bcf-af91-a84da34d8e58",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 298.714,
				name = "[DRK R1][MT] The Blackest Night 04:56",
				timelineIndex = 80,
				timerOffset = -1.856,
				uuid = "f4292e65-50e0-2351-b728-b5e210cf9589",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "a649b84a-7c50-b9d9-8a4b-bb64f525395f",
			},
			objectType = "folder",
		},
	},
	[82] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "6e5bf3f6-90a8-9cb2-1208-c8049f4dbc06",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "236210c4-7f27-f67d-ba8a-2f3618c6f051",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "16d44fb3-18f7-be87-b3c9-5541edddc808",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "3a7fbdab-04a1-a637-8736-010c13a6fcad",
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
									"b09d9fc5-316b-8d85-8103-64bdf02bffe2",
									true,
								},
								
								{
									"556c4264-1abd-affb-8594-be0df8122c9e",
									true,
								},
								
								{
									"02eccb26-7399-090a-909d-81c46926f578",
									true,
								},
								
								{
									"9cb00fad-8d85-50c6-9689-c42d0cef2026",
									true,
								},
								
								{
									"ff830e0f-802d-ea2b-bd86-bcf59cf264cb",
									true,
								},
								
								{
									"ac46c897-d8b3-cfdc-ba07-0b19e15911af",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "Reprisal - self",
							uuid = "40500ef3-2231-9ef1-ac59-2564b84371ac",
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
							uuid = "b09d9fc5-316b-8d85-8103-64bdf02bffe2",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "556c4264-1abd-affb-8594-be0df8122c9e",
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
							uuid = "02eccb26-7399-090a-909d-81c46926f578",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "9cb00fad-8d85-50c6-9689-c42d0cef2026",
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
							uuid = "ff830e0f-802d-ea2b-bd86-bcf59cf264cb",
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
							partyTargetName = "The Tyrant",
							partyTargetType = "Named Target",
							uuid = "ac46c897-d8b3-cfdc-ba07-0b19e15911af",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 300.277,
				name = "[WAR+DRK][OT] Reprisal 04:53 - Cosmic Kiss",
				timeRange = true,
				timelineIndex = 82,
				timerEndOffset = -5.92,
				timerOffset = -2.4,
				timerStartOffset = -6.92,
				uuid = "2c6533f5-bd03-a635-ada3-68cbdba604d3",
				version = 2,
			},
		},
	},
	[83] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "9e068309-b831-0d77-bfca-b1536ba7ea99",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "0f803bde-fb2a-7285-95db-c7384d7d094c",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Retired old OT",
				uuid = "07a0b50c-30f0-951f-a4fe-86156ef9ef1b",
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
									"411e1011-4e9b-2d34-a07e-047d0d616a1b",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "OT - The Blackest Night",
							uuid = "962a46ed-4097-c538-8e9d-569d810d2390",
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
							uuid = "411e1011-4e9b-2d34-a07e-047d0d616a1b",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 308.246,
				name = "[DRK R1][OT] The Blackest Night 05:06 - superseded",
				timelineIndex = 83,
				timerOffset = -1.631,
				uuid = "38f81008-63a0-f435-b0b6-6db38568a0d2",
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
									"ff1e67f9-3d89-77b4-bc35-b4d5d169825a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "OT - Oblation",
							uuid = "03e737ec-c325-fe51-acad-ab5ee1b0619a",
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
							uuid = "ff1e67f9-3d89-77b4-bc35-b4d5d169825a",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 308.246,
				name = "[DRK R1][OT] Oblation 05:07 - superseded",
				timelineIndex = 83,
				timerOffset = -0.921,
				uuid = "4d0bf58c-dbbc-7bbd-b457-b623171db0d2",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "f502459e-de32-2717-9949-97c95b0b7fc4",
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
									"d1c7e0ae-8e8d-0ac5-8f49-eff060c152d9",
									true,
								},
								
								{
									"2a4b86f4-dc1d-2395-8022-af0603de333c",
									true,
								},
								
								{
									"5c802d04-d4ec-7815-b4b0-d227e587f075",
									true,
								},
								
								{
									"76f26170-5654-b411-912e-8ef5993ce6a2",
									true,
								},
								
								{
									"4380e0f3-0b88-8a80-9a5d-76e9fd76fb4b",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "Shadowed Vigil - self",
							uuid = "688732b7-709d-416d-b42d-b3742d1bd4b9",
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
							uuid = "d1c7e0ae-8e8d-0ac5-8f49-eff060c152d9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "2a4b86f4-dc1d-2395-8022-af0603de333c",
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
							uuid = "5c802d04-d4ec-7815-b4b0-d227e587f075",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "76f26170-5654-b411-912e-8ef5993ce6a2",
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
							uuid = "4380e0f3-0b88-8a80-9a5d-76e9fd76fb4b",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 308.246,
				name = "[WAR+DRK][OT] Shadowed Vigil 05:04 - Foregone Fatality",
				timeRange = true,
				timelineIndex = 83,
				timerEndOffset = -3.421,
				timerOffset = 4.381,
				timerStartOffset = -4.421,
				uuid = "da2c4c8a-af0c-4bd0-b692-e4b1c3e36a51",
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
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "19b466aa-d339-f79e-d30a-9e30dc51c97a",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "5c9ca007-211d-f29b-8426-4170c9d63f19",
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
									"a053a542-2a62-c789-985b-6816e2323e0f",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "0fbb5c2b-94de-edbb-b140-c422bd2af0bb",
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
							uuid = "a053a542-2a62-c789-985b-6816e2323e0f",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 310.246,
				name = "[DRK R1][MT] Rampart 05:09",
				timelineIndex = 86,
				timerOffset = -0.516,
				uuid = "dd182987-aaa1-4bce-afec-ba4410b81bf3",
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
				name = "Rank 1\\MT",
				uuid = "b9e042cb-6053-e29c-87e1-60036db0eb6c",
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
									"f40e47a6-d5f0-1b11-bf24-8230ceee004e",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "fe0228a1-3038-a746-921a-1a516f2436db",
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
							uuid = "f40e47a6-d5f0-1b11-bf24-8230ceee004e",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 312.761,
				name = "[DRK R1][MT] Dark Mind 05:14",
				timelineIndex = 87,
				timerOffset = 1.774,
				uuid = "9a929612-d60f-79bc-bd32-70d761d5f681",
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
				name = "Rank 1\\OT",
				uuid = "aec439bb-0419-4ba4-a509-2530a6ec7b8f",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "2161cd7e-abf5-b1ae-a4b7-58d8669da412",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "5dbb091a-5821-c61c-964b-1c9ff5edae5e",
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
									"427c4898-8c8f-ce80-a758-96eda4411232",
									true,
								},
								
								{
									"2ffda70a-511c-794b-9a60-980a5f92caf2",
									true,
								},
								
								{
									"c91f0318-7593-96dd-944a-75ff38224b28",
									true,
								},
								
								{
									"dcdcac58-8c04-1ada-ae40-02f3c99f72d3",
									true,
								},
								
								{
									"b31bfe48-4cf6-b369-b3b9-f9323975c4a3",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "Rampart - self",
							uuid = "a69b4d77-223b-703d-ad10-10b0ce95ebe9",
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
							uuid = "427c4898-8c8f-ce80-a758-96eda4411232",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "2ffda70a-511c-794b-9a60-980a5f92caf2",
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
							uuid = "c91f0318-7593-96dd-944a-75ff38224b28",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "dcdcac58-8c04-1ada-ae40-02f3c99f72d3",
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
							uuid = "b31bfe48-4cf6-b369-b3b9-f9323975c4a3",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 318.199,
				name = "[WAR+DRK][OT] Rampart 05:15 - Foregone Fatality",
				timeRange = true,
				timelineIndex = 88,
				timerEndOffset = -2.35,
				timerOffset = 3.532,
				timerStartOffset = -3.35,
				uuid = "0bdbb9df-4f15-e474-8fbf-e7db469bb07d",
				version = 2,
			},
		},
	},
	[90] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "408c2488-1b2c-7e2a-aef7-265dafe444c4",
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
									"f6679b47-1a79-2789-8161-a45fa65287fe",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "92f7aad8-9656-35ed-8422-a445b8c3228d",
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
							uuid = "f6679b47-1a79-2789-8161-a45fa65287fe",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 318.949,
				name = "[DRK R1][MT] The Blackest Night 05:19",
				timelineIndex = 90,
				timerOffset = 0.146,
				uuid = "3c1d936b-c9ab-dbf1-b979-61ccbe5cee39",
				version = 2,
			},
		},
	},
	[93] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "9bdb7caa-ddeb-9b7f-8e9d-0a3501e34409",
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
									"d8a249ae-fdd5-6a25-bae9-78c2bc1a74d9",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "b823efae-27a5-330f-8df7-75db726fafe4",
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
							uuid = "d8a249ae-fdd5-6a25-bae9-78c2bc1a74d9",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 328.152,
				name = "[DRK R1][MT] Oblation 05:26",
				timelineIndex = 93,
				timerOffset = -1.932,
				uuid = "da52acd4-3be0-ec07-a37e-b84de615da20",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "5dbcf928-e504-1d8f-bac0-757fe7b1ab99",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "bfd7b88f-1f04-08e0-8169-61fa0feb16c8",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "e9f04e4c-3f55-903b-9ff2-baa6d254eb9e",
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
							actionID = 7393,
							conditions = 
							{
								
								{
									"29aabf97-d1a0-eb92-b183-2d2833ee6f40",
									true,
								},
								
								{
									"b83e8672-e04b-d5de-9a42-b4ecc460e2fb",
									true,
								},
								
								{
									"b058da2d-2ba9-d302-845d-02bacfd96de6",
									true,
								},
								
								{
									"9fc27360-b51f-9d83-b2b0-277f65fe4f2b",
									true,
								},
								
								{
									"7a114240-8f85-d417-b3e7-72c4f17e7baa",
									true,
								},
								
								{
									"28f4a8ac-652a-6530-acf3-b4c30dc4bc47",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "The Blackest Night - self",
							uuid = "c462d09a-20f4-7b06-a41c-36d43f1bb55c",
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
							uuid = "29aabf97-d1a0-eb92-b183-2d2833ee6f40",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "b83e8672-e04b-d5de-9a42-b4ecc460e2fb",
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
							uuid = "b058da2d-2ba9-d302-845d-02bacfd96de6",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "9fc27360-b51f-9d83-b2b0-277f65fe4f2b",
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
							uuid = "7a114240-8f85-d417-b3e7-72c4f17e7baa",
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
							uuid = "28f4a8ac-652a-6530-acf3-b4c30dc4bc47",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 328.152,
				name = "[WAR+DRK][OT] The Blackest Night 05:24 - Foregone Fatality",
				timeRange = true,
				timelineIndex = 93,
				timerEndOffset = -3.196,
				timerOffset = -1.087,
				timerStartOffset = -4.196,
				uuid = "8b58a5e1-e6b2-8960-b08a-c058f52ac10c",
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
									"61800a73-7c59-d315-a9d1-daafd6a2c63d",
									true,
								},
								
								{
									"f05d09b9-7593-5b36-97a5-7eb46264a845",
									true,
								},
								
								{
									"cb7e2b46-d368-105f-8485-a044c4f4cbd5",
									true,
								},
								
								{
									"9c4ab20c-17ad-908c-9e48-a5250d10713f",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "Oblation - self",
							uuid = "1138c0d7-9689-5fdf-b656-6cf997f1c4b0",
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
							uuid = "61800a73-7c59-d315-a9d1-daafd6a2c63d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "f05d09b9-7593-5b36-97a5-7eb46264a845",
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
							uuid = "cb7e2b46-d368-105f-8485-a044c4f4cbd5",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "9c4ab20c-17ad-908c-9e48-a5250d10713f",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 328.152,
				name = "[WAR+DRK][OT] Oblation 05:25 - Foregone Fatality",
				timeRange = true,
				timelineIndex = 93,
				timerEndOffset = -2.486,
				timerOffset = -1.25,
				timerStartOffset = -3.486,
				uuid = "b66f9026-805f-5302-9d65-1428a7e81309",
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
									"e5f3d991-b267-49c9-8641-a146df5a6527",
									true,
								},
								
								{
									"f1b33ec2-cb37-876a-a370-8212e00dd285",
									true,
								},
								
								{
									"ecf8432f-5e07-fab7-96d3-b0e6cca6a357",
									true,
								},
								
								{
									"450f87d5-b771-4e09-b82d-39e197a99e39",
									true,
								},
								
								{
									"d932eb4b-d5d0-d66d-afff-c85683a98247",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "Dark Mind - self",
							uuid = "0dadb95e-677e-5679-a6a8-db730051d0be",
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
							uuid = "e5f3d991-b267-49c9-8641-a146df5a6527",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "f1b33ec2-cb37-876a-a370-8212e00dd285",
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
							uuid = "ecf8432f-5e07-fab7-96d3-b0e6cca6a357",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "450f87d5-b771-4e09-b82d-39e197a99e39",
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
							uuid = "d932eb4b-d5d0-d66d-afff-c85683a98247",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 328.152,
				name = "[WAR+DRK][OT] Dark Mind 05:26 - Foregone Fatality",
				timeRange = true,
				timelineIndex = 93,
				timerEndOffset = -0.928,
				timerOffset = 0.169,
				timerStartOffset = -1.928,
				uuid = "82b57587-c52c-921e-83cf-0ec0060499c9",
				version = 2,
			},
		},
	},
	[95] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "137ad3ba-f0bf-612e-228b-a79464b3b30a",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "e8eb9fd5-6935-1de5-9f57-4494a3048825",
			},
			objectType = "folder",
		},
	},
	[100] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "2c8399db-1b45-917f-a7f2-7b716cbd6d6b",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[101] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "a48ceece-2cef-aa12-1fb0-4c7c9ad0dc5e",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "6874e293-85e6-1a38-8202-a7c4fbf9f32e",
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
									"42631b01-0a12-e6e1-a6d6-86dfe2b82a33",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "b6a052f4-1025-951f-b8fa-9f2647a88c72",
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
							uuid = "42631b01-0a12-e6e1-a6d6-86dfe2b82a33",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 358.949,
				name = "[DRK R1][MT] Dark Missionary 05:54",
				timelineIndex = 101,
				timerOffset = -4.655,
				uuid = "8bcdebd3-fabe-920b-9ea7-0cd4f6c87704",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "700c6f48-d1c5-b168-a288-029a92600dbf",
			},
			objectType = "folder",
		},
	},
	[102] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "414536a5-ac78-4679-38d8-80d7571186b5",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "9ea72d65-352b-f5a2-b11c-cb0abde28879",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "39b65d24-f0bf-f60a-a8aa-da37f7d34cad",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "ecb1839e-5277-867c-a2e8-d6d83bace2c5",
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
									"17718c2c-2fe8-4824-8052-30f617632994",
									true,
								},
								
								{
									"34656071-ad47-dc91-8a68-310b37a07232",
									true,
								},
								
								{
									"7bce82ec-8f5e-a0f4-9a2c-ebf8b288f1b9",
									true,
								},
								
								{
									"9b5dc5b9-a18b-87b3-9218-03b673c943d3",
									true,
								},
								
								{
									"c62042b4-7b5a-439d-9126-cc7fdc0176e6",
									true,
								},
								
								{
									"b16df074-a6c6-49dd-a32f-519c6a1846ad",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "Reprisal - self",
							uuid = "21eb2795-cecb-a6b4-9ae0-f403febe223f",
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
							uuid = "17718c2c-2fe8-4824-8052-30f617632994",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "34656071-ad47-dc91-8a68-310b37a07232",
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
							uuid = "7bce82ec-8f5e-a0f4-9a2c-ebf8b288f1b9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "9b5dc5b9-a18b-87b3-9218-03b673c943d3",
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
							uuid = "c62042b4-7b5a-439d-9126-cc7fdc0176e6",
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
							partyTargetName = "The Tyrant",
							partyTargetType = "Named Target",
							uuid = "b16df074-a6c6-49dd-a32f-519c6a1846ad",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 360.996,
				name = "[WAR+DRK][OT] Reprisal 05:56 - Flatliner",
				timeRange = true,
				timelineIndex = 102,
				timerEndOffset = -3.644,
				timerOffset = -1.662,
				timerStartOffset = -4.644,
				uuid = "85d1047c-3e89-5d5c-90dd-e4102585b93b",
				version = 2,
			},
		},
	},
	[103] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "3e29afa0-32ee-27e4-cf24-1e0a570c8b70",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "aa9cf8ec-49d6-61b1-af57-39304bbe7bcd",
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
									"3f85a3ac-d4a4-c30f-a703-948df6294759",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "10a55b19-76e2-7006-b49f-bc75d5d4513f",
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
							uuid = "3f85a3ac-d4a4-c30f-a703-948df6294759",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 375.136,
				name = "[DRK R1][MT] Reprisal 06:17",
				timelineIndex = 103,
				timerOffset = 2.449,
				uuid = "46389ecb-467f-a290-9093-6d57a01ac486",
				version = 2,
			},
		},
	},
	[104] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "ea75484f-2f8f-c18b-7f60-e20d881ed8df",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "1ffe648c-1f49-57ae-9e5e-04d600b369be",
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
									"48b024a9-63b8-49c2-b84b-03768f76211e",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "cdb7598a-b53f-af1c-8810-753ce085f8ad",
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
							uuid = "48b024a9-63b8-49c2-b84b-03768f76211e",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 388.246,
				name = "[DRK R1][MT] The Blackest Night 06:26",
				timelineIndex = 104,
				timerOffset = -1.435,
				uuid = "3c62e980-ba4d-5191-8f0c-f624eea79a13",
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
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "68064c22-aca0-fe7e-de00-34a82ed1d972",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[109] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "2773b316-a88c-cefa-783b-e174916a7e66",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[110] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "f6f70a50-7847-af54-4ad6-63fe040e9da0",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "8cc1f847-938a-9595-a418-b8df095d181e",
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
									"28a931d7-480c-dfc8-8699-b815306edb3d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "48079c73-3bc1-f236-9fa0-e1010e955588",
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
							uuid = "28a931d7-480c-dfc8-8699-b815306edb3d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 420.339,
				name = "[DRK R1][MT] Oblation 06:56",
				timelineIndex = 110,
				timerOffset = -3.949,
				uuid = "3881481f-7c79-f83c-a72b-ddc7792ba877",
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
									"395ac9b9-2552-c2e4-9372-a9ac1d20365c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "962bf6ad-1b52-ac36-adce-fdee0c0772b4",
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
							uuid = "395ac9b9-2552-c2e4-9372-a9ac1d20365c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 420.339,
				name = "[DRK R1][MT] The Blackest Night 06:58",
				timelineIndex = 110,
				timerOffset = -1.444,
				uuid = "376f2a59-4309-b3a8-8799-79c1c8906adb",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "263f8e67-606d-fdd3-b658-2f3fa5493d9f",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "01007802-4903-83cc-afa6-db13646df241",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "18f3a2ac-30c4-a8ba-838c-dd65a0b17eb6",
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
									"916880d2-f9c1-c6c9-b9ad-39781a03afe3",
									true,
								},
								
								{
									"ce772128-4f03-fe44-bb66-cd08fcfd6217",
									true,
								},
								
								{
									"c5700648-92fa-80f0-8802-7e2ae0fbcbc1",
									true,
								},
								
								{
									"b69baa08-6a63-8b8e-83f3-12148abd3cfa",
									true,
								},
								
								{
									"1a1a89c1-de49-a721-afb0-eddd4d2f9022",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "Dark Missionary - self",
							uuid = "cac63a4b-feb4-aa9f-9edb-4bbd2c976506",
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
							uuid = "916880d2-f9c1-c6c9-b9ad-39781a03afe3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "ce772128-4f03-fe44-bb66-cd08fcfd6217",
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
							uuid = "c5700648-92fa-80f0-8802-7e2ae0fbcbc1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "b69baa08-6a63-8b8e-83f3-12148abd3cfa",
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
							uuid = "1a1a89c1-de49-a721-afb0-eddd4d2f9022",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 420.339,
				name = "[WAR+DRK][OT] Dark Missionary 06:56 - Explosion",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = -3.597,
				timerOffset = 2.135,
				timerStartOffset = -4.597,
				uuid = "9229d18f-6cf1-13d3-b753-20e0506db361",
				version = 2,
			},
		},
	},
	[111] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "f6ba1815-f1dc-41a9-cdc5-270b072a24a5",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[114] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "d7de6c24-16b4-fe40-cb25-0f927a227334",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[115] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "49bf0cb9-cf85-5cc5-b97a-f6ff7a4bfa89",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "a9b403d5-01ac-5307-a626-8a5bad713822",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "ba8c2c28-a134-f7f2-82d4-1c90bbfca96c",
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
									"c4027510-62de-ce13-86ef-6cf317611e70",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "155e95cd-490f-7953-a47f-6cc09fd39cdc",
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
							uuid = "c4027510-62de-ce13-86ef-6cf317611e70",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 444.417,
				name = "[DRK R1][MT] Dark Missionary 07:24",
				timelineIndex = 115,
				timerOffset = -0.111,
				uuid = "8bc5c509-2580-a0fd-9721-016e676140bc",
				version = 2,
			},
		},
	},
	[116] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "66357a93-cbbf-8f86-bc46-dc5edea35676",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "df0fe963-73a7-e04e-9093-16c800febf59",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "203d3b35-e061-586c-b06f-5859f2f5f4f5",
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
									"1dc84443-a722-b9d3-b0d4-097279c79f73",
									true,
								},
								
								{
									"d9ee27fd-03e0-8acd-8cf4-ba4e82ba4822",
									true,
								},
								
								{
									"bb3da143-f889-51d0-a388-3560e6d962c2",
									true,
								},
								
								{
									"d21f2c87-d385-db27-ace1-bee2853e7e0e",
									true,
								},
								
								{
									"9346b475-7ff8-b022-a58c-dd6ab295d208",
									true,
								},
								
								{
									"a95aa425-ca86-7f0c-9c36-4ffb30fa6742",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "Reprisal - self",
							uuid = "eacb50ac-82c4-a1a3-8baa-dd6142fae84f",
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
							uuid = "1dc84443-a722-b9d3-b0d4-097279c79f73",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "d9ee27fd-03e0-8acd-8cf4-ba4e82ba4822",
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
							uuid = "bb3da143-f889-51d0-a388-3560e6d962c2",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "d21f2c87-d385-db27-ace1-bee2853e7e0e",
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
							uuid = "9346b475-7ff8-b022-a58c-dd6ab295d208",
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
							partyTargetName = "The Tyrant",
							partyTargetType = "Named Target",
							uuid = "a95aa425-ca86-7f0c-9c36-4ffb30fa6742",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 445.683,
				name = "[WAR+DRK][OT] Reprisal 07:20 - Massive Meteor",
				timeRange = true,
				timelineIndex = 116,
				timerEndOffset = -4.5809998512268,
				timerOffset = -0.289,
				timerStartOffset = -5.5809998512268,
				uuid = "4f32fb5e-b9f4-cc57-a3cc-050d46ed06d8",
				version = 2,
			},
		},
	},
	[121] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "f4715894-4928-7f68-058d-c1f69dc35a24",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[126] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "44547d6a-02c8-b28d-aaaa-ceca0fada0fa",
			},
			objectType = "folder",
		},
	},
	[127] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "d09c51ae-7b49-d6ca-6ba8-031c1d1ef4be",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "96e3e7de-4e6c-2e1d-9b9a-f55d34e98eb2",
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
									"dee63102-7d5b-6d34-abb9-160f5b3dc67c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "3580a5f2-278b-17da-8a9e-7f7d6cdcd761",
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
							uuid = "dee63102-7d5b-6d34-abb9-160f5b3dc67c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 479.464,
				name = "[DRK R1][MT] Reprisal 07:59",
				timelineIndex = 127,
				timerOffset = 0.168,
				uuid = "ef31d932-bd2c-c4eb-b944-bc4a7debd2b3",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "0e479f9f-16f1-bd52-898d-1475096df0cf",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "39241739-95b3-fd4b-9cfb-5be39cbfd9f6",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "8b7a0bdc-bb7a-7539-91d1-085a6373a6b9",
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
							actionID = 7393,
							conditions = 
							{
								
								{
									"2042351c-98c1-50a6-a56d-cc9dfd53157e",
									true,
								},
								
								{
									"6e44794d-ee66-4750-a306-0e52245a71b2",
									true,
								},
								
								{
									"f6771dac-33a2-d626-8b95-c8dfe64ca4e8",
									true,
								},
								
								{
									"2751a79a-1ece-d100-9870-90d25960236c",
									true,
								},
								
								{
									"52ece48d-b030-0187-bca2-3541d351aaf5",
									true,
								},
								
								{
									"2d37688a-0ac7-eff9-99b7-9bd1ac89f137",
									true,
								},
								
								{
									"a7f7b34c-e7c8-c952-a2a6-c4b6345150f0",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "The Blackest Night - WAR",
							targetType = "Other Tank",
							uuid = "33114b4e-1ac0-f58c-ad83-ed2bbe8ca76e",
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
							uuid = "2042351c-98c1-50a6-a56d-cc9dfd53157e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "6e44794d-ee66-4750-a306-0e52245a71b2",
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
							uuid = "f6771dac-33a2-d626-8b95-c8dfe64ca4e8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "2751a79a-1ece-d100-9870-90d25960236c",
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
							uuid = "52ece48d-b030-0187-bca2-3541d351aaf5",
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
							uuid = "2d37688a-0ac7-eff9-99b7-9bd1ac89f137",
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
							uuid = "a7f7b34c-e7c8-c952-a2a6-c4b6345150f0",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 479.464,
				name = "[WAR+DRK][OT] The Blackest Night 07:59 - WAR support after Crown",
				timeRange = true,
				timelineIndex = 127,
				timerEndOffset = 0.5,
				timerOffset = 0.87,
				timerStartOffset = -0.5,
				uuid = "f3faeedd-4eae-e602-b6b2-4c078556b721",
				version = 2,
			},
		},
	},
	[128] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "001260a8-b082-ea14-a818-63e0477466c2",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "ebb5a397-dd8c-a7fe-9b33-cbac2177d8a3",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Retired old OT",
				uuid = "68ded580-955b-f69c-9387-dd627954beb1",
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
									"1f82a55e-a383-342a-b25a-7d8717efa486",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "OT - Dark Mind",
							uuid = "6b1db754-25a0-fd42-82c6-2834a8b1cc99",
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
							uuid = "1f82a55e-a383-342a-b25a-7d8717efa486",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 489.948,
				name = "[DRK R1][OT] Dark Mind 08:04 - superseded",
				timelineIndex = 128,
				timerOffset = -5.231,
				uuid = "1b7e60d9-5300-ed41-9414-e67bf37006b0",
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
									"e75e960e-bb54-a81d-9874-116045e91798",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "OT - Oblation",
							uuid = "a982a2b0-10c8-72ff-bbe5-49ec1aac6e5d",
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
							uuid = "e75e960e-bb54-a81d-9874-116045e91798",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 489.948,
				name = "[DRK R1][OT] Oblation 08:05 - superseded",
				timelineIndex = 128,
				timerOffset = -4.516,
				uuid = "bb32212f-926f-52fe-aa35-18a3c4b1d853",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "c6f0c1b6-85a7-7e98-a1ac-b9d7a9dee615",
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
									"f2e6a972-6797-b25d-bb2c-ad2de4968136",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "MT - Shadowed Vigil",
							uuid = "69778cde-54ed-535d-9300-4e0776869bdd",
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
							uuid = "f2e6a972-6797-b25d-bb2c-ad2de4968136",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 489.948,
				name = "[DRK R1][MT] Shadowed Vigil 08:04",
				timelineIndex = 128,
				timerOffset = -4.964,
				uuid = "15f5224f-0ffc-3560-bbeb-28a44b694616",
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
									"948ad7db-14b7-1a14-a58d-64a3604547fa",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "b83e115c-f571-80b4-9f4c-8aef2a08cd3e",
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
							uuid = "948ad7db-14b7-1a14-a58d-64a3604547fa",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 489.948,
				name = "[DRK R1][MT] Dark Mind 08:07",
				timelineIndex = 128,
				timerOffset = -2.419,
				uuid = "311c6cd1-7727-8e67-9c15-fbc39865b32d",
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
									"61f7bdf2-45a7-099c-b2d3-6cb9ea794e57",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "9658021b-b9ca-f39b-961f-5728fcc4f688",
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
							uuid = "61f7bdf2-45a7-099c-b2d3-6cb9ea794e57",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 489.948,
				name = "[DRK R1][MT] The Blackest Night 08:09",
				timelineIndex = 128,
				timerOffset = -0.548,
				uuid = "8fb251cd-0b5c-f953-b01d-7ec6e55ea126",
				version = 2,
			},
		},
	},
	[131] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "a2a2e313-3d9b-2e11-bafe-29fd8c04cf69",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "802a3325-2a6b-03b2-bc20-0e7e77f82b4f",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "239112c1-5691-7ed0-8297-1897615cf633",
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
									"242ca87a-8d1f-d6ae-b5ec-545a3beeddf9",
									true,
								},
								
								{
									"17d7b546-768a-1269-9fb0-b47755d8a81f",
									true,
								},
								
								{
									"4ab37245-de52-736f-889a-4ed3878eff8b",
									true,
								},
								
								{
									"92783d19-eef0-855b-a11d-a2ee154fe6dc",
									true,
								},
								
								{
									"0aeec193-3a25-a65d-8c90-204d2e8266c5",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "Shadowed Vigil - self",
							uuid = "e0f1778a-d0e7-8c23-9e51-5ad43faf8fc0",
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
							uuid = "242ca87a-8d1f-d6ae-b5ec-545a3beeddf9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "17d7b546-768a-1269-9fb0-b47755d8a81f",
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
							uuid = "4ab37245-de52-736f-889a-4ed3878eff8b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "92783d19-eef0-855b-a11d-a2ee154fe6dc",
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
							uuid = "0aeec193-3a25-a65d-8c90-204d2e8266c5",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 490.854,
				name = "[WAR+DRK][OT] Shadowed Vigil 08:09 - Great Wall of Fire",
				timeRange = true,
				timelineIndex = 131,
				timerEndOffset = -1.323,
				timerOffset = 0.885,
				timerStartOffset = -2.323,
				uuid = "484243f9-fead-35f2-aae7-7faa7fad8e73",
				version = 2,
			},
		},
	},
	[132] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "2303ca35-6842-861e-8159-92d82486c0bd",
			},
			objectType = "folder",
		},
	},
	[133] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "d2d8014a-0733-0bd5-b081-fcb3bef3355e",
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
									"7b57689b-0319-5a7a-9620-7591fef8d392",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "7a2ab00c-ed5e-606d-b4d8-582f1b39c549",
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
							uuid = "7b57689b-0319-5a7a-9620-7591fef8d392",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 494.058,
				name = "[DRK R1][MT] Oblation 08:13",
				timelineIndex = 133,
				timerOffset = -0.109,
				uuid = "60e15c0c-cf43-9fde-8151-f9fcd01d694d",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "82ae99d4-c329-c3fd-aec7-6ddbd5b422c6",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "5aadf0ec-a614-2461-a301-225958a1b6c7",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "008986a2-ba59-b57c-97a4-324f97121777",
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
									"88b461bb-6872-af3e-968e-5ab10252034f",
									true,
								},
								
								{
									"65b0b8d1-e254-95df-aeb3-d2d778c56142",
									true,
								},
								
								{
									"6c486c92-0701-cabf-8ecd-dda334f9c7f6",
									true,
								},
								
								{
									"0ace38bd-0cd1-5b65-a05f-2b039d897da1",
									true,
								},
								
								{
									"a5c2ee8a-9d54-b422-aef9-5b84840d4e0e",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "Rampart - self",
							uuid = "57b94428-e2f1-6555-a184-eee378707011",
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
							uuid = "88b461bb-6872-af3e-968e-5ab10252034f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "65b0b8d1-e254-95df-aeb3-d2d778c56142",
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
							uuid = "6c486c92-0701-cabf-8ecd-dda334f9c7f6",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "0ace38bd-0cd1-5b65-a05f-2b039d897da1",
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
							uuid = "a5c2ee8a-9d54-b422-aef9-5b84840d4e0e",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 494.058,
				name = "[WAR+DRK][OT] Rampart 08:11 - Great Wall of Fire",
				timeRange = true,
				timelineIndex = 133,
				timerEndOffset = -1.64,
				timerOffset = -0.476,
				timerStartOffset = -2.64,
				uuid = "04f94f53-889d-0297-8836-662931029628",
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
							actionID = 7537,
							conditions = 
							{
								
								{
									"b54bcab9-f707-f850-a4b8-7a9161c4867c",
									true,
								},
								
								{
									"31c7a3f4-0422-3657-b595-abdf726dd786",
									true,
								},
								
								{
									"84f5ba9b-dc77-d704-9926-945d561a7d2e",
									true,
								},
								
								{
									"ed64e211-ac08-e4d4-aa33-2d710b75435e",
									true,
								},
								
								{
									"b58a387f-c1de-6130-b1fa-d8efad7b42fc",
									true,
								},
								
								{
									"39707c3e-52cc-d580-aeed-fc95d169c850",
									true,
								},
							},
							endIfUsed = true,
							name = "Shirk - WAR",
							targetType = "Other Tank",
							uuid = "d9bf782e-eb12-3880-a212-68245ef92c2b",
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
							uuid = "b54bcab9-f707-f850-a4b8-7a9161c4867c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "31c7a3f4-0422-3657-b595-abdf726dd786",
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
							uuid = "84f5ba9b-dc77-d704-9926-945d561a7d2e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "ed64e211-ac08-e4d4-aa33-2d710b75435e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7537,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "b58a387f-c1de-6130-b1fa-d8efad7b42fc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 4,
							inRangeValue = 25,
							name = "Co-tank in range",
							partyTargetType = "Other Tank",
							uuid = "39707c3e-52cc-d580-aeed-fc95d169c850",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 494.058,
				name = "[WAR+DRK][OT] Shirk 08:26 - Great Wall of Fire",
				timeRange = true,
				timelineIndex = 133,
				timerEndOffset = 12.665,
				timerStartOffset = 11.665,
				uuid = "13b68973-ff6d-2706-ba8e-6c1e2cd595b4",
				version = 2,
			},
		},
	},
	[137] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "24ac6771-fb99-03bd-6f8a-aee747950481",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[144] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "9abf81de-9475-dcd9-9dfd-c38ec32f675c",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "ae3c1e87-4fe2-ed70-8595-935445a72a04",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "3b8cc260-0575-e3ee-b909-d2afb8d82d2e",
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
									"7557be36-7be0-ccc2-915f-5e13255234c3",
									true,
								},
								
								{
									"8050c5e5-95f3-cd97-9065-31edc85444d2",
									true,
								},
								
								{
									"632edecc-6d00-e0b9-8b41-2ef1e31f0796",
									true,
								},
								
								{
									"b2e5839e-211b-41a2-bd58-4034af8fc917",
									true,
								},
								
								{
									"a716ed50-0835-6405-ba74-ffb3a08127e1",
									true,
								},
							},
							endIfUsed = true,
							name = "Dark Missionary - self",
							uuid = "e921a8da-2fed-d1a4-878b-eb68750c18f4",
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
							uuid = "7557be36-7be0-ccc2-915f-5e13255234c3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "8050c5e5-95f3-cd97-9065-31edc85444d2",
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
							uuid = "632edecc-6d00-e0b9-8b41-2ef1e31f0796",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "b2e5839e-211b-41a2-bd58-4034af8fc917",
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
							uuid = "a716ed50-0835-6405-ba74-ffb3a08127e1",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 521.886,
				name = "[WAR+DRK][OT] Dark Missionary 08:39 - Crown of Arcadia",
				timeRange = true,
				timelineIndex = 144,
				timerEndOffset = -2.3,
				timerStartOffset = -3.3,
				uuid = "0c527882-9b23-17ec-b564-3f3ce03e1485",
				version = 2,
			},
		},
	},
	[145] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "86781306-0c77-3c3a-d57f-f02c0b67f356",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[146] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "d173d072-7b87-04ee-9692-c7c296082ef7",
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
									"66cacf82-6dd1-df2e-85dc-6c4f9f60bda4",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "740a5570-c7c9-e828-966c-a2eba6a2357f",
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
							uuid = "66cacf82-6dd1-df2e-85dc-6c4f9f60bda4",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 541.479,
				name = "[DRK R1][MT] Dark Missionary 08:59",
				timelineIndex = 146,
				timerOffset = -2.159,
				uuid = "7673a00b-d596-88a2-a6e5-f60a1cccbe28",
				version = 2,
			},
		},
	},
	[149] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "94c19373-14a7-ebd5-a69f-ae61e3fa3999",
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
									"145a1771-b52a-3b40-a8a6-062d3393db2b",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "fd601303-e696-2809-b2bb-bf8a6432dde4",
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
							uuid = "145a1771-b52a-3b40-a8a6-062d3393db2b",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 547.526,
				name = "[DRK R1][MT] Rampart 09:07",
				timelineIndex = 149,
				timerOffset = -0.001,
				uuid = "67ef2bed-9cde-22e5-adb4-3d1a7d9ee811",
				version = 2,
			},
		},
	},
	[151] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "2452e351-e01f-2ead-5bd1-70f720c53661",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[152] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "b3410adb-8022-4f3a-b2c3-46449105ba01",
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
									"31453669-e6e6-616c-be01-8469412c0262",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "954a4c9c-eff7-3c64-91d7-5fac45c3d26c",
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
							uuid = "31453669-e6e6-616c-be01-8469412c0262",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 552.355,
				name = "[DRK R1][MT] Dark Mind 09:11",
				timelineIndex = 152,
				timerOffset = -0.779,
				uuid = "b5e78323-b166-83e6-b57d-78d37ec08625",
				version = 2,
			},
		},
	},
	[153] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "fcd1648e-b28f-c49b-8c1c-c7a298a516be",
			},
			objectType = "folder",
		},
	},
	[154] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "4b06e53f-4b47-1055-bce8-0a9db670723b",
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
									"e0d01b48-23fe-a588-a8a0-03885602818a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "49b508fb-84b3-0a08-88d4-a961c58f9114",
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
							uuid = "e0d01b48-23fe-a588-a8a0-03885602818a",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 554.355,
				name = "[DRK R1][MT] Oblation 09:14",
				timelineIndex = 154,
				timerOffset = -0.111,
				uuid = "72e3d229-74c2-a4e2-8bf3-1297260207b7",
				version = 2,
			},
		},
	},
	[155] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "dd44c17b-0146-a7f2-b0e9-e0feec245e90",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "5a276d8d-35e3-dee5-8227-47a3d0940865",
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
									"b1d021a6-349d-0d2e-902b-0c4b62dd050a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "2ec80102-85ce-1954-9f58-00b31ecb4c48",
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
							uuid = "b1d021a6-349d-0d2e-902b-0c4b62dd050a",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 556.433,
				name = "[DRK R1][MT] The Blackest Night 09:16",
				timelineIndex = 155,
				timerOffset = 0.17,
				uuid = "2f857b9a-c7c3-bf4f-8662-930937583f9a",
				version = 2,
			},
		},
	},
	[156] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "f0f960b6-12b0-cf2a-e2af-91484c5d0106",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "e0a04399-0700-ee2c-a001-ceb712e7d57b",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "aabe940e-6d20-b81b-9fc5-0f06c42138d3",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "09134461-02f6-506f-ad01-f20a6eece221",
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
							actionID = 7393,
							conditions = 
							{
								
								{
									"712f445d-ccba-7331-aaf7-c83b3fa523ac",
									true,
								},
								
								{
									"c467124c-790c-986a-823c-56a1aa0cf895",
									true,
								},
								
								{
									"edf7d65e-d2b2-e008-8c44-3b1b86ae71ee",
									true,
								},
								
								{
									"9924ff6a-d5fa-5e19-83cc-67941df61873",
									true,
								},
								
								{
									"2f74ccce-671a-be07-942e-730f1562e4fe",
									true,
								},
								
								{
									"9a1a1362-0e1e-fad5-9544-1427b5fe0bdc",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "The Blackest Night - self",
							uuid = "a457bdc2-3c4f-6a5a-a11a-577869f353d9",
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
							uuid = "712f445d-ccba-7331-aaf7-c83b3fa523ac",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "c467124c-790c-986a-823c-56a1aa0cf895",
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
							uuid = "edf7d65e-d2b2-e008-8c44-3b1b86ae71ee",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "9924ff6a-d5fa-5e19-83cc-67941df61873",
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
							uuid = "2f74ccce-671a-be07-942e-730f1562e4fe",
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
							uuid = "9a1a1362-0e1e-fad5-9544-1427b5fe0bdc",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 557.386,
				name = "[WAR+DRK][OT] The Blackest Night 09:14 - Cosmic Kiss / Weighty Impact",
				timeRange = true,
				timelineIndex = 156,
				timerEndOffset = -1.905,
				timerOffset = -0.498,
				timerStartOffset = -2.905,
				uuid = "3af7ac61-457b-90f5-83db-ad52975b2e25",
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
									"6f987ce1-a17f-82bc-be1a-e7dd4ddc48e3",
									true,
								},
								
								{
									"597b6c4c-1275-57f8-a09d-422c4d519ffd",
									true,
								},
								
								{
									"902d6af2-1811-9543-8e40-bd6199ba7b95",
									true,
								},
								
								{
									"8b6d3fcc-2d9d-f131-bebe-3f5335067b50",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "Oblation - self",
							uuid = "794a0e7e-091a-5081-bfc2-fea8c05808bf",
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
							uuid = "6f987ce1-a17f-82bc-be1a-e7dd4ddc48e3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "597b6c4c-1275-57f8-a09d-422c4d519ffd",
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
							uuid = "902d6af2-1811-9543-8e40-bd6199ba7b95",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "8b6d3fcc-2d9d-f131-bebe-3f5335067b50",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 557.386,
				name = "[WAR+DRK][OT] Oblation 09:15 - Cosmic Kiss / Weighty Impact",
				timeRange = true,
				timelineIndex = 156,
				timerEndOffset = -1.236,
				timerOffset = -1.413,
				timerStartOffset = -2.236,
				uuid = "25169af6-b534-babe-beec-2f843249bfed",
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
									"9f7e7718-03f7-4d81-af10-a516fb3e2ac2",
									true,
								},
								
								{
									"08ab6309-c898-5254-a39c-981e50ab85bb",
									true,
								},
								
								{
									"449893f1-6cce-37a9-b5b9-41a7b70b6b56",
									true,
								},
								
								{
									"255955b2-2627-933c-8501-7a236b482f82",
									true,
								},
								
								{
									"7885dedd-212a-3280-b1e1-0dc0f31e0c20",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "Dark Mind - self",
							uuid = "30de0e22-55d1-4b83-840a-e3ada8d355b5",
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
							uuid = "9f7e7718-03f7-4d81-af10-a516fb3e2ac2",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "08ab6309-c898-5254-a39c-981e50ab85bb",
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
							uuid = "449893f1-6cce-37a9-b5b9-41a7b70b6b56",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "255955b2-2627-933c-8501-7a236b482f82",
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
							uuid = "7885dedd-212a-3280-b1e1-0dc0f31e0c20",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 557.386,
				name = "[WAR+DRK][OT] Dark Mind 09:16 - Cosmic Kiss / Weighty Impact",
				timeRange = true,
				timelineIndex = 156,
				timerEndOffset = -0.612,
				timerOffset = 4.241,
				timerStartOffset = -1.612,
				uuid = "2ca34778-6b6a-3adb-96ea-08e2a681cd49",
				version = 2,
			},
		},
	},
	[158] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "933700d4-54a6-7580-3a15-128213c26764",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[159] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "0ccb9329-b5cb-b205-e750-25af8d4c85f9",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "eb5af121-fca8-00ef-8e10-79b983eac261",
			},
			objectType = "folder",
		},
	},
	[160] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "6d0e23b5-66c0-c501-96b7-0f6fb0599c45",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "2a3c4137-c259-f7df-84a8-217ceccc360e",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "2036488d-8d50-9aa8-96c2-afa9e36d21e6",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "a7883b8c-a410-01e9-acfe-56fd65d2bc5d",
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
									"361d39d9-013a-8f7c-9e6f-74d971cfcb09",
									true,
								},
								
								{
									"eb1afce1-b938-2006-830b-2ce5701850ba",
									true,
								},
								
								{
									"e42b35ca-a6f1-efc4-8434-97ae29a2e967",
									true,
								},
								
								{
									"8ae4a396-b37c-f875-a869-1fa2b9660646",
									true,
								},
								
								{
									"3c0a5f91-b026-d938-81ff-3297eb046b19",
									true,
								},
								
								{
									"4eef12d1-562f-9134-8e72-137b44ac5448",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "Reprisal - self",
							uuid = "56eede2b-4b90-ea6a-a823-d607cfa4f97c",
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
							uuid = "361d39d9-013a-8f7c-9e6f-74d971cfcb09",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "eb1afce1-b938-2006-830b-2ce5701850ba",
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
							uuid = "e42b35ca-a6f1-efc4-8434-97ae29a2e967",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "8ae4a396-b37c-f875-a869-1fa2b9660646",
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
							uuid = "3c0a5f91-b026-d938-81ff-3297eb046b19",
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
							partyTargetName = "The Tyrant",
							partyTargetType = "Named Target",
							uuid = "4eef12d1-562f-9134-8e72-137b44ac5448",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 579.511,
				name = "[WAR+DRK][OT] Reprisal 09:36 - Crown of Arcadia",
				timeRange = true,
				timelineIndex = 160,
				timerEndOffset = -2.213,
				timerOffset = 1.073,
				timerStartOffset = -3.213,
				uuid = "590f5ade-05da-e80b-9469-3c5e9b9ca8e6",
				version = 2,
			},
		},
	},
	[161] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "6f1f277d-d40f-97ae-87f0-9de3648e4d01",
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
									"80bc3f5f-81cc-771e-b3ba-8c850d8395e1",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "MT - Living Dead",
							uuid = "4d0cd088-581c-0bee-a21e-af7f0f5eda3f",
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
							uuid = "80bc3f5f-81cc-771e-b3ba-8c850d8395e1",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 592.776,
				name = "[DRK R1][MT] Living Dead 09:52",
				timelineIndex = 161,
				timerOffset = -0.368,
				uuid = "5543d269-3c0b-fde8-9747-aee5c21e467c",
				version = 2,
			},
		},
	},
	[166] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "4cc105e7-62ff-c8a3-9dbe-b321cb49465d",
			},
			objectType = "folder",
		},
	},
	[167] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "86043e5e-54bc-849a-8b86-66413a50c896",
			},
			objectType = "folder",
		},
	},
	[168] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "adc9865f-b74c-d4f6-977e-071ab4f1dfff",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "d37aa721-5081-3415-be0d-aed4dd038212",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "289c4a14-cc1b-7297-92d5-de6a0477042a",
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
							actionID = 7393,
							conditions = 
							{
								
								{
									"c7e139fd-ca6e-48d7-b8d1-a5f5085cea5e",
									true,
								},
								
								{
									"0b37a880-85a5-6e48-bd1d-987769390294",
									true,
								},
								
								{
									"2d57b410-ce53-57af-898b-511baffe0ed1",
									true,
								},
								
								{
									"164b31f8-8cb1-834d-bcc5-b4e9a070925b",
									true,
								},
								
								{
									"728dccb1-10bf-b4e6-90e7-5f2d65ab5c99",
									true,
								},
								
								{
									"372bb2c7-5cf3-1b14-835b-b5490a3278fa",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "The Blackest Night - self",
							uuid = "eec29543-deb1-f964-b1f6-fbb9092cb55b",
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
							uuid = "c7e139fd-ca6e-48d7-b8d1-a5f5085cea5e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "0b37a880-85a5-6e48-bd1d-987769390294",
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
							uuid = "2d57b410-ce53-57af-898b-511baffe0ed1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "164b31f8-8cb1-834d-bcc5-b4e9a070925b",
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
							uuid = "728dccb1-10bf-b4e6-90e7-5f2d65ab5c99",
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
							uuid = "372bb2c7-5cf3-1b14-835b-b5490a3278fa",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 613.105,
				name = "[WAR+DRK][OT] The Blackest Night 10:09 - Heartbreak Kick",
				timeRange = true,
				timelineIndex = 168,
				timerEndOffset = -3.552,
				timerOffset = 0.283,
				timerStartOffset = -4.552,
				uuid = "48108f1f-8849-a3f9-a3bb-85bf61d4dedf",
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
									"9a7582e0-2823-4ef8-91cf-f0067c6086a1",
									true,
								},
								
								{
									"2480bc5b-a885-f7b6-94aa-8a8f8148af9a",
									true,
								},
								
								{
									"6ea1ed3a-0ded-2a83-a83d-5c46f5262321",
									true,
								},
								
								{
									"d443316a-5731-7793-933b-b4611f87ce23",
									true,
								},
								
								{
									"6491cbec-4307-73bc-b129-b6b7717fdea3",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "Shadowed Vigil - self",
							uuid = "a48b9726-929a-f429-9764-ee918ea88250",
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
							uuid = "9a7582e0-2823-4ef8-91cf-f0067c6086a1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "2480bc5b-a885-f7b6-94aa-8a8f8148af9a",
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
							uuid = "6ea1ed3a-0ded-2a83-a83d-5c46f5262321",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "d443316a-5731-7793-933b-b4611f87ce23",
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
							uuid = "6491cbec-4307-73bc-b129-b6b7717fdea3",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 613.105,
				name = "[WAR+DRK][OT] Shadowed Vigil 10:09 - Heartbreak Kick",
				timeRange = true,
				timelineIndex = 168,
				timerEndOffset = -2.884,
				timerOffset = 3.526,
				timerStartOffset = -3.884,
				uuid = "85462bd0-7db7-ee3c-b416-521b26e12445",
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
							actionID = 7531,
							conditions = 
							{
								
								{
									"e7a755c3-9f2f-aea2-acb6-f3a0d4877ba4",
									true,
								},
								
								{
									"a5c53d2c-fd45-a708-8f3b-018e2fbde81a",
									true,
								},
								
								{
									"fc0698db-da91-4720-9a3d-0f42277e91d9",
									true,
								},
								
								{
									"01d13b65-799c-e5c2-bfec-43bbfce9ab85",
									true,
								},
								
								{
									"aaeb22b0-e056-3987-9b41-4963a94aa880",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "Rampart - self",
							uuid = "00627cc1-8630-dd68-b6ef-ea3d48bbc9d4",
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
							uuid = "e7a755c3-9f2f-aea2-acb6-f3a0d4877ba4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "a5c53d2c-fd45-a708-8f3b-018e2fbde81a",
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
							uuid = "fc0698db-da91-4720-9a3d-0f42277e91d9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "01d13b65-799c-e5c2-bfec-43bbfce9ab85",
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
							uuid = "aaeb22b0-e056-3987-9b41-4963a94aa880",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 613.105,
				name = "[WAR+DRK][OT] Rampart 10:10 - Heartbreak Kick",
				timeRange = true,
				timelineIndex = 168,
				timerEndOffset = -1.64,
				timerOffset = 0.535,
				timerStartOffset = -2.64,
				uuid = "d178cd3a-aca1-5443-911d-f7cbd6594c90",
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
							actionID = 3638,
							conditions = 
							{
								
								{
									"d42ec6fd-b73f-35dd-8952-be065e51ed68",
									true,
								},
								
								{
									"3039acaa-ff0f-8df9-aca9-11b6db5628d6",
									true,
								},
								
								{
									"80d3e467-d324-7cf5-a837-94de6d6c04b6",
									true,
								},
								
								{
									"3564e3ce-7cee-9329-802b-a0dc1fc84abb",
									true,
								},
								
								{
									"3fa34e7b-0a9e-dd7a-8a1c-c2c424587dce",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "Living Dead - self",
							uuid = "b59b1cda-d79b-f3a3-b7f0-647530126949",
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
							uuid = "d42ec6fd-b73f-35dd-8952-be065e51ed68",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "3039acaa-ff0f-8df9-aca9-11b6db5628d6",
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
							uuid = "80d3e467-d324-7cf5-a837-94de6d6c04b6",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "3564e3ce-7cee-9329-802b-a0dc1fc84abb",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 3638,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "3fa34e7b-0a9e-dd7a-8a1c-c2c424587dce",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 613.105,
				name = "[WAR+DRK][OT] Living Dead 10:13 - Heartbreak 2 - after first hit",
				timeRange = true,
				timelineIndex = 168,
				timerEndOffset = 0.9,
				timerOffset = 0.866,
				timerStartOffset = 0.15,
				uuid = "7b7f3104-6b74-a75c-ac18-27eea46d9e96",
				version = 2,
			},
		},
	},
	[170] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "27765df1-0f1d-0ed0-943f-1accef8534ef",
			},
			objectType = "folder",
		},
	},
	[173] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "e760046a-685e-69d3-b7b0-154c08bf3ecb",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "a557ac6e-e46f-c227-82c1-b407717f655c",
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
									"2863da27-9dcc-632f-ae2a-e71975fca131",
									true,
								},
								
								{
									"8b5c9acf-e1a2-bafd-a16d-ddcafa441a12",
									true,
								},
								
								{
									"86c376c0-3067-5f76-ad73-20177ef12435",
									true,
								},
								
								{
									"60459226-38ec-b812-9eda-f1b9a669a4c0",
									true,
								},
								
								{
									"1a8445a2-a780-2773-a491-cfde89b1c6a4",
									true,
								},
							},
							endIfUsed = true,
							name = "Dark Missionary - self",
							uuid = "f05d5f2d-41d7-9d7d-b3cf-88ebddce2b0b",
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
							uuid = "2863da27-9dcc-632f-ae2a-e71975fca131",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "8b5c9acf-e1a2-bafd-a16d-ddcafa441a12",
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
							uuid = "86c376c0-3067-5f76-ad73-20177ef12435",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "60459226-38ec-b812-9eda-f1b9a669a4c0",
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
							uuid = "1a8445a2-a780-2773-a491-cfde89b1c6a4",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 623.151,
				name = "[WAR+DRK][OT] Dark Missionary 10:27 - Heartbreak Kick",
				timeRange = true,
				timelineIndex = 173,
				timerEndOffset = 4.953,
				timerStartOffset = 3.953,
				uuid = "4cca87ee-1b69-689d-b54d-309293041266",
				version = 2,
			},
		},
	},
	[174] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "806e79ce-4685-29e2-f04f-3c7076b2675e",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "53862f4c-f1cf-058a-9243-26d1a2f70da6",
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
									"86c69277-70a7-d015-a11d-a7a6ab7cb00d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "97956a13-aed4-cfed-9c4d-da596fd547d0",
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
							uuid = "86c69277-70a7-d015-a11d-a7a6ab7cb00d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 633.026,
				name = "[DRK R1][MT] Dark Missionary 10:32",
				timelineIndex = 174,
				timerOffset = -0.574,
				uuid = "25628294-3cde-8f7e-af5d-88f8f652ba62",
				version = 2,
			},
		},
	},
	[175] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "cee1e9da-3bed-9e07-813a-865662be8e3b",
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
									"f8cae72f-2e3c-3365-b139-87f7bec24c24",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "33b072a4-e833-1753-be97-2fdfcf3dd37a",
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
							uuid = "f8cae72f-2e3c-3365-b139-87f7bec24c24",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 634.245,
				name = "[DRK R1][MT] Reprisal 10:34",
				timelineIndex = 175,
				timerOffset = 0.526,
				uuid = "459b1114-9907-2cc2-8be2-1d644baa41ac",
				version = 2,
			},
		},
	},
	[177] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "58c75e62-1059-b9f6-8c4b-09dc5cccb78e",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "8965e369-9f14-f793-9141-07e2e5f3445a",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "e81fdf4e-1237-ebfa-ae1f-fba536305678",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Optional fallback",
				uuid = "7c8ec852-2b60-ae2f-af2f-c5194717b7a8",
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
									"7ae2e4d4-99a4-527d-90a2-52759a608058",
									true,
								},
								
								{
									"33b8ae7b-3cbd-e353-8ed5-f9ac93392797",
									true,
								},
								
								{
									"e58ae932-70bc-1563-990c-4b0f5ee4aef9",
									true,
								},
								
								{
									"bf430ab8-aa9a-16ed-9a12-91371479ab34",
									true,
								},
								
								{
									"aa23690f-b530-e817-87c5-e731515cb56b",
									true,
								},
								
								{
									"02af42ad-89bf-48f9-8808-2eb4eacd77e0",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "Reprisal - self",
							uuid = "5604126c-9551-d0cd-86d5-1a4e41652e4d",
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
							uuid = "7ae2e4d4-99a4-527d-90a2-52759a608058",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "33b8ae7b-3cbd-e353-8ed5-f9ac93392797",
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
							uuid = "e58ae932-70bc-1563-990c-4b0f5ee4aef9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "bf430ab8-aa9a-16ed-9a12-91371479ab34",
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
							uuid = "aa23690f-b530-e817-87c5-e731515cb56b",
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
							partyTargetName = "The Tyrant",
							partyTargetType = "Named Target",
							uuid = "02af42ad-89bf-48f9-8808-2eb4eacd77e0",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Optional fallback",
				enabled = false,
				mechanicTime = 638.261,
				name = "[WAR+DRK][OT] Reprisal 10:38 - ONLY if WAR late Reprisal omitted",
				timeRange = true,
				timelineIndex = 177,
				timerEndOffset = 0.5,
				timerOffset = -0.722,
				timerStartOffset = -0.5,
				uuid = "871312b7-f66f-8ac3-9ea0-0ab06f03160a",
				version = 2,
			},
		},
	},
	[181] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "efa40566-cec1-0f5a-ad05-1864ff1b38b6",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[182] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "38de495d-d086-2441-955c-81ffe5c53fed",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	inheritedProfiles = 
	{
		"store\\anyone\\savage6\\m11s\\main",
	},
	timelineName = "r11s",
	version = "1.5.0",
}



return tbl