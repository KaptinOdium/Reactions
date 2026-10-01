local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "07764d18-0407-d844-1099-6bd2d19cb548",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "bb549030-82ba-649f-be99-8764da5bab59",
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
									"e9e0010d-da42-22ae-a966-31ea217b950e",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT - Dark Missionary",
							uuid = "9bde8089-830a-b0ca-b5b6-48d7ee83bd8d",
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
							uuid = "e9e0010d-da42-22ae-a966-31ea217b950e",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 15.187,
				name = "[DRK R1][OT] Dark Missionary 00:06",
				timelineIndex = 1,
				timerOffset = -8.785,
				uuid = "2fa58a8e-4aea-64f4-9c79-7221b21656c1",
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
									"01d6d33b-6f38-d797-b8bf-6b7ec64b1d98",
									true,
								},
								
								{
									"c1df2c27-18dc-a64e-8894-2a860c403ecc",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_Grit",
							name = "OT - Grit",
							uuid = "10a6b54f-4c06-c3a7-a208-5b89a65fa28c",
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
							uuid = "01d6d33b-6f38-d797-b8bf-6b7ec64b1d98",
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
							uuid = "c1df2c27-18dc-a64e-8894-2a860c403ecc",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 15.187,
				name = "[DRK R1][OT] Grit 00:08",
				timelineIndex = 1,
				timerOffset = -7.05,
				uuid = "1eab3f85-a6f6-4d9a-8208-a8ddac977aeb",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "b32b0768-b78e-47b9-ab6d-5587b8f59089",
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
									"bbd28bc6-d48e-5bbb-9f1e-c19e844b4217",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "381d2a7b-7c70-f01e-aa27-ce7adb6d6530",
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
							uuid = "bbd28bc6-d48e-5bbb-9f1e-c19e844b4217",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 15.187,
				name = "[DRK R1][MT] Reprisal 00:10",
				timelineIndex = 1,
				timerOffset = -5.12,
				uuid = "1174d4ee-8949-85d3-9872-53e5f1a683c4",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\DPS Automation",
				uuid = "67742209-50b8-6c50-bd16-8e1075f008a6",
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
				mechanicTime = 15.187,
				name = "[DRK Opt][MT] Hold Potion to 06:04",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 347.101,
				timerStartOffset = 251.813,
				uuid = "c256851b-e7db-4099-b927-6f7ed37f9dca",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "ff1cf785-8453-5f61-3eb7-5c53037526f5",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "fd7bfa38-d233-344d-9f51-bb93d4ee7435",
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
									"16ce0f7e-171f-0cfb-b25d-870f3794f113",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "OT - Reprisal",
							uuid = "f2cabda5-35d3-7426-9eeb-d85f0063e96d",
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
							uuid = "16ce0f7e-171f-0cfb-b25d-870f3794f113",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 40.515,
				name = "[DRK R1][OT] Reprisal 00:36",
				timelineIndex = 2,
				timerOffset = -4.148,
				uuid = "6dcd68f8-dc8a-7833-9332-cbec51d4730b",
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
									"24591cb3-0f32-c93d-8b09-5c73c3013079",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "OT - Rampart",
							uuid = "2fb8b936-db22-6fa1-900a-882dc0ef23b6",
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
							uuid = "24591cb3-0f32-c93d-8b09-5c73c3013079",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 40.515,
				name = "[DRK R1][OT] Rampart 00:41",
				timelineIndex = 2,
				timerOffset = 1.064,
				uuid = "4bad74b3-0bff-68ef-84c0-c81400b2879a",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "e8d004a9-3f13-58a8-908b-0dbeeb26eab1",
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
									"c0bb97cd-b0a4-a68f-b75b-e19d46d8904c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "1330d2f0-7f62-b2fb-8f2f-948ef967eb23",
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
							uuid = "c0bb97cd-b0a4-a68f-b75b-e19d46d8904c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 40.515,
				name = "[DRK R1][MT] Rampart 00:38",
				timelineIndex = 2,
				timerOffset = -2.269,
				uuid = "47b3296b-e34a-e7ee-86df-04863515de54",
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
									"65536aa9-b325-9dc2-96c4-a13008ae13f6",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "0e55bb69-3e1d-7a58-812b-2f759a93f05f",
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
							uuid = "65536aa9-b325-9dc2-96c4-a13008ae13f6",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 40.515,
				name = "[DRK R1][MT] Oblation 00:40",
				timelineIndex = 2,
				timerOffset = 0.001,
				uuid = "76a6cea4-cafe-92b4-835b-1bd3eceb74dc",
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
									"3494f336-81cd-f08c-befa-0ed151b6ce9a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "3efa0c32-0a60-7429-b1e6-268b7521bac4",
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
							uuid = "3494f336-81cd-f08c-befa-0ed151b6ce9a",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 40.515,
				name = "[DRK R1][MT] Dark Mind 00:41",
				timelineIndex = 2,
				timerOffset = 0.668,
				uuid = "63e1d3ea-3216-4ffb-8903-3f21ce40bc6a",
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
				uuid = "6973cced-101a-7cd1-be54-0e166a7f9b60",
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
									"d47f38ce-9c65-1a4c-a252-ddc7cd705533",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "47a8a478-7fa6-208f-907c-ece1cf95eb95",
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
							uuid = "d47f38ce-9c65-1a4c-a252-ddc7cd705533",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 43.531,
				name = "[DRK R1][MT] The Blackest Night 00:42",
				timelineIndex = 3,
				timerOffset = -0.74400001764297,
				uuid = "97a4a68f-3ddf-1ba4-98d9-eba8f69998a8",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "7e066f37-1a3e-0ed9-b9d2-170e10ea8f20",
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
									"59921f73-763f-c40f-953f-2c14ba29406b",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "OT - Shadowed Vigil",
							uuid = "de8141ff-4d5b-f511-bf92-ec20a18980ce",
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
							uuid = "59921f73-763f-c40f-953f-2c14ba29406b",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 43.531,
				name = "[DRK R1][OT] Shadowed Vigil 00:44",
				timelineIndex = 3,
				timerOffset = 0.719,
				uuid = "449fee43-890f-d6cd-91cd-5c8ed261be4f",
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
				uuid = "f0f437b3-f83b-37e8-8963-bd8e2073546c",
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
									"962a645a-261d-0209-9b62-a3f6adde5482",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Oblation",
							name = "MT - Oblation",
							targetType = "Other Tank",
							uuid = "c39c86ea-811c-13b2-94ec-5e0133faa02d",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "962a645a-261d-0209-9b62-a3f6adde5482",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 46.5,
				name = "[DRK R1][MT] Oblation 00:45",
				timelineIndex = 4,
				timerOffset = -1.308,
				uuid = "cda88d4e-db23-7915-9747-f524c765febd",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "582263d8-1e94-9496-a57b-108518f37f5f",
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
									"b397233f-bc4a-242b-9b64-0a27443eef42",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "OT - The Blackest Night",
							uuid = "2f3ad1d2-374c-9246-a668-36e4419f7b0d",
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
							uuid = "b397233f-bc4a-242b-9b64-0a27443eef42",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 46.5,
				name = "[DRK R1][OT] The Blackest Night 00:45",
				timelineIndex = 4,
				timerOffset = -0.51,
				uuid = "97cfd631-eaff-8cd6-a58d-fe91f8e83ee0",
				version = 2,
			},
		},
	}, 
	[6] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "b78adf61-cbe5-7785-f564-f167a7df66d1",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "8e42ddc6-3136-b5d1-83eb-7886aaa4eea4",
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
									"567019ce-9e9a-6821-8c87-7180d8be016c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "OT - Oblation",
							uuid = "5032eb62-ce9c-380f-9111-005b75fb81f1",
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
							uuid = "567019ce-9e9a-6821-8c87-7180d8be016c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 69.75,
				name = "[DRK R1][OT] Oblation 01:03",
				timelineIndex = 6,
				timerOffset = -6.088,
				uuid = "2d2dc8ab-09b6-b5c1-9416-4bdcb9eeb7eb",
				version = 2,
			},
		},
	},
	[9] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "f751f720-f806-154c-4c69-0b9a0d402d10",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "e83746e5-589b-ba1e-b720-dea96baf27ec",
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
									"67c2b551-839e-ef80-821b-887270253bd8",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "2dea76ec-c4cf-1cf5-a2fa-1ef363f13f20",
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
							uuid = "67c2b551-839e-ef80-821b-887270253bd8",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 80.953,
				name = "[DRK R1][MT] Dark Missionary 01:20",
				timelineIndex = 9,
				timerOffset = -0.647,
				uuid = "1e31ed1a-c74f-99bd-9765-65ed9db8ae04",
				version = 2,
			},
		},
	},
	[14] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "bea25d1c-046c-7ef8-b52b-36d244d5f14c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "ba810753-50fd-80b2-898f-fbd1d177e2b5",
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
									"f4f4616a-2659-01d0-9c3a-4b7ad09341a8",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "OT - Living Dead",
							uuid = "7fb708f6-8609-0255-97e5-20cf366516fd",
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
							uuid = "f4f4616a-2659-01d0-9c3a-4b7ad09341a8",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 87.969,
				name = "[DRK R1][OT] Living Dead 01:32",
				timelineIndex = 14,
				timerOffset = 4.084,
				uuid = "48f967a8-1258-2f5b-a0dc-98e2e5aef3bc",
				version = 2,
			},
		},
	},
	[15] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "a53819ab-1606-44a7-4f1f-a20156cc8d5b",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "4218ef10-d4d7-0009-a084-bdf9356c0e5b",
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
									"44081237-2e0e-c44a-848c-2f88b92aea45",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "MT - Shadowed Vigil",
							uuid = "e2c6c518-ece6-aa8a-8e4e-a15457d7c812",
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
							uuid = "44081237-2e0e-c44a-848c-2f88b92aea45",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 96.626,
				name = "[DRK R1][MT] Shadowed Vigil 01:33",
				timelineIndex = 15,
				timerOffset = -3.015,
				uuid = "f045e4d1-1d6d-0b2c-9a07-7e0c984e00ca",
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
									"80e09de1-5482-fde3-ac46-590eeb36fd1c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "e8729cac-ef89-d729-87cf-7d3ae9bbfd92",
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
							uuid = "80e09de1-5482-fde3-ac46-590eeb36fd1c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 96.626,
				name = "[DRK R1][MT] The Blackest Night 01:35",
				timelineIndex = 15,
				timerOffset = -1.278,
				uuid = "661d8505-c6f7-08a5-9ab1-663936c8382e",
				version = 2,
			},
		},
	},
	[16] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "eeb8d650-fe31-adbd-b444-e7cd788ca1c2",
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
									"f20ede38-bced-31c3-902c-2e4a187bb5f8",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT - Dark Missionary",
							uuid = "248ae6b2-e8e9-592b-bcc6-584573d97a34",
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
							uuid = "f20ede38-bced-31c3-902c-2e4a187bb5f8",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 97.126,
				name = "[DRK R1][OT] Dark Missionary 01:40",
				timelineIndex = 16,
				timerOffset = 3.762,
				uuid = "87de474e-6673-f32c-848a-f101b21011f0",
				version = 2,
			},
		},
	},
	[17] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "a079de79-e1c2-9be5-e349-2753dff8c929",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "8b9503d2-e5ae-11c0-8455-8a618e49d1eb",
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
									"52d35082-f642-ccce-a9b9-9ef085988367",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "46db2252-9905-cbc1-a0e8-72ca2ee42b64",
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
							uuid = "52d35082-f642-ccce-a9b9-9ef085988367",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 107.172,
				name = "[DRK R1][MT] Reprisal 01:43",
				timelineIndex = 17,
				timerOffset = -3.588,
				uuid = "7049f0da-ad3f-f802-91bc-cb23dca23c43",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "48929a86-6657-855c-9440-e1edef8e21d0",
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
									"46bd64d8-5a6a-1808-b8b4-cddd3eba13d4",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "OT - Dark Mind",
							uuid = "8f257a92-7e7e-f678-a741-7e47e9932728",
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
							uuid = "46bd64d8-5a6a-1808-b8b4-cddd3eba13d4",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 107.172,
				name = "[DRK R1][OT] Dark Mind 01:50",
				timelineIndex = 17,
				timerOffset = 3.742,
				uuid = "ab86d3dc-c577-e0d5-aee5-8b21241c53e9",
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
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "0e9d8768-579f-0dac-9523-e90e210ea918",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[19] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "a7bf2597-ba17-bf3b-6cfc-3c0dcab16e47",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[21] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "a60fb7f8-dfaf-706c-101d-2be29d10f368",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[23] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "d8381ec6-8c58-599a-2e23-6674bdbef8f6",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[29] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "d5a7a500-f9e9-b2e4-4efe-6d2aea647bb0",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "d0bf681c-9a82-8a05-a972-9c7c3d1c75c5",
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
									"13591c10-2a7a-0cc7-9ce0-9e5897db6fae",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "OT - Reprisal",
							uuid = "0684a17f-9d5a-d515-bfad-696c85d109b4",
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
							uuid = "13591c10-2a7a-0cc7-9ce0-9e5897db6fae",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 185.501,
				name = "[DRK R1][OT] Reprisal 03:01",
				timelineIndex = 29,
				timerOffset = -4.24,
				uuid = "c8f691a5-243c-9aed-87f0-6b98f24b3fc0",
				version = 2,
			},
		},
	},
	[30] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "c9ddaf22-791f-b366-86a8-45447f5aa5d2",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[31] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "500cb911-9632-9805-bfca-4d33194f1101",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[Kaptin M12S] Act 3 Layout + Stage 2 Guide",
				uuid = "05b874fb-31ea-8ca2-abd9-9d9668714519",
				version = 2,
			},
			inheritedObjectUUID = "05f01301-0e35-2c1e-a60f-17577ded4948",
			inheritedOverwrites = 
			{
				enabled = true,
			},
		},
		
		{
			data = 
			{
				name = "[Kaptin M12S] Act 3 Stage 1 Roster Guide",
				uuid = "df36254f-15f2-2d80-8afb-b3b688652dbc",
				version = 2,
			},
			inheritedObjectUUID = "36521cda-6b71-7015-af67-c87613dde051",
			inheritedOverwrites = 
			{
				enabled = true,
			},
		},
	},
	[33] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "e89e4c23-482e-b2c7-06f3-cc61ad789653",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[38] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "3b2a236a-672d-846e-7aa6-824cbb2a459a",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "86b58d8d-c989-4a8c-9ee0-e8af85abbcd4",
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
									"9f7ba741-4b33-4037-bfb1-aa6d27634812",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "OT - Rampart",
							uuid = "36fa2176-3ed8-f48e-957d-3d4eb661368f",
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
							uuid = "9f7ba741-4b33-4037-bfb1-aa6d27634812",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 221.047,
				name = "[DRK R1][OT] Rampart 03:42",
				timelineIndex = 38,
				timerOffset = 1.593,
				uuid = "956e6c12-466b-f9a4-9b3a-9d0b544c3d05",
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
									"3c879d60-33f1-71d8-9752-be1932dfff7b",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "OT - Shadowed Vigil",
							uuid = "1090d677-1a2e-e639-92ad-9da610d446ea",
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
							uuid = "3c879d60-33f1-71d8-9752-be1932dfff7b",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 221.047,
				name = "[DRK R1][OT] Shadowed Vigil 03:43",
				timelineIndex = 38,
				timerOffset = 2.26,
				uuid = "f82c683d-1fbc-975d-abe7-fd3a34fd459d",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "04c36524-f260-3240-ae69-be284fef8ce4",
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
									"02d36162-24b0-583d-a073-60769468c568",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "MT - Living Dead",
							uuid = "c3c967f9-fb0a-6be7-b43f-c3c0d0ee7a37",
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
							uuid = "02d36162-24b0-583d-a073-60769468c568",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 221.047,
				name = "[DRK R1][MT] Living Dead 03:43",
				timelineIndex = 38,
				timerOffset = 2.908,
				uuid = "1f7f2cfe-1367-146c-9761-6d1d42fea36b",
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
				name = "Rank 1\\OT",
				uuid = "d6eca18f-8d0b-0769-9874-da1ba1eede26",
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
									"2c311b7e-0b90-d2f9-952e-3a12e7b925c7",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "OT - The Blackest Night",
							uuid = "e63453d1-206c-1248-aacc-d16ac5048df7",
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
							uuid = "2c311b7e-0b90-d2f9-952e-3a12e7b925c7",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 227.392,
				name = "[DRK R1][OT] The Blackest Night 03:45",
				timelineIndex = 39,
				timerOffset = -2.307,
				uuid = "35bc0289-a495-2061-af16-b88a59780e2f",
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
									"4f79987e-3353-2907-b2f3-ea8cf310ae68",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "OT - Dark Mind",
							uuid = "e93a99cd-7a4f-7a06-aaa3-3c839ebe540e",
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
							uuid = "4f79987e-3353-2907-b2f3-ea8cf310ae68",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 227.392,
				name = "[DRK R1][OT] Dark Mind 03:45",
				timelineIndex = 39,
				timerOffset = -1.642,
				uuid = "ec559cf3-1013-4669-aa8a-5f17ecfb5dca",
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
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "962cb0b1-6fa5-672d-01c6-b84753996ba1",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[41] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "05bc2242-7bd1-f42e-5823-f318bee99172",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "abb393e8-c8eb-99f9-a8c9-fd6c4b437cc1",
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
									"2b7ada2a-28e7-703e-bbe9-7940387451d1",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT - Dark Missionary",
							uuid = "f7f95b8b-f4c2-7b2b-bf7c-55e5d3ffd4fb",
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
							uuid = "2b7ada2a-28e7-703e-bbe9-7940387451d1",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 231.017,
				name = "[DRK R1][OT] Dark Missionary 03:53",
				timelineIndex = 41,
				timerOffset = 2.221,
				uuid = "98b61d68-7803-52dc-b01f-494424c6c170",
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
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "80f63d43-ed8c-0aaf-4fca-9d852f62ee73",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "784c03c2-9034-9757-be60-9e5d0e7ebcd6",
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
									"f0bbb46d-0e61-5c77-aed0-9c4d4f7c098c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "661373bd-7fae-0e2a-902f-7110441aa391",
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
							uuid = "f0bbb46d-0e61-5c77-aed0-9c4d4f7c098c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 240.329,
				name = "[DRK R1][MT] Reprisal 03:56",
				timelineIndex = 42,
				timerOffset = -3.496,
				uuid = "acd15816-92b4-3a89-a550-1d975f59f11b",
				version = 2,
			},
		},
	},
	[43] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "528442d4-2ca2-ee60-32b7-b8e6d6bb2d84",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[50] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "cb4b3824-bb92-8fb0-1ef5-a7c28e16fd94",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[51] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "5253c693-fd83-8a7f-af66-3631ac467803",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[52] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "f5cfbd12-00e2-debe-6bbd-c8540ec55a02",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "4ea525a1-58e3-9104-aab0-d81c8100e646",
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
									"466f9800-def2-5e87-94b8-2dd1330a0281",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "OT - Reprisal",
							uuid = "9ca00e48-351a-94d9-89a1-4491f924c04e",
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
							uuid = "466f9800-def2-5e87-94b8-2dd1330a0281",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 280.001,
				name = "[DRK R1][OT] Reprisal 04:42",
				timelineIndex = 52,
				timerOffset = 2.943,
				uuid = "725ed6b1-f30a-84cf-8e28-280677df21e5",
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
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "4e8d9341-a315-11bd-9a2f-c2c3806d5671",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "0f0f8a7e-303e-26c7-b158-05dcf67b9081",
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
									"7b67de83-18d9-98a5-a427-7815be839446",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "33509455-d0db-1303-9d69-593242f8ebc4",
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
							uuid = "7b67de83-18d9-98a5-a427-7815be839446",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 286.657,
				name = "[DRK R1][MT] Dark Missionary 04:46",
				timelineIndex = 53,
				timerOffset = 0.304,
				uuid = "dc627fb1-8d2d-e2db-bffb-dccbcfb4e437",
				version = 2,
			},
		},
	},
	[54] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "a4cafef8-1e43-dd1c-e436-80b69bcc3a68",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[55] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "b664c4a7-04d9-99ab-656d-615534edd897",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "73eddf76-65b8-043d-b0ab-6fbb37538f0c",
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
									"05306b62-4750-8fc6-a0fe-deaf539f85e2",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "31b76f1b-42c8-a2cf-8f74-5b7d97804ca7",
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
							uuid = "05306b62-4750-8fc6-a0fe-deaf539f85e2",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 314.97,
				name = "[DRK R1][MT] Rampart 05:06",
				timelineIndex = 55,
				timerOffset = -8.683,
				uuid = "5bc7be85-67f8-a840-9201-54db3543e791",
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
									"ffabf643-21cb-f7f9-8a59-c547e3bd3478",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "MT - Shadowed Vigil",
							uuid = "2a9bece7-0ac9-46b2-8662-340d6cee33a8",
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
							uuid = "ffabf643-21cb-f7f9-8a59-c547e3bd3478",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 314.97,
				name = "[DRK R1][MT] Shadowed Vigil 05:08",
				timelineIndex = 55,
				timerOffset = -6.05,
				uuid = "fc6fdd8e-aae3-dc77-a9ef-5cf6af79c81a",
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
									"0b89bf44-b3ec-95f3-9dca-938686b3b976",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "5875092c-0616-fc73-aedc-9a1a22b2d612",
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
							uuid = "0b89bf44-b3ec-95f3-9dca-938686b3b976",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 314.97,
				name = "[DRK R1][MT] Oblation 05:09",
				timelineIndex = 55,
				timerOffset = -5.339,
				uuid = "b3653918-baad-3052-a055-58be73b91fbf",
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
									"cb4a2c3b-68d1-8eb1-a9d6-88c14f9be36c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "MT - The Blackest Night",
							targetType = "Other Tank",
							uuid = "c1fbde78-bee4-3ea9-8ff7-e98ff73c9b84",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"mt\"",
							name = "MT route",
							uuid = "cb4a2c3b-68d1-8eb1-a9d6-88c14f9be36c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 314.97,
				name = "[DRK R1][MT] The Blackest Night 05:11",
				timelineIndex = 55,
				timerOffset = -3.289,
				uuid = "50739618-d423-952c-a867-382880ce7394",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "49696bde-1801-e924-bf63-9ced44165dc4",
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
									"679e635e-76aa-3ab4-bd72-a2ebe46660a7",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "OT - Rampart",
							uuid = "e897e40f-e0eb-5a50-8af5-b8d6a124ae6b",
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
							uuid = "679e635e-76aa-3ab4-bd72-a2ebe46660a7",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 314.97,
				name = "[DRK R1][OT] Rampart 05:13",
				timelineIndex = 55,
				timerOffset = -1.469,
				uuid = "50219140-162b-40e4-bb2c-9a7a4e720c9a",
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
				name = "Rank 1\\OT",
				uuid = "b792ea84-35d3-4133-aeec-f3af7df9442a",
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
									"ae468f9a-799b-1d92-91cd-2098567c3e7c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "OT - Dark Mind",
							uuid = "cfdeb45c-d124-c064-9d9e-72503b5d3b91",
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
							uuid = "ae468f9a-799b-1d92-91cd-2098567c3e7c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 318.002,
				name = "[DRK R1][OT] Dark Mind 05:18",
				timelineIndex = 56,
				timerOffset = 0.129,
				uuid = "2520bce8-4907-9da3-ac6b-8c76d39d55d9",
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
									"428625b9-71df-f4c8-b292-94b4aca4786a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "OT - Oblation",
							uuid = "c3bb1f05-cdda-d29f-9194-177ac8c63f6d",
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
							uuid = "428625b9-71df-f4c8-b292-94b4aca4786a",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 318.002,
				name = "[DRK R1][OT] Oblation 05:18",
				timelineIndex = 56,
				timerOffset = 0.797,
				uuid = "f9df1594-c32a-8dce-b325-953723a87c2e",
				version = 2,
			},
		},
	},
	[57] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "64771afd-8ae6-ce37-a3ad-3ba41e386492",
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
									"d12c689e-f8e7-ac94-ba59-7562fd4f4011",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "OT - The Blackest Night",
							uuid = "7c9e9eda-16dd-b3ad-a818-87f2693f77ee",
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
							uuid = "d12c689e-f8e7-ac94-ba59-7562fd4f4011",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 321.002,
				name = "[DRK R1][OT] The Blackest Night 05:20",
				timelineIndex = 57,
				timerOffset = -0.289,
				uuid = "fd2a1830-5938-b020-8d58-bf8cea3f3514",
				version = 2,
			},
		},
	},
	[59] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "5a763f3b-0760-a597-8f4f-0f393266ccab",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "8f4af133-cba0-9e83-ad87-7254be0e4044",
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
									"f13dfbd2-933c-f095-bee4-be6f1dbbd7c5",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT - Dark Missionary",
							uuid = "e4803ea6-3bf5-97fb-95f6-11fc7d4282cf",
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
							uuid = "f13dfbd2-933c-f095-bee4-be6f1dbbd7c5",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 339.143,
				name = "[DRK R1][OT] Dark Missionary 05:35",
				timelineIndex = 59,
				timerOffset = -3.224,
				uuid = "eeaf45aa-aa66-a725-bdb6-e4941b8108a8",
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
				name = "Rank 1\\MT",
				uuid = "f52d2995-2458-e484-97c8-68a8e87f7e3b",
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
									"21982182-93a9-79c3-a067-da83d6b98ad3",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "ef0074a7-2603-5be5-87a3-254de88f81ad",
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
							uuid = "21982182-93a9-79c3-a067-da83d6b98ad3",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 350.299,
				name = "[DRK R1][MT] The Blackest Night 05:48",
				timelineIndex = 61,
				timerOffset = -1.502,
				uuid = "271af8a5-deba-5c44-ae8a-648fa4febc3f",
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
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "969601c9-e307-54e5-5dbb-114f5839c539",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[63] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "1353296a-edb5-ccd6-8e30-ea061ef69643",
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
									"c18e8b37-030a-0a64-92b6-dfab954ae27d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ArmsLength",
							name = "MT - Arm's Length",
							uuid = "241306e2-c761-8131-912e-44db25413ae8",
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
							uuid = "c18e8b37-030a-0a64-92b6-dfab954ae27d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 355.924,
				name = "[DRK R1][MT] Arm's Length 05:53",
				timelineIndex = 63,
				timerOffset = -2.044,
				uuid = "dfe6e23d-d458-195d-b35f-0205d1964731",
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
				name = "Rank 1\\MT",
				uuid = "4c48f7ca-cad7-7f6d-a412-67a52cd9732f",
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
									"115897f1-92a1-33a0-93fb-a0d2fd8525c1",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "24ba0627-d825-9be0-84e7-1ddb1219d8fa",
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
							uuid = "115897f1-92a1-33a0-93fb-a0d2fd8525c1",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 368.112,
				name = "[DRK R1][MT] Reprisal 06:07",
				timelineIndex = 67,
				timerOffset = -0.391,
				uuid = "f6993dd0-6063-fc0f-ad36-c0a00e5b0d7d",
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
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "1f052a53-a567-c4cf-9b5a-a165631a78c3",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[70] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "197e3366-297f-2f22-e42d-d8d02f6cb016",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[75] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "f044a4a7-83ac-1497-aab8-063deaa5cd95",
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
									"b7305d0b-9c26-838b-999e-f5ea3b843f06",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "b9be6dbc-23e8-12d9-8df1-c14005580073",
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
							uuid = "b7305d0b-9c26-838b-999e-f5ea3b843f06",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 397.049,
				name = "[DRK R1][MT] Dark Missionary 06:34",
				timelineIndex = 75,
				timerOffset = -2.521,
				uuid = "24f2113f-3514-4e94-86d2-3db7ac62c3e7",
				version = 2,
			},
		},
	},
	[76] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "6eb378c4-2bb8-6688-531e-efeafea671b4",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	[78] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p1",
				uuid = "078c046e-9acb-a36a-e40b-b308c89ffc5e",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p1",
			objectType = "folder",
		},
	},
	inheritedProfiles = 
	{
		"store\\anyone\\savage6\\m12s\\main_p1",
	},
	timelineName = "r12s1",
	version = "1.5.1",
}



return tbl