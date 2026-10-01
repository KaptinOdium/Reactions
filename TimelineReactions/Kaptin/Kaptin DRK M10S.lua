local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "f9dc066f-7eac-1df3-78cd-5735218c713f",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "f0fc0f6b-28cb-0788-a196-a34d76a9a425",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "4d56a5e6-0a86-3e9c-b624-9bf900f30e86",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Retired old OT",
				uuid = "49cf6754-94d0-0b2e-9586-3a8e4a8fe9e6",
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
									"10610aef-5f7f-424f-b7ef-3bfeb1c0d8e9",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "OT - Rampart",
							uuid = "aafd7789-379f-d848-8767-954ee20e685c",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "10610aef-5f7f-424f-b7ef-3bfeb1c0d8e9",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 14.125,
				name = "[DRK R1][OT] Rampart 00:04 - superseded",
				timelineIndex = 1,
				timerOffset = -9.85,
				uuid = "c146eb9c-ed77-f30c-9695-96422686d351",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "dc462fd8-15d3-0f3b-acdf-f6c3dcc4d4b1",
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
									"b52384bf-5698-89f4-8572-08a34a236c02",
									true,
								},
								
								{
									"1ca57ef1-4572-f2c9-9582-ab5d5fa47518",
									true,
								},
								
								{
									"6c8f7a74-e137-a16c-bff1-5c9d60564dd0",
									true,
								},
								
								{
									"9740df7a-43b5-2be7-bd5b-27bf816440b2",
									true,
								},
								
								{
									"1cb7cfc7-357c-589f-8fb2-6bb9ac6aace9",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "Shadowed Vigil - self",
							uuid = "109e27ea-1bc8-64ee-b128-a5eb4397fb90",
							variableTogglesType = 3,
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
							uuid = "b52384bf-5698-89f4-8572-08a34a236c02",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "1ca57ef1-4572-f2c9-9582-ab5d5fa47518",
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
							uuid = "6c8f7a74-e137-a16c-bff1-5c9d60564dd0",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "9740df7a-43b5-2be7-bd5b-27bf816440b2",
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
							uuid = "1cb7cfc7-357c-589f-8fb2-6bb9ac6aace9",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 14.125,
				name = "[WAR+DRK][OT] Shadowed Vigil 00:06 - HotImpact1",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = -6.892,
				timerOffset = -7.266,
				timerStartOffset = -7.642,
				uuid = "13874abe-4605-a2bf-b583-46d0207cd349",
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
									"ae5c2508-2651-b7ab-a309-d661d4f2a4d4",
									true,
								},
								
								{
									"7683382a-619d-70dd-9ab7-d084f13cd01b",
									true,
								},
								
								{
									"fc8551ac-07a2-ede5-871c-20612c74c9e6",
									true,
								},
								
								{
									"7f111176-b538-b30c-9a87-bad1ceb5ff54",
									true,
								},
								
								{
									"41de0881-4d58-57b1-bd17-a74d9e0d333f",
									true,
								},
								
								{
									"96934687-e6e9-9d33-98a3-7afd0835348f",
									true,
								},
								
								{
									"bba29150-42e6-f305-941a-3610626c2260",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "The Blackest Night - WAR",
							targetType = "Other Tank",
							uuid = "c8ffc153-268c-5128-b334-a4c40a909103",
							variableTogglesType = 3,
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
							uuid = "ae5c2508-2651-b7ab-a309-d661d4f2a4d4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "7683382a-619d-70dd-9ab7-d084f13cd01b",
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
							uuid = "fc8551ac-07a2-ede5-871c-20612c74c9e6",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "7f111176-b538-b30c-9a87-bad1ceb5ff54",
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
							uuid = "41de0881-4d58-57b1-bd17-a74d9e0d333f",
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
							uuid = "96934687-e6e9-9d33-98a3-7afd0835348f",
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
							uuid = "bba29150-42e6-f305-941a-3610626c2260",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 14.125,
				name = "[WAR+DRK][OT] The Blackest Night 00:00 - Paired source cadence",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = -12.525,
				timerOffset = -2.852,
				timerStartOffset = -14.125,
				uuid = "8720b4e4-ff39-043c-a594-7d74b9a909f1",
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
									"5e046a7b-334a-2c88-bc5e-c21bac665a26",
									true,
								},
								
								{
									"bc87cfbd-a804-c7c9-b6f3-6303fb5dc4ec",
									true,
								},
								
								{
									"c1f9c9c4-83e9-3432-844d-71796c76fc31",
									true,
								},
								
								{
									"955b1102-984a-7802-822b-8bf2449f0122",
									true,
								},
								
								{
									"fae58cab-4f10-51f9-b23c-e31581ea54a9",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "Dark Mind - self",
							uuid = "e3f0394b-5b25-7257-a540-e5462db1a2b2",
							variableTogglesType = 3,
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
							uuid = "5e046a7b-334a-2c88-bc5e-c21bac665a26",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "bc87cfbd-a804-c7c9-b6f3-6303fb5dc4ec",
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
							uuid = "c1f9c9c4-83e9-3432-844d-71796c76fc31",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "955b1102-984a-7802-822b-8bf2449f0122",
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
							uuid = "fae58cab-4f10-51f9-b23c-e31581ea54a9",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 14.125,
				name = "[WAR+DRK][OT] Dark Mind 00:12 - HotImpact1",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = -1.311,
				timerOffset = 2.725,
				timerStartOffset = -2.061,
				uuid = "716c95ac-4da2-f4ff-9225-03c5a079a25c",
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
							actionID = 3629,
							conditions = 
							{
								
								{
									"f861862f-3be0-c9d4-831f-0840d2b8764e",
									true,
								},
								
								{
									"d1dbc8b3-06a0-2f88-93dc-ccb87ea4f382",
									true,
								},
								
								{
									"6a252248-18eb-379b-a433-02fbe4d54768",
									true,
								},
								
								{
									"8b18fb04-d0db-bfdc-b66a-b302c1e4a633",
									true,
								},
								
								{
									"d10aeb01-077d-6e4b-9ff6-228975ef735a",
									true,
								},
								
								{
									"277f38e9-8771-77e3-8dfc-6fdeda892b7c",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Hotbar_Grit",
							name = "Grit - self",
							uuid = "e914c100-ab16-9e15-a9be-304b122283d2",
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
							uuid = "f861862f-3be0-c9d4-831f-0840d2b8764e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "d1dbc8b3-06a0-2f88-93dc-ccb87ea4f382",
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
							uuid = "6a252248-18eb-379b-a433-02fbe4d54768",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "8b18fb04-d0db-bfdc-b66a-b302c1e4a633",
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
							uuid = "d10aeb01-077d-6e4b-9ff6-228975ef735a",
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
							uuid = "277f38e9-8771-77e3-8dfc-6fdeda892b7c",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 14.125,
				name = "[WAR+DRK][OT] Grit 00:14 - Paired source cadence",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 0.517149,
				timerOffset = 2.789,
				timerStartOffset = -0.232851,
				uuid = "80489cb4-8846-f769-a3b1-36d10f6529f8",
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
									"42ea84fb-8e7c-e4ca-b30e-dac4a7f85adc",
									true,
								},
								
								{
									"a89dd7dc-0337-a05d-8249-5a64922b7fb8",
									true,
								},
								
								{
									"296fc414-6a95-8ee0-8d44-5c2b06381250",
									true,
								},
								
								{
									"010398ae-8bc9-574c-9701-468821857ed8",
									true,
								},
								
								{
									"61e1534f-6054-9e01-9e36-90602bc2ca6c",
									true,
								},
								
								{
									"adb08bdc-4081-356a-888e-95e3c387cc43",
									true,
								},
							},
							endIfUsed = true,
							name = "Shirk - WAR",
							targetType = "Other Tank",
							uuid = "ac12a7c9-7d9a-f05a-9acb-f6cfdd56eb08",
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
							uuid = "42ea84fb-8e7c-e4ca-b30e-dac4a7f85adc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "a89dd7dc-0337-a05d-8249-5a64922b7fb8",
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
							uuid = "296fc414-6a95-8ee0-8d44-5c2b06381250",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "010398ae-8bc9-574c-9701-468821857ed8",
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
							uuid = "61e1534f-6054-9e01-9e36-90602bc2ca6c",
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
							uuid = "adb08bdc-4081-356a-888e-95e3c387cc43",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 14.125,
				name = "[WAR+DRK][OT] Shirk 00:17 - Coordinated WAR handoff",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 3.730937,
				timerStartOffset = 2.980937,
				uuid = "0d6d0f99-f3aa-917a-a013-324b0d18b28d",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "268f5194-202e-13c8-b045-3b7dc5d732fa",
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
									"818973b3-422b-3d1b-ac2e-50f99956c753",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "MT - Shadowed Vigil",
							uuid = "b14dd9f0-bff7-1495-8b4c-7e45bce87701",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "818973b3-422b-3d1b-ac2e-50f99956c753",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 14.125,
				name = "[DRK R1][MT] Shadowed Vigil 00:06",
				timelineIndex = 1,
				timerOffset = -7.488,
				uuid = "f1430bea-e431-d2f8-99ff-681d76da6d3f",
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
									"81051374-4ce6-f518-a104-1168b1af7323",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "78a3b7a3-315a-d2dd-8ffe-f976ae4f3f89",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "81051374-4ce6-f518-a104-1168b1af7323",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 14.125,
				name = "[DRK R1][MT] The Blackest Night 00:13",
				timelineIndex = 1,
				timerOffset = -0.85,
				uuid = "32583f55-5ba2-4aec-b1c6-8f24afe570d3",
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
									"30ce3764-454c-a158-b09e-03a351179c93",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "2c2bd84d-1901-30fa-807d-a6c7dffd2a3c",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "30ce3764-454c-a158-b09e-03a351179c93",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 14.125,
				name = "[DRK R1][MT] Oblation 00:14",
				timelineIndex = 1,
				timerOffset = -0.049,
				uuid = "762d7660-3aa9-d43b-baf9-46d72655c0b4",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\DPS Automation",
				uuid = "4ecfeab0-39e2-cb13-922c-b3f9a4b8a4b8",
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
				mechanicTime = 14.125,
				name = "[DRK Opt][MT] Hold Potion to 02:05",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 109.664,
				timerStartOffset = -14.125,
				uuid = "5ede6de5-9082-4044-b4cd-e0ffdf12e282",
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
				execute = "local player=TensorCore.mGetPlayer()\nif player==nil or player.job~=32 then self.used=true return end\nlocal selected=gACRSelectedProfiles and gACRSelectedProfiles[player.job] or nil\nif type(selected)~=\"string\" or _G[\"ACR_\"..selected..\"_TankStance\"]~=\"mt\" then self.used=true return end\nTensorCore.API.TensorACR.holdActionUntil(16472,Now()+2500,1)\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 14.125,
				name = "[DRK Opt][MT] Hold Living Shadow to 02:20",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 124.68,
				timerStartOffset = 104.375,
				uuid = "6c4572b9-357c-90bf-bf3d-62e18fed07e4",
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
				mechanicTime = 14.125,
				name = "[DRK Opt][MT] Hold Delirium to 02:15",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 119.731,
				timerStartOffset = 108.375,
				uuid = "e930aef3-d68c-8dae-a98e-e7128d30b1ef",
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
				execute = "local player=TensorCore.mGetPlayer()\nif player==nil or player.job~=32 then self.used=true return end\nlocal selected=gACRSelectedProfiles and gACRSelectedProfiles[player.job] or nil\nif type(selected)~=\"string\" or _G[\"ACR_\"..selected..\"_TankStance\"]~=\"mt\" then self.used=true return end\nTensorCore.API.TensorACR.holdActionUntil(16472,Now()+2500,1)\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 14.125,
				name = "[DRK Opt][MT] Hold Living Shadow to 05:15",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 299.318,
				timerStartOffset = 243.375,
				uuid = "e28e24a9-08e1-8e20-932f-8e58b2f3a22a",
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
				mechanicTime = 14.125,
				name = "[DRK Opt][MT] Hold Delirium to 06:33",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 377.81,
				timerStartOffset = 360.375,
				uuid = "e32dd83e-54f6-1b87-9cfe-cac6b3d5c286",
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
				mechanicTime = 14.125,
				name = "[DRK Opt][MT] Hold Potion to 07:10",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 414.587,
				timerStartOffset = 378.375,
				uuid = "dbdbbaa7-b377-4139-b044-8116435a6a2e",
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
				execute = "local player=TensorCore.mGetPlayer()\nif player==nil or player.job~=32 then self.used=true return end\nlocal selected=gACRSelectedProfiles and gACRSelectedProfiles[player.job] or nil\nif type(selected)~=\"string\" or _G[\"ACR_\"..selected..\"_TankStance\"]~=\"mt\" then self.used=true return end\nTensorCore.API.TensorACR.holdActionUntil(16472,Now()+2500,1)\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 14.125,
				name = "[DRK Opt][MT] Hold Living Shadow to 07:20",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 424.083,
				timerStartOffset = 418.375,
				uuid = "df8ba62e-11ce-6928-b8f9-4aef6c6eb317",
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
				name = "Rank 1\\OT",
				uuid = "01ac7e9a-ffdd-57ef-8e27-e03ab2ffb49f",
			},
			objectType = "folder",
		},
	},
	[7] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "33e458a7-6567-78c2-af5e-6506e6b4efaf",
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
									"644823a9-f8d4-f5fe-9745-badb0ae8017d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "85837b09-4b3a-bee3-b479-6b34addd7676",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "644823a9-f8d4-f5fe-9745-badb0ae8017d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 52.109,
				name = "[DRK R1][MT] Reprisal 00:48",
				timelineIndex = 7,
				timerOffset = -3.75,
				uuid = "8c33a1a2-cc88-bc71-8af7-d35e3713197d",
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
									"ffad1d69-ecb2-92c3-8468-964af895fa1e",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "240e403d-61f8-64f2-a655-eed6f33bcb1e",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "ffad1d69-ecb2-92c3-8468-964af895fa1e",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 52.109,
				name = "[DRK R1][MT] Dark Mind 00:49",
				timelineIndex = 7,
				timerOffset = -3.039,
				uuid = "0a001dfc-4a4a-775f-87d4-108554c9dfe4",
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
									"ffdf814e-5b20-d966-8fb4-9365ec85638b",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "5823c97f-2275-e0c0-bad8-b7b1c2d5b832",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "ffdf814e-5b20-d966-8fb4-9365ec85638b",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 52.109,
				name = "[DRK R1][MT] Oblation 00:50",
				timelineIndex = 7,
				timerOffset = -1.164,
				uuid = "9f19e555-3013-75bb-aa58-ef0c85478a00",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "5e6f8dcb-cf40-fb5f-bbf0-a2eb02a4a93e",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "4123a20d-62aa-da24-98d7-38161c05afc9",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "b36120c8-7dc0-b1fa-b169-08c0510345fb",
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
									"c899195d-b08e-49bc-b9d3-9df9068a4d43",
									true,
								},
								
								{
									"951e5fef-cbed-b54d-a68a-49df15f7e651",
									true,
								},
								
								{
									"efba92d9-162e-6626-a4b1-4e93f9516495",
									true,
								},
								
								{
									"b83d86ff-705b-e6b3-928d-b5bfa725e7f6",
									true,
								},
								
								{
									"66c45f16-fee5-d40f-81be-8961d88a2e63",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "Dark Missionary - self",
							uuid = "259e1268-6cac-64f5-8322-c44e241246e1",
							variableTogglesType = 3,
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
							uuid = "c899195d-b08e-49bc-b9d3-9df9068a4d43",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "951e5fef-cbed-b54d-a68a-49df15f7e651",
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
							uuid = "efba92d9-162e-6626-a4b1-4e93f9516495",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "b83d86ff-705b-e6b3-928d-b5bfa725e7f6",
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
							uuid = "66c45f16-fee5-d40f-81be-8961d88a2e63",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 52.109,
				name = "[WAR+DRK][OT] Dark Missionary 00:48 - Paired source cadence",
				timeRange = true,
				timelineIndex = 7,
				timerEndOffset = -3.103727,
				timerOffset = 5.449,
				timerStartOffset = -3.853727,
				uuid = "8ac5aeb3-1ab4-e603-9b99-1a376aaaedc7",
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
				name = "Rank 1\\OT",
				uuid = "c0d6492a-d250-33ec-ab38-b9018a6b02eb",
			},
			objectType = "folder",
		},
	},
	[9] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "56cd4e08-745c-ad37-9b78-7227d132032a",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "5ffaaec7-2e82-aaaa-8155-1e1ca34d80b5",
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
									"571a8a53-8e02-9c97-826a-7ae0831708ca",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "16a1c5f4-c956-e9a8-aea6-b4f73bdfde34",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "571a8a53-8e02-9c97-826a-7ae0831708ca",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 61.515,
				name = "[DRK R1][MT] Dark Missionary 00:58",
				timelineIndex = 9,
				timerOffset = -3.079,
				uuid = "57010b39-af99-ca2c-aef3-e4dae5cf602c",
				version = 2,
			},
		},
	},
	[10] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "214db643-c596-1014-96cc-382f2d1d0013",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "b376c0a0-5fe8-ef1c-a2b0-3f85c6ff74fa",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "ba93eb80-229e-15d1-8c22-0f2079c8572f",
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
									"1a2c2007-a440-47c4-8a04-e02ecceb2fce",
									true,
								},
								
								{
									"0c5652da-298a-cbbc-b283-112010326f68",
									true,
								},
								
								{
									"7925cdf5-d21c-ccce-8faa-8629a313424e",
									true,
								},
								
								{
									"b33fa35e-257f-263f-9dca-55caaf79453c",
									true,
								},
								
								{
									"65bc7f0c-05ef-8f82-9d5f-812917201eb4",
									true,
								},
								
								{
									"7afc4081-ac44-db40-9ce1-e3f41b9f9008",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "Reprisal - self",
							uuid = "6690ef2b-1208-4303-9a37-1550123369eb",
							variableTogglesType = 3,
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
							uuid = "1a2c2007-a440-47c4-8a04-e02ecceb2fce",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "0c5652da-298a-cbbc-b283-112010326f68",
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
							uuid = "7925cdf5-d21c-ccce-8faa-8629a313424e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "b33fa35e-257f-263f-9dca-55caaf79453c",
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
							uuid = "65bc7f0c-05ef-8f82-9d5f-812917201eb4",
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
							partyTargetName = "Red Hot",
							partyTargetType = "Named Target",
							uuid = "7afc4081-ac44-db40-9ce1-e3f41b9f9008",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 62.406,
				name = "[WAR+DRK][OT] Reprisal 01:04 - Paired source cadence",
				timeRange = true,
				timelineIndex = 10,
				timerEndOffset = 2.902346,
				timerOffset = -2.27,
				timerStartOffset = 2.152346,
				uuid = "54881946-c960-0586-811e-d2c49660f10c",
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
				name = "Rank 1\\OT",
				uuid = "6884502f-5ac1-0b80-ac7e-ca4286b2e3a3",
			},
			objectType = "folder",
		},
	},
	[15] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "d3338bd0-750d-5eb4-1d59-3efaa4b0ab60",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[17] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "11dcd1ea-bb6f-490e-98fc-4ce0290d9d7a",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[18] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "100dff65-e9b6-cf51-d5a5-7c6792d938f5",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "15c41cb2-84cc-f9fe-a93a-a4ed8db84a68",
			},
			objectType = "folder",
		},
	},
	[19] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "fd3b260c-fed5-f1e8-50c6-7ad6388b169c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[21] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "30a35625-e589-6011-e703-9e73556668b5",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[22] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "4065f146-50fc-3362-dba8-46c8f84c7416",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[23] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "b93ec717-a68f-ead3-dc98-67b1cc748aa7",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "6938e9fe-b486-0219-a5c6-72b690c2de18",
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
									"0a5a003c-3b98-1e7c-a230-d5c2c3383f07",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "19db87f4-528f-89ce-9c39-7023c3e18552",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "0a5a003c-3b98-1e7c-a230-d5c2c3383f07",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 117.609,
				name = "[DRK R1][MT] Rampart 02:01",
				timelineIndex = 23,
				timerOffset = 3.558,
				uuid = "a533f448-7e60-04d9-899b-f0b09fc7ed47",
				version = 2,
			},
		},
	},
	[24] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "17ace249-9b73-1a7f-be4c-03085534bd8a",
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
									"6faaf11a-76c8-244a-b1cf-5cfd8eef0a5f",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "4331f6f8-b6c8-4387-91e6-5470a4df942d",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "6faaf11a-76c8-244a-b1cf-5cfd8eef0a5f",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 125.234,
				name = "[DRK R1][MT] Reprisal 02:01",
				timelineIndex = 24,
				timerOffset = -3.357,
				uuid = "729498e8-55df-261f-8ff7-8e9ebd96e4b4",
				version = 2,
			},
		},
	},
	[25] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "f2954071-39a8-3945-37af-e557cec1e001",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[26] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "29e7b6d6-0b8b-e5b2-88f0-813ac6801620",
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
									"b467b1e5-33e1-c2bb-92da-4d3b2050f2df",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "4930f04c-fd7f-c102-9444-e58a31b2aa8a",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "b467b1e5-33e1-c2bb-92da-4d3b2050f2df",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 128.453,
				name = "[DRK R1][MT] Dark Mind 02:08",
				timelineIndex = 26,
				timerOffset = -0.127,
				uuid = "6b8ab0f6-b4af-246b-941d-a3444a8fcd04",
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
									"1d7ef2fe-bf43-6924-a0d5-b0a6862d617f",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "d508e2df-6b04-ba25-a885-b8126b0ad174",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "1d7ef2fe-bf43-6924-a0d5-b0a6862d617f",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 128.453,
				name = "[DRK R1][MT] Oblation 02:09",
				timelineIndex = 26,
				timerOffset = 0.585,
				uuid = "5926d47e-b663-05df-b519-cba2a423a4ec",
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
									"ec9c7ef4-b0a0-89ee-9d39-3529ae313768",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "6407ab04-4b4a-a79f-ab11-5fc9129017a3",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "ec9c7ef4-b0a0-89ee-9d39-3529ae313768",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 128.453,
				name = "[DRK R1][MT] The Blackest Night 02:10",
				timelineIndex = 26,
				timerOffset = 2.501,
				uuid = "74879373-ffea-3ebf-a26e-a62aa806d91f",
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
				name = "Rank 1\\MT",
				uuid = "ee270777-a73d-fc90-81e7-ce43b85205bf",
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
									"152d6896-eec8-7835-976a-803f9e01bd7b",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ArmsLength",
							name = "MT - Arm's Length",
							uuid = "b7a44c94-a7b9-68a8-83a6-14d122822f71",
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
							uuid = "152d6896-eec8-7835-976a-803f9e01bd7b",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 136.312,
				name = "[DRK R1][MT] Arm's Length 02:13",
				timelineIndex = 27,
				timerOffset = -2.952,
				uuid = "09722086-acf4-774d-818d-b5ef1ca88c15",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "572508d2-d28f-2420-81f8-3acd050bdd42",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "a6ba640c-3c56-4959-9795-9980fb8e16ea",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "72f0034b-f313-2f4a-bd6c-95deb610da47",
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
									"89a24b68-ac06-ed77-84ca-ea9e58b329b8",
									true,
								},
								
								{
									"3ec048ef-c31b-5184-85c7-78102687782c",
									true,
								},
								
								{
									"ba2c2e83-7cbd-e26e-82f0-077d9500749f",
									true,
								},
								
								{
									"142a740f-1ea3-c888-82df-8ea087d8552b",
									true,
								},
								
								{
									"3ea760a0-eb9f-cfd3-8c0f-c7444b9cb422",
									true,
								},
								
								{
									"ea7cd1e5-cedd-2587-a225-8a92952fa0ab",
									true,
								},
								
								{
									"490a9158-cbed-bd82-bc8f-6e606e90bd11",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "The Blackest Night - WAR",
							targetType = "Other Tank",
							uuid = "a1a1466d-11ab-a2aa-85e9-d8eca580f0c9",
							variableTogglesType = 3,
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
							uuid = "89a24b68-ac06-ed77-84ca-ea9e58b329b8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "3ec048ef-c31b-5184-85c7-78102687782c",
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
							uuid = "ba2c2e83-7cbd-e26e-82f0-077d9500749f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "142a740f-1ea3-c888-82df-8ea087d8552b",
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
							uuid = "3ea760a0-eb9f-cfd3-8c0f-c7444b9cb422",
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
							uuid = "ea7cd1e5-cedd-2587-a225-8a92952fa0ab",
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
							uuid = "490a9158-cbed-bd82-bc8f-6e606e90bd11",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 136.312,
				name = "[WAR+DRK][OT] The Blackest Night 02:15 - DeepImpact1",
				timeRange = true,
				timelineIndex = 27,
				timerEndOffset = -0.684,
				timerOffset = -3.391,
				timerStartOffset = -1.434,
				uuid = "9b08974b-2d9b-96a7-abaf-9f59ba0d9136",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "3bd37e54-74b8-7830-af11-94ea93e4ba64",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[29] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "41c1ca8d-1ea8-7a99-a484-db9b9510a69d",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
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
				uuid = "276428a0-2380-210a-94cf-bd14d05fbac0",
			},
			objectType = "folder",
		},
	},
	[32] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "772f4195-abeb-bd01-6532-6f47d98c77a5",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "36b95e63-f689-43c4-894d-8ef955b74b83",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "9b4b8474-3584-c323-9543-bb8bd97edeab",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "dc06eaa8-57df-964e-90a5-72b763f52f71",
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
							actionID = 7533,
							conditions = 
							{
								
								{
									"fe8851e3-37af-fa4c-9f18-ea61b7c1441e",
									true,
								},
								
								{
									"1637372f-0072-386c-a3c5-b20fcf010bc0",
									true,
								},
								
								{
									"f4876e7f-e52a-fa27-8818-78fd440bcfbd",
									true,
								},
								
								{
									"3d356ed8-3646-1ba5-8147-b81326435b24",
									true,
								},
								
								{
									"5d9c2a40-4980-4acd-a338-b1ae83e21da6",
									true,
								},
								
								{
									"3db8f243-7058-73de-897e-24bc4c52d318",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Hotbar_ProvokeMouse",
							name = "Provoke - self",
							targetName = "Red Hot",
							targetType = "Named Target",
							uuid = "9cb8e24c-3555-0d40-beb6-c64b2ca0d824",
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
							uuid = "fe8851e3-37af-fa4c-9f18-ea61b7c1441e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "1637372f-0072-386c-a3c5-b20fcf010bc0",
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
							uuid = "f4876e7f-e52a-fa27-8818-78fd440bcfbd",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "3d356ed8-3646-1ba5-8147-b81326435b24",
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
							name = "Cooldown ready",
							uuid = "5d9c2a40-4980-4acd-a338-b1ae83e21da6",
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
							name = "Red Hot in Provoke range",
							partyTargetName = "Red Hot",
							partyTargetType = "Named Target",
							uuid = "3db8f243-7058-73de-897e-24bc4c52d318",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 161.953,
				name = "[WAR+DRK][OT] Provoke 02:38 - Coordinated WAR handoff",
				timeRange = true,
				timelineIndex = 32,
				timerEndOffset = -3.204272,
				timerOffset = 0.381,
				timerStartOffset = -3.954272,
				uuid = "e79804e2-0bc1-e068-8511-a832dde5b570",
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
							actionID = 16471,
							conditions = 
							{
								
								{
									"69b72854-b7ed-dd47-a8e9-160868b201ea",
									true,
								},
								
								{
									"ec1c4d9c-ae7c-c064-8740-5d68138ebd2e",
									true,
								},
								
								{
									"c5c15c0c-ac3e-d0ce-a8b2-c27722a33b00",
									true,
								},
								
								{
									"e92ac038-915c-3f3c-9472-33c82e4f23db",
									true,
								},
								
								{
									"900b8978-7389-b912-a56e-b71a2340f800",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							ignoreWeaveRules = true,
							name = "Dark Missionary - self",
							uuid = "b1dc364b-75ca-3f5e-9712-0f8bd4b5f123",
							variableTogglesType = 3,
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
							uuid = "69b72854-b7ed-dd47-a8e9-160868b201ea",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "ec1c4d9c-ae7c-c064-8740-5d68138ebd2e",
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
							uuid = "c5c15c0c-ac3e-d0ce-a8b2-c27722a33b00",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "e92ac038-915c-3f3c-9472-33c82e4f23db",
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
							uuid = "900b8978-7389-b912-a56e-b71a2340f800",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 161.953,
				name = "[WAR+DRK][OT] Dark Missionary 02:45 - Paired source cadence",
				timeRange = true,
				timelineIndex = 32,
				timerEndOffset = 3.886713,
				timerOffset = -3.89,
				timerStartOffset = 3.136713,
				uuid = "d8fbb342-254a-d2cc-8cd0-4f37702b5e9c",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "684d5c23-a99e-67a7-2398-90210e4a08b3",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[40] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "b665cc4e-aa38-28b2-201b-3cb82dd665de",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[41] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "c8bc10ff-ced5-d3e3-47b7-0521e328eb0f",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
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
				uuid = "183cb7f7-9668-3144-a0c4-daa8644dafe8",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "e53a0eaa-5020-e018-ab87-6fc2f139119d",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "ee77749e-cb49-29aa-bcde-950862056ef9",
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
									"35e3977e-4fa8-5b95-8738-8fc52e3ff1a8",
									true,
								},
								
								{
									"0a930097-1790-ac47-96ff-a6466bad4f2b",
									true,
								},
								
								{
									"a3b7033f-79a5-991e-acf8-2602f3dd7e3b",
									true,
								},
								
								{
									"3e458d78-e161-713a-9b1e-a0999c500975",
									true,
								},
								
								{
									"d42136b8-6cb1-1377-9e05-f46710acd582",
									true,
								},
								
								{
									"67e1179c-e8ec-b1d2-b45f-3afb1da6f08e",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "The Blackest Night - self",
							uuid = "9201b98f-8d53-0fb5-9661-f809181f1716",
							variableTogglesType = 3,
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
							uuid = "35e3977e-4fa8-5b95-8738-8fc52e3ff1a8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "0a930097-1790-ac47-96ff-a6466bad4f2b",
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
							uuid = "a3b7033f-79a5-991e-acf8-2602f3dd7e3b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "3e458d78-e161-713a-9b1e-a0999c500975",
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
							uuid = "d42136b8-6cb1-1377-9e05-f46710acd582",
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
							uuid = "67e1179c-e8ec-b1d2-b45f-3afb1da6f08e",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 178.859,
				name = "[WAR+DRK][OT] The Blackest Night 02:58 - Paired source cadence",
				timeRange = true,
				timelineIndex = 42,
				timerEndOffset = -0.185454,
				timerOffset = -0.338,
				timerStartOffset = -0.935454,
				uuid = "a6cad260-588d-962f-bcfd-ff6f41166285",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "bc5053ad-0c76-cba1-0a16-0d63fe6fcfbd",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[45] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "4ca5937b-4e10-aac7-6ee1-c7d54f75820b",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[46] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "a249e649-4683-7557-9b7b-0ce7a7d11fc5",
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
									"2618de52-58fa-908f-a70f-388606f6de0d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "MT - Shadowed Vigil",
							uuid = "2f50a6e5-dfbb-9cc2-b481-1a9a2b3065ea",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "2618de52-58fa-908f-a70f-388606f6de0d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 201.999,
				name = "[DRK R1][MT] Shadowed Vigil 03:20",
				timelineIndex = 46,
				timerOffset = -1.984,
				uuid = "1c3e9af8-468d-63d6-bb57-118648153d8c",
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
									"1bf662f5-05e9-6606-9f35-e75b9688822d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "61925416-932d-b19c-9385-73085eac5b41",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "1bf662f5-05e9-6606-9f35-e75b9688822d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 201.999,
				name = "[DRK R1][MT] The Blackest Night 03:22",
				timelineIndex = 46,
				timerOffset = 0.332,
				uuid = "b08ce118-0d7c-904b-9112-2bcd2a166330",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "5752d2e6-0743-c85a-6022-464040f31536",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[49] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "19575c2f-5ba8-60f2-9081-a772da6195e2",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "0f49073a-2367-7eec-98c9-e56a085ab194",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "Retired old OT",
				uuid = "037a821a-1bfc-9e4e-aa5e-f5e4001111d5",
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
									"eb305ba9-8db0-e4c2-a19a-2b1c33137376",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "OT - Rampart",
							uuid = "a413b762-778f-ef88-988a-32871d2a47ab",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "eb305ba9-8db0-e4c2-a19a-2b1c33137376",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/Retired old OT",
				enabled = false,
				mechanicTime = 209.343,
				name = "[DRK R1][OT] Rampart 03:28 - superseded",
				timelineIndex = 49,
				timerOffset = -0.994,
				uuid = "47478ed0-5153-842c-91a5-f148ba319610",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "bc074098-ccc6-3a6c-681d-f7e2499e98a8",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "993a3b4f-9872-6143-9d5d-968397a5e079",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "b4683b01-f86f-11be-86f4-08ddf72ede0c",
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
									"c97356e9-4f6b-1435-a26b-9a7b8c560250",
									true,
								},
								
								{
									"8f77ef3c-d5bc-08ec-80d6-ef5556336092",
									true,
								},
								
								{
									"386cd092-773a-3bbf-8df1-32bf947b073e",
									true,
								},
								
								{
									"32a7297e-07bc-976f-983e-9eb56bdd7fbc",
									true,
								},
								
								{
									"e57e7c45-28ee-599d-8bd2-9ffb01711535",
									true,
								},
							},
							endIfUsed = true,
							name = "Shadowed Vigil - self",
							uuid = "6f24a3c9-4145-04b6-ae7f-99ad7c4f49dc",
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
							uuid = "c97356e9-4f6b-1435-a26b-9a7b8c560250",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "8f77ef3c-d5bc-08ec-80d6-ef5556336092",
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
							uuid = "386cd092-773a-3bbf-8df1-32bf947b073e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "32a7297e-07bc-976f-983e-9eb56bdd7fbc",
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
							uuid = "e57e7c45-28ee-599d-8bd2-9ffb01711535",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 212.359,
				name = "[WAR+DRK][OT] Shadowed Vigil 03:33 - Paired source cadence",
				timeRange = true,
				timelineIndex = 51,
				timerEndOffset = 1.390153,
				timerStartOffset = 0.640153,
				uuid = "c7c38071-90ae-669e-9175-7c304ca56f74",
				version = 2,
			},
		},
	},
	[52] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "d332a790-291f-bbd7-90c7-711ebcb0476e",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "92180e7d-83b0-b980-aac3-1c33de827ad2",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "93cbd954-8280-5906-9d8e-40a45548f769",
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
									"48601627-fd69-3eaa-a6dd-05d60868fe0b",
									true,
								},
								
								{
									"f8a7a538-3405-3bfe-ade1-4e747cf6b409",
									true,
								},
								
								{
									"3976ddcf-969a-e173-8625-e936e1c78f8a",
									true,
								},
								
								{
									"50de311a-5092-87dc-83c2-11ccfeaf947a",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "Oblation - self",
							uuid = "87758be6-10fc-2cf2-9857-63b736700135",
							variableTogglesType = 3,
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
							uuid = "48601627-fd69-3eaa-a6dd-05d60868fe0b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "f8a7a538-3405-3bfe-ade1-4e747cf6b409",
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
							uuid = "3976ddcf-969a-e173-8625-e936e1c78f8a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "50de311a-5092-87dc-83c2-11ccfeaf947a",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 216.687,
				name = "[WAR+DRK][OT] Oblation 03:35 - Paired source cadence",
				timeRange = true,
				timelineIndex = 52,
				timerEndOffset = -0.934156,
				timerOffset = 0.749,
				timerStartOffset = -1.684156,
				uuid = "fe0effc5-ac8b-faa7-9d1a-d08a3beaf978",
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
									"ff3512c4-38b9-65ae-b00c-ea9ebb77ba27",
									true,
								},
								
								{
									"6cce3d89-4a06-6ba4-be73-9995544e0252",
									true,
								},
								
								{
									"347276ed-d0c6-349e-a8fc-9e227ce0fad3",
									true,
								},
								
								{
									"62b681a8-7475-6229-aae4-6e7ad59e885e",
									true,
								},
								
								{
									"c9ec0710-605b-83bc-9c43-94cceef13ff3",
									true,
								},
								
								{
									"95fefc90-64b8-7583-a365-db6fbadc2cd5",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "The Blackest Night - self",
							uuid = "2f68b929-a5c3-4256-a772-8563b6465f08",
							variableTogglesType = 3,
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
							uuid = "ff3512c4-38b9-65ae-b00c-ea9ebb77ba27",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "6cce3d89-4a06-6ba4-be73-9995544e0252",
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
							uuid = "347276ed-d0c6-349e-a8fc-9e227ce0fad3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "62b681a8-7475-6229-aae4-6e7ad59e885e",
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
							uuid = "c9ec0710-605b-83bc-9c43-94cceef13ff3",
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
							uuid = "95fefc90-64b8-7583-a365-db6fbadc2cd5",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 216.687,
				name = "[WAR+DRK][OT] The Blackest Night 03:34 - Paired source cadence",
				timeRange = true,
				timelineIndex = 52,
				timerEndOffset = -1.599717,
				timerOffset = 0.344,
				timerStartOffset = -2.349717,
				uuid = "e09c857d-0ff8-52d6-8e9d-94964d99638c",
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
				name = "Rank 1\\OT",
				uuid = "a67d99a9-f3d5-652f-ae79-8a5eaec8ab46",
			},
			objectType = "folder",
		},
	},
	[54] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "ac7d4735-c16a-eb11-5995-ec375c7e5c45",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[55] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "f65dde8c-a528-fc9a-83e8-8b21d1b590db",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "b2ab713c-b825-2474-b09f-425b9d1da555",
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
									"759541a7-52e3-275d-8680-fdae0acf9b51",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "577a9415-f645-a6a6-bf3f-648e724a537d",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "759541a7-52e3-275d-8680-fdae0acf9b51",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 229.343,
				name = "[DRK R1][MT] Reprisal 03:45",
				timelineIndex = 55,
				timerOffset = -3.802,
				uuid = "50c60ce6-2e48-c3a2-ada2-1f646d1e7bcc",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "238b6927-8271-75d3-50c9-fdc5654a4ab7",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "a4f8eb46-9c2e-0ee1-90a9-630bb24ddc82",
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
									"4a58225a-cb8f-e2fd-8941-8e8cfbf63534",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "809e074e-1795-8250-9154-7b93b8dc0438",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "4a58225a-cb8f-e2fd-8941-8e8cfbf63534",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 237.843,
				name = "[DRK R1][MT] Dark Missionary 03:57",
				timelineIndex = 56,
				timerOffset = -0.267,
				uuid = "a4f155f0-40ca-b133-b541-fa92dd7cefb1",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "35289cb6-3e74-3cb0-a767-0499d84ea458",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "6ba3d72a-22de-3a80-a456-af50e97c9aea",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "6646495c-8546-120d-9f0e-c8d74dc4fbb0",
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
									"d5c8a497-c2d7-c40f-9b64-167c9021c42d",
									true,
								},
								
								{
									"c6f3cfb3-4877-f54d-914a-38261ccc6618",
									true,
								},
								
								{
									"f91df0a5-6688-31b5-b9d7-7bf6c7ce45f5",
									true,
								},
								
								{
									"427ceaf5-6899-1432-b3e8-6b2df78a77a6",
									true,
								},
								
								{
									"07efe3f4-0706-c698-a3b1-79f4837a0ae8",
									true,
								},
								
								{
									"b4ccc037-5876-c471-b2a6-f3495d1c5165",
									true,
								},
								
								{
									"eaa8c7c4-0e57-51e8-8826-d179afa733ec",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "Reprisal - self",
							uuid = "776d084f-f0ee-6960-8f11-f5fc512ec867",
							variableTogglesType = 3,
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
							uuid = "d5c8a497-c2d7-c40f-9b64-167c9021c42d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "c6f3cfb3-4877-f54d-914a-38261ccc6618",
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
							uuid = "f91df0a5-6688-31b5-b9d7-7bf6c7ce45f5",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "427ceaf5-6899-1432-b3e8-6b2df78a77a6",
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
							uuid = "07efe3f4-0706-c698-a3b1-79f4837a0ae8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							comparator = 2,
							conditionType = 6,
							inRangeValue = 5,
							name = "Selected boss in Reprisal radius",
							uuid = "b4ccc037-5876-c471-b2a6-f3495d1c5165",
							version = 3,
						},
					},
					
					{
						data = 
						{
							conditionType = 5,
							name = "Selected target in combat",
							uuid = "eaa8c7c4-0e57-51e8-8826-d179afa733ec",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 237.843,
				name = "[WAR+DRK][OT] Reprisal 04:00 - Paired Reprisal - boss overlap unverified",
				timeRange = true,
				timelineIndex = 56,
				timerEndOffset = 2.831881,
				timerOffset = 2.316,
				timerStartOffset = 2.081881,
				uuid = "12645095-6a53-13d1-8d5e-a6f04d95fb68",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "4f635296-2cdd-be62-0806-73ec003bf466",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[60] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "f75200d0-fb55-12a4-ec98-1596c8cf2060",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[62] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "5d48efcd-475c-a93f-a31d-7fd77657d64e",
			},
			objectType = "folder",
		},
	},
	[63] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "2b6e8d9b-c0c7-392f-49b2-0a35303d24ab",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "d0ff0e7b-6790-b616-b929-63932e08a4b2",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "f8b3812a-5b08-ff61-a998-2169084c6696",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "03c34768-f961-8487-81b6-498dd6389302",
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
							actionID = 3638,
							conditions = 
							{
								
								{
									"8661c990-feb8-2aa0-ad5d-07c5c630b817",
									true,
								},
								
								{
									"9537bfb0-c992-906c-9890-2e79540bcfb1",
									true,
								},
								
								{
									"5ff045ce-6f25-99cc-9d6f-e8aec2d5add1",
									true,
								},
								
								{
									"6b99c6ad-2967-51b6-b6fb-e87ba9a0184a",
									true,
								},
								
								{
									"c9d5fdd2-65fb-7d09-ab15-df8977ef8b34",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "Living Dead - self",
							uuid = "fc9dd9a1-4364-8bdd-baf8-5bc83c2262fd",
							variableTogglesType = 3,
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
							uuid = "8661c990-feb8-2aa0-ad5d-07c5c630b817",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "9537bfb0-c992-906c-9890-2e79540bcfb1",
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
							uuid = "5ff045ce-6f25-99cc-9d6f-e8aec2d5add1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "6b99c6ad-2967-51b6-b6fb-e87ba9a0184a",
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
							uuid = "c9d5fdd2-65fb-7d09-ab15-df8977ef8b34",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 268.999,
				name = "[WAR+DRK][OT] Living Dead 04:25 - HotImpact2",
				timeRange = true,
				timelineIndex = 63,
				timerEndOffset = -3.224,
				timerOffset = 3.232,
				timerStartOffset = -3.974,
				uuid = "127cb084-d6bc-6055-959c-e0a0056d00d4",
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
				name = "Rank 1\\MT",
				uuid = "100f09dc-fbb8-9331-a29a-44ecf780d4ff",
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
									"a2f189f9-92a1-b78a-864b-5d06c8f506d5",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_TheBlackestNightSelf",
							name = "MT - The Blackest Night",
							uuid = "91f70b27-a754-f5cc-b59b-edcb5ea797a4",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "a2f189f9-92a1-b78a-864b-5d06c8f506d5",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 276.733,
				name = "[DRK R1][MT] The Blackest Night 04:37",
				timelineIndex = 65,
				timerOffset = 0.672,
				uuid = "631f748c-3f16-b50c-8ff2-3645928fdf7e",
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
				name = "Rank 1\\OT",
				uuid = "ce7c500d-cc6d-38a0-aad3-64e18a2c49e6",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "918a1f66-dbe2-b804-8a47-f7e9e8c3399c",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "a43688a8-c11d-eff2-8aaa-3b7c4149a8d8",
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
									"da26bb8b-7411-ddfb-b3e0-22c07563aec6",
									true,
								},
								
								{
									"54402096-30a5-607d-94d0-50f0a83738cf",
									true,
								},
								
								{
									"8f8d4ea8-22cb-2909-a040-db3baeb88f08",
									true,
								},
								
								{
									"03462fb6-4d10-f40b-a341-a943884a35c9",
									true,
								},
								
								{
									"4d11239b-b064-c8cb-af77-7295764c0ef9",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "Dark Mind - self",
							uuid = "f4ad3df3-305e-a9b7-bdd2-0dc3303a9073",
							variableTogglesType = 3,
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
							uuid = "da26bb8b-7411-ddfb-b3e0-22c07563aec6",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "54402096-30a5-607d-94d0-50f0a83738cf",
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
							uuid = "8f8d4ea8-22cb-2909-a040-db3baeb88f08",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "03462fb6-4d10-f40b-a341-a943884a35c9",
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
							uuid = "4d11239b-b064-c8cb-af77-7295764c0ef9",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 288.889,
				name = "[WAR+DRK][OT] Dark Mind 04:46 - Paired source cadence",
				timeRange = true,
				timelineIndex = 69,
				timerEndOffset = -1.765076,
				timerOffset = -0.414,
				timerStartOffset = -2.515076,
				uuid = "9b041eb3-cf7c-9a2d-9d1f-b58721ccc204",
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
									"549e013d-8bbe-7eeb-ac53-b35ee650754d",
									true,
								},
								
								{
									"2584d0c1-8ab3-a099-8cc9-e53d74eb7851",
									true,
								},
								
								{
									"ef6d2403-a716-9613-bd86-5e07636d21ff",
									true,
								},
								
								{
									"35245389-fc7a-eb50-af98-9753978d3438",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "Oblation - self",
							uuid = "db6fb817-02f7-4c0c-bc4a-f6d56f1acdb3",
							variableTogglesType = 3,
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
							uuid = "549e013d-8bbe-7eeb-ac53-b35ee650754d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "2584d0c1-8ab3-a099-8cc9-e53d74eb7851",
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
							uuid = "ef6d2403-a716-9613-bd86-5e07636d21ff",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "35245389-fc7a-eb50-af98-9753978d3438",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 288.889,
				name = "[WAR+DRK][OT] Oblation 04:47 - Paired source cadence",
				timeRange = true,
				timelineIndex = 69,
				timerEndOffset = -1.14582,
				timerOffset = -0.391,
				timerStartOffset = -1.89582,
				uuid = "0d220cbb-28a1-c8a1-ac41-0b655439a684",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "c2ed8340-4d05-3114-ef3b-741aa03b2250",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[78] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "6ce14a63-208e-20d7-2907-9b6116d671f3",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "60120b2d-7e43-e836-97dd-dcac8355b2d6",
			},
			objectType = "folder",
		},
	},
	[79] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "48439f32-6e5e-fe06-7866-30f8cbddb282",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[82] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "3a2f3d1b-e827-9d51-8050-13185364d377",
			},
			objectType = "folder",
		},
	},
	[83] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "1b452fb1-9658-f89d-7a91-ff173c869641",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "0db09b80-c735-bece-bdd7-129d6e585884",
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
									"2e25e196-c4bb-d94b-96bd-b8c27ee7a99e",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_LivingDead",
							name = "MT - Living Dead",
							uuid = "4d617003-af2e-6b7e-96dc-bb9e5080ab9b",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "2e25e196-c4bb-d94b-96bd-b8c27ee7a99e",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 307.795,
				name = "[DRK R1][MT] Living Dead 05:09",
				timelineIndex = 83,
				timerOffset = 2.036,
				uuid = "9625bfa3-7475-e1a7-83b0-6ab9e17c0dc2",
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
				name = "Rank 1\\MT",
				uuid = "5dd9fa9a-50c3-ec77-87c5-379f0850d44f",
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
									"f6f7e7f3-08c5-920d-9a17-d00c90f91a40",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ArmsLength",
							name = "MT - Arm's Length",
							uuid = "220c22ee-8f28-c55c-a995-20bb96f4d563",
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
							uuid = "f6f7e7f3-08c5-920d-9a17-d00c90f91a40",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 313.655,
				name = "[DRK R1][MT] Arm's Length 05:11",
				timelineIndex = 84,
				timerOffset = -1.953,
				uuid = "cf64c11e-c3a3-fb15-a9bc-0d6456c6626a",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "dbb37740-1336-dc3b-a090-785438568a00",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "08c8f2e6-618f-6caf-afd5-97640eb26bb1",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "cb3a0d22-6f1a-24b1-9223-56531655e1a2",
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
									"05b1431e-f6b8-d7d3-b524-7dcced131602",
									true,
								},
								
								{
									"6ed38e36-78df-aeea-bf34-6c5ec70573a1",
									true,
								},
								
								{
									"de143acb-90cf-c3e1-b07e-44513851235b",
									true,
								},
								
								{
									"d882aa92-efa8-1b0d-9551-4966b70ced73",
									true,
								},
								
								{
									"bbe95d6a-0f2f-8650-a967-7aeeedfd96cf",
									true,
								},
								
								{
									"740d9f31-cc27-e354-8501-7ea80f4f4780",
									true,
								},
								
								{
									"17d7ca06-2cfc-de30-aced-012e38800835",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "Reprisal - self",
							uuid = "03a2b4fa-4041-4b51-817e-20e4280c398e",
							variableTogglesType = 3,
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
							uuid = "05b1431e-f6b8-d7d3-b524-7dcced131602",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "6ed38e36-78df-aeea-bf34-6c5ec70573a1",
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
							uuid = "de143acb-90cf-c3e1-b07e-44513851235b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "d882aa92-efa8-1b0d-9551-4966b70ced73",
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
							uuid = "bbe95d6a-0f2f-8650-a967-7aeeedfd96cf",
							version = 3,
						},
					},
					
					{
						data = 
						{
							comparator = 2,
							conditionType = 6,
							inRangeValue = 5,
							name = "Selected boss in Reprisal radius",
							uuid = "740d9f31-cc27-e354-8501-7ea80f4f4780",
							version = 3,
						},
					},
					
					{
						data = 
						{
							conditionType = 5,
							name = "Selected target in combat",
							uuid = "17d7ca06-2cfc-de30-aced-012e38800835",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 313.655,
				name = "[WAR+DRK][OT] Reprisal 05:09 - Paired Reprisal - boss overlap unverified",
				timeRange = true,
				timelineIndex = 84,
				timerEndOffset = -3.469511,
				timerOffset = 2.563,
				timerStartOffset = -4.219511,
				uuid = "20cde291-e19e-1984-9cc1-d6d6727ca8bb",
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
									"085cbe40-ea17-16a1-896b-ce7d8ee48fe9",
									true,
								},
								
								{
									"f05c9045-3abc-3cae-968e-d8e55b6dad91",
									true,
								},
								
								{
									"0c36aae5-2855-d050-a490-a28f4b7ba3f4",
									true,
								},
								
								{
									"39f668bd-4567-b454-9647-8732cf9849f3",
									true,
								},
								
								{
									"d8217266-6e55-3f75-a17b-10773918a835",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "Oblation - WAR",
							targetType = "Other Tank",
							uuid = "f77b468c-71af-9ff7-8536-a11d6480f531",
							variableTogglesType = 3,
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
							uuid = "085cbe40-ea17-16a1-896b-ce7d8ee48fe9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "f05c9045-3abc-3cae-968e-d8e55b6dad91",
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
							uuid = "0c36aae5-2855-d050-a490-a28f4b7ba3f4",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "39f668bd-4567-b454-9647-8732cf9849f3",
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
							uuid = "d8217266-6e55-3f75-a17b-10773918a835",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 313.655,
				name = "[WAR+DRK][OT] Oblation 05:11 - DeepImpact2",
				timeRange = true,
				timelineIndex = 84,
				timerEndOffset = -2.157,
				timerOffset = 3.438,
				timerStartOffset = -2.907,
				uuid = "4fb5bba7-208b-522c-b8e2-ed21db0a94dc",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "765cad57-dead-af6b-b3e8-7871bd3b65e7",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[86] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "d91cb10c-cb07-4220-3653-cfc2146ca19c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "c05e67f8-85a4-44b5-b1ef-2172cec06a0b",
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
									"0149a5c6-6953-f610-a65f-51744e0462dd",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "838e1fe2-e025-3d5c-89ff-f61ad653a084",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "0149a5c6-6953-f610-a65f-51744e0462dd",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 321.155,
				name = "[DRK R1][MT] Reprisal 05:18",
				timelineIndex = 86,
				timerOffset = -2.415,
				uuid = "24a71ccb-fbdb-94e3-a173-642167fd2fc3",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "89701ad5-9cc6-b3f1-1c1d-dd0794d8abe5",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[94] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "833897e9-d77b-7d54-b7af-fd60a90a3ea5",
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
									"4b4d4d86-f1de-d560-87ef-28e7f9e382f0",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "198a8eba-62a6-8fb1-8ff9-62c6300dafd4",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "4b4d4d86-f1de-d560-87ef-28e7f9e382f0",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 348.763,
				name = "[DRK R1][MT] Dark Missionary 05:50",
				timelineIndex = 94,
				timerOffset = 2.017,
				uuid = "3e7f580a-d5d7-0634-b8aa-b3055de6d663",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "7d00223c-8f22-22e0-e021-56ba7c75200c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[111] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "69110595-0b08-8409-6788-3beb8f47f965",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "a292bb7a-b596-e857-8ca9-4a5514c5bff3",
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
									"d08a6f10-42ab-17ac-8018-50810d898425",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Reprisal",
							name = "MT - Reprisal",
							uuid = "b0533b8e-5ca2-7d6d-9bfe-232aa2990c25",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "d08a6f10-42ab-17ac-8018-50810d898425",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 400.075,
				name = "[DRK R1][MT] Reprisal 06:37",
				timelineIndex = 111,
				timerOffset = -2.974,
				uuid = "b1cbccc1-aad1-f41e-9f57-9cf8fa11b63c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "6264caed-da3c-029c-b291-9f5e03bfba5a",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "326bb408-5690-7dc4-9d8f-3a08226cfba0",
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
									"dab49219-19db-fd83-9619-556f8fd46191",
									true,
								},
								
								{
									"bc16cc31-bdab-1ed7-aa94-690a4cfef95c",
									true,
								},
								
								{
									"32f5a01a-6723-1713-a562-796bfdf1a5bd",
									true,
								},
								
								{
									"b8c94578-83cb-4aab-81fb-68fa25e055ca",
									true,
								},
								
								{
									"45ae77c9-bad8-7726-923a-f1dff6560fdf",
									true,
								},
								
								{
									"063a5d18-8bb0-a1c6-b116-37de7e3fadb1",
									true,
								},
								
								{
									"56f7bdfd-a748-c160-a99f-a66b0b8926f8",
									true,
								},
							},
							endIfUsed = true,
							name = "Reprisal - self",
							uuid = "21105fd0-3e9b-0065-a755-eaf08988cd1a",
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
							uuid = "dab49219-19db-fd83-9619-556f8fd46191",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "bc16cc31-bdab-1ed7-aa94-690a4cfef95c",
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
							uuid = "32f5a01a-6723-1713-a562-796bfdf1a5bd",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "b8c94578-83cb-4aab-81fb-68fa25e055ca",
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
							uuid = "45ae77c9-bad8-7726-923a-f1dff6560fdf",
							version = 3,
						},
					},
					
					{
						data = 
						{
							comparator = 2,
							conditionType = 6,
							inRangeValue = 5,
							name = "Selected boss in Reprisal radius",
							uuid = "063a5d18-8bb0-a1c6-b116-37de7e3fadb1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							conditionType = 5,
							name = "Selected target in combat",
							uuid = "56f7bdfd-a748-c160-a99f-a66b0b8926f8",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 400.075,
				name = "[WAR+DRK][OT] Reprisal 06:36 - Paired source cadence",
				timeRange = true,
				timelineIndex = 111,
				timerEndOffset = -3.083,
				timerStartOffset = -3.833,
				uuid = "3e7b2902-e225-5dd4-ad68-e53d802470fa",
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
				name = "WAR + DRK",
				uuid = "b0b35222-e253-be4b-8d82-3b0de2f4a891",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "db860a9c-a4ff-1e7d-ac30-0304498d9751",
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
							actionID = 7533,
							conditions = 
							{
								
								{
									"3c5bc4bc-9cd5-95ca-a9f7-1a1735bdca57",
									true,
								},
								
								{
									"4fe6a320-ee95-3789-9639-9e1b8b4fa1cc",
									true,
								},
								
								{
									"91d740db-b828-c2b0-bddf-aaaf67fd250b",
									true,
								},
								
								{
									"a4db9f97-fcc1-da0e-86f3-5c3523e9d579",
									true,
								},
								
								{
									"5ba513c4-b0bc-b21e-b23f-27010e9ba77e",
									true,
								},
								
								{
									"42dba145-5cdb-bff1-a596-a9b8f8db8450",
									true,
								},
							},
							endIfUsed = true,
							name = "Provoke - self",
							targetName = "Red Hot",
							targetType = "Named Target",
							uuid = "2f026d7b-f7b4-a9ca-838f-e9973b29f0ff",
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
							uuid = "3c5bc4bc-9cd5-95ca-a9f7-1a1735bdca57",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "4fe6a320-ee95-3789-9639-9e1b8b4fa1cc",
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
							uuid = "91d740db-b828-c2b0-bddf-aaaf67fd250b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "a4db9f97-fcc1-da0e-86f3-5c3523e9d579",
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
							name = "Cooldown ready",
							uuid = "5ba513c4-b0bc-b21e-b23f-27010e9ba77e",
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
							name = "Red Hot in Provoke range",
							partyTargetName = "Red Hot",
							partyTargetType = "Named Target",
							uuid = "42dba145-5cdb-bff1-a596-a9b8f8db8450",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 406.262,
				name = "[WAR+DRK][OT] Provoke 06:46 - Coordinated WAR handoff",
				timeRange = true,
				timelineIndex = 112,
				timerEndOffset = 0.802,
				timerStartOffset = 0.052,
				uuid = "aea55e0a-7b70-869b-841e-6671e555b6d0",
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
				uuid = "fe49e5de-2163-511c-a8e5-a89ebda6814f",
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
									"13d5f230-49db-7a6c-ae7d-4f395a6f9064",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_Rampart",
							name = "MT - Rampart",
							uuid = "5e28623f-c47a-36d3-bf97-d069b9e39512",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "13d5f230-49db-7a6c-ae7d-4f395a6f9064",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 411.481,
				name = "[DRK R1][MT] Rampart 06:51",
				timelineIndex = 113,
				timerOffset = 0.237,
				uuid = "464f6f5f-d9d4-92dc-adc6-410c00fbc1ba",
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
									"601c005f-7786-c109-90d4-c4d3687e7cf3",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_ShadowedVigil",
							name = "MT - Shadowed Vigil",
							uuid = "b0b9631b-72fe-411c-966f-e4e0b3608b16",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "601c005f-7786-c109-90d4-c4d3687e7cf3",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 411.481,
				name = "[DRK R1][MT] Shadowed Vigil 06:52",
				timelineIndex = 113,
				timerOffset = 0.951,
				uuid = "75a28ba7-0dd8-bc00-891a-a209d358597b",
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
				name = "Rank 1\\OT",
				uuid = "0cccc61d-91d4-3d33-9638-6f83bccaa442",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "0bf7f821-37dd-064e-af0f-29b4c72a8fa7",
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
									"009ed29d-f6f9-dc26-bd80-f23d0817df1f",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "MT - Dark Mind",
							uuid = "d3bce87d-e3a9-f1cd-ab00-d7d23e0e9f0b",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "009ed29d-f6f9-dc26-bd80-f23d0817df1f",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 415.84,
				name = "[DRK R1][MT] Dark Mind 06:59",
				timelineIndex = 115,
				timerOffset = 3.632,
				uuid = "8f22e184-4d87-fd5f-95ff-31d2b85f00a8",
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
				name = "Rank 1\\MT",
				uuid = "aceef808-9c5a-7220-9297-f4af1601ec69",
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
									"7093eba8-24b4-2db6-8b7a-cc6a75c8b832",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_OblationSelf",
							name = "MT - Oblation",
							uuid = "9d8712fc-ec76-5258-9e02-de5f4471134a",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "7093eba8-24b4-2db6-8b7a-cc6a75c8b832",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 424.231,
				name = "[DRK R1][MT] Oblation 07:01",
				timelineIndex = 116,
				timerOffset = -2.841,
				uuid = "6ffbd551-482f-a465-ac59-0d41e55095eb",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "4192995e-6167-757a-ae85-125fa031f445",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "8cfd8290-3a8a-7e48-9b94-fb26e5635cf9",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "806bdde1-2601-a93b-9ac4-2e2eb006c9cc",
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
									"c8eb6db2-e825-8e9f-9455-97e06c94494d",
									true,
								},
								
								{
									"0144c515-b210-1a5c-ae9a-9e2ef3971115",
									true,
								},
								
								{
									"237e31bf-02f0-9377-9085-39ddd83aae51",
									true,
								},
								
								{
									"39fc8092-31c9-e1b8-a77e-4b3adc03aa2f",
									true,
								},
								
								{
									"ecbdeaee-2990-c0d0-a72f-1efb62e5c0f3",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMind",
							name = "Dark Mind - self",
							uuid = "367e7ef9-7d6f-b2a4-aedf-3cb865b6959a",
							variableTogglesType = 3,
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
							uuid = "c8eb6db2-e825-8e9f-9455-97e06c94494d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "0144c515-b210-1a5c-ae9a-9e2ef3971115",
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
							uuid = "237e31bf-02f0-9377-9085-39ddd83aae51",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "39fc8092-31c9-e1b8-a77e-4b3adc03aa2f",
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
							uuid = "ecbdeaee-2990-c0d0-a72f-1efb62e5c0f3",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 424.231,
				name = "[WAR+DRK][OT] Dark Mind 07:02 - Paired source cadence",
				timeRange = true,
				timelineIndex = 116,
				timerEndOffset = -1.57,
				timerOffset = -1.3,
				timerStartOffset = -2.32,
				uuid = "87330c7e-47a3-1d57-b1e8-4e24efc3d214",
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
									"8cea29cc-d623-eba1-b427-950177b9e758",
									true,
								},
								
								{
									"76b5f2fb-938b-f5e2-9c02-4b3b513c420b",
									true,
								},
								
								{
									"552edf92-eb72-6fba-849f-a9ad7c3a148f",
									true,
								},
								
								{
									"a1003972-1cf9-d9df-adf6-ba29a88a919d",
									true,
								},
							},
							endIfUsed = true,
							name = "Oblation - self",
							uuid = "14db047b-4c80-a7e3-825b-f4287b168b2a",
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
							uuid = "8cea29cc-d623-eba1-b427-950177b9e758",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "76b5f2fb-938b-f5e2-9c02-4b3b513c420b",
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
							uuid = "552edf92-eb72-6fba-849f-a9ad7c3a148f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "a1003972-1cf9-d9df-adf6-ba29a88a919d",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 424.231,
				name = "[WAR+DRK][OT] Oblation 07:02 - Paired source cadence",
				timeRange = true,
				timelineIndex = 116,
				timerEndOffset = -0.9,
				timerStartOffset = -1.65,
				uuid = "a8886a8b-445a-eb5f-a1d7-c6e3289c3d41",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "f48dd9c4-5391-e9d8-53d3-1312462c2c94",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[121] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "0f948004-0ff1-9b28-0634-b5365bd041d4",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[124] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "2cf157e9-22d1-5ec5-db0c-0be3d98147f9",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\MT",
				uuid = "7051aaa2-f049-81cb-83b6-6e8869dd592e",
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
									"60f0fd09-418e-3f06-9127-6924c985d66d",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Hotbar_ArmsLength",
							name = "MT - Arm's Length",
							uuid = "491d4301-e210-27be-8afe-d01fa810d8d7",
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
							uuid = "60f0fd09-418e-3f06-9127-6924c985d66d",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 445.981,
				name = "[DRK R1][MT] Arm's Length 07:23",
				timelineIndex = 124,
				timerOffset = -2.787,
				uuid = "4e61c004-b73b-0807-a65b-fee2f82c45c9",
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
									"1f4ba9b0-66f9-f577-a58d-01ec5af3f629",
									true,
								},
							},
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "MT - Dark Missionary",
							uuid = "3350d746-b82e-79df-96ed-e2ba9bb30072",
							variableTogglesType = 3,
							version = 2.1,
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
							uuid = "1f4ba9b0-66f9-f577-a58d-01ec5af3f629",
							version = 3,
						},
					},
				},
				displayPath = "Rank 1\\MT",
				mechanicTime = 445.981,
				name = "[DRK R1][MT] Dark Missionary 07:26",
				timelineIndex = 124,
				timerOffset = 0.197,
				uuid = "c2c693c0-64df-7cce-b047-c5e6ca7f9838",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Rank 1\\OT",
				uuid = "fedb5fc1-8745-bd05-89be-1e888547aae4",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "9b9aa043-cf5e-a176-bb7f-c47549fa8687",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "c70127a1-355d-b05f-b246-9089ff81fbf2",
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
							actionID = 7548,
							conditions = 
							{
								
								{
									"05f60a9c-620a-558b-ac1b-be7dbc3598b9",
									true,
								},
								
								{
									"80c4b1b4-fe31-f893-a088-cc0eef292d95",
									true,
								},
								
								{
									"81a00e92-246b-d1ab-92d1-59a42a2d031a",
									true,
								},
								
								{
									"5d2de067-f0f6-d7d3-aae7-c07342536878",
									true,
								},
								
								{
									"97525fc9-af63-f733-a9b4-16c713fa008c",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Hotbar_ArmsLength",
							name = "Arm's Length - self",
							uuid = "c971b7af-e66d-62b6-8917-d28158d2f806",
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
							uuid = "05f60a9c-620a-558b-ac1b-be7dbc3598b9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "80c4b1b4-fe31-f893-a088-cc0eef292d95",
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
							uuid = "81a00e92-246b-d1ab-92d1-59a42a2d031a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "5d2de067-f0f6-d7d3-aae7-c07342536878",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7548,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Cooldown ready",
							uuid = "97525fc9-af63-f733-a9b4-16c713fa008c",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 445.981,
				name = "[WAR+DRK][OT] Arm's Length 07:23 - Paired source cadence",
				timeRange = true,
				timelineIndex = 124,
				timerEndOffset = -2.158,
				timerOffset = -2.742,
				timerStartOffset = -2.908,
				uuid = "84aa0b52-29a9-bbfd-adf2-e54ed71f19cb",
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
							actionID = 16471,
							conditions = 
							{
								
								{
									"5b11a9b0-fab4-4556-bc69-b7145f0ac11a",
									true,
								},
								
								{
									"2108405a-ef0f-aae9-a223-65c45f1b1f75",
									true,
								},
								
								{
									"ac6cbea0-372e-3bfc-a04e-ecd8246588d7",
									true,
								},
								
								{
									"fcfae194-ca91-b410-a945-84d138bc07a9",
									true,
								},
								
								{
									"160e6176-9f52-84c1-a968-d85157df4deb",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_RikuDRK3_Tankbar_DarkMissionary",
							name = "Dark Missionary - self",
							uuid = "c0fe1070-90a3-cd78-a1d1-b8127bd49758",
							variableTogglesType = 3,
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
							uuid = "5b11a9b0-fab4-4556-bc69-b7145f0ac11a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "2108405a-ef0f-aae9-a223-65c45f1b1f75",
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
							uuid = "ac6cbea0-372e-3bfc-a04e-ecd8246588d7",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "fcfae194-ca91-b410-a945-84d138bc07a9",
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
							uuid = "160e6176-9f52-84c1-a968-d85157df4deb",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 445.981,
				name = "[WAR+DRK][OT] Dark Missionary 07:22 - Paired source cadence",
				timeRange = true,
				timelineIndex = 124,
				timerEndOffset = -2.869,
				timerOffset = 3.23,
				timerStartOffset = -3.619,
				uuid = "a42d9bda-a140-fa45-8e44-5f6dd90a6e70",
				version = 2,
			},
		},
	},
	[127] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "73128dda-c68e-f6e6-f111-3b386c2e202a",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[128] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "a7615206-382e-4195-b432-d0685bc44730",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "bd808bf4-627e-dadf-b939-f5b59ec5f461",
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
									"a027d58b-35d1-0c0f-9df3-0a38a75e2cd5",
									true,
								},
								
								{
									"754ea3c9-b0c4-84a0-8007-3ed33035f382",
									true,
								},
								
								{
									"f3238011-4b41-f02c-b728-4f66f9851b42",
									true,
								},
								
								{
									"4bd90a1a-62a6-3bf1-9759-0f56815e6b6a",
									true,
								},
								
								{
									"72e047fa-966e-ed37-93b3-051266ce418f",
									true,
								},
								
								{
									"f355af05-5eb8-6bc7-a4a1-6c31afb6948d",
									true,
								},
								
								{
									"0cb5b460-f43f-7bfa-84f9-0b64e9c351e2",
									true,
								},
							},
							endIfUsed = true,
							name = "Reprisal - self",
							uuid = "c3ce01aa-2368-cac9-866d-f0aace45355c",
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
							uuid = "a027d58b-35d1-0c0f-9df3-0a38a75e2cd5",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "754ea3c9-b0c4-84a0-8007-3ed33035f382",
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
							uuid = "f3238011-4b41-f02c-b728-4f66f9851b42",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "4bd90a1a-62a6-3bf1-9759-0f56815e6b6a",
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
							uuid = "72e047fa-966e-ed37-93b3-051266ce418f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							comparator = 2,
							conditionType = 6,
							inRangeValue = 5,
							name = "Selected boss in Reprisal radius",
							uuid = "f355af05-5eb8-6bc7-a4a1-6c31afb6948d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							conditionType = 5,
							name = "Selected target in combat",
							uuid = "0cb5b460-f43f-7bfa-84f9-0b64e9c351e2",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 461.981,
				name = "[WAR+DRK][OT] Reprisal 07:44 - Paired source cadence",
				timeRange = true,
				timelineIndex = 128,
				timerEndOffset = 2.513,
				timerStartOffset = 1.763,
				uuid = "60509b53-90a8-c37a-837a-29aaf57a30dc",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "4947057c-5de1-9db0-f318-05de74ec114c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "d0251175-1596-3820-91fc-a0f4a8fc6ccd",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "0c2cb707-c2d5-e8a9-8b26-2c6d08e3092a",
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
							actionID = 7533,
							conditions = 
							{
								
								{
									"7e1ce899-bb79-28c4-8b7c-cb187f52e501",
									true,
								},
								
								{
									"888f32f2-a444-8890-a007-b24c24235d18",
									true,
								},
								
								{
									"b014a3ee-e584-e475-b65d-d411905b8282",
									true,
								},
								
								{
									"a0cfa5d8-1c87-79ad-9c90-f919552e2605",
									true,
								},
								
								{
									"82c1266a-e863-1cec-ab6c-eb4b207be41e",
									true,
								},
								
								{
									"8fd321e4-b732-03e1-a381-708a7c5f07db",
									true,
								},
							},
							endIfUsed = true,
							name = "Provoke - self",
							targetName = "Red Hot",
							targetType = "Named Target",
							uuid = "8a5e820b-f020-8fcd-8e4e-bae260b7b04b",
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
							uuid = "7e1ce899-bb79-28c4-8b7c-cb187f52e501",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "888f32f2-a444-8890-a007-b24c24235d18",
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
							uuid = "b014a3ee-e584-e475-b65d-d411905b8282",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "a0cfa5d8-1c87-79ad-9c90-f919552e2605",
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
							name = "Cooldown ready",
							uuid = "82c1266a-e863-1cec-ab6c-eb4b207be41e",
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
							name = "Red Hot in Provoke range",
							partyTargetName = "Red Hot",
							partyTargetType = "Named Target",
							uuid = "8fd321e4-b732-03e1-a381-708a7c5f07db",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 469.153,
				name = "[WAR+DRK][OT] Provoke 07:51 - Coordinated WAR handoff",
				timeRange = true,
				timelineIndex = 129,
				timerEndOffset = 2.335,
				timerStartOffset = 1.585,
				uuid = "f5ecdd55-8512-68b4-838a-327e01951160",
				version = 2,
			},
		},
	},
	[130] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "03be95ea-f429-685e-8f84-5c8ccd121a3a",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[132] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "c5154fd0-b10d-5504-7a95-360640d29220",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[136] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "b8d3f694-3229-a740-911f-52820af85c64",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[137] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "f0a2345c-4057-d082-8be9-16c1c7d85fa1",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "03bff309-ddc1-f040-b61f-58004f369a33",
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
									"a5d435d7-8d04-bfa6-9f8d-b2b734211741",
									true,
								},
								
								{
									"8d5208ee-f922-4c9c-a642-7149b94b9d68",
									true,
								},
								
								{
									"7c8fa850-c815-c0ca-b10d-74eb24986c21",
									true,
								},
								
								{
									"d230f418-cd0b-6480-9962-d74df0129ff5",
									true,
								},
								
								{
									"45003747-c930-4c4b-9975-345b910f84c9",
									true,
								},
							},
							endIfUsed = true,
							name = "Oblation - WAR",
							targetType = "Other Tank",
							uuid = "9e494d45-f386-8ded-903b-b4ab0b1a0494",
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
							uuid = "a5d435d7-8d04-bfa6-9f8d-b2b734211741",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "8d5208ee-f922-4c9c-a642-7149b94b9d68",
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
							uuid = "7c8fa850-c815-c0ca-b10d-74eb24986c21",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "d230f418-cd0b-6480-9962-d74df0129ff5",
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
							uuid = "45003747-c930-4c4b-9975-345b910f84c9",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 498.95,
				name = "[WAR+DRK][OT] Oblation 08:19 - Paired source cadence",
				timeRange = true,
				timelineIndex = 137,
				timerEndOffset = 0.914,
				timerStartOffset = 0.164,
				uuid = "acdae034-aa63-bfe6-9f86-85fcb838764f",
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
				name = "WAR + DRK",
				uuid = "6d1ec070-0b81-ae1b-8070-eec52bc82f5d",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "62734ee2-1748-d61f-a6b7-58b34e1b5073",
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
									"454c5372-5234-c731-bb4e-854b02c86dbb",
									true,
								},
								
								{
									"5c76a537-08f9-f6c8-8f40-4da9aa2ba3d6",
									true,
								},
								
								{
									"64d3093a-e5de-eda3-a9bc-7dc08c679e10",
									true,
								},
								
								{
									"2ab7c04c-3c4d-3e48-83d5-cc6fcbb6b8c3",
									true,
								},
								
								{
									"dbd04218-f465-a68a-964b-3e39721f891a",
									true,
								},
							},
							endIfUsed = true,
							name = "Shadowed Vigil - self",
							uuid = "cab8bd48-9b57-19ab-963d-92b8089664ee",
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
							uuid = "454c5372-5234-c731-bb4e-854b02c86dbb",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "5c76a537-08f9-f6c8-8f40-4da9aa2ba3d6",
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
							uuid = "64d3093a-e5de-eda3-a9bc-7dc08c679e10",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "2ab7c04c-3c4d-3e48-83d5-cc6fcbb6b8c3",
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
							uuid = "dbd04218-f465-a68a-964b-3e39721f891a",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 504.606,
				name = "[WAR+DRK][OT] Shadowed Vigil 08:22 - Paired source cadence",
				timeRange = true,
				timelineIndex = 138,
				timerEndOffset = -1.892,
				timerStartOffset = -2.642,
				uuid = "0802706b-be45-b2f7-8cb4-3172d7c1d29e",
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
									"14154514-6f86-a02b-9695-ef5af782a547",
									true,
								},
								
								{
									"2bdeb86c-6eb2-f106-8f6d-d212ccc43426",
									true,
								},
								
								{
									"d3d17cc0-f99e-f47f-b50f-181c79160643",
									true,
								},
								
								{
									"714f4347-d665-31d4-9063-607def3fe6f9",
									true,
								},
								
								{
									"9d1c5f70-5be9-e416-ac16-32b367b42736",
									true,
								},
								
								{
									"883058e4-6c7c-8793-a0a1-5e8e165e572a",
									true,
								},
							},
							endIfUsed = true,
							name = "The Blackest Night - self",
							uuid = "6353beb5-3c22-ff51-ae95-246da0a745d5",
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
							uuid = "14154514-6f86-a02b-9695-ef5af782a547",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "2bdeb86c-6eb2-f106-8f6d-d212ccc43426",
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
							uuid = "d3d17cc0-f99e-f47f-b50f-181c79160643",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "714f4347-d665-31d4-9063-607def3fe6f9",
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
							uuid = "9d1c5f70-5be9-e416-ac16-32b367b42736",
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
							uuid = "883058e4-6c7c-8793-a0a1-5e8e165e572a",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 504.606,
				name = "[WAR+DRK][OT] The Blackest Night 08:23 - Paired source cadence",
				timeRange = true,
				timelineIndex = 138,
				timerEndOffset = -1.222,
				timerStartOffset = -1.972,
				uuid = "b2e2657f-e465-31f3-9e68-93c6966541b1",
				version = 2,
			},
		},
	},
	[140] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "3e87577b-287a-eb17-4a05-20416c1529cb",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[144] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "ba9dd4ff-d49d-0b33-7c39-4df51c6be0cf",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[146] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "ae3217ad-61d1-6471-cab9-efe79a22e57d",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "277164ed-6d14-dcec-af6c-2f16299c4cda",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "6d6bb087-9c76-b7ef-a5bc-274b69640689",
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
									"12575636-662d-676b-ba26-4eccd5e7e340",
									true,
								},
								
								{
									"4c1c054e-c68d-2b7a-8993-48353936068a",
									true,
								},
								
								{
									"4a82ef59-84d4-0e44-8ed1-9c32f1045838",
									true,
								},
								
								{
									"861df3fe-07f5-4ede-9bb5-d0de9e99c8e6",
									true,
								},
								
								{
									"bda003b5-1818-48a4-9d74-6a361b311d89",
									true,
								},
								
								{
									"59b8b10a-9ef3-e178-917e-7e9642c0f30f",
									true,
								},
								
								{
									"e08937ed-7ebe-1718-ac52-b9af0085545d",
									true,
								},
							},
							endIfUsed = true,
							name = "Reprisal - self",
							uuid = "f40fbcb0-dc54-dee7-93e7-7ce9267174d1",
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
							uuid = "12575636-662d-676b-ba26-4eccd5e7e340",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "4c1c054e-c68d-2b7a-8993-48353936068a",
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
							uuid = "4a82ef59-84d4-0e44-8ed1-9c32f1045838",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "861df3fe-07f5-4ede-9bb5-d0de9e99c8e6",
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
							uuid = "bda003b5-1818-48a4-9d74-6a361b311d89",
							version = 3,
						},
					},
					
					{
						data = 
						{
							comparator = 2,
							conditionType = 6,
							inRangeValue = 5,
							name = "Selected boss in Reprisal radius",
							uuid = "59b8b10a-9ef3-e178-917e-7e9642c0f30f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							conditionType = 5,
							name = "Selected target in combat",
							uuid = "e08937ed-7ebe-1718-ac52-b9af0085545d",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 527.606,
				name = "[WAR+DRK][OT] Reprisal 08:44 - Paired source cadence",
				timeRange = true,
				timelineIndex = 146,
				timerEndOffset = -2.477,
				timerStartOffset = -3.227,
				uuid = "87269b01-0027-dbcb-99cb-88754f3dca21",
				version = 2,
			},
		},
	},
	[148] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "125eb053-c43d-cd5f-09f7-2189ac6894a3",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[155] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "4768723d-9514-e281-3197-fd3b85dd030d",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR + DRK",
				uuid = "0be73003-2a0e-78e8-9c28-81ce490ac3c5",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "WAR + DRK",
				name = "OT",
				uuid = "76361d96-a99d-a77e-a412-eda41a850733",
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
									"2cc51d60-68b4-cee9-bf3e-a8b7d6f8818c",
									true,
								},
								
								{
									"7a623dc2-a7d8-cdc5-8d5b-9a5b9ee050e6",
									true,
								},
								
								{
									"f9709240-70e6-f65b-a7be-d4d6ce97e81c",
									true,
								},
								
								{
									"fea4b124-14b6-2051-9e6d-dda234a3db21",
									true,
								},
								
								{
									"4d52127d-26dd-4d1b-9416-884e0b5581c3",
									true,
								},
							},
							endIfUsed = true,
							name = "Oblation - WAR",
							targetType = "Other Tank",
							uuid = "becbe0eb-00d4-7c81-9439-bb4d37033aff",
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
							uuid = "2cc51d60-68b4-cee9-bf3e-a8b7d6f8818c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "7a623dc2-a7d8-cdc5-8d5b-9a5b9ee050e6",
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
							uuid = "f9709240-70e6-f65b-a7be-d4d6ce97e81c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "fea4b124-14b6-2051-9e6d-dda234a3db21",
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
							uuid = "4d52127d-26dd-4d1b-9416-884e0b5581c3",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 555.183,
				name = "[WAR+DRK][OT] Oblation 09:11 - Deep Impact 3 - WAR prog fallback",
				timeRange = true,
				timelineIndex = 155,
				timerEndOffset = -3.5,
				timerStartOffset = -4.5,
				uuid = "72cd219d-f480-2936-9c75-94355bc7ff0b",
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
									"71e0bea0-7970-83a3-a359-3e1a84091662",
									true,
								},
								
								{
									"ebb01572-635a-254f-8c2b-54e9b3da834a",
									true,
								},
								
								{
									"ff741240-d47a-c33c-967e-bb9bc6eb38ee",
									true,
								},
								
								{
									"f1256a0e-ec58-fd12-bd27-bfb3efebacac",
									true,
								},
								
								{
									"e068711d-efb3-d329-9ca3-8dd66815bfe3",
									true,
								},
								
								{
									"2f0462c3-9f7a-7231-88ea-a06195f9da2d",
									true,
								},
								
								{
									"c9d24a68-5996-3827-9240-f5b4349825a3",
									true,
								},
							},
							endIfUsed = true,
							name = "The Blackest Night - WAR",
							targetType = "Other Tank",
							uuid = "30ea2b14-c4bc-3631-8429-e42f5fdadae1",
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
							uuid = "71e0bea0-7970-83a3-a359-3e1a84091662",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In combat",
							uuid = "ebb01572-635a-254f-8c2b-54e9b3da834a",
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
							uuid = "ff741240-d47a-c33c-967e-bb9bc6eb38ee",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal profile = gACRSelectedProfiles and gACRSelectedProfiles[player.job]\nreturn player.alive and profile ~= nil and _G[\"ACR_\" .. profile .. \"_TankStance\"] == \"ot\"",
							name = "Alive / OT assignment",
							uuid = "f1256a0e-ec58-fd12-bd27-bfb3efebacac",
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
							uuid = "e068711d-efb3-d329-9ca3-8dd66815bfe3",
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
							uuid = "2f0462c3-9f7a-7231-88ea-a06195f9da2d",
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
							uuid = "c9d24a68-5996-3827-9240-f5b4349825a3",
							version = 3,
						},
					},
				},
				displayPath = "WAR + DRK/OT",
				mechanicTime = 555.183,
				name = "[WAR+DRK][OT] The Blackest Night 09:12 - Deep Impact 3 - WAR prog fallback",
				timeRange = true,
				timelineIndex = 155,
				timerEndOffset = -2,
				timerStartOffset = -3,
				uuid = "49c9429b-9711-31a1-96a7-b81745e04d50",
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
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "74c83db8-5a37-bce4-e077-36a6e01a8808",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	[159] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m10s\\main",
				uuid = "9c640621-5b63-a91d-103c-58f736b078f1",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m10s\\main",
			objectType = "folder",
		},
	},
	inheritedProfiles = 
	{
		"store\\anyone\\savage6\\m10s\\main",
	},
	timelineName = "r10s",
	version = "1.5.0",
}



return tbl