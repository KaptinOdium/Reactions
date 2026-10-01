local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6940f428-8d06-825c-12a8-fd86ccdcccf8",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[MT] Stance off",
				uuid = "837c0861-0cbb-7d73-ba86-25311d8761d7",
				version = 2,
			},
			inheritedObjectUUID = "5e3dee50-2322-d74e-a106-7f457ba18105",
			inheritedOverwrites = 
			{
				name = "[MT] Stance off",
			},
		},
		
		{
			data = 
			{
				name = "[MT] Reprisal",
				uuid = "c3dd6b2f-c74e-645a-8ab6-91d1f0356bc0",
				version = 2,
			},
			inheritedObjectUUID = "c4b237eb-ffcd-87a2-8633-8de178059c5b",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "",
								uuid = "b95057d4-0b7c-7f34-8e4f-12e5db8b9f58",
								version = 2.1,
							},
							inheritedObjectUUID = "c1ff1ac8-329b-227e-9695-ef77c14a6d3c",
							inheritedOverwrites = 
							{
								conditions = 
								{
									
									{
										type = "remove",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 1,
										type = "add",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 2,
										type = "add",
										value = 
										{
											"32ac9540-742b-422f-8819-5a9583e0d93e",
											true,
										},
									},
								},
							},
						},
					},
				},
				conditions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								category = "Lua",
								conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
								name = "Reprisal real melee range",
								uuid = "32ac9540-742b-422f-8819-5a9583e0d93e",
								version = 3,
							},
						},
					},
				},
			},
		},
		
		{
			data = 
			{
				name = "[DMU Opt] Potion HOLD - Countdown",
				uuid = "3b8fad02-4258-2785-8ed8-6e740d395a62",
				version = 2,
			},
			inheritedObjectUUID = "b236ea8b-8840-cc66-a740-3b952a6c520c",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "Apply selected potion plan at countdown",
								uuid = "9ffd36f9-fb05-1176-84bb-3223f24db3c4",
								version = 2.1,
							},
							inheritedObjectUUID = "f55d3e97-6a82-24d3-8dde-4b13890e3c1e",
							inheritedOverwrites = 
							{
								actionLua = "KaptinDMUControls = KaptinDMUControls or {}\nlocal controls = KaptinDMUControls\nif controls.potPlan == nil then\n    controls.potPlan = 1\nend\n\nif controls.potPlan == 1 then\n    local tensorACR = TensorCore and TensorCore.API and TensorCore.API.TensorACR\n    if tensorACR ~= nil and tensorACR.holdActionUntil ~= nil then\n        local queuedAt = tonumber(eventArgs.timeQueued) or Now()\n        local countdown = math.max(0, tonumber(eventArgs.time) or 0)\n        tensorACR.holdActionUntil(846, queuedAt + (countdown + 3) * 1000, 1)\n    end\nend\n\nself.used = true",
								name = "Apply selected potion plan at countdown",
							},
						},
					},
				},
			},
		},
		
		{
			data = 
			{
				name = "[DMU Opt] Potion HOLD - Wipe",
				uuid = "c4aa58a5-89ba-f55e-98e9-d765b2bccc68",
				version = 2,
			},
			inheritedObjectUUID = "fc2fb72a-360e-9daa-8a2f-3b346378cef2",
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
				uuid = "2454f698-2be0-10fc-250d-17da91ad55e8",
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
							gVar = "ACR_RikuWAR3_Tankbar_Rampart",
							uuid = "a310d128-ef23-6e7d-9bbd-cdad9dc20e44",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 15.261765625,
				name = "[Tank] Rampart",
				timelineIndex = 1,
				timerOffset = -14,
				uuid = "e68a798b-81b7-8226-a860-9bd34e0c0f51",
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
							gVar = "ACR_RikuWAR3_Tankbar_ThrillOfBattle",
							uuid = "e4b428d3-6582-9e40-8df5-9cd329be471b",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 15.261765625,
				name = "[WAR] Thrill of battle",
				timelineIndex = 1,
				timerOffset = -4,
				uuid = "7bbb96fe-b3bf-4428-8b1b-5b36254fe7f3",
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
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "58bcde62-6cce-11bd-b7a4-58a5c6656b06",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 15.261765625,
				name = "[WAR] Whetting",
				timelineIndex = 1,
				timerOffset = -3,
				uuid = "080d7a21-3084-5e5d-b3b0-92a560c65d1b",
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
							gVar = "ACR_RikuWAR3_Tankbar_Equilibrium",
							uuid = "14861bc3-5569-4ba6-aced-227408ecbea7",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 15.261765625,
				name = "[WAR] Equilibrium",
				timelineIndex = 1,
				timerOffset = -8,
				uuid = "baf600d6-aad9-8151-a37a-f0ca7b297b76",
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
							gVar = "ACR_RikuWAR3_Tankbar_Damnation",
							uuid = "efe28881-8586-3e1a-8acc-2ad6ef6e50f4",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 15.261765625,
				name = "[WAR] Damnation ",
				timelineIndex = 1,
				timerOffset = -8,
				uuid = "111ca1d9-d8aa-64a2-a592-94de7952abec",
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
							gVar = "ACR_RikuWAR3_Hotbar_ShirkOT",
							uuid = "383845e7-be55-526c-9b6a-9bd940265616",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 15.261765625,
				name = "[Tank] Shirk OT",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 2,
				timerOffset = -0.5,
				timerStartOffset = -0.5,
				uuid = "d94de111-ed9f-5197-a3e3-0a982b4726ce",
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
							gVar = "ACR_RikuWAR3_Hotbar_Provoke",
							uuid = "4d46f271-7f86-dc75-8c6c-c196fda3ce1b",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 15.261765625,
				name = "[MT] Provoke",
				timelineIndex = 1,
				timerOffset = -15,
				uuid = "f559b8bd-edd6-6c6c-b7f3-da6bc53f3525",
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
									"9aa7e26c-7119-2f47-a910-bfeb0cc0ab92",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Hotbar_Defiance",
							uuid = "5be1b8fc-ea61-9272-ad8b-ad7ea121d08a",
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
							buffID = 91,
							category = "Self",
							uuid = "9aa7e26c-7119-2f47-a910-bfeb0cc0ab92",
							version = 3,
						},
					},
				},
				mechanicTime = 15.261765625,
				name = "[MT] Stance on",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = -13,
				timerOffset = -16,
				timerStartOffset = -17,
				uuid = "3ffc97ae-b059-a6e0-a82c-8eabf204415f",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Controls",
				uuid = "f36223b8-3788-efbb-94c7-b34e7088b615",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR Kill Potions",
				uuid = "4ea66c07-853e-b9be-89db-28c677a3dc10",
			},
			objectType = "folder",
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
							actionLua = "if data.warDmuKillPots == nil then\n    data.warDmuKillPots = { previousAutoPotion = ACR_RikuWAR3_Potion }\nend\nself.used = true",
							conditions = 
							{
								
								{
									"ecd494ba-9c8f-be71-9b28-efae5865d0e5",
									true,
								},
								
								{
									"077cc6bc-fd70-6383-8f5d-a3fc2da6f201",
									true,
								},
								
								{
									"b2aefb11-ceb8-1256-a34a-bc1f89e04211",
									true,
								},
							},
							name = "Remember Auto Potion",
							uuid = "48bfa113-98fd-69ca-8bf5-f27913f88bfa",
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
									"ecd494ba-9c8f-be71-9b28-efae5865d0e5",
									true,
								},
								
								{
									"077cc6bc-fd70-6383-8f5d-a3fc2da6f201",
									true,
								},
								
								{
									"b2aefb11-ceb8-1256-a34a-bc1f89e04211",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Potion",
							gVarValue = 2,
							uuid = "78851299-619e-7ca1-a8bb-e4ae7b794b30",
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
							jobValue = "WARRIOR",
							name = "Warrior",
							uuid = "ecd494ba-9c8f-be71-9b28-efae5865d0e5",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In Combat",
							uuid = "077cc6bc-fd70-6383-8f5d-a3fc2da6f201",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 2,
							hpType = 2,
							hpValue = 1,
							name = "Alive",
							uuid = "b2aefb11-ceb8-1256-a34a-bc1f89e04211",
							version = 3,
						},
					},
				},
				displayPath = "WAR Kill Potions",
				mechanicTime = 15.261765625,
				name = "[WAR] Kill pot plan - start",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = -10.261765625,
				timerStartOffset = -15.261765625,
				uuid = "d07b57af-b159-8c3f-9554-f28f40e763d4",
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
							actionLua = "local state = eventArgs.oldData.warDmuKillPots\nif state ~= nil and state.previousAutoPotion ~= nil then\n    ACR_RikuWAR3_Potion = state.previousAutoPotion\n    state.previousAutoPotion = nil\nend\nself.used = true",
							name = "Restore Auto Potion",
							uuid = "a5a3dc1b-7d2c-d4c4-8782-da7ad04398f8",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "WAR Kill Potions",
				eventType = 9,
				mechanicTime = 15.261765625,
				name = "[WAR] Kill pot plan - restore on wipe",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 1234.738234375,
				timerStartOffset = -75.261765625,
				uuid = "1823745f-de8a-ec44-97bb-cc825672c3ee",
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
				uuid = "5cc3a6d5-b380-38a9-a551-2f1707458f65",
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
									"9aa7e26c-7119-2f47-a910-bfeb0cc0ab92",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Hotbar_Defiance",
							uuid = "5be1b8fc-ea61-9272-ad8b-ad7ea121d08a",
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
							buffID = 91,
							category = "Self",
							uuid = "9aa7e26c-7119-2f47-a910-bfeb0cc0ab92",
							version = 3,
						},
					},
				},
				mechanicTime = 18.37640625,
				name = "[MT] Stance off",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 3,
				timerOffset = -16,
				timerStartOffset = -1,
				uuid = "b264dc9e-b2d8-6576-82c7-27b1dcffe93b",
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
				uuid = "84958642-be4b-d5e6-4d98-d57cb74ff612",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "94b47d26-ab24-78fa-4b1e-bddcaf149636",
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
				uuid = "2693c46f-7175-2d0b-14ad-933d86b56fff",
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
				uuid = "cc42ca34-4e9f-a7f0-5d63-1d8a981ad484",
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
									"54170f60-c647-9cac-b4b1-ff79e14ecfe4",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "6889f4c9-147b-4f2c-b432-abe099d52d09",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "54170f60-c647-9cac-b4b1-ff79e14ecfe4",
							version = 3,
						},
					},
				},
				mechanicTime = 37.212891227673,
				name = "[Tank] Reprisal",
				timelineIndex = 5,
				timerOffset = -3,
				uuid = "82563239-036c-c4a2-b179-b08b9b0c3fc8",
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
							gVar = "ACR_RikuWAR3_Tankbar_ShakeItOff",
							uuid = "8fcc181c-8d69-5693-8702-556f05525d3e",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 37.212891227673,
				name = "[WAR] Shake ",
				timelineIndex = 5,
				timerOffset = -10,
				uuid = "cb7543d6-2771-247a-913a-ecfef20eaf4b",
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
				uuid = "ddaf8c81-3f2e-961d-64f7-d22b932ff2d1",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "be01499f-d978-7c8b-c602-87e520f0ae6f",
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
				uuid = "885ed2de-2f39-086a-956f-27100e3e37ae",
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
				uuid = "f58026cb-d7ce-5daf-0b55-76e1aa2ede9b",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[OT] Reprisal",
				uuid = "57f6aa09-5602-d7ce-9498-0e96a70b9179",
				version = 2,
			},
			inheritedObjectUUID = "f40833bd-2869-af7e-b01a-86031caa0e46",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "",
								uuid = "e3dddd9c-9ca3-4fd9-8e27-a3deb7616b26",
								version = 2.1,
							},
							inheritedObjectUUID = "c1ff1ac8-329b-227e-9695-ef77c14a6d3c",
							inheritedOverwrites = 
							{
								conditions = 
								{
									
									{
										type = "remove",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 1,
										type = "add",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 2,
										type = "add",
										value = 
										{
											"b84590b2-af31-9b66-8424-67ffb6c32530",
											true,
										},
									},
								},
							},
						},
					},
				},
				conditions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								category = "Lua",
								conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
								name = "Reprisal real melee range",
								uuid = "b84590b2-af31-9b66-8424-67ffb6c32530",
								version = 3,
							},
						},
					},
				},
			},
		},
	}, 
	[10] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "f43c45a0-6c2b-286c-b074-bc3af2234b30",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[11] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1eeca1bb-4d10-3a87-afe9-f96d98a4484b",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[12] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "7542481a-2cf8-b2b6-d684-45c0cbe45baa",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[MT] Reprisal",
				uuid = "fae9f1f3-44ef-308b-89a4-86b315e4d09a",
				version = 2,
			},
			inheritedObjectUUID = "b6bd4362-846d-b28e-a00f-23b2fc8cfa6d",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "",
								uuid = "bd8857cd-01c5-bcca-9d36-238746a0179b",
								version = 2.1,
							},
							inheritedObjectUUID = "c1ff1ac8-329b-227e-9695-ef77c14a6d3c",
							inheritedOverwrites = 
							{
								conditions = 
								{
									
									{
										type = "remove",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 1,
										type = "add",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 2,
										type = "add",
										value = 
										{
											"f356c2b3-6f74-ffbd-a297-ad51436fb0a2",
											true,
										},
									},
								},
							},
						},
					},
				},
				conditions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								category = "Lua",
								conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
								name = "Reprisal real melee range",
								uuid = "f356c2b3-6f74-ffbd-a297-ad51436fb0a2",
								version = 3,
							},
						},
					},
				},
			},
		},
	},
	[13] = 
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
							gVar = "ACR_RikuWAR3_Tankbar_NascentFlashMouse",
							targetType = "Other Tank",
							uuid = "4053aa03-bc56-853c-b9d2-4bb90cf4b0df",
							variableIsHover = true,
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 65.714816982705,
				name = "[WAR] Nascent OT",
				timelineIndex = 13,
				timerOffset = -3,
				uuid = "d20ff5a3-32ef-8bcb-8090-afa33012d033",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "bb1b6a27-b3ce-c71b-2b1d-8779363d9ab7",
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
				uuid = "ebb85e56-144a-b77a-fefe-ba2c3c55f226",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "e41e002a-70c7-945e-1dc4-544c3eeb473a",
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
				uuid = "f0f14d59-58df-0ead-6391-3f47ef51f8e9",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "19fc73d7-aa94-755b-9798-09416a58bea7",
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
									"9aa7e26c-7119-2f47-a910-bfeb0cc0ab92",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Hotbar_Defiance",
							uuid = "5be1b8fc-ea61-9272-ad8b-ad7ea121d08a",
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
							buffID = 91,
							category = "Self",
							uuid = "9aa7e26c-7119-2f47-a910-bfeb0cc0ab92",
							version = 3,
						},
					},
				},
				mechanicTime = 87.304550672705,
				name = "[MT] Stance on",
				timeRange = true,
				timelineIndex = 17,
				timerEndOffset = -14,
				timerOffset = -16,
				timerStartOffset = -17,
				uuid = "d903fad5-3bb9-24c3-a54c-55fb448890f2",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "c55a4c98-a1ba-bd04-4fc7-2d520c6515a8",
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
				uuid = "5972f9f3-9055-587f-3293-f6a5bb29e583",
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
				mechanicTime = 97.181065398234,
				name = "[Tank] Provoke",
				timeRange = true,
				timelineIndex = 19,
				timerEndOffset = 1,
				timerStartOffset = -0.5,
				uuid = "273dc388-56e6-b403-ab44-0608f11b8674",
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
				uuid = "43b5cf23-b6aa-716f-ccca-81e9f9e798b3",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "b8625e1d-5b89-0fc9-f2a3-b9a73835226d",
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
				uuid = "337411f5-6dc6-3981-13b6-23b798f62a45",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "2457a863-6c2c-309f-98b8-e931a55617b3",
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
									"d66a1ec9-cca9-8c8c-ab43-9686e060b4d6",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "4879bad1-1182-c680-903b-2e036ebe356e",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "d66a1ec9-cca9-8c8c-ab43-9686e060b4d6",
							version = 3,
						},
					},
				},
				mechanicTime = 105.78798877162,
				name = "[Tank] Reprisal",
				timelineIndex = 22,
				timerOffset = -2,
				uuid = "b05990ee-2582-0628-add1-0563f85823ae",
				version = 2,
			},
		},
	},
	[23] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1fdd0062-1875-7fde-8247-ea9cf6539872",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "311e1a06-e278-4492-6523-aa3c24cb1cd6",
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
				uuid = "95fc9554-f957-a128-a95c-e4aa80ca6064",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[OT] Reprisal",
				uuid = "9162fb7b-ffb2-e8d6-8657-c8c2f2c6f7d6",
				version = 2,
			},
			inheritedObjectUUID = "8210269e-ae8a-ca89-af9d-8f6a58793773",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "",
								uuid = "32a609d9-3bc2-e119-887b-3de9411916c9",
								version = 2.1,
							},
							inheritedObjectUUID = "c1ff1ac8-329b-227e-9695-ef77c14a6d3c",
							inheritedOverwrites = 
							{
								conditions = 
								{
									
									{
										type = "remove",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 1,
										type = "add",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 2,
										type = "add",
										value = 
										{
											"d75524b5-04e5-c8e6-8245-e1e565fccfa0",
											true,
										},
									},
								},
							},
						},
					},
				},
				conditions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								category = "Lua",
								conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
								name = "Reprisal real melee range",
								uuid = "d75524b5-04e5-c8e6-8245-e1e565fccfa0",
								version = 3,
							},
						},
					},
				},
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR Kill Potions",
				uuid = "51384872-026d-a168-82d9-9b9bfcef2198",
			},
			objectType = "folder",
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
									"c58a57d3-32ad-0778-be62-4a6def808e65",
									true,
								},
								
								{
									"03f65467-3f90-18b3-9c44-5af229fce3cc",
									true,
								},
								
								{
									"6fec14dc-7cc3-887e-8a18-9a4eaeffb394",
									true,
								},
								
								{
									"026a1aa9-3ca2-d403-8761-22a36502324b",
									true,
								},
							},
							name = "Strength Potion",
							potType = 4,
							usePot = true,
							uuid = "a988110a-e0c4-152a-89c6-a71dcf622543",
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
							jobValue = "WARRIOR",
							name = "Warrior",
							uuid = "c58a57d3-32ad-0778-be62-4a6def808e65",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In Combat",
							uuid = "03f65467-3f90-18b3-9c44-5af229fce3cc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 2,
							hpType = 2,
							hpValue = 1,
							name = "Alive",
							uuid = "6fec14dc-7cc3-887e-8a18-9a4eaeffb394",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 49,
							category = "Self",
							name = "Not Medicated",
							uuid = "026a1aa9-3ca2-d403-8761-22a36502324b",
							version = 3,
						},
					},
				},
				displayPath = "WAR Kill Potions",
				mechanicTime = 118.07975730716,
				name = "[WAR] P1 Kill Potion - 2m",
				timeRange = true,
				timelineIndex = 25,
				timerEndOffset = 5.92024269284,
				timerStartOffset = 1.92024269284,
				uuid = "c84acf13-559c-b1f2-b6db-e044faf99a3c",
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
				uuid = "00785d21-ecda-53d5-761c-d14bbb124031",
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
							actionID = 7388,
							conditions = 
							{
								
								{
									"880bebd3-7b25-b130-872c-3d6e9b68779d",
									true,
								},
								
								{
									"1e996cd1-0d44-de07-b040-8ffc1ee9470f",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_ShakeItOff",
							ignoreWeaveRules = true,
							uuid = "b4c8f662-68a8-8cbe-8c46-c6dedcb37ae5",
							variableTogglesType = 3,
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
							eventSpellID = 47783,
							name = "Confetti resolved",
							uuid = "880bebd3-7b25-b130-872c-3d6e9b68779d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 7388,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Shake ready",
							uuid = "1e996cd1-0d44-de07-b040-8ffc1ee9470f",
							version = 3,
						},
					},
				},
				eventType = 2,
				mechanicTime = 132.26514619605,
				name = "[WAR] Shake after confetti",
				timeRange = true,
				timelineIndex = 26,
				timerEndOffset = -10,
				timerOffset = -3,
				timerStartOffset = -15,
				uuid = "bf3a8817-2491-aab7-8b3c-6aa85871721d",
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
							gVar = "ACR_RikuWAR3_Tankbar_Rampart",
							uuid = "a310d128-ef23-6e7d-9bbd-cdad9dc20e44",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 135.43014619605,
				name = "[Tank] Rampart",
				timeRange = true,
				timelineIndex = 27,
				timerOffset = -14,
				timerStartOffset = -11,
				uuid = "0718ceee-6802-8504-9ef8-ee71dd087b29",
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
							gVar = "ACR_RikuWAR3_Tankbar_ThrillOfBattle",
							uuid = "4c81c3d2-147e-b66e-8a7d-75531186bf8e",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 135.43014619605,
				name = "[WAR] Thrill of battle",
				timeRange = true,
				timelineIndex = 27,
				timerOffset = -4,
				timerStartOffset = -6,
				uuid = "e0473bbb-4f43-14e0-a35b-660e16b05054",
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
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "58bcde62-6cce-11bd-b7a4-58a5c6656b06",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 135.43014619605,
				name = "[WAR] Whetting",
				timeRange = true,
				timelineIndex = 27,
				timerOffset = -3,
				timerStartOffset = -4,
				uuid = "957c8b52-bca7-3043-a67e-15b940f3c8ee",
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
							gVar = "ACR_RikuWAR3_Tankbar_Equilibrium",
							uuid = "14861bc3-5569-4ba6-aced-227408ecbea7",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 135.43014619605,
				name = "[WAR] Equilibrium",
				timeRange = true,
				timelineIndex = 27,
				timerOffset = -10,
				timerStartOffset = -10,
				uuid = "6449052a-ddcd-2300-bf47-3b555d5326b5",
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
							gVar = "ACR_RikuWAR3_Tankbar_Damnation",
							uuid = "efe28881-8586-3e1a-8acc-2ad6ef6e50f4",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 135.43014619605,
				name = "[WAR] Damnation ",
				timeRange = true,
				timelineIndex = 27,
				timerOffset = -10,
				timerStartOffset = -10,
				uuid = "b2309c0b-6b7f-a638-8b41-f8b5cf00f0d3",
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
				uuid = "63d67d50-91c1-ed1c-08fb-7d5e9537b060",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[MT] Reprisal",
				uuid = "3fd7f6f6-abf9-f469-b534-6898756fe3f0",
				version = 2,
			},
			inheritedObjectUUID = "abf38363-a308-5e83-b6af-946b5d642c18",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "",
								uuid = "d63ac2e7-f429-ae78-a951-d79c601dbc9d",
								version = 2.1,
							},
							inheritedObjectUUID = "c1ff1ac8-329b-227e-9695-ef77c14a6d3c",
							inheritedOverwrites = 
							{
								conditions = 
								{
									
									{
										type = "remove",
										value = 
										{
											"8bcc77b5-409a-383c-b8d4-3f708316161c",
											true,
										},
									},
									
									{
										position = 1,
										type = "add",
										value = 
										{
											"8bcc77b5-409a-383c-b8d4-3f708316161c",
											true,
										},
									},
									
									{
										position = 2,
										type = "add",
										value = 
										{
											"705e8303-315e-9bff-ab8d-c7f980d83a02",
											true,
										},
									},
								},
							},
						},
					},
				},
				conditions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								category = "Lua",
								conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
								name = "Reprisal real melee range",
								uuid = "705e8303-315e-9bff-ab8d-c7f980d83a02",
								version = 3,
							},
						},
					},
				},
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
				uuid = "1436796e-59bd-521a-b548-d38cf25fcb7e",
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
				uuid = "11376684-caa4-b030-4c94-e6aa771b3dd4",
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
				uuid = "388002bf-0367-abbb-c5f2-54d9b4e09f8f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "c97b0359-28c1-8335-8273-5a576c0b6e29",
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
				uuid = "7ac625d2-d033-6856-c93d-4d2017657ee2",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "3f72aef6-431e-de2a-d41a-b8b0114a0586",
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
				uuid = "5d92ef25-d56c-5759-f3ed-a93b2afc9075",
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
									"5d9155a4-f684-ef59-91d3-848300bfe847",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "4879bad1-1182-c680-903b-2e036ebe356e",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "5d9155a4-f684-ef59-91d3-848300bfe847",
							version = 3,
						},
					},
				},
				mechanicTime = 173.37050637968,
				name = "[Tank] Reprisal",
				timelineIndex = 35,
				timerOffset = -4,
				uuid = "67654bb2-d667-2d44-8695-b41f0651c8b4",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "7afc19b8-c4c2-d60c-4a43-4f9a9e014c48",
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
				uuid = "5dd4d793-9f96-7427-f4a0-2fcd3b3e4da3",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[OT] Reprisal",
				uuid = "a72b2254-9ecc-f59b-b7e8-22f0b142c21c",
				version = 2,
			},
			inheritedObjectUUID = "8c05ba19-4c50-3796-af2b-65db60c6ce7c",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "",
								uuid = "b055e4e8-899c-a344-9c73-048054dd2b2d",
								version = 2.1,
							},
							inheritedObjectUUID = "c1ff1ac8-329b-227e-9695-ef77c14a6d3c",
							inheritedOverwrites = 
							{
								conditions = 
								{
									
									{
										type = "remove",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 1,
										type = "add",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 2,
										type = "add",
										value = 
										{
											"29e3b0d2-5e2a-beae-9a25-551ec5d379a6",
											true,
										},
									},
								},
							},
						},
					},
				},
				conditions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								category = "Lua",
								conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
								name = "Reprisal real melee range",
								uuid = "29e3b0d2-5e2a-beae-9a25-551ec5d379a6",
								version = 3,
							},
						},
					},
				},
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
				uuid = "527296f6-9ad2-dbb2-d9d3-7f24c09aed46",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[39] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "561c7ff9-748a-e185-0247-c81f2b30bc09",
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
							gVar = "ACR_RikuWAR3_Hotbar_Provoke",
							uuid = "86598f63-a6fc-0a44-a1c7-5e3f31abb6f9",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 207.87965305988,
				name = "WAR Provoke ",
				timelineIndex = 39,
				timerOffset = -2,
				uuid = "28faa04a-fcfc-182b-aa23-613f6c4f2df6",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "66c6b8b1-17ef-1bf5-50b0-b23babd2db41",
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
							gVar = "ACR_RikuWAR3_Tankbar_Holmgang",
							uuid = "e3f24270-0e60-53c7-b5b0-7b7ed5c08e58",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 220.14545421679,
				name = "[WAR] Holmgang",
				timelineIndex = 40,
				timerOffset = -3,
				uuid = "c86b4da2-42e3-86a8-a477-ddd152764207",
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
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "9384a5a8-56d9-3d1f-862d-6bc242107dbd",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 220.14545421679,
				name = "[WAR] Bloodwhetting",
				timeRange = true,
				timelineIndex = 40,
				timerEndOffset = 3,
				uuid = "3f3b4bec-3c22-bdd8-9bea-5a8804a78835",
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
				uuid = "0fa6ec8e-0458-0a62-2600-562043e6989e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[MT] Reprisal",
				uuid = "8c8df955-e2b7-3e44-a526-a61a424b0b5d",
				version = 2,
			},
			inheritedObjectUUID = "72979fc0-ed8b-abf8-af0e-b12b8895f599",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "",
								uuid = "f7f45f20-e954-cbef-99d3-fe45fc29fc75",
								version = 2.1,
							},
							inheritedObjectUUID = "c1ff1ac8-329b-227e-9695-ef77c14a6d3c",
							inheritedOverwrites = 
							{
								conditions = 
								{
									
									{
										type = "remove",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 1,
										type = "add",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 2,
										type = "add",
										value = 
										{
											"cd43de66-7c93-26c5-aec3-25f52fd4c3dc",
											true,
										},
									},
								},
							},
						},
					},
				},
				conditions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								category = "Lua",
								conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
								name = "Reprisal real melee range",
								uuid = "cd43de66-7c93-26c5-aec3-25f52fd4c3dc",
								version = 3,
							},
						},
					},
				},
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "d25bbbc2-901e-f806-6135-33b014dfb852",
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
							gVar = "ACR_RikuWAR3_Tankbar_ShakeItOff",
							uuid = "b4c8f662-68a8-8cbe-8c46-c6dedcb37ae5",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 235.34477128997,
				name = "[WAR] Shake it off ",
				timelineIndex = 41,
				timerOffset = -3,
				uuid = "a400b033-6b37-fc3e-b72a-c4d580eea5a8",
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
									"3cae6975-49b3-6ca5-bfd0-d47e6274820d",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "82141391-0dec-8e7a-b886-4cf4894d0370",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "3cae6975-49b3-6ca5-bfd0-d47e6274820d",
							version = 3,
						},
					},
				},
				mechanicTime = 235.34477128997,
				name = "[Tank] Reprisal",
				timeRange = true,
				timelineIndex = 41,
				timerOffset = -13,
				timerStartOffset = -13,
				uuid = "28af7d63-a13e-4542-a27c-2fd8375bb8ea",
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
				uuid = "af917adf-2830-d923-5163-38cd030db72f",
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
				uuid = "2c7ed8e4-8af3-d7c8-a706-589af750c3f4",
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
				uuid = "380fb133-1f4e-787f-fe80-b2618b8a8bc3",
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
				uuid = "a20810f2-df52-56fe-120b-dc8cb30f2f02",
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
				uuid = "f5adc1d8-7a77-9f54-1d7c-6ed66fec45e8",
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
				uuid = "b3b73417-eeb8-672b-ddde-552df744cfe7",
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
				uuid = "102f0a96-1713-95ca-f71e-5d18e98b2f66",
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
				uuid = "09d4d754-22b9-7ba8-5ed4-5a5ad8f26f64",
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
				uuid = "6095180f-424f-e193-2de0-b2c9a719f95f",
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
				uuid = "a3b55421-420d-f925-a531-2a975e4f3731",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "33331f7f-c603-c953-207f-955151bd158f",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[55] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e6f2c623-1cfb-0cbf-148d-8ebd9d248fb3",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[OT] Reprisal",
				uuid = "33b01fac-c06b-7745-ba1a-c66388e67738",
				version = 2,
			},
			inheritedObjectUUID = "1db10399-9ffb-10bc-8d5d-48dc8fbf632c",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "",
								uuid = "da3fe5c4-8f3d-6136-844a-d31b4769836b",
								version = 2.1,
							},
							inheritedObjectUUID = "c1ff1ac8-329b-227e-9695-ef77c14a6d3c",
							inheritedOverwrites = 
							{
								conditions = 
								{
									
									{
										type = "remove",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 1,
										type = "add",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 2,
										type = "add",
										value = 
										{
											"4be34c8f-7f2d-232e-8d19-63ceb0dc94d0",
											true,
										},
									},
								},
							},
						},
					},
				},
				conditions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								category = "Lua",
								conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
								name = "Reprisal real melee range",
								uuid = "4be34c8f-7f2d-232e-8d19-63ceb0dc94d0",
								version = 3,
							},
						},
					},
				},
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
				uuid = "a4039f06-efbb-c1e2-6c7b-65a097b0a1d6",
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
				uuid = "fb1659bc-e5fe-4840-11f6-463ecd1e63cc",
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
									"7e521614-1a09-5838-84c2-026d36017c8b",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "4e382839-09fc-de72-a6e6-cff2dbda5dba",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "7e521614-1a09-5838-84c2-026d36017c8b",
							version = 3,
						},
					},
				},
				mechanicTime = 300.65391348888,
				name = "[MT] Reprisal",
				timelineIndex = 58,
				timerOffset = -2,
				uuid = "ba6b89eb-23c6-fe7f-abe1-b6eb03cdf4a6",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "744bde57-a8c4-c05b-0b35-7261c8380ce7",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "8fb2b011-e9b4-1a15-4502-edbfaf3ba6a1",
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
				uuid = "736d1a17-1091-d01b-ebc0-a195b2a3e8a7",
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
				uuid = "1bb4c07c-28f6-8e00-ed4a-c102d7d04a8c",
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
				uuid = "fc1ca249-b5a2-17ad-de2e-46c3e879cbd9",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[MT] Reprisal",
				uuid = "acc4a8e5-bd95-036d-8bf2-0e4ed3ba905f",
				version = 2,
			},
			inheritedObjectUUID = "1ec334ae-518a-6a07-81a8-3af1c3fd116c",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "",
								uuid = "8d25b563-5f4f-0b42-9754-48c1e9d7bf4b",
								version = 2.1,
							},
							inheritedObjectUUID = "c1ff1ac8-329b-227e-9695-ef77c14a6d3c",
							inheritedOverwrites = 
							{
								conditions = 
								{
									
									{
										type = "remove",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 1,
										type = "add",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 2,
										type = "add",
										value = 
										{
											"3b05df2f-dadf-4c3b-970b-fd3321524140",
											true,
										},
									},
								},
							},
						},
					},
				},
				conditions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								category = "Lua",
								conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
								name = "Reprisal real melee range",
								uuid = "3b05df2f-dadf-4c3b-970b-fd3321524140",
								version = 3,
							},
						},
					},
				},
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "f9437e47-37ae-f05b-5df1-26fdfa285f57",
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
				uuid = "e0c4e886-710d-c07a-aa27-d7e8e340dcd6",
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
				uuid = "0a3868e5-496c-0281-3311-c65fa9ec90b5",
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
				uuid = "638b1210-c8ee-316c-7e22-2a9eebc4c420",
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
				uuid = "e2c97e3d-16f9-22b9-3d49-492f1727a6cd",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[OT] Reprisal",
				uuid = "cc651a0c-8fc5-926d-81ee-61ae63a3a618",
				version = 2,
			},
			inheritedObjectUUID = "accad162-de67-a72c-9d82-2edd5262ac54",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "",
								uuid = "70ce81e1-57de-318f-9fbf-31f0954a0588",
								version = 2.1,
							},
							inheritedObjectUUID = "c1ff1ac8-329b-227e-9695-ef77c14a6d3c",
							inheritedOverwrites = 
							{
								conditions = 
								{
									
									{
										type = "remove",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 1,
										type = "add",
										value = 
										{
											"4929c19c-4f78-ad87-9560-7c236da0305e",
											true,
										},
									},
									
									{
										position = 2,
										type = "add",
										value = 
										{
											"ab90bbd7-2afb-0e04-9beb-9f6ef2d1910c",
											true,
										},
									},
								},
							},
						},
					},
				},
				conditions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								category = "Lua",
								conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
								name = "Reprisal real melee range",
								uuid = "ab90bbd7-2afb-0e04-9beb-9f6ef2d1910c",
								version = 3,
							},
						},
					},
				},
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
							gVar = "ACR_RikuWAR3_Tankbar_ShakeItOff",
							uuid = "8fcc181c-8d69-5693-8702-556f05525d3e",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 341.70452758191,
				name = "[WAR] Shake - P2 LoJ",
				timeRange = true,
				timelineIndex = 66,
				timerEndOffset = -1,
				timerOffset = -2,
				timerStartOffset = -4,
				uuid = "a3120968-f935-ff65-a4c4-451b0dc1abfd",
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
				uuid = "2b7f088a-89bb-bbb6-318c-55f46ccac69a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "8282596e-f82b-f0ca-b06b-fc34c592c2be",
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
				uuid = "bb86b082-4ca6-2b66-2771-d258ba97eb92",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "3e131a66-0f08-897a-3297-1908c79d86b6",
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
				uuid = "3190555f-feb5-37a7-aed5-73803bf43f3e",
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
							gVar = "ACR_RikuWAR3_Tankbar_Rampart",
							uuid = "6e254fb9-4b34-a08c-bf10-dddfcc9cc25b",
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
				timerOffset = -12,
				uuid = "9965d378-ac7c-1807-be7b-4bd492b0e8a5",
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
							gVar = "ACR_RikuWAR3_Tankbar_Damnation",
							uuid = "cdf56323-c718-ed28-83e8-50f7f06ad9c7",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 370.25754620621,
				name = "[WAR] Damnation",
				timelineIndex = 72,
				timerOffset = -8,
				uuid = "4e2806dc-5090-3ce3-9ec0-ac62b6ac40b3",
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
							gVar = "ACR_RikuWAR3_Tankbar_ThrillOfBattle",
							uuid = "0e208694-623a-1c4f-aaa7-ef1f515415dc",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 370.25754620621,
				name = "[WAR] Thrill",
				timelineIndex = 72,
				timerOffset = -1,
				uuid = "4a84c2de-194f-7ee8-91b8-7fe22dff0ff4",
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
							gVar = "ACR_RikuWAR3_Tankbar_Equilibrium",
							uuid = "bd12ce85-b9de-529e-92ec-0a304c33bfbc",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 370.25754620621,
				name = "[WAR] Equilibrium",
				timelineIndex = 72,
				timerOffset = -8,
				uuid = "ad800765-023e-ac33-bebe-227ab7922c1a",
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
							alertText = "Go wall save spot",
							conditions = 
							{
								
								{
									"f010bf4a-e4b0-6c5f-9e76-766b52af7252",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_CD",
							uuid = "2ecd19cd-9e25-3eff-89fa-73832dadbab9",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "GUNBREAKER",
							name = "Check GNB",
							partyTargetType = "Other Tank",
							uuid = "63030c05-b5a4-961f-80c2-2b54cd5fb928",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "DARKKNIGHT",
							name = "Check DRK",
							partyTargetType = "Other Tank",
							uuid = "12b04df8-92ee-c43a-bd06-3e7896815236",
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
									"63030c05-b5a4-961f-80c2-2b54cd5fb928",
									true,
								},
								
								{
									"12b04df8-92ee-c43a-bd06-3e7896815236",
									true,
								},
							},
							matchAnyBuff = true,
							name = "Co-tank GNB or DRK",
							partyTargetNumber = 0,
							uuid = "f010bf4a-e4b0-6c5f-9e76-766b52af7252",
							version = 3,
						},
					},
				},
				mechanicTime = 370.25754620621,
				name = "[Call] Wall save spot",
				timelineIndex = 72,
				timerOffset = -4,
				timerStartOffset = -3,
				uuid = "df447daf-7689-5ee2-b020-f532bef58a60",
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
							alertText = "Stay close save spot",
							conditions = 
							{
								
								{
									"63030c05-b5a4-961f-80c2-2b54cd5fb928",
									true,
								},
							},
							gVar = "ACR_RikuGNB3_CD",
							uuid = "2ecd19cd-9e25-3eff-89fa-73832dadbab9",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Party",
							conditionType = 7,
							jobValue = "PALADIN",
							name = "Check PLD",
							partyTargetType = "Other Tank",
							uuid = "63030c05-b5a4-961f-80c2-2b54cd5fb928",
							version = 3,
						},
					},
				},
				mechanicTime = 370.25754620621,
				name = "[Call] Wall save spot",
				timelineIndex = 72,
				timerOffset = -4,
				timerStartOffset = -3,
				uuid = "fc5353a3-ec61-9bae-a300-33a073ce6367",
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
									"d6790ffc-8fdb-8b31-acbc-e2ddcd9e432a",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "4879bad1-1182-c680-903b-2e036ebe356e",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "d6790ffc-8fdb-8b31-acbc-e2ddcd9e432a",
							version = 3,
						},
					},
				},
				mechanicTime = 370.25754620621,
				name = "[MT] Reprisal - Wings",
				timeRange = true,
				timelineIndex = 72,
				timerEndOffset = -3,
				timerOffset = -2,
				timerStartOffset = -6,
				uuid = "29b286ac-7b3a-accf-97ca-2ec39fdd5ddd",
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
				uuid = "ac6a3643-2d21-dbf7-766e-b3459bcbf353",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[MT] Reprisal",
				uuid = "0439c136-d96e-ae02-9378-6c431c089b6f",
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
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "9384a5a8-56d9-3d1f-862d-6bc242107dbd",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 377.30637120621,
				name = "[WAR] Bloodwhetting",
				timelineIndex = 73,
				timerOffset = -3,
				uuid = "b02987d5-470f-dca0-ae03-be72d48ccad6",
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
				uuid = "34b3ccd2-1dbb-858e-ee57-e5642edfcda2",
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
				uuid = "bada9ab4-2bef-d540-c7ed-1d423303f044",
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
				uuid = "0b8538af-ffcf-828b-988a-c93189fd657f",
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
							gVar = "ACR_RikuWAR3_CD",
							setTarget = true,
							targetContentID = 6052,
							targetType = "ContentID",
							uuid = "baf2eb39-6977-b826-8874-c383a772185a",
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuWAR3_Hotbar_ProvokeMouse",
							targetContentID = 6052,
							targetType = "ContentID",
							uuid = "a43ded5c-ca16-0a1a-84f1-535603bcc33e",
							variableIsHover = true,
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 427.45958272918,
				name = "[MT] Target Exdeath",
				timelineIndex = 77,
				timerOffset = 1,
				uuid = "ea9291ff-4bc2-196c-923e-7cc9983d1050",
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
									"3503e600-b31d-8c73-a178-a5eb07aa43b5",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "8b89d78c-fba0-fa68-a8ed-a2ea75614149",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "3503e600-b31d-8c73-a178-a5eb07aa43b5",
							version = 3,
						},
					},
				},
				mechanicTime = 427.45958272918,
				name = "[MT] Reprisal - P3 opening",
				timeRange = true,
				timelineIndex = 77,
				timerEndOffset = 2,
				timerOffset = 1,
				uuid = "738bdcca-e291-f28d-9ac1-d58a6f9d363b",
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
				uuid = "62efe36a-a701-949e-72b0-39600df2c47a",
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
				uuid = "72e5711d-0eed-d741-746b-3c7b52871bad",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "16b92d8b-6423-c45f-656d-a3f5f1377c5b",
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
							gVar = "ACR_RikuWAR3_Tankbar_NascentFlashMouse",
							targetType = "Other Tank",
							uuid = "4053aa03-bc56-853c-b9d2-4bb90cf4b0df",
							variableIsHover = true,
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 450.00390950196,
				name = "[WAR] Nascent - co-tank Bowels",
				timeRange = true,
				timelineIndex = 79,
				timerEndOffset = -0.75,
				timerOffset = -3,
				timerStartOffset = -4,
				uuid = "4e20334e-b66f-9867-a723-ce032d49e56f",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "1323e935-d58f-1b71-7a6a-e277116fe585",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[83] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "4f078008-4610-8aa4-99ef-31e646ba5a98",
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
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "8e89ddb8-1dcb-bce5-a23c-89490718e317",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 478.4207739929,
				name = "[WAR] Whetting",
				timelineIndex = 83,
				timerOffset = -3,
				uuid = "d32f589e-fc26-0505-b4cc-9164e1f4338f",
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
							gVar = "ACR_RikuWAR3_Tankbar_Rampart",
							uuid = "107fc099-0248-a1eb-ae8a-1d5723b22bb8",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 478.4207739929,
				name = "[Tank] Rampart",
				timelineIndex = 83,
				timerOffset = -9,
				uuid = "4156c15f-a78c-9ad3-9129-a563817cf3c9",
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
							gVar = "ACR_RikuWAR3_Tankbar_ThrillOfBattle",
							uuid = "49ba993a-eb2e-b3d8-b78a-e1a947fcb03d",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 478.4207739929,
				name = "[WAR] Thrill",
				timelineIndex = 83,
				timerOffset = -6,
				uuid = "cc343ebf-4a1b-b34f-82f4-f48c7c2ae06b",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR Kill Potions",
				uuid = "9fff434a-042e-843e-b6a6-328e6937a2d8",
			},
			objectType = "folder",
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
									"52fb9db8-fccb-f682-a817-766854b0d9ab",
									true,
								},
								
								{
									"1e4aeeec-a32b-c897-b991-ed1043447b4e",
									true,
								},
								
								{
									"6441f1f7-99e1-3978-bdca-6eab516d496d",
									true,
								},
								
								{
									"16c0482e-046e-39fb-9203-9395a36003c7",
									true,
								},
							},
							name = "Strength Potion",
							potType = 4,
							usePot = true,
							uuid = "13bd20fe-3654-155e-94b3-ed025f516a33",
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
							jobValue = "WARRIOR",
							name = "Warrior",
							uuid = "52fb9db8-fccb-f682-a817-766854b0d9ab",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In Combat",
							uuid = "1e4aeeec-a32b-c897-b991-ed1043447b4e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 2,
							hpType = 2,
							hpValue = 1,
							name = "Alive",
							uuid = "6441f1f7-99e1-3978-bdca-6eab516d496d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 49,
							category = "Self",
							name = "Not Medicated",
							uuid = "16c0482e-046e-39fb-9203-9395a36003c7",
							version = 3,
						},
					},
				},
				displayPath = "WAR Kill Potions",
				mechanicTime = 478.4207739929,
				name = "[WAR] P3 Kill Potion - first burst",
				timeRange = true,
				timelineIndex = 83,
				timerEndOffset = 2.5792260071,
				timerStartOffset = -0.42077399290002,
				uuid = "00421aa9-bb8a-eb02-8d7e-d09cf31c2784",
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
				uuid = "6803034f-9ab1-0cf3-1ad1-f21daea6ce9f",
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
							gVar = "ACR_RikuWAR3_CD",
							setTarget = true,
							targetContentID = 6052,
							targetType = "ContentID",
							uuid = "6b7090de-2604-0291-aec4-b75a7e4d0318",
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
									"e3f57704-46ac-010f-8925-bf5e1b970110",
									true,
								},
								
								{
									"20cd38a9-743a-2d36-9c13-66a94ee25821",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "88341897-c53c-6792-bc40-0395d680fb10",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							conditionType = 2,
							contentid = 6052,
							uuid = "e3f57704-46ac-010f-8925-bf5e1b970110",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "20cd38a9-743a-2d36-9c13-66a94ee25821",
							version = 3,
						},
					},
				},
				mechanicTime = 491.23479899289,
				name = "[MT] Reprisal - Latitudinal",
				timeRange = true,
				timelineIndex = 86,
				timerEndOffset = -0.7,
				timerOffset = -3,
				timerStartOffset = -3,
				uuid = "c50501f6-570d-79a0-8cd7-195332d55a13",
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
							aType = "Misc",
							gVar = "ACR_RikuWAR3_CD",
							setTarget = true,
							targetContentID = 6052,
							targetType = "ContentID",
							uuid = "baf2eb39-6977-b826-8874-c383a772185a",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 491.23479899289,
				name = "[MT] Target Exdeath",
				timelineIndex = 86,
				timerOffset = 1,
				uuid = "59ac38ae-f872-a4ae-b3b4-a225a5acc067",
				version = 2,
			},
		},
	},
	[89] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b556980a-2cf6-7156-a7b4-c674f6a2561a",
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
				uuid = "47806bd3-1f69-86cf-6538-2275e330fee3",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[AnyoneCore Draws] Limit Cut Direction + Party Macro",
				uuid = "b30ceb50-8ee2-ca4e-9db1-a5cbe157f75f",
				version = 2,
			},
			inheritedObjectUUID = "859d1fd1-90d0-4c53-a6a1-3dbe92d84215",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "Detect direction and prepare party macro",
								uuid = "4f6346d7-1cae-ef81-976a-cb73cfd51448",
								version = 2.1,
							},
							inheritedObjectUUID = "9e16047a-cc7d-042a-8851-bdfee0721e71",
							inheritedOverwrites = 
							{
								actionLua = "local entityID = eventArgs.entityID\nlocal entity = TensorCore.mGetEntity(entityID)\nif not entity or not entity.pos then\n    self.used = true\n    return\nend\n\nlocal dx = entity.pos.x - 100\nlocal dz = entity.pos.z - 100\nif dx * dx + dz * dz < 25 then\n    self.used = true\n    return\nend\n\nlocal now = Now()\nlocal state = data.anyoneDMULimitCutMacro\nif not state or type(state.startedAt) ~= \"number\" or now - state.startedAt > 30000 then\n    state = {\n        startedAt = now,\n        sources = {},\n        seen = {},\n        prepared = false,\n        queue = nil,\n        queueIndex = nil,\n    }\n    data.anyoneDMULimitCutMacro = state\nend\n\nif state.seen[entityID] then\n    self.used = true\n    return\nend\n\nstate.seen[entityID] = true\nstate.sources[#state.sources + 1] = {\n    x = entity.pos.x,\n    y = entity.pos.y,\n    z = entity.pos.z,\n}\n\nif #state.sources < 2 or state.prepared then\n    self.used = true\n    return\nend\nstate.prepared = true\n\nlocal center = { x = 100, z = 100 }\nlocal quarterTurn = math.pi / 4\nlocal fullTurn = 2 * math.pi\n\nlocal function normaliseSigned(angle)\n    while angle > math.pi do angle = angle - fullTurn end\n    while angle <= -math.pi do angle = angle + fullTurn end\n    return angle\nend\n\nlocal function clockwiseAngle(pos)\n    local angle = math.atan2(pos.x - center.x, -(pos.z - center.z))\n    if angle < 0 then angle = angle + fullTurn end\n    return angle\nend\n\nlocal firstAngle = clockwiseAngle(state.sources[1])\nlocal secondAngle = clockwiseAngle(state.sources[2])\nlocal delta = normaliseSigned(secondAngle - firstAngle)\nlocal lcTTSEnabled = KaptinDMUControls == nil\n    or KaptinDMUControls.lcTTSEnabled ~= false\nif math.abs(math.abs(delta) - quarterTurn) > 0.35 then\n    if lcTTSEnabled then\n        TensorCore.sendTTS(\"Limit cut direction unknown. Macro not sent\", 75)\n    end\n    state.failed = true\n    self.used = true\n    return\nend\n\nlocal step = delta > 0 and 1 or -1\nlocal directionText = step == 1 and \"clockwise\" or \"counterclockwise\"\n\nlocal markerNames = { \"A\", \"B\", \"C\", \"D\", \"1\", \"2\", \"3\", \"4\" }\nlocal marks = {}\nlocal validMarks = Argus and type(Argus.getWaymarkInfo) == \"function\"\nif validMarks then\n    for markerID = 1, 8 do\n        local x, y, z, active = Argus.getWaymarkInfo(markerID)\n        if not active or type(x) ~= \"number\" or type(z) ~= \"number\" then\n            validMarks = false\n            break\n        end\n        marks[#marks + 1] = {\n            name = markerNames[markerID],\n            x = x,\n            y = y,\n            z = z,\n            angle = clockwiseAngle({ x = x, z = z }),\n        }\n    end\nend\n\nif validMarks then\n    table.sort(marks, function(a, b) return a.angle < b.angle end)\n    for i = 1, 8 do\n        local nextIndex = (i % 8) + 1\n        local gap = marks[nextIndex].angle - marks[i].angle\n        if gap <= 0 then gap = gap + fullTurn end\n        if gap < 0.4 or gap > 1.2 then\n            validMarks = false\n            break\n        end\n    end\nend\n\nif not validMarks then\n    if lcTTSEnabled then\n        TensorCore.sendTTS(\"Kefka moves \" .. directionText .. \". Waymarks invalid. Macro not sent\", 75)\n    end\n    state.failed = true\n    self.used = true\n    return\nend\n\nlocal originIndex = nil\nlocal closest = math.huge\nfor i, mark in ipairs(marks) do\n    local distance = math.abs(normaliseSigned(firstAngle - mark.angle))\n    if distance < closest then\n        closest = distance\n        originIndex = i\n    end\nend\n\nif not originIndex or closest > 0.45 then\n    if lcTTSEnabled then\n        TensorCore.sendTTS(\"Kefka moves \" .. directionText .. \". Start waymark unknown. Macro not sent\", 75)\n    end\n    state.failed = true\n    self.used = true\n    return\nend\n\nlocal destinationZero = ((originIndex - 1) + 4) % 8\nlocal shortDirection = step == 1 and \"CW\" or \"CCW\"\nlocal queue = { \"/p Kefka: \" .. shortDirection }\nfor number = 1, 8 do\n    local halfStep = (destinationZero - step * (number - 0.5)) % 8\n    local firstMarkZero = math.floor(halfStep)\n    local firstMark = marks[firstMarkZero + 1].name\n    local secondMark = marks[((firstMarkZero + 1) % 8) + 1].name\n    queue[number + 1] = \"/p \" .. number .. \" -> \" .. firstMark .. secondMark\nend\n\nstate.direction = directionText\nstate.origin = marks[originIndex].name\nstate.destination = marks[((originIndex - 1 + 4) % 8) + 1].name\nstate.queue = queue\nstate.queueIndex = 1\nif lcTTSEnabled then\n    TensorCore.sendTTS(\"Kefka moves \" .. directionText, 75)\nend\nself.used = true",
							},
						},
					},
				},
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "756689cd-57f8-0a69-19e9-09e3d51955dd",
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
				uuid = "b641fd65-1aaf-74e1-7579-dfa30aac67b5",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[Call] Limit Cut Shotcall",
				uuid = "c98b658e-fbfe-554c-96d9-42f5bf90c245",
				version = 2,
			},
			inheritedObjectUUID = "cc6ec78d-9687-0316-8b2f-d64058df350c",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "Limit Cut Shotcall",
								uuid = "450f94b5-da30-1975-9c8f-1ee3c5abe41f",
								version = 2.1,
							},
							inheritedObjectUUID = "ad1fdc32-266d-4bb7-9948-aefdd65f2871",
							inheritedOverwrites = 
							{
								conditions = 
								{
									
									{
										type = "remove",
										value = 
										{
											"13b39b91-86df-51ec-9ac3-fa2c9bf3c9d0",
											true,
										},
									},
									
									{
										position = 1,
										type = "add",
										value = 
										{
											"e289f657-7ee3-076f-a63e-098a353f3f5d",
											true,
										},
									},
									
									{
										position = 2,
										type = "add",
										value = 
										{
											"13b39b91-86df-51ec-9ac3-fa2c9bf3c9d0",
											true,
										},
									},
								},
							},
						},
					},
				},
				conditions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								category = "Lua",
								conditionLua = "return KaptinDMUControls == nil or KaptinDMUControls.lcTTSEnabled ~= false",
								name = "LC TTS enabled",
								uuid = "e289f657-7ee3-076f-a63e-098a353f3f5d",
								version = 3,
							},
						},
					},
				},
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "512f4c93-3b8c-e53f-adf3-bf9d5f8bbf23",
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
				uuid = "47174284-066e-0388-2c9b-5d7ef6d41b14",
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
				},
				mechanicTime = 514.44485832111,
				name = "[Tank] LB3",
				timeRange = true,
				timelineIndex = 95,
				timerEndOffset = 0.5,
				timerOffset = -2,
				timerStartOffset = -4,
				uuid = "25bf5bd5-f9cd-0302-b66a-bc28378524fb",
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
				uuid = "71900a80-5cf2-d37c-645c-9c4ae4eb2010",
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
							gVar = "ACR_RikuWAR3_Tankbar_ShakeItOff",
							uuid = "9ca2a02b-79f7-885b-8f5b-9086872006b4",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 518.31461099411,
				name = "[WAR] Shake - after LB3",
				timeRange = true,
				timelineIndex = 98,
				timerEndOffset = -1,
				timerOffset = -2,
				timerStartOffset = -4,
				uuid = "97217cdd-687c-3f4b-af8b-599bedc799f2",
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
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "8882ec39-c5f5-48a1-b01e-de8cb84c56c9",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 518.31461099411,
				name = "[WAR] Whetting - before LB3",
				timeRange = true,
				timelineIndex = 98,
				timerEndOffset = -8.11461099411,
				timerOffset = -4,
				timerStartOffset = -9.51461099411,
				uuid = "61f9e80f-7852-a34d-8379-604b40f9e43e",
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
				uuid = "c25f66bd-cfb2-b511-88c4-08f779b66f4d",
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
				uuid = "2d97b9c2-adcf-dcc6-d400-14ecb82d2092",
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
							gVar = "ACR_RikuWAR3_Tankbar_Holmgang",
							uuid = "d6f3b6a8-ab62-d651-a47d-9e179a034cf2",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 536.97932260272,
				name = "[WAR] Holmgang",
				timelineIndex = 102,
				timerOffset = -3,
				uuid = "488eb816-04a0-98c1-960e-dba27c908f0c",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "05c5da55-1865-ab89-b4e5-27070822b9e5",
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
				uuid = "7544fdb4-4893-eb50-7c1f-a3fa98f7ff04",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "66170bf4-784a-de60-1e26-09deca0d6f44",
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
							gVar = "ACR_RikuWAR3_CD",
							setTarget = true,
							targetContentID = 7691,
							targetType = "ContentID",
							uuid = "baf2eb39-6977-b826-8874-c383a772185a",
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_RikuWAR3_Hotbar_ProvokeMouse",
							targetContentID = 7691,
							targetType = "ContentID",
							uuid = "a43ded5c-ca16-0a1a-84f1-535603bcc33e",
							variableIsHover = true,
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 544.89209076626,
				name = "[MT] Target Chaos",
				timelineIndex = 104,
				timerOffset = -2,
				uuid = "559f650d-c7f1-3eb7-ab5e-bec7048eb082",
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
				uuid = "cf95f7ef-e508-a76b-c0b3-fb2d87929a7f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[107] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "86b1c001-d602-557d-1ba3-b39b940d1d51",
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
							gVar = "ACR_RikuWAR3_Tankbar_Damnation",
							uuid = "955cc371-dfe8-c089-9b23-7e97c7484844",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 557.21788210262,
				name = "[WAR] Damnation",
				timelineIndex = 107,
				timerOffset = -6,
				uuid = "116f5b92-b8c3-af52-8b2a-991d57048eda",
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
									"903073db-01e5-428f-9b72-1a4570b115e7",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Equilibrium",
							uuid = "58c998ec-a0d7-d597-acd4-8d3e557f74b9",
							variableTogglesType = 3,
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
							hpValue = 15,
							uuid = "903073db-01e5-428f-9b72-1a4570b115e7",
							version = 3,
						},
					},
				},
				mechanicTime = 557.21788210262,
				name = "[WAR] Equilibrium",
				timeRange = true,
				timelineIndex = 107,
				timerEndOffset = 15,
				uuid = "ae4fd4c6-aeed-1995-a4a1-4573266baa5f",
				version = 2,
			},
			inheritedIndex = 6,
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
				enabled = false,
				mechanicTime = 557.21788210262,
				name = "",
				timelineIndex = 107,
				timerOffset = 1,
				uuid = "6c068a07-0ed4-e0c3-a0ae-a5edc403d984",
				version = 2,
			},
			inheritedIndex = 7,
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "dd94341f-429d-132b-923a-1f55d0831def",
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
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "ef51fbef-54a2-f4c0-a1f0-32dc3e44f04a",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 557.21788210262,
				name = "[WAR] Whetting - Thunder III",
				timeRange = true,
				timelineIndex = 107,
				timerEndOffset = -0.75,
				timerOffset = -2,
				timerStartOffset = -4,
				uuid = "7c03fd05-c67c-7ad2-af01-5f9645fb6b16",
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
				uuid = "f8015d30-7aba-0354-7fb3-0caec370c700",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "da66a500-49d4-dc54-959b-3c229b1a63d0",
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
							conditions = 
							{
								
								{
									"431b7976-120d-f9b0-ba59-e898230c74d2",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "8a6995d2-bd34-e375-84de-30dd3ee0d335",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "431b7976-120d-f9b0-ba59-e898230c74d2",
							version = 3,
						},
					},
				},
				mechanicTime = 575.36903594877,
				name = "[Tank] Reprisal",
				timelineIndex = 109,
				uuid = "6765f991-c66f-449b-99ca-7dd79e6bb3b8",
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
				uuid = "60400e0d-0f0f-c021-8f08-196bf93d4fdd",
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
				uuid = "7862aa38-1716-5c4c-77ce-ff0aa0e83c88",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "94217f28-c0f2-7b2c-8ee1-aceefbaf4038",
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
				uuid = "119d09ee-5819-455a-6804-b6fcbbea81be",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[118] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "d84f826d-a847-2fb1-ae20-e763be81ca3d",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "4df8981b-b191-2f0f-c8ef-3f5dbf5629eb",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[119] = 
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
							gVar = "ACR_RikuWAR3_Tankbar_ShakeItOff",
							uuid = "d62acbec-0c4b-59a0-8a00-b2169b0b37ab",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 605.76747259654,
				name = "[WAR] Shake ",
				timelineIndex = 119,
				timerOffset = -2,
				uuid = "46151ba1-f88c-ecb9-8e42-17fca4505586",
				version = 2,
			},
		},
	},
	[122] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "4924e64c-c3d6-f9f0-0f69-ede2a264969c",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "18fdd92c-454c-7ac0-b062-f28673e22e3c",
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
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b47b29e0-023d-d45c-ea64-3a7eefb88030",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[127] = 
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
							gVar = "ACR_RikuWAR3_Tankbar_Rampart",
							uuid = "0f8f4905-156f-9c16-90c6-531f11c63da3",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 639.97108310281,
				name = "[Tank] Rampart",
				timelineIndex = 127,
				timerOffset = -8,
				uuid = "63782d35-e41a-2e05-ad07-3ec6ebd6e471",
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
							gVar = "ACR_RikuWAR3_Tankbar_ThrillOfBattle",
							uuid = "4edf8eaf-e588-24cb-8860-1c572c90411c",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 639.97108310281,
				name = "[WAR] Thrill",
				timelineIndex = 127,
				timerOffset = -6,
				uuid = "7973a283-6289-60c9-82e1-f77d2e9bf63d",
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
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "8a60977f-04e4-1426-b034-ea0ecef95926",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 639.97108310281,
				name = "[WAR] Whetting - Thunder V",
				timeRange = true,
				timelineIndex = 127,
				timerEndOffset = -0.75,
				timerOffset = -2,
				timerStartOffset = -4,
				uuid = "922d37a7-453e-0cd3-ae81-71cbe18e0237",
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
				uuid = "da55b9b1-fb7d-0815-efd8-26eb7e68e301",
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
									"45fc6450-bd45-ea6a-a356-eba48267623c",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "eafb3473-af1c-bba9-8e27-1658aa57e9bc",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							actionID = 25751,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Whetting ready",
							uuid = "45fc6450-bd45-ea6a-a356-eba48267623c",
							version = 3,
						},
					},
				},
				mechanicTime = 671.48837109883,
				name = "[WAR] Whetting - after third beams",
				timeRange = true,
				timelineIndex = 129,
				timerEndOffset = -6.48837109883,
				timerStartOffset = -10.48837109883,
				uuid = "746be4d3-2fcd-0ba4-a824-308e18e238ee",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "f5e583f0-e55a-c284-ee58-0772f6a0f1c0",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "9d57d8c0-92d8-09c4-c3e4-09d671230b90",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[134] = 
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
									"289003b6-39d4-3a7f-af42-e76e8ee964ff",
									true,
								},
								
								{
									"365dcb38-14e4-dca6-a98e-aca5b766bafd",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Damnation",
							uuid = "7e414adf-3d96-8c7d-b43a-70fe15b98d31",
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
									"289003b6-39d4-3a7f-af42-e76e8ee964ff",
									true,
								},
								
								{
									"efacc9b7-3e9d-9486-ad04-b8004d084a3d",
									true,
								},
								
								{
									"e8690ec8-c153-3692-8802-3413a448fba8",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "e87531cb-f91e-ce65-89dc-5f423d42fe09",
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
									"289003b6-39d4-3a7f-af42-e76e8ee964ff",
									true,
								},
								
								{
									"efacc9b7-3e9d-9486-ad04-b8004d084a3d",
									true,
								},
								
								{
									"88c23b86-545b-2ebf-914d-407c565832b2",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_NascentFlashMouse",
							targetType = "Other Tank",
							uuid = "f5a98bd3-9328-efd4-96c6-7b2b35910363",
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
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgType = 2,
							eventSpellID = 47868,
							name = "Nothingness",
							uuid = "289003b6-39d4-3a7f-af42-e76e8ee964ff",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local targetID = eventArgs.hitTargets and eventArgs.hitTargets[1]\nif not targetID then return false end\nlocal cotank = TensorCore.getEntityByGroup(\"Other Tank\")\nreturn cotank ~= nil and targetID == cotank.id",
							name = "Beam hits co-tank",
							uuid = "88c23b86-545b-2ebf-914d-407c565832b2",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local targetID = eventArgs.hitTargets and eventArgs.hitTargets[1]\nif not targetID then return false end\nlocal player = TensorCore.mGetPlayer()\nreturn player ~= nil and targetID == player.id",
							name = "Beam hits self",
							uuid = "e8690ec8-c153-3692-8802-3413a448fba8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 25751,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Whetting ready",
							uuid = "efacc9b7-3e9d-9486-ad04-b8004d084a3d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 36923,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Damnation ready",
							uuid = "365dcb38-14e4-dca6-a98e-aca5b766bafd",
							version = 3,
						},
					},
				},
				eventType = 2,
				mechanicTime = 675.01603238058,
				name = "[WAR] Final beam - Damnation and short",
				timeRange = true,
				timelineIndex = 134,
				timerEndOffset = 21.98396761942,
				timerStartOffset = 13.98396761942,
				uuid = "6bd37052-fc29-5aca-a8d8-e415a119c12f",
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
				uuid = "344c5e5c-1a1c-baf8-5bf6-e30e1f1b662c",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "012c24fc-0a0a-5fe8-debb-0f422c82d84c",
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
				uuid = "af244767-1e49-cc93-8b37-2c39123b0137",
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
				uuid = "80708cfa-2771-a036-0525-d764ce597b8a",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[138] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1ff93743-90b0-4007-cd31-cd0d52f28b13",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "006b287d-62c8-a801-ae6e-ea7b070c970d",
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
				uuid = "7411a9fc-c479-dab8-a914-a34e9f685d4c",
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
				uuid = "46910bf1-c207-ea5d-897a-b8cb193c1241",
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
									"75457ed9-7f6b-a291-93c6-3ba2f0589ab8",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "63d40b8a-4dce-8483-9de1-a18a2af9da5f",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "75457ed9-7f6b-a291-93c6-3ba2f0589ab8",
							version = 3,
						},
					},
				},
				mechanicTime = 705.28176295466,
				name = "[Tank] Reprisal",
				timelineIndex = 141,
				timerOffset = -5,
				uuid = "96542931-e4ad-c110-af01-e29e9387ea60",
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
							gVar = "ACR_RikuWAR3_Tankbar_ShakeItOff",
							uuid = "55ba998b-4095-1d9c-a1b6-9b87209d2375",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 705.28176295466,
				name = "[WAR] Shake it",
				timelineIndex = 141,
				timerOffset = -3,
				uuid = "ce86e42f-cfe1-7457-8d25-a729fa2f714d",
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
				uuid = "2209cc67-4c7a-53a3-6855-5f4585208637",
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
				uuid = "79bbdb6a-084d-453e-9cd3-d09c73ce5f3a",
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
				uuid = "89b1691d-018c-7161-2e42-09b773439c6d",
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
				uuid = "16943d74-8ba6-2190-1fbe-16c2e21da2c4",
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
				uuid = "d321a039-b82a-e705-280c-f03fcc02e809",
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
									"8e3e4fc2-997d-0f69-b178-96289add2298",
									true,
								},
								
								{
									"9569a1dd-55fb-1612-a14a-42731c12073d",
									true,
								},
								
								{
									"a5ed1cee-bd1e-39c8-a784-2814dcc31c93",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Hotbar_ProvokeMouse",
							targetType = "Event Entity",
							uuid = "5b990c1d-ba19-4dd4-80ec-bc3132337baf",
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
							eventEntityContentID = 7131,
							name = "P4 Kefka",
							uuid = "8e3e4fc2-997d-0f69-b178-96289add2298",
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
							uuid = "9569a1dd-55fb-1612-a14a-42731c12073d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionCDValue = 1,
							actionID = 7533,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Provoke ready",
							uuid = "a5ed1cee-bd1e-39c8-a784-2814dcc31c93",
							version = 3,
						},
					},
				},
				eventType = 26,
				mechanicTime = 801.88345429349,
				name = "[WAR MT] P4 Kefka Provoke",
				timeRange = true,
				timelineIndex = 150,
				timerEndOffset = 6,
				timerStartOffset = -3,
				uuid = "c1f6ef9b-5e2a-7b1a-a20d-21e54fe4345d",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "dc79794a-fe1d-0196-907c-3f049fa4a09a",
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
				uuid = "65fbc107-818e-0973-3517-0c11696991d7",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[153] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "8516aeec-ed75-5c18-03c3-66eef0340d3c",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "f2be2c0c-0950-bfc8-0fff-bc6214832c9c",
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
							gVar = "ACR_RikuWAR3_Tankbar_ThrillOfBattle",
							uuid = "f4a7df47-5563-f6db-8197-3cf5dd646d72",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 826.02524789261,
				name = "[WAR] Thrill",
				timelineIndex = 153,
				timerOffset = -3,
				uuid = "99c03536-b719-0ec4-93d2-5b1a5adfe293",
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
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "b7175d88-0c0e-2cf2-98ed-fec65fd50020",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 826.02524789261,
				name = "[WAR] Whetting - P4 autos",
				timeRange = true,
				timelineIndex = 153,
				timerEndOffset = -0.75,
				timerStartOffset = -4,
				uuid = "f33e476b-1eec-8f0f-ab73-f0bf881424ae",
				version = 2,
			},
		},
	},
	[154] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "1bfc78db-8b87-9c4f-0f1c-050d79d278ab",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "71ca952d-bc6c-17f1-4d61-c513899f91fd",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "2d363dfa-9639-bfce-6a89-0738caf3364a",
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
				uuid = "ccba4d9b-5561-d01f-4d1f-dca598a5e3eb",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "5643ad55-a97d-14f9-e647-c3d327511da5",
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
				uuid = "e51f0b80-2ced-8724-6a53-1352fc3127d0",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "2ed5e150-b550-1424-beb7-8776af8043e0",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[158] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b5bb61d1-47ba-37cd-7e1d-254798d307a1",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR Kill Potions",
				uuid = "9bca6005-e4f3-53c3-8c43-99d41d5581ef",
			},
			objectType = "folder",
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
									"7e64c772-ceae-2c12-908e-1868d39238ac",
									true,
								},
								
								{
									"fb6422c4-aa9d-72af-957d-ba0ca1c5c175",
									true,
								},
								
								{
									"082e94d6-cd74-d567-800b-ff2094b947d9",
									true,
								},
								
								{
									"954052fd-c5c7-2a8d-acf5-5778bd8b52a6",
									true,
								},
							},
							name = "Strength Potion",
							potType = 4,
							usePot = true,
							uuid = "55fe149d-8e73-3a05-b1a4-d256e31fd872",
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
							jobValue = "WARRIOR",
							name = "Warrior",
							uuid = "7e64c772-ceae-2c12-908e-1868d39238ac",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In Combat",
							uuid = "fb6422c4-aa9d-72af-957d-ba0ca1c5c175",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 2,
							hpType = 2,
							hpValue = 1,
							name = "Alive",
							uuid = "082e94d6-cd74-d567-800b-ff2094b947d9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 49,
							category = "Self",
							name = "Not Medicated",
							uuid = "954052fd-c5c7-2a8d-acf5-5778bd8b52a6",
							version = 3,
						},
					},
				},
				displayPath = "WAR Kill Potions",
				mechanicTime = 851.93288409656,
				name = "[WAR] P4 Kill Potion - before R1 short",
				timeRange = true,
				timelineIndex = 158,
				timerEndOffset = 0.46711590344,
				timerStartOffset = -1.43288409656,
				uuid = "08915e2b-11ab-f5d6-ba9d-e2d05809461d",
				version = 2,
			},
		},
	},
	[159] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "30c9a6ae-9d5d-579a-198a-a02c9331f77e",
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
							actionID = 16464,
							conditions = 
							{
								
								{
									"15bf3c13-315e-8ec0-8a36-07cf548f6a6a",
									true,
								},
								
								{
									"9a672ca3-7075-3ead-bb1a-ddc4aa2bada4",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_NascentFlashMouse",
							ignoreWeaveRules = true,
							targetType = "Detection Target",
							uuid = "a839c3e4-8acc-f05d-9d29-d37d9a1aceb0",
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
							conditionLua = "return AnyoneCore ~= nil and AnyoneCore.Roster ~= nil\n    and AnyoneCore.Roster.current() ~= nil\n    and AnyoneCore.Roster.idOf(\"R1\") ~= nil",
							name = "R1 resolved",
							uuid = "15bf3c13-315e-8ec0-8a36-07cf548f6a6a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local r1ID = AnyoneCore.Roster.idOf(\"R1\")\nreturn r1ID ~= nil and eventArgs.detectionTargetID == r1ID",
							name = "Assigned R1",
							uuid = "b099cbfe-b7ca-54ea-9ded-b68c8dc71352",
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
									"b099cbfe-b7ca-54ea-9ded-b68c8dc71352",
									true,
								},
							},
							filterTargetType = "Party",
							name = "Living R1",
							uuid = "9a672ca3-7075-3ead-bb1a-ddc4aa2bada4",
							version = 3,
						},
					},
				},
				mechanicTime = 855.99403801671,
				name = "[WAR] Nascent R1 - Grand Cross III",
				timeRange = true,
				timelineIndex = 159,
				timerEndOffset = -1.5,
				timerOffset = -2,
				timerStartOffset = -3.5,
				uuid = "05a53165-8c35-3b13-bb55-4de52657fdda",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR Kill Potions",
				uuid = "9b7ab805-a6a6-f662-996e-e6428d8ec93c",
			},
			objectType = "folder",
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
									"bdee79c0-1102-9553-80e9-bc2ecfdd65b6",
									true,
								},
								
								{
									"acfbf6a0-9b47-4b4c-98dd-fcf465b6e265",
									true,
								},
								
								{
									"fff978b4-fe21-805f-a615-0f8c46d197d6",
									true,
								},
								
								{
									"1c4a1388-ed97-1b38-9aae-3a0e72aecb5f",
									true,
								},
							},
							name = "Strength Potion",
							potType = 4,
							usePot = true,
							uuid = "a7b2da06-0dc3-d315-adc5-e53352fbcea9",
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
							jobValue = "WARRIOR",
							name = "Warrior",
							uuid = "bdee79c0-1102-9553-80e9-bc2ecfdd65b6",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In Combat",
							uuid = "acfbf6a0-9b47-4b4c-98dd-fcf465b6e265",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 2,
							hpType = 2,
							hpValue = 1,
							name = "Alive",
							uuid = "fff978b4-fe21-805f-a615-0f8c46d197d6",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 49,
							category = "Self",
							name = "Not Medicated",
							uuid = "1c4a1388-ed97-1b38-9aae-3a0e72aecb5f",
							version = 3,
						},
					},
				},
				displayPath = "WAR Kill Potions",
				mechanicTime = 855.99403801671,
				name = "[WAR] P4 Kill Potion - fallback after R1 short",
				timeRange = true,
				timelineIndex = 159,
				timerEndOffset = 4.00596198329,
				timerStartOffset = -1.3940380167099,
				uuid = "ff9090be-dd52-e233-afaa-9ac5dd0eb984",
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
				uuid = "4752e5a0-f54d-72cc-e887-d15a9db38af0",
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
				uuid = "daa14a65-6f21-27c1-7888-56c7e711acf5",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "39abda5a-185b-629e-f62e-dca0a53eefea",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "de2b7906-1cf4-2bba-5317-ff90054cbe16",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "f98332c9-1c69-68ed-22a0-aaab9d4a7119",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "c9ac5fc7-bd8f-bb9b-897d-41652aec9e97",
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
									"2fd7ae52-f070-9c18-b1da-1580109c88ca",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "63d40b8a-4dce-8483-9de1-a18a2af9da5f",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "2fd7ae52-f070-9c18-b1da-1580109c88ca",
							version = 3,
						},
					},
				},
				mechanicTime = 895.49672653853,
				name = "[Tank] Reprisal",
				timelineIndex = 165,
				timerOffset = -5,
				uuid = "4adccc6a-2436-de4b-93ab-efefef2be9d4",
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
				name = "store\\anyone\\dmu\\main",
				uuid = "191b50fc-4303-b540-1b0b-f60acab398cc",
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
							gVar = "ACR_RikuWAR3_Tankbar_ShakeItOff",
							uuid = "70ec3f7a-42b6-f4f3-877b-fc694723caa9",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 903.50044082329,
				name = "[WAR] Shake - P4 stack/spread",
				timeRange = true,
				timelineIndex = 166,
				timerEndOffset = -4,
				timerOffset = -2,
				timerStartOffset = -7,
				uuid = "9b0ddc28-a939-8895-963d-c4bb86e912c0",
				version = 2,
			},
		},
	},
	[167] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "fb571551-cab3-4115-01ed-9e6b464525a1",
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
				uuid = "2c52cda2-55b6-f06e-6500-fa949725c472",
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
				uuid = "86b2ea35-870a-9591-cdb8-614f39c85645",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[170] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "746df7f9-7d36-3325-9941-4c571a80a889",
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
				uuid = "02390824-a556-f450-db45-4bd6f4e5f8f4",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[172] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "91b798f1-32c5-5e7d-aaa8-57a7a9681041",
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
				uuid = "0217ad02-4bb8-64ae-eaf6-1c6cabe93752",
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
							gVar = "ACR_RikuWAR3_Tankbar_ShakeItOff",
							uuid = "8fcc181c-8d69-5693-8702-556f05525d3e",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				enabled = false,
				mechanicTime = 973.84072239989,
				name = "[OT only] Shake - P5 opening (disabled)",
				timeRange = true,
				timelineIndex = 173,
				timerEndOffset = -1,
				timerStartOffset = -6,
				uuid = "7734931d-35d1-64f9-83f7-1890cb97c6a7",
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
									"ea0e0e86-fe42-2d37-bed1-584a0c62ee68",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "a8db98db-2bac-a10f-834b-602e22154909",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "ea0e0e86-fe42-2d37-bed1-584a0c62ee68",
							version = 3,
						},
					},
				},
				mechanicTime = 973.84072239989,
				name = "[MT] Reprisal - P5 Repeater I",
				timeRange = true,
				timelineIndex = 173,
				timerEndOffset = -2.5,
				timerOffset = -3,
				timerStartOffset = -5,
				uuid = "fd7e531c-5b1b-99ff-91c6-9cfa164e3d25",
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
							gVar = "ACR_RikuWAR3_Hotbar_ShirkOT",
							uuid = "56e5644d-940a-c547-b33c-1cd895d23ea4",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 973.84072239989,
				name = "[Tank] Shirk OT",
				timeRange = true,
				timelineIndex = 173,
				timerOffset = -2,
				timerStartOffset = -6,
				uuid = "0142584b-a89c-ee17-bb56-06fe3e4d8b5a",
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
				uuid = "b3be6232-0a92-e5c6-e3c9-3320b0a46402",
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
							gVar = "ACR_RikuWAR3_Tankbar_Damnation",
							uuid = "f648de39-b72b-3446-9e49-20821fe2d3f0",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 978.67931016566,
				name = "[WAR] Damnation",
				timelineIndex = 177,
				timerOffset = -6,
				uuid = "01d68279-b318-88aa-884e-bd580da23ae3",
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
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "3cc9ce9a-5ff7-102f-8bc8-4f1721475d6f",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 978.67931016566,
				name = "[WAR] Whetting - P5 opening autos",
				timeRange = true,
				timelineIndex = 177,
				timerEndOffset = -0.60000002384186,
				timerOffset = -2,
				timerStartOffset = -2,
				uuid = "03d68a05-a7c0-23f8-8f10-92d651398335",
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
							gVar = "ACR_RikuWAR3_Tankbar_Equilibrium",
							uuid = "c2b054a6-b676-93b2-b44a-e79b4bf12644",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 978.67931016566,
				name = "[WAR] Equilbrium",
				timelineIndex = 177,
				timerOffset = -4,
				uuid = "62b072f1-7351-9745-9aa0-ce8bfc755cf6",
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
				uuid = "ddae5c8c-e7f9-44c8-5dab-9dceb5db10dc",
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
				uuid = "d7657e50-cac2-58e4-8945-353e461d0220",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "5d70b760-c5e1-03e4-8c59-00326ff3b7b0",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[185] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "b4d88e11-9809-3bed-e07c-23a30d3f3661",
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
				uuid = "3ca16fc6-404b-90f2-6e42-f0083d991ad6",
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
							gVar = "ACR_RikuWAR3_Tankbar_Rampart",
							uuid = "81c2d5eb-a8b7-bcac-ad53-883199d5b728",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1004.2901808608,
				name = "[Tank] Rampart",
				timelineIndex = 187,
				timerOffset = -8,
				uuid = "a59be6b4-3bb5-0f1b-a9d8-89c346122b20",
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
							gVar = "ACR_RikuWAR3_Tankbar_ThrillOfBattle",
							uuid = "124c7b84-ac55-040a-95ec-49ab03d8d132",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1004.2901808608,
				name = "[WAR] Thrill - Orchestra I",
				timeRange = true,
				timelineIndex = 187,
				timerEndOffset = -2,
				timerStartOffset = -4,
				uuid = "d2d710c7-34f4-ee97-b99d-dad3b876bf28",
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
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "7bfdbdd9-3735-6ee8-9e49-bd271a4001c3",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1004.2901808608,
				name = "[WAR] Whetting - Orchestra I",
				timeRange = true,
				timelineIndex = 187,
				timerEndOffset = -0.75,
				timerOffset = -2,
				timerStartOffset = -2,
				uuid = "824553e6-913b-45b4-bc8b-b296f3911bb7",
				version = 2,
			},
			inheritedIndex = 3,
		},
	},
	[188] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "b957bf78-4e0c-f62c-02bc-c75a0828a6c8",
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
							gVar = "ACR_RikuWAR3_Hotbar_Provoke",
							uuid = "ab3ab5f1-d400-bd91-81dd-3e224ee592c0",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1007.4434123588,
				name = "[MT] Provoke",
				timeRange = true,
				timelineIndex = 189,
				timerEndOffset = 2.5,
				uuid = "558a5f1d-c93f-d930-89b2-c611a78ec28d",
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
							actionID = 43,
							gVar = "ACR_RikuWAR3_Tankbar_Holmgang",
							ignoreWeaveRules = true,
							uuid = "99c8239b-50e8-00c4-b407-c7db4a5ed46f",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1010.9409115474,
				name = "[WAR] Holmgang - flare and autos",
				timeRange = true,
				timelineIndex = 190,
				timerEndOffset = -0.75,
				timerOffset = -3,
				timerStartOffset = -2,
				uuid = "a9ed5cd0-d4d6-ef05-9faa-2cf4e693a011",
				version = 2,
			},
			inheritedIndex = 1,
		},
	},
	[191] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e6ead85a-eaa1-9a1e-6e6d-4c18263c99aa",
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
				uuid = "12f935fb-a9c8-b8af-3922-d705f2fc864b",
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
				uuid = "113e32e0-9e0b-c574-5f6a-d1324c7b8930",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[195] = 
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
									"97a344bf-ec69-c9ab-afac-a70cb14b3200",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "1c07148d-6b7f-e236-a7f7-52ad0749ab13",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "97a344bf-ec69-c9ab-afac-a70cb14b3200",
							version = 3,
						},
					},
				},
				mechanicTime = 1034.3163569005,
				name = "[MT] Reprisal - Celestriad",
				timeRange = true,
				timelineIndex = 195,
				timerEndOffset = -1.5,
				timerOffset = -3,
				timerStartOffset = -4,
				uuid = "f44e827c-8c85-d555-a264-f02813e632a2",
				version = 2,
			},
		},
	},
	[202] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "35b0b625-ac61-7db9-42be-f05f2e7fafb5",
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
				uuid = "bddfdc60-2650-28e4-39f2-5852d062dcb0",
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
							actionID = 7388,
							gVar = "ACR_RikuWAR3_Tankbar_ShakeItOff",
							ignoreWeaveRules = true,
							uuid = "55ba998b-4095-1d9c-a1b6-9b87209d2375",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1055.6337560913,
				name = "[WAR] Shake - P5 Repeater II",
				timeRange = true,
				timelineIndex = 204,
				timerEndOffset = -6.65,
				timerOffset = -3,
				timerStartOffset = -8.15,
				uuid = "9311813f-495f-d3cb-acf9-9ecf4f7a8f54",
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
				uuid = "dc71e9f5-7bdf-1499-6c5b-bff7175f6b05",
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
							gVar = "ACR_RikuWAR3_Tankbar_Equilibrium",
							uuid = "88a95310-bde0-47fb-ac21-3a9f2ad15cbc",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1060.5180184963,
				name = "[WAR] Equilibríum",
				timelineIndex = 208,
				timerOffset = -10,
				uuid = "7cfc43ac-fca0-c423-b97d-600e0527eafc",
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
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "f8a85ad9-593f-6103-9b39-5624266b8b4d",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1060.5180184963,
				name = "[WAR] Whetting - Repeater II autos",
				timeRange = true,
				timelineIndex = 208,
				timerEndOffset = -1,
				timerOffset = -2,
				timerStartOffset = -3,
				uuid = "3f343ca9-2b27-4786-a924-a7b33f073d2d",
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
				uuid = "c8dad862-e3e1-6196-5a9a-bbdc3da76532",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "2998a206-5b93-2a6a-6e5f-4d7c5d640d96",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "f2682910-375e-7c54-902d-a4fedba90ea0",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "aa811640-0ceb-e354-b076-2cdaeadaa590",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
							gVar = "ACR_RikuWAR3_Tankbar_Rampart",
							ignoreWeaveRules = true,
							uuid = "0deda826-6999-a633-9be7-d34c43eeff18",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1096.3623108088,
				name = "[WAR] Rampart - Orchestra II last",
				timeRange = true,
				timelineIndex = 211,
				timerEndOffset = -0.75,
				timerOffset = -7,
				timerStartOffset = -2,
				uuid = "b0adcf78-4e4c-aba5-b280-294633874aa5",
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
							gVar = "ACR_RikuWAR3_Tankbar_Bloodwhetting",
							uuid = "f8a85ad9-593f-6103-9b39-5624266b8b4d",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1096.3623108088,
				name = "[WAR] Whetting - Orchestra II",
				timeRange = true,
				timelineIndex = 211,
				timerEndOffset = -2.1,
				timerOffset = -2,
				timerStartOffset = -3.5,
				uuid = "272bad3f-f066-1986-95e2-a6eaafa9c67a",
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
				uuid = "d0d5e59e-1939-0af2-2bbc-abf0e74163ee",
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
							gVar = "ACR_RikuWAR3_Tankbar_Damnation",
							uuid = "5a103976-e0f7-66ef-9f4c-a1cf1ac0983e",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1099.544362845,
				name = "[WAR] Damnation",
				timeRange = true,
				timelineIndex = 214,
				timerEndOffset = -0.5,
				timerOffset = -1,
				timerStartOffset = -4,
				uuid = "6738cdb7-ac69-12b5-9775-ddf6da915197",
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
							gVar = "ACR_RikuWAR3_Hotbar_ShirkOT",
							uuid = "b24d5649-5b2c-8046-95a0-60f45e38ee72",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1099.544362845,
				name = "[MT] Shirk",
				timeRange = true,
				timelineIndex = 214,
				timerEndOffset = 2.25,
				timerStartOffset = 0.25,
				uuid = "16e72f20-6490-6db1-874d-3e25c12f382c",
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
				uuid = "fb706ef6-96cc-4e62-6f73-43cc68147c06",
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
				uuid = "bc3325a8-cad7-671c-bcc3-41d623c0e6b8",
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
							gVar = "ACR_RikuWAR3_Tankbar_ThrillOfBattle",
							uuid = "5196290d-a6dd-ced3-a517-bc22d1265e4e",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1113.9009474604,
				name = "[WAR] Thrill",
				timeRange = true,
				timelineIndex = 218,
				timerEndOffset = -0.5,
				timerOffset = -2,
				timerStartOffset = -3,
				uuid = "d8d819a5-ed13-1b6d-8f88-dbc6057c9457",
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
				uuid = "8851b48d-bd3c-5511-3d4e-3cb3214ef65d",
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
									"4106a548-b6ca-189e-a9fe-2aba41baf0e0",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_Reprisal",
							uuid = "b1550f63-7d72-be1c-acff-6490eadf43bb",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\nif player == nil or target == nil then return false end\nlocal realRadius = target.hitradius - (ACR_RikuWAR3_TargetHitRadiusAdjust or 0)\nreturn TensorCore.getDistance2d(player.pos, target.pos) <= realRadius + player.hitradius + 3",
							name = "Reprisal real melee range",
							uuid = "4106a548-b6ca-189e-a9fe-2aba41baf0e0",
							version = 3,
						},
					},
				},
				mechanicTime = 1125.2071474604,
				name = "[MT] Reprisal - Forsaken I",
				timeRange = true,
				timelineIndex = 219,
				timerEndOffset = -1,
				timerOffset = -2,
				timerStartOffset = -4,
				uuid = "40ab504e-14d6-051f-b7bd-f8510923fc1c",
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
				uuid = "7e24a868-ef67-177c-062c-c446024bad38",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "40c434d8-bcde-43dc-2dad-c19a2877a828",
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
				uuid = "c3a81d66-96cc-9dda-a28c-4d9ca431b976",
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
							actionID = 7388,
							gVar = "ACR_RikuWAR3_Tankbar_ShakeItOff",
							ignoreWeaveRules = true,
							uuid = "8fcc181c-8d69-5693-8702-556f05525d3e",
							variableTogglesType = 3,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 1141.5122474604,
				name = "[WAR] Shake - Forsaken III",
				timeRange = true,
				timelineIndex = 223,
				timerEndOffset = -2,
				timerOffset = -2,
				timerStartOffset = -3,
				uuid = "8a1d2af2-f701-431d-89ff-348531d6b454",
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
				uuid = "05892674-373d-6910-6fb2-e14ad1128bc4",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "406f9db4-a473-a920-83dc-702e75f67104",
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
									"7b01d1ee-f275-821e-9497-ab1c63bb0692",
									true,
								},
								
								{
									"9b4166e2-c526-1197-a557-984c61001ade",
									true,
								},
							},
							gVar = "ACR_RikuWAR3_Tankbar_NascentFlashMouse",
							targetType = "Detection Target",
							uuid = "a839c3e4-8acc-f05d-9d29-d37d9a1aceb0",
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
							conditionLua = "return AnyoneCore ~= nil and AnyoneCore.Roster ~= nil\n    and AnyoneCore.Roster.current() ~= nil\n    and AnyoneCore.Roster.idOf(\"R1\") ~= nil",
							name = "R1 resolved",
							uuid = "7b01d1ee-f275-821e-9497-ab1c63bb0692",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local r1ID = AnyoneCore.Roster.idOf(\"R1\")\nreturn r1ID ~= nil and eventArgs.detectionTargetID == r1ID",
							name = "Assigned R1",
							uuid = "7cb74a30-e6c4-f172-b901-50af27a7a988",
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
									"7cb74a30-e6c4-f172-b901-50af27a7a988",
									true,
								},
							},
							filterTargetType = "Party",
							name = "Living R1",
							uuid = "9b4166e2-c526-1197-a557-984c61001ade",
							version = 3,
						},
					},
				},
				mechanicTime = 1149.6575474604,
				name = "[WAR] Nascent R1 - Forsaken IV",
				timeRange = true,
				timelineIndex = 225,
				timerEndOffset = -1.5,
				timerOffset = -2,
				timerStartOffset = -3.5,
				uuid = "edac41f4-febd-6246-b33d-498a37662e6c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "WAR Kill Potions",
				uuid = "252d7303-c95b-9b80-b1ac-e3297d52468e",
			},
			objectType = "folder",
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
									"9471615e-b99d-834b-b12a-123475d0a489",
									true,
								},
								
								{
									"f8e79701-1492-4ec4-ae91-d8d203405998",
									true,
								},
								
								{
									"825cd29c-6607-dad1-9bfe-5aba31b4d68b",
									true,
								},
								
								{
									"76bc8ab6-49da-778f-a17f-94e8d364f240",
									true,
								},
							},
							name = "Strength Potion",
							potType = 4,
							usePot = true,
							uuid = "ed0b9f70-d462-48f9-a178-93f032f1301a",
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local state = data.warDmuKillPots\nif state ~= nil and state.previousAutoPotion ~= nil then\n    ACR_RikuWAR3_Potion = state.previousAutoPotion\n    state.previousAutoPotion = nil\nend\nself.used = true",
							conditions = 
							{
								
								{
									"3d8a9c68-3696-1ac0-8973-136ed2a87f23",
									true,
								},
							},
							name = "Restore Auto Potion",
							uuid = "39906733-c199-f600-a4d1-87b19d0024b0",
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
							jobValue = "WARRIOR",
							name = "Warrior",
							uuid = "9471615e-b99d-834b-b12a-123475d0a489",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							name = "In Combat",
							uuid = "f8e79701-1492-4ec4-ae91-d8d203405998",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 2,
							hpType = 2,
							hpValue = 1,
							name = "Alive",
							uuid = "825cd29c-6607-dad1-9bfe-5aba31b4d68b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 2,
							buffID = 49,
							category = "Self",
							name = "Not Medicated",
							uuid = "76bc8ab6-49da-778f-a17f-94e8d364f240",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionUUID = "ed0b9f70-d462-48f9-a178-93f032f1301a",
							category = "Action",
							name = "Final Potion Used",
							uuid = "3d8a9c68-3696-1ac0-8973-136ed2a87f23",
							version = 3,
						},
					},
				},
				displayPath = "WAR Kill Potions",
				mechanicTime = 1149.6575474604,
				name = "[WAR] P5 Kill Potion - final Forsaken",
				timeRange = true,
				timelineIndex = 225,
				timerEndOffset = 6,
				uuid = "23928577-509b-897f-af66-0db693701172",
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
							actionLua = "local state = data.warDmuKillPots\nif state ~= nil and state.previousAutoPotion ~= nil then\n    ACR_RikuWAR3_Potion = state.previousAutoPotion\n    state.previousAutoPotion = nil\nend\nself.used = true",
							name = "Restore Auto Potion",
							uuid = "5fdda3b8-0767-eead-9c36-7e4734131d91",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "WAR Kill Potions",
				mechanicTime = 1149.6575474604,
				name = "[WAR] Kill pot plan - final cleanup",
				timeRange = true,
				timelineIndex = 225,
				timerEndOffset = 12.3424525396,
				timerStartOffset = 6.3424525395999,
				uuid = "df4913ed-1626-8443-b2ac-926395d3c113",
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