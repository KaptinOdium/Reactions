local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "4d122d4c-abb7-9708-3288-b636611213dc",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[MT] Reprisal",
				uuid = "03dd0eb0-d85f-5073-92cc-f418244ae5fe",
				version = 2,
			},
			inheritedObjectUUID = "c4b237eb-ffcd-87a2-8633-8de178059c5b",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "5b724e2c-338a-3fb8-a5db-d04a39d6557c",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumMT",
							targetType = "Other Tank",
							uuid = "8c2cf948-496f-104d-9796-b079d069a9d1",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 15.261765625,
				name = "[GNB] HoC MT",
				timelineIndex = 1,
				timerOffset = -2,
				uuid = "0435f0a7-e8ba-3c93-9f16-d0e9980ff79e",
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
							gVar = "ACR_RikuGNB3_Tankbar_Aurora",
							targetType = "Main Tank",
							uuid = "c9ac1ac9-2284-daa9-a9c6-2c1a84d6f414",
							variableIsHover = true,
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 15.261765625,
				name = "[GNB] Aurora MT",
				timelineIndex = 1,
				timerOffset = -5,
				uuid = "a4de6871-5796-d234-aee2-f98bf0814135",
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
									"f76ed731-0290-615c-9cbc-13eee790d723",
									true,
								},
								
								{
									"87c858d6-7452-64ba-b589-0c120fc68745",
									true,
								},
								
								{
									"82c7c37b-1e8c-cdeb-9095-0fef4d8470cd",
									true,
								},
								
								{
									"6f881da6-1aab-9f43-93b1-5f090abc9180",
									false,
								},
							},
							gVar = "ACR_RikuGNB3_Hotbar_RoyalGuard",
							uuid = "7e0459ec-b576-54ee-83a2-96a38d738b4b",
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
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 7131,
							name = "Kefka event",
							uuid = "f76ed731-0290-615c-9cbc-13eee790d723",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgType = 2,
							eventSpellID = 50179,
							name = "First Ruin cast",
							uuid = "87c858d6-7452-64ba-b589-0c120fc68745",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 10,
							inGroupTargetType = "Other Tank",
							name = "Buster targets co-tank",
							partyTargetType = "Event Target",
							uuid = "82c7c37b-1e8c-cdeb-9095-0fef4d8470cd",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffID = 1833,
							category = "Self",
							name = "Royal Guard active",
							uuid = "6f881da6-1aab-9f43-93b1-5f090abc9180",
							version = 3,
						},
					},
				},
				eventType = 3,
				mechanicTime = 15.261765625,
				name = "[OT] P1 Stance ON - Ruin on MT",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 4,
				timerStartOffset = -8,
				uuid = "585846dc-2187-ac01-a830-29ff358a98b6",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1fa90599-6fd4-0035-52a0-3e07878bca29",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
							gVar = "ACR_RikuWAR3_Hotbar_ProvokeMouse",
							targetType = "Current Target",
							uuid = "c7f61134-033d-a32b-b3de-ef1b24a57d39",
							variableIsHover = true,
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 18.37640625,
				name = "[Tank] Provoke",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 1,
				timerStartOffset = -3.5,
				uuid = "86b11bcc-b8ca-9b23-8f06-98efb68c16d6",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "87ab5296-1573-e3a2-71bb-2bec92576766",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "08895d6a-71b5-2746-bc20-830cb91abd7a",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "ba2373fb-c4b3-1a4f-5e6f-122d4580be8b",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b86870e0-5bfb-b394-19da-bafa22ab3970",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "f85e1e8d-bff9-0861-b95e-ca9b133a279d",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "7c8f6efb-c3f9-efbf-1fa6-0455e76ec10b",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "8e15165a-c6b9-dc3e-d1c3-8880034499ea",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[GNB-DRK] Party Mit",
				uuid = "a81e7a1f-c48c-5cde-a04d-f84ad33d2b10",
				version = 2,
			},
			inheritedObjectUUID = "69b95542-85ca-60ce-84cc-24b1892015ab",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "270dc2df-199b-63ab-a25f-ded1abd9ef2f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[OT] Reprisal",
				uuid = "708a0195-2b72-d58d-8229-a9ceccd3e3ee",
				version = 2,
			},
			inheritedObjectUUID = "f40833bd-2869-af7e-b01a-86031caa0e46",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfLight",
							uuid = "f3ff193d-e2f9-a3de-afb0-9ac0d327b495",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 45.866090329028,
				name = "[GNB] HoL - P1 Fire to Trap",
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = -8.866090329028,
				timerOffset = -3,
				timerStartOffset = -11.366090329028,
				uuid = "0a28fd4d-1672-26fa-a84a-b24859263d5d",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "60cf6e1c-53bd-a100-e625-dceaba6134ec",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "f23da737-3b58-e31b-f61b-6a9d9b464707",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "f855fea6-9bd4-d37a-058c-7c707b2ebf36",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[MT] Reprisal",
				uuid = "e82a3b79-4b4f-f7a6-bf91-2760c1634cc0",
				version = 2,
			},
			inheritedObjectUUID = "b6bd4362-846d-b28e-a00f-23b2fc8cfa6d",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
		
		{
			data = 
			{
				name = "[GNB-DRK] [OT] Party Mit",
				uuid = "6ccc1941-3cf5-7820-a22a-a9f5905de566",
				version = 2,
			},
			inheritedObjectUUID = "de4ad230-0803-9791-b0c3-2af76f79ed3e",
			inheritedOverwrites = 
			{
				enabled = false,
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
									"0fd44cc1-da03-5b4b-92fc-00d9326c9bf1",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Reprisal",
							uuid = "f86170e0-c59a-b0d0-bd4a-74ca85f4c098",
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
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuGNB3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Real melee range",
							uuid = "0fd44cc1-da03-5b4b-92fc-00d9326c9bf1",
							version = 3,
						},
					},
				},
				mechanicTime = 62.553324919213,
				name = "[OT] Reprisal",
				timeRange = true,
				timelineIndex = 12,
				timerEndOffset = -6,
				timerOffset = -3,
				timerStartOffset = -8,
				uuid = "10676229-19fa-fe7a-8e17-22a98037c30b",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuGNB3_Tankbar_Rampart",
							uuid = "787c35ba-2967-8c72-b737-eea2ecefc00f",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 65.714816982705,
				name = "[Tank] Rampart",
				timelineIndex = 13,
				timerOffset = -15,
				uuid = "75bf5d23-315a-e6df-b003-6f8ad0c84efb",
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
							gVar = "ACR_RikuGNB3_Tankbar_Nebula",
							uuid = "b2dfcd1f-e11e-d41c-ac1e-2f612075baeb",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 65.714816982705,
				name = "[GNB] Nebula",
				timelineIndex = 13,
				timerOffset = -7,
				uuid = "614ff1d5-ab78-7236-a07a-440e8d06e600",
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
							gVar = "ACR_RikuGNB3_Tankbar_Camouflage",
							uuid = "9fcdc74c-7d15-b515-9f95-3a2ae83a426a",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 65.714816982705,
				name = "[GNB] Camouflage",
				timelineIndex = 13,
				timerOffset = -10,
				uuid = "e6026cb9-af59-695b-9e34-9c06df2b1d76",
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
							gVar = "ACR_RikuGNB3_Tankbar_AuroraSelf",
							uuid = "d736f5a3-3c33-acd8-a034-98c5dd539a22",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 65.714816982705,
				name = "[GNB] Aurora Self - Hyperdrive 1",
				timeRange = true,
				timelineIndex = 13,
				timerEndOffset = -5,
				timerOffset = -4,
				timerStartOffset = -8,
				uuid = "fc2831c5-93f4-bd5e-8e30-8124aacf168b",
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
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumSelf",
							uuid = "6073b707-1717-0fe2-a1bb-724f818d7925",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 65.714816982705,
				name = "[GNB] HoC Self - Hyperdrive 1",
				timeRange = true,
				timelineIndex = 13,
				timerEndOffset = -2,
				timerOffset = -3,
				timerStartOffset = -4,
				uuid = "025be254-4968-2d2a-8cfc-5008b656f4c7",
				version = 2,
			},
			inheritedIndex = 5,
		},
	}, 
	[15] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "54a454cb-d49a-5687-6a6d-0d290204d39b",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[16] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "87e4682a-b482-ceb6-43f3-56dc6280c3fa",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "e5c78bce-e242-49ca-b5ad-3e7ceb7569de",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[17] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b10ab9dd-41c0-35b9-55b4-5af7a7151b2d",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "c62da14b-5296-6777-882c-a07125424adb",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[18] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "2b66f834-5e06-d178-3ebc-aa02eff0c984",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[19] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "85b7f26f-29ae-0253-3d32-8a95de8b64ff",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
							gVar = "ACR_RikuGNB3_Tankbar_Superbolide",
							uuid = "d6e437c3-4253-aa36-b5b8-356851074689",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 97.181065398234,
				name = "[GNB] Superbolide",
				timeRange = true,
				timelineIndex = 19,
				timerEndOffset = -0.5,
				timerOffset = -5,
				timerStartOffset = -4,
				uuid = "9a1921b1-0a66-d81d-b047-45be2a73a632",
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
							gVar = "ACR_RikuGNB3_Hotbar_ShirkOT",
							uuid = "d738823d-9571-7710-810c-18c49a480468",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 97.181065398234,
				name = "[OT] Shirk MT",
				timeRange = true,
				timelineIndex = 19,
				timerEndOffset = 2,
				timerStartOffset = -0.5,
				uuid = "bd4de36e-4a95-90af-9c5d-ea06ea7f1dfa",
				version = 2,
			},
		},
	},
	[20] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "bfdd0edf-2fa6-8d03-2b62-b71904e07def",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "c7ea14b9-c828-373d-0043-b097d636e549",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[22] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "77124cb1-7464-6fd5-53e5-87e7bbfc4601",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "baa3660f-ed3f-c003-1b9c-37a1e6da061f",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[23] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1ff2808e-9c36-4f42-58cb-decc66ab8c5e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "1b6df7c2-ba10-3826-cd7e-f2ac5d261a12",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[25] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "05f955d8-e3e3-9334-99ce-c7da478dada8",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[OT] Reprisal",
				uuid = "132f8019-05d1-ae57-895c-976b2472b68c",
				version = 2,
			},
			inheritedObjectUUID = "8210269e-ae8a-ca89-af9d-8f6a58793773",
			inheritedOverwrites = 
			{
				enabled = false,
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
									"61b1a45c-771d-6700-9b6b-11118d397923",
									true,
								},
								
								{
									"608c7ea6-336a-0baf-837a-85d89273b4e0",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Reprisal",
							ignoreWeaveRules = true,
							uuid = "5f3e69e0-3313-076d-b359-984dc96e9352",
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
							actionID = 7535,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Reprisal ready",
							uuid = "61b1a45c-771d-6700-9b6b-11118d397923",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							comparator = 2,
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuGNB3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							conditionType = 6,
							inRangeValue = 5,
							name = "Real melee range",
							uuid = "608c7ea6-336a-0baf-837a-85d89273b4e0",
							version = 3,
						},
					},
				},
				eventType = 12,
				mechanicTime = 118.07975730716,
				name = "[OT] Reprisal - Trap + Light of Judgment",
				timeRange = true,
				timelineIndex = 25,
				timerEndOffset = 11.67024269284,
				timerOffset = -2,
				timerStartOffset = -1.37975730716,
				uuid = "b57b6a3c-7306-82e5-b24f-1f2f7797ac46",
				version = 2,
			},
		},
	},
	[26] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "54f636c5-f550-5581-c5dd-257b3b106055",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfLight",
							uuid = "ee1a42b6-7b02-eceb-a7d8-ee7585c7dca0",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 132.26514619605,
				name = "[OT] HoL - Light of Judgment 2",
				timeRange = true,
				timelineIndex = 26,
				timerEndOffset = -2.5,
				timerOffset = -4,
				timerStartOffset = -6,
				uuid = "4eda37bf-18bb-7a95-a576-7335e4ecdf6b",
				version = 2,
			},
		},
	},
	[27] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumMT",
							uuid = "d717f7c9-2b65-fce5-85d6-bc0b5b2d2c03",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 135.43014619605,
				name = "[OT] HoC MT - Hyperdrive 2",
				timeRange = true,
				timelineIndex = 27,
				timerEndOffset = -1.5,
				timerStartOffset = -4,
				uuid = "17452c4d-05c7-3993-ba48-b6be2126638d",
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
							gVar = "ACR_RikuGNB3_Tankbar_Aurora",
							targetType = "Main Tank",
							uuid = "1bc66fca-aae4-3278-89b8-f1be8f67aee1",
							variableIsHover = true,
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 135.43014619605,
				name = "[OT] Aurora MT - Hyperdrive 2",
				timeRange = true,
				timelineIndex = 27,
				timerEndOffset = -4.93014619605,
				timerStartOffset = -7.43014619605,
				uuid = "8055d41e-ff9c-00ab-a05f-5ba0c76a7f32",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "e5e1794c-669f-f2b0-92dc-e60edff7f99c",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[MT] Reprisal",
				uuid = "36b70dd1-ad49-d167-8688-ad06b7e7cdbe",
				version = 2,
			},
			inheritedObjectUUID = "abf38363-a308-5e83-b6af-946b5d642c18",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
	},
	[30] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e62116ca-da23-d64e-7e4c-533ca7f35e9a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[32] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "815d1560-8609-c7a4-74fb-b29a455285b0",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[33] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b3d3c46b-994b-e69f-5a1b-2e09519db83b",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "f92def25-7a36-c879-b152-3f07a36f58b5",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[34] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "7c9af9c6-225c-f7b2-8a49-6dd01e6974d6",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "7181721a-ced6-b516-84d7-55e0bdccb3aa",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[35] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e730c889-fc14-fd85-26be-29eb23a263d9",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[36] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "0b61edbc-315f-7298-590b-7c4a12f8e28c",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[37] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "84977257-c578-1ff3-17b7-d7fdedcc80a7",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[OT] Reprisal",
				uuid = "d4a39718-9f83-3b13-a8c0-939692283b7b",
				version = 2,
			},
			inheritedObjectUUID = "8c05ba19-4c50-3796-af2b-65db60c6ce7c",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
		
		{
			data = 
			{
				name = "[GNB-DRK] [MT] Party Mit",
				uuid = "ad98d8bb-24f4-730d-9c02-a5f53e13a313",
				version = 2,
			},
			inheritedObjectUUID = "b82435b7-ec39-fbcc-81ec-7a695b809f8b",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
	},
	[38] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "d3658b62-57bd-8456-bc6f-85d4e908e832",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
									"394175ff-f781-f77d-b9c2-53c4e55ec69b",
									true,
								},
								
								{
									"6d67ae53-687d-b8eb-af19-e686fc456ef1",
									true,
								},
								
								{
									"7e034121-08f0-f40d-a992-81228169a26a",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Hotbar_ReleaseRoyalGuard",
							uuid = "9b126004-841a-c83f-9694-298afea38020",
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
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 7131,
							name = "Kefka event",
							uuid = "394175ff-f781-f77d-b9c2-53c4e55ec69b",
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
							name = "Became untargetable",
							uuid = "6d67ae53-687d-b8eb-af19-e686fc456ef1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffID = 1833,
							category = "Self",
							name = "Royal Guard active",
							uuid = "7e034121-08f0-f40d-a992-81228169a26a",
							version = 3,
						},
					},
				},
				eventType = 26,
				mechanicTime = 197.52218784626,
				name = "[OT] P2 Stance OFF - Kefka transition",
				timeRange = true,
				timelineIndex = 38,
				timerEndOffset = 8,
				timerStartOffset = -2,
				uuid = "58ad8c12-c8be-ea4b-b5de-ab867ab4eeaf",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "e6fc9cf5-5cf6-7359-e3cb-118fc2c0ee05",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[40] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "23509a65-54cc-3b91-8381-32eb66252875",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
									"be7120a9-4e06-e4f2-be5c-2c3f07755475",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumSelf",
							uuid = "6073b707-1717-0fe2-a1bb-724f818d7925",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"0c1cebbc-5f4a-8f49-8d60-1e25fcd6164f",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumMT",
							uuid = "dc979ae1-64d6-dc99-be19-1f18024bec91",
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
							buffCheckType = 2,
							buffID = 409,
							category = "Party",
							conditionType = 8,
							jobIDList = 
							{
								21,
							},
							name = "MT is WAR",
							partyTargetType = "Main Tank",
							uuid = "0c1cebbc-5f4a-8f49-8d60-1e25fcd6164f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 8,
							jobIDList = 
							{
								19,
								32,
								37,
							},
							name = "MT is non-WAR tank",
							partyTargetType = "Main Tank",
							uuid = "be7120a9-4e06-e4f2-be5c-2c3f07755475",
							version = 3,
						},
					},
				},
				mechanicTime = 220.14545421679,
				name = "[OT] HoC - WAR MT or Self",
				timeRange = true,
				timelineIndex = 40,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -3,
				uuid = "195f63b4-7a04-fa77-af86-a2ec2fa454c2",
				version = 2,
			},
			inheritedIndex = 5,
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
									"6b1c9d79-f37e-5cc6-84cf-0b249c551c3b",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Rampart",
							uuid = "787c35ba-2967-8c72-b737-eea2ecefc00f",
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
							buffCheckType = 2,
							buffID = 409,
							category = "Party",
							conditionType = 8,
							jobIDList = 
							{
								19,
								32,
								37,
							},
							name = "MT is non-WAR tank",
							partyTargetType = "Main Tank",
							uuid = "6b1c9d79-f37e-5cc6-84cf-0b249c551c3b",
							version = 3,
						},
					},
				},
				mechanicTime = 220.14545421679,
				name = "[OT] Rampart - Non-WAR MT",
				timeRange = true,
				timelineIndex = 40,
				timerEndOffset = -8,
				timerOffset = -15,
				timerStartOffset = -11,
				uuid = "25c762ba-3ae5-e5ef-ac72-77a79d90b04b",
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
									"1f74e4ec-8d86-2937-baa5-cf8d9b6b0c89",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Nebula",
							uuid = "b2dfcd1f-e11e-d41c-ac1e-2f612075baeb",
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
							buffCheckType = 2,
							buffID = 409,
							category = "Party",
							conditionType = 8,
							jobIDList = 
							{
								19,
								32,
								37,
							},
							name = "MT is non-WAR tank",
							partyTargetType = "Main Tank",
							uuid = "1f74e4ec-8d86-2937-baa5-cf8d9b6b0c89",
							version = 3,
						},
					},
				},
				mechanicTime = 220.14545421679,
				name = "[GNB] Nebula",
				timelineIndex = 40,
				timerOffset = -7,
				uuid = "eaddb06a-e700-17d8-b26d-91e7c4164cf8",
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
									"1aa3dd39-c4fb-91e1-9f74-615bde04b1b7",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Camouflage",
							uuid = "9fcdc74c-7d15-b515-9f95-3a2ae83a426a",
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
							buffCheckType = 2,
							buffID = 409,
							category = "Party",
							conditionType = 8,
							jobIDList = 
							{
								19,
								32,
								37,
							},
							name = "MT is non-WAR tank",
							partyTargetType = "Main Tank",
							uuid = "1aa3dd39-c4fb-91e1-9f74-615bde04b1b7",
							version = 3,
						},
					},
				},
				mechanicTime = 220.14545421679,
				name = "[GNB] Camouflage",
				timelineIndex = 40,
				timerOffset = -10,
				uuid = "2c196ec2-fcde-d4bf-afdf-e8cd85e74898",
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
									"088b4bb0-5231-beb2-bba1-ce1aeab90115",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_AuroraSelf",
							uuid = "d736f5a3-3c33-acd8-a034-98c5dd539a22",
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
							buffCheckType = 2,
							buffID = 409,
							category = "Party",
							conditionType = 8,
							jobIDList = 
							{
								19,
								32,
								37,
							},
							name = "MT is non-WAR tank",
							partyTargetType = "Main Tank",
							uuid = "088b4bb0-5231-beb2-bba1-ce1aeab90115",
							version = 3,
						},
					},
				},
				mechanicTime = 220.14545421679,
				name = "[GNB] Aurora Self",
				timelineIndex = 40,
				timerOffset = -4,
				uuid = "99d4daec-362f-64f0-b5b5-dbb2d9c1effd",
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
									"5bd5eecf-6432-c44a-82d4-a60964075539",
									true,
								},
								
								{
									"737d26aa-6e03-ead0-bf9e-27254f5146b5",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Reprisal",
							uuid = "5f3e69e0-3313-076d-b359-984dc96e9352",
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
							actionID = 7535,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Reprisal ready",
							uuid = "5bd5eecf-6432-c44a-82d4-a60964075539",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuGNB3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Real melee range",
							uuid = "737d26aa-6e03-ead0-bf9e-27254f5146b5",
							version = 3,
						},
					},
				},
				mechanicTime = 220.14545421679,
				name = "[OT] Reprisal - UE",
				timeRange = true,
				timelineIndex = 40,
				timerEndOffset = -10.14545421679,
				timerOffset = -2,
				timerStartOffset = -12.14545421679,
				uuid = "36f848cb-461e-6d68-a970-857d0922546d",
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
									"5cea4884-07d0-f6fe-b5ce-32ecd527fc79",
									true,
								},
								
								{
									"d6350788-50a9-e4ff-ae19-124892929584",
									true,
								},
								
								{
									"6e08b371-288d-e322-809a-619632abe750",
									true,
								},
								
								{
									"76f114cb-8c16-51fb-8ea8-5f1f12ae1668",
									false,
								},
							},
							gVar = "ACR_RikuGNB3_Hotbar_RoyalGuard",
							uuid = "014abbfa-386a-d4ef-8efa-e28f7d67dac7",
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
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 7131,
							name = "Kefka event",
							uuid = "5cea4884-07d0-f6fe-b5ce-32ecd527fc79",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgType = 2,
							eventSpellID = 49740,
							name = "Ultimate Embrace cast",
							uuid = "d6350788-50a9-e4ff-ae19-124892929584",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 10,
							inGroupTargetType = "Other Tank",
							name = "Buster targets co-tank",
							partyTargetType = "Event Target",
							uuid = "6e08b371-288d-e322-809a-619632abe750",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffID = 1833,
							category = "Self",
							name = "Royal Guard active",
							uuid = "76f114cb-8c16-51fb-8ea8-5f1f12ae1668",
							version = 3,
						},
					},
				},
				eventType = 3,
				mechanicTime = 220.14545421679,
				name = "[OT] P2 Stance ON - Embrace on MT",
				timeRange = true,
				timelineIndex = 40,
				timerEndOffset = 8,
				timerStartOffset = -8,
				uuid = "d08113a3-c418-225f-907b-2d9ccac9100a",
				version = 2,
			},
		},
	},
	[41] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "d35b0112-2378-966e-e70c-76d0528e16e2",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[MT] Reprisal",
				uuid = "168898c4-3276-154a-9e7b-3d22fda053e1",
				version = 2,
			},
			inheritedObjectUUID = "72979fc0-ed8b-abf8-af0e-b12b8895f599",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
		
		{
			data = 
			{
				name = "[OT] Party Mit",
				uuid = "f58b7d8a-dfaa-5e38-95fe-fda30d51519d",
				version = 2,
			},
			inheritedObjectUUID = "1f3c4c5b-d64a-30f6-b1bb-322313471d5d",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "3083d736-d9d2-1ae2-11f1-d0e00acccd86",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfLight",
							uuid = "3fe21005-4ad5-88c3-9f68-a95b6b7e5c50",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 235.34477128997,
				name = "[GNB] HoL",
				timeRange = true,
				timelineIndex = 41,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -4,
				uuid = "12c02460-71d4-e759-85fa-974c3bb63476",
				version = 2,
			},
		},
	},
	[42] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b48f08d3-47c2-1fbf-747a-e0fd7666e5a3",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[43] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e8e7d7f8-5905-1544-b5ce-854ad929e448",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[44] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "a25fef6f-b01a-2253-6959-a79199fc4dff",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[45] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "2a4942ae-8a08-42d2-db0f-5c3c2d88637e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[47] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b425df84-8a3e-36b8-4c48-6846c8adabd4",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[48] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "5a1dccdb-e41c-cdb7-04ee-da9d69663cab",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[49] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "26b5d9fa-61b4-b3f6-29ae-c7486549a24a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[50] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "04416dd8-dec5-6174-a3b0-8d8a9d675128",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[51] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "bcb5ca43-e171-846f-d952-79799085ee13",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[53] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "ca482515-988d-4c81-11c6-3147904405a5",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "f470dc43-5642-899f-7bad-9f4140b19ed3",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
									"230a9e37-ee81-1747-9e61-c532824c848a",
									true,
								},
								
								{
									"c62b801d-2a79-f3cf-986e-5df7d228c9df",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Reprisal",
							uuid = "5f3e69e0-3313-076d-b359-984dc96e9352",
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
							actionID = 7535,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Reprisal ready",
							uuid = "230a9e37-ee81-1747-9e61-c532824c848a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuGNB3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Real melee range",
							uuid = "c62b801d-2a79-f3cf-986e-5df7d228c9df",
							version = 3,
						},
					},
				},
				mechanicTime = 280.23863811015,
				name = "[OT] Reprisal - Tower 4",
				timeRange = true,
				timelineIndex = 53,
				timerEndOffset = -7.23863811015,
				timerOffset = -2,
				timerStartOffset = -11.23863811015,
				uuid = "5517ea5a-a0d2-fac7-b146-c4efcac6b4b0",
				version = 2,
			},
		},
	},
	[55] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1bd0ccaf-d2e3-8403-5e1e-eb6d6b31193f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[OT] Reprisal",
				uuid = "2d9193f8-e683-706f-a249-cea843c9a241",
				version = 2,
			},
			inheritedObjectUUID = "1db10399-9ffb-10bc-8d5d-48dc8fbf632c",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
		
		{
			data = 
			{
				name = "[MT] Party Mit",
				uuid = "9404ec9f-9e62-791e-846c-c15739985084",
				version = 2,
			},
			inheritedObjectUUID = "0d006f6e-a843-39cd-bcfd-77751cbf9d86",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
	},
	[56] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "7dc608d2-2cf5-bd26-467a-1d906a699762",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[58] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "92a216f0-bc89-001c-976c-72ee343454c0",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[59] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b5779c0b-4df7-3937-c8c0-1811f6faccdb",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "a4a14605-7959-39b1-cc66-9aaf6461ef95",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[60] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b1675dcb-57e8-eef7-f9e0-69855ec7dc9b",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[61] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "0ae660b0-4627-eadc-2028-63b2772c9a80",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[62] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "0dcdc2dd-6ca1-a129-c343-8bf303d8242d",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[MT] Reprisal",
				uuid = "a2adf95a-a277-09d6-a2ab-9a79c69c9181",
				version = 2,
			},
			inheritedObjectUUID = "1ec334ae-518a-6a07-81a8-3af1c3fd116c",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "53481c4b-27d2-9ce7-fa51-69adb25cc5db",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[63] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e4a7712a-776d-3e66-2f2a-de98bf43ccfa",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[64] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "79543eb1-6c48-c285-9814-13cfc419d801",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[65] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "bd92771c-07c1-1070-d7ef-424e17243dec",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[66] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "08150e69-f84f-fe9d-9717-529f652f2f39",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[OT] Reprisal",
				uuid = "b1207369-1d6d-6a76-8204-6e9dc6e15ed4",
				version = 2,
			},
			inheritedObjectUUID = "accad162-de67-a72c-9d82-2edd5262ac54",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
		
		{
			data = 
			{
				name = "[OT] Party Mit",
				uuid = "01db39d4-aa8f-ff8c-9862-0a035f1b38c8",
				version = 2,
			},
			inheritedObjectUUID = "7f57181f-2b00-7ab0-bc4f-36bed387c26b",
			inheritedOverwrites = 
			{
				enabled = false,
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
									"7140ddac-1509-d7dc-8541-e1cf984be5e6",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Reprisal",
							uuid = "5f3e69e0-3313-076d-b359-984dc96e9352",
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
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuGNB3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Real melee range",
							uuid = "7140ddac-1509-d7dc-8541-e1cf984be5e6",
							version = 3,
						},
					},
				},
				mechanicTime = 341.70452758191,
				name = "[OT] Reprisal",
				timeRange = true,
				timelineIndex = 66,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -4,
				uuid = "1882371f-0f1c-280c-af68-ded39c4ca30f",
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
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfLight",
							uuid = "5f3e69e0-3313-076d-b359-984dc96e9352",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 341.70452758191,
				name = "[GNB] HoL - P2 LoJ before Trines",
				timeRange = true,
				timelineIndex = 66,
				timerEndOffset = -6,
				timerOffset = -3,
				timerStartOffset = -9,
				uuid = "1abc6f07-5e85-8fe4-9f24-de126a97a57c",
				version = 2,
			},
		},
	},
	[67] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "551907a6-e85a-70ea-6ea3-09a4d7f1c836",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "a7d197ba-07d1-de8e-c1dc-8ba472d9c64a",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[70] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "fc03f256-2f1f-1d62-2f00-82889adc37e6",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "2d303c2a-7a35-5106-d106-523889b65efa",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
							actionLua = "local target = TensorCore.mGetEntity(eventArgs.detectionTargetID)\n\nif target then\n    local drawer = TensorCore.getMoogleDrawer(\n        nil,\n        Argus2.RenderFlags.FLAG_RENDER_OVERLAY\n    )\n\n    drawer:addCircle(\n        target.pos.x,\n        target.pos.y,\n        target.pos.z,\n        7,\n        false\n    )\nend\n\nself.used = true",
							conditions = 
							{
								
								{
									"34ebc686-3c66-beef-b3f9-0c96e75de520",
									true,
								},
							},
							gVar = "ACR_RikuSGE3_CD",
							uuid = "ade79668-270a-8259-83fb-22affb19dcf3",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Filter",
							filterTargetType = "Party",
							subtypeRangeCheckSourceType = "ContentID",
							subtypeRangeSourceContentID = 7131,
							uuid = "34ebc686-3c66-beef-b3f9-0c96e75de520",
							version = 3,
						},
					},
				},
				eventType = 12,
				mechanicTime = 367.80061742504,
				name = "[Lj Draw] Tankbuster Closest",
				timeRange = true,
				timelineIndex = 70,
				timerEndOffset = 2.5,
				timerStartOffset = -0.80000001192093,
				uuid = "0dc3743a-3b23-7355-85a9-f925fc80ca5c",
				version = 2,
			},
		},
	},
	[72] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuGNB3_Tankbar_Rampart",
							uuid = "787c35ba-2967-8c72-b737-eea2ecefc00f",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 370.25754620621,
				name = "[Tank] Rampart",
				timelineIndex = 72,
				timerOffset = -15,
				uuid = "a5d3740a-a1e2-7ecf-b978-5336bafde644",
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
							gVar = "ACR_RikuGNB3_Tankbar_Nebula",
							uuid = "b2dfcd1f-e11e-d41c-ac1e-2f612075baeb",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 370.25754620621,
				name = "[GNB] Nebula",
				timelineIndex = 72,
				timerOffset = -7,
				uuid = "3d29269b-8cca-873d-ac6a-80017edaea03",
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
							gVar = "ACR_RikuGNB3_Tankbar_Camouflage",
							uuid = "9fcdc74c-7d15-b515-9f95-3a2ae83a426a",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 370.25754620621,
				name = "[GNB] Camouflage",
				timelineIndex = 72,
				timerOffset = -10,
				uuid = "df3d9008-50ce-0542-b05c-6d2188e98ff6",
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
							gVar = "ACR_RikuGNB3_Tankbar_AuroraSelf",
							uuid = "d736f5a3-3c33-acd8-a034-98c5dd539a22",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 370.25754620621,
				name = "[GNB] Aurora Self",
				timelineIndex = 72,
				timerOffset = -4,
				uuid = "8e56321c-408f-10f0-93be-8a62727cb1aa",
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
							aType = "Alert",
							alertTTS = true,
							alertText = "Stay in close save spot",
							gVar = "ACR_RikuGNB3_CD",
							uuid = "2ecd19cd-9e25-3eff-89fa-73832dadbab9",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 370.25754620621,
				name = "[Call] Close save spot",
				timelineIndex = 72,
				timerOffset = -4,
				timerStartOffset = -3,
				uuid = "1315b644-e0a4-f510-888f-a88cd27f70d9",
				version = 2,
			},
		},
	},
	[73] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "cb66fe27-52f7-ec23-f31c-ebb57b57e877",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[MT] Reprisal",
				uuid = "66f5a80e-2605-bf17-9d90-b0036f0e6273",
				version = 2,
			},
			inheritedObjectUUID = "2cd39f62-c9b1-685d-be87-fbff0a3b4c35",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
		
		{
			data = 
			{
				name = "[MT] [Not-WAR] Party Mit",
				uuid = "02cc72e0-9600-f6a3-8c12-c5956a24d395",
				version = 2,
			},
			inheritedObjectUUID = "b7a7c9a9-7b90-edbc-b9b0-580069f316e7",
			inheritedOverwrites = 
			{
				enabled = false,
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
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumSelf",
							uuid = "6bbd516d-ff22-9916-9ed4-b2f34c0885c3",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 377.30637120621,
				name = "[GNB] Hoc Self",
				timeRange = true,
				timelineIndex = 73,
				timerEndOffset = -0.5,
				timerStartOffset = -3,
				uuid = "e47bb788-0367-20cd-8991-1398caf1c228",
				version = 2,
			},
		},
	},
	[74] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "2e79133e-c1e1-17f2-d3dd-8e1498695b0e",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[76] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "b4b60e30-e006-8954-04e3-a7b2a69daac0",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[77] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "2f3835bb-cc9a-3e0f-4341-f3e14e058f0b",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
							aType = "Misc",
							conditions = 
							{
								
								{
									"697966a4-fdd4-c7fe-9808-67f834e1ddc7",
									true,
								},
								
								{
									"10821a39-1209-5e5a-8217-1a44450fca34",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_CD",
							name = "Target Chaos",
							setTarget = true,
							targetContentID = 7691,
							targetType = "Event Entity",
							uuid = "baf2eb39-6977-b826-8874-c383a772185a",
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"697966a4-fdd4-c7fe-9808-67f834e1ddc7",
									true,
								},
								
								{
									"10821a39-1209-5e5a-8217-1a44450fca34",
									true,
								},
								
								{
									"2f3d5bbf-eb32-5591-9f72-ff1533fcaf74",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Hotbar_ProvokeMouse",
							name = "Provoke Chaos",
							targetContentID = 7691,
							targetType = "Event Entity",
							uuid = "a43ded5c-ca16-0a1a-84f1-535603bcc33e",
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
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 7691,
							name = "Chaos event",
							uuid = "697966a4-fdd4-c7fe-9808-67f834e1ddc7",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7533,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Provoke ready",
							uuid = "2f3d5bbf-eb32-5591-9f72-ff1533fcaf74",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgType = 3,
							name = "Became targetable",
							uuid = "10821a39-1209-5e5a-8217-1a44450fca34",
							version = 3,
						},
					},
				},
				eventType = 26,
				mechanicTime = 427.45958272918,
				name = "[OT] P3 Provoke Chaos on spawn",
				randomOffset = -1,
				timeRange = true,
				timelineIndex = 77,
				timerEndOffset = 5,
				timerOffset = -2,
				timerStartOffset = -2,
				uuid = "5c7e84f7-bb96-f738-a531-c8a8f09d6ea7",
				version = 2,
			},
		},
	},
	[78] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "7e6a444e-41da-a8ca-cd5b-a410f537a11e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[79] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "a49c9c71-0087-047d-9ce4-4f2b5d23e3c1",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "cf21d9cf-d8ce-c02b-1c3c-dee5ded199df",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[80] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "10c3f121-c93e-ae15-9b14-6ca723c527f1",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[81] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfLight",
							uuid = "754b5bc7-d35d-41ab-856a-3c6405d68e6b",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 470.18264616806,
				name = "[GNB] HoL - P3 before Tsunami spread",
				timeRange = true,
				timelineIndex = 81,
				timerEndOffset = -5,
				timerStartOffset = -7,
				uuid = "6983814e-5db9-be55-888a-1aaa22a08559",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "a6482954-87a5-e468-cbb1-60d694469724",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[84] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuGNB3_Tankbar_Rampart",
							uuid = "882e53e4-95a4-ac28-b09c-490a427b8a91",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 481.45392399289,
				name = "[Tank] Rampart",
				timeRange = true,
				timelineIndex = 84,
				timerEndOffset = -8,
				timerOffset = -12,
				timerStartOffset = -12,
				uuid = "01465bbd-c935-5e8d-81f6-dda944c66f3d",
				version = 2,
			},
			inheritedIndex = 1,
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
							gVar = "ACR_RikuGNB3_Tankbar_Camouflage",
							uuid = "57db5f14-57f8-60f8-8665-53afcc5f8913",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 481.45392399289,
				name = "[GNB] Camouflage",
				timeRange = true,
				timelineIndex = 84,
				timerEndOffset = -0.5,
				timerStartOffset = -10,
				uuid = "ece72c80-3adb-b6f9-b5f8-65821086855e",
				version = 2,
			},
			inheritedIndex = 2,
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
									"b82243b0-8d81-7721-a685-dd44d4f3ab51",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Reprisal",
							uuid = "5f3e69e0-3313-076d-b359-984dc96e9352",
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
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuGNB3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Real melee range",
							uuid = "b82243b0-8d81-7721-a685-dd44d4f3ab51",
							version = 3,
						},
					},
				},
				mechanicTime = 481.45392399289,
				name = "[OT] Reprisal",
				timeRange = true,
				timelineIndex = 84,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -4,
				uuid = "c8e5c8a7-4078-a73f-bdd0-de9009a3bdb6",
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
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumSelf",
							uuid = "56f933a2-0a88-84a1-8fd2-d9b67ec8ffba",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 481.45392399289,
				name = "[GNB] Hoc Self",
				timeRange = true,
				timelineIndex = 84,
				timerEndOffset = -0.5,
				timerStartOffset = -3,
				uuid = "249557bc-997e-32a7-b6b9-0a1772122e2f",
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
							gVar = "ACR_RikuGNB3_Tankbar_AuroraSelf",
							uuid = "c41d1fbc-ae33-70e2-988f-6649581b8afe",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 481.45392399289,
				name = "[GNB] Aurora Self",
				timeRange = true,
				timelineIndex = 84,
				timerEndOffset = -1,
				timerOffset = -6,
				timerStartOffset = -6,
				uuid = "a0118c59-7107-d812-906c-31d6676371df",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "54016323-1ac7-55af-ff98-2acde8e71973",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[89] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "d95e02c6-7232-006a-e4cb-7a247b2c7dd6",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[91] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "48cb96bf-b4de-2e33-f2fe-08e56d9f934f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "128d3f59-1405-f2ed-b7f0-bf13d2a5dfe9",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[93] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "55d5b291-53ec-bfc5-843c-775368e58161",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "c8ec5a2f-8126-e833-dc27-fc4db63ababf",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[94] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "8b47adb8-3bc0-f5e4-f9f6-b12e54a41008",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[95] = 
	{
		
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
									"193e119d-5a7e-c662-88cd-1fc4a2d049d8",
									true,
								},
								
								{
									"712d25e6-f297-841a-8a7a-f110c7064f35",
									true,
								},
								
								{
									"e7101077-7295-e347-9a45-22cc624d82d9",
									true,
								},
								
								{
									"ce50c982-eb03-ef4f-a0f9-0470a4d08ef4",
									true,
								},
								
								{
									"f763fa99-1ce8-3afa-9e4b-9d2a4f7345ea",
									false,
								},
							},
							gVar = "ACR_RikuWAR3_Hotbar_LimitBreak",
							uuid = "1870ff75-1d29-299b-b0cc-3df3ff5be3e9",
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
							buffCheckType = 2,
							buffID = 196,
							category = "Self",
							name = "Missing PLD LB",
							uuid = "193e119d-5a7e-c662-88cd-1fc4a2d049d8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 863,
							category = "Self",
							name = "Missing WAR LB",
							uuid = "712d25e6-f297-841a-8a7a-f110c7064f35",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 864,
							category = "Self",
							name = "Missing DRK LB",
							uuid = "e7101077-7295-e347-9a45-22cc624d82d9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 1931,
							category = "Self",
							name = "Missing GNB LB",
							uuid = "ce50c982-eb03-ef4f-a0f9-0470a4d08ef4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 8,
							jobIDList = 
							{
								19,
								21,
								32,
							},
							name = "WAR / DRK / PLD",
							partyTargetType = "Detection Target",
							uuid = "547034fb-3d58-3c81-951f-51b0b837e482",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Filter",
							conditions = 
							{
								
								{
									"547034fb-3d58-3c81-951f-51b0b837e482",
									true,
								},
							},
							filterTargetType = "Party",
							name = "Living higher-priority tank",
							uuid = "f763fa99-1ce8-3afa-9e4b-9d2a4f7345ea",
							version = 3,
						},
					},
				},
				mechanicTime = 514.44485832111,
				name = "[OT] LB3 - GNB fallback priority",
				timeRange = true,
				timelineIndex = 95,
				timerEndOffset = -0.5,
				timerOffset = -2,
				timerStartOffset = -2,
				uuid = "785cca86-3b5e-1c30-ad99-36ec39133cde",
				version = 2,
			},
		},
	},
	[98] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "3a4946ac-502e-45e0-f663-487aab28dffc",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumSelf",
							uuid = "b597ee36-2fb0-412c-a6f7-81c45c01b122",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 518.31461099411,
				name = "[GNB] HoC Self",
				timeRange = true,
				timelineIndex = 98,
				timerEndOffset = -0.5,
				timerOffset = -4,
				timerStartOffset = -4,
				uuid = "71b30af1-11e7-6237-812d-5606706840b6",
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
							gVar = "ACR_RikuGNB3_Tankbar_AuroraSelf",
							uuid = "7e97a476-7846-ba11-9dc3-221437da151f",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 518.31461099411,
				name = "[GNB] Aurora Self",
				timeRange = true,
				timelineIndex = 98,
				timerEndOffset = -0.5,
				timerStartOffset = -4,
				uuid = "5fcc971b-65cc-df91-af4d-ac5cc5a9d019",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "9b1d2ac1-63e5-a65d-abba-e4676f59cd91",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[102] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "5ee0eef6-b571-60a2-9233-5d5c4ce58a46",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[103] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "628ad7f9-0fd1-7d35-a3f4-6177b77b5909",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[104] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "0df19640-fbf9-3094-3465-e36ae7a998d0",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "65e9a910-692e-d294-8bba-260e17f1f6e0",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
							aType = "Misc",
							conditions = 
							{
								
								{
									"4150be9d-a148-0bab-a9a3-e6d4cac7d7cd",
									true,
								},
								
								{
									"05e54ad9-a303-150f-8f54-bb9d592968eb",
									true,
								},
								
								{
									"83f992e2-e7db-84c6-868b-e7cbcbc9aef9",
									true,
								},
								
								{
									"3bc13fd0-3365-08d7-9e7a-0d914834f793",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_CD",
							name = "Target Exdeath",
							setTarget = true,
							targetContentID = 6052,
							targetType = "Event Entity",
							uuid = "baf2eb39-6977-b826-8874-c383a772185a",
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"4150be9d-a148-0bab-a9a3-e6d4cac7d7cd",
									true,
								},
								
								{
									"05e54ad9-a303-150f-8f54-bb9d592968eb",
									true,
								},
								
								{
									"70e7791b-027b-61d4-86ca-cb1348de0731",
									true,
								},
								
								{
									"83f992e2-e7db-84c6-868b-e7cbcbc9aef9",
									true,
								},
								
								{
									"3bc13fd0-3365-08d7-9e7a-0d914834f793",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Hotbar_ProvokeMouse",
							name = "Provoke Exdeath",
							targetContentID = 6052,
							targetType = "Event Entity",
							uuid = "a43ded5c-ca16-0a1a-84f1-535603bcc33e",
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
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 6052,
							name = "Exdeath event",
							uuid = "4150be9d-a148-0bab-a9a3-e6d4cac7d7cd",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7533,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Provoke ready",
							uuid = "70e7791b-027b-61d4-86ca-cb1348de0731",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgType = 2,
							eventSpellID = 49891,
							name = "Decisive Battle cast",
							uuid = "05e54ad9-a303-150f-8f54-bb9d592968eb",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							channelCheckSpellID = 49891,
							conditionType = 5,
							name = "Exdeath casting",
							partyTargetType = "Event Entity",
							uuid = "83f992e2-e7db-84c6-868b-e7cbcbc9aef9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							channelCheckSpellID = 49890,
							conditionType = 5,
							name = "Chaos casting",
							partyTargetName = "Chaos",
							partyTargetType = "Named Target",
							uuid = "3bc13fd0-3365-08d7-9e7a-0d914834f793",
							version = 3,
						},
					},
				},
				eventType = 3,
				mechanicTime = 544.89209076626,
				name = "[OT] P3 Provoke Exdeath at swap",
				timeRange = true,
				timelineIndex = 104,
				timerOffset = 1,
				timerStartOffset = -4,
				uuid = "6b869d77-45e6-4d8d-9453-eff5dc73ea57",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "d0b80e5b-64b0-974f-445b-711d841e54eb",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
							gVar = "ACR_RikuGNB3_Tankbar_Nebula",
							uuid = "af5b7199-5044-91b1-bba4-8caf6e7cd4c0",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 554.19098210262,
				name = "[GNB] Nebula",
				timeRange = true,
				timelineIndex = 105,
				timerEndOffset = -0.5,
				timerStartOffset = -3,
				uuid = "59a1e957-8841-d449-8be6-95c10fe8bad1",
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
									"935d8860-e55f-5b7d-833b-9e9de29d1656",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Reprisal",
							uuid = "cd6f75a6-bcb9-45d6-bd5a-32a8933634ab",
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
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuGNB3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Real melee range",
							uuid = "935d8860-e55f-5b7d-833b-9e9de29d1656",
							version = 3,
						},
					},
				},
				mechanicTime = 554.19098210262,
				name = "[OT] Reprisal",
				timeRange = true,
				timelineIndex = 105,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -4,
				uuid = "ff50fd14-48c7-174e-b76e-94f595218f72",
				version = 2,
			},
		},
	},
	[107] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e75749ed-5ff6-8561-76a2-080b751802fd",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "e98bbe9b-f6c7-46bf-f031-0a05e2442bab",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
									"0259bf7d-9e50-11da-aac9-9dff5774c79c",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumSelf",
							uuid = "d5713884-acc3-b832-b58b-dca43e41a049",
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
							comparator = 2,
							conditionLua = "return data.kaptinGnbOtEarthquakeHP1 == true",
							conditionType = 2,
							hpValue = 15,
							name = "Earthquake HP1 observed",
							uuid = "0259bf7d-9e50-11da-aac9-9dff5774c79c",
							version = 3,
						},
					},
				},
				mechanicTime = 557.21788210262,
				name = "[OT] HoC - after Earthquake HP1",
				timeRange = true,
				timelineIndex = 107,
				timerEndOffset = 10,
				uuid = "7267cd32-b3a4-d07e-b2f0-581bce75b9ea",
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
									"4a7b48ac-8899-64fb-ac58-3e8cacefbf44",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_AuroraSelf",
							uuid = "e1b528db-17e7-8bc9-9038-06554a0db95a",
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
							comparator = 2,
							conditionType = 2,
							hpValue = 10,
							uuid = "4a7b48ac-8899-64fb-ac58-3e8cacefbf44",
							version = 3,
						},
					},
				},
				mechanicTime = 557.21788210262,
				name = "[GNB] Aurora Self",
				randomOffset = 15,
				timelineIndex = 107,
				uuid = "7f8139db-067e-8d1e-bf2b-0c7df2fec6a2",
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
							actionLua = "data.kaptinGnbOtEarthquakeHP1 = true\nself.used = true",
							conditions = 
							{
								
								{
									"87c6662c-99aa-2eae-ad32-7315fecf58c2",
									true,
								},
								
								{
									"9c7a341d-9222-05ba-96dc-3a434a2f7475",
									true,
								},
							},
							name = "Record HP1",
							uuid = "6e14bca2-cd2d-c883-97df-aa17a8110c17",
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
							conditionType = 2,
							hpType = 2,
							hpValue = 1,
							name = "Alive - raw HP",
							uuid = "87c6662c-99aa-2eae-ad32-7315fecf58c2",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							comparator = 2,
							conditionType = 2,
							hpType = 2,
							hpValue = 1,
							name = "HP is one",
							uuid = "9c7a341d-9222-05ba-96dc-3a434a2f7475",
							version = 3,
						},
					},
				},
				eventType = 12,
				mechanicTime = 557.21788210262,
				name = "[OT] Record Earthquake HP1",
				timeRange = true,
				timelineIndex = 107,
				timerEndOffset = 10,
				uuid = "0d12ea7a-5bbb-1280-bcc8-7900b63211c0",
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
							actionLua = "data.kaptinGnbOtCotankThirdInLine = true\nself.used = true",
							conditions = 
							{
								
								{
									"d384c947-7818-fcd6-a35a-3b769014cddf",
									true,
								},
							},
							name = "Record co-tank assignment",
							uuid = "e9c30fef-909a-4e28-a568-3e7369a08b8b",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							buffID = 3006,
							category = "Party",
							name = "Co-tank Third in Line",
							partyTargetType = "Other Tank",
							uuid = "d384c947-7818-fcd6-a35a-3b769014cddf",
							version = 3,
						},
					},
				},
				mechanicTime = 557.21788210262,
				name = "[OT] Record co-tank Third in Line",
				throttleTime = 500,
				timeRange = true,
				timelineIndex = 107,
				timerEndOffset = 17,
				uuid = "debba7b6-e56a-fb3d-927d-43a3c364cc59",
				version = 2,
			},
		},
	},
	[108] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "56315044-ea10-3590-1dd4-1a1e19cfb0d4",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "7d336e84-1e3f-bea0-c955-ccd2e97bf4d4",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[109] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfLight",
							uuid = "14634160-b849-15ba-bad2-71099d20a0c6",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 575.36903594877,
				name = "[GNB] HoL",
				timeRange = true,
				timelineIndex = 109,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -3,
				uuid = "62964508-6b92-da0f-af83-295e666cf394",
				version = 2,
			},
		},
	},
	[112] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "88c93311-8fa2-ae2d-a5ad-90dbaeb6d8a1",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[113] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6447babc-4bdf-7018-e7e0-45fab62c09cc",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "9664451c-ab2e-7bc8-6be0-afde609993ac",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[115] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "3f06e3ca-f4a3-d3ce-3fc0-b6ecf72ef2da",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
							gVar = "ACR_RikuGNB3_Tankbar_Superbolide",
							uuid = "6a46f868-175d-122f-a592-9bb0e08da0c7",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 595.71497259653,
				name = "[GNB] Superbolide",
				timeRange = true,
				timelineIndex = 115,
				timerEndOffset = -0.5,
				timerStartOffset = -4,
				uuid = "11a519c9-8a87-4871-9768-6384727ac9a5",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "0ce6b521-a624-4bcd-75b9-74d3475cdd31",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "2c49a27f-8628-b93b-9723-04cd5138478f",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[122] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "aa1d89e0-c9e8-3dac-d613-b55262eca770",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "1f94a370-972b-2ecc-0c72-2d76e4f39340",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[126] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuGNB3_Tankbar_Rampart",
							uuid = "8180077b-9fb2-eb57-b657-f17152abd073",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 636.94380185281,
				name = "[Tank] Rampart",
				timeRange = true,
				timelineIndex = 126,
				timerEndOffset = -0.5,
				timerOffset = -15,
				timerStartOffset = -15,
				uuid = "adb9216a-8d1e-1ebe-9686-4efd10299b3e",
				version = 2,
			},
			inheritedIndex = 1,
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "3ec7464c-a16d-c940-6f84-08eea15381dc",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
									"a5042bff-e904-c08b-8906-9a44ae9c35b4",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Reprisal",
							uuid = "2e52338e-7a9a-873e-9910-87c5f926e505",
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
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuGNB3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Real melee range",
							uuid = "a5042bff-e904-c08b-8906-9a44ae9c35b4",
							version = 3,
						},
					},
				},
				mechanicTime = 636.94380185281,
				name = "[OT] Reprisal",
				randomOffset = -0.5,
				timelineIndex = 126,
				timerOffset = -6,
				uuid = "d942c1c2-3943-6382-a0ba-399d7929a8fd",
				version = 2,
			},
			inheritedIndex = 3,
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
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumSelf",
							uuid = "d720cce7-90fa-4c4e-b03b-126d40d0c17a",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 636.94380185281,
				name = "[GNB] Hoc Self",
				randomOffset = -0.5,
				timelineIndex = 126,
				timerOffset = -3,
				uuid = "399dbc74-bfcf-01c1-a9d7-7a429a9f689e",
				version = 2,
			},
			inheritedIndex = 4,
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
							gVar = "ACR_RikuGNB3_Tankbar_AuroraSelf",
							uuid = "f7320117-f749-41ef-9838-d78cbe65953f",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 636.94380185281,
				name = "[GNB] Aurora Self",
				randomOffset = -0.5,
				timelineIndex = 126,
				timerOffset = -3,
				uuid = "39adf93f-2399-a49a-9e6e-50b41d84eab7",
				version = 2,
			},
			inheritedIndex = 5,
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
							gVar = "ACR_RikuGNB3_Tankbar_Camouflage",
							uuid = "49c6b157-1bff-bf31-9501-fea08571443d",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 636.94380185281,
				name = "[GNB] Camouflage",
				timeRange = true,
				timelineIndex = 126,
				timerEndOffset = -0.5,
				timerStartOffset = -15,
				uuid = "71f5e40c-eae2-31ae-a6f5-c7bbf807a4b4",
				version = 2,
			},
		},
	},
	[129] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "addc03c5-e574-a991-1f97-45db9a92b595",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[131] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "68f9a674-03c1-0850-7b2a-8fe284707004",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "b3f11db4-a743-1560-fe1d-9886327f2244",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
									"2a11aea3-2c16-3346-9893-23110590dffb",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumSelf",
							uuid = "19edc503-cd55-f8ae-af4b-04b1d3cbfee6",
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
							actionCDValue = 1,
							actionID = 25758,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "HoC ready",
							uuid = "2a11aea3-2c16-3346-9893-23110590dffb",
							version = 3,
						},
					},
				},
				loop = true,
				mechanicTime = 672.96514955193,
				name = "[OT] HoC on CD - before final-beam reserve",
				throttleTime = 500,
				timeRange = true,
				timelineIndex = 131,
				timerEndOffset = -7,
				timerStartOffset = -25,
				uuid = "9c27d960-31c1-0abc-9e85-eba4151d4a57",
				version = 2,
			},
		},
	},
	[132] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfLight",
							uuid = "e561943c-0381-e87d-b20a-b417fae4b152",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 673.73268080193,
				name = "[GNB] HoL",
				timeRange = true,
				timelineIndex = 132,
				timerEndOffset = -0.5,
				timerOffset = -4,
				timerStartOffset = -4,
				uuid = "96c50aab-ccca-082e-98dd-1a3c5da80e58",
				version = 2,
			},
		},
	},
	[135] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e1952868-f7c3-edbc-5624-dc7eb9326878",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "b445b4d8-0c45-fe1c-45c9-5f72a9b17868",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[136] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "a4752343-d3bd-fe87-58df-0129bdf0e513",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[137] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "37299d66-9767-721a-63ee-d0d4c718b8b6",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
									"0e46b63b-d756-5add-aadf-81061f79d74a",
									true,
								},
								
								{
									"e0c739d6-2afd-f667-ae3e-42fa2b9f5405",
									true,
								},
								
								{
									"e1658d08-dcbe-ebe7-b346-b93d0e563e36",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumMouse",
							name = "HoC - co-tank Third in Line",
							targetType = "Other Tank",
							uuid = "bc12a9c2-369d-4ee5-98e4-280e8fcb2d0b",
							variableIsHover = true,
							variableTogglesType = 3,
							version = 2.1,
						},
						inheritedIndex = 1,
					},
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"0e46b63b-d756-5add-aadf-81061f79d74a",
									true,
								},
								
								{
									"e0c739d6-2afd-f667-ae3e-42fa2b9f5405",
									false,
								},
								
								{
									"e1658d08-dcbe-ebe7-b346-b93d0e563e36",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumSelf",
							name = "HoC - self after final beam",
							uuid = "f6e7a77d-6c00-3ab2-93e6-4b1a6ac04f64",
							variableTogglesType = 3,
							version = 2.1,
						},
						inheritedIndex = 2,
					},
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"0e46b63b-d756-5add-aadf-81061f79d74a",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Nebula",
							uuid = "7e414adf-3d96-8c7d-b43a-70fe15b98d31",
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
							category = "Event",
							comparator = 2,
							conditionType = 2,
							dequeueIfLuaFalse = true,
							eventArgType = 2,
							eventSpellID = 47868,
							hpValue = 15,
							name = "Final Nothingness",
							uuid = "0e46b63b-d756-5add-aadf-81061f79d74a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return data.kaptinGnbOtCotankThirdInLine == true",
							name = "Co-tank was Third in Line",
							uuid = "e0c739d6-2afd-f667-ae3e-42fa2b9f5405",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionCDValue = 1,
							actionID = 25758,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "HoC ready",
							uuid = "e1658d08-dcbe-ebe7-b346-b93d0e563e36",
							version = 3,
						},
					},
				},
				eventType = 2,
				mechanicTime = 690.41578400282,
				name = "[OT] HoC + Nebula - after final beam",
				timeRange = true,
				timelineIndex = 137,
				timerEndOffset = 4,
				timerStartOffset = -2,
				uuid = "074c360a-aec9-4e99-845f-a00754ac99b8",
				version = 2,
			},
		},
	},
	[138] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "3bafc277-e3a0-5a23-4c92-76fd2fc5ed87",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "34b6a6f1-9a40-1f1d-5cb7-07ab026fc081",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[140] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "c320dde8-7f2b-831c-b266-55be6420f338",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[141] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "fb9787cd-7190-7111-abd2-7d3b61af02dd",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
									"452890ec-d090-e699-bebc-e4b5f95a303f",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Reprisal",
							uuid = "9b166d2a-1c77-a1b4-a160-0fa1870baa51",
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
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuGNB3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Real melee range",
							uuid = "452890ec-d090-e699-bebc-e4b5f95a303f",
							version = 3,
						},
					},
				},
				mechanicTime = 705.28176295466,
				name = "[OT] Reprisal",
				timeRange = true,
				timelineIndex = 141,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -3,
				uuid = "4ccd44db-2de9-7726-9660-33a95a930a8d",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "d7604a93-46a3-8387-96c0-23b5ec216c23",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[146] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "832f0fae-75c0-0dca-3b95-5b8ca762f2be",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[147] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "0820cad1-346c-697d-1668-f9a7a0a21ee1",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[148] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "37847480-d924-1754-11a5-61322abbcf10",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[150] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "d9185335-4817-4899-2d7c-f6ef57409485",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[151] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "bbbb4046-0fe7-466a-62ad-a8f49dc41a16",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[152] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b19cea63-709a-1967-e498-bf0120a3b6f3",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
							gVar = "ACR_RikuGNB3_Hotbar_ShirkOT",
							uuid = "392fce3b-b5db-d29d-8736-962ae9540953",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 821.61906270742,
				name = "[OT] Shirk MT",
				timelineIndex = 152,
				timerOffset = -2,
				uuid = "7f4cfbe0-4613-26e2-91f6-792499654260",
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
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumMT",
							uuid = "e4311ecb-a62b-f1ce-b43b-088abe82ddae",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 821.61906270742,
				name = "[GNB] HoC MT",
				timelineIndex = 152,
				uuid = "a7ec2e93-210f-9d72-a8b1-4f1463671cf5",
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
							gVar = "ACR_RikuGNB3_Tankbar_Camouflage",
							uuid = "52673bbf-806a-d054-b651-58624488b78c",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 821.61906270742,
				name = "[OT] Camouflage - P4 aggro insurance",
				timeRange = true,
				timelineIndex = 152,
				timerEndOffset = -0.5,
				timerStartOffset = -4,
				uuid = "e4fc6665-9d8a-a5ad-a431-5768e800d3a7",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "14fbea08-7580-704c-8f48-055e8c8b0998",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "7d9058b8-62d0-372c-5076-e512a8f7d848",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[154] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "293d5b61-20cc-618d-1eee-f6835b81c571",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "0e0008bf-83ed-57fb-bef6-03bd2b2eb4cf",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[155] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "2ffe2f3e-b683-595a-702a-26a8354f6d4e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[156] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "2df76d4f-e291-b6fb-63ac-d955f4777d9f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "2a6b2de9-51ba-0375-e40d-8c8349242d79",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[157] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "c5400694-e0d6-b3e0-8b7e-b8c2cc0334a4",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "80679494-085b-e170-b0de-04a654f72ca4",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfLight",
							uuid = "c22b4ff3-6cf0-7059-b107-270e1a16d636",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 846.19462329432,
				name = "[GNB] HoL",
				timeRange = true,
				timelineIndex = 157,
				timerEndOffset = -0.5,
				timerStartOffset = -4,
				uuid = "b9643b65-acec-cd60-9a7d-96abaf87287c",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "329577bd-06b1-43b1-9a02-abb7e6cfe54d",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[159] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "7b4b020a-af91-778e-0894-729c3c73051a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
							actionID = 25758,
							conditions = 
							{
								
								{
									"8a9c4732-5b2f-9164-9bb2-39fa19ec5af7",
									true,
								},
								
								{
									"6e667927-b13f-3c23-8b0e-8e2fa8beae0d",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumMouse",
							ignoreWeaveRules = true,
							targetType = "Detection Target",
							uuid = "e2b5ae47-f27e-1045-8462-5e9d19403df5",
							variableIsHover = true,
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
							conditionLua = "return AnyoneCore ~= nil and AnyoneCore.Roster ~= nil\n    and AnyoneCore.Roster.current() ~= nil\n    and AnyoneCore.Roster.idOf(\"R2\") ~= nil",
							name = "R2 resolved",
							uuid = "8a9c4732-5b2f-9164-9bb2-39fa19ec5af7",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local r2ID = AnyoneCore.Roster.idOf(\"R2\")\nreturn r2ID ~= nil and eventArgs.detectionTargetID == r2ID",
							name = "Assigned R2",
							uuid = "c45099d1-549a-c39d-926b-f78fba7fa222",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Filter",
							conditions = 
							{
								
								{
									"c45099d1-549a-c39d-926b-f78fba7fa222",
									true,
								},
							},
							filterTargetType = "Party",
							name = "Living R2",
							uuid = "6e667927-b13f-3c23-8b0e-8e2fa8beae0d",
							version = 3,
						},
					},
				},
				mechanicTime = 855.99403801671,
				name = "[GNB] HoC R2 - Grand Cross III",
				timeRange = true,
				timelineIndex = 159,
				timerEndOffset = -1.5,
				timerStartOffset = -3.5,
				uuid = "19b753f6-9671-cbfa-b322-f7c76434e10e",
				version = 2,
			},
		},
	},
	[162] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "f5c346bc-e72a-36c0-d910-164a94f48b4c",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[163] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "295885b1-3d6c-cb05-4964-33f70ec84041",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[164] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "3d8d3e2a-91ed-3be6-4306-0a80bc09d93a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "22e64dce-ca42-eafa-2b6c-7e50b8027b1e",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[165] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "66b38fdd-8721-9ea9-2aa1-4c9bbb7f166d",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "034c634b-f8f6-a567-52da-4a555d36d41b",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[166] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "63cc2db0-60a7-e85c-8b1d-3cfae21962c0",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[167] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "e22709c5-1d7d-e4f1-1893-15db6a5a5995",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[168] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "9d2bd6de-5b71-3b82-188d-4284f4cc9dee",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[169] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "f27c9081-59e7-1c15-0727-ddff26204311",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
									"8ad5e9ee-28d9-7201-9e98-8e5947ed30fd",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Reprisal",
							uuid = "3da0d420-869e-11ba-a82e-4ca68f557df1",
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
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuGNB3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Real melee range",
							uuid = "8ad5e9ee-28d9-7201-9e98-8e5947ed30fd",
							version = 3,
						},
					},
				},
				mechanicTime = 934.65048710577,
				name = "[OT] Reprisal",
				timeRange = true,
				timelineIndex = 169,
				timerEndOffset = -5,
				timerStartOffset = -6,
				uuid = "0558cbd0-b74c-ad42-a85c-31007383b07a",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "83c9bf15-eeae-9699-c642-fcc71cdd4ba5",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[171] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6ab49f40-43c4-d684-3c12-7806446ca1d0",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
							gVar = "ACR_RikuGNB3_Hotbar_Provoke",
							uuid = "6e47400c-db7e-da2d-8f27-e34af7c26cd4",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 965.64810213372,
				name = "[OT] Provoke",
				timeRange = true,
				timelineIndex = 171,
				timerEndOffset = 3,
				timerStartOffset = -2,
				uuid = "da47d79b-94b6-9fc1-a5b9-f3d2449be6ed",
				version = 2,
			},
		},
	},
	[172] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "441a52ed-3ed9-f4d1-ceba-a997d1db0bfd",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[173] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "d171e09e-3091-a322-5c54-1d5ceb5f7d2e",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
							actionID = 16160,
							conditions = 
							{
								
								{
									"40c3c6c1-6acc-1b52-aca6-97d5fa5b0643",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfLight",
							ignoreWeaveRules = true,
							uuid = "16b822d4-61f1-9b72-ad34-a9245ac1b5d0",
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
							actionID = 16160,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "HoL ready",
							uuid = "40c3c6c1-6acc-1b52-aca6-97d5fa5b0643",
							version = 3,
						},
					},
				},
				eventType = 12,
				mechanicTime = 973.84072239989,
				name = "[OT] HoL - early Repeater",
				timeRange = true,
				timelineIndex = 173,
				timerEndOffset = -12.84072239989,
				timerOffset = -3,
				timerStartOffset = -13.24072239989,
				uuid = "cd86b9cd-ae28-669b-b655-d9a0366d189f",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "bba3f7f6-62f9-f812-bed8-a190a9a89346",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
							gVar = "ACR_RikuGNB3_Tankbar_Rampart",
							uuid = "35a64649-f31e-3189-9c96-e81083497afb",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 978.67931016566,
				name = "[Tank] Rampart",
				timeRange = true,
				timelineIndex = 177,
				timerEndOffset = -0.5,
				timerStartOffset = -10,
				uuid = "a55fe499-0f5b-b0f5-a9e3-a7020984eabb",
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
							gVar = "ACR_RikuGNB3_Tankbar_Camouflage",
							uuid = "1edbf27e-cdad-b36f-82e4-8ba28a1edae5",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 978.67931016566,
				name = "[GNB] Camouflage",
				timeRange = true,
				timelineIndex = 177,
				timerEndOffset = -0.5,
				timerStartOffset = -10,
				uuid = "4043299e-6582-03ab-837d-25e97fed35b3",
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
							actionID = 25758,
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumSelf",
							ignoreWeaveRules = true,
							uuid = "9803bb5f-9080-5eda-87ef-3805c55f13fd",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				eventType = 12,
				mechanicTime = 978.67931016566,
				name = "[GNB] HoC - P5 opening autos",
				timeRange = true,
				timelineIndex = 177,
				timerEndOffset = -0.82931016565999,
				timerOffset = -4,
				timerStartOffset = -1.52931016566,
				uuid = "fe7d1f82-a78f-47f2-8226-70d8466bf1ef",
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
							gVar = "ACR_RikuGNB3_Tankbar_AuroraSelf",
							uuid = "778264c4-cd8f-8563-bfbe-c2b89e6a3f2a",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 978.67931016566,
				name = "[GNB] Aurora Self",
				randomOffset = -0.5,
				timeRange = true,
				timelineIndex = 177,
				timerEndOffset = -0.5,
				timerOffset = -4,
				timerStartOffset = -4,
				uuid = "8d0287bd-60c5-ebc4-b40f-bd5e98aa394a",
				version = 2,
			},
		},
	},
	[179] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e42d7ab8-0e35-41ec-3b7f-c53e870ef248",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[180] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "ff2df654-f748-60b0-4836-b7ae69d80664",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "9005d554-78f5-ff80-7070-5d2265881c64",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[181] = 
	{
		
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
									"36fc17bb-545e-8abe-94be-fcecca381a09",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Reprisal",
							uuid = "8d6ae861-f2cc-8a3d-9af2-c310f0e59c29",
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
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuGNB3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Real melee range",
							uuid = "36fc17bb-545e-8abe-94be-fcecca381a09",
							version = 3,
						},
					},
				},
				mechanicTime = 991.3807442382,
				name = "[OT] Reprisal",
				timeRange = true,
				timelineIndex = 181,
				timerEndOffset = -0.75,
				timerStartOffset = -1.5,
				uuid = "c30bd65e-6dad-c748-8ba3-0a84d16612f9",
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
									"75a27b16-c2b8-ba7d-9147-93ee551c2696",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Hotbar_Provoke",
							uuid = "52318937-971d-3fe9-be59-f8456c848016",
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
							actionID = 7533,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Provoke ready",
							uuid = "75a27b16-c2b8-ba7d-9147-93ee551c2696",
							version = 3,
						},
					},
				},
				mechanicTime = 991.3807442382,
				name = "[OT] Provoke - after Flood",
				timeRange = true,
				timelineIndex = 181,
				timerEndOffset = 11.1192557618,
				timerStartOffset = 2.1192557618,
				uuid = "d4bb2262-f622-19f5-bb1d-7c052b6d606c",
				version = 2,
			},
		},
	},
	[185] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "b178e11d-9f3a-3eb1-0006-429337b0546d",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[186] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "890e6162-417b-07a6-06d5-4cf8df613e72",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[187] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuGNB3_Tankbar_Nebula",
							uuid = "29831c5e-3a10-c83a-8649-3c35b3877a61",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1004.2901808608,
				name = "[GNB] Nebula",
				timeRange = true,
				timelineIndex = 187,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -4,
				uuid = "b6259ac7-7b97-e9e0-823d-98f5cbadffdd",
				version = 2,
			},
		},
	},
	[188] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "237ec01c-e277-3b98-f345-0c4aedb40eac",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[189] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuGNB3_Hotbar_ShirkOT",
							uuid = "196b54e8-092d-562f-a301-906b094f8efa",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1007.4434123588,
				name = "[OT] Shirk",
				timeRange = true,
				timelineIndex = 189,
				timerEndOffset = 3,
				uuid = "59b9e2b6-6c40-f61e-bb66-b9159f214508",
				version = 2,
			},
		},
	},
	[190] = 
	{
		
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
									"cbcc8a69-1231-1468-98eb-49561ba16550",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_AuroraSelf",
							uuid = "a0fb8519-247b-4d7f-89c3-44f4541e9035",
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
							buffID = 5350,
							category = "Self",
							uuid = "cbcc8a69-1231-1468-98eb-49561ba16550",
							version = 3,
						},
					},
				},
				mechanicTime = 1010.9409115474,
				name = "[GNB] Aurora Self",
				timeRange = true,
				timelineIndex = 190,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -5,
				uuid = "4995f12f-80c1-a81e-a9e9-d208666691f9",
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
									"6f0b8f0a-e030-c495-a9e1-9e26b39df9c5",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumSelf",
							uuid = "a1ca805b-f2f9-2742-b434-781feb700972",
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
							buffID = 5350,
							category = "Self",
							uuid = "6f0b8f0a-e030-c495-a9e1-9e26b39df9c5",
							version = 3,
						},
					},
				},
				mechanicTime = 1010.9409115474,
				name = "[GNB] HoC Self",
				randomOffset = -0.5,
				timeRange = true,
				timelineIndex = 190,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -3,
				uuid = "81096a07-770f-96ed-8430-0d84832aaa27",
				version = 2,
			},
		},
	},
	[191] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "d59b568e-d821-48ba-da03-920889b7479e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[192] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "7585e4df-c0f7-4a5b-9e1f-fb3548de662f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[193] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "f27342e4-fe30-d240-43bf-dea23d2172f4",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[202] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "e5652aa9-b877-e7c5-c48a-5b8f4c089639",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[203] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "f074fa54-d965-2480-2554-ed42c5f74164",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[204] = 
	{
		
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
									"3d034969-f3e0-ad36-b991-d525b3b4958b",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_Reprisal",
							uuid = "57bed09e-0be9-ccbf-a0c3-acabd435e781",
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
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuGNB3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Real melee range",
							uuid = "3d034969-f3e0-ad36-b991-d525b3b4958b",
							version = 3,
						},
					},
				},
				mechanicTime = 1055.6337560913,
				name = "[Tank] Reprisal",
				timeRange = true,
				timelineIndex = 204,
				timerEndOffset = -0.5,
				timerStartOffset = -5,
				uuid = "4af88dfb-3810-5793-8fc0-620841a5c9f9",
				version = 2,
			},
			inheritedIndex = 1,
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							actionID = 16160,
							conditions = 
							{
								
								{
									"bbea808b-4ba1-98a5-81ec-54906a627671",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfLight",
							ignoreWeaveRules = true,
							uuid = "fec63736-76e9-85a4-8607-bb1e44e1484e",
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
							actionID = 16160,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "HoL ready",
							uuid = "bbea808b-4ba1-98a5-81ec-54906a627671",
							version = 3,
						},
					},
				},
				eventType = 12,
				mechanicTime = 1055.6337560913,
				name = "[OT] HoL - Repeater 2",
				timeRange = true,
				timelineIndex = 204,
				timerEndOffset = -3.1337560913,
				timerStartOffset = -5.6337560913,
				uuid = "c4a0c5db-1842-eaec-b535-1a4911afc275",
				version = 2,
			},
		},
	},
	[208] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "d2487589-3a7b-b4d5-d64d-8ee71af4c219",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
							gVar = "ACR_RikuGNB3_Tankbar_AuroraSelf",
							uuid = "a0fb8519-247b-4d7f-89c3-44f4541e9035",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1060.5180184963,
				name = "[GNB] Aurora Self",
				timeRange = true,
				timelineIndex = 208,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -5,
				uuid = "25fa2b58-eaaa-a82f-acf0-12f93e885d64",
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
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumSelf",
							uuid = "a1ca805b-f2f9-2742-b434-781feb700972",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1060.5180184963,
				name = "[GNB] HoC Self",
				randomOffset = -0.5,
				timeRange = true,
				timelineIndex = 208,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -3,
				uuid = "8df049ab-cc51-5657-962c-5e7574d3a6a5",
				version = 2,
			},
		},
	},
	[209] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "67b2a6c6-624d-9442-db33-e5cc82f70f16",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "0f0f591a-b345-e726-d3eb-a7acfb3a42ea",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[210] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e8633044-2658-b0a0-db73-834aac0190d4",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "6abd0e84-3b0b-3330-d197-162ed70594d4",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[211] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							actionID = 7531,
							gVar = "ACR_RikuGNB3_Tankbar_Rampart",
							ignoreWeaveRules = true,
							uuid = "4b0a47b7-3c90-582d-a154-443fd49add7a",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1096.3623108088,
				name = "[GNB] Rampart last - Orchestra II",
				timeRange = true,
				timelineIndex = 211,
				timerEndOffset = -1.1123108088,
				timerStartOffset = -2.1123108088,
				uuid = "4815abaa-437c-3698-bf7b-c8f386bf72a1",
				version = 2,
			},
			inheritedIndex = 1,
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
							gVar = "ACR_RikuGNB3_Tankbar_AuroraSelf",
							uuid = "a0fb8519-247b-4d7f-89c3-44f4541e9035",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1096.3623108088,
				name = "[GNB] Aurora Self",
				timeRange = true,
				timelineIndex = 211,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -5,
				uuid = "a4a76023-7bfc-5691-b1c9-7474acf9b6f8",
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
							actionID = 25758,
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumSelf",
							ignoreWeaveRules = true,
							uuid = "a1ca805b-f2f9-2742-b434-781feb700972",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				eventType = 12,
				mechanicTime = 1096.3623108088,
				name = "[GNB] HoC - Orchestra II",
				randomOffset = -0.5,
				timeRange = true,
				timelineIndex = 211,
				timerEndOffset = -2.8999999999999,
				timerOffset = -3,
				timerStartOffset = -3.5,
				uuid = "1ac3e37b-df8b-02da-9ed8-3373e86c299f",
				version = 2,
			},
		},
	},
	[212] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "ea408be2-b4ce-383e-8b44-0ae0b8e02372",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[214] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuGNB3_Hotbar_Provoke",
							uuid = "df858b4a-1f2e-f16c-af31-45abc82ff88b",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1099.544362845,
				name = "[OT] Provoke",
				timeRange = true,
				timelineIndex = 214,
				timerEndOffset = 3,
				uuid = "e9997b9d-4487-ea93-ae35-544da77b6806",
				version = 2,
			},
		},
	},
	[215] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							actionID = 16152,
							gVar = "ACR_RikuGNB3_Tankbar_Superbolide",
							ignoreWeaveRules = true,
							uuid = "da7c0906-a9ee-6c88-9497-61f45b413303",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1103.0753057021,
				name = "[GNB] Superbolide - Flare II",
				timeRange = true,
				timelineIndex = 215,
				timerEndOffset = -0.87530570209992,
				timerStartOffset = -1.8753057020999,
				uuid = "bb01416a-ef59-e57b-aaf2-bcb9327870d6",
				version = 2,
			},
		},
	},
	[216] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "19665dd2-1dd4-c956-00b4-5a3c35e1fbe2",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[218] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "0ed315cc-d340-2248-f6fc-d0866a7e7f9c",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
							gVar = "ACR_RikuGNB3_Tankbar_Camouflage",
							uuid = "e2fe806d-679c-12b2-af5c-c0ad970e8cd0",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1113.9009474604,
				name = "[GNB] Camouflage",
				timeRange = true,
				timelineIndex = 218,
				timerEndOffset = -0.5,
				timerStartOffset = -3,
				uuid = "4c72f856-e778-98e2-97bf-541daf7180a0",
				version = 2,
			},
		},
	},
	[219] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "88a6cac1-b7b4-54ad-ea36-5ee35ce36d91",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
									"26a35745-8ff3-7ed6-815d-25fee1e3a05c",
									true,
								},
								
								{
									"e05e75d1-f246-468a-8fe3-9bbd94d93eef",
									true,
								},
								
								{
									"35deaa94-e796-8d1e-9db7-31b3b6191910",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							uuid = "4ac40878-3c51-0a95-b2e3-1e08a551d14e",
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
							comparator = 2,
							conditionType = 6,
							inRangeValue = 5,
							uuid = "26a35745-8ff3-7ed6-815d-25fee1e3a05c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionCDValue = 1,
							actionID = 7535,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							uuid = "e05e75d1-f246-468a-8fe3-9bbd94d93eef",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 1193,
							uuid = "35deaa94-e796-8d1e-9db7-31b3b6191910",
							version = 3,
						},
					},
				},
				enabled = false,
				mechanicTime = 1125.2071474604,
				name = "[OT] Reprisal - reserved for Forsaken 3",
				timeRange = true,
				timelineIndex = 219,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -3,
				uuid = "d3a6c7b8-aaa7-13d9-90e9-464b8cd29b72",
				version = 2,
			},
		},
	},
	[221] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "83135f6c-d895-38c8-fb4d-8e768e7cc4fc",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "08f56d8c-f0b3-bd78-1d02-c78a5c855c5c",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[223] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "f2b0baca-0085-7b06-7b2c-244c3673b65a",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
									"26a35745-8ff3-7ed6-815d-25fee1e3a05c",
									true,
								},
								
								{
									"e05e75d1-f246-468a-8fe3-9bbd94d93eef",
									true,
								},
								
								{
									"35deaa94-e796-8d1e-9db7-31b3b6191910",
									true,
								},
								
								{
									"80cd60f8-c4a4-a062-9909-ea51ecc37422",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							uuid = "4ac40878-3c51-0a95-b2e3-1e08a551d14e",
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
							comparator = 2,
							conditionType = 6,
							inRangeValue = 5,
							uuid = "26a35745-8ff3-7ed6-815d-25fee1e3a05c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionCDValue = 1,
							actionID = 7535,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							uuid = "e05e75d1-f246-468a-8fe3-9bbd94d93eef",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 1193,
							uuid = "35deaa94-e796-8d1e-9db7-31b3b6191910",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuGNB3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Real melee range",
							uuid = "80cd60f8-c4a4-a062-9909-ea51ecc37422",
							version = 3,
						},
					},
				},
				mechanicTime = 1141.5122474604,
				name = "[Tank] Reprisal",
				timeRange = true,
				timelineIndex = 223,
				timerEndOffset = -0.5,
				timerOffset = -3,
				timerStartOffset = -3,
				uuid = "bd056c88-04ad-168b-a638-d4d87fed7a77",
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
							actionID = 16160,
							conditions = 
							{
								
								{
									"e6cee2df-3c68-671a-b77d-1380eb29a3bf",
									true,
								},
							},
							ignoreWeaveRules = true,
							uuid = "b5b7bf51-e928-9352-bd55-9318adadc022",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							actionID = 16160,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "HoL ready",
							uuid = "e6cee2df-3c68-671a-b77d-1380eb29a3bf",
							version = 3,
						},
					},
				},
				eventType = 12,
				mechanicTime = 1141.5122474604,
				name = "[OT] HoL - Forsaken 3",
				timeRange = true,
				timelineIndex = 223,
				timerEndOffset = 1.2877525396,
				timerOffset = -2,
				timerStartOffset = -1.7122474604,
				uuid = "25cb1b45-0341-c884-87af-ba24080d78fd",
				version = 2,
			},
		},
	},
	[225] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e31bbc00-c819-0054-844e-ac3ad6531690",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "450d22d0-6656-b354-9e3a-141e441ac1a0",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
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
									"42d93f0c-bb4c-f390-bbb4-81f4d455f55c",
									true,
								},
								
								{
									"a456e380-8011-fc38-b99e-c7be5cc66512",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_Tankbar_HeartOfCorundumMouse",
							targetType = "Detection Target",
							uuid = "32ff1044-8790-d49a-87c7-820adfc052cd",
							variableIsHover = true,
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
							conditionLua = "return AnyoneCore ~= nil and AnyoneCore.Roster ~= nil\n    and AnyoneCore.Roster.current() ~= nil\n    and AnyoneCore.Roster.idOf(\"R2\") ~= nil",
							name = "R2 resolved",
							uuid = "42d93f0c-bb4c-f390-bbb4-81f4d455f55c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local r2ID = AnyoneCore.Roster.idOf(\"R2\")\nreturn r2ID ~= nil and eventArgs.detectionTargetID == r2ID",
							name = "Assigned R2",
							uuid = "cc0ada60-54d7-ed0a-9db8-07fed41f33c9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Filter",
							conditions = 
							{
								
								{
									"cc0ada60-54d7-ed0a-9db8-07fed41f33c9",
									true,
								},
							},
							filterTargetType = "Party",
							name = "Living R2",
							uuid = "a456e380-8011-fc38-b99e-c7be5cc66512",
							version = 3,
						},
					},
				},
				mechanicTime = 1149.6575474604,
				name = "[GNB] HoC R2",
				timeRange = true,
				timelineIndex = 225,
				timerEndOffset = -0.5,
				timerStartOffset = -3,
				uuid = "0566e9d1-ff71-3bfa-b1f2-d34944774724",
				version = 2,
			},
		},
	},
	inheritedProfiles = 
	{
		"store\\anyone\\dmu\\main",
		"Lj\\umad\\draws_lpdu",
	},
	timelineName = "dmu",
	version = "1.5.5",
}



return tbl