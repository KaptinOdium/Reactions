local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "67b5c3f0-e85d-313c-0def-899e20072460",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Zelenia\\AutoSim",
				uuid = "143cdb0f-5467-ecb3-3bf1-59d17142d31f",
			},
			inheritanceRoot = "Kaptin\\Zelenia\\AutoSim",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "SAM DoTs",
				uuid = "0307defd-5b7f-bafe-823e-fb1d0de5b492",
			},
			objectType = "folder",
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
							actionLua = "-- OnWipe runs after data has been cleared; use its documented oldData snapshot.\nlocal old = eventArgs.oldData\nlocal g = old and old.kaptinZeleniaSamDoTs\nif g and g.active then\n    if type(g.previousDoTs) == \"boolean\" then\n        ACR_TensorWeeb4_DoTs = g.previousDoTs\n    end\n    g.active = false\n    g.done = true\nend\nself.used = true\n",
							conditions = 
							{
								
								{
									"fa6a91e7-7ee9-2198-85fd-636b4659061c",
									true,
								},
							},
							name = "[SAM] Restore Zelenia DoTs on wipe",
							uuid = "9927918c-a9af-1309-8c98-ef09fb0fa9bc",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local old = eventArgs.oldData\nlocal g = old and old.kaptinZeleniaSamDoTs\nreturn g ~= nil and g.active == true",
							dequeueIfLuaFalse = true,
							name = "Previous pull held DoTs",
							uuid = "fa6a91e7-7ee9-2198-85fd-636b4659061c",
							version = 3,
						},
					},
				},
				displayPath = "SAM DoTs",
				eventType = 9,
				loop = true,
				mechanicTime = 11.4,
				name = "[SAM] Restore Zelenia DoTs on wipe",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 888.6,
				timerStartOffset = -71.4,
				uuid = "a1561ebe-396c-9640-9458-364611c98c2c",
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
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "ecc1c06d-8e15-e0f9-1e29-13fbbbde0c5d",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[13] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "00187bd3-3f42-29c7-2df4-e5a1f3815f83",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[15] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "90fcc951-0994-7cfd-4dc2-f4a3d7877081",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Zelenia\\AutoSim",
				uuid = "0584b04e-dd56-79c2-201e-80cc2df65f1e",
			},
			inheritanceRoot = "Kaptin\\Zelenia\\AutoSim",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "SAM DoTs",
				uuid = "6911f1f6-6f34-7798-9334-060dcaf65966",
			},
			objectType = "folder",
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
							actionLua = "-- Only a known orb becoming untargetable starts the late-add DoT hold.\n-- Keep the original Boolean, including a manually disabled DoTs toggle.\nlocal s = data.kaptinZeleniaAutoSim\nlocal g = data.kaptinZeleniaSamDoTs\nif s and (s.stage == 2 or s.stage == 3) and s.orbs[eventArgs.entityID] ~= nil\n    and (not g or (not g.active and not g.done))\n    and type(ACR_TensorWeeb4_DoTs) == \"boolean\" then\n    g = g or {}\n    data.kaptinZeleniaSamDoTs = g\n    g.previousDoTs = ACR_TensorWeeb4_DoTs\n    g.active = true\n    ACR_TensorWeeb4_DoTs = false\nend\nself.used = true\n",
							conditions = 
							{
								
								{
									"0b9de7eb-a906-7394-9241-136d5f7f02fe",
									true,
								},
								
								{
									"fe1e1ed6-b978-f603-89b1-cb9359e49e12",
									true,
								},
								
								{
									"b53bafee-f1cd-f46b-b3f7-20f42707cf06",
									true,
								},
								
								{
									"e2520b2a-6539-2f7a-979c-ca2b664d4277",
									true,
								},
								
								{
									"f75b9411-10b6-d8d3-a88e-56ba8abfd38d",
									true,
								},
							},
							name = "[SAM] Hold DoTs after first Zelenia orb",
							uuid = "053ba3aa-4f49-2342-8a30-037cc471e12a",
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
							uuid = "0b9de7eb-a906-7394-9241-136d5f7f02fe",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 13860,
							name = "Roseblood Drop",
							uuid = "fe1e1ed6-b978-f603-89b1-cb9359e49e12",
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
							uuid = "b53bafee-f1cd-f46b-b3f7-20f42707cf06",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return Argus.getEntityModel(eventArgs.entityID) == 18370",
							dequeueIfLuaFalse = true,
							name = "Roseblood Drop model",
							uuid = "e2520b2a-6539-2f7a-979c-ca2b664d4277",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s = data.kaptinZeleniaAutoSim\nreturn s ~= nil and (s.stage == 2 or s.stage == 3) and s.orbs[eventArgs.entityID] ~= nil",
							dequeueIfLuaFalse = true,
							name = "Known orb during add phase",
							uuid = "f75b9411-10b6-d8d3-a88e-56ba8abfd38d",
							version = 3,
						},
					},
				},
				displayPath = "SAM DoTs",
				eventType = 26,
				loop = true,
				mechanicTime = 93.5,
				name = "[SAM] Hold DoTs after first Zelenia orb",
				timeRange = true,
				timelineIndex = 15,
				timerEndOffset = 126.5,
				timerStartOffset = -8.5,
				uuid = "8162efa4-c2d4-fc4a-bb57-42bffd612a9f",
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
							actionLua = "-- Mark the cycle done even if this return event runs before the shared tracker.\nlocal s = data.kaptinZeleniaAutoSim\nif s and s.stage > 0 and s.stage <= 4 then\n    local g = data.kaptinZeleniaSamDoTs or {}\n    data.kaptinZeleniaSamDoTs = g\n    if g.active and type(g.previousDoTs) == \"boolean\" then\n        ACR_TensorWeeb4_DoTs = g.previousDoTs\n    end\n    g.active = false\n    g.done = true\nend\nself.used = true\n",
							conditions = 
							{
								
								{
									"3e3eaca1-b7d2-56ae-aa0f-78054122692a",
									true,
								},
								
								{
									"256ae646-6ff4-94f8-9a73-613107d5ea93",
									true,
								},
								
								{
									"1c07265c-33d7-05a2-a353-f9611fd66ff9",
									true,
								},
								
								{
									"77b99696-f583-3714-847a-b85b05cbafcc",
									true,
								},
								
								{
									"3421cf92-fd8e-3634-bd92-bef9aa7c1d17",
									true,
								},
							},
							name = "[SAM] Restore DoTs on Zelenia return",
							uuid = "384bad30-513a-8359-a936-d8b9523b597a",
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
							uuid = "3e3eaca1-b7d2-56ae-aa0f-78054122692a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 13861,
							name = "Zelenia",
							uuid = "256ae646-6ff4-94f8-9a73-613107d5ea93",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgType = 3,
							name = "Targetable",
							uuid = "1c07265c-33d7-05a2-a353-f9611fd66ff9",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return Argus.getEntityModel(eventArgs.entityID) == 18374",
							dequeueIfLuaFalse = true,
							name = "Zelenia model",
							uuid = "77b99696-f583-3714-847a-b85b05cbafcc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s = data.kaptinZeleniaAutoSim\nreturn s ~= nil and s.stage > 0 and s.stage <= 4",
							dequeueIfLuaFalse = true,
							name = "Boss has departed",
							uuid = "3421cf92-fd8e-3634-bd92-bef9aa7c1d17",
							version = 3,
						},
					},
				},
				displayPath = "SAM DoTs",
				eventType = 26,
				loop = true,
				mechanicTime = 93.5,
				name = "[SAM] Restore DoTs on Zelenia return",
				timeRange = true,
				timelineIndex = 15,
				timerEndOffset = 126.5,
				timerStartOffset = -8.5,
				uuid = "da249497-6297-44f3-9218-c553d3aa51e4",
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
							actionLua = "-- Recover missed targetability events from shared, observed encounter state only.\nlocal s = data.kaptinZeleniaAutoSim\nlocal g = data.kaptinZeleniaSamDoTs\nif s then\n    if s.stage == 4 and g and g.active then\n        if type(g.previousDoTs) == \"boolean\" then\n            ACR_TensorWeeb4_DoTs = g.previousDoTs\n        end\n        g.active = false\n        g.done = true\n    elseif s.firstOrbDeath == true and (s.stage == 2 or s.stage == 3)\n        and (not g or (not g.active and not g.done))\n        and type(ACR_TensorWeeb4_DoTs) == \"boolean\" then\n        g = g or {}\n        data.kaptinZeleniaSamDoTs = g\n        g.previousDoTs = ACR_TensorWeeb4_DoTs\n        g.active = true\n        ACR_TensorWeeb4_DoTs = false\n    end\nend\nself.used = true\n",
							conditions = 
							{
								
								{
									"fc681600-5413-4017-b816-f37fd79c7a76",
									true,
								},
								
								{
									"853e8f12-d3b4-21e3-9de2-0a4b054a5013",
									true,
								},
							},
							name = "[SAM] Recover late-orb DoT guard",
							uuid = "16f3d62f-eb19-5cc2-bdc4-5478ecd95463",
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
							uuid = "fc681600-5413-4017-b816-f37fd79c7a76",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s = data.kaptinZeleniaAutoSim\nlocal g = data.kaptinZeleniaSamDoTs\nreturn s ~= nil and ((s.firstOrbDeath == true and (s.stage == 2 or s.stage == 3) and (g == nil or (not g.active and not g.done))) or (s.stage == 4 and g ~= nil and g.active == true))",
							name = "Missed orb death or boss return",
							uuid = "853e8f12-d3b4-21e3-9de2-0a4b054a5013",
							version = 3,
						},
					},
				},
				displayPath = "SAM DoTs",
				loop = true,
				mechanicTime = 93.5,
				name = "[SAM] Recover late-orb DoT guard",
				throttleTime = 250,
				timeRange = true,
				timelineIndex = 15,
				timerEndOffset = 126.5,
				timerStartOffset = -8.5,
				uuid = "7ad6b550-a308-3452-a215-b6988b25a964",
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
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "67c948a2-af2d-4fde-4573-d3c85a20bbd2",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[17] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "5d465347-e214-5253-0ac2-2d4deb401cb7",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[Opti] Disable CDs",
				uuid = "9dab428c-36f0-9c2e-969d-78e2bce7d2c5",
				version = 2,
			},
			inheritedObjectUUID = "647d57c2-f65d-3b8d-9a0f-6737e922a190",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
	},
	[23] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "f0ec6246-526d-b8aa-a5b6-a480f147e536",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[Opti] Enable CDs",
				uuid = "586de132-f1d0-400e-bccc-0279a1853f32",
				version = 2,
			},
			inheritedObjectUUID = "08972945-67d0-82bb-b1a9-dafd9f626634",
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
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "0c7e9d5a-f0d9-8b7e-1665-9930bab3c00a",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[34] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "c29a44b6-6f24-0ac2-edd9-0cd4e4aff5a6",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[35] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "5fd133ab-0bcc-42e7-ae61-28c9aa89465b",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[48] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "83fe9597-6b98-cfb3-f768-7ab10e73e507",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[51] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "de6e9b19-d339-d3f5-d9d7-ef9358814d89",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[56] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "e9768f46-69bf-8b7a-320c-b8dce9d21236",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[57] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "75fbb6fb-92c6-c4ff-0ac6-de118709012b",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[62] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "bc927c37-e98a-2553-d55f-bcc1dd4fc727",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[66] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "c4d3bf03-46b7-fcc7-2032-306db0d4c6b3",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[70] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "ca4666e6-14e4-c4d2-fc52-7e3c39df9156",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[71] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "7ac1ab9b-a604-25b7-f004-e4710beb564b",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[72] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "2f69cee0-d9f7-c88c-0111-66425e5dd290",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[76] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "72d5c3c4-69aa-1b28-82c6-e6fe55235934",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[82] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "731d47d5-d6f5-0659-1799-f78bcd267045",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[86] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "38bf5309-c8cf-aea5-1918-cc3f1963e9f9",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[88] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "a6cc6943-37cc-56c7-034c-5a4ddfc223f3",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[89] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "9397268e-424f-4c22-3dfe-00c8fa1fa2fe",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[103] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "4d3cd3ab-db80-7227-27c3-e78dcdfbc01b",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[105] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "1eb52009-f81f-025d-44fa-1c97cd54e2b9",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[115] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "5ddd822a-94b3-e7ce-1120-95b007db759a",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[118] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "0878d813-ba0c-c21f-1ef3-d181180dd383",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[119] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "5aa39f9e-e17f-ac9a-66a0-208cbb0fb0ce",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	[120] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin\\Kaptin - Zelenia SAM ",
				uuid = "d009e0b2-fa0f-c4de-b9b4-6d4cbb035d22",
			},
			inheritanceRoot = "Kaptin\\Kaptin - Zelenia SAM ",
			objectType = "folder",
		},
	},
	inheritedProfiles = 
	{
		"Kaptin\\Kaptin - Zelenia SAM ",
		"Kaptin\\Zelenia\\AutoSim",
	},
	timelineName = "zelenia-ex",
	version = "1.0.1",
}



return tbl