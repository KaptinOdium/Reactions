local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "03b75244-9875-9140-137d-617e712911f4",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "8575aaa5-aa9b-a493-9448-6e8476abc034",
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
									"153a25f8-62c9-75ee-8b1c-4130760e7a65",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_Provoke",
							name = "MT - Provoke",
							uuid = "22eb322d-3b2e-cea4-8cca-e1ab5aa72ffe",
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
							uuid = "153a25f8-62c9-75ee-8b1c-4130760e7a65",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 15.125,
				name = "[DRK R1][MT] Provoke 00:00",
				timelineIndex = 1,
				timerOffset = -14.636,
				uuid = "03e8dc8f-cf4f-4382-b32a-d52ed068732e",
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
									"26b4b878-ecac-6392-850f-16c1ce86e205",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "5f5d0b4f-be33-0f62-ae74-66245dfc6348",
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
							uuid = "26b4b878-ecac-6392-850f-16c1ce86e205",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 15.125,
				name = "[DRK R1][MT] Reprisal 00:04",
				timelineIndex = 1,
				timerOffset = -10.179,
				uuid = "b22b76c0-5175-8ff0-9fba-b86e295df4f8",
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
									"20691767-3e71-1114-84ff-9d7f9de92e8f",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "2994623d-1ba5-a55c-b61a-6d783b384fe2",
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
							uuid = "20691767-3e71-1114-84ff-9d7f9de92e8f",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 15.125,
				name = "[DRK R1][MT] Rampart 00:20",
				timelineIndex = 1,
				timerOffset = 5.549,
				uuid = "1f9c3788-f695-6232-a9ec-24457aad4a81",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "0f2f2abc-ff28-39fb-a7d6-f1f717cd39ca",
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
									"1fb6162d-7c17-34ae-a9a7-cf56624a3204",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT - Dark Missionary",
							uuid = "3004cbc5-10bd-05f2-a851-31b3c048c214",
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
							uuid = "1fb6162d-7c17-34ae-a9a7-cf56624a3204",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 15.125,
				name = "[DRK R1][OT] Dark Missionary 00:10",
				timelineIndex = 1,
				timerOffset = -4.494,
				uuid = "6370826a-b882-c735-91d7-c25768e5b43b",
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
									"94721c66-e656-9959-a1d6-8e6f87390080",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT - TBN",
							targetType = "Other Tank",
							uuid = "bb62df1d-57ff-2db7-bac9-1ed37da58465",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "94721c66-e656-9959-a1d6-8e6f87390080",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 15.125,
				name = "[DRK R1][OT] TBN 00:15",
				timelineIndex = 1,
				timerOffset = 0.543,
				uuid = "b29b8d4a-0d8a-277f-a372-54552cb76887",
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
									"cfa85100-2531-00fe-9be1-cc604ff671a3",
									true,
								},
								
								{
									"0f0b0f8f-8d76-6b98-a722-f7c5b55af9fa",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_Grit",
							name = "OT - Grit",
							uuid = "d1ac5c4e-f446-1514-960b-23064355c8a3",
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
							uuid = "cfa85100-2531-00fe-9be1-cc604ff671a3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 743,
							category = "Self",
							name = "Missing Grit",
							uuid = "0f0b0f8f-8d76-6b98-a722-f7c5b55af9fa",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 15.125,
				name = "[DRK R1][OT] Grit 00:18",
				timelineIndex = 1,
				timerOffset = 3.352,
				uuid = "43316c15-3033-d06c-9738-6453f4785b34",
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
									"193f08aa-a0c7-89a9-b1df-713124309e7b",
									true,
								},
								
								{
									"4d0c26e3-c522-ed75-959d-76387e6a6d6a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_Grit",
							name = "OT WAR-MT - Grit",
							uuid = "833546d4-c63e-1e14-a399-ab2d80b86263",
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
							uuid = "193f08aa-a0c7-89a9-b1df-713124309e7b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 743,
							category = "Self",
							name = "Missing Grit",
							uuid = "4d0c26e3-c522-ed75-959d-76387e6a6d6a",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 15.125,
				name = "[DRK R1][OT WAR-MT] Grit 00:07.323",
				timelineIndex = 1,
				timerOffset = -7.802,
				uuid = "f53cbc1a-800e-edb6-85ea-921cc760d86a",
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
									"1c8ad241-a164-9f48-8fd2-e238dd97f3d0",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT WAR-MT - Dark Missionary",
							uuid = "9f955ecb-274b-9481-be74-b4a344a90bb9",
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
							uuid = "1c8ad241-a164-9f48-8fd2-e238dd97f3d0",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 15.125,
				name = "[DRK R1][OT WAR-MT] Dark Missionary 00:13.578",
				timelineIndex = 1,
				timerOffset = -1.547,
				uuid = "3d05a145-dd1c-a38c-bb36-191501225838",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\DPS Automation",
				uuid = "7ec83582-b9d0-34cb-9c11-81a11c0b49f0",
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
				execute = "local player=TensorCore.mGetPlayer()\nif player==nil or player.job~=32 then self.used=true return end\nlocal selected=gACRSelectedProfiles and gACRSelectedProfiles[player.job] or nil\nif type(selected)~=\"string\" or _G[\"ACR_\"..selected..\"_TankStance\"]~=\"mt\" then self.used=true return end\nTensorCore.API.TensorACR.holdActionUntil(16472,Now()+2500,1)\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 15.125,
				name = "[DRK Opt][MT] Hold Living Shadow to 02:16",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 118.905,
				timerStartOffset = 104.375,
				uuid = "80530625-3d6d-0a70-aa4f-10b5566beb1e",
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
				execute = "local player=TensorCore.mGetPlayer()\nif player==nil or player.job~=32 then self.used=true return end\nlocal selected=gACRSelectedProfiles and gACRSelectedProfiles[player.job] or nil\nif type(selected)~=\"string\" or _G[\"ACR_\"..selected..\"_TankStance\"]~=\"mt\" then self.used=true return end\nTensorCore.API.TensorACR.holdActionUntil(7390,Now()+2500,1)\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 15.125,
				name = "[DRK Opt][MT] Hold Delirium to 02:20",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 123.844,
				timerStartOffset = 109.375,
				uuid = "2b911d46-4bfb-2f96-a848-96c9c8dd305f",
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
				mechanicTime = 15.125,
				name = "[DRK Opt][MT] Hold Potion to 08:20",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 482.98498535156,
				timerStartOffset = 251.875,
				uuid = "c9221632-86ad-175a-9e97-3963eea005cb",
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
				mechanicTime = 15.125,
				name = "[DRK Opt][MT] Hold Salted Earth to 06:27",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 370.12899780273,
				timerStartOffset = 354.375,
				uuid = "328e5738-34fa-a80c-8db1-3b03882cbf00",
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
				mechanicTime = 15.125,
				name = "[DRK Opt][MT] Hold Salted Earth to 08:30",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 493.00601196289,
				timerStartOffset = 458.875,
				uuid = "35561cac-2a7a-81ec-9d10-f6405c15713c",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "dac3cea9-bc9e-1955-d3bb-43f73426a299",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "6eb50d82-a804-e03d-993b-434ffcc46a46",
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
									"90c845e7-2e97-88b0-b9b5-56c925335536",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "bbd9e512-cdbe-f408-8a0b-1c77300d07bc",
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
							uuid = "90c845e7-2e97-88b0-b9b5-56c925335536",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 27.703,
				name = "[DRK R1][MT] Oblation 00:29",
				timelineIndex = 2,
				timerOffset = 2.242,
				uuid = "b46e7978-874e-1d27-90e0-f109cac21a61",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "494de210-e404-2f71-bd04-1a3e60acab90",
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
									"dc3eba26-f793-7664-bdc4-f4753e1ee698",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Oblation",
							name = "OT - Oblation",
							targetType = "Other Tank",
							uuid = "c1590082-dbc5-a16a-8759-12f5e0809408",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "dc3eba26-f793-7664-bdc4-f4753e1ee698",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 27.703,
				name = "[DRK R1][OT] Oblation 00:28",
				timelineIndex = 2,
				timerOffset = 0.574,
				uuid = "5f92d06a-6f34-5bdf-9de7-80e250b135ff",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "fbd65d52-a133-d2be-f500-5f00f30fbbc2",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "6cab22f7-9b3d-14ab-41d3-efa929a15727",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "8df03e00-3b6f-4484-62e6-7e524f7ec830",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "c8fa9915-59ec-cbe9-423b-1f6bbd4690c5",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "ac6d407e-99dd-c392-6ac7-7344712fa1ae",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "d4523fea-1613-6314-864c-b773e9c72cfd",
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
									"475b105d-8758-b41c-ad65-46b3f6f28d36",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "87d79bcb-b593-4cd3-833f-3f4d5d802de0",
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
							uuid = "475b105d-8758-b41c-ad65-46b3f6f28d36",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 45.125,
				name = "[DRK R1][MT] Dark Mind 00:47",
				timelineIndex = 7,
				timerOffset = 2.43,
				uuid = "39da7696-cd2f-66a4-98bb-780f3ed2e5b6",
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
									"6ecf6075-145c-5bed-9193-81a00a85cf27",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "d7ad3cca-1caf-52bd-aec4-e3037102a499",
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
							uuid = "6ecf6075-145c-5bed-9193-81a00a85cf27",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 45.125,
				name = "[DRK R1][MT] Oblation 00:48",
				timelineIndex = 7,
				timerOffset = 3.188,
				uuid = "1659a07a-3a55-e773-87a5-afe9dd066eed",
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
									"45450102-3e30-52ec-89c3-41d37ce82766",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "4a989bfc-9b86-16a3-8474-de67bead80d0",
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
							uuid = "45450102-3e30-52ec-89c3-41d37ce82766",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 45.125,
				name = "[DRK R1][MT] Dark Missionary 00:50",
				timelineIndex = 7,
				timerOffset = 4.928,
				uuid = "4a6ab565-1453-14f2-a642-982237c68974",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "defd2a55-9717-40e5-b61f-a18c73dac79b",
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
									"29e1fea7-d9b4-040c-82b1-8d8ae304f24b",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ProvokeMouse",
							name = "OT - Provoke",
							targetName = "Lindwurm",
							targetType = "Named Target",
							uuid = "caa05540-a732-fc03-8e89-0ce4b0b3f4a1",
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
							uuid = "29e1fea7-d9b4-040c-82b1-8d8ae304f24b",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 45.125,
				name = "[DRK R1][OT] Provoke 00:43",
				timelineIndex = 7,
				timerOffset = -1.62399995327,
				uuid = "8337a69d-c5b3-9a8e-8958-e4ee42e364a9",
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
									"784b8a6a-3fe8-518b-89a2-2b3fbed0c2f7",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "OT - Rampart",
							uuid = "8aafcb8b-ba28-b7a6-8fa3-10f3e182719d",
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
							uuid = "784b8a6a-3fe8-518b-89a2-2b3fbed0c2f7",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 45.125,
				name = "[DRK R1][OT] Rampart 00:45",
				timelineIndex = 7,
				timerOffset = 0.69400000572205,
				uuid = "e1366e01-ce78-2cb1-a2f7-a53e6214dc4b",
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
									"504ec743-bc3b-b159-ae0a-512acbce5207",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "OT - Dark Mind",
							uuid = "3bcf27cb-0d06-99d0-9bdc-c61559fb7893",
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
							uuid = "504ec743-bc3b-b159-ae0a-512acbce5207",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 45.125,
				name = "[DRK R1][OT] Dark Mind 00:48",
				timelineIndex = 7,
				timerOffset = 3.5929999351501,
				uuid = "291a4be6-42b1-43e1-90ed-d8b7d2a9f2d7",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "e4d7b2a3-7b92-5cef-d76f-218d796e6c13",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "9f74bac0-c633-f75e-893b-076737670ef2",
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
									"ecd52621-2068-c85e-98d3-380e38fd5606",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "5b09eeb2-99d0-9802-bc3b-62bb089734b6",
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
							uuid = "ecd52621-2068-c85e-98d3-380e38fd5606",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 60.485,
				name = "[DRK R1][MT] The Blackest Night 00:57",
				timelineIndex = 8,
				timerOffset = -2.9470000267029,
				uuid = "cc8bd13d-98e5-f36b-b959-e44dd19d3c66",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "5a3e3575-d012-78f1-b8a0-51e41cc27f0e",
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
									"2935598a-8b5d-b093-a535-3e0653573583",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "OT - TBN",
							uuid = "d48cc037-471e-366d-9d70-7408621a3d2b",
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
							uuid = "2935598a-8b5d-b093-a535-3e0653573583",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 60.485,
				name = "[DRK R1][OT] TBN 00:53",
				timelineIndex = 8,
				timerOffset = -7.098,
				uuid = "4423f9fb-b974-bf71-988b-2d1d3cdd456c",
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
									"f07a7c14-d0e8-6f13-a8ed-d5f312435ef0",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "OT - Reprisal",
							uuid = "b61c1485-28ac-16ae-8876-b1451f383e2a",
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
							uuid = "f07a7c14-d0e8-6f13-a8ed-d5f312435ef0",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 60.485,
				name = "[DRK R1][OT] Reprisal 00:56",
				timelineIndex = 8,
				timerOffset = -4.032,
				uuid = "5c075dbe-e620-f94b-bdc9-a7ce19d14b27",
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
									"34926503-bc2e-7672-baa1-c4c7a207640c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "OT WAR-MT - Reprisal",
							uuid = "0e993601-4028-c553-a1a8-ea64352627f8",
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
							uuid = "34926503-bc2e-7672-baa1-c4c7a207640c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 60.485,
				name = "[DRK R1][OT WAR-MT] Reprisal 00:53.870",
				timelineIndex = 8,
				timerOffset = -6.615,
				uuid = "ca65344a-13c4-c375-bc0f-660eac6df7a7",
				version = 2,
			},
		},
	}, 
	[11] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "2708364a-b316-7a1d-956e-13a851811c99",
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
									"263da4b3-7a17-03b4-9183-53872e26548c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "MT - Living Dead",
							uuid = "8a9cf652-a4a3-043d-9894-3bd8d36556da",
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
							uuid = "263da4b3-7a17-03b4-9183-53872e26548c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 61.782,
				name = "[DRK R1][MT] Living Dead 01:05",
				timelineIndex = 11,
				timerOffset = 3.2960000038147,
				uuid = "d6596ca6-33da-a0ab-bd90-a7e2de54d4c5",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "e39427e4-e438-3c81-9a60-3539d3cc069a",
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
									"2d359db5-1796-b525-9be2-a63443326ae3",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT WAR-MT - TBN WAR",
							targetType = "Other Tank",
							uuid = "5b3a4a23-2e6d-8173-bce2-7e95e227031f",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "2d359db5-1796-b525-9be2-a63443326ae3",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 61.782,
				name = "[DRK R1][OT WAR-MT] TBN Other Tank 01:05.124",
				timelineIndex = 11,
				timerOffset = 3.342,
				uuid = "432f02e9-211b-d83e-a87d-8d09c2bb8e38",
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
				name = "Rank 1\\OT",
				uuid = "1a6a723f-c56c-6c4c-bdc0-1dc5ddba512f",
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
									"3d0e3495-516e-66a2-a566-1a244afd1081",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "OT - Living Dead",
							uuid = "d1a79841-b823-910c-87f2-c85a3351ee93",
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
							uuid = "3d0e3495-516e-66a2-a566-1a244afd1081",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 69.266,
				name = "[DRK R1][OT] Living Dead 01:06",
				timelineIndex = 12,
				timerOffset = -2.6749999523163,
				uuid = "d2a29781-ef90-1470-9d01-0d8d222019e1",
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
									"ee788f4d-5d95-8166-967e-abb1123d7d2d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "OT WAR-MT - Rampart",
							uuid = "06be602d-0811-4a22-a83e-157d12c1462c",
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
							uuid = "ee788f4d-5d95-8166-967e-abb1123d7d2d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 69.266,
				name = "[DRK R1][OT WAR-MT] Rampart 01:07.763",
				timelineIndex = 12,
				timerOffset = -1.503,
				uuid = "ecec85b4-533d-8cc6-a16c-e19e93e3de4d",
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
									"1bdcdbbe-aab1-e3b9-9c4c-af20cd307cf0",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "OT WAR-MT - Shadowed Vigil",
							uuid = "9b80d28f-78be-9b9d-a2ad-5c61f5e51434",
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
							uuid = "1bdcdbbe-aab1-e3b9-9c4c-af20cd307cf0",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 69.266,
				name = "[DRK R1][OT WAR-MT] Shadowed Vigil 01:09.375",
				timelineIndex = 12,
				timerOffset = 0.109,
				uuid = "9cef4890-7fcf-85b0-9b0e-251fa0a5c6e0",
				version = 2,
			},
		},
	},
	[13] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "ae3d4f5b-f526-3d2f-c177-b035b014350b",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "e4ab4c11-2bca-240d-9732-9f2e2df4fd5b",
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
									"9b40d135-8bd1-1188-bb17-fe8fd0d67a3c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT - TBN",
							targetType = "Other Tank",
							uuid = "9d506253-dbd9-484b-a40b-fbf91327da30",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "9b40d135-8bd1-1188-bb17-fe8fd0d67a3c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 69.922,
				name = "[DRK R1][OT] TBN 01:11",
				timelineIndex = 13,
				timerOffset = 1.333,
				uuid = "3088dd79-bdc5-a91f-b674-a23e31764cc5",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "0d630705-c153-b0e1-5a12-cf8b177915b5",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "71fa4094-d429-2fa4-afae-20b4c8ffebd0",
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
									"516a8c0a-329d-8a2f-b506-e054e1202797",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "fac8b53f-f5d6-f6c9-9c12-27a0c2aab0eb",
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
							uuid = "516a8c0a-329d-8a2f-b506-e054e1202797",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 76.922,
				name = "[DRK R1][MT] The Blackest Night 01:20",
				timelineIndex = 15,
				timerOffset = 3.179,
				uuid = "926d6bbd-2b12-eebe-ae54-55aae99d3de3",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "a8cc7c23-1774-ccdc-97b4-2bcf04ca0d39",
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
									"d5d61aab-91a9-9f6a-8554-4e8a55164d43",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ShirkMouse",
							name = "OT - Shirk",
							targetType = "Other Tank",
							uuid = "1e9a0106-3bef-7d9a-a05e-934dc25027f3",
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
							uuid = "d5d61aab-91a9-9f6a-8554-4e8a55164d43",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 76.922,
				name = "[DRK R1][OT] Shirk 01:19",
				timelineIndex = 15,
				timerOffset = 2.6,
				uuid = "b01e6a81-0cb2-0951-8f95-aa5bf22f8ffa",
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
									"f6d8a96d-88d4-8d2d-8fdd-8aaf78bab10e",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT WAR-MT - TBN WAR",
							targetType = "Other Tank",
							uuid = "290f9462-fbcb-ac56-b8a1-2c6d28bad22a",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "f6d8a96d-88d4-8d2d-8fdd-8aaf78bab10e",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 76.922,
				name = "[DRK R1][OT WAR-MT] TBN Other Tank 01:20.590",
				timelineIndex = 15,
				timerOffset = 3.668,
				uuid = "03cc3399-9904-6c0f-b685-fee87c43dc05",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "a285d570-399d-f39c-e1df-9ef26e5d4aa0",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "9bd620f8-d736-8852-81de-729430a987bf",
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
									"d9c445ed-3f1b-fc1b-ad7a-555f9833625b",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "MT - Shadowed Vigil",
							uuid = "6d31b7a3-bcc1-873f-91c9-93d7f107710b",
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
							uuid = "d9c445ed-3f1b-fc1b-ad7a-555f9833625b",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 91.141,
				name = "[DRK R1][MT] Shadowed Vigil 01:32",
				timelineIndex = 16,
				timerOffset = 1.365,
				uuid = "e6b67534-59bb-da34-8689-ee17be8e70fb",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "90d1fa5e-1d9a-433f-b31e-0a39e7a5ce6b",
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
									"98560a93-9c9a-30aa-af2b-f8d0520652bb",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT - TBN",
							targetType = "Other Tank",
							uuid = "5802cc52-2e37-9fe7-84b2-29c4eea651bf",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "98560a93-9c9a-30aa-af2b-f8d0520652bb",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 91.141,
				name = "[DRK R1][OT] TBN 01:31",
				timelineIndex = 16,
				timerOffset = 0.26,
				uuid = "ebe69170-8428-030d-ac4a-0f84e1ec1ddf",
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
									"230f55a5-5dcf-e71f-ac7e-00c17e5e400a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Oblation",
							name = "OT - Oblation",
							targetType = "Other Tank",
							uuid = "69c199b7-b228-ee3e-b27a-837cd1c74e3d",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "230f55a5-5dcf-e71f-ac7e-00c17e5e400a",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 91.141,
				name = "[DRK R1][OT] Oblation 01:36",
				timelineIndex = 16,
				timerOffset = 5.106,
				uuid = "b1dd642a-b398-b055-8c1d-b06dc00dc93c",
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
									"5e596ed1-6375-4969-b246-db60910b451a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT WAR-MT - TBN WAR",
							targetType = "Other Tank",
							uuid = "afb5bcee-e1f4-2d01-86f8-5e7f7f148fd2",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "5e596ed1-6375-4969-b246-db60910b451a",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 91.141,
				name = "[DRK R1][OT WAR-MT] TBN Other Tank 01:36.009",
				timelineIndex = 16,
				timerOffset = 4.868,
				uuid = "2220d7a2-949b-a548-8e81-da53183b3ca2",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "075e9967-ba67-1623-0795-fcc970db8b17",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "e6637da7-cbcb-63bd-a665-e83b4e1152e6",
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
									"4ff0c41c-dda7-7bb0-ad7a-3df51bf762cb",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "82eb626a-da9a-d9c3-aaf8-d52e1ba99800",
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
							uuid = "4ff0c41c-dda7-7bb0-ad7a-3df51bf762cb",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 105.313,
				name = "[DRK R1][MT] The Blackest Night 01:45",
				timelineIndex = 17,
				timerOffset = 0.353,
				uuid = "2e535921-21e2-cdf5-9dca-b087242e5e09",
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
									"d6198269-6fdf-9544-9591-643411f54c62",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "cf5ab53a-e8f5-2794-9606-b380efb5ad8e",
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
							uuid = "d6198269-6fdf-9544-9591-643411f54c62",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 105.313,
				name = "[DRK R1][MT] Dark Mind 01:52",
				timelineIndex = 17,
				timerOffset = 7.334,
				uuid = "ca33ee10-8994-e57e-9949-c3b9622b7f36",
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
									"b736f56e-610c-fec1-9a06-7fe75248cf27",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "70d7753a-b744-b9dc-9fe3-5950900a9626",
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
							uuid = "b736f56e-610c-fec1-9a06-7fe75248cf27",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 105.313,
				name = "[DRK R1][MT] Oblation 01:53",
				timelineIndex = 17,
				timerOffset = 8.046,
				uuid = "ee3d17b0-a20e-6d71-805c-449823be7292",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "aaa0efd0-3919-ddd3-bbc3-ae871f0ece51",
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
									"1b1df9e3-7515-181c-89ff-9f1b9ec4859b",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT - TBN",
							targetType = "Other Tank",
							uuid = "56a625b0-16d9-077a-ac50-b2c537d2d2e5",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "1b1df9e3-7515-181c-89ff-9f1b9ec4859b",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 105.313,
				name = "[DRK R1][OT] TBN 01:56",
				timelineIndex = 17,
				timerOffset = 10.985,
				uuid = "21c5865a-1b85-fcb9-8036-a9ad91f77876",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "913e80da-81fc-a3fe-9c35-2d187b56d58a",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "b5581229-0dbb-d59d-8e21-20d7313dcd66",
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
									"0aa41a19-4b9d-19e8-bde5-9597fa57a1fd",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "3c13a51f-4a14-86ac-8fb9-9218cf2e7456",
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
							uuid = "0aa41a19-4b9d-19e8-bde5-9597fa57a1fd",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 127.626,
				name = "[DRK R1][MT] Reprisal 02:03",
				timelineIndex = 18,
				timerOffset = -4.562,
				uuid = "d00377d4-5733-6f52-809a-d7b80255c722",
				version = 2,
			},
		},
	},
	[19] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "e99bbed1-9e89-fc95-dbf8-e44f21f3ea81",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[20] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "d7503511-4846-c4c5-60ff-a17bb4f34ec1",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[21] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "7ccdd51a-fc2f-d5ae-36d7-f1547bdfabca",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[22] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "68050093-b4a1-8b27-d6e2-ff79871a5f03",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[24] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "9f48433d-bf26-d699-bcd6-8f075a5426ed",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[26] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "8376a0df-0a55-d61b-142d-ac25aeba110f",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "7b86e03d-5ba0-b5b8-ae26-09519a461f98",
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
									"b6ca78c5-595c-536e-ae6c-d97e19fcdf48",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Oblation",
							name = "OT - Oblation",
							targetType = "Other Tank",
							uuid = "695d7bc7-eef9-6900-9ae9-559cc097acf7",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "b6ca78c5-595c-536e-ae6c-d97e19fcdf48",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 151.063,
				name = "[DRK R1][OT] Oblation 02:26",
				timelineIndex = 26,
				timerOffset = -4.518,
				uuid = "840d21ea-5c2e-0bff-a640-83f9f3816a4b",
				version = 2,
			},
		},
	},
	[27] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "162677e8-fc29-45f4-b72d-6a8e32e917d8",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "fe0e894a-00db-7f7f-b13b-0229466cb207",
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
									"4d35cf1c-0992-d0d3-a7ec-53b59fad0b25",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "606863cf-c769-5329-a30e-2af2d80268b1",
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
							uuid = "4d35cf1c-0992-d0d3-a7ec-53b59fad0b25",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 159.172,
				name = "[DRK R1][MT] Dark Missionary 02:36",
				timelineIndex = 27,
				timerOffset = -3.145,
				uuid = "b25a9026-46d1-4036-a06a-7117676a14cc",
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
									"763614cc-2f39-53cb-a342-90dd52ce671d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "0fa83fa5-3042-8045-a5dc-4d9502801e4f",
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
							uuid = "763614cc-2f39-53cb-a342-90dd52ce671d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 159.172,
				name = "[DRK R1][MT] Oblation 02:36",
				timelineIndex = 27,
				timerOffset = -2.433,
				uuid = "67cf61b9-1842-8818-9d46-7f8248f5ea1e",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "2c0821a3-5b87-190a-812b-f568d13cd92d",
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
									"e98e1e2a-2eb8-11f9-94e7-08f0b2f7d5de",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "OT - Reprisal",
							uuid = "cf40a94f-ac00-ecde-a487-d6b5ad4803ea",
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
							uuid = "e98e1e2a-2eb8-11f9-94e7-08f0b2f7d5de",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 159.172,
				name = "[DRK R1][OT] Reprisal 02:36",
				timelineIndex = 27,
				timerOffset = -2.705,
				uuid = "7dd77223-858c-558a-beab-8cc7a6682052",
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
									"bce60642-1ed1-98a1-969b-d65a56d8e509",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT - Dark Missionary",
							uuid = "d0cc003d-3efb-cb48-b93c-8e7291974da8",
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
							uuid = "bce60642-1ed1-98a1-969b-d65a56d8e509",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 159.172,
				name = "[DRK R1][OT] Dark Missionary 02:37",
				timelineIndex = 27,
				timerOffset = -1.77,
				uuid = "4b896f22-419b-b3fe-933a-f7ab83cb3d0f",
				version = 2,
			},
		},
	},
	[28] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "22bd3719-3bb1-e2bd-864e-f1f3b5157489",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[30] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "7be32e0a-24ac-9e43-87b7-a72034e25062",
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
									"172eb6d6-a731-1adc-aa0f-a88d3732995d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Oblation",
							name = "OT - Oblation",
							targetType = "Other Tank",
							uuid = "758f531a-1852-7833-aba0-b80203055be3",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "172eb6d6-a731-1adc-aa0f-a88d3732995d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 163.11,
				name = "[DRK R1][OT] Oblation 02:42",
				timelineIndex = 30,
				timerOffset = -0.856,
				uuid = "7c0191d9-44f4-332c-a2c7-f4294fe54a03",
				version = 2,
			},
		},
	},
	[34] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "9fc87858-7431-6624-39de-de2a32aeab08",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[38] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "d7c7c6a4-3c32-17d8-3757-d23ef9a6df14",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "f0c713ce-cd77-6b3e-87db-f79e9337434f",
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
									"fa02c2ea-ddca-c1e7-b44c-c2966c866172",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ProvokeMouse",
							name = "OT - Provoke",
							targetName = "Lindwurm",
							targetType = "Named Target",
							uuid = "43bd357e-11a8-4e96-bd64-1ba635849c40",
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
							uuid = "fa02c2ea-ddca-c1e7-b44c-c2966c866172",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 183.547,
				name = "[DRK R1][OT] Provoke 03:06",
				timelineIndex = 38,
				timerOffset = 3.012,
				uuid = "2fec7b73-5529-f8d4-8c7b-ff94a98f4017",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "8d2d0bcb-b803-110f-52c2-18d5fd84183b",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "914b46b3-d235-f7fd-b340-57401638a815",
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
									"d5a039a3-a27e-fd09-82f9-3f9b4ac13941",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "a8381ed9-3a30-331d-b444-8691ab2b5641",
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
							uuid = "d5a039a3-a27e-fd09-82f9-3f9b4ac13941",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 189.813,
				name = "[DRK R1][MT] Rampart 03:14",
				timelineIndex = 39,
				timerOffset = 4.571,
				uuid = "f4a1175d-f19e-02bf-842a-eb103abad1ee",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "7d945cac-15c8-ef0c-aace-476b70266b9e",
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
									"41115e72-4017-39f2-baf5-0a235050c096",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "OT - Shadowed Vigil",
							uuid = "d15d3529-5a11-ffa0-abc9-f2a0465c407c",
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
							uuid = "41115e72-4017-39f2-baf5-0a235050c096",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 189.813,
				name = "[DRK R1][OT] Shadowed Vigil 03:11",
				timelineIndex = 39,
				timerOffset = 1.872,
				uuid = "479e5c93-708c-6a5d-8dd5-a8568f18cef9",
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
									"82206ab0-a98a-0510-9f5f-969c1c2f9314",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT WAR-MT - TBN WAR",
							targetType = "Other Tank",
							uuid = "73c741fa-14ba-f738-a56e-06e5e6fc953c",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "82206ab0-a98a-0510-9f5f-969c1c2f9314",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 189.813,
				name = "[DRK R1][OT WAR-MT] TBN Other Tank 03:15.401",
				timelineIndex = 39,
				timerOffset = 5.588,
				uuid = "24587235-2331-d594-a768-886157442b19",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "229bae7b-9e12-8237-15b4-2811861dc0ab",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "1c39a83e-a079-d125-bcb9-d0828e713752",
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
									"84e56229-1b0a-1a9d-b96a-2975ff215bd0",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "a076a767-f135-243e-a46c-440f90278e54",
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
							uuid = "84e56229-1b0a-1a9d-b96a-2975ff215bd0",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 202.454,
				name = "[DRK R1][MT] Dark Mind 03:16",
				timelineIndex = 40,
				timerOffset = -5.753,
				uuid = "bb5654b2-1dce-83f9-87f0-09225b1f1e49",
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
									"2ffccdf9-eaad-ef77-9d81-24bd5f080e94",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "33280d88-95aa-b736-b55d-99e811166e49",
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
							uuid = "2ffccdf9-eaad-ef77-9d81-24bd5f080e94",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 202.454,
				name = "[DRK R1][MT] The Blackest Night 03:18",
				timelineIndex = 40,
				timerOffset = -3.794,
				uuid = "dccfbb73-5ba7-5478-a2d8-9a95665c649c",
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
									"e4aa451e-bbb3-5606-9b85-0c37cf220820",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ShirkMouse",
							name = "MT - Shirk",
							targetType = "Other Tank",
							uuid = "ea8788ba-e563-2a0f-97be-9c0630c989b5",
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
							uuid = "e4aa451e-bbb3-5606-9b85-0c37cf220820",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 202.454,
				name = "[DRK R1][MT] Shirk 03:24",
				timelineIndex = 40,
				timerOffset = 2.486,
				uuid = "c7f774d7-814c-e835-bd18-0088382f40f2",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "c783e091-3783-268e-9959-550dbd4e6bb2",
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
									"08d4722f-1edc-65fd-a141-44d205c0f8cb",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "OT - TBN",
							uuid = "1b944083-f73c-074b-97c6-e63766dcac23",
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
							uuid = "08d4722f-1edc-65fd-a141-44d205c0f8cb",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 202.454,
				name = "[DRK R1][OT] TBN 03:20",
				timelineIndex = 40,
				timerOffset = -2.453,
				uuid = "c0c2d468-23cd-625c-8c92-589af8b27ff6",
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
									"5caaeb37-679b-1550-8444-9c4aa029783d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ShirkMouse",
							name = "OT - Shirk",
							targetType = "Other Tank",
							uuid = "6d0ba35d-16d3-31d0-af0f-85431f6a26d1",
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
							uuid = "5caaeb37-679b-1550-8444-9c4aa029783d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 202.454,
				name = "[DRK R1][OT] Shirk 03:22",
				timelineIndex = 40,
				timerOffset = 0.306,
				uuid = "e28076b6-87a5-c26d-8214-9f26c3fde6be",
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
									"8cd3b054-6979-c41d-ba61-139d5ce40626",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Oblation",
							name = "OT WAR-MT - Oblation WAR",
							targetType = "Other Tank",
							uuid = "04808e9c-9317-93b2-9168-3a2e8a53b1f1",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "8cd3b054-6979-c41d-ba61-139d5ce40626",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 202.454,
				name = "[DRK R1][OT WAR-MT] Oblation Other Tank 03:16.874",
				timelineIndex = 40,
				timerOffset = -5.58,
				uuid = "2ad4d320-7f85-7bba-97fc-a3c643643b81",
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
									"ca59d7ca-361f-b696-9160-a4fad954301a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ProvokeMouse",
							name = "OT WAR-MT - Provoke Lindwurm",
							targetName = "Lindwurm",
							targetType = "Named Target",
							uuid = "bb69194d-e58b-b5c7-8f8a-c4aef75d6795",
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
							uuid = "ca59d7ca-361f-b696-9160-a4fad954301a",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 202.454,
				name = "[DRK R1][OT WAR-MT] Provoke 03:23.073",
				timelineIndex = 40,
				timerOffset = 0.619,
				uuid = "ec20667c-314d-aa8e-9e0d-14d0da357798",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "f873fe54-8de3-f640-bb31-c81a264ff084",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
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
				uuid = "7e811a35-5f1f-7d62-82d8-6dc8b96fee4f",
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
									"b04edab6-9ee5-85ca-8d59-d1977e8c8fed",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT - TBN",
							targetType = "Other Tank",
							uuid = "3128ce19-098e-6978-b76a-aef6170854c6",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "b04edab6-9ee5-85ca-8d59-d1977e8c8fed",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 218.735,
				name = "[DRK R1][OT] TBN 03:38",
				timelineIndex = 42,
				timerOffset = -0.454,
				uuid = "95626b14-2b6b-df8d-be2c-949dafe51818",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "2579cd22-96a2-37be-3677-8b0c84be6f92",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[44] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "7e729c07-90ab-79ab-ddac-363d9384c937",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "253ae87a-2f21-4132-9136-06fd57fa097b",
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
									"9bf73168-e140-77d9-a03e-499d4f77875c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "15899005-111b-6c3e-86c0-f6d714b6ca99",
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
							uuid = "9bf73168-e140-77d9-a03e-499d4f77875c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 228.219,
				name = "[DRK R1][MT] Reprisal 03:47",
				timelineIndex = 44,
				timerOffset = -0.931,
				uuid = "32bbf63c-447e-166f-9ee0-fe95ce0451cb",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "e0122e8c-103a-623f-a456-cedddcc1197d",
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
									"d20f44bb-231d-eaf7-af3b-f39705ca2da1",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "OT - Reprisal",
							uuid = "d9fd34fe-07c2-0acf-91b0-cc91196e8fa0",
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
							uuid = "d20f44bb-231d-eaf7-af3b-f39705ca2da1",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 228.219,
				name = "[DRK R1][OT] Reprisal 03:47",
				timelineIndex = 44,
				timerOffset = -0.642,
				uuid = "11d872b8-5683-b6c0-bd01-2d6c5c9d8722",
				version = 2,
			},
		},
	},
	[45] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "e651c110-30dd-a984-3453-f40683563d40",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[47] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "78c9778e-8f4c-2892-548a-6ae88c147ebe",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "3a030243-3e17-0d76-a891-b14168ac9e31",
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
									"286fb2ee-2198-3218-901e-f06e00ee61a4",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "OT - Rampart",
							uuid = "8617344e-9de7-0234-ab3e-cdcc824df64d",
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
							uuid = "286fb2ee-2198-3218-901e-f06e00ee61a4",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 236.36,
				name = "[DRK R1][OT] Rampart 04:00",
				timelineIndex = 47,
				timerOffset = 3.779,
				uuid = "67c8605c-0cba-a02e-bdf4-96f362ec1e38",
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
									"a19bbe27-aff9-4e05-a105-939b1e762ef5",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "OT WAR-MT - Reprisal",
							uuid = "138a7b59-ddf5-bfd2-ae66-eb3d245c3735",
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
							uuid = "a19bbe27-aff9-4e05-a105-939b1e762ef5",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 236.36,
				name = "[DRK R1][OT WAR-MT] Reprisal 03:55.140",
				timelineIndex = 47,
				timerOffset = -1.22,
				uuid = "93bfc71f-7a7c-59ce-9918-188cb7ebcdfc",
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
				name = "Rank 1\\MT",
				uuid = "91623d4d-38a7-6262-90e8-c20b0db227ad",
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
									"04405837-f507-7ede-aedf-3dcbff4f496c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "MT - Shadowed Vigil",
							uuid = "3440f58f-97df-68ed-8ae1-244631ad14fc",
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
							uuid = "04405837-f507-7ede-aedf-3dcbff4f496c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 245.61,
				name = "[DRK R1][MT] Shadowed Vigil 04:02",
				timelineIndex = 48,
				timerOffset = -3.354,
				uuid = "8394af11-f261-2cd6-bc9b-dc4578ee7c26",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "8a9ba6c2-a9b1-22eb-9775-b59826fe896a",
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
									"4624af61-b5b0-861c-b21d-a1dbd0bc1b93",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "OT - Oblation",
							uuid = "67cffbf6-db7f-6797-8443-27ffb1e6581a",
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
							uuid = "4624af61-b5b0-861c-b21d-a1dbd0bc1b93",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 245.61,
				name = "[DRK R1][OT] Oblation 04:05",
				timelineIndex = 48,
				timerOffset = 0.183,
				uuid = "f6241262-c97f-519d-aee6-9375002d5530",
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
									"2bd2a89c-5d9d-d570-a92b-8b9ca0e79caa",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "OT WAR-MT - TBN Self",
							uuid = "cc526773-aaca-9bc8-8237-887c30cb0beb",
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
							uuid = "2bd2a89c-5d9d-d570-a92b-8b9ca0e79caa",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 245.61,
				name = "[DRK R1][OT WAR-MT] TBN Self 04:01.806",
				timelineIndex = 48,
				timerOffset = -3.804,
				uuid = "5fb7b5b5-7e37-84ef-a5c5-b9d3c22f80f9",
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
									"04c63c12-3ab2-82d7-9bc8-a60bddaa3f42",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "OT WAR-MT - Living Dead",
							uuid = "b3607805-531e-60ca-b02d-53458ea63d3d",
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
							uuid = "04c63c12-3ab2-82d7-9bc8-a60bddaa3f42",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 245.61,
				name = "[DRK R1][OT WAR-MT] Living Dead 04:04.934",
				timelineIndex = 48,
				timerOffset = -0.676,
				uuid = "4b4e0d34-97fe-13b2-8d95-701aa9c92f06",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "f37e2bec-e0a8-bb38-200a-4342764f225c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "77da13eb-1394-01e8-bef8-de4f4d452fe7",
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
									"115450f5-c531-06cd-b800-051e203db550",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "4af926a5-e456-d07d-8d96-fbd87b0ba09a",
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
							uuid = "115450f5-c531-06cd-b800-051e203db550",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 246.141,
				name = "[DRK R1][MT] The Blackest Night 04:07",
				timelineIndex = 49,
				timerOffset = 1.023,
				uuid = "f75e2645-c713-54bc-98f9-aaf86fb32152",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "a4a47ca9-ec40-188f-aa1a-424df58af325",
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
									"899029db-a355-e84b-b896-d2707a30cdfa",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "OT - Dark Mind",
							uuid = "c6196d4a-e7fb-93eb-8720-7c1f24492585",
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
							uuid = "899029db-a355-e84b-b896-d2707a30cdfa",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 246.141,
				name = "[DRK R1][OT] Dark Mind 04:07",
				timelineIndex = 49,
				timerOffset = 1.518,
				uuid = "946aedc7-c7e2-ca2a-9ad3-0c3022ce3728",
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
				name = "Rank 1\\OT",
				uuid = "86297ee3-ef9b-43c5-9965-ded87fcc3130",
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
									"1d80dc48-6a2f-10db-af1b-11287754040c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "OT - TBN",
							uuid = "a69e1fc1-62d4-afaf-97bf-a2b9d577ab57",
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
							uuid = "1d80dc48-6a2f-10db-af1b-11287754040c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 250.751,
				name = "[DRK R1][OT] TBN 04:10",
				timelineIndex = 50,
				timerOffset = -0.602,
				uuid = "9797d4c3-dbc3-a027-9061-5f4e1e196bcd",
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
									"cbf97b5b-1f4b-e1a2-9735-9ca8137a8293",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ShirkMouse",
							name = "OT WAR-MT - Shirk WAR",
							targetType = "Other Tank",
							uuid = "ab72f583-14ae-9cbb-987c-ce9c584008a1",
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
							uuid = "cbf97b5b-1f4b-e1a2-9735-9ca8137a8293",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 250.751,
				name = "[DRK R1][OT WAR-MT] Shirk 04:10.656",
				timelineIndex = 50,
				timerOffset = -0.095,
				uuid = "67e12537-b8ec-f278-98ef-4fbbcd625c60",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "56a4134d-c06b-8f99-325d-b2833268e2bd",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "c79083b4-7bf9-384b-aede-230f3b585662",
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
									"7c9c4cf0-16a3-63cc-bcad-c5926c60fc54",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_Provoke",
							name = "MT - Provoke",
							uuid = "a848b0d2-eebc-bfc5-bf62-cc1f318fc9a4",
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
							uuid = "7c9c4cf0-16a3-63cc-bcad-c5926c60fc54",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 253.204,
				name = "[DRK R1][MT] Provoke 04:19",
				timelineIndex = 51,
				timerOffset = 6.665,
				uuid = "3e05b4fe-9c4a-36e6-8b0a-9c52c95691f4",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "d78ab90d-0814-eb93-97ed-8a8d6fdbfe02",
			},
			objectType = "folder",
		},
	},
	[52] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "42fa62b8-fd6d-fef4-2722-ff4aa9471768",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "2b715946-7206-c238-844d-50c4a7b5811b",
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
									"844482fe-bbfe-c5e0-923b-06c1d06b1687",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT - Dark Missionary",
							uuid = "5b7e714a-152d-1b8d-a50a-2529be6d8b21",
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
							uuid = "844482fe-bbfe-c5e0-923b-06c1d06b1687",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 269.422,
				name = "[DRK R1][OT] Dark Missionary 04:25",
				timelineIndex = 52,
				timerOffset = -4.288,
				uuid = "6f112c83-03d4-babf-b278-2d66b765d03e",
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
									"07e651da-3583-7454-8bf0-a15f93037ed2",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT WAR-MT - Dark Missionary",
							uuid = "f7726196-2831-ce73-a23d-e1f5627813fa",
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
							uuid = "07e651da-3583-7454-8bf0-a15f93037ed2",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 269.422,
				name = "[DRK R1][OT WAR-MT] Dark Missionary 04:29.731",
				timelineIndex = 52,
				timerOffset = 0.309,
				uuid = "7271e016-c554-d835-918e-89965f8fa629",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "d352696f-0b9a-8f1b-6036-a2411697405f",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "6f2349c6-d42c-cbc6-821b-3523fa65a5e6",
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
									"5164d3fa-ac3d-4630-9287-23c289d786e0",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Oblation",
							name = "OT - Oblation",
							targetType = "Other Tank",
							uuid = "60d04d10-4f5c-12c8-b5c1-b72d8f0836b4",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "5164d3fa-ac3d-4630-9287-23c289d786e0",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 275.563,
				name = "[DRK R1][OT] Oblation 04:40",
				timelineIndex = 53,
				timerOffset = 5.083,
				uuid = "1258ae5a-57ec-1f0b-9932-05139943f80f",
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
				name = "Rank 1\\MT",
				uuid = "ff93eed5-904c-79ab-8e2e-84b9b542d2c9",
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
									"db1e154f-c663-ead5-b063-e8e8416e8881",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "1114f0b7-3102-9523-b30a-37c6270f573e",
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
							uuid = "db1e154f-c663-ead5-b063-e8e8416e8881",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 296.891,
				name = "[DRK R1][MT] Rampart 04:57",
				timelineIndex = 55,
				timerOffset = 0.42,
				uuid = "ee006903-5c26-3ea5-b8ec-b0dda0af9561",
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
									"fcab6096-59b6-383b-819b-536945ea4992",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "c4e15147-08f2-0e75-b779-e0f366ec52a1",
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
							uuid = "fcab6096-59b6-383b-819b-536945ea4992",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 296.891,
				name = "[DRK R1][MT] The Blackest Night 04:58",
				timelineIndex = 55,
				timerOffset = 1.132,
				uuid = "04547614-8d51-632e-9a8c-2ec63f5f5f18",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "66fca56e-d876-dd5f-93a0-46328ce2dc21",
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
									"3a38942a-ef0a-8cd9-87b3-bef124d73974",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT - TBN",
							targetType = "Other Tank",
							uuid = "27131d38-56bb-2ddd-a768-7b1ce8e5ffec",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "3a38942a-ef0a-8cd9-87b3-bef124d73974",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 296.891,
				name = "[DRK R1][OT] TBN 04:56",
				timelineIndex = 55,
				timerOffset = -0.888,
				uuid = "d989f407-e7cc-327b-94e9-652a9496e107",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "81074f63-b5e6-4427-0597-7a6dfb25a013",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "42cc6014-9e94-1b14-911c-8c8710ce39ac",
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
									"e4ca386e-fd2e-adb2-b094-5c45705fc024",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT - TBN",
							targetType = "Other Tank",
							uuid = "59c915ac-436b-e19e-9182-6e9d6d2b5644",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "e4ca386e-fd2e-adb2-b094-5c45705fc024",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 310.36,
				name = "[DRK R1][OT] TBN 05:11",
				timelineIndex = 57,
				timerOffset = 0.886,
				uuid = "f5857dad-f376-4235-a663-97a75824c932",
				version = 2,
			},
		},
	},
	[58] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "f8f3df3e-1a7c-2d9a-162b-b9a4f2e6d5ae",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "98cba1f1-d078-0467-b455-08b009c11836",
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
									"c33e9818-50f2-65d8-b716-b63e789ead6d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "416869cd-8458-71a0-800d-53228d80cb85",
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
							uuid = "c33e9818-50f2-65d8-b716-b63e789ead6d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 315.407,
				name = "[DRK R1][MT] The Blackest Night 05:15",
				timelineIndex = 58,
				timerOffset = 0.27,
				uuid = "93785249-5f60-5ae4-8d36-696b8d865746",
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
									"10e1b234-96e6-8063-b41d-8bb3b042b705",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "0bf23aef-cbb3-0964-aa52-05f1748fd1f5",
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
							uuid = "10e1b234-96e6-8063-b41d-8bb3b042b705",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 315.407,
				name = "[DRK R1][MT] Oblation 05:17",
				timelineIndex = 58,
				timerOffset = 2.054,
				uuid = "5c0820bc-e3d4-0ca4-9eab-5ad95422453a",
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
									"1949028c-ea31-27e5-9755-cf3ed59aa0cd",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "068e0883-6371-e911-bf0a-15661ba8ee53",
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
							uuid = "1949028c-ea31-27e5-9755-cf3ed59aa0cd",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 315.407,
				name = "[DRK R1][MT] Dark Mind 05:18",
				timelineIndex = 58,
				timerOffset = 2.723,
				uuid = "7b7f3303-4a05-3c6e-8fed-5ef4038ca941",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "145e25d5-74fe-8d91-cb90-fecb3efdc4c5",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "221a9253-aa7c-020e-9d33-ab8091623871",
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
									"8144e4bd-529b-e0a4-ba18-2a5559da40af",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "f0deb5ce-2b32-af01-8516-3acf6ebee215",
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
							uuid = "8144e4bd-529b-e0a4-ba18-2a5559da40af",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 334.969,
				name = "[DRK R1][MT] Reprisal 05:32",
				timelineIndex = 59,
				timerOffset = -2.494,
				uuid = "742691de-0b76-a6f8-bcf8-5ee9cea0807f",
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
									"501b40e2-33c4-9040-875d-87410f865af8",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "0d537db7-d9ac-5bdf-a6b5-cd20131bf9ff",
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
							uuid = "501b40e2-33c4-9040-875d-87410f865af8",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 334.969,
				name = "[DRK R1][MT] Dark Missionary 05:33",
				timelineIndex = 59,
				timerOffset = -1.74,
				uuid = "3279a4e0-47f7-95e1-aea2-79963781979d",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "0619e067-08e8-4e53-9435-1f956f96d217",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "8c5a291b-1a41-d924-8f3d-1750ac45d94a",
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
									"85613b0c-3b21-b273-802f-9b233673f5af",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "OT - Reprisal",
							uuid = "ffbca56a-2773-847d-a50c-50cf5a925ab5",
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
							uuid = "85613b0c-3b21-b273-802f-9b233673f5af",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 339.594,
				name = "[DRK R1][OT] Reprisal 05:40",
				timelineIndex = 62,
				timerOffset = 1.23,
				uuid = "9010f674-428d-4e8e-aa35-e07c082b116e",
				version = 2,
			},
		},
	},
	[63] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "a1411c70-23fb-2fcc-77a7-c6fe6d1891a0",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "e746cb7f-6ee6-c7b7-94b8-953014d119a7",
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
									"24c293bd-bf79-ddf0-b00c-2a3d3a4d0561",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "d54b3ae6-baab-f4da-bf97-dd3c2f82e85b",
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
							uuid = "24c293bd-bf79-ddf0-b00c-2a3d3a4d0561",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 343.485,
				name = "[DRK R1][MT] The Blackest Night 05:42",
				timelineIndex = 63,
				timerOffset = -1.389,
				uuid = "161f9d77-c333-ff4c-8348-723a69df9289",
				version = 2,
			},
		},
	},
	[64] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "d832afd9-621d-99fd-a665-84eb5c52a949",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[66] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "acf8965b-a232-3b9f-a5fe-5529aecf7c0b",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[68] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "182010fd-2230-38d9-ead1-602f52bbd1ad",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "13053f2e-1794-3abc-9549-de21f4a46e46",
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
									"20cf43fc-d8b4-1a08-9726-122ec1454efa",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "MT - Shadowed Vigil",
							uuid = "d6539c41-ebba-77b8-9a87-1889cb04535f",
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
							uuid = "20cf43fc-d8b4-1a08-9726-122ec1454efa",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 370.282,
				name = "[DRK R1][MT] Shadowed Vigil 06:07",
				timelineIndex = 68,
				timerOffset = -2.998,
				uuid = "d91f604e-2700-535a-9207-5d48ffd7bb6f",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "22a6d1ec-a7a2-fcc7-a3d1-80a23748b33b",
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
									"428f15c7-443d-c976-a375-842f461a01d0",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT - TBN",
							targetType = "Other Tank",
							uuid = "81da24df-4796-5cc8-bab5-4d2a6d210ea6",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "428f15c7-443d-c976-a375-842f461a01d0",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 370.282,
				name = "[DRK R1][OT] TBN 06:08",
				timelineIndex = 68,
				timerOffset = -1.984,
				uuid = "6cb9582a-6cac-5b68-afd4-abca44e6c38b",
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
				name = "Rank 1\\OT",
				uuid = "ce9c656c-0011-6225-a58f-6ee37b170132",
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
									"47e109e9-68d6-af70-834d-5b0583469230",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT WAR-MT - Dark Missionary",
							uuid = "a5e61e1e-125c-cd73-8e4a-91a7ee2018bb",
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
							uuid = "47e109e9-68d6-af70-834d-5b0583469230",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 376.641,
				name = "[DRK R1][OT WAR-MT] Dark Missionary 06:16.979",
				timelineIndex = 71,
				timerOffset = 0.338,
				uuid = "ddf0ca44-8f50-85cd-a5ce-f92b5407db20",
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
				name = "Rank 1\\MT",
				uuid = "f5878a4a-a924-a4c3-9781-9753a6b7c40d",
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
									"c7cb835d-bd83-dd93-94a2-0fa53fd0b8e2",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "61b0d654-caea-36d2-90ba-5585aacf5b1c",
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
							uuid = "c7cb835d-bd83-dd93-94a2-0fa53fd0b8e2",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 380.282,
				name = "[DRK R1][MT] The Blackest Night 06:19",
				timelineIndex = 72,
				timerOffset = -0.601,
				uuid = "028bc0da-4164-0549-9d33-577a09c6e003",
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
				name = "Rank 1\\OT",
				uuid = "f0a6d0b4-eea5-02c1-8146-8e261bc2cf63",
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
									"4b8007ee-de4c-0aa5-a658-90b6cbaee503",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT - Dark Missionary",
							uuid = "935b3c64-fa41-cb09-9a05-1b3c3aa49cbd",
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
							uuid = "4b8007ee-de4c-0aa5-a658-90b6cbaee503",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 381.579,
				name = "[DRK R1][OT] Dark Missionary 06:23",
				timelineIndex = 73,
				timerOffset = 1.772,
				uuid = "02bdb233-1151-1455-83b5-178f056df72d",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "a37babf2-36bc-aa76-e0e9-c870b89a6ca2",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "bf6f4dca-6436-7f77-b215-7a8cf2e01ebe",
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
									"6ab2e306-e509-8d28-a9cb-d2196c2feb9d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Oblation",
							name = "OT - Oblation",
							targetType = "Other Tank",
							uuid = "4235c0f9-2310-bf96-acd0-7b0aa7cb8447",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "6ab2e306-e509-8d28-a9cb-d2196c2feb9d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 394.282,
				name = "[DRK R1][OT] Oblation 06:36",
				timelineIndex = 76,
				timerOffset = 2.172,
				uuid = "01167bd2-439f-4ad4-b333-c1744af87106",
				version = 2,
			},
		},
	},
	[77] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "c93209c9-0998-bb2d-45c2-8c672b9fabf9",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "a3f880e2-ec29-ccc8-b897-30b2c9601d89",
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
									"c702189d-2ff5-2f1c-a3c5-7c088bf12fcd",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "85aef81b-0fb1-7aa2-8cba-813e5368611b",
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
							uuid = "c702189d-2ff5-2f1c-a3c5-7c088bf12fcd",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 398.641,
				name = "[DRK R1][MT] Rampart 06:37",
				timelineIndex = 77,
				timerOffset = -1.351,
				uuid = "adaaca90-9cb9-5531-a4d2-114a387e5298",
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
									"bb99e711-91e2-8787-b6c6-f5eba7baf5f7",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "09ee82b2-73db-bd61-aa75-cd53a2ba22a6",
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
							uuid = "bb99e711-91e2-8787-b6c6-f5eba7baf5f7",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 398.641,
				name = "[DRK R1][MT] Reprisal 06:38",
				timelineIndex = 77,
				timerOffset = -0.638,
				uuid = "cd6e4c03-dc3e-acd7-a59b-04fbaee0e00d",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "5dd13a18-baa1-0b64-cfa2-73da6db803c8",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[79] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "ec4c2353-6a8c-118f-b9ea-b78e45e1c7a7",
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
									"e3c1a0b6-a0e1-78e1-a7c6-1832ba51bb0a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Oblation",
							name = "OT - Oblation",
							targetType = "Other Tank",
							uuid = "8bc79354-997d-2861-bfd8-edb9c19298ff",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "e3c1a0b6-a0e1-78e1-a7c6-1832ba51bb0a",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 404.36,
				name = "[DRK R1][OT] Oblation 06:46",
				timelineIndex = 79,
				timerOffset = 2.192,
				uuid = "e62b5529-cae0-79f0-aaf0-fb43f41d1df5",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "5abe249f-bbab-cf23-ff43-de2d333f02cf",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[81] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "94f500a8-3ae2-ac9c-2c67-cd76f37b4b98",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "d4d0712c-3056-b055-bac1-f84d86427de0",
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
									"bfbdb57e-4bbf-488e-b956-54e815e85716",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "29a9df67-09f7-b4ef-9feb-35b5b6b43795",
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
							uuid = "bfbdb57e-4bbf-488e-b956-54e815e85716",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 417.876,
				name = "[DRK R1][MT] Oblation 06:54",
				timelineIndex = 81,
				timerOffset = -2.939,
				uuid = "e79da85d-5393-15fd-ae78-c144a458eb1f",
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
									"36562271-2305-4590-843d-9d52d5fc144a",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "a597f3cb-9e76-9bbd-b183-a1ac5e002ed9",
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
							uuid = "36562271-2305-4590-843d-9d52d5fc144a",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 417.876,
				name = "[DRK R1][MT] Dark Mind 06:57",
				timelineIndex = 81,
				timerOffset = -0.844,
				uuid = "f43c3b7a-a03e-4f3f-abd9-8ab019f14eaa",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "51cb87c6-c9d0-63ea-9d79-e618826932f6",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "1c880552-cdcd-4401-9125-f61ebad1145b",
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
									"3ac45a0f-5c2a-c6da-85b9-7b367a05a6bb",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "8aaccf45-abed-2969-a3ef-1fc9d4af06a1",
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
							uuid = "3ac45a0f-5c2a-c6da-85b9-7b367a05a6bb",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 431.454,
				name = "[DRK R1][MT] Dark Missionary 07:12",
				timelineIndex = 83,
				timerOffset = 0.637,
				uuid = "7477acee-3bb3-eca6-b205-42f635706430",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "274afef5-514e-abfd-b372-56c83304498c",
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
									"fac82d5c-b137-1da6-a47d-9741e892f3d8",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ProvokeMouse",
							name = "OT - Provoke",
							targetName = "Lindwurm",
							targetType = "Named Target",
							uuid = "85ac861b-04e0-855e-9327-f71772ce4901",
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
							uuid = "fac82d5c-b137-1da6-a47d-9741e892f3d8",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 431.454,
				name = "[DRK R1][OT] Provoke 07:10",
				timelineIndex = 83,
				timerOffset = -0.455,
				uuid = "b1953658-e186-ba35-b59e-8d0994e1ea09",
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
									"79d6e90f-d021-629c-b23f-50e3df3c6f2f",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "OT - Rampart",
							uuid = "b8e6045f-cbb8-095e-a81a-9a7c91884189",
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
							uuid = "79d6e90f-d021-629c-b23f-50e3df3c6f2f",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 431.454,
				name = "[DRK R1][OT] Rampart 07:11",
				timelineIndex = 83,
				timerOffset = 0.256,
				uuid = "2896efa0-2a44-8145-ba82-ae86790851d1",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "c1743753-f66a-f62f-cd37-3e01c9406cc3",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[85] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "824de3d7-9482-0b98-b4f1-afe91a30d79d",
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
									"84a8851a-4a99-0bf6-a644-9e573176f7d2",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "OT - Dark Mind",
							uuid = "9cf7bcca-e2e0-e235-ae36-973a58502b59",
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
							uuid = "84a8851a-4a99-0bf6-a644-9e573176f7d2",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 438.735,
				name = "[DRK R1][OT] Dark Mind 07:19",
				timelineIndex = 85,
				timerOffset = 0.49,
				uuid = "80a2d19b-4ee7-4e46-a9e4-6746e0c15747",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "928339da-73a5-1456-f90f-a63c7c9b8e8a",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[88] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "08a35267-b1ff-1aeb-c2bc-693572204417",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[91] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "90180401-2206-ceb5-824b-a83f0902e2f1",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[92] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "bd0b07e3-93f7-911f-87f4-fec2dbb8f986",
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
									"a4774e10-224d-39ed-84e2-6962dd7f49b9",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "OT - Shadowed Vigil",
							uuid = "f40c6c6e-1132-19f0-969d-8bec6be7f62d",
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
							uuid = "a4774e10-224d-39ed-84e2-6962dd7f49b9",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 453.344,
				name = "[DRK R1][OT] Shadowed Vigil 07:34",
				timelineIndex = 92,
				timerOffset = 0.698,
				uuid = "73087366-1a09-6f7c-b073-f440e2e860e6",
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
				name = "Rank 1\\OT",
				uuid = "f137c56d-d65c-1905-82da-2ec8fb4484f7",
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
									"a7ee3e6a-3da1-5e92-8972-5227041a17a9",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "OT - Reprisal",
							uuid = "a857b387-24cd-f35b-91c1-9b2fdadb2ba7",
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
							uuid = "a7ee3e6a-3da1-5e92-8972-5227041a17a9",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 459.688,
				name = "[DRK R1][OT] Reprisal 07:36",
				timelineIndex = 93,
				timerOffset = -2.887,
				uuid = "01e009fe-93fa-4745-82da-32c8ac80d75f",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "c224a42d-6825-1b49-8793-aaf385ae0d1d",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	[97] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "917fd7f9-4bab-c00b-8ed1-f5ae155edc26",
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
									"5b235894-d25c-0d3b-98a4-cd4de5ed4f55",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "3744dbe1-0fd0-9ca4-9cc4-b9f90a5355fc",
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
							uuid = "5b235894-d25c-0d3b-98a4-cd4de5ed4f55",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 465.969,
				name = "[DRK R1][MT] Reprisal 07:47",
				timelineIndex = 97,
				timerOffset = 1.8040000200272,
				uuid = "7413e8fe-221c-2535-a8ea-c02e34bf393c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "81bb2120-3022-6d0f-a630-bc28d0c1b6fd",
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
									"17b6a28c-bf5a-658e-b53d-42b105c3efe6",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ProvokeMouse",
							name = "OT - Provoke",
							targetName = "Lindwurm",
							targetType = "Named Target",
							uuid = "86afe482-0c55-2cc5-8b9d-1152546244e4",
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
							uuid = "17b6a28c-bf5a-658e-b53d-42b105c3efe6",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 465.969,
				name = "[DRK R1][OT] Provoke 07:47",
				timelineIndex = 97,
				timerOffset = 1.344,
				uuid = "02043ed8-22f8-22e6-a6b6-2bc4aacf00d5",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "a6051df2-8bb2-32f6-25fa-6d10bb23dea2",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "cb6f5f76-c32d-212a-b989-4fb4fa259fba",
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
									"d3d58189-46fa-2bf5-bcb5-81b13f33d8c8",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT WAR-MT - Dark Missionary",
							uuid = "948994ed-0ae1-905e-8e54-131ab32241ac",
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
							uuid = "d3d58189-46fa-2bf5-bcb5-81b13f33d8c8",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 471.907,
				name = "[DRK R1][OT WAR-MT] Dark Missionary 07:49.205",
				timelineIndex = 98,
				timerOffset = -2.702,
				uuid = "e5e334b9-c0bc-2f6b-98b8-085a9c0e5296",
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
									"7e9d48d3-80e4-13e8-a4ec-0340e61d7773",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "OT WAR-MT - Reprisal",
							uuid = "5cfa5839-fc80-c94c-aa40-3a471ce01da9",
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
							uuid = "7e9d48d3-80e4-13e8-a4ec-0340e61d7773",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 471.907,
				name = "[DRK R1][OT WAR-MT] Reprisal 07:50.007",
				timelineIndex = 98,
				timerOffset = -1.9,
				uuid = "51c614b1-ce8e-2a42-b6af-b68bddf3c26e",
				version = 2,
			},
		},
	},
	[99] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "e67d5ff7-bd07-9ba0-bda0-f1a61da035a6",
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
									"2eea48f0-85f8-7ca9-86cd-a703ad6b253c",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "MT - Living Dead",
							uuid = "275fc4c6-465c-ebc0-95a6-ad0019e58f71",
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
							uuid = "2eea48f0-85f8-7ca9-86cd-a703ad6b253c",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 480.016,
				name = "[DRK R1][MT] Living Dead 07:57",
				timelineIndex = 99,
				timerOffset = -2.6679999828339,
				uuid = "53471768-d93a-edb2-9b88-b64ba34aff5d",
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
									"70740985-f732-074b-b142-f5991de6f043",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "d4b3bca3-152a-c5ae-94f5-4b9fd9bf0f19",
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
							uuid = "70740985-f732-074b-b142-f5991de6f043",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 480.016,
				name = "[DRK R1][MT] The Blackest Night 07:59",
				timelineIndex = 99,
				timerOffset = -0.175,
				uuid = "4ac55859-db65-df4b-a798-702f217a6e65",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "ed308370-25bb-1d70-bb3a-1dd304bd3be5",
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
									"015e6083-8143-e009-9adc-0074bee00de5",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "OT - Living Dead",
							uuid = "a54f79b9-8b10-089a-a253-8650b73a1d5a",
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
							uuid = "015e6083-8143-e009-9adc-0074bee00de5",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 480.016,
				name = "[DRK R1][OT] Living Dead 07:56",
				timelineIndex = 99,
				timerOffset = -3.321,
				uuid = "4c81e969-679e-bf36-87b9-ff5f40486b13",
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
									"a122c9e4-b2d3-a28b-93bc-626212813bb7",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT WAR-MT - TBN WAR",
							targetType = "Other Tank",
							uuid = "1f2abb11-c813-1126-a7e5-568bef1e0c51",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "a122c9e4-b2d3-a28b-93bc-626212813bb7",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 480.016,
				name = "[DRK R1][OT WAR-MT] TBN Other Tank 07:57.195",
				timelineIndex = 99,
				timerOffset = -2.821,
				uuid = "669252bf-6687-7179-8dd1-7d6f79e7117c",
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
									"1e09790b-8aef-4bdb-9155-ee59b77383e7",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "OT WAR-MT - Rampart",
							uuid = "f441b822-5bc6-3a62-9b63-968a448623b7",
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
							uuid = "1e09790b-8aef-4bdb-9155-ee59b77383e7",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 480.016,
				name = "[DRK R1][OT WAR-MT] Rampart 07:59.210",
				timelineIndex = 99,
				timerOffset = -0.806,
				uuid = "3cacb4f3-9d72-9499-bf28-2ddd7a5720fc",
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
									"995fc93e-2d2c-1662-b2f2-43de04444176",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "OT WAR-MT - Shadowed Vigil",
							uuid = "a2ff4b50-dc03-bad6-ac20-f6dfc2b96f7f",
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
							uuid = "995fc93e-2d2c-1662-b2f2-43de04444176",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 480.016,
				name = "[DRK R1][OT WAR-MT] Shadowed Vigil 07:59.837",
				timelineIndex = 99,
				timerOffset = -0.179,
				uuid = "5caa28bd-1e20-07eb-8b9d-1eae8bf68d59",
				version = 2,
			},
		},
	},
	[100] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "93b7766c-8c95-bfc8-d196-d8b616a3e39c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "ac558fea-e78b-16b3-8ef6-e46f26ec0da7",
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
									"c70de907-a0b6-9311-85fb-4372be2ec247",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightMouse",
							name = "OT - TBN",
							targetType = "Other Tank",
							uuid = "ac410bf4-ec3d-d44a-892b-c7285d524247",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "c70de907-a0b6-9311-85fb-4372be2ec247",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 480.563,
				name = "[DRK R1][OT] TBN 08:02",
				timelineIndex = 100,
				timerOffset = 1.6,
				uuid = "20e2130d-5f5b-4232-9ffc-e10f7c2d66c6",
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
									"3942bc89-bf4f-ba10-8033-0842ac5acade",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "OT WAR-MT - Oblation Self",
							uuid = "20c81f66-c5e6-2e17-9c89-f5f7ec0cd9d8",
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
							uuid = "3942bc89-bf4f-ba10-8033-0842ac5acade",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 480.563,
				name = "[DRK R1][OT WAR-MT] Oblation Self 08:01.714",
				timelineIndex = 100,
				timerOffset = 1.151,
				uuid = "19c15f89-9f83-af76-9925-431114ade554",
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
				uuid = "012cd3ca-daa1-1d11-8452-b5431343e9ce",
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
									"65d612b9-8222-559b-8bae-9fc6bf41b686",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ShirkMouse",
							name = "OT - Shirk",
							targetType = "Other Tank",
							uuid = "faf92862-65d6-e9b4-9fd3-c41c350c1f70",
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
							uuid = "65d612b9-8222-559b-8bae-9fc6bf41b686",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 485.219,
				name = "[DRK R1][OT] Shirk 08:05",
				timelineIndex = 101,
				timerOffset = -0.124,
				uuid = "06fdbbff-0568-510d-a2eb-1aebe91eea18",
				version = 2,
			},
		},
	},
	[102] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "c9a7cf7a-24bf-4b66-3505-3f58a5919aea",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "398ded24-8747-198e-b80b-7214d215ee89",
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
									"d13d0324-8842-78b7-a29f-dbf0ad0467bd",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "MT - Shadowed Vigil",
							uuid = "252e2cbe-9c7f-c173-bf3b-5af2b17f204f",
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
							uuid = "d13d0324-8842-78b7-a29f-dbf0ad0467bd",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 487.641,
				name = "[DRK R1][MT] Shadowed Vigil 08:09",
				timelineIndex = 102,
				timerOffset = 1.824,
				uuid = "cf8af495-8b23-d513-b6a6-42994f06b5c8",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "d9512883-7700-01d0-919c-267abb2ca019",
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
									"ceafba4b-90ef-44e4-ac1f-ae9cf277f7db",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Oblation",
							name = "OT - Oblation",
							targetType = "Other Tank",
							uuid = "52f47408-7e23-521d-9726-d5b996796432",
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
							conditionLua = "return _G[\"ACR_\"..gACRSelectedProfiles[TensorCore.mGetPlayer().job]..\"_TankStance\"] == \"ot\"",
							name = "OT route",
							uuid = "ceafba4b-90ef-44e4-ac1f-ae9cf277f7db",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 487.641,
				name = "[DRK R1][OT] Oblation 08:09",
				timelineIndex = 102,
				timerOffset = 1.501,
				uuid = "163dc67d-4944-1cc8-9198-a4aa1317284c",
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
				name = "Rank 1\\OT",
				uuid = "beffd34e-6904-cab0-895d-6243b3ba76bb",
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
									"481860f9-5bf5-8a35-b23b-57e51f90a510",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT WAR-MT - Dark Missionary",
							uuid = "e20b78bc-ac7a-2758-a477-57050f821ac8",
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
							uuid = "481860f9-5bf5-8a35-b23b-57e51f90a510",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 501.344,
				name = "[DRK R1][OT WAR-MT] Dark Missionary 08:19.467",
				timelineIndex = 103,
				timerOffset = -1.877,
				uuid = "b09b3297-7e99-e743-bd6e-dca738c0ced8",
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
									"d19e0495-c585-83ae-b523-9afe4260f7ca",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "OT WAR-MT - Reprisal",
							uuid = "1319e574-d9d7-3e80-9646-13656d38318e",
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
							uuid = "d19e0495-c585-83ae-b523-9afe4260f7ca",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				mechanicTime = 501.344,
				name = "[DRK R1][OT WAR-MT] Reprisal 08:26.666",
				timelineIndex = 103,
				timerOffset = 5.322,
				uuid = "ec779a05-14f1-95c4-b553-50abed6dda04",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "7ad0aec8-a57c-876c-7dfb-d34a609cb878",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "9cc8f057-bf00-746f-b2dd-831934e81473",
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
									"7d81425f-6fb1-e458-a7ba-2879175e984f",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "9c71af11-0ebb-7f54-b040-489113444d38",
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
							uuid = "7d81425f-6fb1-e458-a7ba-2879175e984f",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 514.876,
				name = "[DRK R1][MT] Oblation 08:40",
				timelineIndex = 104,
				timerOffset = 5.139,
				uuid = "4d3bdd93-818f-7c50-aa82-15e84b73c9cf",
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
									"b871a05b-edd6-0ff1-89c6-0d9fa36a964f",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "fcc1e3cd-fc9b-384a-ba41-dbbeff562f08",
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
							uuid = "b871a05b-edd6-0ff1-89c6-0d9fa36a964f",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 514.876,
				name = "[DRK R1][MT] Rampart 08:41",
				timelineIndex = 104,
				timerOffset = 7.052,
				uuid = "646a4509-0fd9-4fe5-a947-a0b83ecc42dd",
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
									"066a2a7c-a062-54f5-ad19-2a58872bd1a2",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "d492b06a-aaf1-e2c4-a856-08c20c361c44",
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
							uuid = "066a2a7c-a062-54f5-ad19-2a58872bd1a2",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 514.876,
				name = "[DRK R1][MT] Dark Missionary 08:42",
				timelineIndex = 104,
				timerOffset = 7.765,
				uuid = "febcce11-2917-7f1f-923a-ba91e213991c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "bd69e02b-34e0-181b-9ccc-c95e875b804b",
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
									"486f8a65-c3d1-4081-a81f-7360bd3ed5d8",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "OT - Dark Missionary",
							uuid = "62ad921d-3f43-67a4-8013-969df6bf28a0",
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
							uuid = "486f8a65-c3d1-4081-a81f-7360bd3ed5d8",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\OT",
				enabled = false,
				mechanicTime = 514.876,
				name = "[DRK R1][OT] Dark Missionary 08:31",
				timelineIndex = 104,
				timerOffset = -3.022,
				uuid = "2dcc6573-1b8a-4383-8fb8-61d964a717b9",
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
				name = "store\\anyone\\savage6\\m12s\\main_p2",
				uuid = "e2dc46bf-f9e9-5a73-b70f-7641d22c2d2f",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m12s\\main_p2",
			objectType = "folder",
		},
	},
	inheritedProfiles = 
	{
		"store\\anyone\\savage6\\m12s\\main_p2",
	},
	timelineName = "r12s2",
	version = "1.5.0",
}



return tbl