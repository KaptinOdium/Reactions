local tbl = 
{
	
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
			name = "-- Draw reactions below here --",
			uuid = "0bc71c45-b3d2-c6f5-9741-0c714a0380a6",
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
						actionLua = "data.ocCombatTimer = Now()\nself.used=true",
						conditions = 
						{
							
							{
								"01f3fe13-c40c-3ce8-8d19-23ddba44f5bb",
								true,
							},
							
							{
								"c0885fdc-b761-e898-bcc3-c2982938e5b6",
								true,
							},
							
							{
								"ffa93cf7-1588-f5be-ab51-e43b5b424dd6",
								true,
							},
							
							{
								"cc96ea40-8454-5c36-bc90-9f13fc20a510",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuMNK3_CD",
						name = "Start Combat Timer",
						uuid = "a21789cd-ea60-48f5-af65-4eca46a5aa01",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "data.ocCombatTimer = nil\nself.used=true",
						conditions = 
						{
							
							{
								"01f3fe13-c40c-3ce8-8d19-23ddba44f5bb",
								true,
							},
							
							{
								"c0885fdc-b761-e898-bcc3-c2982938e5b6",
								true,
							},
							
							{
								"ffa93cf7-1588-f5be-ab51-e43b5b424dd6",
								false,
							},
							
							{
								"cc96ea40-8454-5c36-bc90-9f13fc20a510",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuMNK3_CD",
						name = "Stop Combat Timer",
						uuid = "85c10f21-1fd4-3e0f-a534-9d26acf5563c",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "01f3fe13-c40c-3ce8-8d19-23ddba44f5bb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						localmapid = 1252,
						name = "In OC",
						uuid = "c0885fdc-b761-e898-bcc3-c2982938e5b6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "ffa93cf7-1588-f5be-ab51-e43b5b424dd6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil",
						dequeueIfLuaFalse = true,
						name = "Combat Timer Started",
						uuid = "cc96ea40-8454-5c36-bc90-9f13fc20a510",
						version = 3,
					},
				},
			},
			name = "Combat Timer",
			throttleTime = 1000,
			uuid = "6c480024-1df2-d753-a42b-8cd28650342b",
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
						aType = "Lua",
						actionLua = "data.isRezzed = true\nself.used = true",
						conditions = 
						{
							
							{
								"9e45f944-072d-e047-b62e-393353080bac",
								true,
							},
							
							{
								"0ace1003-5839-1467-a022-b288a25b9b23",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_CD",
						name = "Record Rezzed",
						uuid = "f2218a47-49cc-308a-8bbe-71548f36c847",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.isRezzed == nil or data.isRezzed == false",
						dequeueIfLuaFalse = true,
						name = "Check Variable",
						uuid = "9e45f944-072d-e047-b62e-393353080bac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 148,
						category = "Self",
						name = "Is Rezzed",
						uuid = "0ace1003-5839-1467-a022-b288a25b9b23",
						version = 3,
					},
				},
			},
			name = "Record Rezzed",
			uuid = "7163d586-f39c-0cbc-bc73-54fd77394c79",
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
						aType = "Lua",
						actionLua = "data.wasRezzed = true\ndata.rezzTimer = Now()\nself.used = true",
						conditions = 
						{
							
							{
								"2fa68570-4c16-0b05-8ff2-41fdb94e5df0",
								true,
							},
							
							{
								"0ace1003-5839-1467-a022-b288a25b9b23",
								true,
							},
							
							{
								"ef2ee77d-190e-cd39-a12d-01014fccf2ca",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_CD",
						name = "Record Was Rezzed",
						uuid = "f2218a47-49cc-308a-8bbe-71548f36c847",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.wasRezzed == nil or data.wasRezzed == false",
						dequeueIfLuaFalse = true,
						name = "Check Variable",
						uuid = "2fa68570-4c16-0b05-8ff2-41fdb94e5df0",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 148,
						category = "Lua",
						conditionLua = "return data.isRezzed == true",
						dequeueIfLuaFalse = true,
						name = "Has Been Rezzed",
						uuid = "0ace1003-5839-1467-a022-b288a25b9b23",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 148,
						category = "Self",
						name = "Is Rezzing",
						uuid = "ef2ee77d-190e-cd39-a12d-01014fccf2ca",
						version = 3,
					},
				},
			},
			name = "Record Was Rezzed",
			uuid = "9f00e291-a1de-4adf-8ae0-c21f1280e8d4",
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
						aType = "Lua",
						actionLua = "data.isRezzed = false\ndata.wasRezzed = false\ndata.rezzTimer = nil\nself.used = true",
						conditions = 
						{
							
							{
								"dd1ab9c9-a03e-cece-b5a1-c2d2a386a331",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_CD",
						name = "Reset Rezz State",
						uuid = "ff4ba863-d13d-8ced-b1fc-d922b8d7fe6a",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.wasRezzed == true and TimeSince(data.rezzTimer) >= 3000",
						dequeueIfLuaFalse = true,
						name = "Was Rezzed >= 5s",
						uuid = "dd1ab9c9-a03e-cece-b5a1-c2d2a386a331",
						version = 3,
					},
				},
			},
			name = "Reset Rezzed",
			uuid = "73a56b2a-c698-d163-9526-15eaa4774a78",
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
						actionID = 41647,
						conditions = 
						{
							
							{
								"bead46c3-17fe-4bf8-a9cb-2e315439988f",
								true,
							},
							
							{
								"43b369ad-2b19-c673-8478-6db60cf737fb",
								true,
							},
							
							{
								"b35fdc9a-5bdd-3401-aab1-7b46c2f170ed",
								true,
							},
							
							{
								"77b8eed8-0cfb-695a-a37c-568bb356cfeb",
								true,
							},
							
							{
								"f2cd7611-cc8e-4b92-9d1d-772b8439c8ff",
								true,
							},
						},
						gVar = "ACR_TensorMagnum3_Hotbar_DutyAction3",
						ignoreWeaveRules = true,
						name = "Vigilance",
						uuid = "b5b7bdaf-d738-0790-9675-a5b28a36f08b",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						localmapid = 1252,
						name = "South Horn",
						uuid = "bead46c3-17fe-4bf8-a9cb-2e315439988f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						inCombatType = 2,
						name = "Out of Combat",
						uuid = "43b369ad-2b19-c673-8478-6db60cf737fb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4369,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Phantom Thief",
						uuid = "b35fdc9a-5bdd-3401-aab1-7b46c2f170ed",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "77b8eed8-0cfb-695a-a37c-568bb356cfeb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "269ed8e2-ad8e-db38-bd40-81e0877c72b2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "162cf644-0e36-bb8c-bd7f-20fa627e9638",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Vigilance\")",
						name = "Toggle",
						uuid = "f2cd7611-cc8e-4b92-9d1d-772b8439c8ff",
						version = 3,
					},
				},
			},
			name = "P. Thief Vigilance",
			throttleTime = 1250,
			uuid = "1017b58d-f39f-e551-a652-11aaff349c79",
			version = 2,
		},
		inheritedIndex = 6,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 41645,
						conditions = 
						{
							
							{
								"bead46c3-17fe-4bf8-a9cb-2e315439988f",
								true,
							},
							
							{
								"43b369ad-2b19-c673-8478-6db60cf737fb",
								true,
							},
							
							{
								"b35fdc9a-5bdd-3401-aab1-7b46c2f170ed",
								true,
							},
							
							{
								"efaf9868-fc91-e133-b7ee-62e8133bbcc0",
								true,
							},
							
							{
								"5fdd4621-9183-81d3-a553-2ad42b69ce8d",
								true,
							},
							
							{
								"d68274ac-885f-3256-8bdb-a4dca4a83c61",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction2",
						name = "Steal",
						targetType = "Current Target",
						uuid = "b5b7bdaf-d738-0790-9675-a5b28a36f08b",
						variableTogglesType = 2,
						version = 2.1,
					},
					inheritedIndex = 1,
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Self",
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						localmapid = 1252,
						name = "South Horn",
						uuid = "bead46c3-17fe-4bf8-a9cb-2e315439988f",
						version = 3,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						name = "In Combat",
						uuid = "43b369ad-2b19-c673-8478-6db60cf737fb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4369,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Phantom Thief",
						uuid = "b35fdc9a-5bdd-3401-aab1-7b46c2f170ed",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 41645,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Not on CD",
						uuid = "efaf9868-fc91-e133-b7ee-62e8133bbcc0",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "5fdd4621-9183-81d3-a553-2ad42b69ce8d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "7c1ff095-31ec-f18b-a239-a2c53c4b9b18",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "371775fb-5512-90e4-9fa6-988f18d03203",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Steal\")",
						name = "Toggle",
						uuid = "d68274ac-885f-3256-8bdb-a4dca4a83c61",
						version = 3,
					},
				},
			},
			name = "P. Thief Steal",
			throttleTime = 1250,
			uuid = "673b17b8-6cfc-7024-b198-23ab7a53080b",
			version = 2,
		},
		inheritedIndex = 7,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 41649,
						conditions = 
						{
							
							{
								"f63493bb-f733-119c-a758-9b0599d8d1bc",
								true,
							},
							
							{
								"183e2fda-dc8b-df87-805b-a860fc5177a9",
								true,
							},
							
							{
								"c3f5e16a-bd98-c5b2-8260-e5b2d04a1ed0",
								true,
							},
							
							{
								"58f4e568-e03e-81de-9f7a-54fcb24e80ed",
								true,
							},
							
							{
								"a81e78f1-987b-edbd-a012-344d8863f871",
								false,
							},
							
							{
								"0871ec24-fb24-fa3d-97e0-3425718700b7",
								true,
							},
							
							{
								"8d9d2da8-b65e-098c-8cef-b8a6705c1440",
								true,
							},
						},
						gVar = "ACR_TensorMagnum3_CD",
						targetType = "Current Target",
						uuid = "41eee827-c894-0837-946e-33eee9b4e04b",
						version = 2.1,
					},
					inheritedIndex = 1,
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Self",
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						localmapid = 1252,
						name = "South Horn",
						uuid = "f63493bb-f733-119c-a758-9b0599d8d1bc",
						version = 3,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						buffID = 4369,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Phantom Thief",
						uuid = "183e2fda-dc8b-df87-805b-a860fc5177a9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						name = "In Combat",
						uuid = "c3f5e16a-bd98-c5b2-8260-e5b2d04a1ed0",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 41649,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Not on CD",
						uuid = "58f4e568-e03e-81de-9f7a-54fcb24e80ed",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 3,
						buffDuration = 10,
						buffID = 4279,
						dequeueIfLuaFalse = true,
						uuid = "a81e78f1-987b-edbd-a012-344d8863f871",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "0871ec24-fb24-fa3d-97e0-3425718700b7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "e9f60f80-5778-5e4b-ba59-cd5f54756373",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "b706117d-8923-19ff-bc0b-fa0c15b28328",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Pilfer\")",
						name = "Toggle",
						uuid = "8d9d2da8-b65e-098c-8cef-b8a6705c1440",
						version = 3,
					},
				},
			},
			name = "P. Thief Pilfer Weapon",
			throttleTime = 1250,
			uuid = "2d05af6c-3473-685c-8e8e-4dd6f5e6bf09",
			version = 2,
		},
		inheritedIndex = 8,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 41590,
						conditions = 
						{
							
							{
								"f4209989-03cd-661a-b174-709466776706",
								true,
							},
							
							{
								"fc4b033f-a236-d271-893e-b6a0685a987b",
								true,
							},
							
							{
								"fe18441a-be3b-f7ca-999a-87e58634239f",
								true,
							},
							
							{
								"fd55e071-38c6-b8d4-a37d-7d73c5774bc4",
								true,
							},
							
							{
								"860ec568-237b-5474-a555-6d7322eadd4e",
								true,
							},
							
							{
								"8e8bebcf-8def-48b0-95df-ead928362b4a",
								true,
							},
							
							{
								"e8c03b24-c5e0-e4e4-be4c-c62e9247e2a2",
								true,
							},
							
							{
								"f53b0dc2-6eba-1d72-b91a-71833a2fe9cd",
								true,
							},
							
							{
								"890d87a5-7537-851b-bb9a-cf6de8658bef",
								true,
							},
							
							{
								"bb1fcc3e-5255-7f4d-ac30-119e02416c20",
								true,
							},
						},
						gVar = "ACR_TensorMagnum3_CD",
						ignoreWeaveRules = true,
						targetType = "Detection Target",
						uuid = "fedf268d-51f4-43d2-b69e-eb93829982ba",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "f4209989-03cd-661a-b174-709466776706",
						version = 3,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						buffID = 4358,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Knight",
						uuid = "fc4b033f-a236-d271-893e-b6a0685a987b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						name = "In Combat",
						uuid = "fe18441a-be3b-f7ca-999a-87e58634239f",
						version = 3,
					},
					inheritedIndex = 3,
				},
				
				{
					data = 
					{
						actionCDValue = 1,
						actionID = 41591,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Occult Heal CD <= 1s",
						uuid = "fd55e071-38c6-b8d4-a37d-7d73c5774bc4",
						version = 3,
					},
					inheritedIndex = 4,
				},
				
				{
					data = 
					{
						category = "Filter",
						comparator = 2,
						conditionType = 2,
						conditions = 
						{
							
							{
								"a4770a8e-440e-b868-b0cc-7cada37d0cc0",
								true,
							},
							
							{
								"19b10dcc-1465-7459-8e7d-1237fc6bde1c",
								true,
							},
						},
						dequeueIfLuaFalse = true,
						filterTargetSubtype = "Lowest HP",
						filterTargetType = "Party",
						hpValue = 50,
						name = "Party HP",
						uuid = "860ec568-237b-5474-a555-6d7322eadd4e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Party",
						comparator = 2,
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 50,
						name = "50% HP",
						partyTargetType = "Detection Target",
						uuid = "a4770a8e-440e-b868-b0cc-7cada37d0cc0",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Party",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Within 30 Yards",
						partyTargetType = "Detection Target",
						uuid = "19b10dcc-1465-7459-8e7d-1237fc6bde1c",
						version = 3,
					},
					inheritedIndex = 7,
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 3,
						dequeueIfLuaFalse = true,
						mpValue = 50,
						name = "Have MP",
						uuid = "8e8bebcf-8def-48b0-95df-ead928362b4a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 14,
						dequeueIfLuaFalse = true,
						jobIDList = 
						{
							31,
							21,
						},
						name = "No Mana Job",
						uuid = "e8c03b24-c5e0-e4e4-be4c-c62e9247e2a2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "f53b0dc2-6eba-1d72-b91a-71833a2fe9cd",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "890d87a5-7537-851b-bb9a-cf6de8658bef",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Heal\")",
						name = "Toggle",
						uuid = "bb1fcc3e-5255-7f4d-ac30-119e02416c20",
						version = 3,
					},
				},
			},
			name = "P. Knight Occult Heal",
			throttleTime = 1250,
			uuid = "d6d3830c-4f68-ae05-923c-9b2d8fd9bd5d",
			version = 2,
		},
		inheritedIndex = 9,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 41589,
						conditions = 
						{
							
							{
								"db68b232-24e2-2a01-ac29-564ead6c714c",
								true,
							},
							
							{
								"bdffe94e-ca3f-daa9-9315-d147de5104f1",
								true,
							},
							
							{
								"0ac5688a-1497-b876-8173-72c5e7eedf35",
								true,
							},
							
							{
								"e56f8f40-375d-f91d-8679-de1f67ac0ed9",
								true,
							},
							
							{
								"e87ce4db-5846-ecda-afe6-4e02117886b7",
								true,
							},
							
							{
								"411a9ae6-6ddc-6156-8c1f-fdb4c91029f4",
								true,
							},
							
							{
								"f43bc8b1-10d0-bcc2-b56d-d4efd476c746",
								true,
							},
						},
						gVar = "ACR_TensorMagnum3_CD",
						name = "Pray",
						uuid = "26bc4764-1c77-8b11-ac38-45f3ba906dd7",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "db68b232-24e2-2a01-ac29-564ead6c714c",
						version = 3,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						buffID = 4358,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Knight",
						uuid = "bdffe94e-ca3f-daa9-9315-d147de5104f1",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						name = "In Combat",
						uuid = "0ac5688a-1497-b876-8173-72c5e7eedf35",
						version = 3,
					},
					inheritedIndex = 3,
				},
				
				{
					data = 
					{
						category = "Self",
						comparator = 2,
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 50,
						name = "HP <= 50%",
						uuid = "e56f8f40-375d-f91d-8679-de1f67ac0ed9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "e87ce4db-5846-ecda-afe6-4e02117886b7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "411a9ae6-6ddc-6156-8c1f-fdb4c91029f4",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Pray\")",
						name = "Toggle",
						uuid = "f43bc8b1-10d0-bcc2-b56d-d4efd476c746",
						version = 3,
					},
				},
			},
			name = "P. Knight Pray",
			throttleTime = 1250,
			uuid = "e26a7d55-62ee-8f3a-a131-ad64aaef15c3",
			version = 2,
		},
		inheritedIndex = 10,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 41591,
						conditions = 
						{
							
							{
								"db68b232-24e2-2a01-ac29-564ead6c714c",
								true,
							},
							
							{
								"bdffe94e-ca3f-daa9-9315-d147de5104f1",
								true,
							},
							
							{
								"0ac5688a-1497-b876-8173-72c5e7eedf35",
								true,
							},
							
							{
								"72d1c6d2-76ad-d6a3-9775-15d5ad51adaa",
								true,
							},
							
							{
								"e56f8f40-375d-f91d-8679-de1f67ac0ed9",
								true,
							},
							
							{
								"7539c735-58d4-57fb-9e3d-feb5062367cf",
								true,
							},
							
							{
								"4ff4a8ae-2218-199f-a6f3-0ecf3cd31311",
								true,
							},
							
							{
								"58faab06-18d6-be0e-bf5f-e2147c6d201f",
								true,
							},
						},
						gVar = "ACR_TensorMagnum3_CD",
						name = "Pledge",
						uuid = "26bc4764-1c77-8b11-ac38-45f3ba906dd7",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "db68b232-24e2-2a01-ac29-564ead6c714c",
						version = 3,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						buffID = 4358,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Knight",
						uuid = "bdffe94e-ca3f-daa9-9315-d147de5104f1",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						name = "In Combat",
						uuid = "0ac5688a-1497-b876-8173-72c5e7eedf35",
						version = 3,
					},
					inheritedIndex = 3,
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41591,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Pledge CD <= 3s",
						uuid = "72d1c6d2-76ad-d6a3-9775-15d5ad51adaa",
						version = 3,
					},
					inheritedIndex = 4,
				},
				
				{
					data = 
					{
						category = "Self",
						comparator = 2,
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 15,
						name = "HP <= 15%",
						uuid = "e56f8f40-375d-f91d-8679-de1f67ac0ed9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "7539c735-58d4-57fb-9e3d-feb5062367cf",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "4ff4a8ae-2218-199f-a6f3-0ecf3cd31311",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Pledge\")",
						name = "Toggle",
						uuid = "58faab06-18d6-be0e-bf5f-e2147c6d201f",
						version = 3,
					},
				},
			},
			name = "P. Knight Pledge",
			throttleTime = 1250,
			uuid = "149b85a5-bf49-2e66-a0f5-cc126faf37a0",
			version = 2,
		},
		inheritedIndex = 11,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 41597,
						actionLua = "return ActionList:Get(5,32),Player.id,false,false",
						conditions = 
						{
							
							{
								"d6d91e2f-272b-5401-ad3f-f0a5c81c766e",
								true,
							},
							
							{
								"53db5447-8ce7-e699-b734-b9c0a383b622",
								true,
							},
							
							{
								"bcc88eba-f173-1e61-83c1-24f032463bc0",
								true,
							},
							
							{
								"ae21189b-8797-1f06-95ff-b20fb8e26e69",
								false,
							},
							
							{
								"1ceb8816-2ec9-abf4-9e91-eafe739ef659",
								true,
							},
							
							{
								"21f5a719-634c-c348-b3f6-fe1f01b33d86",
								true,
							},
							
							{
								"033dd334-e53a-50c9-8961-510fd3983c06",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction3",
						luaNeedsWeaveWindow = true,
						luaReturnsAction = true,
						name = "Counterstance",
						uuid = "71f18f33-b51d-5c63-9bfb-fd57b9b189ad",
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
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "d6d91e2f-272b-5401-ad3f-f0a5c81c766e",
						version = 3,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						buffID = 4360,
						category = "Self",
						dequeueIfLuaFalse = true,
						filterTargetType = "ContentID",
						name = "Is P. Monk",
						uuid = "53db5447-8ce7-e699-b734-b9c0a383b622",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						inCombatType = 2,
						name = "Not In Combat",
						uuid = "bcc88eba-f173-1e61-83c1-24f032463bc0",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 3,
						buffDuration = 3,
						buffID = 4238,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Has Counterstance",
						uuid = "ae21189b-8797-1f06-95ff-b20fb8e26e69",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "1ceb8816-2ec9-abf4-9e91-eafe739ef659",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "21f5a719-634c-c348-b3f6-fe1f01b33d86",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Counterstance\")",
						name = "Toggle",
						uuid = "033dd334-e53a-50c9-8961-510fd3983c06",
						version = 3,
					},
				},
			},
			name = "P. Monk Counterstance",
			throttleTime = 1000,
			uuid = "dc88144f-02eb-1ddc-af3f-db7d95ca782b",
			version = 2,
		},
		inheritedIndex = 12,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 41596,
						actionLua = "return ActionList:Get(5,32),Player.id,false,false",
						conditions = 
						{
							
							{
								"5236742b-6d45-ba4b-9afc-fb4fc5a75597",
								true,
							},
							
							{
								"428912a9-77fd-3cdc-967f-f611e385b71d",
								true,
							},
							
							{
								"3ecb5974-9132-edef-bc9c-2bbb38650199",
								true,
							},
							
							{
								"e25da5a1-e09f-13f7-a76c-4d9eb83a6848",
								true,
							},
							
							{
								"1c7f9078-12e7-990c-91ac-770991984265",
								true,
							},
							
							{
								"f7205721-6955-3735-ba96-99ffa9c751fd",
								true,
							},
							
							{
								"cce22c16-8d03-e200-8087-a3a71db5ef68",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction2",
						luaNeedsWeaveWindow = true,
						luaReturnsAction = true,
						name = "Occult Counter",
						targetType = "Current Target",
						uuid = "46adab9a-0c98-5ad3-84c9-8f07366fc978",
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
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "5236742b-6d45-ba4b-9afc-fb4fc5a75597",
						version = 3,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						buffID = 4360,
						category = "Self",
						dequeueIfLuaFalse = true,
						filterTargetType = "ContentID",
						name = "Is P. Monk",
						uuid = "428912a9-77fd-3cdc-967f-f611e385b71d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						name = "In Combat",
						uuid = "3ecb5974-9132-edef-bc9c-2bbb38650199",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41596,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Occult Counter CD <= 3s",
						uuid = "e25da5a1-e09f-13f7-a76c-4d9eb83a6848",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "1c7f9078-12e7-990c-91ac-770991984265",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "f7205721-6955-3735-ba96-99ffa9c751fd",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Counter\")",
						name = "Toggle",
						uuid = "cce22c16-8d03-e200-8087-a3a71db5ef68",
						version = 3,
					},
				},
			},
			name = "P. Monk Counter",
			throttleTime = 1000,
			uuid = "41d0f0ef-c4ea-6f7d-b4d5-b336f4d41284",
			version = 2,
		},
		inheritedIndex = 13,
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
						actionLua = "local token = data.northHornBeastTopazWaveToken or 0\nlocal controller = TensorCore.mGetEntity(eventArgs.entityID)\nif not controller or not controller.pos then return end\n\nlocal index = eventArgs.a2\nlocal vertical = math.abs(math.sin(controller.pos.h or 0)) > 0.5\nlocal tilingIndex\nif vertical then\n    tilingIndex = index == 5 and 1 or index == 9 and 3 or nil\nelse\n    tilingIndex = index == 5 and 4 or index == 9 and 5 or nil\nend\nif not tilingIndex then return end\n\nlocal tilings = data.northHornBeastLRoomTilings\nif not tilings then\n    tilings = {\n        {{0,4,8,1},{12,5,9,13},{2,6,10,3},{14,7,11,15}},\n        {{0,4,8,9},{12,13,10,14},{1,5,2,3},{6,7,11,15}},\n        {{0,4,1,2},{8,12,9,10},{5,6,3,7},{13,14,11,15}},\n        {{0,4,5,6},{8,12,13,14},{1,2,3,7},{9,10,11,15}},\n        {{0,1,5,9},{4,8,12,13},{2,3,7,11},{6,10,14,15}},\n        {{0,1,2,6},{4,8,12,5},{9,13,14,15},{10,3,7,11}},\n    }\n    data.northHornBeastLRoomTilings = tilings\nend\n\nlocal tiling = tilings[tilingIndex]\ndata.northHornBeastSelectedTiling = {\n    token = token,\n    index = tilingIndex,\n    rooms = tiling,\n}\n\nlocal stones = TensorCore.entityList(\"contentid=14792,maxdistance=80\")\nif not table.valid(stones) then return end\n\nlocal function roomContains(room, x, z)\n    for _, cell in ipairs(room) do\n        local centerX = 223 + ((cell % 4) * 10)\n        local centerZ = 337 + (math.floor(cell / 4) * 10)\n        if math.abs(x - centerX) <= 5.001 and math.abs(z - centerZ) <= 5.001 then\n            return true\n        end\n    end\n    return false\nend\n\nlocal unsafeRooms = {}\nlocal floorY = controller.pos.y or 15\nlocal stoneCount = 0\nfor _, stone in pairs(stones) do\n    if stone.pos and Argus.isEntityVisible(stone) then\n        stoneCount = stoneCount + 1\n        floorY = stone.pos.y or floorY\n        local behind = TensorCore.getPosInDirection(\n            stone.pos,\n            (stone.pos.h or 0) + math.pi,\n            3\n        )\n        if behind then\n            for roomIndex, room in ipairs(tiling) do\n                if roomContains(room, stone.pos.x, stone.pos.z)\n                    and not roomContains(room, behind.x, behind.z)\n                then\n                    unsafeRooms[roomIndex] = true\n                end\n            end\n        end\n    end\nend\nif stoneCount == 0 or next(unsafeRooms) == nil then return end\n\nlocal cells = {}\nfor roomIndex in pairs(unsafeRooms) do\n    for _, cell in ipairs(tiling[roomIndex]) do\n        cells[cell] = true\n    end\nend\n\nfor _, uuid in ipairs(data.northHornBeastEarlyFixedDraws or {}) do\n    if uuid then Argus.deleteTimedShape(uuid) end\nend\nlocal oldState = data.northHornBeastTopazRoomWave\nif oldState and oldState.provisional then\n    for _, uuid in ipairs(oldState.provisional) do\n        if uuid then Argus.deleteTimedShape(uuid) end\n    end\nend\n\nlocal dangerDrawer = TensorCore.getStaticFlatDrawer(2818572543)\nlocal roomDraws = {}\nfor cell in pairs(cells) do\n    local x = 223 + ((cell % 4) * 10)\n    local z = 337 + (math.floor(cell / 4) * 10)\n    local uuid = dangerDrawer:addTimedCenteredRect(\n        30000,\n        x,\n        floorY + 0.02,\n        z,\n        10,\n        10,\n        0\n    )\n    if uuid then roomDraws[#roomDraws + 1] = uuid end\nend\n\ndata.northHornBeastEarlyFixedDraws = roomDraws\ndata.northHornBeastEarlyFixedWaveToken = token\ndata.northHornBeastCommittedCells = { token = token, cells = cells }\ndata.northHornBeastTopazRoomWave = nil\nd(\"A Beast Unleashed exact L rooms: tiling \" .. tostring(tilingIndex))\nself.used = true",
						conditions = 
						{
							
							{
								"32000116-0000-4000-8000-000000000001",
								true,
							},
							
							{
								"32000116-0000-4000-8000-000000000002",
								true,
							},
							
							{
								"32000116-0000-4000-8000-000000000003",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Pre-draw exact dangerous Topaz rooms",
						uuid = "32000116-0000-4000-8000-000000000101",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local token = data.northHornBeastTopazWaveToken or 0\nlocal controller = TensorCore.mGetEntity(eventArgs.entityID)\nif not controller or not controller.pos then return end\n\nlocal rooms = {\n    {0,1,4,5},\n    {2,3,6,7},\n    {8,9,12,13},\n    {10,11,14,15},\n}\ndata.northHornBeastSelectedTiling = {\n    token = token,\n    index = 0,\n    rooms = rooms,\n}\n\nlocal stones = TensorCore.entityList(\"contentid=14792,maxdistance=80\")\nif not table.valid(stones) then return end\n\nlocal function roomContains(room, x, z)\n    for _, cell in ipairs(room) do\n        local centerX = 223 + ((cell % 4) * 10)\n        local centerZ = 337 + (math.floor(cell / 4) * 10)\n        if math.abs(x - centerX) <= 5.001 and math.abs(z - centerZ) <= 5.001 then\n            return true\n        end\n    end\n    return false\nend\n\nlocal unsafeRooms = {}\nlocal floorY = controller.pos.y or 15\nlocal stoneCount = 0\nfor _, stone in pairs(stones) do\n    if stone.pos and Argus.isEntityVisible(stone) then\n        stoneCount = stoneCount + 1\n        floorY = stone.pos.y or floorY\n        local behind = TensorCore.getPosInDirection(\n            stone.pos,\n            (stone.pos.h or 0) + math.pi,\n            3\n        )\n        if behind then\n            for roomIndex, room in ipairs(rooms) do\n                if roomContains(room, stone.pos.x, stone.pos.z)\n                    and not roomContains(room, behind.x, behind.z)\n                then\n                    unsafeRooms[roomIndex] = true\n                end\n            end\n        end\n    end\nend\nif stoneCount == 0 or next(unsafeRooms) == nil then return end\n\nlocal cells = {}\nfor roomIndex in pairs(unsafeRooms) do\n    for _, cell in ipairs(rooms[roomIndex]) do\n        cells[cell] = true\n    end\nend\n\nfor _, uuid in ipairs(data.northHornBeastEarlyFixedDraws or {}) do\n    if uuid then Argus.deleteTimedShape(uuid) end\nend\nlocal oldState = data.northHornBeastTopazRoomWave\nif oldState and oldState.provisional then\n    for _, uuid in ipairs(oldState.provisional) do\n        if uuid then Argus.deleteTimedShape(uuid) end\n    end\nend\n\nlocal dangerDrawer = TensorCore.getStaticFlatDrawer(2818572543)\nlocal roomDraws = {}\nfor cell in pairs(cells) do\n    local x = 223 + ((cell % 4) * 10)\n    local z = 337 + (math.floor(cell / 4) * 10)\n    local uuid = dangerDrawer:addTimedCenteredRect(\n        20000,\n        x,\n        floorY + 0.02,\n        z,\n        10,\n        10,\n        0\n    )\n    if uuid then roomDraws[#roomDraws + 1] = uuid end\nend\n\ndata.northHornBeastEarlyFixedDraws = roomDraws\ndata.northHornBeastEarlyFixedWaveToken = token\ndata.northHornBeastCommittedCells = { token = token, cells = cells }\ndata.northHornBeastTopazRoomWave = nil\nd(\"A Beast Unleashed exact opening rooms\")\nself.used = true",
						conditions = 
						{
							
							{
								"32000116-0000-4000-8000-000000000001",
								true,
							},
							
							{
								"32000116-0000-4000-8000-000000000004",
								true,
							},
							
							{
								"32000116-0000-4000-8000-000000000005",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Pre-draw exact opening Topaz rooms",
						uuid = "32000116-0000-4000-8000-000000000102",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "Zone",
						uuid = "32000116-0000-4000-8000-000000000001",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 2015302,
						name = "Room controller",
						uuid = "32000116-0000-4000-8000-000000000002",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "-- a2 5 and 9 are the two active reflected-room states; 13 is a reset.\nlocal index = eventArgs.a2\nreturn eventArgs.a3 == 0 and (index == 5 or index == 9)\n",
						dequeueIfLuaFalse = true,
						name = "Active Beast layout signal",
						uuid = "32000116-0000-4000-8000-000000000003",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 2015301,
						name = "Opening room controller",
						uuid = "32000116-0000-4000-8000-000000000004",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "-- lint: allow lua-native-condition, a2 is the controller layout index.\nreturn eventArgs.a2 == 1 and eventArgs.a3 == 0\n",
						dequeueIfLuaFalse = true,
						name = "Active opening layout signal",
						uuid = "32000116-0000-4000-8000-000000000005",
						version = 3,
					},
				},
			},
			eventType = 20,
			name = "[A Beast Unleashed] Room Pre-draw",
			timeout = 15,
			uuid = "32000116-0000-4000-8000-000000000999",
			version = 2,
		},
		inheritedIndex = 14,
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
						actionLua = "if _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] == true then\n\t_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nend\nself.used = true",
						conditions = 
						{
							
							{
								"80fa16e8-d4b7-cb1c-8e8c-59e26259ec36",
								true,
							},
							
							{
								"cf907d2d-9e97-8cd1-bc08-5de61635852f",
								true,
							},
							
							{
								"1e39a820-0470-b3d6-b953-37ee8ae56c84",
								true,
							},
							
							{
								"3eac1167-173e-1707-bb6c-86e58d4e12ef",
								true,
							},
							
							{
								"ae8c83cd-5f51-2d12-bade-38a7c6193da7",
								true,
							},
							
							{
								"d18561bf-83e5-7df3-805a-ed04694b775d",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Stop Phantom Kick Toggle",
						uuid = "ae921d8a-ff02-76e3-a1a4-663485d80bf7",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "if _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] == true then\n\t_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nend\nself.used = true",
						conditions = 
						{
							
							{
								"80fa16e8-d4b7-cb1c-8e8c-59e26259ec36",
								true,
							},
							
							{
								"cf907d2d-9e97-8cd1-bc08-5de61635852f",
								true,
							},
							
							{
								"1e39a820-0470-b3d6-b953-37ee8ae56c84",
								true,
							},
							
							{
								"3eac1167-173e-1707-bb6c-86e58d4e12ef",
								true,
							},
							
							{
								"ae8c83cd-5f51-2d12-bade-38a7c6193da7",
								true,
							},
							
							{
								"03652a17-e335-3466-965d-ce830120cebe",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Stop Phantom Kick AOE",
						uuid = "76136017-d5ae-7c80-92f3-73a3e1af1961",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"80fa16e8-d4b7-cb1c-8e8c-59e26259ec36",
								true,
							},
							
							{
								"cf907d2d-9e97-8cd1-bc08-5de61635852f",
								true,
							},
							
							{
								"1e39a820-0470-b3d6-b953-37ee8ae56c84",
								true,
							},
							
							{
								"3eac1167-173e-1707-bb6c-86e58d4e12ef",
								true,
							},
							
							{
								"ae8c83cd-5f51-2d12-bade-38a7c6193da7",
								true,
							},
							
							{
								"fe717d00-c7a5-f61e-be0a-4038932c2f67",
								true,
							},
							
							{
								"297bd7a0-a008-d8d5-be0f-1f90b900a388",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Phantom Kick Forced",
						uuid = "59161e23-4f81-7fe7-a42e-aeca951045b6",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"80fa16e8-d4b7-cb1c-8e8c-59e26259ec36",
								true,
							},
							
							{
								"cf907d2d-9e97-8cd1-bc08-5de61635852f",
								true,
							},
							
							{
								"1e39a820-0470-b3d6-b953-37ee8ae56c84",
								true,
							},
							
							{
								"3eac1167-173e-1707-bb6c-86e58d4e12ef",
								true,
							},
							
							{
								"ae8c83cd-5f51-2d12-bade-38a7c6193da7",
								true,
							},
							
							{
								"fe717d00-c7a5-f61e-be0a-4038932c2f67",
								true,
							},
							
							{
								"da977cd9-925d-daf0-ba9f-ebaa1f25c7d4",
								false,
							},
							
							{
								"03652a17-e335-3466-965d-ce830120cebe",
								true,
							},
							
							{
								"d18561bf-83e5-7df3-805a-ed04694b775d",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Phantom Kick",
						uuid = "bfa0f030-fde3-d881-b3bb-eb4ae1aa86c9",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "if _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] == true then\n\t_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nend\nself.used = true",
						conditions = 
						{
							
							{
								"80fa16e8-d4b7-cb1c-8e8c-59e26259ec36",
								true,
							},
							
							{
								"cf907d2d-9e97-8cd1-bc08-5de61635852f",
								true,
							},
							
							{
								"1e39a820-0470-b3d6-b953-37ee8ae56c84",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Fallback Deactivate",
						uuid = "5df620a7-38a7-4c47-bd0e-07096f4c942a",
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
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "80fa16e8-d4b7-cb1c-8e8c-59e26259ec36",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4360,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Monk",
						uuid = "cf907d2d-9e97-8cd1-bc08-5de61635852f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "1e39a820-0470-b3d6-b953-37ee8ae56c84",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "3eac1167-173e-1707-bb6c-86e58d4e12ef",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41595,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Kick CD <= 3s",
						uuid = "ae8c83cd-5f51-2d12-bade-38a7c6193da7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 15,
						name = "Target <= 15y",
						uuid = "fe717d00-c7a5-f61e-be0a-4038932c2f67",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.pMonkForceKickEnabled",
						dequeueIfLuaFalse = true,
						name = "Force Kick Enabled",
						uuid = "297bd7a0-a008-d8d5-be0f-1f90b900a388",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.pMonkNoKickEnabled",
						dequeueIfLuaFalse = true,
						name = "No Kick Enabled",
						uuid = "da977cd9-925d-daf0-ba9f-ebaa1f25c7d4",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local jumpDist = 15\nlocal playerPos = TensorCore.mGetPlayer().pos\nlocal target = TensorCore.mGetTarget()\n\nif target then\n\tlocal targetPos = target.pos\n\tlocal targetHeading = TensorCore.getHeadingToTarget(playerPos, targetPos)\n\tlocal jumpPos = TensorCore.getPosInDirection(playerPos, targetHeading, jumpDist)\n\n\treturn not TensorCore.Avoidance.inAnyAOE(jumpPos.x, jumpPos.y, jumpPos.z)\nend\n\nreturn false",
						dequeueIfLuaFalse = true,
						name = "AOE Check",
						uuid = "03652a17-e335-3466-965d-ce830120cebe",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Kick\")",
						name = "Toggle",
						uuid = "d18561bf-83e5-7df3-805a-ed04694b775d",
						version = 3,
					},
				},
			},
			name = "P. Monk Kick",
			throttleTime = 100,
			uuid = "c27a84af-fc0f-e48c-8c66-112f503d61b2",
			version = 2,
		},
		inheritedIndex = 15,
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
						actionLua = "local jumpDist = 15\nlocal player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\n\nif not target or target.id == player.id then return end\n\nlocal playerPos = player.pos\nlocal targetPos = target.pos\nlocal targetHeading = TensorCore.getHeadingToTarget(playerPos, targetPos)\nlocal jumpPos = TensorCore.getPosInDirection(playerPos, targetHeading, jumpDist)\n\nlocal inAOE = TensorCore.Avoidance.inAnyAOE(jumpPos.x, jumpPos.y, jumpPos.z)\nlocal indicatorColor = (inAOE and 1677721855) or 1677786914\n\nlocal drawer = TensorCore.getStaticDrawer(indicatorColor)\ndrawer.colorOutline = 0xFFFFFFFF\ndrawer:addCircle(jumpPos.x, jumpPos.y, jumpPos.z, 0.5, true)\ndrawer.colorOutline = nil",
						conditions = 
						{
							
							{
								"8cda3bac-be8c-b63c-8e06-ca48d73102b1",
								true,
							},
							
							{
								"f8f04c24-0e45-7c68-b56f-c69a4ad2f7de",
								true,
							},
							
							{
								"51b0116c-70ba-b338-bac7-0082efd72ccc",
								true,
							},
							
							{
								"ce2478f3-6f7a-4f4d-9944-6b484c1303ab",
								true,
							},
							
							{
								"e4fdc1a9-6695-72f4-a590-abd0c067c80c",
								true,
							},
							
							{
								"3df80ec7-5864-f5e1-bb33-e7a93a2c5519",
								true,
							},
							
							{
								"f543f117-46df-ba1c-a5c0-7dd9e1cee8f1",
								true,
							},
						},
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Jump Indicator",
						uuid = "bfa0f030-fde3-d881-b3bb-eb4ae1aa86c9",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local jumpDist = 15\nlocal player = TensorCore.mGetPlayer()\nlocal target = TensorCore.mGetTarget()\n\nif not target or target.id == player.id then return end\n\nlocal playerPos = player.pos\nlocal targetPos = target.pos\nlocal targetHeading = TensorCore.getHeadingToTarget(playerPos, targetPos)\nlocal jumpPos = TensorCore.getPosInDirection(playerPos, targetHeading, jumpDist)\n\nlocal inAOE = TensorCore.Avoidance.inAnyAOE(jumpPos.x, jumpPos.y, jumpPos.z)\nlocal indicatorColor = 1677787134\n\nlocal drawer = TensorCore.getStaticDrawer(indicatorColor)\ndrawer.colorOutline = 0xFFFFFFFF\ndrawer:addCircle(jumpPos.x, jumpPos.y, jumpPos.z, 0.5, true)\ndrawer.colorOutline = nil",
						conditions = 
						{
							
							{
								"8cda3bac-be8c-b63c-8e06-ca48d73102b1",
								true,
							},
							
							{
								"f8f04c24-0e45-7c68-b56f-c69a4ad2f7de",
								true,
							},
							
							{
								"51b0116c-70ba-b338-bac7-0082efd72ccc",
								true,
							},
							
							{
								"ce2478f3-6f7a-4f4d-9944-6b484c1303ab",
								true,
							},
							
							{
								"e4fdc1a9-6695-72f4-a590-abd0c067c80c",
								true,
							},
							
							{
								"3df80ec7-5864-f5e1-bb33-e7a93a2c5519",
								false,
							},
							
							{
								"f543f117-46df-ba1c-a5c0-7dd9e1cee8f1",
								true,
							},
						},
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Jump Indicator OOR",
						uuid = "37651124-5042-908b-8bf4-b0824f1e01b5",
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
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "8cda3bac-be8c-b63c-8e06-ca48d73102b1",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4360,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Monk",
						uuid = "f8f04c24-0e45-7c68-b56f-c69a4ad2f7de",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						name = "Am Alive",
						uuid = "51b0116c-70ba-b338-bac7-0082efd72ccc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "ce2478f3-6f7a-4f4d-9944-6b484c1303ab",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "e4fdc1a9-6695-72f4-a590-abd0c067c80c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 15,
						name = "Target <= 15y",
						uuid = "3df80ec7-5864-f5e1-bb33-e7a93a2c5519",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 10,
						actionID = 41595,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Kick CD <= 10s",
						uuid = "f543f117-46df-ba1c-a5c0-7dd9e1cee8f1",
						version = 3,
					},
				},
			},
			eventType = 12,
			name = "P. Monk Jump Indicator",
			uuid = "d02f1d00-64c8-7239-8291-fef76f74db52",
			version = 2,
		},
		inheritedIndex = 16,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 41598,
						actionLua = "return ActionList:Get(5,32),Player.id,false,false",
						conditions = 
						{
							
							{
								"5236742b-6d45-ba4b-9afc-fb4fc5a75597",
								true,
							},
							
							{
								"428912a9-77fd-3cdc-967f-f611e385b71d",
								true,
							},
							
							{
								"3ecb5974-9132-edef-bc9c-2bbb38650199",
								true,
							},
							
							{
								"e25da5a1-e09f-13f7-a76c-4d9eb83a6848",
								true,
							},
							
							{
								"33a629ca-2bb9-8afb-8998-af2275f38bbe",
								true,
							},
							
							{
								"1c7f9078-12e7-990c-91ac-770991984265",
								true,
							},
							
							{
								"f7205721-6955-3735-ba96-99ffa9c751fd",
								true,
							},
							
							{
								"4f65d63a-05cf-afe8-ad5d-c92f34e5e8b6",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction2",
						luaNeedsWeaveWindow = true,
						luaReturnsAction = true,
						name = "Occult Chakra",
						uuid = "46adab9a-0c98-5ad3-84c9-8f07366fc978",
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
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "5236742b-6d45-ba4b-9afc-fb4fc5a75597",
						version = 3,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						buffID = 4360,
						category = "Self",
						dequeueIfLuaFalse = true,
						filterTargetType = "ContentID",
						name = "Is P. Monk",
						uuid = "428912a9-77fd-3cdc-967f-f611e385b71d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						name = "In Combat",
						uuid = "3ecb5974-9132-edef-bc9c-2bbb38650199",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41598,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Occult Chakra CD <= 3s",
						uuid = "e25da5a1-e09f-13f7-a76c-4d9eb83a6848",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						comparator = 2,
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 29.89999961853,
						name = "HP < 30%",
						uuid = "33a629ca-2bb9-8afb-8998-af2275f38bbe",
						version = 3,
					},
					inheritedIndex = 5,
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "1c7f9078-12e7-990c-91ac-770991984265",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "f7205721-6955-3735-ba96-99ffa9c751fd",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Chakra\")",
						name = "Toggle",
						uuid = "4f65d63a-05cf-afe8-ad5d-c92f34e5e8b6",
						version = 3,
					},
				},
			},
			name = "P. Monk Occult Chakra",
			throttleTime = 1000,
			uuid = "002ce728-0d37-9d87-9218-caf9da0b1a65",
			version = 2,
		},
		inheritedIndex = 17,
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
						actionLua = "local deadPlayers = TensorCore.entityList(\"chartype=4,los,dead,maxdistance=30\")\nlocal raisablePlayers = {}\nlocal raisableChemists = {}\nif (table.valid(deadPlayers)) then\n\tfor id, player in pairs(deadPlayers) do\n\t\tlocal buffs = player.buffs\n\t\tlocal raised = false\n        local outOfRaises = false\n\t\tlocal chemist = false \n\n\t\tif (TableSize(buffs) > 0) then\n\t\t\tfor id, b in pairs(buffs) do\n\t\t\t\tif (b.id == 148) then\n\t\t\t\t\traised = true\n\t\t\t\tend\n                if (b.id == 4263) then\n                    outOfRaises = true\n                end\n\t\t\t\tif (b.id == 4367) then\n\t\t\t\t\tchemist = true\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\t\t\n\t\tif(raised == false and outOfRaises == false) then\n\t\t\tif (chemist == true) then\n\t\t\t\ttable.insert(raisableChemists, player)\n\t\t\telse\n\t\t\t\ttable.insert(raisablePlayers, player)\n\t\t\tend\n\t\tend\n\tend\nend\nif (table.valid(raisableChemists)) then\n\tfor id, player in pairs(raisableChemists) do\n\t\tif (data.lastRaiseNotification == nil or TimeSince(data.lastRaiseNotification) > 5000) then\n\t\t\tdata.lastRaiseNotification = Now()\n\t\t\tSendTextCommand(\"/e Raising \" .. player.name .. \" (Chemist)\")\n\t\tend\n\t\treturn ActionList:Get(1,41634), player.id, true, true\n\tend\nend\nif (table.valid(raisablePlayers)) then\n\tfor id, player in pairs(raisablePlayers) do\n\t\tif (data.lastRaiseNotification == nil or TimeSince(data.lastRaiseNotification) > 5000) then\n\t\t\tdata.lastRaiseNotification = Now()\n\t\t\tSendTextCommand(\"/e Raising \" .. player.name .. \"\")\n\t\tend\n\t\treturn ActionList:Get(1,41634), player.id, true, false\n\tend\nend\nself.used = true",
						conditions = 
						{
							
							{
								"b03aac2a-016b-2f26-a5c1-2548777d6f97",
								true,
							},
							
							{
								"07ce03aa-d311-aeb9-b4fd-db197c2e53b8",
								true,
							},
							
							{
								"1dbbf1df-c207-113b-8789-5b1dc0f4c77e",
								true,
							},
							
							{
								"214333af-724c-d8c7-bc32-505803dec7ff",
								true,
							},
							
							{
								"53a42934-6ab6-14a3-96e9-c921a5497ccc",
								true,
							},
							
							{
								"203788d4-5555-4dc5-9150-53a4e73f8ca9",
								true,
							},
							
							{
								"bfddab2c-d0ed-0214-8f2c-19399c9e83ff",
								true,
							},
							
							{
								"f4134215-666b-a827-a19b-25d2f60e72a2",
								true,
							},
							
							{
								"9f0a3c38-9a4e-d767-b930-2a10131c4ce2",
								true,
							},
							
							{
								"5b9ed4c1-4133-fce0-9f9a-9db445c50390",
								true,
							},
							
							{
								"88666735-cd00-8475-a526-0e8d0b29d8ea",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_CD",
						luaReturnsAction = true,
						uuid = "fd116bd7-85d4-2c0e-b230-7cfb407015d7",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "In Occult Crescent",
						uuid = "07ce03aa-d311-aeb9-b4fd-db197c2e53b8",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4367,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is Chemist",
						uuid = "1dbbf1df-c207-113b-8789-5b1dc0f4c77e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "214333af-724c-d8c7-bc32-505803dec7ff",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "53a42934-6ab6-14a3-96e9-c921a5497ccc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						name = "Self Living",
						uuid = "203788d4-5555-4dc5-9150-53a4e73f8ca9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Self Missing Transcendent",
						uuid = "bfddab2c-d0ed-0214-8f2c-19399c9e83ff",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 41634,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Revive CD",
						uuid = "9f0a3c38-9a4e-d767-b930-2a10131c4ce2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return (ActionList:Get(5,33):CanCastResult() ~= 579)",
						dequeueIfLuaFalse = true,
						name = "Revive Unlocked",
						uuid = "f4134215-666b-a827-a19b-25d2f60e72a2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TableSize(TensorCore.entityList(\"chartype=4,los,dead,maxdistance=30\")) ~= 0",
						dequeueIfLuaFalse = true,
						filterTargetType = "Party",
						name = "Dead Player",
						uuid = "5b9ed4c1-4133-fce0-9f9a-9db445c50390",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return true",
						dequeueIfLuaFalse = true,
						name = "Flip To Disable Action",
						uuid = "b03aac2a-016b-2f26-a5c1-2548777d6f97",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Chem Raise\")",
						name = "Toggle",
						uuid = "88666735-cd00-8475-a526-0e8d0b29d8ea",
						version = 3,
					},
				},
			},
			name = "P. Chemist Rez",
			throttleTime = 1000,
			uuid = "81a55341-b483-4aea-a0bc-9664bb0d30a7",
			version = 2,
		},
		inheritedIndex = 18,
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
						actionLua = "if eventArgs.newTetherID == 306 then \n\tTensorCore.getMoogleDrawer():addTimedCircleOnEnt(6000,eventArgs.sourceEntityID,16) \nend\n\n\nself.used = true",
						conditions = 
						{
							
							{
								"710d381b-ee90-f727-8e57-5926dbc9e986",
								true,
							},
							
							{
								"b6691996-e299-9531-91cd-2d466669ab9b",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						uuid = "91386d48-3d93-419d-8463-2aab6cfb7cbc",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "if eventArgs.newTetherID == 303 then \n\tTensorCore.getMoogleDrawer():addTimedCircleOnEnt(5000,eventArgs.newTargetID,16) \nend\n\nif eventArgs.newTetherID == 304 then \n\tTensorCore.getMoogleDrawer():addTimedCrossOnEnt(5000,eventArgs.newTargetID,40,10) \nend\n--TensorCore.getMoogleDrawer()\nself.used = true",
						conditions = 
						{
							
							{
								"710d381b-ee90-f727-8e57-5926dbc9e986",
								true,
							},
							
							{
								"288e0df2-3cf0-27dc-a47c-64b16757ff8e",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						uuid = "6d55eaa6-366c-5347-9562-23b1ce614437",
						version = 2.1,
					},
					inheritedIndex = 2,
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.newTetherID == 303 or eventArgs.newTetherID == 304 or eventArgs.newTetherID == 306",
						dequeueIfLuaFalse = true,
						name = "tetherID",
						uuid = "710d381b-ee90-f727-8e57-5926dbc9e986",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.newTargetContentID == 13815",
						dequeueIfLuaFalse = true,
						name = "Target contentID",
						uuid = "288e0df2-3cf0-27dc-a47c-64b16757ff8e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.sourceEntityContentID == 13815",
						dequeueIfLuaFalse = true,
						name = "Source contentID",
						uuid = "b6691996-e299-9531-91cd-2d466669ab9b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						uuid = "c50e5927-3e81-3a21-95f3-843678ef1597",
						version = 3,
					},
				},
			},
			eventType = 15,
			name = "[Command Urn] Tether Cross/Circle",
			uuid = "e4428edd-5262-418a-8101-318e67b84532",
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
						actionLua = "if data.dedoSpiralCircle == nil or TimeSince(data.dedoSpiralCircle) > 20000 then\ndata.dedoSpiralCircle = Now()\ndata.dedoSpiralCircleCount = 0\nend\n\nlocal bossID\nif data.dedoSpiralCircleCount == 1 then\nfor id,ent in pairs(TensorCore.entityList(\"contentid=13726,nearest,attackable\")) do\nbossID = id\nend\nlocal epos = TensorCore.mGetEntity(bossID).pos\nlocal newPos = TensorCore.getPosInDirection(epos,epos.h+math.pi+math.rad(25),10)\n\nTensorCore.getStaticDrawer(1845559113):addTimedCircle(9200,newPos.x,newPos.y,newPos.z,1.5)\nTensorCore.getStaticDrawer(1845494015):addTimedCircle(9200,eventArgs.x,eventArgs.y,eventArgs.z,eventArgs.aoeLength)\nTensorCore.getStaticDrawer(1845559113):addTimedCircle(9200,eventArgs.x,eventArgs.y,eventArgs.z,eventArgs.aoeLength/2,9200)\nelse\nTensorCore.getMoogleDrawer():addTimedCircle(5200,eventArgs.x,eventArgs.y,eventArgs.z,eventArgs.aoeLength,4000)\n\nend \n\ndata.dedoSpiralCircleCount = data.dedoSpiralCircleCount + 1\nself.used = true",
						conditions = 
						{
							
							{
								"12da2296-f5d5-dfb8-bd33-ea1afc255f47",
								true,
							},
						},
						gVar = "ACR_RikuGNB3_CD",
						uuid = "34ae0b30-3455-51a2-8d72-d313fa4a7c3f",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 41135 and eventArgs.contentID == 13726",
						dequeueIfLuaFalse = true,
						uuid = "12da2296-f5d5-dfb8-bd33-ea1afc255f47",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[MythidIdol] SpinOrbs",
			uuid = "360053ac-5a2f-66d4-87fe-ec402fc2f285",
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
						actionLua = "MoogleTelegraphs.Settings.aoeIDUserBlacklist[eventArgs.aoeID] = {label = \"Lethal Nails\", source = \"CE: Deathclaw\"}\nlocal delay = eventArgs.delay-2.5\nTensorCore.getMoogleDrawer():addTimedRectOnEnt((eventArgs.duration-delay)*1000,eventArgs.entityID,50,eventArgs.aoeWidth,nil,delay*1000)\ndata.firstClawModel = nil\nself.used = true",
						conditions = 
						{
							
							{
								"77a3f58d-a783-7f7b-9181-a985b5f28107",
								true,
							},
							
							{
								"ebed26f6-d5ad-9622-9e62-354e7fe6cb2b",
								true,
							},
							
							{
								"433c299f-65b9-c062-9c25-547f4bab7dbf",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						uuid = "4bb9c9cd-fce1-0703-9754-8fca5d8f166c",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeName == \"Lethal Nails\"",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 3,
						eventArgType = 2,
						spellIDList = 
						{
							41315,
							41316,
							41317,
							41318,
							41319,
						},
						uuid = "ebed26f6-d5ad-9622-9e62-354e7fe6cb2b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						uuid = "77a3f58d-a783-7f7b-9181-a985b5f28107",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local player = TensorCore.mGetPlayer()\nreturn TensorCore.getDistance2d(player.pos, { h = 0, x = 680, y = 74, z = 534 }) < 40",
						dequeueIfLuaFalse = true,
						name = "In Deathclaw Arena",
						uuid = "433c299f-65b9-c062-9c25-547f4bab7dbf",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[DeathClaw] Clawmarks AoE",
			uuid = "c2e2e902-e333-f7c0-b47a-afc01c26fd3b",
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
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"e7de50ca-b2f8-752a-b528-db724f2d7054",
								true,
							},
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"a4bae7f0-15e7-e380-89ed-28e6f8f500ff",
								true,
							},
							
							{
								"68842e46-8c8e-f38e-80f1-1c565d84de04",
								true,
							},
							
							{
								"36e0cdc9-6f67-832d-af9d-962934e8d8cc",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								true,
							},
							
							{
								"b89deb6f-ac1d-7569-98b2-ce63b9dc89ac",
								true,
							},
							
							{
								"8b24e3a8-4d01-e274-9392-a43ce99fca3a",
								true,
							},
							
							{
								"1e471142-f907-e1dd-abd5-6325e970db36",
								true,
							},
							
							{
								"b3f3779f-97e1-26c8-aab2-1d54bd11306a",
								true,
							},
							
							{
								"0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
								true,
							},
							
							{
								"c19ff60f-3e3d-09dc-9583-cb2c364d0741",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Hero's Rime",
						uuid = "b8fb2967-ec8b-3e1a-90c2-d4cc7d3703c8",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"e7de50ca-b2f8-752a-b528-db724f2d7054",
								true,
							},
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								false,
							},
							
							{
								"bee58c45-7380-26ed-a78a-2011ff91536c",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Fallback Deactivate",
						uuid = "e79f408d-0936-1e91-b864-3e6fad59b0d5",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "e7de50ca-b2f8-752a-b528-db724f2d7054",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4363,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Bard",
						uuid = "2312ae26-c802-ad39-bbbf-0830ed918dac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.mGetPlayer().alive",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 0.10000000149012,
						name = "Am Alive",
						uuid = "a4bae7f0-15e7-e380-89ed-28e6f8f500ff",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "68842e46-8c8e-f38e-80f1-1c565d84de04",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "36e0cdc9-6f67-832d-af9d-962934e8d8cc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "e27ae646-5033-f9d0-8f32-0bab1ca37b02",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "b89deb6f-ac1d-7569-98b2-ce63b9dc89ac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil and TimeSince(data.ocCombatTimer) > 4000",
						dequeueIfLuaFalse = true,
						name = "Combat > 4s",
						uuid = "8b24e3a8-4d01-e274-9392-a43ce99fca3a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_CD\"]",
						dequeueIfLuaFalse = true,
						name = "CD Enabled",
						uuid = "1e471142-f907-e1dd-abd5-6325e970db36",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 4249,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Missing Hero's Rime",
						uuid = "b3f3779f-97e1-26c8-aab2-1d54bd11306a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41610,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Hero's Rime CD <= 3s",
						uuid = "0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] == true",
						dequeueIfLuaFalse = true,
						name = "Is Queued",
						uuid = "bee58c45-7380-26ed-a78a-2011ff91536c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Hero's Rime\")",
						name = "Toggle",
						uuid = "c19ff60f-3e3d-09dc-9583-cb2c364d0741",
						version = 3,
					},
				},
			},
			name = "P. Bard Hero's Rime",
			throttleTime = 1500,
			uuid = "89545ebd-870b-9599-8f64-ead285ce22cd",
			version = 2,
		},
		inheritedIndex = 22,
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
						actionLua = "data.firstClawModel = data.firstClawModel or Argus.getEntityModel(eventArgs.entityID)\nif data.firstClawModel ~= nil and Argus.getEntityModel(eventArgs.entityID) == data.firstClawModel then\nTensorCore.getMoogleDrawer():addTimedRectOnEnt(7000,eventArgs.entityID,60,7)\nend\nself.used = true\n\n",
						conditions = 
						{
							
							{
								"fa4c3f2f-af19-5d4e-8fe7-38d0482c47a6",
								true,
							},
							
							{
								"89d0322d-b87a-4c69-b831-9bbd35a00e84",
								true,
							},
							
							{
								"82f9e7f1-321f-5461-b8b3-4cadcadae348",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						uuid = "0192f147-b49f-c2b7-a701-3e4d3645d576",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.entityContentID == 13658 and eventArgs.wasVisible == false",
						dequeueIfLuaFalse = true,
						uuid = "89d0322d-b87a-4c69-b831-9bbd35a00e84",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						uuid = "fa4c3f2f-af19-5d4e-8fe7-38d0482c47a6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local player = TensorCore.mGetPlayer()\nreturn TensorCore.getDistance2d(player.pos, { h = 0, x = 680, y = 74, z = 534 }) < 40",
						dequeueIfLuaFalse = true,
						name = "In Deathclaw Arena",
						uuid = "82f9e7f1-321f-5461-b8b3-4cadcadae348",
						version = 3,
					},
				},
			},
			eventType = 22,
			name = "[DeathClaw] Clawmarks EntityVisibility",
			uuid = "8b5df8bf-33e5-e012-8f07-35e47c3553bd",
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
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"25526db7-3e90-fe08-8df1-b0585e2b38fc",
								true,
							},
							
							{
								"238bd975-3871-5e12-8e53-399adacd89cb",
								true,
							},
							
							{
								"51aea656-8161-48f6-98c9-2780a53bb551",
								true,
							},
							
							{
								"e93e0795-5d96-f49a-97dc-02316f17965a",
								true,
							},
							
							{
								"ae3f970e-106c-6ba7-b96b-bcb05559eb8e",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Stop Iainuki Moving",
						uuid = "e93f4fdf-bf70-eb00-9a60-4679ccfa4745",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"25526db7-3e90-fe08-8df1-b0585e2b38fc",
								true,
							},
							
							{
								"238bd975-3871-5e12-8e53-399adacd89cb",
								true,
							},
							
							{
								"51aea656-8161-48f6-98c9-2780a53bb551",
								true,
							},
							
							{
								"35c868d1-cb26-30cb-a430-945a4811f795",
								true,
							},
							
							{
								"ddedae86-779e-6aa5-9fe4-86b438c454f2",
								false,
							},
							
							{
								"ae3f970e-106c-6ba7-b96b-bcb05559eb8e",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Stop Iainuki Range",
						uuid = "bdd3860a-60f1-c3ea-a490-01898ebe2748",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"25526db7-3e90-fe08-8df1-b0585e2b38fc",
								true,
							},
							
							{
								"238bd975-3871-5e12-8e53-399adacd89cb",
								true,
							},
							
							{
								"51aea656-8161-48f6-98c9-2780a53bb551",
								true,
							},
							
							{
								"e93e0795-5d96-f49a-97dc-02316f17965a",
								false,
							},
							
							{
								"35c868d1-cb26-30cb-a430-945a4811f795",
								true,
							},
							
							{
								"ddedae86-779e-6aa5-9fe4-86b438c454f2",
								true,
							},
							
							{
								"25447249-e9f0-b7d2-b94a-938e145b5eb9",
								true,
							},
							
							{
								"308fe1f4-9f25-e900-a28a-288e162e0fbb",
								true,
							},
							
							{
								"0fea0543-e595-327d-80dd-e9f35b887881",
								true,
							},
							
							{
								"3ddb4886-849a-2357-8122-cf3399f46e5a",
								false,
							},
							
							{
								"c73165f8-847b-61fa-aac4-a8e97be3aa00",
								true,
							},
							
							{
								"3bc6bf88-c464-ed93-a311-22656148e5ba",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Iainuki After Zeni",
						uuid = "2374ece8-ba35-5fdb-82de-5b9e2565a964",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"25526db7-3e90-fe08-8df1-b0585e2b38fc",
								true,
							},
							
							{
								"238bd975-3871-5e12-8e53-399adacd89cb",
								true,
							},
							
							{
								"51aea656-8161-48f6-98c9-2780a53bb551",
								true,
							},
							
							{
								"e93e0795-5d96-f49a-97dc-02316f17965a",
								false,
							},
							
							{
								"35c868d1-cb26-30cb-a430-945a4811f795",
								true,
							},
							
							{
								"ddedae86-779e-6aa5-9fe4-86b438c454f2",
								true,
							},
							
							{
								"25447249-e9f0-b7d2-b94a-938e145b5eb9",
								true,
							},
							
							{
								"8d184850-ef21-2ff2-9291-f8902f0860bc",
								true,
							},
							
							{
								"308fe1f4-9f25-e900-a28a-288e162e0fbb",
								true,
							},
							
							{
								"0fea0543-e595-327d-80dd-e9f35b887881",
								true,
							},
							
							{
								"c73165f8-847b-61fa-aac4-a8e97be3aa00",
								false,
							},
							
							{
								"3bc6bf88-c464-ed93-a311-22656148e5ba",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Iainuki No Coffer CD Enabled",
						uuid = "9a3d47de-5057-da41-8193-f51839ee74c4",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"25526db7-3e90-fe08-8df1-b0585e2b38fc",
								true,
							},
							
							{
								"238bd975-3871-5e12-8e53-399adacd89cb",
								true,
							},
							
							{
								"51aea656-8161-48f6-98c9-2780a53bb551",
								true,
							},
							
							{
								"e93e0795-5d96-f49a-97dc-02316f17965a",
								false,
							},
							
							{
								"35c868d1-cb26-30cb-a430-945a4811f795",
								true,
							},
							
							{
								"ddedae86-779e-6aa5-9fe4-86b438c454f2",
								true,
							},
							
							{
								"25447249-e9f0-b7d2-b94a-938e145b5eb9",
								true,
							},
							
							{
								"8d184850-ef21-2ff2-9291-f8902f0860bc",
								true,
							},
							
							{
								"308fe1f4-9f25-e900-a28a-288e162e0fbb",
								true,
							},
							
							{
								"0fea0543-e595-327d-80dd-e9f35b887881",
								false,
							},
							
							{
								"3bc6bf88-c464-ed93-a311-22656148e5ba",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Iainuki No Zeni CD Enabled",
						uuid = "7281c620-ec80-d65a-9e3b-9567ef1021cc",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"25526db7-3e90-fe08-8df1-b0585e2b38fc",
								true,
							},
							
							{
								"238bd975-3871-5e12-8e53-399adacd89cb",
								true,
							},
							
							{
								"51aea656-8161-48f6-98c9-2780a53bb551",
								true,
							},
							
							{
								"e93e0795-5d96-f49a-97dc-02316f17965a",
								false,
							},
							
							{
								"35c868d1-cb26-30cb-a430-945a4811f795",
								true,
							},
							
							{
								"ddedae86-779e-6aa5-9fe4-86b438c454f2",
								true,
							},
							
							{
								"25447249-e9f0-b7d2-b94a-938e145b5eb9",
								false,
							},
							
							{
								"308fe1f4-9f25-e900-a28a-288e162e0fbb",
								true,
							},
							
							{
								"3bc6bf88-c464-ed93-a311-22656148e5ba",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Iainuki CD Disabled",
						uuid = "ad35ea39-ff24-e595-82b7-c2dbc6143137",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"25526db7-3e90-fe08-8df1-b0585e2b38fc",
								true,
							},
							
							{
								"238bd975-3871-5e12-8e53-399adacd89cb",
								true,
							},
							
							{
								"51aea656-8161-48f6-98c9-2780a53bb551",
								false,
							},
							
							{
								"ae3f970e-106c-6ba7-b96b-bcb05559eb8e",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Fallback Deactivate",
						uuid = "4e2973e4-ab77-9390-b20e-efd2fcf81a17",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "25526db7-3e90-fe08-8df1-b0585e2b38fc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4362,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Sam",
						uuid = "238bd975-3871-5e12-8e53-399adacd89cb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "51aea656-8161-48f6-98c9-2780a53bb551",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.mGetPlayer():IsMoving()",
						name = "Am Moving",
						uuid = "e93e0795-5d96-f49a-97dc-02316f17965a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "35c868d1-cb26-30cb-a430-945a4811f795",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 6,
						name = "Target <= 6y",
						uuid = "ddedae86-779e-6aa5-9fe4-86b438c454f2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_CD\"]",
						dequeueIfLuaFalse = true,
						name = "CD Enabled",
						uuid = "25447249-e9f0-b7d2-b94a-938e145b5eb9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil and TimeSince(data.ocCombatTimer) > 4000",
						dequeueIfLuaFalse = true,
						name = "Combat > 4s",
						uuid = "8d184850-ef21-2ff2-9291-f8902f0860bc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41605,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Iainuki CD <= 3s",
						uuid = "308fe1f4-9f25-e900-a28a-288e162e0fbb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,34):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Zeninage",
						uuid = "0fea0543-e595-327d-80dd-e9f35b887881",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 41606,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Zeninage Off CD",
						uuid = "3ddb4886-849a-2357-8122-cf3399f46e5a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.getItem(47740) ~= nil",
						dequeueIfLuaFalse = true,
						name = "Has Coffer",
						uuid = "c73165f8-847b-61fa-aac4-a8e97be3aa00",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] == true",
						dequeueIfLuaFalse = true,
						name = "Is Queued",
						uuid = "ae3f970e-106c-6ba7-b96b-bcb05559eb8e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Iainuki\")",
						name = "Toggle",
						uuid = "3bc6bf88-c464-ed93-a311-22656148e5ba",
						version = 3,
					},
				},
			},
			name = "P. Sam Iainuki",
			throttleTime = 100,
			uuid = "6c2de725-16db-dd09-83c9-eeecf9fdadaf",
			version = 2,
		},
		inheritedIndex = 24,
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
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"c4e0c01f-1174-3e48-956e-41193f15da26",
								true,
							},
							
							{
								"6c9b174b-99cb-cae5-aadf-346ce19a8a9c",
								true,
							},
							
							{
								"70555a3a-b123-ba76-913e-346182583ae8",
								true,
							},
							
							{
								"2733c6f2-6f59-93bd-886c-ea28fb65c82a",
								true,
							},
							
							{
								"0d707741-2c82-6078-a931-df5d8a736d54",
								true,
							},
							
							{
								"f77fa5a1-7ba0-ca82-8f70-b3c44b524f4d",
								true,
							},
							
							{
								"e9d7b04c-9bb3-ade5-b6db-807a7af7c557",
								true,
							},
							
							{
								"e2a71f48-06c8-7be8-a9db-5e32cb0d02b5",
								true,
							},
							
							{
								"b5f97cba-d002-f4fc-8dd2-29c135abef9e",
								true,
							},
							
							{
								"9c87688b-fb6f-d65b-a3f5-d40a5dd3518b",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Zeninage",
						uuid = "d3e42277-5fea-4298-bd1a-8c9fa2973eef",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"c4e0c01f-1174-3e48-956e-41193f15da26",
								true,
							},
							
							{
								"6c9b174b-99cb-cae5-aadf-346ce19a8a9c",
								true,
							},
							
							{
								"70555a3a-b123-ba76-913e-346182583ae8",
								false,
							},
							
							{
								"f0aae32a-c66e-5c82-b91d-50d40a1e8a56",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Fallback Deactivate",
						uuid = "32b92bee-4cb3-cfd3-ad54-8ba2ec2ecb79",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "c4e0c01f-1174-3e48-956e-41193f15da26",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4362,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Sam",
						uuid = "6c9b174b-99cb-cae5-aadf-346ce19a8a9c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "70555a3a-b123-ba76-913e-346182583ae8",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "2733c6f2-6f59-93bd-886c-ea28fb65c82a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil and TimeSince(data.ocCombatTimer) > 4000",
						dequeueIfLuaFalse = true,
						name = "Combat > 4s",
						uuid = "0d707741-2c82-6078-a931-df5d8a736d54",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_CD\"]",
						dequeueIfLuaFalse = true,
						name = "CD Enabled",
						uuid = "f77fa5a1-7ba0-ca82-8f70-b3c44b524f4d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "e9d7b04c-9bb3-ade5-b6db-807a7af7c557",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41606,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Zeninage CD <= 3s",
						uuid = "e2a71f48-06c8-7be8-a9db-5e32cb0d02b5",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.getItem(47740) ~= nil",
						dequeueIfLuaFalse = true,
						name = "Has Coffer",
						uuid = "b5f97cba-d002-f4fc-8dd2-29c135abef9e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] == true",
						dequeueIfLuaFalse = true,
						name = "Is Queued",
						uuid = "f0aae32a-c66e-5c82-b91d-50d40a1e8a56",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Zeninage\")",
						name = "Toggle",
						uuid = "9c87688b-fb6f-d65b-a3f5-d40a5dd3518b",
						version = 3,
					},
				},
			},
			name = "P. Sam Zeninage",
			throttleTime = 1500,
			uuid = "f2d1f07e-321c-e1ce-8429-7a0b6d6b913e",
			version = 2,
		},
		inheritedIndex = 25,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "ACR",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"3ebc6543-c8e2-5c0a-b15e-32f7d07734a7",
								true,
							},
							
							{
								"cc7e4724-c91b-2918-b01a-658bfe057266",
								true,
							},
							
							{
								"ffcb081e-e4a0-b915-a944-7bd08ffdac93",
								true,
							},
							
							{
								"c6d7e8d8-c757-16e7-8d01-e200423d2d85",
								true,
							},
							
							{
								"979c090b-4949-cadf-9069-22b20ccc8b6a",
								true,
							},
							
							{
								"bf68a577-031c-6da5-833a-a2af0df7dc0f",
								true,
							},
							
							{
								"b80e29ff-4548-ddeb-bec1-d7c2c95ecde3",
								true,
							},
							
							{
								"3fd43f44-9d54-5f0a-8bbb-fd9b4d494836",
								true,
							},
							
							{
								"777ee56d-c235-d1b0-8cc7-1d3437cb1a64",
								true,
							},
							
							{
								"4d153190-820e-68f0-a7f6-cc91e785fd38",
								true,
							},
							
							{
								"288a1c8f-7303-8c70-9784-735929074a67",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction2",
						name = "Deadly Blow",
						targetType = "Current Target",
						uuid = "e68bd3d3-bf3f-0cca-8b76-fa15c75071d4",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "In Occult Crescent",
						uuid = "3ebc6543-c8e2-5c0a-b15e-32f7d07734a7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4359,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is Berserker",
						uuid = "cc7e4724-c91b-2918-b01a-658bfe057266",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Is Bot Running",
						uuid = "ffcb081e-e4a0-b915-a944-7bd08ffdac93",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "c6d7e8d8-c757-16e7-8d01-e200423d2d85",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						name = "Self Living",
						uuid = "979c090b-4949-cadf-9069-22b20ccc8b6a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Self Missing Transcendent",
						uuid = "bf68a577-031c-6da5-833a-a2af0df7dc0f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "c2fdc327-8031-f6a9-adfe-685becae7175",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_CD\"]",
						dequeueIfLuaFalse = true,
						name = "CD Enabled",
						uuid = "b80e29ff-4548-ddeb-bec1-d7c2c95ecde3",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41594,
						buffCheckType = 2,
						buffID = 4232,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Deadly Blow CD",
						uuid = "3fd43f44-9d54-5f0a-8bbb-fd9b4d494836",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil and TimeSince(data.ocCombatTimer) > 2400",
						dequeueIfLuaFalse = true,
						name = "Combat > 2.4s",
						uuid = "777ee56d-c235-d1b0-8cc7-1d3437cb1a64",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return true",
						dequeueIfLuaFalse = true,
						name = "Flip To Disable Action",
						uuid = "4d153190-820e-68f0-a7f6-cc91e785fd38",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Deadly Blow\")",
						name = "Toggle",
						uuid = "288a1c8f-7303-8c70-9784-735929074a67",
						version = 3,
					},
				},
			},
			name = "P. Berserker Deadly Blow",
			throttleTime = 100,
			uuid = "5ba3375d-fe3c-b0f3-b109-b09825fc872b",
			version = 2,
		},
		inheritedIndex = 26,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 41624,
						conditions = 
						{
							
							{
								"f63493bb-f733-119c-a758-9b0599d8d1bc",
								true,
							},
							
							{
								"183e2fda-dc8b-df87-805b-a860fc5177a9",
								true,
							},
							
							{
								"c3f5e16a-bd98-c5b2-8260-e5b2d04a1ed0",
								true,
							},
							
							{
								"58f4e568-e03e-81de-9f7a-54fcb24e80ed",
								true,
							},
							
							{
								"a81e78f1-987b-edbd-a012-344d8863f871",
								false,
							},
							
							{
								"0871ec24-fb24-fa3d-97e0-3425718700b7",
								true,
							},
							
							{
								"785c1f3a-3ab7-c292-b8e0-7a39c641af49",
								true,
							},
						},
						gVar = "ACR_TensorMagnum3_CD",
						targetType = "Current Target",
						uuid = "41eee827-c894-0837-946e-33eee9b4e04b",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						localmapid = 1252,
						name = "South Horn",
						uuid = "f63493bb-f733-119c-a758-9b0599d8d1bc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4365,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Time Mage",
						uuid = "183e2fda-dc8b-df87-805b-a860fc5177a9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						name = "In Combat",
						uuid = "c3f5e16a-bd98-c5b2-8260-e5b2d04a1ed0",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 41624,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						name = "Not on CD",
						uuid = "58f4e568-e03e-81de-9f7a-54fcb24e80ed",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 3,
						buffDuration = 7,
						buffID = 4259,
						uuid = "a81e78f1-987b-edbd-a012-344d8863f871",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "0871ec24-fb24-fa3d-97e0-3425718700b7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "e9f60f80-5778-5e4b-ba59-cd5f54756373",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "b706117d-8923-19ff-bc0b-fa0c15b28328",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorReactions_CurrentCombatTimer > 12.5",
						dequeueIfLuaFalse = true,
						name = "Combat > 10s",
						uuid = "785c1f3a-3ab7-c292-b8e0-7a39c641af49",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Mage Masher\")",
						name = "Toggle",
						uuid = "1295ad69-4be0-ddd8-9da2-61874c2f64cd",
						version = 3,
					},
				},
			},
			name = "P. Tmage Mage Masher",
			throttleTime = 1250,
			uuid = "f002c1b7-06d1-6521-a194-18da8de47602",
			version = 2,
		},
		inheritedIndex = 27,
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
						actionLua = "data.deathclawCones = data.deathclawCones or {}\ndata.deathclawCones[eventArgs.entityID] = TensorCore.getMoogleDrawer():addTimedConeOnEnt(7000,eventArgs.entityID,40,math.rad(90),nil)\nself.used = true",
						conditions = 
						{
							
							{
								"af7e015f-e56c-b02f-bffa-6d35e42d7467",
								true,
							},
							
							{
								"3dff59b3-6552-44b6-8ffe-d03350028d33",
								true,
							},
							
							{
								"3101f3ac-f676-087b-a530-94ebe04426dc",
								true,
							},
							
							{
								"617b5141-a395-cb8e-a507-3ef77774b1d8",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						uuid = "de9c98eb-04af-cf63-a53b-243dd3e581ac",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "Argus.deleteTimedShape(data.deathclawCones[eventArgs.entityID])\ndata.deathclawCones[eventArgs.entityID] = nil\nself.used = true",
						conditions = 
						{
							
							{
								"af7e015f-e56c-b02f-bffa-6d35e42d7467",
								true,
							},
							
							{
								"92a83f85-62aa-4c5d-9041-216f3cffad2d",
								true,
							},
							
							{
								"617b5141-a395-cb8e-a507-3ef77774b1d8",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						uuid = "c322bdc3-999c-a3e9-aaf1-7e73d2489527",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.a2 == 16 and eventArgs.a3 == 32 and eventArgs.a4 == 0",
						dequeueIfLuaFalse = true,
						uuid = "3dff59b3-6552-44b6-8ffe-d03350028d33",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.a2 == 4 and eventArgs.a3 == 8 and eventArgs.a4 == 0\n\n",
						dequeueIfLuaFalse = true,
						uuid = "92a83f85-62aa-4c5d-9041-216f3cffad2d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.deathclawCones == nil or table.size(data.deathclawCones) < 2",
						uuid = "3101f3ac-f676-087b-a530-94ebe04426dc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						uuid = "af7e015f-e56c-b02f-bffa-6d35e42d7467",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local player = TensorCore.mGetPlayer()\nreturn TensorCore.getDistance2d(player.pos, { h = 0, x = 680, y = 74, z = 534 }) < 40",
						dequeueIfLuaFalse = true,
						name = "In Deathclaw Arena",
						uuid = "617b5141-a395-cb8e-a507-3ef77774b1d8",
						version = 3,
					},
				},
			},
			eventType = 19,
			name = "[DeathClaw] EventObjectScript",
			timeout = 15,
			uuid = "17e6a475-9ab7-00e1-ad31-af75e6073ff2",
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
						actionID = 41607,
						conditions = 
						{
							
							{
								"8cd3436d-3f52-7195-90f3-7354696e0e09",
								true,
							},
							
							{
								"5472c749-32d6-8d4c-b3dc-bd0a41b9787a",
								true,
							},
							
							{
								"0d62082a-d701-5772-8641-fb8d84a24bf7",
								true,
							},
							
							{
								"c0446da6-224a-0bad-b444-34dd96794f7a",
								true,
							},
							
							{
								"cf49c056-57f6-b2f0-a13f-7c5b3f558a70",
								true,
							},
							
							{
								"9c7bd453-33e3-3ea8-9777-3b6372f24f23",
								true,
							},
							
							{
								"ab8ab672-de83-07a8-9e0d-d32ef9196663",
								true,
							},
							
							{
								"cc5f4120-16a4-de1f-b971-732ecd7451fd",
								true,
							},
						},
						gVar = "ACR_TensorMagnum3_CD",
						name = "Mighty March",
						uuid = "ddfada01-585e-ed16-bbb8-c1a4e7ebc51d",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "8cd3436d-3f52-7195-90f3-7354696e0e09",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4363,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Bard",
						uuid = "5472c749-32d6-8d4c-b3dc-bd0a41b9787a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						name = "In Combat",
						uuid = "0d62082a-d701-5772-8641-fb8d84a24bf7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 1,
						actionID = 41607,
						buffCheckType = 7,
						buffDuration = 5,
						buffID = 4247,
						buffIDList = 
						{
							4247,
						},
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Mighty March CD <= 1s",
						uuid = "c0446da6-224a-0bad-b444-34dd96794f7a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						comparator = 2,
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 50,
						name = "HP <= 50%",
						uuid = "cf49c056-57f6-b2f0-a13f-7c5b3f558a70",
						version = 3,
					},
					inheritedIndex = 5,
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "9c7bd453-33e3-3ea8-9777-3b6372f24f23",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "ab8ab672-de83-07a8-9e0d-d32ef9196663",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Mighty March\")",
						name = "Toggle",
						uuid = "cc5f4120-16a4-de1f-b971-732ecd7451fd",
						version = 3,
					},
				},
			},
			name = "P. Bard Mighty March",
			throttleTime = 1500,
			uuid = "c18517b0-1e34-1d83-8176-9f1d38d51541",
			version = 2,
		},
		inheritedIndex = 29,
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
						actionLua = "self.used = true",
						conditions = 
						{
							
							{
								"162641a4-b299-b4e9-83a0-bd3da968ac8a",
								true,
							},
							
							{
								"d87b88ed-15b7-3126-8ab9-02a737bc5b37",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						uuid = "0c6ea1e6-0a85-5253-ad24-e7ce49b39bda",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "self.used = true",
						conditions = 
						{
							
							{
								"162641a4-b299-b4e9-83a0-bd3da968ac8a",
								true,
							},
							
							{
								"89351613-c8ea-8c06-a135-184e8bd4eec9",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						uuid = "4b220914-a606-b0d0-b801-54b741def816",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local ent = TensorCore.mGetEntity(eventArgs.entityID)\nTensorCore.getMoogleDrawer():addTimedCone((eventArgs.channelTimeMax*1000)-500,ent.pos.x,ent.pos.y,ent.pos.z,40,math.rad(90),ent.pos.h-math.pi/2)\nTensorCore.getMoogleDrawer():addTimedCone((eventArgs.channelTimeMax*1000)-500,ent.pos.x,ent.pos.y,ent.pos.z,40,math.rad(90),ent.pos.h+math.pi/2)\nself.used = true",
						conditions = 
						{
							
							{
								"162641a4-b299-b4e9-83a0-bd3da968ac8a",
								true,
							},
							
							{
								"d87b88ed-15b7-3126-8ab9-02a737bc5b37",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Horizontal",
						uuid = "af2407d0-4ace-3dd7-8c61-b088dd3730e2",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local ent = TensorCore.mGetEntity(eventArgs.entityID)\nTensorCore.getMoogleDrawer():addTimedCone((eventArgs.channelTimeMax*1000)-500,ent.pos.x,ent.pos.y,ent.pos.z,40,math.rad(90),ent.pos.h)\nTensorCore.getMoogleDrawer():addTimedCone((eventArgs.channelTimeMax*1000)-500,ent.pos.x,ent.pos.y,ent.pos.z,40,math.rad(90),ent.pos.h+math.pi)\nself.used = true",
						conditions = 
						{
							
							{
								"162641a4-b299-b4e9-83a0-bd3da968ac8a",
								true,
							},
							
							{
								"89351613-c8ea-8c06-a135-184e8bd4eec9",
								true,
							},
							
							{
								"0e9fa33a-38c1-2338-9f85-75d9ce25bc7c",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Vertical",
						uuid = "b456e23d-056a-a296-8a67-03c1a63ffd31",
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
						eventArgOptionType = 3,
						eventArgType = 2,
						eventSpellID = 41324,
						name = "Horizontal Crosshatch",
						spellIDList = 
						{
							41324,
							41331,
						},
						uuid = "d87b88ed-15b7-3126-8ab9-02a737bc5b37",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 3,
						eventArgType = 2,
						eventSpellID = 41323,
						name = "Vertical Crosshatch",
						spellIDList = 
						{
							41323,
							41330,
						},
						uuid = "89351613-c8ea-8c06-a135-184e8bd4eec9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						uuid = "162641a4-b299-b4e9-83a0-bd3da968ac8a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local player = TensorCore.mGetPlayer()\nreturn TensorCore.getDistance2d(player.pos, { h = 0, x = 680, y = 74, z = 534 }) < 40",
						dequeueIfLuaFalse = true,
						name = "In Deathclaw Arena",
						uuid = "0e9fa33a-38c1-2338-9f85-75d9ce25bc7c",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[DeathClaw] Crosshatch OnEntityChannel",
			throttleTime = 500,
			uuid = "ba99423d-bf7c-c3e2-b84b-ae7da56bc69e",
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
						actionID = 41608,
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"9f487160-bb6b-c2c6-9ed3-d248843da14e",
								true,
							},
							
							{
								"560745ad-72be-9478-9030-f84b2e588114",
								true,
							},
							
							{
								"86359e53-d419-7fc3-be4f-446c03d27d6a",
								true,
							},
							
							{
								"7fb3672e-4cb4-359f-96c7-9d17abfd989d",
								true,
							},
							
							{
								"4aba1362-c85a-a3c9-96c8-5cc50660875f",
								true,
							},
							
							{
								"a1a93af6-59f8-c186-bee4-8f08721cf800",
								true,
							},
							
							{
								"c36577af-0090-d074-a4e6-1ab4f07eab99",
								true,
							},
							
							{
								"c4c610e0-470e-2610-bd7f-52d1f5c17a0c",
								true,
							},
							
							{
								"4a74a1ed-df08-9e67-b4de-a00f7e3e1512",
								true,
							},
							
							{
								"f94d6587-e826-5a9f-8436-eafbd600aa75",
								true,
							},
							
							{
								"76798336-a69d-7ce8-bc4c-88f1a3d0b5a3",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction1",
						name = "Refresh My Aria",
						uuid = "82ea7f57-f613-c0c6-930d-add9b1812856",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"9f487160-bb6b-c2c6-9ed3-d248843da14e",
								true,
							},
							
							{
								"560745ad-72be-9478-9030-f84b2e588114",
								true,
							},
							
							{
								"86359e53-d419-7fc3-be4f-446c03d27d6a",
								true,
							},
							
							{
								"7fb3672e-4cb4-359f-96c7-9d17abfd989d",
								true,
							},
							
							{
								"4aba1362-c85a-a3c9-96c8-5cc50660875f",
								true,
							},
							
							{
								"a1a93af6-59f8-c186-bee4-8f08721cf800",
								true,
							},
							
							{
								"3907f741-1e38-d5dd-837f-97a9b20d6992",
								true,
							},
							
							{
								"4a74a1ed-df08-9e67-b4de-a00f7e3e1512",
								true,
							},
							
							{
								"f94d6587-e826-5a9f-8436-eafbd600aa75",
								true,
							},
							
							{
								"76798336-a69d-7ce8-bc4c-88f1a3d0b5a3",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_CD",
						name = "Cast Aria",
						uuid = "38cacc9b-28f6-373b-ae20-00f75f67c63a",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "9f487160-bb6b-c2c6-9ed3-d248843da14e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4363,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Bard",
						uuid = "560745ad-72be-9478-9030-f84b2e588114",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 0.10000000149012,
						name = "Am Alive",
						uuid = "86359e53-d419-7fc3-be4f-446c03d27d6a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "7fb3672e-4cb4-359f-96c7-9d17abfd989d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "4aba1362-c85a-a3c9-96c8-5cc50660875f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 4249,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Missing Hero's Rime",
						uuid = "a1a93af6-59f8-c186-bee4-8f08721cf800",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 7,
						buffDuration = 5,
						buffID = 4247,
						buffIDList = 
						{
							4247,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						name = "Aria <= 5s",
						uuid = "c36577af-0090-d074-a4e6-1ab4f07eab99",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.hasBuff(Player.id, 4247, Player.id)",
						dequeueIfLuaFalse = true,
						name = "Aria Belongs To Me",
						uuid = "c4c610e0-470e-2610-bd7f-52d1f5c17a0c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 4247,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Missing Aria",
						uuid = "3907f741-1e38-d5dd-837f-97a9b20d6992",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "4a74a1ed-df08-9e67-b4de-a00f7e3e1512",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "f94d6587-e826-5a9f-8436-eafbd600aa75",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Aria\")",
						name = "Toggle",
						uuid = "76798336-a69d-7ce8-bc4c-88f1a3d0b5a3",
						version = 3,
					},
				},
			},
			name = "P. Bard Aria",
			throttleTime = 1500,
			uuid = "a6c7e7ac-46cf-12e7-ae07-883da63ba66c",
			version = 2,
		},
		inheritedIndex = 31,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 41611,
						conditions = 
						{
							
							{
								"a9b88350-2ec7-4cf1-b280-4a09d50599df",
								true,
							},
							
							{
								"15e5b8fb-df9c-820c-b1a5-52018a844a0b",
								true,
							},
							
							{
								"c9323a23-d798-92ea-a934-5808aff57633",
								true,
							},
							
							{
								"c0b2345f-4fbe-2e11-883b-6f1a10584769",
								false,
							},
							
							{
								"29f23351-52ca-b461-91cc-93f0b0e10321",
								true,
							},
							
							{
								"f66ceece-6cb6-90e8-b592-76a5836dbf06",
								true,
							},
							
							{
								"ec8a837a-ead4-8ece-848f-a8126fa4dc34",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						ignoreWeaveRules = true,
						name = "Battle Bell Not In Combat",
						uuid = "17997d14-5af1-4dea-9340-bdbc1e2c0b93",
						version = 2.1,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						actionID = 41611,
						conditions = 
						{
							
							{
								"a9b88350-2ec7-4cf1-b280-4a09d50599df",
								true,
							},
							
							{
								"15e5b8fb-df9c-820c-b1a5-52018a844a0b",
								true,
							},
							
							{
								"bfce063d-cda4-aae4-8cb4-47aaa5bd4c9e",
								true,
							},
							
							{
								"c9323a23-d798-92ea-a934-5808aff57633",
								true,
							},
							
							{
								"c0b2345f-4fbe-2e11-883b-6f1a10584769",
								true,
							},
							
							{
								"29f23351-52ca-b461-91cc-93f0b0e10321",
								true,
							},
							
							{
								"f66ceece-6cb6-90e8-b592-76a5836dbf06",
								true,
							},
							
							{
								"ec8a837a-ead4-8ece-848f-a8126fa4dc34",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Battle Bell In Combat",
						uuid = "86fc8ed6-5ccb-dbf3-bcb5-e4e38d195053",
						version = 2.1,
					},
					inheritedIndex = 2,
					inheritedOverwrites = 
					{
						conditions = 
						{
							
							{
								type = "remove",
								value = 
								{
									"d8720967-962e-a798-b184-d2ca5366f741",
									true,
								},
							},
							
							{
								position = 1,
								type = "add",
								value = 
								{
									"4bf7209d-8c34-782c-a4dd-63b77e3e4ae6",
									true,
								},
							},
							
							{
								type = "add",
								value = 
								{
									"c4ae7583-ea9c-83b4-819e-c3f5d969fec1",
									true,
								},
							},
							
							{
								type = "add",
								value = 
								{
									"1bd49bca-4e66-cdf9-b946-1b57d123c7d8",
									true,
								},
							},
						},
					},
				},
				
				{
					data = 
					{
						actionID = 41611,
						conditions = 
						{
							
							{
								"a9b88350-2ec7-4cf1-b280-4a09d50599df",
								true,
							},
							
							{
								"15e5b8fb-df9c-820c-b1a5-52018a844a0b",
								true,
							},
							
							{
								"bfce063d-cda4-aae4-8cb4-47aaa5bd4c9e",
								true,
							},
							
							{
								"c9323a23-d798-92ea-a934-5808aff57633",
								true,
							},
							
							{
								"c0b2345f-4fbe-2e11-883b-6f1a10584769",
								true,
							},
							
							{
								"29f23351-52ca-b461-91cc-93f0b0e10321",
								true,
							},
							
							{
								"f66ceece-6cb6-90e8-b592-76a5836dbf06",
								true,
							},
							
							{
								"ec8a837a-ead4-8ece-848f-a8126fa4dc34",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Battle Bell Tank",
						targetType = "Target of Current Target",
						uuid = "8c8bb21a-4351-26f6-b8e2-4a528e484a5b",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "a9b88350-2ec7-4cf1-b280-4a09d50599df",
						version = 3,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						buffID = 4364,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Geomancer",
						uuid = "15e5b8fb-df9c-820c-b1a5-52018a844a0b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						name = "In Combat",
						uuid = "bfce063d-cda4-aae4-8cb4-47aaa5bd4c9e",
						version = 3,
					},
					inheritedIndex = 3,
				},
				
				{
					data = 
					{
						actionCDValue = 1.5,
						actionID = 41611,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Battle Bell CD <= 1.5s",
						uuid = "c9323a23-d798-92ea-a934-5808aff57633",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 3,
						buffDuration = 3,
						buffID = 4251,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Has Battle Bell",
						uuid = "c0b2345f-4fbe-2e11-883b-6f1a10584769",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "29f23351-52ca-b461-91cc-93f0b0e10321",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "f66ceece-6cb6-90e8-b592-76a5836dbf06",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Battle Bell\")",
						name = "Toggle",
						uuid = "ec8a837a-ead4-8ece-848f-a8126fa4dc34",
						version = 3,
					},
				},
			},
			name = "P. Geomancer Battle Bell",
			throttleTime = 1250,
			uuid = "f54a354e-293a-9e76-98e9-0251950cb971",
			version = 2,
		},
		inheritedIndex = 32,
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
						actionLua = "self.used = true",
						conditions = 
						{
							
							{
								"162641a4-b299-b4e9-83a0-bd3da968ac8a",
								true,
							},
							
							{
								"d87b88ed-15b7-3126-8ab9-02a737bc5b37",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						uuid = "0c6ea1e6-0a85-5253-ad24-e7ce49b39bda",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "self.used = true",
						conditions = 
						{
							
							{
								"162641a4-b299-b4e9-83a0-bd3da968ac8a",
								true,
							},
							
							{
								"89351613-c8ea-8c06-a135-184e8bd4eec9",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						uuid = "4b220914-a606-b0d0-b801-54b741def816",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local ent = TensorCore.mGetEntity(eventArgs.entityID)\nTensorCore.getMoogleDrawer():addTimedCone((eventArgs.channelTimeMax*1000)-500,ent.pos.x,ent.pos.y,ent.pos.z,40,math.rad(90),ent.pos.h-math.pi/2)\nTensorCore.getMoogleDrawer():addTimedCone((eventArgs.channelTimeMax*1000)-500,ent.pos.x,ent.pos.y,ent.pos.z,40,math.rad(90),ent.pos.h+math.pi/2)\nself.used = true",
						conditions = 
						{
							
							{
								"162641a4-b299-b4e9-83a0-bd3da968ac8a",
								true,
							},
							
							{
								"d87b88ed-15b7-3126-8ab9-02a737bc5b37",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Horizontal",
						uuid = "af2407d0-4ace-3dd7-8c61-b088dd3730e2",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local ent = TensorCore.mGetEntity(eventArgs.entityID)\nTensorCore.getMoogleDrawer():addTimedCone((eventArgs.channelTimeMax*1000)-500,ent.pos.x,ent.pos.y,ent.pos.z,40,math.rad(90),ent.pos.h)\nTensorCore.getMoogleDrawer():addTimedCone((eventArgs.channelTimeMax*1000)-500,ent.pos.x,ent.pos.y,ent.pos.z,40,math.rad(90),ent.pos.h+math.pi)\nself.used = true",
						conditions = 
						{
							
							{
								"162641a4-b299-b4e9-83a0-bd3da968ac8a",
								true,
							},
							
							{
								"89351613-c8ea-8c06-a135-184e8bd4eec9",
								true,
							},
							
							{
								"0e9fa33a-38c1-2338-9f85-75d9ce25bc7c",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Vertical",
						uuid = "b456e23d-056a-a296-8a67-03c1a63ffd31",
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
						eventArgOptionType = 3,
						eventArgType = 2,
						eventSpellID = 41324,
						name = "Horizontal Crosshatch",
						spellIDList = 
						{
							41324,
							41331,
						},
						uuid = "d87b88ed-15b7-3126-8ab9-02a737bc5b37",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 3,
						eventArgType = 2,
						eventSpellID = 41323,
						name = "Vertical Crosshatch",
						spellIDList = 
						{
							41323,
							41330,
						},
						uuid = "89351613-c8ea-8c06-a135-184e8bd4eec9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						uuid = "162641a4-b299-b4e9-83a0-bd3da968ac8a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local player = TensorCore.mGetPlayer()\nreturn TensorCore.getDistance2d(player.pos, { h = 0, x = 680, y = 74, z = 534 }) < 40",
						dequeueIfLuaFalse = true,
						name = "In Deathclaw Arena",
						uuid = "0e9fa33a-38c1-2338-9f85-75d9ce25bc7c",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[DeathClaw] Crosshatch OnEntityChannel",
			throttleTime = 500,
			uuid = "0baa1914-abcd-7175-8f51-0d15fb256a1b",
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
						actionLua = "local now = Now()\nlocal entityID = tonumber(eventArgs.entityID)\nlocal entity = entityID and TensorCore.mGetEntity(entityID) or nil\nif not entity or not entity.pos then self.used = true return end\nlocal model = Argus.getEntityModel(entity)\nif model and tonumber(model) ~= 18142 then self.used = true return end\nlocal center = { x = 636, y = entity.pos.y, z = -54 }\nlocal offX = entity.pos.x - center.x\nlocal offZ = entity.pos.z - center.z\nlocal distance = math.sqrt(offX * offX + offZ * offZ)\nif distance < 1 then self.used = true return end\nlocal facing = tonumber(entity.pos.h) or 0\nlocal forwardX = math.sin(facing)\nlocal forwardZ = math.cos(facing)\nlocal clockwise = (offX * forwardZ - offZ * forwardX) > 0\nlocal delta = distance < 15 and math.rad(-80) or math.rad(148)\nif clockwise then delta = -delta end\nlocal finalPos = TensorCore.rotatePosAroundPos(center, entity.pos, delta)\nif not finalPos then self.used = true return end\nlocal state = data.southHornOnTheHuntRoundels\nif type(state) ~= \"table\" or now - (tonumber(state.startedAt) or 0) > 6500 then\n if type(state) == \"table\" and type(state.entries) == \"table\" then\n  for _, e in pairs(state.entries) do if e.uuid then Argus.deleteTimedShape(e.uuid) end end\n end\n state = { startedAt = now, entries = {} }\n data.southHornOnTheHuntRoundels = state\nend\nlocal key = tostring(entityID)\nif state.entries[key] then self.used = true return end\nlocal red = TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(1.00, 0.06, 0.06, 0.78))\nred.colorOutline = 4294967295\nlocal uuid = red:addTimedCircle(5200, finalPos.x, entity.pos.y + 0.03, finalPos.z, 12, 0, false, true)\nred.colorOutline = nil\nstate.entries[key] = { id = entityID, at = now + 5200, uuid = uuid, y = entity.pos.y + 0.03 }\nself.used = true",
						conditions = 
						{
							
							{
								"11223834-0fdb-af78-b3b5-d5100bfbfeef",
								true,
							},
							
							{
								"550e20d9-f13d-9dc3-89be-04cde5829013",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Corrected Roundel prediction + live state",
						uuid = "3e66e0d7-7e02-875d-9c36-5a335bbdf2c9",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						uuid = "11223834-0fdb-af78-b3b5-d5100bfbfeef",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.entityContentID == 13812 and eventArgs.oldActiveAura1 == 2428 and eventArgs.newActiveAura1 == 2429",
						dequeueIfLuaFalse = true,
						uuid = "550e20d9-f13d-9dc3-89be-04cde5829013",
						version = 3,
					},
				},
			},
			eventType = 25,
			name = "[On The Hunt] Orbs",
			uuid = "4164913b-c2d1-83e0-a80e-9b0173165d94",
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
						actionLua = "if not data.pGeoTogglesInitialised then\n\tdata.pGeoLevitatePartyEnabled = false\n\tdata.pGeoTogglesInitialised = true\nend",
						conditions = 
						{
							
							{
								"c8473c58-50b2-e36e-978e-97c251f2527d",
								true,
							},
						},
						gVar = "ACR_TensorWeeb3_CD",
						name = "Init",
						uuid = "f824ba34-7a6a-8f76-aa79-e805614d632f",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "GUI:SetNextWindowSize(140, 50, GUI.SetCond_Always)\nGUI:Begin(\"Geo Levitate Toggle\", true, GUI.WindowFlags_NoTitleBar | GUI.WindowFlags_NoResize)\n\nif data.pGeoLevitatePartyEnabled then\n    GUI:PushStyleColor(GUI.Col_Button, 0.2, 0.7, 0.2, 1.0) -- Green\nelse\n    GUI:PushStyleColor(GUI.Col_Button, 0.7, 0.2, 0.2, 1.0) -- Red\nend\n\nif GUI:Button(\"Levitate Party\", 120, 35) then\n    data.pGeoLevitatePartyEnabled = not data.pGeoLevitatePartyEnabled\nend\n\n\nGUI:PopStyleColor()\n\nGUI:End()",
						conditions = 
						{
							
							{
								"c8473c58-50b2-e36e-978e-97c251f2527d",
								true,
							},
						},
						gVar = "ACR_TensorWeeb3_CD",
						name = "Draw",
						uuid = "b84116e5-badb-44c3-b04f-0a372aceb5b3",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						buffID = 4364,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Phantom Geomancer",
						uuid = "c8473c58-50b2-e36e-978e-97c251f2527d",
						version = 3,
					},
				},
			},
			enabled = false,
			eventType = 13,
			name = "P. Geomancer Levitate Toggle",
			uuid = "608ec0d1-adf2-ec9d-8f73-8e6c280fbb5d",
			version = 2,
		},
		inheritedIndex = 35,
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
						actionLua = "d(\"Record Inter\")\ndata.ocGarulaIntercardLightning = true\nself.used=true",
						conditions = 
						{
							
							{
								"3d713919-4904-c97e-bb72-5fba1cc7d8d1",
								true,
							},
							
							{
								"31ab17ca-1766-b858-8c32-5e1ede7eab12",
								true,
							},
						},
						gVar = "ACR_TensorWeeb3_CD",
						name = "Record Intercard Lightning",
						uuid = "cfc2248e-d420-e105-be82-c70775882def",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Record Not Inter\")\ndata.ocGarulaIntercardLightning = false\nself.used=true",
						conditions = 
						{
							
							{
								"3d713919-4904-c97e-bb72-5fba1cc7d8d1",
								true,
							},
							
							{
								"cd5ab771-4d08-f43f-9eb7-43101d1310df",
								true,
							},
						},
						gVar = "ACR_TensorWeeb3_CD",
						name = "Record Not Intercard Lightning",
						uuid = "76ae3e74-c328-cd8f-b2e3-b478824dc606",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						name = "In OC",
						uuid = "3d713919-4904-c97e-bb72-5fba1cc7d8d1",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.newActiveAura2 == 2395",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventMarkerID = 578,
						name = "Is Intercard",
						uuid = "31ab17ca-1766-b858-8c32-5e1ede7eab12",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.oldActiveAura2 == 2395 and eventArgs.newActiveAura2 == 0",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventMarkerID = 578,
						name = "Is Not Intercard",
						uuid = "cd5ab771-4d08-f43f-9eb7-43101d1310df",
						version = 3,
					},
				},
			},
			eventType = 25,
			name = "[NeoGarula] Rushing Rumble Lightning Cones",
			uuid = "ea473f7f-d006-97c2-86f4-b1c7f3e68a81",
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
						actionLua = "d(\"Reset Inter\")\ndata.ocGarulaIntercardLightning = nil\nself.used=true",
						conditions = 
						{
							
							{
								"3d713919-4904-c97e-bb72-5fba1cc7d8d1",
								true,
							},
							
							{
								"31ab17ca-1766-b858-8c32-5e1ede7eab12",
								true,
							},
							
							{
								"831587ec-aa31-c05d-9716-7138cd1f2de9",
								true,
							},
							
							{
								"3d093ac1-e37c-273a-b7d2-8459b1579b66",
								false,
							},
						},
						gVar = "ACR_TensorWeeb3_CD",
						name = "Reset Intercard Lightning",
						uuid = "cae35620-9631-5118-bd87-f6b2dde56b36",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "data.ocGarulaMarkerBirdEntID = eventArgs.entityID\nself.used=true",
						conditions = 
						{
							
							{
								"3d713919-4904-c97e-bb72-5fba1cc7d8d1",
								true,
							},
							
							{
								"31ab17ca-1766-b858-8c32-5e1ede7eab12",
								true,
							},
							
							{
								"831587ec-aa31-c05d-9716-7138cd1f2de9",
								true,
							},
						},
						gVar = "ACR_TensorWeeb3_CD",
						name = "Record Bird Entity ID",
						uuid = "cfc2248e-d420-e105-be82-c70775882def",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local pi = math.pi\nlocal back = pi\nlocal left = pi / 2\nlocal right = -pi / 2\n\nlocal coneAngle = 45\nlocal coneRad = coneAngle * (pi / 180)\nlocal coneLength = 70\nlocal circleRadius = 30\nlocal birdHitRadius = 6\n\nlocal drawDuration = 8750\nlocal drawDelay = 2500\n\nlocal function normalizeHeading(heading)\n    return ((heading + pi) % (2 * pi)) - pi\nend\n\nlocal chatterbirdEnt = TensorCore.mGetEntity(data.ocGarulaMarkerBirdEntID)\nlocal chatterbirdPos = chatterbirdEnt.pos\nlocal neoGarulaPos = data.ocGarulaPrevEndPoint\n\nif neoGarulaPos then\n\tlocal garulaEndPoint = TensorCore.getPosInDirection(chatterbirdPos, chatterbirdPos.h, birdHitRadius)\n\tdata.ocGarulaPrevEndPoint = garulaEndPoint\n\n\tlocal garulaToEndPointHeading = TensorCore.getHeadingToTarget(neoGarulaPos, garulaEndPoint)\n\n\tlocal directionOffsets = { 0, pi, pi / 2, -pi / 2 }\n\tif data.ocGarulaIntercardLightning then\n\t\tfor i = 1, #directionOffsets do\n\t\t\tdirectionOffsets[i] = directionOffsets[i] - (pi / 4)\n\t\tend\n\tend\n\n\tlocal moogleDrawer = TensorCore.getMoogleDrawer()\n\tfor _, offset in ipairs(directionOffsets) do\n\t\tlocal coneHeading = normalizeHeading(garulaToEndPointHeading + offset)\n\t\tmoogleDrawer:addTimedCone(drawDuration, garulaEndPoint.x, garulaEndPoint.y, garulaEndPoint.z, coneLength, coneRad, coneHeading, drawDelay)\n\tend\n\tmoogleDrawer:addTimedCircle(drawDuration,garulaEndPoint.x,garulaEndPoint.y,garulaEndPoint.z,circleRadius, drawDelay)\n\n\tdata.ocGarulaChargeCount = data.ocGarulaChargeCount + 1\n\tif data.ocGarulaChargeCount >= 3 then\n\t\tdata.ocGarulaRushingRumbleRampage = false\n\tend\nend\n\nself.used=true",
						conditions = 
						{
							
							{
								"3d713919-4904-c97e-bb72-5fba1cc7d8d1",
								true,
							},
							
							{
								"31ab17ca-1766-b858-8c32-5e1ede7eab12",
								true,
							},
							
							{
								"831587ec-aa31-c05d-9716-7138cd1f2de9",
								true,
							},
							
							{
								"3d093ac1-e37c-273a-b7d2-8459b1579b66",
								true,
							},
						},
						gVar = "ACR_TensorWeeb3_CD",
						name = "Draw AOE Charge 2 & 3",
						uuid = "4dbf96b7-f4b8-ef35-9f71-4331b377f382",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						name = "In OC",
						uuid = "3d713919-4904-c97e-bb72-5fba1cc7d8d1",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventMarkerID = 578,
						name = "Marker ID",
						uuid = "31ab17ca-1766-b858-8c32-5e1ede7eab12",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 13639,
						name = "Marker On Bird",
						uuid = "831587ec-aa31-c05d-9716-7138cd1f2de9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocGarulaRushingRumbleRampage == true",
						dequeueIfLuaFalse = true,
						name = "Is Rushing Rumble Rampage",
						uuid = "3d093ac1-e37c-273a-b7d2-8459b1579b66",
						version = 3,
					},
				},
			},
			eventType = 4,
			name = "[NeoGarula] Rushing Rumble Bird Marked",
			uuid = "928ccec3-5d5d-5ed9-92a8-c334d943ae52",
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
						actionLua = "local id = tonumber(eventArgs.aoeID)\nlocal x = tonumber(eventArgs.x)\nlocal y = tonumber(eventArgs.y)\nlocal z = tonumber(eventArgs.z)\nlocal heading = tonumber(eventArgs.heading) or 0\n\nif not id or not x or not y or not z then\n    self.used = true\n    return\nend\n\nlocal now = Now()\nlocal startAt = tonumber(eventArgs.startTime)\nif not startAt or startAt <= 0 or math.abs(now - startAt) > 15000 then\n    startAt = now\nend\n\nlocal function remainingMs(fallbackSeconds)\n    local seconds = tonumber(eventArgs.duration)\n    if not seconds or seconds <= 0 then\n        seconds = fallbackSeconds\n    end\n    return math.max(100, math.floor(startAt + seconds * 1000 - now + 250))\nend\n\nlocal function eventRadius(fallback)\n    local radius = tonumber(eventArgs.aoeLength)\n    if not radius or radius <= 0 then\n        radius = fallback\n    end\n    return radius\nend\n\nif id == 47302 then\n    local firstMs = remainingMs(4)\n    local firstDelay = math.max(0, math.floor(startAt + 4000 - now))\n    local drawer = TensorCore.getMoogleDrawer()\n    drawer:addTimedCone(firstMs, x, y, z, eventRadius(30), math.pi, heading, 0, false, true)\n    drawer:addTimedCone(4450, x, y, z, eventRadius(30), math.pi, TensorCore.convertHeading(heading + math.pi), firstDelay, false, true)\n    self.used = true\n    return\nend\n\nif id == 47325 then\n    TensorCore.getMoogleDrawer():addTimedCone(\n        remainingMs(5),\n        x, y, z,\n        eventRadius(60),\n        math.rad(45),\n        heading,\n        0,\n        false,\n        true\n    )\n    self.used = true\n    return\nend\n\nlocal divisor\nlocal angle\nif id == 49879 then\n    divisor = 1\n    angle = math.pi\nelseif id == 47314 then\n    divisor = 1\n    angle = math.rad(120)\nelseif id == 47309 then\n    divisor = 3\n    angle = math.pi\nelseif id == 47312 then\n    divisor = 3\n    angle = math.rad(120)\nelseif id == 47310 then\n    divisor = 4\n    angle = math.pi\nelseif id == 47313 then\n    divisor = 4\n    angle = math.rad(120)\nelseif id == 47308 then\n    divisor = 5\n    angle = math.pi\nelseif id == 47311 then\n    divisor = 5\n    angle = math.rad(120)\nend\n\nif not divisor then\n    self.used = true\n    return\nend\n\nlocal cacheAt = tonumber(data.ocFoliosCache)\nif not cacheAt or now - cacheAt > 1000 then\n    local _, _, _, effectiveKnowledgeLevel = TensorCore.getOccultCrescentInfo()\n    effectiveKnowledgeLevel = tonumber(effectiveKnowledgeLevel)\n    if effectiveKnowledgeLevel then\n        data.ocLevel = effectiveKnowledgeLevel\n        data.ocFoliosCache = now\n    end\nend\n\nlocal level = tonumber(data.ocLevel)\nif not level then\n    self.used = true\n    return\nend\nlevel = math.floor(level)\n\nlocal function isPrime(value)\n    if value < 2 then return false end\n    if value % 2 == 0 then return value == 2 end\n    local limit = math.floor(math.sqrt(value))\n    for test = 3, limit, 2 do\n        if value % test == 0 then return false end\n    end\n    return true\nend\n\nlocal unsafe\nif divisor == 1 then\n    unsafe = isPrime(level)\nelse\n    unsafe = level % divisor == 0\nend\n\nif unsafe then\n    TensorCore.getStaticFlatDrawer(2818572543):addTimedCone(\n        remainingMs(11),\n        x, y + 0.03, z,\n        eventRadius(25),\n        angle,\n        heading,\n        0,\n        false,\n        true\n    )\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"629912c2-8b53-4871-bd8f-2b4fc518cfbb",
								true,
							},
							
							{
								"87155c2c-0862-9d65-aa3c-a42fbdf1bf15",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Draw exact Folios cleaves",
						uuid = "64b07f6d-06c8-ded2-a0a4-709139e41524",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "In North Horn",
						uuid = "629912c2-8b53-4871-bd8f-2b4fc518cfbb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id = tonumber(eventArgs.aoeID)\nreturn id == 47302\n    or id == 47325\n    or id == 49879\n    or id == 47314\n    or id == 47309\n    or id == 47312\n    or id == 47310\n    or id == 47313\n    or id == 47308\n    or id == 47311",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 3,
						eventArgType = 2,
						name = "Folios exact AOEs",
						spellIDList = 
						{
							47315,
							47316,
							47317,
							47318,
						},
						uuid = "87155c2c-0862-9d65-aa3c-a42fbdf1bf15",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Forbidden Folios] Draws",
			uuid = "9836e89a-9906-e9ba-8aa9-4739b26436b3",
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
						actionLua = "d(\"Stop Silver\")\nif _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] == true then\n\t_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] = false\nend\nself.used = true",
						conditions = 
						{
							
							{
								"6ede6f2b-f21f-34fc-ac8f-17712a883aee",
								true,
							},
							
							{
								"d0b43e22-df2c-0f03-8be1-bdf2445b9955",
								true,
							},
							
							{
								"77dacb34-4585-2f97-b047-6d25037d5a9d",
								true,
							},
							
							{
								"49cb19e1-4a1a-e643-887b-eb61c1a7bd65",
								true,
							},
							
							{
								"5a850803-fc48-8ace-a599-32068f92f43f",
								false,
							},
							
							{
								"6105b516-3945-472a-ac0d-73d1c8d2ca9a",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Stop Silver",
						uuid = "a35683f9-e82b-e816-baed-bc2bd921e1a6",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionID = 41630,
						actionLua = "d(\"Silver\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] = true\nself.used = true",
						atomicPriority = true,
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"6ede6f2b-f21f-34fc-ac8f-17712a883aee",
								true,
							},
							
							{
								"d0b43e22-df2c-0f03-8be1-bdf2445b9955",
								true,
							},
							
							{
								"77dacb34-4585-2f97-b047-6d25037d5a9d",
								true,
							},
							
							{
								"49cb19e1-4a1a-e643-887b-eb61c1a7bd65",
								true,
							},
							
							{
								"66bc9b98-7d55-baeb-b9e2-e1aa2b7051a8",
								true,
							},
							
							{
								"5a850803-fc48-8ace-a599-32068f92f43f",
								true,
							},
							
							{
								"f3f536e5-c709-78f6-add9-bf5e997cf396",
								true,
							},
							
							{
								"6105b516-3945-472a-ac0d-73d1c8d2ca9a",
								true,
							},
							
							{
								"15e7aab5-9869-0a8a-97b9-b244bfa85813",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						ignoreWeaveRules = true,
						name = "Silver Cannon",
						targetType = "Current Target",
						uuid = "b742680e-1697-9265-ac40-85ffb8d715f1",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionID = 41627,
						actionLua = "d(\"Holy\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = true\nself.used = true",
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"6ede6f2b-f21f-34fc-ac8f-17712a883aee",
								true,
							},
							
							{
								"d0b43e22-df2c-0f03-8be1-bdf2445b9955",
								true,
							},
							
							{
								"77dacb34-4585-2f97-b047-6d25037d5a9d",
								true,
							},
							
							{
								"49cb19e1-4a1a-e643-887b-eb61c1a7bd65",
								true,
							},
							
							{
								"66bc9b98-7d55-baeb-b9e2-e1aa2b7051a8",
								true,
							},
							
							{
								"5a850803-fc48-8ace-a599-32068f92f43f",
								false,
							},
							
							{
								"9d90a354-122d-1e4a-9766-d03e2dce7797",
								true,
							},
							
							{
								"6105b516-3945-472a-ac0d-73d1c8d2ca9a",
								true,
							},
							
							{
								"15e7aab5-9869-0a8a-97b9-b244bfa85813",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Holy Cannon",
						targetType = "Current Target",
						uuid = "7d83daa1-0b25-c15e-b500-8db0c4b9fb7a",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionID = 41628,
						actionLua = "d(\"Dark\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = true\nself.used = true",
						atomicPriority = true,
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"6ede6f2b-f21f-34fc-ac8f-17712a883aee",
								true,
							},
							
							{
								"d0b43e22-df2c-0f03-8be1-bdf2445b9955",
								true,
							},
							
							{
								"77dacb34-4585-2f97-b047-6d25037d5a9d",
								true,
							},
							
							{
								"49cb19e1-4a1a-e643-887b-eb61c1a7bd65",
								true,
							},
							
							{
								"66bc9b98-7d55-baeb-b9e2-e1aa2b7051a8",
								true,
							},
							
							{
								"1d7f30fc-f7cf-3867-a8b8-6601387d3fa4",
								true,
							},
							
							{
								"5b3f266a-5288-d0e4-80b4-04427cb46548",
								true,
							},
							
							{
								"15e7aab5-9869-0a8a-97b9-b244bfa85813",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						ignoreWeaveRules = true,
						name = "Dark Cannon",
						targetType = "Current Target",
						uuid = "27829bfe-ad66-2d8b-a078-e38abda7d099",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionID = 41629,
						actionLua = "d(\"Shock\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = true\nself.used = true",
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"6ede6f2b-f21f-34fc-ac8f-17712a883aee",
								true,
							},
							
							{
								"d0b43e22-df2c-0f03-8be1-bdf2445b9955",
								true,
							},
							
							{
								"77dacb34-4585-2f97-b047-6d25037d5a9d",
								true,
							},
							
							{
								"49cb19e1-4a1a-e643-887b-eb61c1a7bd65",
								true,
							},
							
							{
								"66bc9b98-7d55-baeb-b9e2-e1aa2b7051a8",
								true,
							},
							
							{
								"2365f6f4-9905-7276-a633-a8945808890d",
								true,
							},
							
							{
								"5b3f266a-5288-d0e4-80b4-04427cb46548",
								true,
							},
							
							{
								"15e7aab5-9869-0a8a-97b9-b244bfa85813",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Shock Cannon",
						targetType = "Current Target",
						uuid = "3f2a6a8d-e850-7f8d-a10b-a621a4a2b87c",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionID = 41626,
						actionLua = "d(\"Phantom\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						atomicPriority = true,
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"6ede6f2b-f21f-34fc-ac8f-17712a883aee",
								true,
							},
							
							{
								"d0b43e22-df2c-0f03-8be1-bdf2445b9955",
								true,
							},
							
							{
								"77dacb34-4585-2f97-b047-6d25037d5a9d",
								true,
							},
							
							{
								"49cb19e1-4a1a-e643-887b-eb61c1a7bd65",
								true,
							},
							
							{
								"e7a10bc3-099f-e3a0-9120-15eaf7e935ea",
								true,
							},
							
							{
								"15e7aab5-9869-0a8a-97b9-b244bfa85813",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						ignoreWeaveRules = true,
						name = "Phantom Fire",
						targetType = "Current Target",
						uuid = "4a955ee5-d665-fe9c-9660-3a0a5bfea657",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "6ede6f2b-f21f-34fc-ac8f-17712a883aee",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4366,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Cannoneer",
						uuid = "d0b43e22-df2c-0f03-8be1-bdf2445b9955",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "77dacb34-4585-2f97-b047-6d25037d5a9d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "49cb19e1-4a1a-e643-887b-eb61c1a7bd65",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "66bc9b98-7d55-baeb-b9e2-e1aa2b7051a8",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 7,
						buffDuration = 35,
						buffID = 4264,
						buffIDList = 
						{
							4264,
						},
						comparator = 2,
						dequeueIfLuaFalse = true,
						name = "Silver Sickness <= 35s",
						uuid = "5a850803-fc48-8ace-a599-32068f92f43f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,35):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Silver Cannon",
						uuid = "f3f536e5-c709-78f6-add9-bf5e997cf396",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,32):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Holy Cannon",
						uuid = "9d90a354-122d-1e4a-9766-d03e2dce7797",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41627,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "G1 Cannons CD <= 3s",
						uuid = "6105b516-3945-472a-ac0d-73d1c8d2ca9a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,33):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Dark Cannon",
						uuid = "1d7f30fc-f7cf-3867-a8b8-6601387d3fa4",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,34):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Shock Cannon",
						uuid = "2365f6f4-9905-7276-a633-a8945808890d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41628,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "G2 Cannons CD <= 3s",
						uuid = "5b3f266a-5288-d0e4-80b4-04427cb46548",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41626,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Phantom Fire CD <= 3s",
						uuid = "e7a10bc3-099f-e3a0-9120-15eaf7e935ea",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Cannons\")",
						name = "Toggle",
						uuid = "15e7aab5-9869-0a8a-97b9-b244bfa85813",
						version = 3,
					},
				},
			},
			name = "P. Cannoneer Cannons",
			throttleTime = 1500,
			uuid = "8da73aae-57bf-86ea-9a65-353a607913dc",
			version = 2,
		},
		inheritedIndex = 39,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "ACR",
						conditions = 
						{
							
							{
								"3ebc6543-c8e2-5c0a-b15e-32f7d07734a7",
								true,
							},
							
							{
								"cc7e4724-c91b-2918-b01a-658bfe057266",
								true,
							},
							
							{
								"ffcb081e-e4a0-b915-a944-7bd08ffdac93",
								true,
							},
							
							{
								"c6d7e8d8-c757-16e7-8d01-e200423d2d85",
								true,
							},
							
							{
								"979c090b-4949-cadf-9069-22b20ccc8b6a",
								true,
							},
							
							{
								"bf68a577-031c-6da5-833a-a2af0df7dc0f",
								true,
							},
							
							{
								"fbeaa2f7-5090-d378-bf73-25d56b3a0f9b",
								true,
							},
							
							{
								"4d153190-820e-68f0-a7f6-cc91e785fd38",
								true,
							},
							
							{
								"ad103bca-ec76-a629-b028-f2bcac28294c",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction2",
						name = "Quickstep",
						uuid = "98b7a689-2218-a124-a57d-ffd7c6ed3ca1",
						variableIsHover = true,
						variableTogglesType = 2,
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
								"3ebc6543-c8e2-5c0a-b15e-32f7d07734a7",
								true,
							},
							
							{
								"cc7e4724-c91b-2918-b01a-658bfe057266",
								true,
							},
							
							{
								"ffcb081e-e4a0-b915-a944-7bd08ffdac93",
								true,
							},
							
							{
								"c6d7e8d8-c757-16e7-8d01-e200423d2d85",
								true,
							},
							
							{
								"979c090b-4949-cadf-9069-22b20ccc8b6a",
								true,
							},
							
							{
								"bf68a577-031c-6da5-833a-a2af0df7dc0f",
								true,
							},
							
							{
								"777ee56d-c235-d1b0-8cc7-1d3437cb1a64",
								true,
							},
							
							{
								"fbeaa2f7-5090-d378-bf73-25d56b3a0f9b",
								false,
							},
							
							{
								"065204d3-f420-4bc2-9e2b-f6b0e4431e91",
								true,
							},
							
							{
								"747b1c86-6e4b-ec5c-ae98-e8b9965f4da3",
								true,
							},
							
							{
								"4d153190-820e-68f0-a7f6-cc91e785fd38",
								true,
							},
							
							{
								"ad103bca-ec76-a629-b028-f2bcac28294c",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction2",
						name = "Refresh Quickstep",
						uuid = "305589a3-0e79-790e-a227-ec3a250153b7",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "In Occult Crescent",
						uuid = "3ebc6543-c8e2-5c0a-b15e-32f7d07734a7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4805,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is Dancer",
						uuid = "cc7e4724-c91b-2918-b01a-658bfe057266",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Is Bot Running",
						uuid = "ffcb081e-e4a0-b915-a944-7bd08ffdac93",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "c6d7e8d8-c757-16e7-8d01-e200423d2d85",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						name = "Self Living",
						uuid = "979c090b-4949-cadf-9069-22b20ccc8b6a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Self Missing Transcendent",
						uuid = "bf68a577-031c-6da5-833a-a2af0df7dc0f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "c2fdc327-8031-f6a9-adfe-685becae7175",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 46603,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Quickstep CD",
						uuid = "747b1c86-6e4b-ec5c-ae98-e8b9965f4da3",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil and TimeSince(data.ocCombatTimer) > 2400",
						dequeueIfLuaFalse = true,
						name = "Combat > 2.4s",
						uuid = "777ee56d-c235-d1b0-8cc7-1d3437cb1a64",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return true",
						dequeueIfLuaFalse = true,
						name = "Flip To Disable Action",
						uuid = "4d153190-820e-68f0-a7f6-cc91e785fd38",
						version = 3,
					},
					inheritedIndex = 10,
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 4798,
						category = "Self",
						name = "Self Missing Quickstep",
						uuid = "fbeaa2f7-5090-d378-bf73-25d56b3a0f9b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 3,
						buffDuration = 9.5030002593994,
						buffID = 4798,
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						name = "Self Quickstep Fading",
						uuid = "065204d3-f420-4bc2-9e2b-f6b0e4431e91",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Quickstep\")",
						name = "Toggle",
						uuid = "ad103bca-ec76-a629-b028-f2bcac28294c",
						version = 3,
					},
				},
			},
			name = "P. Dancer Quickstep",
			throttleTime = 100,
			uuid = "440e18ac-f040-ecee-9e98-d8b712ea8b11",
			version = 2,
		},
		inheritedIndex = 40,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "ACR",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"3ebc6543-c8e2-5c0a-b15e-32f7d07734a7",
								true,
							},
							
							{
								"cc7e4724-c91b-2918-b01a-658bfe057266",
								true,
							},
							
							{
								"ffcb081e-e4a0-b915-a944-7bd08ffdac93",
								true,
							},
							
							{
								"c6d7e8d8-c757-16e7-8d01-e200423d2d85",
								true,
							},
							
							{
								"979c090b-4949-cadf-9069-22b20ccc8b6a",
								true,
							},
							
							{
								"bf68a577-031c-6da5-833a-a2af0df7dc0f",
								true,
							},
							
							{
								"3fd43f44-9d54-5f0a-8bbb-fd9b4d494836",
								true,
							},
							
							{
								"4d153190-820e-68f0-a7f6-cc91e785fd38",
								true,
							},
							
							{
								"3ce16bf9-491f-aa67-9f46-79c56d2ff009",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction1",
						name = "Dance",
						uuid = "e68bd3d3-bf3f-0cca-8b76-fa15c75071d4",
						variableIsHover = true,
						variableTogglesType = 2,
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
								"3ebc6543-c8e2-5c0a-b15e-32f7d07734a7",
								true,
							},
							
							{
								"cc7e4724-c91b-2918-b01a-658bfe057266",
								true,
							},
							
							{
								"ffcb081e-e4a0-b915-a944-7bd08ffdac93",
								true,
							},
							
							{
								"c6d7e8d8-c757-16e7-8d01-e200423d2d85",
								true,
							},
							
							{
								"979c090b-4949-cadf-9069-22b20ccc8b6a",
								true,
							},
							
							{
								"bf68a577-031c-6da5-833a-a2af0df7dc0f",
								true,
							},
							
							{
								"d3e9d860-2ff5-bbdc-831b-c5f4d700c6dc",
								true,
							},
							
							{
								"c2fdc327-8031-f6a9-adfe-685becae7175",
								true,
							},
							
							{
								"777ee56d-c235-d1b0-8cc7-1d3437cb1a64",
								true,
							},
							
							{
								"e1546784-6031-f108-9f38-babbba729c86",
								true,
							},
							
							{
								"4d153190-820e-68f0-a7f6-cc91e785fd38",
								true,
							},
							
							{
								"3ce16bf9-491f-aa67-9f46-79c56d2ff009",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction1",
						name = "Dance: Phantom Sword",
						targetType = "Current Target",
						uuid = "9b67dafc-7341-6c66-8766-79dcb2d58c53",
						variableIsHover = true,
						variableTogglesType = 2,
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
								"3ebc6543-c8e2-5c0a-b15e-32f7d07734a7",
								true,
							},
							
							{
								"cc7e4724-c91b-2918-b01a-658bfe057266",
								true,
							},
							
							{
								"ffcb081e-e4a0-b915-a944-7bd08ffdac93",
								true,
							},
							
							{
								"c6d7e8d8-c757-16e7-8d01-e200423d2d85",
								true,
							},
							
							{
								"979c090b-4949-cadf-9069-22b20ccc8b6a",
								true,
							},
							
							{
								"bf68a577-031c-6da5-833a-a2af0df7dc0f",
								true,
							},
							
							{
								"5c7be5da-34bf-34f8-951a-a6dae5fe0f36",
								true,
							},
							
							{
								"c2fdc327-8031-f6a9-adfe-685becae7175",
								true,
							},
							
							{
								"777ee56d-c235-d1b0-8cc7-1d3437cb1a64",
								true,
							},
							
							{
								"e1546784-6031-f108-9f38-babbba729c86",
								true,
							},
							
							{
								"4d153190-820e-68f0-a7f6-cc91e785fd38",
								true,
							},
							
							{
								"3ce16bf9-491f-aa67-9f46-79c56d2ff009",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction1",
						name = "Dance: Tempting Tango",
						targetType = "Current Target",
						uuid = "1d306c69-bc8c-9496-8052-629eff7be9ff",
						variableIsHover = true,
						variableTogglesType = 2,
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
								"3ebc6543-c8e2-5c0a-b15e-32f7d07734a7",
								true,
							},
							
							{
								"cc7e4724-c91b-2918-b01a-658bfe057266",
								true,
							},
							
							{
								"ffcb081e-e4a0-b915-a944-7bd08ffdac93",
								true,
							},
							
							{
								"c6d7e8d8-c757-16e7-8d01-e200423d2d85",
								true,
							},
							
							{
								"979c090b-4949-cadf-9069-22b20ccc8b6a",
								true,
							},
							
							{
								"bf68a577-031c-6da5-833a-a2af0df7dc0f",
								true,
							},
							
							{
								"bae16e82-5245-c811-8148-2f59e592582a",
								true,
							},
							
							{
								"c2fdc327-8031-f6a9-adfe-685becae7175",
								true,
							},
							
							{
								"777ee56d-c235-d1b0-8cc7-1d3437cb1a64",
								true,
							},
							
							{
								"e1546784-6031-f108-9f38-babbba729c86",
								true,
							},
							
							{
								"4d153190-820e-68f0-a7f6-cc91e785fd38",
								true,
							},
							
							{
								"3ce16bf9-491f-aa67-9f46-79c56d2ff009",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction1",
						name = "Dance: Jitterbug",
						targetType = "Current Target",
						uuid = "6bcaf85b-a8ce-e946-8294-e4f709a95fce",
						variableIsHover = true,
						variableTogglesType = 2,
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
								"3ebc6543-c8e2-5c0a-b15e-32f7d07734a7",
								true,
							},
							
							{
								"cc7e4724-c91b-2918-b01a-658bfe057266",
								true,
							},
							
							{
								"ffcb081e-e4a0-b915-a944-7bd08ffdac93",
								true,
							},
							
							{
								"c6d7e8d8-c757-16e7-8d01-e200423d2d85",
								true,
							},
							
							{
								"979c090b-4949-cadf-9069-22b20ccc8b6a",
								true,
							},
							
							{
								"bf68a577-031c-6da5-833a-a2af0df7dc0f",
								true,
							},
							
							{
								"5b9e741d-4130-3110-bf65-b4b6212e7ca2",
								true,
							},
							
							{
								"c2fdc327-8031-f6a9-adfe-685becae7175",
								true,
							},
							
							{
								"777ee56d-c235-d1b0-8cc7-1d3437cb1a64",
								true,
							},
							
							{
								"e1546784-6031-f108-9f38-babbba729c86",
								true,
							},
							
							{
								"4d153190-820e-68f0-a7f6-cc91e785fd38",
								true,
							},
							
							{
								"3ce16bf9-491f-aa67-9f46-79c56d2ff009",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction1",
						name = "Dance: Mystery Waltz",
						targetType = "Current Target",
						uuid = "4b1b3f6a-c3fe-f4c4-9b56-a28d7b170a4f",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"3ebc6543-c8e2-5c0a-b15e-32f7d07734a7",
								true,
							},
							
							{
								"cc7e4724-c91b-2918-b01a-658bfe057266",
								true,
							},
							
							{
								"500e7941-74f4-d140-9059-c4f298bc2c3f",
								true,
							},
							
							{
								"c6d7e8d8-c757-16e7-8d01-e200423d2d85",
								false,
							},
							
							{
								"4d153190-820e-68f0-a7f6-cc91e785fd38",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Dequeue Dance OOC",
						uuid = "0e9fbbc8-ce8f-3328-9cee-1359861f2397",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "In Occult Crescent",
						uuid = "3ebc6543-c8e2-5c0a-b15e-32f7d07734a7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4805,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is Dancer",
						uuid = "cc7e4724-c91b-2918-b01a-658bfe057266",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Is Bot Running",
						uuid = "ffcb081e-e4a0-b915-a944-7bd08ffdac93",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "c6d7e8d8-c757-16e7-8d01-e200423d2d85",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						name = "Self Living",
						uuid = "979c090b-4949-cadf-9069-22b20ccc8b6a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Self Missing Transcendent",
						uuid = "bf68a577-031c-6da5-833a-a2af0df7dc0f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "c2fdc327-8031-f6a9-adfe-685becae7175",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 46598,
						buffCheckType = 2,
						buffID = 4232,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Dance CD",
						uuid = "3fd43f44-9d54-5f0a-8bbb-fd9b4d494836",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "e1546784-6031-f108-9f38-babbba729c86",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil and TimeSince(data.ocCombatTimer) > 2400",
						dequeueIfLuaFalse = true,
						name = "Combat > 2.4s",
						uuid = "777ee56d-c235-d1b0-8cc7-1d3437cb1a64",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4794,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Can Dance: Phantom Sword",
						uuid = "d3e9d860-2ff5-bbdc-831b-c5f4d700c6dc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4795,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Can Dance: Tempting Tango",
						uuid = "5c7be5da-34bf-34f8-951a-a6dae5fe0f36",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4796,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Can Dance: Jitterbug",
						uuid = "bae16e82-5245-c811-8148-2f59e592582a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4797,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Can Dance: Mystery Waltz",
						uuid = "5b9e741d-4130-3110-bf65-b4b6212e7ca2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] == true",
						dequeueIfLuaFalse = true,
						name = "Is Dance Queued",
						uuid = "500e7941-74f4-d140-9059-c4f298bc2c3f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return true",
						dequeueIfLuaFalse = true,
						name = "Flip To Disable Action",
						uuid = "4d153190-820e-68f0-a7f6-cc91e785fd38",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Dance\")",
						name = "Toggle",
						uuid = "3ce16bf9-491f-aa67-9f46-79c56d2ff009",
						version = 3,
					},
				},
			},
			name = "P. Dancer Dance",
			throttleTime = 100,
			uuid = "cad90044-bdeb-56c9-ae85-48db84ef4abc",
			version = 2,
		},
		inheritedIndex = 41,
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
						actionLua = "d(\"Avoid Starfall AOE\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"90bd2c89-b805-648a-943e-2651ec846a83",
								true,
							},
							
							{
								"fca8e097-eb58-55db-8cbe-c09478e3b8c4",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Avoid Starfall Incoming AOE",
						uuid = "c9e48789-caa4-8e96-8c32-da86be522993",
						version = 2.1,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Avoid Suicide\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"89cd4f40-9c8d-d5df-9afd-70c398c173b4",
								true,
							},
							
							{
								"3d9c3f4a-8ce0-f2d3-b8b1-12171b7f545a",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Avoid Suicide",
						uuid = "9fbf0baa-858f-9f38-908e-a73861e24981",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Avoid Starfall Raidwide\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"90bd2c89-b805-648a-943e-2651ec846a83",
								true,
							},
							
							{
								"5f8d1ae3-46bc-c924-b723-8fcaf972e588",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Avoid Starfall Incoming Raidwide",
						uuid = "b5b4d8fb-a955-df08-bdab-846e151c3443",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Judgement Expiring\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"93783665-3a39-218a-b4c7-05aeb1a3a810",
								true,
							},
							
							{
								"7ff1f06b-6b0b-6d46-9485-a73af78c7796",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Judgement Expiring",
						uuid = "d16d64a3-4a34-d445-a679-a04eb6ee71f4",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Judgement Heal Self\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"93783665-3a39-218a-b4c7-05aeb1a3a810",
								true,
							},
							
							{
								"8b811cff-e495-3a1a-82de-ac18b1db3488",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Judgement Heal Self",
						uuid = "a2e00158-dfb3-0cf7-bf6f-b7c07d984820",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Judgement Heal Party\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"93783665-3a39-218a-b4c7-05aeb1a3a810",
								true,
							},
							
							{
								"c5a030dc-35ca-0d59-b78b-5192da2dbeb1",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Judgement Heal Party",
						uuid = "0aaea4ed-72b9-6d8d-8dcf-01d93020b077",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Judgement Range\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"93783665-3a39-218a-b4c7-05aeb1a3a810",
								true,
							},
							
							{
								"03bfca6e-1de2-8b8d-aff6-d37b42f92737",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Judgement Range",
						uuid = "28391740-dbc0-873f-863b-1be55a9ae95c",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Judgement Heal Self\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"93783665-3a39-218a-b4c7-05aeb1a3a810",
								true,
							},
							
							{
								"7ff1f06b-6b0b-6d46-9485-a73af78c7796",
								true,
							},
							
							{
								"8b811cff-e495-3a1a-82de-ac18b1db3488",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Judgement Heal Self",
						uuid = "9ea53d04-334f-976b-ab7f-01a100e1184b",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Judgement Heal Party\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"93783665-3a39-218a-b4c7-05aeb1a3a810",
								true,
							},
							
							{
								"7ff1f06b-6b0b-6d46-9485-a73af78c7796",
								true,
							},
							
							{
								"c5a030dc-35ca-0d59-b78b-5192da2dbeb1",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Judgement Heal Party",
						uuid = "d3445634-2d11-25bd-a024-2b2201d290bc",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Cleansing Expiring\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"93bd23e8-5273-57ec-8a76-b5c3e6af25c2",
								true,
							},
							
							{
								"7ff1f06b-6b0b-6d46-9485-a73af78c7796",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Cleansing Expiring",
						uuid = "f5e195a1-40b1-0d84-86ec-3593694c1212",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Avoid Starfall HP\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"90bd2c89-b805-648a-943e-2651ec846a83",
								true,
							},
							
							{
								"d0114ab1-f77d-bcda-b85a-1193128632d9",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Avoid Starfall HP",
						uuid = "3b198a46-3c08-ea17-9888-3e563681bb74",
						version = 2.1,
					},
					inheritedIndex = 11,
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Cleansing HP\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"93bd23e8-5273-57ec-8a76-b5c3e6af25c2",
								true,
							},
							
							{
								"45342af4-4935-a543-888f-f175121b510a",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Cleansing HP",
						uuid = "00e024d7-2e1c-1da2-a10b-730f4be95b89",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Cleansing Range\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"93bd23e8-5273-57ec-8a76-b5c3e6af25c2",
								true,
							},
							
							{
								"03bfca6e-1de2-8b8d-aff6-d37b42f92737",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Cleansing Range",
						uuid = "bf160465-9564-9a60-b273-2e9f28a05f7d",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Cleansing\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"93bd23e8-5273-57ec-8a76-b5c3e6af25c2",
								true,
							},
							
							{
								"7ff1f06b-6b0b-6d46-9485-a73af78c7796",
								true,
							},
							
							{
								"03bfca6e-1de2-8b8d-aff6-d37b42f92737",
								true,
							},
							
							{
								"45342af4-4935-a543-888f-f175121b510a",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Cleansing",
						uuid = "926853c0-f80c-8b24-ab70-7b8d0536d818",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Blessing Expiring\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"902b4fee-08f0-ccc3-93e5-8387b8bdba36",
								true,
							},
							
							{
								"7ff1f06b-6b0b-6d46-9485-a73af78c7796",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Blessing Expiring",
						uuid = "9d73265f-54c8-35b6-a024-2af1c9f72da4",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Blessing Heal Self\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"902b4fee-08f0-ccc3-93e5-8387b8bdba36",
								true,
							},
							
							{
								"ca2e91c7-e9ed-3e99-86e7-f8e32e91062f",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Blessing Heal Self",
						uuid = "b21145a4-b38d-b20e-909f-2232eba0b2df",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Blessing Heal Party\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"902b4fee-08f0-ccc3-93e5-8387b8bdba36",
								true,
							},
							
							{
								"e5546d6b-eaa9-44d6-84f5-dd3c73e379d2",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Blessing Heal Party",
						uuid = "80d1e0ab-2bf4-d8b1-ab19-2f6888beab95",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Blessing Heal Self\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"902b4fee-08f0-ccc3-93e5-8387b8bdba36",
								true,
							},
							
							{
								"7ff1f06b-6b0b-6d46-9485-a73af78c7796",
								true,
							},
							
							{
								"ca2e91c7-e9ed-3e99-86e7-f8e32e91062f",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Blessing Heal Self",
						uuid = "5d2b3e66-2450-2444-97a1-9c8a9814c7c4",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Blessing Heal Party\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"902b4fee-08f0-ccc3-93e5-8387b8bdba36",
								true,
							},
							
							{
								"7ff1f06b-6b0b-6d46-9485-a73af78c7796",
								true,
							},
							
							{
								"e5546d6b-eaa9-44d6-84f5-dd3c73e379d2",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Blessing Heal Party",
						uuid = "3558f6d8-52e5-f450-9a27-564a190a0aad",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Starfall Expiring\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"90d5d356-377c-d333-89cc-42097385bb58",
								true,
							},
							
							{
								"7ff1f06b-6b0b-6d46-9485-a73af78c7796",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Starfall Expiring",
						uuid = "07d9df36-64fb-a3fc-bf11-2af4a56c8607",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Starfall HP\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"90d5d356-377c-d333-89cc-42097385bb58",
								true,
							},
							
							{
								"d0114ab1-f77d-bcda-b85a-1193128632d9",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Starfall HP",
						uuid = "7d46c830-898c-cc59-b6f3-47f2ee061469",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Starfall AOE\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"90d5d356-377c-d333-89cc-42097385bb58",
								true,
							},
							
							{
								"fca8e097-eb58-55db-8cbe-c09478e3b8c4",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Starfall AOE",
						uuid = "482c679c-a9d1-7f4e-bf19-279621eef893",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Starfall Raidwide\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"90d5d356-377c-d333-89cc-42097385bb58",
								true,
							},
							
							{
								"5f8d1ae3-46bc-c924-b723-8fcaf972e588",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Starfall Raidwide",
						uuid = "84a31664-323c-6654-9adc-682f7e81ff77",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Stop Starfall Range\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"90d5d356-377c-d333-89cc-42097385bb58",
								true,
							},
							
							{
								"03bfca6e-1de2-8b8d-aff6-d37b42f92737",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Stop Starfall Range",
						uuid = "78d6fb3f-532d-bc68-aff0-574ba9347f40",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "d(\"Starfall\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"1dab3d74-cd88-7842-9407-fc9bf278a861",
								true,
							},
							
							{
								"90d5d356-377c-d333-89cc-42097385bb58",
								true,
							},
							
							{
								"7ff1f06b-6b0b-6d46-9485-a73af78c7796",
								true,
							},
							
							{
								"03bfca6e-1de2-8b8d-aff6-d37b42f92737",
								true,
							},
							
							{
								"d0114ab1-f77d-bcda-b85a-1193128632d9",
								true,
							},
							
							{
								"fca8e097-eb58-55db-8cbe-c09478e3b8c4",
								false,
							},
							
							{
								"5f8d1ae3-46bc-c924-b723-8fcaf972e588",
								false,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Starfall",
						uuid = "03079be3-c6fc-b719-b08f-870e71da59ce",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						buffID = 4368,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Oracle",
						uuid = "b7995653-e4e2-e753-91d9-89e71703711c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Is Bot Running",
						uuid = "1dab3d74-cd88-7842-9407-fc9bf278a861",
						version = 3,
					},
					inheritedIndex = 2,
				},
				
				{
					data = 
					{
						buffID = 4265,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Has Judgement",
						uuid = "93783665-3a39-218a-b4c7-05aeb1a3a810",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4266,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Has Cleansing",
						uuid = "93bd23e8-5273-57ec-8a76-b5c3e6af25c2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4267,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Has Blessing",
						uuid = "902b4fee-08f0-ccc3-93e5-8387b8bdba36",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4268,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Has Starfall",
						uuid = "90d5d356-377c-d333-89cc-42097385bb58",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 5,
						buffID = 4265,
						buffIDList = 
						{
							4265,
							4266,
							4267,
							4268,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Has Predicts",
						uuid = "89cd4f40-9c8d-d5df-9afd-70c398c173b4",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Party",
						comparator = 2,
						conditionType = 4,
						inRangeValue = 20,
						name = "Range - 20y",
						partyTargetType = "Detection Target",
						uuid = "6c75bd01-ee49-a6f7-9621-25854eb1a9d9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 7,
						buffDuration = 0.80000001192093,
						buffIDList = 
						{
							4265,
							4266,
							4267,
							4268,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Predict Not Expiring",
						uuid = "7ff1f06b-6b0b-6d46-9485-a73af78c7796",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 20,
						name = "Target <= 20y",
						uuid = "03bfca6e-1de2-8b8d-aff6-d37b42f92737",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 95,
						name = "Self HP >= 95%",
						uuid = "d0114ab1-f77d-bcda-b85a-1193128632d9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						comparator = 2,
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 60,
						name = "Self HP <= 60%",
						uuid = "8b811cff-e495-3a1a-82de-ac18b1db3488",
						version = 3,
					},
					inheritedIndex = 12,
				},
				
				{
					data = 
					{
						category = "Self",
						comparator = 2,
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 92,
						name = "Self HP <= 92%",
						uuid = "45342af4-4935-a543-888f-f175121b510a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						comparator = 2,
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						name = "Self HP <= 30%",
						uuid = "ca2e91c7-e9ed-3e99-86e7-f8e32e91062f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Party",
						comparator = 2,
						conditionType = 2,
						hpValue = 60,
						name = "HP - 60%",
						partyTargetType = "Detection Target",
						uuid = "719eacd0-1e7f-4dc5-b935-49c94ac8e657",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Party",
						comparator = 2,
						conditionType = 2,
						hpValue = 30,
						name = "HP - 30%",
						partyTargetType = "Detection Target",
						uuid = "b8396ed7-b2fe-05d8-a878-4de57d821578",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Filter",
						conditionType = 2,
						conditions = 
						{
							
							{
								"6c75bd01-ee49-a6f7-9621-25854eb1a9d9",
								true,
							},
							
							{
								"719eacd0-1e7f-4dc5-b935-49c94ac8e657",
								true,
							},
						},
						dequeueIfLuaFalse = true,
						filterTargetType = "Party",
						name = "AOE 60% @ 20y",
						partyTargetNumber = 5,
						uuid = "c5a030dc-35ca-0d59-b78b-5192da2dbeb1",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Filter",
						conditionType = 2,
						conditions = 
						{
							
							{
								"6c75bd01-ee49-a6f7-9621-25854eb1a9d9",
								true,
							},
							
							{
								"b8396ed7-b2fe-05d8-a878-4de57d821578",
								true,
							},
						},
						dequeueIfLuaFalse = true,
						filterTargetType = "Party",
						name = "AOE 30% @ 20y",
						partyTargetNumber = 5,
						uuid = "e5546d6b-eaa9-44d6-84f5-dd3c73e379d2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.oraclePredictCounter == 3 and data.oraclePredictStarfall == false",
						dequeueIfLuaFalse = true,
						name = "Starfall Is Last",
						uuid = "90bd2c89-b805-648a-943e-2651ec846a83",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.oraclePredictCounter == 4",
						dequeueIfLuaFalse = true,
						name = "Is Last Predict",
						uuid = "3d9c3f4a-8ce0-f2d3-b8b1-12171b7f545a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local dangerTime = 1.5\nlocal safetyTime = 3\n\nlocal player = TensorCore.mGetPlayer()\nlocal playerPos = player.pos\n\nlocal function getRemainingTime(entity)\n\tif not entity then return nil end\n\treturn entity.castinginfo.casttime - entity.castinginfo.channeltime\nend\n\nlocal function getPredictDuration()\n\tfor _, buffID in ipairs({4265, 4266, 4267}) do\n\t\tlocal buff = TensorCore.getBuff(player.id, buffID)\n\t\tif buff then\n\t\t\treturn buff.duration\n\t\tend\n\tend\n\treturn 0\nend\n\nlocal function willBoom(remainingTime, aoeType)\n\tif remainingTime <= dangerTime then\n\t\td(aoeType .. \" AOE GONNA GO BOOM!!!\")\n\t\treturn true\n\telseif data.oraclePredictCounter == 3 and not data.oraclePredictStarfall then\n\t\tlocal predictDuration = getPredictDuration()\n\t\tif remainingTime > predictDuration and remainingTime <= safetyTime then\n\t\t\td(aoeType .. \" AOE GONNA GO BOOM DURING STARFALL!!!\")\n\t\t\treturn true\n\t\tend\n\tend\n\treturn false\nend\n\nif TensorCore.Avoidance.inAnyAOE(playerPos.x, playerPos.y, playerPos.z) and table.size(data.ocAOETbl) > 0 then\n\tfor _, aoe in pairs(data.ocAOETbl) do\n\t\tlocal entityID, aoePos, aoeLength, aoeWidth = aoe.entityID, aoe.aoePos, aoe.aoeLength, aoe.aoeWidth\n\t\tlocal distToAOE = TensorCore.getDistance2d(playerPos, aoePos)\n\t\tlocal entity = TensorCore.mGetEntity(entityID)\n\t\tlocal remainingTime = getRemainingTime(entity)\n\t\tlocal castType = aoe.aoeCastType\n\n\t\tif aoeWidth > 0 or castType == 11 then -- Line/Cross\n\t\t\tif distToAOE <= aoeLength then\n\t\t\t\tlocal heading = aoe.aoeHeading\n\t\t\t\tlocal dirX, dirZ = math.sin(heading), math.cos(heading)\n\t\t\t\tlocal relX, relZ = playerPos.x - aoePos.x, playerPos.z - aoePos.z\n\t\t\t\tlocal forward = (relX * dirX) + (relZ * dirZ)\n\t\t\t\tlocal side = (-relX * dirZ) + (relZ * dirX)\n\t\t\t\tlocal halfWidth = aoeWidth / 2\n\t\t\t\t\n\t\t\t\tif castType == 11 then\n\t\t\t\t\tlocal inVertical = math.abs(forward) <= aoeLength and math.abs(side) <= halfWidth\n\t\t\t\t\tlocal inHorizontal = math.abs(side) <= aoeLength and math.abs(forward) <= halfWidth\n\n\t\t\t\t\tif inVertical or inHorizontal then\n\t\t\t\t\t\tif willBoom(remainingTime, \"Cross\") then return true end\n\t\t\t\t\tend\n\t\t\t\telse\n\t\t\t\t\tif forward >= 0 and forward <= aoeLength and math.abs(side) <= (halfWidth) then\n\t\t\t\t\t\tif willBoom(remainingTime, \"Line\") then return true end\n\t\t\t\t\tend\n\t\t\t\tend\n\t\t\tend\n\t\telse\n\t\t\tlocal omen = aoe.aoeOmen or \"\"\n\t\t\tlocal subStr = omen:gsub(\"o\", \"\"):sub(6)\n\t\t\tlocal omenInfo = subStr:match(\"%D(%d+)%D\") or \"\"\n\t\t\tlocal aoeID = aoe.aoeID\n\n\t\t\tif #omenInfo == 4 or omen:match(\"don\") or omen:match(\"sircle\") or castType == 10 then -- Donut\n\t\t\t\tlocal omenInnerRadius = tonumber(omenInfo:sub(-2)) or 0\n\t\t\t\tlocal innerRadius = 10\n\t\t\t\tlocal telegraphDonut = MoogleTelegraphs.Settings.aoeIDUserSetDonuts[aoeID]\n\t\t\t\tif telegraphDonut then innerRadius = telegraphDonut.radius\n\t\t\t\telseif omenInnerRadius > 0 then innerRadius = omenInnerRadius\n\t\t\t\tend\n\n\t\t\t\tif distToAOE >= innerRadius and distToAOE <= aoeLength then\n\t\t\t\t\tif willBoom(remainingTime, \"Donut\") then return true end\n\t\t\t\tend\n\t\t\telseif (#omenInfo == 3 and not aoe.aoeIsAreaTarget) or omen:match(\"fan\") or castType == 3 or castType == 13 then -- Cone\n\t\t\t\tlocal omenAngle = tonumber(omenInfo) or 0\n\t\t\t\tlocal angle = 90\n\t\t\t\tlocal telegraphCone = MoogleTelegraphs.Settings.aoeIDUserSetCones[aoeID]\n\t\t\t\tif telegraphCone then angle = telegraphCone.angle\n\t\t\t\telseif omenAngle > 0 then angle = omenAngle\n\t\t\t\tend\n\n\t\t\t\tlocal heading = aoe.aoeHeading\n\t\t\t\tlocal dirX, dirZ = math.sin(heading), math.cos(heading)\n\t\t\t\tlocal relX, relZ = playerPos.x - aoePos.x, playerPos.z - aoePos.z\n\t\t\t\tlocal forward = (relX * dirX) + (relZ * dirZ)\n\t\t\t\tlocal halfAngle = angle / 2\n\t\t\t\tlocal cosAngle = math.cos(math.rad(halfAngle))\n\t\t\t\t\n\t\t\t\tif angle <= 180 then\n\t\t\t\t\tif (forward / distToAOE) >= cosAngle then\n\t\t\t\t\t\tif willBoom(remainingTime, \"Cone\") then return true end\n\t\t\t\t\tend\n\t\t\t\telse\n\t\t\t\t\tlocal invertedConeAngle = 180 - halfAngle\n    \t\t\t\tlocal cosInverted = math.cos(math.rad(invertedConeAngle))\n\n    \t\t\t\tif (forward / distToAOE) >= -cosInverted then\n        \t\t\t\tif willBoom(remainingTime, \"Cone\") then return true end\n\t\t\t\t\tend\n\t\t\t\tend\n\t\t\telse -- Circle/Meteor\n\t\t\t\tif distToAOE <= aoeLength then\n\t\t\t\t\tif willBoom(remainingTime, \"Circle\") then return true end\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\tend\nend\n\nreturn false",
						dequeueIfLuaFalse = true,
						name = "AOE Check",
						uuid = "fca8e097-eb58-55db-8cbe-c09478e3b8c4",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local dangerTime = 1.5\nlocal safetyTime = 3\n\nlocal raidwideIDs = { 41138, 41141, 41381, 41279, 41336, 41361, 41528, 41167, 41171, 41188, 41424, 41762, 37809, \n\t\t\t\t\t\t30790, 30788, 41333, 41412, 41689 }\n\nlocal target = TensorCore.mGetTarget()\n\nlocal function getPredictDuration()\n\tlocal playerID = TensorCore.mGetPlayer().id\n\tfor _, buffID in ipairs({4265, 4266, 4267}) do\n\t\tlocal buff = TensorCore.getBuff(playerID, buffID)\n\t\tif buff then\n\t\t\treturn buff.duration\n\t\tend\n\tend\n\treturn 0\nend\n\nlocal function willRaidwideBoom(remainingTime)\n\tif remainingTime <= dangerTime then\n\t\td(\"Raidwide GONNA GO BOOM!!!\")\n\t\treturn true\n\telseif data.oraclePredictCounter == 3 and not data.oraclePredictStarfall then\n\t\tlocal predictDuration = getPredictDuration()\n\t\tif remainingTime > predictDuration and remainingTime <= safetyTime then\n\t\t\td(\"Raidwide GONNA GO BOOM DURING STARFALL!!!\")\n\t\t\treturn true\n\t\tend\n\tend\n\treturn false\nend\n\nif target then\n\tlocal castingInfo = target.castinginfo\n\n\tfor _, raidwideID in ipairs(raidwideIDs) do\n\t\tif castingInfo.channelingid == raidwideID then\n\t\t\tlocal remainingTime = castingInfo.casttime - castingInfo.channeltime\n\t\t\tif willRaidwideBoom(remainingTime) then\n\t\t\t\treturn true\n\t\t\tend\n\t\tend\n\tend\nend\n\nreturn false",
						dequeueIfLuaFalse = true,
						name = "Raidwide Check",
						uuid = "5f8d1ae3-46bc-c924-b723-8fcaf972e588",
						version = 3,
					},
				},
			},
			name = "P. Oracle Predict",
			throttleTime = 100,
			uuid = "7a8b0ac9-1ab5-9b70-9c4c-08d91cc31515",
			version = 2,
		},
		inheritedIndex = 42,
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
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = true\nself.used = true",
						alertColor = -1,
						alertPriority = 3,
						alertText = "Low Spellblade",
						conditions = 
						{
							
							{
								"646f4741-2189-523d-b322-d342eff3b1ac",
								true,
							},
							
							{
								"56223365-8388-f8e6-85ad-ad4ae4271380",
								true,
							},
							
							{
								"6500ed18-f48e-10a5-9639-02727a1485c8",
								true,
							},
							
							{
								"bd520528-de6e-dd63-8c2f-b13e1078b8d5",
								true,
							},
							
							{
								"c3d8a1f7-5e92-4b3a-9c16-8f2d0e7a4b59",
								true,
							},
							
							{
								"d81c6985-e446-ec27-a6f7-63bff52ae445",
								true,
							},
							
							{
								"951c9b82-5570-bfd1-bfd6-30d778f703f4",
								true,
							},
							
							{
								"66a0e6e1-3fbc-1f2e-926b-1a64f77b30be",
								true,
							},
							
							{
								"b2873652-fafa-8116-85c3-0bcf9e9f225e",
								true,
							},
							
							{
								"85fc5f4c-f677-695e-b820-0f32505fcee4",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Self Blazing Missing",
						uuid = "b4bca4ee-8425-3c9d-b0d2-8a512a259c5d",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = true\nself.used = true",
						alertColor = -1,
						alertPriority = 3,
						alertText = "Low Spellblade",
						conditions = 
						{
							
							{
								"646f4741-2189-523d-b322-d342eff3b1ac",
								true,
							},
							
							{
								"56223365-8388-f8e6-85ad-ad4ae4271380",
								true,
							},
							
							{
								"6500ed18-f48e-10a5-9639-02727a1485c8",
								true,
							},
							
							{
								"bd520528-de6e-dd63-8c2f-b13e1078b8d5",
								true,
							},
							
							{
								"c3d8a1f7-5e92-4b3a-9c16-8f2d0e7a4b59",
								true,
							},
							
							{
								"d81c6985-e446-ec27-a6f7-63bff52ae445",
								true,
							},
							
							{
								"951c9b82-5570-bfd1-bfd6-30d778f703f4",
								true,
							},
							
							{
								"66a0e6e1-3fbc-1f2e-926b-1a64f77b30be",
								true,
							},
							
							{
								"76763df1-edbf-8932-8e24-33bea7bf4fc3",
								true,
							},
							
							{
								"85fc5f4c-f677-695e-b820-0f32505fcee4",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Target Blazing Missing",
						uuid = "03771955-c73d-5942-9491-cb6c6504547d",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = true\nself.used = true",
						alertColor = -1,
						alertPriority = 3,
						alertText = "Low Spellblade",
						conditions = 
						{
							
							{
								"646f4741-2189-523d-b322-d342eff3b1ac",
								true,
							},
							
							{
								"56223365-8388-f8e6-85ad-ad4ae4271380",
								true,
							},
							
							{
								"6500ed18-f48e-10a5-9639-02727a1485c8",
								true,
							},
							
							{
								"bd520528-de6e-dd63-8c2f-b13e1078b8d5",
								true,
							},
							
							{
								"c3d8a1f7-5e92-4b3a-9c16-8f2d0e7a4b59",
								true,
							},
							
							{
								"d81c6985-e446-ec27-a6f7-63bff52ae445",
								true,
							},
							
							{
								"951c9b82-5570-bfd1-bfd6-30d778f703f4",
								true,
							},
							
							{
								"66a0e6e1-3fbc-1f2e-926b-1a64f77b30be",
								true,
							},
							
							{
								"e69d5f82-fbef-17bd-8b3a-06007b5000ad",
								true,
							},
							
							{
								"85fc5f4c-f677-695e-b820-0f32505fcee4",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Self Blazing Duration <30",
						uuid = "79d2c2ea-2391-1577-adf9-ee3c294bee0e",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = true\nself.used = true",
						alertColor = -1,
						alertPriority = 3,
						alertText = "Low Spellblade",
						conditions = 
						{
							
							{
								"646f4741-2189-523d-b322-d342eff3b1ac",
								true,
							},
							
							{
								"56223365-8388-f8e6-85ad-ad4ae4271380",
								true,
							},
							
							{
								"6500ed18-f48e-10a5-9639-02727a1485c8",
								true,
							},
							
							{
								"bd520528-de6e-dd63-8c2f-b13e1078b8d5",
								true,
							},
							
							{
								"c3d8a1f7-5e92-4b3a-9c16-8f2d0e7a4b59",
								true,
							},
							
							{
								"d81c6985-e446-ec27-a6f7-63bff52ae445",
								true,
							},
							
							{
								"daacf4f1-a442-964a-be27-431565da9a6d",
								true,
							},
							
							{
								"a5553312-db6f-f02c-bb2c-8850332433a2",
								true,
							},
							
							{
								"951c9b82-5570-bfd1-bfd6-30d778f703f4",
								false,
							},
							
							{
								"85fc5f4c-f677-695e-b820-0f32505fcee4",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Holy Blade (no Blazing)",
						uuid = "a7f3c1d2-9e84-4b56-8c21-5d7a0e3f9b12",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = true\nself.used = true",
						alertColor = -1,
						alertPriority = 3,
						alertText = "Low Spellblade",
						conditions = 
						{
							
							{
								"646f4741-2189-523d-b322-d342eff3b1ac",
								true,
							},
							
							{
								"56223365-8388-f8e6-85ad-ad4ae4271380",
								true,
							},
							
							{
								"6500ed18-f48e-10a5-9639-02727a1485c8",
								true,
							},
							
							{
								"bd520528-de6e-dd63-8c2f-b13e1078b8d5",
								true,
							},
							
							{
								"c3d8a1f7-5e92-4b3a-9c16-8f2d0e7a4b59",
								true,
							},
							
							{
								"d81c6985-e446-ec27-a6f7-63bff52ae445",
								true,
							},
							
							{
								"daacf4f1-a442-964a-be27-431565da9a6d",
								true,
							},
							
							{
								"a5553312-db6f-f02c-bb2c-8850332433a2",
								true,
							},
							
							{
								"b2873652-fafa-8116-85c3-0bcf9e9f225e",
								false,
							},
							
							{
								"e69d5f82-fbef-17bd-8b3a-06007b5000ad",
								false,
							},
							
							{
								"85fc5f4c-f677-695e-b820-0f32505fcee4",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Holy Blade if unlocked",
						uuid = "c1ad4b8c-37e9-2214-8d55-20e9dae89648",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"646f4741-2189-523d-b322-d342eff3b1ac",
								true,
							},
							
							{
								"56223365-8388-f8e6-85ad-ad4ae4271380",
								true,
							},
							
							{
								"6500ed18-f48e-10a5-9639-02727a1485c8",
								true,
							},
							
							{
								"bd520528-de6e-dd63-8c2f-b13e1078b8d5",
								true,
							},
							
							{
								"c3d8a1f7-5e92-4b3a-9c16-8f2d0e7a4b59",
								true,
							},
							
							{
								"d81c6985-e446-ec27-a6f7-63bff52ae445",
								true,
							},
							
							{
								"f660e488-8ee9-147a-a731-27ff9701aaf6",
								true,
							},
							
							{
								"fb8ebcda-f865-6a5c-a568-729538b3195d",
								true,
							},
							
							{
								"85fc5f4c-f677-695e-b820-0f32505fcee4",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Revert to Sundering",
						uuid = "5e6fc821-6102-2f72-bd1d-e78d5e9a7bdb",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "Occult Crescent",
						uuid = "646f4741-2189-523d-b322-d342eff3b1ac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4803,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is Mystic Knight",
						uuid = "56223365-8388-f8e6-85ad-ad4ae4271380",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "6500ed18-f48e-10a5-9639-02727a1485c8",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "bd520528-de6e-dd63-8c2f-b13e1078b8d5",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return true",
						dequeueIfLuaFalse = true,
						name = "Toggle",
						uuid = "d81c6985-e446-ec27-a6f7-63bff52ae445",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return (ActionList:Get(5,31):CanCastResult() ~= 579)",
						dequeueIfLuaFalse = true,
						name = "Sundering Unlocked",
						uuid = "f660e488-8ee9-147a-a731-27ff9701aaf6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 46591,
						buffCheckType = 2,
						buffID = 4232,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Sundering Available",
						uuid = "fb8ebcda-f865-6a5c-a568-729538b3195d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return (ActionList:Get(5,33):CanCastResult() ~= 579)",
						dequeueIfLuaFalse = true,
						name = "Holy Unlocked",
						uuid = "daacf4f1-a442-964a-be27-431565da9a6d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 46592,
						buffCheckType = 2,
						buffID = 4232,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Holy Available",
						uuid = "a5553312-db6f-f02c-bb2c-8850332433a2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return (ActionList:Get(5,34):CanCastResult() ~= 579)",
						dequeueIfLuaFalse = true,
						name = "Blazing Unlocked",
						uuid = "951c9b82-5570-bfd1-bfd6-30d778f703f4",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 46593,
						buffCheckType = 2,
						buffID = 4232,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Blazing Available",
						uuid = "66a0e6e1-3fbc-1f2e-926b-1a64f77b30be",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffDuration = 30,
						buffID = 4790,
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						name = "Self Blazing Missing",
						uuid = "b2873652-fafa-8116-85c3-0bcf9e9f225e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 3,
						buffDuration = 30,
						buffID = 4790,
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						name = "Self Blazing Duration",
						uuid = "e69d5f82-fbef-17bd-8b3a-06007b5000ad",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffDuration = 30,
						buffID = 4791,
						comparator = 2,
						dequeueIfLuaFalse = true,
						name = "Target Blazing Missing",
						uuid = "76763df1-edbf-8932-8e24-33bea7bf4fc3",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 3,
						buffDuration = 30,
						buffID = 4791,
						comparator = 2,
						dequeueIfLuaFalse = true,
						name = "Target Blazing Duration",
						uuid = "155d1018-9e67-71a0-9ae4-89f9065d67f6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local target = TensorCore.mGetTarget()\nif not target then return false end\nreturn TensorCore.getDistance2d(TensorCore.mGetPlayer().pos, target.pos) <= 8",
						dequeueIfLuaFalse = true,
						name = "Target In Range (5y)",
						uuid = "c3d8a1f7-5e92-4b3a-9c16-8f2d0e7a4b59",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Mystic Skills\")",
						name = "Toggle",
						uuid = "85fc5f4c-f677-695e-b820-0f32505fcee4",
						version = 3,
					},
				},
			},
			name = "P. Mystic Knight",
			throttleTime = 1000,
			uuid = "092d9f5c-6e07-66c0-99d7-4ff225118861",
			version = 2,
		},
		inheritedIndex = 43,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "ACR",
						actionID = 41630,
						actionLua = "d(\"Fuma Shuriken\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						atomicPriority = true,
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"eff9d535-b1b3-97ff-81d8-1b1d46d44cae",
								true,
							},
							
							{
								"20de6216-c9b7-63c0-aa12-6f3bf6328b56",
								true,
							},
							
							{
								"413ab30e-5df3-2576-be9b-e6f0766a4e1c",
								true,
							},
							
							{
								"d6faff61-6e41-4419-a74c-ad11a7cfa344",
								true,
							},
							
							{
								"5efc2993-627e-22b8-97b6-14b91275d1ce",
								true,
							},
							
							{
								"91456766-cb80-a551-ae24-079ee8928b40",
								true,
							},
							
							{
								"407cb2a4-43fa-1a39-b3e4-2340f7c3711d",
								true,
							},
							
							{
								"bf3be3cc-85f5-a4b1-90b4-ec3cdc5b966c",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuSGE3_Hotbar_DutyAction1",
						ignoreWeaveRules = true,
						name = "Fuma Shuriken",
						targetType = "Current Target",
						uuid = "ebf644a2-9f1d-a660-9d02-ad52513db9b3",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionID = 41630,
						actionLua = "d(\"Lightning Scroll\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = true\nself.used = true",
						atomicPriority = true,
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"eff9d535-b1b3-97ff-81d8-1b1d46d44cae",
								true,
							},
							
							{
								"20de6216-c9b7-63c0-aa12-6f3bf6328b56",
								true,
							},
							
							{
								"413ab30e-5df3-2576-be9b-e6f0766a4e1c",
								true,
							},
							
							{
								"d6faff61-6e41-4419-a74c-ad11a7cfa344",
								true,
							},
							
							{
								"5efc2993-627e-22b8-97b6-14b91275d1ce",
								true,
							},
							
							{
								"e1a2766c-501a-0c89-831e-2146d6bae119",
								true,
							},
							
							{
								"475c4ff9-1c1a-9878-821b-6576f35b3d53",
								true,
							},
							
							{
								"9f2b8c8a-5827-0292-90e6-6b1494da7402",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuSGE3_Hotbar_DutyAction3",
						ignoreWeaveRules = true,
						name = "Lightning Scroll",
						targetType = "Most Clustered Enemy",
						uuid = "38328af4-057a-a8f9-93af-dd4ba67e12d3",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionID = 41630,
						actionLua = "d(\"Flame Scroll\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = true\nself.used = true",
						atomicPriority = true,
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"eff9d535-b1b3-97ff-81d8-1b1d46d44cae",
								true,
							},
							
							{
								"20de6216-c9b7-63c0-aa12-6f3bf6328b56",
								true,
							},
							
							{
								"413ab30e-5df3-2576-be9b-e6f0766a4e1c",
								true,
							},
							
							{
								"d6faff61-6e41-4419-a74c-ad11a7cfa344",
								true,
							},
							
							{
								"5efc2993-627e-22b8-97b6-14b91275d1ce",
								true,
							},
							
							{
								"c8c4c4ed-c14e-fae8-9770-ecd7145873a9",
								true,
							},
							
							{
								"81bc93ec-9729-d286-b830-236c236d9ceb",
								true,
							},
							
							{
								"9f2b8c8a-5827-0292-90e6-6b1494da7402",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuSGE3_Hotbar_DutyAction4",
						ignoreWeaveRules = true,
						name = "Flame Scroll",
						targetType = "Most Clustered Enemy",
						uuid = "5b471398-f336-5fd2-a86d-d717d0878fb1",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionLua = "d(\"Smoke\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"eff9d535-b1b3-97ff-81d8-1b1d46d44cae",
								true,
							},
							
							{
								"20de6216-c9b7-63c0-aa12-6f3bf6328b56",
								true,
							},
							
							{
								"413ab30e-5df3-2576-be9b-e6f0766a4e1c",
								true,
							},
							
							{
								"6150078d-4c7c-9781-86cb-cd1d8f0563ff",
								true,
							},
							
							{
								"693b377f-0e37-f1fa-837d-0d0e1593a732",
								true,
							},
							
							{
								"64ec0aae-a61e-8a4a-8be8-dfabf7eb0b79",
								true,
							},
							
							{
								"2cdf9b3d-99ce-7a1e-be68-91c3317da656",
								true,
							},
						},
						gVar = "ACR_RikuSGE3_Hotbar_DutyAction2",
						name = "Smoke",
						uuid = "87bd0a34-244e-a260-8444-c0204c42b24c",
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
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "eff9d535-b1b3-97ff-81d8-1b1d46d44cae",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5328,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Ninja",
						uuid = "20de6216-c9b7-63c0-aa12-6f3bf6328b56",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "413ab30e-5df3-2576-be9b-e6f0766a4e1c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "d6faff61-6e41-4419-a74c-ad11a7cfa344",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "5efc2993-627e-22b8-97b6-14b91275d1ce",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,31):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Fuma Shuriken",
						uuid = "91456766-cb80-a551-ae24-079ee8928b40",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,32):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Smoke",
						uuid = "6150078d-4c7c-9781-86cb-cd1d8f0563ff",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,33):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Lightning Scroll",
						uuid = "e1a2766c-501a-0c89-831e-2146d6bae119",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,34):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Flame Scroll",
						uuid = "c8c4c4ed-c14e-fae8-9770-ecd7145873a9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49062,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Fuma Shuriken CD <= 3s",
						uuid = "407cb2a4-43fa-1a39-b3e4-2340f7c3711d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49064,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Lightning Scroll CD <= 3s",
						uuid = "475c4ff9-1c1a-9878-821b-6576f35b3d53",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49065,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Flame Scroll CD <= 3s",
						uuid = "81bc93ec-9729-d286-b830-236c236d9ceb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 49063,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Smoke CD <= 0s",
						uuid = "693b377f-0e37-f1fa-837d-0d0e1593a732",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 5327,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Missing Buff: Smoke",
						uuid = "da90157b-ddee-665e-954b-c11eab3ac1ac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 3,
						buffDuration = 10,
						buffID = 5327,
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						name = "Buff Dur.: Smoke <= 10s",
						uuid = "b6b87162-540a-11db-a585-67788318d29c",
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
								"da90157b-ddee-665e-954b-c11eab3ac1ac",
								true,
							},
							
							{
								"b6b87162-540a-11db-a585-67788318d29c",
								true,
							},
						},
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "F: Smoke Buff",
						partyTargetNumber = 0,
						uuid = "64ec0aae-a61e-8a4a-8be8-dfabf7eb0b79",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Shuriken\")",
						name = "Toggle - Shuriken",
						uuid = "bf3be3cc-85f5-a4b1-90b4-ec3cdc5b966c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Scrolls\")",
						name = "Toggle - Scrolls",
						uuid = "9f2b8c8a-5827-0292-90e6-6b1494da7402",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Smoke\")",
						name = "Toggle - Smoke",
						uuid = "2cdf9b3d-99ce-7a1e-be68-91c3317da656",
						version = 3,
					},
				},
			},
			name = "P. Ninja",
			throttleTime = 250,
			timeout = 2.5,
			uuid = "d2e727cd-fcd5-e189-a64c-96e07f69315a",
			version = 2,
		},
		inheritedIndex = 44,
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
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"d42e14d2-ed16-3edb-98f6-0a083b58318d",
								true,
							},
							
							{
								"2807a4f9-c8e6-6040-ab35-7bc0de28267d",
								true,
							},
							
							{
								"99c73f6d-ab4e-f13c-a138-49090c198497",
								true,
							},
							
							{
								"5a5c0cef-f7f6-5c41-ba57-b7b6911c1582",
								true,
							},
							
							{
								"ff1a3ca1-0c40-0c0a-838e-3eb07775a30f",
								true,
							},
							
							{
								"931a6cca-b9e9-75cb-8765-316b65bda5f0",
								true,
							},
							
							{
								"3467bf01-4832-8358-bfb3-087527be05c8",
								true,
							},
							
							{
								"03cac638-88ff-d7f7-999e-c9e6b50817d5",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_CD",
						name = "Finisher",
						uuid = "5365b01d-aeac-1419-ac90-a9094d5b4c63",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"d42e14d2-ed16-3edb-98f6-0a083b58318d",
								true,
							},
							
							{
								"2807a4f9-c8e6-6040-ab35-7bc0de28267d",
								true,
							},
							
							{
								"99c73f6d-ab4e-f13c-a138-49090c198497",
								true,
							},
							
							{
								"5a5c0cef-f7f6-5c41-ba57-b7b6911c1582",
								true,
							},
							
							{
								"ff1a3ca1-0c40-0c0a-838e-3eb07775a30f",
								true,
							},
							
							{
								"2fb0faf9-ba0b-afef-b63f-3ba4d7840c17",
								true,
							},
							
							{
								"7ffacc39-e30e-5ce9-b423-8c90e71fb765",
								true,
							},
							
							{
								"03cac638-88ff-d7f7-999e-c9e6b50817d5",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_CD",
						name = "Long Reach",
						uuid = "9d0a8ece-7ebe-9cc4-b451-11050f645316",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"d42e14d2-ed16-3edb-98f6-0a083b58318d",
								true,
							},
							
							{
								"2807a4f9-c8e6-6040-ab35-7bc0de28267d",
								true,
							},
							
							{
								"99c73f6d-ab4e-f13c-a138-49090c198497",
								true,
							},
							
							{
								"5a5c0cef-f7f6-5c41-ba57-b7b6911c1582",
								true,
							},
							
							{
								"ff1a3ca1-0c40-0c0a-838e-3eb07775a30f",
								true,
							},
							
							{
								"0c941677-20dd-2f9a-9190-fd0d3020aa19",
								true,
							},
							
							{
								"bd807658-3923-e607-b150-436ec62d5681",
								true,
							},
							
							{
								"7e7e1198-54bb-5886-bf01-c3736b9fb5be",
								true,
							},
							
							{
								"03cac638-88ff-d7f7-999e-c9e6b50817d5",
								true,
							},
						},
						gVar = "ACR_RikuRDM3_CD",
						name = "Bladeblitz",
						uuid = "75a9967c-951e-62ca-8c3c-b89586cc622c",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "Occult Crescent",
						uuid = "d42e14d2-ed16-3edb-98f6-0a083b58318d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4804,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is Gladiator",
						uuid = "2807a4f9-c8e6-6040-ab35-7bc0de28267d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "99c73f6d-ab4e-f13c-a138-49090c198497",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "5a5c0cef-f7f6-5c41-ba57-b7b6911c1582",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return true",
						dequeueIfLuaFalse = true,
						name = "Toggle",
						uuid = "ff1a3ca1-0c40-0c0a-838e-3eb07775a30f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 46594,
						buffCheckType = 2,
						buffID = 4232,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Finisher CD",
						uuid = "931a6cca-b9e9-75cb-8765-316b65bda5f0",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 7,
						name = "Finisher Range",
						uuid = "3467bf01-4832-8358-bfb3-087527be05c8",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return (ActionList:Get(5,33):CanCastResult() ~= 579)",
						dequeueIfLuaFalse = true,
						name = "Long Reach Unlocked",
						uuid = "2fb0faf9-ba0b-afef-b63f-3ba4d7840c17",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 46596,
						buffCheckType = 2,
						buffID = 4232,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Long Reach CD",
						uuid = "7ffacc39-e30e-5ce9-b423-8c90e71fb765",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return (ActionList:Get(5,34):CanCastResult() ~= 579)",
						dequeueIfLuaFalse = true,
						name = "Bladeblitz Unlocked",
						uuid = "0c941677-20dd-2f9a-9190-fd0d3020aa19",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 46597,
						buffCheckType = 2,
						buffID = 4232,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Bladeblitz CD",
						uuid = "bd807658-3923-e607-b150-436ec62d5681",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 8,
						name = "Bladeblitz Range",
						uuid = "7e7e1198-54bb-5886-bf01-c3736b9fb5be",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"GLD Skills\")",
						name = "Toggle",
						uuid = "03cac638-88ff-d7f7-999e-c9e6b50817d5",
						version = 3,
					},
				},
			},
			name = "P. Gladiator Auto Weaponskills",
			throttleTime = 1000,
			uuid = "7a4dbf72-e16b-7baf-8724-7fb5955cb362",
			version = 2,
		},
		inheritedIndex = 45,
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
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
								true,
							},
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								true,
							},
							
							{
								"f1fcce61-dd9c-69d0-92e1-cc90b93ebdd5",
								true,
							},
							
							{
								"6b6b1fde-3d0c-43eb-88ba-0ebf9586a230",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Stop Summoning",
						uuid = "5457814d-3ddf-07ea-b993-3178136c2e34",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						clusterMinTarget = 0,
						clusterRadius = 15,
						conditions = 
						{
							
							{
								"1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
								true,
							},
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"3f8c09fd-599e-e425-935a-4a2e47b26bb7",
								true,
							},
							
							{
								"41488e26-0694-059b-bd0c-61b4e51917af",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								true,
							},
							
							{
								"88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
								true,
							},
							
							{
								"69db96b4-50c5-b63f-8302-96b4a12c36e6",
								true,
							},
							
							{
								"58dad09c-5edb-a035-8383-456b154f32fd",
								true,
							},
							
							{
								"c792fbc6-581d-4a85-b86a-36e5cb89bc03",
								true,
							},
							
							{
								"aacd0685-3c44-ba18-86ef-df2d9f1c8a3b",
								true,
							},
							
							{
								"204aa835-edbd-6801-9e41-6157156bf8e5",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuSGE3_Hotbar_DutyAction5",
						name = "Megaflare",
						targetType = "Most Clustered Enemy",
						uuid = "6ff99f53-6a37-b32b-8bca-25dc1664fa5f",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionID = 41630,
						actionLua = "d(\"Fuma Shuriken\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						atomicPriority = true,
						clusterMinTarget = 0,
						clusterRadius = 12,
						conditions = 
						{
							
							{
								"1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
								true,
							},
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"3f8c09fd-599e-e425-935a-4a2e47b26bb7",
								true,
							},
							
							{
								"41488e26-0694-059b-bd0c-61b4e51917af",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								true,
							},
							
							{
								"88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
								true,
							},
							
							{
								"69db96b4-50c5-b63f-8302-96b4a12c36e6",
								true,
							},
							
							{
								"da6a3ca6-8577-816b-88de-617741ad1af3",
								true,
							},
							
							{
								"09e738b2-8ab5-5736-ba29-5a36d8384456",
								true,
							},
							
							{
								"aacd0685-3c44-ba18-86ef-df2d9f1c8a3b",
								true,
							},
							
							{
								"7ae11b51-a023-a1a9-a351-9c4827a33a82",
								true,
							},
							
							{
								"204aa835-edbd-6801-9e41-6157156bf8e5",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuSGE3_Hotbar_DutyAction1",
						ignoreWeaveRules = true,
						name = "Hellfire",
						targetType = "Most Clustered Enemy",
						uuid = "1346423f-443e-bf98-86ff-e7afe4b562f9",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						clusterMinTarget = 0,
						clusterRadius = 12,
						conditions = 
						{
							
							{
								"1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
								true,
							},
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"3f8c09fd-599e-e425-935a-4a2e47b26bb7",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								true,
							},
							
							{
								"88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
								true,
							},
							
							{
								"69db96b4-50c5-b63f-8302-96b4a12c36e6",
								true,
							},
							
							{
								"eaf33b66-cfeb-0183-ba40-33027700e29a",
								true,
							},
							
							{
								"35b0d4f5-200d-5e4d-9911-90dc60aa7901",
								true,
							},
							
							{
								"aacd0685-3c44-ba18-86ef-df2d9f1c8a3b",
								true,
							},
							
							{
								"a18d17a7-36b7-b794-8e24-938c04369a92",
								true,
							},
							
							{
								"204aa835-edbd-6801-9e41-6157156bf8e5",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuSGE3_Hotbar_DutyAction2",
						name = "Judgement Bolt",
						targetType = "Most Clustered Enemy",
						uuid = "710fde25-ef3c-7f43-8a9c-0ad0cccc378f",
						variableIsHover = true,
						variableTogglesType = 2,
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
								"1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
								true,
							},
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"3f8c09fd-599e-e425-935a-4a2e47b26bb7",
								true,
							},
							
							{
								"41488e26-0694-059b-bd0c-61b4e51917af",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								true,
							},
							
							{
								"88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
								true,
							},
							
							{
								"69db96b4-50c5-b63f-8302-96b4a12c36e6",
								true,
							},
							
							{
								"b8bba6c4-6253-6d3f-aaf9-ad5b06c59bf8",
								true,
							},
							
							{
								"687e96ee-1fc4-a977-b11c-cb36d4a327b7",
								true,
							},
							
							{
								"aacd0685-3c44-ba18-86ef-df2d9f1c8a3b",
								true,
							},
							
							{
								"7bc51f84-db08-eecf-a9ac-eade5b39d44a",
								true,
							},
							
							{
								"204aa835-edbd-6801-9e41-6157156bf8e5",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuSGE3_Hotbar_DutyAction4",
						name = "Thunderstorm",
						targetSubType = "Most Clustered",
						targetType = "Current Target",
						uuid = "4ace2d05-8a41-264c-8499-e010902045cf",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionID = 41630,
						actionLua = "d(\"Fuma Shuriken\")\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						atomicPriority = true,
						clusterMinTarget = 0,
						clusterRadius = 12,
						conditions = 
						{
							
							{
								"1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
								true,
							},
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"41488e26-0694-059b-bd0c-61b4e51917af",
								true,
							},
							
							{
								"3f8c09fd-599e-e425-935a-4a2e47b26bb7",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								true,
							},
							
							{
								"88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
								true,
							},
							
							{
								"69db96b4-50c5-b63f-8302-96b4a12c36e6",
								true,
							},
							
							{
								"09e738b2-8ab5-5736-ba29-5a36d8384456",
								true,
							},
							
							{
								"aacd0685-3c44-ba18-86ef-df2d9f1c8a3b",
								true,
							},
							
							{
								"204aa835-edbd-6801-9e41-6157156bf8e5",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuSGE3_Hotbar_DutyAction1",
						ignoreWeaveRules = true,
						name = "Hellfire",
						targetType = "Most Clustered Enemy",
						uuid = "e2706396-3fe7-767e-a3e6-15d3144d1c6b",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
					inheritedOverwrites = 
					{
						conditions = 
						{
							
							{
								type = "add",
								value = 
								{
									"80ab686f-c3ab-907f-b320-9a079f92fd11",
									true,
								},
							},
						},
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								false,
							},
							
							{
								"6b6b1fde-3d0c-43eb-88ba-0ebf9586a230",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_CD",
						name = "Fallback Dequeue",
						uuid = "06e8f51b-eb9f-0f9e-8809-24b51ec83945",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5332,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Summoner",
						uuid = "a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						name = "Self Living",
						uuid = "3f8c09fd-599e-e425-935a-4a2e47b26bb7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Self Missing Transcendent",
						uuid = "41488e26-0694-059b-bd0c-61b4e51917af",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "09d2463d-fbb9-bc41-affd-1a796e900b59",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "69db96b4-50c5-b63f-8302-96b4a12c36e6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,31):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Hellfire",
						uuid = "da6a3ca6-8577-816b-88de-617741ad1af3",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,32):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Judgement Bolt",
						uuid = "eaf33b66-cfeb-0183-ba40-33027700e29a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,34):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Thunderstorm",
						uuid = "b8bba6c4-6253-6d3f-aaf9-ad5b06c59bf8",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,35):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Megaflare",
						uuid = "58dad09c-5edb-a035-8383-456b154f32fd",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49080,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Hellfire CD <= 3s",
						uuid = "09e738b2-8ab5-5736-ba29-5a36d8384456",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49081,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Judgement Bolt CD <= 3s",
						uuid = "35b0d4f5-200d-5e4d-9911-90dc60aa7901",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49083,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Thunderstorm CD <= 3s",
						uuid = "687e96ee-1fc4-a977-b11c-cb36d4a327b7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49084,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Megaflare CD <= 3s",
						uuid = "c792fbc6-581d-4a85-b86a-36e5cb89bc03",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5324,
						name = "Target Lightning Weak",
						uuid = "a18d17a7-36b7-b794-8e24-938c04369a92",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5325,
						name = "Target Wind Weak",
						uuid = "7bc51f84-db08-eecf-a9ac-eade5b39d44a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5322,
						name = "Target Fire Weak",
						uuid = "7ae11b51-a023-a1a9-a351-9c4827a33a82",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.getEntitySpeed(TensorCore.mGetPlayer().id) > 0",
						dequeueIfLuaFalse = true,
						name = "Player moving",
						uuid = "e9b651dc-8d33-d497-9404-f0701a646dcc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 167,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Player swiftcast buff",
						uuid = "33aa951f-e6ca-b329-85c3-a7dd2c21aa4a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 1249,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Player dualcast buff",
						uuid = "9022a47d-c71e-97f2-87d7-74d87c3058aa",
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
								"33aa951f-e6ca-b329-85c3-a7dd2c21aa4a",
								true,
							},
							
							{
								"9022a47d-c71e-97f2-87d7-74d87c3058aa",
								true,
							},
							
							{
								"e9b651dc-8d33-d497-9404-f0701a646dcc",
								false,
							},
						},
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "F: movement",
						partyTargetNumber = 0,
						uuid = "aacd0685-3c44-ba18-86ef-df2d9f1c8a3b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.mGetPlayer():IsMoving()",
						name = "Self Moving",
						uuid = "f1fcce61-dd9c-69d0-92e1-cc90b93ebdd5",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\" ] or _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\" ] or _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\" ] or _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\" ] == true",
						dequeueIfLuaFalse = true,
						name = "Is Queued",
						uuid = "6b6b1fde-3d0c-43eb-88ba-0ebf9586a230",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Summons\")",
						name = "Toggle",
						uuid = "204aa835-edbd-6801-9e41-6157156bf8e5",
						version = 3,
					},
				},
			},
			name = "P. Summoner",
			throttleTime = 250,
			timeout = 2.5,
			uuid = "e81c0ba8-5548-a1f1-b801-970c817fc455",
			version = 2,
		},
		inheritedIndex = 46,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "ACR",
						clusterMinTarget = 0,
						conditions = 
						{
							
							{
								"97b4fbc4-3d22-e8e1-8baf-951f815047e9",
								true,
							},
							
							{
								"ae040a9d-860d-0b4b-a55f-c82b4035177a",
								true,
							},
							
							{
								"20840724-ed31-adac-bb7f-9a94958e814e",
								true,
							},
							
							{
								"93b471e5-9a85-d70d-b386-507f7561930c",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction5",
						gVarValue = 2,
						name = "Stop Occult Holy - Movement",
						targetType = "Most Clustered Enemy",
						uuid = "d20b0408-f597-62b5-ba94-b703f298b7dd",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						clusterMinTarget = 0,
						conditions = 
						{
							
							{
								"00099e85-cb04-54af-86e6-bc086ac50320",
								true,
							},
							
							{
								"13937b42-ea6b-0ff6-8de3-df1fb92b7c6e",
								true,
							},
							
							{
								"2313ec24-56c9-f3da-9dae-cd45fa21c991",
								true,
							},
							
							{
								"ae040a9d-860d-0b4b-a55f-c82b4035177a",
								true,
							},
							
							{
								"722134e6-20ae-466b-a92d-b4c23b7c6ec6",
								true,
							},
							
							{
								"bb5c6c03-8599-914d-ad3f-b7f753e6cbf0",
								true,
							},
							
							{
								"97b4fbc4-3d22-e8e1-8baf-951f815047e9",
								true,
							},
							
							{
								"20840724-ed31-adac-bb7f-9a94958e814e",
								false,
							},
							
							{
								"10b590cb-b6fc-cfa3-a6da-57460e85f7e0",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction5",
						name = "Occult Holy",
						targetType = "Most Clustered Enemy",
						uuid = "11c26eb8-9bb6-f750-84d1-f96b3c1daaac",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = false\nself.used = true",
						clusterMinTarget = 0,
						conditions = 
						{
							
							{
								"97b4fbc4-3d22-e8e1-8baf-951f815047e9",
								true,
							},
							
							{
								"2313ec24-56c9-f3da-9dae-cd45fa21c991",
								true,
							},
							
							{
								"ae040a9d-860d-0b4b-a55f-c82b4035177a",
								false,
							},
							
							{
								"93b471e5-9a85-d70d-b386-507f7561930c",
								true,
							},
							
							{
								"10b590cb-b6fc-cfa3-a6da-57460e85f7e0",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction5",
						gVarValue = 2,
						name = "Fallback Deactivate",
						targetType = "Most Clustered Enemy",
						uuid = "56c20222-a360-74d5-8006-a9729dc0af2f",
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
						buffID = 5329,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is WHM",
						uuid = "97b4fbc4-3d22-e8e1-8baf-951f815047e9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,35):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Occult Holy",
						uuid = "00099e85-cb04-54af-86e6-bc086ac50320",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49071,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Occult Holy CD <= 3s",
						uuid = "13937b42-ea6b-0ff6-8de3-df1fb92b7c6e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "2313ec24-56c9-f3da-9dae-cd45fa21c991",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "ae040a9d-860d-0b4b-a55f-c82b4035177a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "722134e6-20ae-466b-a92d-b4c23b7c6ec6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "bb5c6c03-8599-914d-ad3f-b7f753e6cbf0",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.mGetPlayer():IsMoving()",
						dequeueIfLuaFalse = true,
						name = "Player Moving",
						uuid = "20840724-ed31-adac-bb7f-9a94958e814e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"]",
						dequeueIfLuaFalse = true,
						name = "Is Occult Holy queued",
						uuid = "93b471e5-9a85-d70d-b386-507f7561930c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"WHM Attacks\")",
						name = "Toggle",
						uuid = "10b590cb-b6fc-cfa3-a6da-57460e85f7e0",
						version = 3,
					},
				},
			},
			name = "P. WHM - Attacks",
			throttleTime = 100,
			timeout = 2.75,
			uuid = "337763c3-1547-f9b4-bd94-5d27cdf7d7ee",
			version = 2,
		},
		inheritedIndex = 47,
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
						actionLua = "local GUI_FLAGS = 97\n\n-- Initialize table and toggle states if they don't exist yet\nPWHMToggles = PWHMToggles or {}\nif PWHMToggles.ST == nil then PWHMToggles.ST = true end\nif PWHMToggles.AOE == nil then PWHMToggles.AOE = true end\nif PWHMToggles.Rez == nil then PWHMToggles.Rez = true end\n\nGUI:Begin(\"OCWHMBox#ton618\", true, GUI_FLAGS)\n\n-- Header Title (2 Lines)\nGUI:SetWindowFontSize(1.3)\nGUI:TextColored(0, 1, 1, 1.0, \"Phantom WHM\\nHeal Toggles\")\nGUI:Separator()\n\n-- Set font size for the toggle buttons\nGUI:SetWindowFontSize(1.25)\n\n-- Helper function to draw dynamic toggle buttons\nlocal function DrawToggleButton(label, key, width, height)\n    width = width or 120\n    height = height or 30\n\n    if PWHMToggles[key] then\n        -- Darker Green when ON (Normal, Hovered, Active)\n        GUI:PushStyleColor(GUI.Col_Button,        0.10, 0.45, 0.10, 1.0)\n        GUI:PushStyleColor(GUI.Col_ButtonHovered, 0.15, 0.55, 0.15, 1.0)\n        GUI:PushStyleColor(GUI.Col_ButtonActive,  0.05, 0.35, 0.05, 1.0)\n    else\n        -- Dark Grey when OFF (Normal, Hovered, Active)\n        GUI:PushStyleColor(GUI.Col_Button,        0.30, 0.30, 0.30, 1.0)\n        GUI:PushStyleColor(GUI.Col_ButtonHovered, 0.40, 0.40, 0.40, 1.0)\n        GUI:PushStyleColor(GUI.Col_ButtonActive,  0.20, 0.20, 0.20, 1.0)\n    end\n\n    -- Toggle the state when clicked\n    if GUI:Button(label, width, height) then\n        PWHMToggles[key] = not PWHMToggles[key]\n    end\n\n    -- Clean up all 3 pushed colors\n    GUI:PopStyleColor(3)\nend\n\n-- Render Toggle Buttons (Label, Table Key, Width, Height)\nDrawToggleButton(\"ST\", \"ST\", 120, 30)\nDrawToggleButton(\"AOE\", \"AOE\", 120, 30)\nDrawToggleButton(\"Rez\", \"Rez\", 120, 30)\n\n-- Reset font size back to default\nGUI:SetWindowFontSize(1.0)\n\nGUI:End()\n\nself.used = true",
						conditions = 
						{
							
							{
								"55457aa9-df38-a8bc-90ab-eb59b9f7655c",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						uuid = "1de7001f-cf04-925a-9f7d-9d6e45feba63",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						buffID = 5329,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is WHM",
						uuid = "55457aa9-df38-a8bc-90ab-eb59b9f7655c",
						version = 3,
					},
				},
			},
			enabled = false,
			eventType = 13,
			name = "P. WHM - UI",
			uuid = "c2d39c48-9f66-9027-921f-e77b0d24dce1",
			version = 2,
		},
		inheritedIndex = 48,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "ACR",
						actionID = 49077,
						conditions = 
						{
							
							{
								"d52d37b0-8b06-b607-bdf7-b944b958f15f",
								true,
							},
							
							{
								"00cca2d5-06a8-314e-ac4f-42d45e6d661d",
								true,
							},
							
							{
								"371be608-27c7-2f9a-80e8-27691b5acb57",
								true,
							},
							
							{
								"e85d10bf-b903-5311-a8d4-07a39bbeca22",
								true,
							},
							
							{
								"008f9621-c60d-4997-9597-9deb06924d2f",
								true,
							},
							
							{
								"34f73688-0cfe-df74-b50b-40f73c205b16",
								true,
							},
							
							{
								"fbe4a9c5-2359-ab12-b5c8-7995fb9276c3",
								true,
							},
							
							{
								"e5437b0f-d1cf-8896-913e-8d08fb771d95",
								true,
							},
							
							{
								"496b8303-acbd-9f85-9ff0-a9275fcd0a39",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction1",
						name = "Occult Jump",
						targetType = "Current Target",
						uuid = "b76c19be-8315-0f14-8107-cabe81100ed7",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionID = 49079,
						conditions = 
						{
							
							{
								"d52d37b0-8b06-b607-bdf7-b944b958f15f",
								true,
							},
							
							{
								"00cca2d5-06a8-314e-ac4f-42d45e6d661d",
								true,
							},
							
							{
								"371be608-27c7-2f9a-80e8-27691b5acb57",
								true,
							},
							
							{
								"e85d10bf-b903-5311-a8d4-07a39bbeca22",
								true,
							},
							
							{
								"31008cf1-5f1b-5619-a31c-4199461bb9a8",
								true,
							},
							
							{
								"34f73688-0cfe-df74-b50b-40f73c205b16",
								true,
							},
							
							{
								"fbe4a9c5-2359-ab12-b5c8-7995fb9276c3",
								true,
							},
							
							{
								"e5437b0f-d1cf-8896-913e-8d08fb771d95",
								true,
							},
							
							{
								"f537cc0a-3dbf-7e39-aafb-27c184834875",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction3",
						name = "Occult Lance",
						targetType = "Current Target",
						uuid = "e1dcaf7b-ab59-8190-8c25-4311cc3a8cb9",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "In Occult Crescent",
						uuid = "d52d37b0-8b06-b607-bdf7-b944b958f15f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Is Bot Running",
						uuid = "00cca2d5-06a8-314e-ac4f-42d45e6d661d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "371be608-27c7-2f9a-80e8-27691b5acb57",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						name = "Self Living",
						uuid = "e85d10bf-b903-5311-a8d4-07a39bbeca22",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49077,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Check jump cd",
						uuid = "008f9621-c60d-4997-9597-9deb06924d2f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49079,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Check Lance cd",
						uuid = "31008cf1-5f1b-5619-a31c-4199461bb9a8",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5331,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is DRG",
						uuid = "34f73688-0cfe-df74-b50b-40f73c205b16",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Self Missing Transcendent",
						uuid = "fbe4a9c5-2359-ab12-b5c8-7995fb9276c3",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "e5437b0f-d1cf-8896-913e-8d08fb771d95",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Jump\")",
						name = "Toggle - Jump",
						uuid = "496b8303-acbd-9f85-9ff0-a9275fcd0a39",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Lance\")",
						name = "Toggle - Lance",
						uuid = "f537cc0a-3dbf-7e39-aafb-27c184834875",
						version = 3,
					},
				},
			},
			name = "p. Dragoon (Jump not safe)",
			throttleTime = 100,
			uuid = "24e7d6ff-fd47-9ade-baf5-d975aca3cbf9",
			version = 2,
		},
		inheritedIndex = 49,
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
						actionLua = "if (data.lastRun ~= nil and TimeSince(data.lastRun) < 1500) then\n    return\nend\n\nlocal deadPlayers = TensorCore.entityList(\"chartype=4,los,dead,maxdistance=30\")\n\nlocal bestTarget = nil\nlocal highestPriority = 0\n\nif table.valid(deadPlayers) then\n    for _, player in pairs(deadPlayers) do\n        -- Skip if already raised (148) or out of raises (4263)\n        if not TensorCore.hasBuff(player, 148) and not TensorCore.hasBuff(player, 4263) then\n            -- Assign priority score: Chemist (3) > White Mage (2) > Standard (1)\n            local priority = 1\n            if TensorCore.hasBuff(player, 4367) then\n                priority = 3\n            elseif TensorCore.hasBuff(player, 5329) then\n                priority = 2\n            end\n\n            -- Track highest priority found\n            if priority > highestPriority then\n                highestPriority = priority\n                bestTarget = player\n            end\n        end\n    end\nend\n\n-- If a valid target was found, process the raise and return the player ID\nif bestTarget then\n    local jobLabel = \"\"\n    if highestPriority == 3 then jobLabel = \" (Chemist)\" end\n    if highestPriority == 2 then jobLabel = \" (White Mage)\" end\n    local rezMessage = \"Raising \" .. bestTarget.name .. jobLabel\n\n    eventArgs.detectionTargetID = bestTarget.id\n    data.rezMessage = rezMessage\n    d(\"set target to rez: \" .. bestTarget.name)\nelse\n    eventArgs.detectionTargetID = nil\nend\n\ndata.lastRun = Now()\n\nself.used = true",
						conditions = 
						{
							
							{
								"8932cec1-d110-be6c-8549-832c96c2f81f",
								true,
							},
							
							{
								"b50f7454-821a-9ac2-9385-6e4ab6cd8506",
								true,
							},
							
							{
								"16f4dfef-1b6b-fc77-b547-814ee2ac39a4",
								true,
							},
							
							{
								"4232a585-e0da-30d7-9db0-2fb1e588513c",
								true,
							},
							
							{
								"74f495a6-8cbc-e212-95dd-7fe47b47f817",
								true,
							},
							
							{
								"0ac69ed7-0bd3-2295-bbb9-13e0fbe2ce86",
								true,
							},
							
							{
								"d6bd6de2-7c2e-1cd1-baa7-df189d738b97",
								true,
							},
							
							{
								"3d5dfb18-3249-4580-9909-11d5fe959bab",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Set Rez Target",
						uuid = "65981774-cada-1187-b757-b80415751cbf",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionID = 49070,
						conditions = 
						{
							
							{
								"8932cec1-d110-be6c-8549-832c96c2f81f",
								true,
							},
							
							{
								"b50f7454-821a-9ac2-9385-6e4ab6cd8506",
								true,
							},
							
							{
								"16f4dfef-1b6b-fc77-b547-814ee2ac39a4",
								true,
							},
							
							{
								"4232a585-e0da-30d7-9db0-2fb1e588513c",
								true,
							},
							
							{
								"74f495a6-8cbc-e212-95dd-7fe47b47f817",
								true,
							},
							
							{
								"0ac69ed7-0bd3-2295-bbb9-13e0fbe2ce86",
								true,
							},
							
							{
								"62d1c136-27c2-976c-a86e-7f0062efe2f4",
								true,
							},
							
							{
								"3d5dfb18-3249-4580-9909-11d5fe959bab",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction4",
						targetType = "Detection Target",
						uuid = "82f832f6-fea4-d466-a009-8d7c8ea10540",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"8932cec1-d110-be6c-8549-832c96c2f81f",
								true,
							},
							
							{
								"b50f7454-821a-9ac2-9385-6e4ab6cd8506",
								true,
							},
							
							{
								"16f4dfef-1b6b-fc77-b547-814ee2ac39a4",
								false,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction4",
						gVarValue = 2,
						name = "Fallback Deactivate",
						targetType = "Detection Target",
						uuid = "319c6dce-fe0b-615f-a695-7f25e95940f4",
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
						buffID = 5329,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is WHM",
						uuid = "8932cec1-d110-be6c-8549-832c96c2f81f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "b50f7454-821a-9ac2-9385-6e4ab6cd8506",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "16f4dfef-1b6b-fc77-b547-814ee2ac39a4",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Self Missing Transcendent",
						uuid = "4232a585-e0da-30d7-9db0-2fb1e588513c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 0.20000000298023,
						actionID = 49070,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						name = "Occult Raise CD",
						uuid = "74f495a6-8cbc-e212-95dd-7fe47b47f817",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return (ActionList:Get(5,34):CanCastResult() ~= 579)",
						dequeueIfLuaFalse = true,
						name = "Occult Raise Unlocked",
						uuid = "0ac69ed7-0bd3-2295-bbb9-13e0fbe2ce86",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local deadPlayers = TensorCore.entityList(\"chartype=4,los,dead,maxdistance=30\")\nfor _, player in pairs(deadPlayers) do\n    if not TensorCore.hasBuff(player, 148) and not TensorCore.hasBuff(player, 4263) then\n        return true\n    end\nend\nreturn false",
						dequeueIfLuaFalse = true,
						filterTargetType = "Party",
						name = "Dead Player Check",
						uuid = "d6bd6de2-7c2e-1cd1-baa7-df189d738b97",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.detectionTargetID ~= nil",
						dequeueIfLuaFalse = true,
						name = "Has Detection Target",
						uuid = "62d1c136-27c2-976c-a86e-7f0062efe2f4",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"WHM Raise\")",
						name = "Toggle",
						uuid = "3d5dfb18-3249-4580-9909-11d5fe959bab",
						version = 3,
					},
				},
			},
			name = "P. WHM - Rez",
			throttleTime = 200,
			uuid = "c1e2e2ba-7ea0-520b-91ff-cb92e4676842",
			version = 2,
		},
		inheritedIndex = 50,
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
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"e2762103-a99f-86dc-ad49-b79f66f96561",
								true,
							},
							
							{
								"3ca882ee-8189-76a0-b3ca-e126e1a77551",
								true,
							},
							
							{
								"4422212c-3126-2a92-a5fe-15dcceb5fb00",
								true,
							},
							
							{
								"c225207c-fb94-0582-8b77-6b69080b1b3c",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Stop Heal - Movement",
						uuid = "7c2a4c96-d765-31c1-807a-9b37b287b54f",
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
								"3ca882ee-8189-76a0-b3ca-e126e1a77551",
								true,
							},
							
							{
								"205ce590-576c-805f-bb70-b65b01a445fe",
								true,
							},
							
							{
								"505e3dab-394d-8421-81ad-d9ecf712590a",
								true,
							},
							
							{
								"ab85b088-5413-02bf-8b95-ea4abcf8e1d5",
								true,
							},
							
							{
								"4422212c-3126-2a92-a5fe-15dcceb5fb00",
								false,
							},
							
							{
								"e2762103-a99f-86dc-ad49-b79f66f96561",
								true,
							},
							
							{
								"e88c419c-58eb-63ef-9ec1-9c0990ab3857",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction1",
						name = "Occult Cure II",
						targetType = "Detection Target",
						uuid = "d7d9d7b2-357e-4e4e-8f79-21252924b15b",
						variableIsHover = true,
						variableTogglesType = 2,
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
								"3ca882ee-8189-76a0-b3ca-e126e1a77551",
								true,
							},
							
							{
								"205ce590-576c-805f-bb70-b65b01a445fe",
								true,
							},
							
							{
								"50a18b96-eaba-3dbe-a1de-80acadb5c7d7",
								true,
							},
							
							{
								"59a38c75-1a1a-984b-9728-4c51ae771b49",
								true,
							},
							
							{
								"4422212c-3126-2a92-a5fe-15dcceb5fb00",
								false,
							},
							
							{
								"e2762103-a99f-86dc-ad49-b79f66f96561",
								true,
							},
							
							{
								"e88c419c-58eb-63ef-9ec1-9c0990ab3857",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction2",
						name = "Occult Cure III",
						uuid = "06ac1aba-4f61-2150-a12e-2b131ff31b87",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"e2762103-a99f-86dc-ad49-b79f66f96561",
								true,
							},
							
							{
								"3ca882ee-8189-76a0-b3ca-e126e1a77551",
								false,
							},
							
							{
								"205ce590-576c-805f-bb70-b65b01a445fe",
								true,
							},
							
							{
								"c225207c-fb94-0582-8b77-6b69080b1b3c",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Fallback Deactivate",
						uuid = "f80fcf7c-232e-7d53-bea6-34e07dd86596",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						buffID = 5329,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is WHM",
						uuid = "e2762103-a99f-86dc-ad49-b79f66f96561",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "3ca882ee-8189-76a0-b3ca-e126e1a77551",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "205ce590-576c-805f-bb70-b65b01a445fe",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Party",
						comparator = 2,
						conditionType = 4,
						inRangeValue = 15,
						name = "Range - 15 yalms",
						partyTargetType = "Detection Target",
						uuid = "9e180cea-980c-71f5-963e-b57f98e6d536",
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
						name = "Range - 30 yalms",
						partyTargetType = "Detection Target",
						uuid = "2dd5888f-d9af-4062-a698-1ae78e2d2b6c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Party",
						comparator = 2,
						conditionType = 2,
						hpValue = 50,
						name = "HP - 50%",
						partyTargetType = "Detection Target",
						uuid = "cd643437-cbe4-9fd5-bfd9-546de754b118",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Party",
						comparator = 2,
						conditionType = 2,
						hpValue = 75,
						name = "HP - 75%",
						partyTargetType = "Detection Target",
						uuid = "3a745689-e1b3-4404-8721-e462780db477",
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
								"9e180cea-980c-71f5-963e-b57f98e6d536",
								true,
							},
							
							{
								"3a745689-e1b3-4404-8721-e462780db477",
								true,
							},
						},
						dequeueIfLuaFalse = true,
						filterTargetType = "Party",
						name = "F - Occult Cure III",
						partyTargetNumber = 3,
						uuid = "50a18b96-eaba-3dbe-a1de-80acadb5c7d7",
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
								"2dd5888f-d9af-4062-a698-1ae78e2d2b6c",
								true,
							},
							
							{
								"cd643437-cbe4-9fd5-bfd9-546de754b118",
								true,
							},
						},
						dequeueIfLuaFalse = true,
						filterTargetSubtype = "Lowest HP",
						filterTargetType = "Party",
						name = "F - 50% @ 30y",
						uuid = "505e3dab-394d-8421-81ad-d9ecf712590a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 3,
						dequeueIfLuaFalse = true,
						mpType = 2,
						mpValue = 1500,
						name = "MP >= 1500",
						uuid = "ab85b088-5413-02bf-8b95-ea4abcf8e1d5",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 3,
						dequeueIfLuaFalse = true,
						mpType = 2,
						mpValue = 3000,
						name = "MP >= 3000",
						uuid = "59a38c75-1a1a-984b-9728-4c51ae771b49",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.mGetPlayer():IsMoving()",
						dequeueIfLuaFalse = true,
						name = "Player Moving",
						uuid = "4422212c-3126-2a92-a5fe-15dcceb5fb00",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"]\n       or _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"]",
						dequeueIfLuaFalse = true,
						name = "Is Heal queued",
						uuid = "c225207c-fb94-0582-8b77-6b69080b1b3c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"WHM Heals\")",
						name = "Toggle",
						uuid = "e88c419c-58eb-63ef-9ec1-9c0990ab3857",
						version = 3,
					},
				},
			},
			name = "P. WHM - Heals",
			throttleTime = 100,
			timeout = 2.75,
			uuid = "9d280002-40a4-9e37-b14e-081affb3b3ea",
			version = 2,
		},
		inheritedIndex = 51,
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
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"78cf5b62-d614-da94-b357-a31d3c93f225",
								true,
							},
							
							{
								"a4bae7f0-15e7-e380-89ed-28e6f8f500ff",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								true,
							},
							
							{
								"cf209713-cd07-baf7-af6e-1000879b86cb",
								true,
							},
							
							{
								"1e471142-f907-e1dd-abd5-6325e970db36",
								true,
							},
							
							{
								"b3f3779f-97e1-26c8-aab2-1d54bd11306a",
								true,
							},
							
							{
								"0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
								true,
							},
							
							{
								"68842e46-8c8e-f38e-80f1-1c565d84de04",
								true,
							},
							
							{
								"36e0cdc9-6f67-832d-af9d-962934e8d8cc",
								true,
							},
							
							{
								"d9fc1dde-2dbf-78a8-805a-26a426f2e206",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Phantom Aim",
						uuid = "b8fb2967-ec8b-3e1a-90c2-d4cc7d3703c8",
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
						buffID = 4361,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Ranger",
						uuid = "2312ae26-c802-ad39-bbbf-0830ed918dac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Is Bot Running",
						uuid = "78cf5b62-d614-da94-b357-a31d3c93f225",
						version = 3,
					},
					inheritedIndex = 2,
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 0.10000000149012,
						name = "Am Alive",
						uuid = "a4bae7f0-15e7-e380-89ed-28e6f8f500ff",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "e27ae646-5033-f9d0-8f32-0bab1ca37b02",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "cf209713-cd07-baf7-af6e-1000879b86cb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_CD\"]",
						dequeueIfLuaFalse = true,
						name = "CD Enabled",
						uuid = "1e471142-f907-e1dd-abd5-6325e970db36",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 6,
						buffID = 4240,
						buffIDList = 
						{
							4240,
							4241,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Missing Phantom Aim",
						uuid = "b3f3779f-97e1-26c8-aab2-1d54bd11306a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41599,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Phantom Aim CD <= 3s",
						uuid = "0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "68842e46-8c8e-f38e-80f1-1c565d84de04",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "36e0cdc9-6f67-832d-af9d-962934e8d8cc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Aim\")",
						name = "Toggle",
						uuid = "d9fc1dde-2dbf-78a8-805a-26a426f2e206",
						version = 3,
					},
				},
			},
			name = "P. Ranger Phantom Aim",
			throttleTime = 1000,
			uuid = "a2c85c0f-8023-3f9f-803e-b42c3527bb7a",
			version = 2,
		},
		inheritedIndex = 52,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 49077,
						conditions = 
						{
							
							{
								"cd3de24c-bd19-c8b3-acdc-269ffe017e3a",
								true,
							},
							
							{
								"3f34d46e-8ad1-9e64-abed-166c78a10efe",
								true,
							},
							
							{
								"eb19d322-6f8b-acb5-a881-7228eff84b51",
								true,
							},
							
							{
								"3eb0c4c8-227d-313a-86c7-6d9400d5c777",
								true,
							},
							
							{
								"a80a59b2-e621-1d41-9f36-14e543a6cd8a",
								true,
							},
							
							{
								"385293ab-d5d7-e2a6-8a36-8a2a08e9f522",
								true,
							},
							
							{
								"7acdaefc-5897-7460-b999-7e5d968a67c3",
								true,
							},
							
							{
								"7da229c0-f7ce-9c1c-966d-53b7f743c519",
								true,
							},
							
							{
								"8def9f3f-9a1d-8430-b1ec-cbf1fa495fef",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						targetType = "Current Target",
						uuid = "f7e9adee-e49b-d4c0-ae44-a5001cfc9103",
						version = 2.1,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						actionID = 49079,
						conditions = 
						{
							
							{
								"cd3de24c-bd19-c8b3-acdc-269ffe017e3a",
								true,
							},
							
							{
								"3f34d46e-8ad1-9e64-abed-166c78a10efe",
								true,
							},
							
							{
								"eb19d322-6f8b-acb5-a881-7228eff84b51",
								true,
							},
							
							{
								"3eb0c4c8-227d-313a-86c7-6d9400d5c777",
								true,
							},
							
							{
								"8566b987-8453-9004-bb17-6d93d00bec3e",
								true,
							},
							
							{
								"385293ab-d5d7-e2a6-8a36-8a2a08e9f522",
								true,
							},
							
							{
								"7acdaefc-5897-7460-b999-7e5d968a67c3",
								true,
							},
							
							{
								"7da229c0-f7ce-9c1c-966d-53b7f743c519",
								true,
							},
							
							{
								"063da332-385b-9a3c-b790-e93273ff6d8e",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						targetType = "Current Target",
						uuid = "1357e8ec-d52e-f63f-83d2-476ca2d9e7de",
						version = 2.1,
					},
					inheritedIndex = 2,
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Self",
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "In Occult Crescent",
						uuid = "cd3de24c-bd19-c8b3-acdc-269ffe017e3a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Is Bot Running",
						uuid = "3f34d46e-8ad1-9e64-abed-166c78a10efe",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "eb19d322-6f8b-acb5-a881-7228eff84b51",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						name = "Self Living",
						uuid = "3eb0c4c8-227d-313a-86c7-6d9400d5c777",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49077,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Check jump cd",
						uuid = "a80a59b2-e621-1d41-9f36-14e543a6cd8a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49079,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Check Lance cd",
						uuid = "8566b987-8453-9004-bb17-6d93d00bec3e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5331,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is DRG",
						uuid = "385293ab-d5d7-e2a6-8a36-8a2a08e9f522",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Self Missing Transcendent",
						uuid = "7acdaefc-5897-7460-b999-7e5d968a67c3",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "7da229c0-f7ce-9c1c-966d-53b7f743c519",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Jump\")",
						name = "Toggle - Jump",
						uuid = "8def9f3f-9a1d-8430-b1ec-cbf1fa495fef",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Lance\")",
						name = "Toggle - Lance",
						uuid = "063da332-385b-9a3c-b790-e93273ff6d8e",
						version = 3,
					},
				},
			},
			enabled = false,
			name = "old p. Dragoon (Jump not safe)",
			throttleTime = 100,
			uuid = "3bfe4444-df82-7f20-b900-794335d94680",
			version = 2,
		},
		inheritedIndex = 53,
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
						actionLua = "local entityID = eventArgs.entityID\nlocal wind = TensorCore.mGetEntity(entityID)\nif not wind or not wind.pos then return end\n\nlocal speed = TensorCore.getEntitySpeed(entityID)\nif not speed or speed <= 0 then return end\nlocal nextX, nextY, nextZ = TensorCore.getPosInDirection(wind.pos, wind.pos.h, 1, true)\nif not nextX or not nextY or not nextZ then return end\nlocal dirX = nextX - wind.pos.x\nlocal dirY = nextY - wind.pos.y\nlocal dirZ = nextZ - wind.pos.z\n\nlocal finalX, finalY, finalZ = TensorCore.Avoidance.predictOrbitPosition(\n\twind.pos.x, wind.pos.y, wind.pos.z,\n\t-150, wind.pos.y, -860,\n\tspeed, dirX, dirY, dirZ, 4.5)\nif not finalX or not finalY or not finalZ then return end\n\ndata.northHornBitingWindStars = data.northHornBitingWindStars or {}\nlocal old = data.northHornBitingWindStars[entityID]\nif old then\n\tfor _, uuid in ipairs(old) do\n\t\tif uuid then Argus.deleteTimedShape(uuid) end\n\tend\nend\n\nlocal drawer = TensorCore.getMoogleDrawer()\nif not drawer then return end\ndata.northHornBitingWindStars[entityID] = {\n\tdrawer:addTimedCross(5200, finalX, finalY + 0.02, finalZ, 60, 8, 0),\n\tdrawer:addTimedCross(5200, finalX, finalY + 0.02, finalZ, 60, 8, math.pi / 4),\n}\nself.used = true\n",
						conditions = 
						{
							
							{
								"32000043-0000-4000-8000-000000000001",
								true,
							},
							
							{
								"32000043-0000-4000-8000-000000000151",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Draw marked wind's eight-pointed star",
						uuid = "32000043-0000-4000-8000-000000000201",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "32000043-0000-4000-8000-000000000001",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local e=TensorCore.mGetEntity(eventArgs.entityID) return eventArgs.markerID == 506 and e and e.contentid == 14506",
						dequeueIfLuaFalse = true,
						name = "Marked Biting Wind",
						uuid = "32000043-0000-4000-8000-000000000151",
						version = 3,
					},
				},
			},
			eventType = 4,
			name = "[Lost on the Wind] Tendon Ripper",
			uuid = "5fb56afa-2b33-b5a5-b04a-3d1fe8f7279a",
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
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"3d3f3ae3-e9c5-84d0-bf4e-f87d1173e936",
								true,
							},
							
							{
								"7fdcd281-14f9-063b-a49d-42de65643f64",
								true,
							},
							
							{
								"a69e6d29-6193-591f-996c-098369216467",
								true,
							},
							
							{
								"c92a4d44-16a6-d650-b672-b51b4bed0124",
								true,
							},
							
							{
								"93801b13-1545-e36f-9b18-eb9b1a889481",
								true,
							},
							
							{
								"6d66f9d6-18f2-eb73-a646-84cbae9d3e07",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Movement Stop Queue",
						uuid = "bbcb446f-2129-16a9-8294-e90d8b94942e",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionID = 49085,
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"3d3f3ae3-e9c5-84d0-bf4e-f87d1173e936",
								true,
							},
							
							{
								"7fdcd281-14f9-063b-a49d-42de65643f64",
								true,
							},
							
							{
								"a69e6d29-6193-591f-996c-098369216467",
								true,
							},
							
							{
								"c92a4d44-16a6-d650-b672-b51b4bed0124",
								true,
							},
							
							{
								"4a596d22-916f-45a6-95f2-47ab2042221d",
								true,
							},
							
							{
								"67b2e0d8-515e-9e87-88fd-548d7eefc9c0",
								true,
							},
							
							{
								"93801b13-1545-e36f-9b18-eb9b1a889481",
								false,
							},
							
							{
								"dc85700f-2280-7145-bbaf-8044ba6b5887",
								true,
							},
							
							{
								"94c640c7-3c36-bf3a-bd37-4e63b2ae7ba7",
								true,
							},
							
							{
								"75b86d7a-236c-2270-bc01-c8fd9529e6a5",
								true,
							},
							
							{
								"89eb4ac1-6022-83e2-9bee-122b96f1155e",
								true,
							},
							
							{
								"f67f2616-57fb-6fd4-a12e-c0589fc1425e",
								true,
							},
						},
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction1",
						name = "Occult Aero",
						targetType = "Most Clustered Enemy",
						uuid = "9d8fcec8-5d03-69b1-9d2f-4726835a21d6",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"3d3f3ae3-e9c5-84d0-bf4e-f87d1173e936",
								true,
							},
							
							{
								"7fdcd281-14f9-063b-a49d-42de65643f64",
								true,
							},
							
							{
								"a69e6d29-6193-591f-996c-098369216467",
								true,
							},
							
							{
								"c92a4d44-16a6-d650-b672-b51b4bed0124",
								true,
							},
							
							{
								"4a596d22-916f-45a6-95f2-47ab2042221d",
								true,
							},
							
							{
								"67b2e0d8-515e-9e87-88fd-548d7eefc9c0",
								true,
							},
							
							{
								"93801b13-1545-e36f-9b18-eb9b1a889481",
								false,
							},
							
							{
								"dc85700f-2280-7145-bbaf-8044ba6b5887",
								true,
							},
							
							{
								"94c640c7-3c36-bf3a-bd37-4e63b2ae7ba7",
								true,
							},
							
							{
								"75b86d7a-236c-2270-bc01-c8fd9529e6a5",
								true,
							},
							
							{
								"1054feaa-4e56-666a-854e-872911eedc5d",
								true,
							},
							
							{
								"2574fb19-5341-c062-8474-3a4d6622758e",
								true,
							},
							
							{
								"f67f2616-57fb-6fd4-a12e-c0589fc1425e",
								true,
							},
						},
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction3",
						name = "Occult Aqua Breath",
						targetType = "Most Clustered Enemy",
						uuid = "58a6e5a9-9550-80df-be06-16e2ecc614bc",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"3d3f3ae3-e9c5-84d0-bf4e-f87d1173e936",
								true,
							},
							
							{
								"a69e6d29-6193-591f-996c-098369216467",
								true,
							},
							
							{
								"c92a4d44-16a6-d650-b672-b51b4bed0124",
								false,
							},
							
							{
								"6d66f9d6-18f2-eb73-a646-84cbae9d3e07",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Fallback Dequeue",
						uuid = "52d07027-c0d7-2216-9c91-a90c49137b39",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "In Occult Crescent",
						uuid = "3d3f3ae3-e9c5-84d0-bf4e-f87d1173e936",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "7fdcd281-14f9-063b-a49d-42de65643f64",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5333,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Blu mage",
						uuid = "a69e6d29-6193-591f-996c-098369216467",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "c92a4d44-16a6-d650-b672-b51b4bed0124",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						name = "Self Living",
						uuid = "4a596d22-916f-45a6-95f2-47ab2042221d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Self Missing Transcendent",
						uuid = "67b2e0d8-515e-9e87-88fd-548d7eefc9c0",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.mGetPlayer():IsMoving()",
						name = "Self Moving",
						uuid = "93801b13-1545-e36f-9b18-eb9b1a889481",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "dc85700f-2280-7145-bbaf-8044ba6b5887",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil and TimeSince(data.ocCombatTimer) > 2400",
						dequeueIfLuaFalse = true,
						name = "Combat > 2.4s",
						uuid = "94c640c7-3c36-bf3a-bd37-4e63b2ae7ba7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "75b86d7a-236c-2270-bc01-c8fd9529e6a5",
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
								"026e8745-0b51-40e1-8d72-c01188dec537",
								true,
							},
							
							{
								"706bf814-096f-1ff8-b3ea-79ab2ec93733",
								true,
							},
							
							{
								"704657c1-2bea-4355-8f93-1944fb839aa2",
								true,
							},
						},
						dequeueIfLuaFalse = true,
						name = "Aero I/II/III CD",
						partyTargetNumber = 0,
						uuid = "89eb4ac1-6022-83e2-9bee-122b96f1155e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49085,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Aero I CD <= 3",
						uuid = "026e8745-0b51-40e1-8d72-c01188dec537",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49089,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Aero II CD <= 3",
						uuid = "706bf814-096f-1ff8-b3ea-79ab2ec93733",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49091,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Aero III CD <=3",
						uuid = "704657c1-2bea-4355-8f93-1944fb839aa2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,33):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Aqua Breath",
						uuid = "1054feaa-4e56-666a-854e-872911eedc5d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49087,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Aquad Breath CD <= 3",
						uuid = "2574fb19-5341-c062-8474-3a4d6622758e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\" ] or _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\" ] or _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\" ] or _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\" ] == true",
						dequeueIfLuaFalse = true,
						name = "Is Queued",
						uuid = "6d66f9d6-18f2-eb73-a646-84cbae9d3e07",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"BLU Skills\")",
						name = "Toggle",
						uuid = "f67f2616-57fb-6fd4-a12e-c0589fc1425e",
						version = 3,
					},
				},
			},
			name = "P. Blue Offense",
			throttleTime = 250,
			uuid = "720ed207-fa78-661d-96c5-407da5ddf770",
			version = 2,
		},
		inheritedIndex = 55,
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
						actionLua = "local order=data.appallingBehaviorAOEOrder\nif order==nil then order={};data.appallingBehaviorAOEOrder=order end\nlocal actorID=eventArgs.sourceEntityID\nlocal entity=TensorCore.mGetEntity(actorID)\nlocal pos=entity and entity.pos or nil\nlocal entry=nil\nfor _,candidate in ipairs(order) do\n if candidate.sourceEntityID==actorID then entry=candidate;break end\nend\nif entry==nil and pos then\n local bestD2=4.0\n for _,candidate in ipairs(order) do\n  if candidate.sourceEntityID==nil and candidate.x~=nil and candidate.z~=nil then\n   local dx=candidate.x-pos.x\n   local dz=candidate.z-pos.z\n   local d2=dx*dx+dz*dz\n   if d2<=bestD2 then bestD2=d2;entry=candidate end\n  end\n end\nend\nif entry==nil then entry={};order[#order+1]=entry end\nentry.sourceEntityID=actorID\nif pos and entry.type==nil then\n entry.x=pos.x;entry.y=pos.y;entry.z=pos.z;entry.h=pos.h\nend\nself.used=true",
						conditions = 
						{
							
							{
								"3c3d939b-16d6-7cc4-9edc-006f4e8bfea7",
								true,
							},
							
							{
								"3409826e-49e8-f984-8317-5adf62b912fb",
								true,
							},
							
							{
								"f27e8e99-64ab-8f24-b758-530f17ff626a",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Store Keeper Registry + Origin",
						uuid = "b5fae3cc-f31a-2a88-878a-ae4df4fb6c17",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "In North Horn",
						uuid = "3c3d939b-16d6-7cc4-9edc-006f4e8bfea7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						comparator = 3,
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						name = "Old Tether == 0",
						uuid = "3409826e-49e8-f984-8317-5adf62b912fb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						comparator = 3,
						dequeueIfLuaFalse = true,
						eventArgType = 5,
						eventIntValue = 14,
						name = "New Tether == 14",
						uuid = "f27e8e99-64ab-8f24-b758-530f17ff626a",
						version = 3,
					},
				},
			},
			eventType = 15,
			name = "[AppallingBehavior] Store Order",
			uuid = "db4af500-8c21-91b0-9d2b-2b18fddec1f9",
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
						actionLua = "-- Version 1.0\nOCElementalWeakness = {}\n\nOCElementalWeakness.FireTable = {[13741]=true,[13871]=true,[13874]=true,[13875]=true,[13877]=true,[13878]=true,[13884]=true,[13886]=true,[13887]=true,[13890]=true,[13893]=true,[13894]=true,[13895]=true,[13900]=true,[13911]=true,[13919]=true,[13925]=true,[13926]=true,[13931]=true,[13932]=true,[13941]=true,[14491]=true,[14518]=true,[14520]=true,[14714]=true,[14717]=true,[14726]=true,[14735]=true,[14738]=true,[14762]=true,[14765]=true,[14771]=true,[14776]=true,[14785]=true,[14787]=true,[14789]=true,[14790]=true,[14860]=true,[14861]=true,[14862]=true,[14865]=true,[14866]=true,[14869]=true,[14870]=true,[14871]=true,[14878]=true,[14880]=true,[14882]=true,[14885]=true,[14886]=true,[14887]=true,[14888]=true,[14892]=true,[14893]=true,[14894]=true,[14909]=true,[14913]=true,[14915]=true,[14916]=true,[14919]=true,[14929]=true,[14931]=true}\nOCElementalWeakness.IceTable = {[13819]=true,[13873]=true,[13880]=true,[13882]=true,[13885]=true,[13888]=true,[13896]=true,[13897]=true,[13902]=true,[13904]=true,[13907]=true,[13908]=true,[13909]=true,[13914]=true,[13916]=true,[13918]=true,[13920]=true,[13930]=true,[13938]=true,[13939]=true,[14503]=true,[14523]=true,[14719]=true,[14736]=true,[14772]=true,[14791]=true,[14805]=true,[14840]=true,[14841]=true,[14863]=true,[14867]=true,[14869]=true,[14875]=true,[14879]=true,[14881]=true,[14883]=true,[14889]=true,[14895]=true,[14897]=true,[14898]=true,[14902]=true,[14906]=true,[14908]=true,[14914]=true,[14920]=true,[14932]=true}\nOCElementalWeakness.LightningTable = {[13636]=true,[13637]=true,[13702]=true,[13726]=true,[13728]=true,[13729]=true,[13809]=true,[13814]=true,[13815]=true,[13876]=true,[13879]=true,[13881]=true,[13883]=true,[13891]=true,[13903]=true,[13912]=true,[13913]=true,[13915]=true,[13917]=true,[13924]=true,[13928]=true,[13929]=true,[13933]=true,[13934]=true,[13936]=true,[13937]=true,[13942]=true,[14505]=true,[14508]=true,[14509]=true,[14728]=true,[14764]=true,[14774]=true,[14775]=true,[14795]=true,[14799]=true,[14800]=true,[14802]=true,[14804]=true,[14806]=true,[14809]=true,[14817]=true,[14820]=true,[14857]=true,[14858]=true,[14859]=true,[14868]=true,[14874]=true,[14875]=true,[14876]=true,[14877]=true,[14890]=true,[14891]=true,[14900]=true,[14901]=true,[14905]=true,[14922]=true}\nOCElementalWeakness.WindTable = {[13739]=true,[13855]=true,[13856]=true,[13872]=true,[13892]=true,[13898]=true,[13899]=true,[13901]=true,[13905]=true,[13910]=true,[13921]=true,[13922]=true,[13923]=true,[13935]=true,[13940]=true,[14490]=true,[14511]=true,[14512]=true,[14517]=true,[14717]=true,[14764]=true,[14767]=true,[14801]=true,[14864]=true,[14872]=true,[14873]=true,[14878]=true,[14883]=true,[14884]=true,[14896]=true,[14899]=true,[14903]=true,[14904]=true,[14907]=true,[14908]=true,[14910]=true,[14911]=true,[14912]=true,[14917]=true,[14918]=true,[14921]=true,[14923]=true,[14930]=true}\n\nlocal WeaknessLookup = {\n    {table = OCElementalWeakness.FireTable,      element = \"Fire\"},\n    {table = OCElementalWeakness.IceTable,       element = \"Ice\"},\n    {table = OCElementalWeakness.LightningTable, element = \"Lightning\"},\n    {table = OCElementalWeakness.WindTable,      element = \"Wind\"},\n}\n\n\nlocal function entityIsInTable(entity, weaknessTable)\n    if not entity then return false end\n    return weaknessTable[entity.contentid] == true\nend\n\nfunction OCElementalWeakness.returnWeakness(entityid)\n    local isWeak = false\n    local element1 = nil\n    local element2 = nil\n    local entity = TensorCore.mGetEntity(entityid)\n\n    if not entity then return isWeak, element1, element2 end\n\n    for _, entry in ipairs(WeaknessLookup) do\n        if entry.table[entity.contentid] then\n            isWeak = true\n            if element1 == nil then\n                element1 = entry.element\n            else\n                element2 = entry.element\n            end\n        end\n    end\n\n    return isWeak, element1, element2\nend\n\nfunction OCElementalWeakness.returnTargetWeakness()\n    local isWeak = false\n    local element1 = nil\n    local element2 = nil\n    local entity = TensorCore.mGetTarget()\n\n    if not entity then return isWeak, element1, element2 end\n\n    for _, entry in ipairs(WeaknessLookup) do\n        if entry.table[entity.contentid] then\n            isWeak = true\n            if element1 == nil then\n                element1 = entry.element\n            else\n                element2 = entry.element\n            end\n        end\n    end\n\n    return isWeak, element1, element2\nend\n\nfunction OCElementalWeakness.hasFireWeakness(entityid)\n    local entity = TensorCore.mGetEntity(entityid)\n    if entity == nil then return false end\n    return entityIsInTable(entity, OCElementalWeakness.FireTable)\nend\n\nfunction OCElementalWeakness.hasFireWeaknessTarget()\n    local target = TensorCore.mGetTarget()\n    if target == nil then return false end\n    return entityIsInTable(target, OCElementalWeakness.FireTable)\nend\n\nfunction OCElementalWeakness.hasIceWeakness(entityid)\n    local entity = TensorCore.mGetEntity(entityid)\n    if entity == nil then return false end\n    return entityIsInTable(entity, OCElementalWeakness.IceTable)\nend\n\nfunction OCElementalWeakness.hasIceWeaknessTarget()\n    local target = TensorCore.mGetTarget()\n    if target == nil then return false end\n    return entityIsInTable(target, OCElementalWeakness.IceTable)\nend\n\nfunction OCElementalWeakness.hasLightningWeakness(entityid)\n    local entity = TensorCore.mGetEntity(entityid)\n    if entity == nil then return false end\n    return entityIsInTable(entity, OCElementalWeakness.LightningTable)\nend\n\nfunction OCElementalWeakness.hasLightningWeaknessTarget()\n    local target = TensorCore.mGetTarget()\n    if target == nil then return false end\n    return entityIsInTable(target, OCElementalWeakness.LightningTable)\nend\n\nfunction OCElementalWeakness.hasWindWeakness(entityid)\n    local entity = TensorCore.mGetEntity(entityid)\n    if entity == nil then return false end\n    return entityIsInTable(entity, OCElementalWeakness.WindTable)\nend\n\nfunction OCElementalWeakness.hasWindWeaknessTarget()\n    local target = TensorCore.mGetTarget()\n    if target == nil then return false end\n    return entityIsInTable(target, OCElementalWeakness.WindTable)\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"a097f95b-d712-26bb-bc3c-67e7d96a3d54",
								true,
							},
							
							{
								"a9e10e6e-ef84-7cd4-a7d7-87aa1d246d21",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						uuid = "171ad113-405d-9cc2-a0c3-98ef6411eff2",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "Occult Crescent",
						uuid = "a097f95b-d712-26bb-bc3c-67e7d96a3d54",
						version = 3,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCElementalWeakness == nil",
						dequeueIfLuaFalse = true,
						name = "Is Loaded",
						uuid = "a9e10e6e-ef84-7cd4-a7d7-87aa1d246d21",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return true",
						name = "Version 1.0",
						uuid = "ccbb38f1-0010-7282-8939-ac5c809936e9",
						version = 3,
					},
				},
			},
			eventType = 12,
			name = "[Misc] Elemental Weakness Funcs",
			throttleTime = 1000,
			uuid = "c7932cb2-aedb-9f4c-8d8b-c5f9c3b85e62",
			version = 2,
		},
		inheritedIndex = 57,
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
						actionLua = "--[[ ============================================================================\n\tOCGUI - Occult Crescent shared toggle GUI\n\n\tThree files live in LuaMods\\ffxivminion\\occultgui\\ :\n\t  Settings.lua      GUI prefs, each toggle's on/off state, the target lists\n\t  Toggles.lua       every toggle definition ever added, in display order\n\t  ListWindows.lua   every target list window ever added\n\n\tAnything added through AddToggle / AddListWindow is written to disk and is\n\tpermanent: it comes back on its own next session even if nothing registers\n\tit again. Use RemoveToggle / RemoveListWindow to actually get rid of one.\n\n\tPublic API (call these from any other reaction):\n\n\t  OCGUI.AddToggle(name, opts)   add/refresh a toggle. Safe to re-call.\n\t      opts.default    bool   value the first time it is ever seen   (true)\n\t      opts.shown      bool   listed on the on-screen toggle bar     (true)\n\t      opts.group      num    which toggle bar window it lives in    (1)\n\t      opts.job        str    \"global\" or an OCGUI.JobTable value    (\"global\")\n\t      opts.phantom    num    phantom job buff id, 0 = always        (0)\n\t      opts.tab        str    settings window tab it is listed under  (\"Main\")\n\t      opts.index      num    insert position in the list            (append)\n\t      opts.tooltip    str    hover text in the settings window      (nil)\n\t      opts.condition  func   function(name) return bool end, extra availability\n\t                             check. NOT saved - functions cannot be written to\n\t                             disk, so re-register each session to reapply it.\n\n\t  OCGUI.RemoveToggle(name)      delete it, from memory and from Toggles.lua\n\t  OCGUI.IsAvailable(name)       does this toggle exist\n\t  OCGUI.IsActive(name)          exists AND phantom job/condition satisfied\n\t  OCGUI.IsEnabled(name)         exists AND switched on\n\t  OCGUI.GetToggle(name)         current value, or nil if it does not exist\n\t  OCGUI.SetToggle(name, value)  set + save\n\t  OCGUI.SetShown(name, value)   show/hide on the toggle bar + save\n\t  OCGUI.ResetToggles()          every toggle back to its default value\n\n\t  Tabs group toggles in the settings window only; the on-screen toggle bar\n\t  is still split by opts.group. A tab appears as soon as something asks for\n\t  it, and the strip is hidden while everything is on one tab. Past\n\t  OCGUI.settings.TogglesPerColumn (10) entries a tab spills into a new column.\n\n\t  OCGUI.GetTabs()               tab names, in the order they first appear\n\t  OCGUI.GetTabToggles(tab)      the toggles on a tab, current job only\n\t  OCGUI.GetActiveTab()          returns activeTabName, tabNames\n\t  OCGUI.SetActiveTab(name)      switch tab + save\n\n\t  OCGUI.AddListWindow(id, opts) target list window, saved to ListWindows.lua\n\t      opts.key        str    OCGUI.settings[key] holds the [contentid]=name\n\t                             table, so other reactions can read it directly\n\t      opts.title, opts.buttonLabel, opts.help, opts.emptyText,\n\t      opts.sameline, opts.width, opts.height\n\t  OCGUI.RemoveListWindow(id)\n\t  OCGUI.GetList(key) / OCGUI.InList(key, contentid)\n\n\t  OCGUI.AddButton(label, fn, opts)   button in \"Additional Settings\"\n\t  OCGUI.AddWindow(id, opts)          custom window, opts.draw = function(win)\n\t                                     runtime only, draw functions cannot be saved\n\t  OCGUI.OpenWindow(id, open)         open/close/flip a window\n\n\tHooking in from another reaction. Register once, on a condition that goes\n\tfalse again as soon as the work is done:\n\n\t  condition:  return OCGUI ~= nil and OCGUI.init == true\n\t                  and not OCGUI.IsAvailable(\"My Toggle\")\n\t  action:     OCGUI.AddToggle(\"My Toggle\", {phantom = 4369})\n\n\tRead the value later with OCGUI.IsEnabled(\"My Toggle\"), which is nil safe\n\teven before the toggle exists. See the \"[Extra] Example Toggles\" reaction\n\tfor a working example.\n============================================================================ ]]\n\nif OCGUI == nil then\n\tOCGUI = {}\nend\nif OCGUI.init ~= true then\n\tOCGUI.lastTick = Now()\n\n\t-- Saved to Toggles.lua / ListWindows.lua. Arrays, because the order they\n\t-- sit in is the order they are drawn in.\n\tOCGUI.toggles = {}\n\tOCGUI.listWindows = {}\n\n\t-- Runtime only. registry indexes OCGUI.toggles by name; windows and buttons\n\t-- hold live draw state and closures, which cannot be written to disk.\n\tOCGUI.registry = {}\n\tOCGUI.windows = {}\n\tOCGUI.buttons = {}\n\n\tOCGUI.GUI = {\n\t\topen = false,\n\t\tvisible = false\n\t}\n\n\t-- Saved to Settings.lua. Toggles.data is the user's on/off state only.\n\tOCGUI.settings = {\n\t\tLockedToggles = false,\n\t\tToggleColorEnable = {a = 1, b = 0.519, g = 0.268, r = 0.114},\n\t\tToggleColorDisable = {r = 0.070, g = 0.070, b = 0.070, a = .749},\n\t\tToggleBGAlpha = 0.45,\n\t\tToggleScale = 1,\n\t\tToggleHeight = 30,\n\t\tToggleWidth = 105,\n\t\tTogglesPerColumn = 10, -- settings window starts a new column past this many\n\t\tActiveTab = \"Main\",\n\t\tToggles = {\n\t\t\tdata = {}\n\t\t}\n\t}\n\n\tOCGUI.PhantomBuffs =\n\t{\n\t\tGlobal = 0,\n\t\tFreelancer = 4242,\n\t\tKnight = 4358,\n\t\tBerserker = 4359,\n\t\tMonk = 4360,\n\t\tRanger = 4361,\n\t\tSamurai = 4362,\n\t\tBard = 4363,\n\t\tGeomancer = 4364,\n\t\tTimeMage = 4365,\n\t\tCannoneer = 4366,\n\t\tChemist = 4397,\n\t\tOracle = 4368,\n\t\tThief = 4369,\n\t\tMysticKnight = 4803,\n\t\tGladiator = 4804,\n\t\tDancer = 4805,\n\t\tNinja = 5328,\n\t\tWhiteMage = 5329,\n\t\tBlackMage = 5330,\n\t\tDragoon = 5331,\n\t\tSummoner = 5332,\n\t\tBlueMage = 5333,\n\t\tRedMage = 5334,\n\t\tNecromancer = 5335\n\t}\n\n\tOCGUI.JobTable = {\n\t}\n\n\tOCGUI.LuaPath = GetLuaModsPath()\n\tOCGUI.SettingsPath = OCGUI.LuaPath .. [[ffxivminion\\occultgui\\]]\n\tOCGUI.SettingsFile = OCGUI.SettingsPath .. [[Settings.lua]]\n\tOCGUI.TogglesFile = OCGUI.SettingsPath .. [[Toggles.lua]]\n\tOCGUI.ListWindowsFile = OCGUI.SettingsPath .. [[ListWindows.lua]]\n\n\tlocal v = table.valid\n\tfunction OCGUI.valid(...)\n\t\tlocal tbl = {...}\n\t\tlocal size = #tbl\n\t\tif size > 0 then\n\t\t\tlocal count = tbl[1]\n\t\t\tif type(count) == \"number\" then\n\t\t\t\tif size == (count + 1) then\n\t\t\t\t\tfor i = 2, size do\n\t\t\t\t\t\tif not v(tbl[i]) then\n\t\t\t\t\t\t\treturn false\n\t\t\t\t\t\tend\n\t\t\t\t\tend\n\t\t\t\t\treturn true\n\t\t\t\tend\n\t\t\telse\n\t\t\t\tfor i = 1, size do\n\t\t\t\t\tif not v(tbl[i]) then\n\t\t\t\t\t\treturn false\n\t\t\t\t\tend\n\t\t\t\tend\n\t\t\t\treturn true\n\t\t\tend\n\t\tend\n\t\treturn false\n\tend\n\tlocal valid = OCGUI.valid\n\n\tlocal function ensureFolder()\n\t\tif (not FolderExists(OCGUI.SettingsPath)) then\n\t\t\tFolderCreate(OCGUI.SettingsPath)\n\t\tend\n\tend\n\n\t-- ===================== settings =====================\n\n\tfunction OCGUI.LoadSettings()\n\t\tensureFolder()\n\t\tlocal tbl = FileLoad(OCGUI.SettingsFile)\n\t\tlocal function scan(tbl, tbl2, depth)\n\t\t\tdepth = depth or 0\n\t\t\tif valid(2, tbl, tbl2) then\n\t\t\t\tfor k, v in pairs(tbl2) do\n\t\t\t\t\tif type(v) == \"table\" then\n\t\t\t\t\t\tif tbl[k] and valid(tbl[k]) then\n\t\t\t\t\t\t\ttbl[k] = table.merge(tbl[k], scan(tbl[k], v, depth + 1))\n\t\t\t\t\t\telse\n\t\t\t\t\t\t\ttbl[k] = v\n\t\t\t\t\t\tend\n\t\t\t\t\telse\n\t\t\t\t\t\tif tbl[k] ~= tbl2[k] then\n\t\t\t\t\t\t\ttbl[k] = tbl2[k]\n\t\t\t\t\t\tend\n\t\t\t\t\tend\n\t\t\t\tend\n\t\t\tend\n\t\t\treturn tbl\n\t\tend\n\t\tOCGUI.settings = scan(OCGUI.settings, tbl)\n\t\t-- definitions used to live in here; they have their own file now\n\t\tOCGUI.settings.Toggles.order = nil\n\tend\n\n\tfunction OCGUI.SaveSettings()\n\t\tif table.deepcompare(OCGUI.settings, OCGUI.PreviousSave) then\n\t\t\treturn\n\t\tend\n\t\tensureFolder()\n\n\t\tFileSave(OCGUI.SettingsFile, OCGUI.settings)\n\t\tOCGUI.PreviousSave = table.deepcopy(OCGUI.settings)\n\t\td(\"[OCGUI] Settings saved\")\n\tend\n\n\t-- ===================== toggles =====================\n\n\t-- Only these fields go to disk. Anything else on a definition (condition,\n\t-- active) is runtime and would break FileSave or go stale.\n\tlocal function toggleRecord(def)\n\t\treturn {\n\t\t\tname = def.name,\n\t\t\ttab = def.tab,\n\t\t\tgroup = def.group,\n\t\t\tjob = def.job,\n\t\t\tphantom = def.phantom,\n\t\t\ttooltip = def.tooltip,\n\t\t\tdefault = def.default,\n\t\t\tdefaultShown = def.defaultShown\n\t\t}\n\tend\n\n\tfunction OCGUI.SaveToggles()\n\t\tlocal records = {}\n\t\tfor i, def in ipairs(OCGUI.toggles) do\n\t\t\trecords[i] = toggleRecord(def)\n\t\tend\n\t\tif table.deepcompare(records, OCGUI.PreviousToggles) then\n\t\t\treturn\n\t\tend\n\t\tensureFolder()\n\n\t\tFileSave(OCGUI.TogglesFile, records)\n\t\tOCGUI.PreviousToggles = table.deepcopy(records)\n\t\td(\"[OCGUI] Toggles saved (\" .. #records .. \")\")\n\tend\n\n\tlocal function makeToggleDef(name, opts)\n\t\tlocal tab = opts.tab\n\t\tif type(tab) ~= \"string\" or tab == \"\" then\n\t\t\ttab = \"Main\"\n\t\tend\n\t\treturn {\n\t\t\tname = name,\n\t\t\ttab = tab,\n\t\t\tgroup = opts.group or 1,\n\t\t\tjob = opts.job or \"global\",\n\t\t\tphantom = opts.phantom or 0,\n\t\t\ttooltip = opts.tooltip,\n\t\t\tdefault = (opts.default ~= false),\n\t\t\tdefaultShown = (opts.shown ~= false)\n\t\t}\n\tend\n\n\t-- Adds the definition, or refreshes one that is already there. Never saves,\n\t-- so it can be used both by the loader and by AddToggle.\n\tlocal function applyToggle(def, index)\n\t\tlocal existing = OCGUI.registry[def.name]\n\t\tif existing ~= nil then\n\t\t\texisting.tab = def.tab\n\t\t\texisting.group = def.group\n\t\t\texisting.job = def.job\n\t\t\texisting.phantom = def.phantom\n\t\t\texisting.tooltip = def.tooltip\n\t\t\texisting.default = def.default\n\t\t\texisting.defaultShown = def.defaultShown\n\t\t\tdef = existing\n\t\telse\n\t\t\tlocal pos = #OCGUI.toggles + 1\n\t\t\tif type(index) == \"number\" then\n\t\t\t\tpos = math.max(1, math.min(math.floor(index), pos))\n\t\t\tend\n\t\t\ttable.insert(OCGUI.toggles, pos, def)\n\t\t\tOCGUI.registry[def.name] = def\n\t\tend\n\n\t\tif OCGUI.settings.Toggles.data[def.name] == nil then\n\t\t\tOCGUI.settings.Toggles.data[def.name] = {bool = def.default, shown = def.defaultShown}\n\t\tend\n\t\treturn def\n\tend\n\n\tfunction OCGUI.LoadToggles()\n\t\tOCGUI.toggles = {}\n\t\tOCGUI.registry = {}\n\n\t\tlocal stored = FileLoad(OCGUI.TogglesFile)\n\t\tif table.valid(stored) then\n\t\t\tfor _, rec in ipairs(stored) do\n\t\t\t\tif type(rec) == \"table\" and type(rec.name) == \"string\" and rec.name ~= \"\" then\n\t\t\t\t\tapplyToggle(\n\t\t\t\t\t\tmakeToggleDef(\n\t\t\t\t\t\t\trec.name,\n\t\t\t\t\t\t\t{\n\t\t\t\t\t\t\t\ttab = rec.tab,\n\t\t\t\t\t\t\t\tgroup = rec.group,\n\t\t\t\t\t\t\t\tjob = rec.job,\n\t\t\t\t\t\t\t\tphantom = rec.phantom,\n\t\t\t\t\t\t\t\ttooltip = rec.tooltip,\n\t\t\t\t\t\t\t\tdefault = rec.default,\n\t\t\t\t\t\t\t\tshown = rec.defaultShown\n\t\t\t\t\t\t\t}\n\t\t\t\t\t\t)\n\t\t\t\t\t)\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\n\t\tlocal records = {}\n\t\tfor i, def in ipairs(OCGUI.toggles) do\n\t\t\trecords[i] = toggleRecord(def)\n\t\tend\n\t\tOCGUI.PreviousToggles = records\n\tend\n\n\tfunction OCGUI.AddToggle(name, opts)\n\t\tif type(name) ~= \"string\" or name == \"\" then\n\t\t\td(\"[OCGUI] AddToggle needs a non-empty string name\")\n\t\t\treturn false\n\t\tend\n\t\topts = opts or {}\n\n\t\tlocal def = applyToggle(makeToggleDef(name, opts), opts.index)\n\t\tdef.condition = opts.condition -- runtime only, never saved\n\t\tdef.active = OCGUI.EvaluateToggle(name)\n\n\t\tOCGUI.SaveToggles()\n\t\tOCGUI.SaveSettings()\n\t\treturn true\n\tend\n\n\tfunction OCGUI.RemoveToggle(name)\n\t\tif OCGUI.registry[name] == nil then\n\t\t\treturn false\n\t\tend\n\t\tOCGUI.registry[name] = nil\n\t\tfor i = #OCGUI.toggles, 1, -1 do\n\t\t\tif OCGUI.toggles[i].name == name then\n\t\t\t\ttable.remove(OCGUI.toggles, i)\n\t\t\tend\n\t\tend\n\t\tOCGUI.settings.Toggles.data[name] = nil\n\n\t\tOCGUI.SaveToggles()\n\t\tOCGUI.SaveSettings()\n\t\treturn true\n\tend\n\n\tfunction OCGUI.IsAvailable(name)\n\t\treturn OCGUI.registry[name] ~= nil\n\tend\n\n\t-- Is the phantom job equipped / custom condition satisfied right now?\n\tfunction OCGUI.EvaluateToggle(name)\n\t\tlocal def = OCGUI.registry[name]\n\t\tif def == nil then\n\t\t\treturn false\n\t\tend\n\t\tif def.condition ~= nil then\n\t\t\tif not def.condition(name) then\n\t\t\t\treturn false\n\t\t\tend\n\t\tend\n\t\tif def.phantom ~= 0 then\n\t\t\tlocal player = TensorCore.mGetPlayer()\n\t\t\tif player == nil or not HasBuffs(player, def.phantom) then\n\t\t\t\treturn false\n\t\t\tend\n\t\tend\n\t\treturn true\n\tend\n\n\tfunction OCGUI.RefreshToggles()\n\t\tfor _, def in ipairs(OCGUI.toggles) do\n\t\t\tdef.active = OCGUI.EvaluateToggle(def.name)\n\t\tend\n\tend\n\n\tfunction OCGUI.IsActive(name)\n\t\tlocal def = OCGUI.registry[name]\n\t\treturn def ~= nil and def.active == true\n\tend\n\n\tfunction OCGUI.IsEnabled(name)\n\t\tlocal entry = OCGUI.settings.Toggles.data[name]\n\t\treturn OCGUI.registry[name] ~= nil and entry ~= nil and entry.bool == true\n\tend\n\n\tfunction OCGUI.GetToggle(name)\n\t\tlocal entry = OCGUI.settings.Toggles.data[name]\n\t\tif OCGUI.registry[name] == nil or entry == nil then\n\t\t\treturn nil\n\t\tend\n\t\treturn entry.bool\n\tend\n\n\tfunction OCGUI.SetToggle(name, value)\n\t\tlocal entry = OCGUI.settings.Toggles.data[name]\n\t\tif entry == nil then\n\t\t\treturn false\n\t\tend\n\t\tentry.bool = (value == true)\n\t\tOCGUI.SaveSettings()\n\t\treturn true\n\tend\n\n\tfunction OCGUI.SetShown(name, value)\n\t\tlocal entry = OCGUI.settings.Toggles.data[name]\n\t\tif entry == nil then\n\t\t\treturn false\n\t\tend\n\t\tentry.shown = (value == true)\n\t\tOCGUI.SaveSettings()\n\t\treturn true\n\tend\n\n\t-- Does this toggle belong to the job we are on?\n\tfunction OCGUI.MatchesJob(name)\n\t\tlocal def = OCGUI.registry[name]\n\t\tif def == nil then\n\t\t\treturn false\n\t\tend\n\t\tif def.job == \"global\" then\n\t\t\treturn true\n\t\tend\n\t\tlocal player = TensorCore.mGetPlayer()\n\t\treturn player ~= nil and def.job == OCGUI.JobTable[player.job]\n\tend\n\n\t-- ===================== tabs =====================\n\t-- Settings window only. The on-screen toggle bar is still split by group.\n\n\t-- Tab names in the order their first toggle appears, skipping tabs whose\n\t-- toggles all belong to another job.\n\tfunction OCGUI.GetTabs()\n\t\tlocal tabs, seen = {}, {}\n\t\tfor _, def in ipairs(OCGUI.toggles) do\n\t\t\tif not seen[def.tab] and OCGUI.MatchesJob(def.name) then\n\t\t\t\tseen[def.tab] = true\n\t\t\t\ttable.insert(tabs, def.tab)\n\t\t\tend\n\t\tend\n\t\treturn tabs\n\tend\n\n\t---@param tab string\n\tfunction OCGUI.GetTabToggles(tab)\n\t\tlocal out = {}\n\t\tfor _, def in ipairs(OCGUI.toggles) do\n\t\t\tif def.tab == tab and OCGUI.MatchesJob(def.name) then\n\t\t\t\ttable.insert(out, def)\n\t\t\tend\n\t\tend\n\t\treturn out\n\tend\n\n\t-- The saved tab, or the first one if it has gone away. Also hands back the\n\t-- tab list so the caller does not have to build it twice.\n\tfunction OCGUI.GetActiveTab()\n\t\tlocal tabs = OCGUI.GetTabs()\n\t\tfor _, name in ipairs(tabs) do\n\t\t\tif name == OCGUI.settings.ActiveTab then\n\t\t\t\treturn name, tabs\n\t\t\tend\n\t\tend\n\t\treturn tabs[1], tabs\n\tend\n\n\tfunction OCGUI.SetActiveTab(name)\n\t\tif type(name) ~= \"string\" or name == \"\" then\n\t\t\treturn false\n\t\tend\n\t\tif OCGUI.settings.ActiveTab ~= name then\n\t\t\tOCGUI.settings.ActiveTab = name\n\t\t\tOCGUI.SaveSettings()\n\t\tend\n\t\treturn true\n\tend\n\n\t-- Values only. The definitions stay, that is the point of them being saved.\n\tfunction OCGUI.ResetToggles()\n\t\tfor _, def in ipairs(OCGUI.toggles) do\n\t\t\tOCGUI.settings.Toggles.data[def.name] = {bool = def.default, shown = def.defaultShown}\n\t\tend\n\t\tOCGUI.SaveSettings()\n\tend\n\n\t-- ===================== buttons & windows =====================\n\n\tfunction OCGUI.AddButton(label, callback, opts)\n\t\topts = opts or {}\n\t\tfor _, button in ipairs(OCGUI.buttons) do\n\t\t\tif button.label == label then\n\t\t\t\tbutton.callback = callback\n\t\t\t\tbutton.sameline = (opts.sameline == true)\n\t\t\t\treturn true\n\t\t\tend\n\t\tend\n\t\ttable.insert(\n\t\t\tOCGUI.buttons,\n\t\t\t{label = label, callback = callback, sameline = (opts.sameline == true)}\n\t\t)\n\t\treturn true\n\tend\n\n\tfunction OCGUI.RemoveButton(label)\n\t\tfor i, button in ipairs(OCGUI.buttons) do\n\t\t\tif button.label == label then\n\t\t\t\ttable.remove(OCGUI.buttons, i)\n\t\t\t\treturn true\n\t\t\tend\n\t\tend\n\t\treturn false\n\tend\n\n\t-- Runtime only: opts.draw is a function, so this cannot be saved.\n\t-- opts: title, width, height, draw(win), button (false to skip the auto\n\t-- button), buttonLabel, sameline\n\tfunction OCGUI.AddWindow(id, opts)\n\t\tif type(id) ~= \"string\" or id == \"\" then\n\t\t\td(\"[OCGUI] AddWindow needs a non-empty string id\")\n\t\t\treturn nil\n\t\tend\n\t\topts = opts or {}\n\n\t\tlocal win = OCGUI.windows[id] or {id = id, open = false, visible = false}\n\t\twin.title = opts.title or id\n\t\twin.width = opts.width or 350\n\t\twin.height = opts.height or 500\n\t\twin.draw = opts.draw\n\t\twin.buttonLabel = opts.buttonLabel or win.title\n\t\tOCGUI.windows[id] = win\n\n\t\tif opts.button ~= false then\n\t\t\tOCGUI.AddButton(\n\t\t\t\twin.buttonLabel,\n\t\t\t\tfunction()\n\t\t\t\t\twin.open = not win.open\n\t\t\t\tend,\n\t\t\t\t{sameline = opts.sameline}\n\t\t\t)\n\t\tend\n\t\treturn win\n\tend\n\n\tfunction OCGUI.RemoveWindow(id)\n\t\tlocal win = OCGUI.windows[id]\n\t\tif win == nil then\n\t\t\treturn false\n\t\tend\n\t\tOCGUI.RemoveButton(win.buttonLabel or win.title)\n\t\tOCGUI.windows[id] = nil\n\t\treturn true\n\tend\n\n\t-- open = true/false, or nil to flip\n\tfunction OCGUI.OpenWindow(id, open)\n\t\tlocal win = OCGUI.windows[id]\n\t\tif win == nil then\n\t\t\treturn false\n\t\tend\n\t\tif open == nil then\n\t\t\twin.open = not win.open\n\t\telse\n\t\t\twin.open = (open == true)\n\t\tend\n\t\treturn true\n\tend\n\n\t-- ===================== list windows =====================\n\n\tfunction OCGUI.GetList(key)\n\t\treturn OCGUI.settings[key]\n\tend\n\n\tfunction OCGUI.InList(key, contentid)\n\t\tlocal list = OCGUI.settings[key]\n\t\treturn list ~= nil and list[contentid] ~= nil\n\tend\n\n\t-- Shared body of every target list window.\n\tfunction OCGUI.DrawTargetList(win, rec)\n\t\tlocal list = OCGUI.settings[rec.key]\n\t\tif list == nil then\n\t\t\tlist = {}\n\t\t\tOCGUI.settings[rec.key] = list\n\t\tend\n\n\t\tGUI:Text(rec.help or \"First select a target to add\\nThen press the Add Target button\")\n\t\tGUI:SameLine()\n\t\tlocal width = GUI:GetContentRegionAvailWidth()\n\t\tGUI:Dummy((width - 90), 0)\n\t\tGUI:SameLine()\n\t\tif GUI:Button(\"Add Target##\" .. win.id) then\n\t\t\tlocal target = TensorCore.mGetTarget()\n\t\t\tif target ~= nil then\n\t\t\t\tif target.attackable and target.contentid ~= 0 then\n\t\t\t\t\tif not list[target.contentid] then\n\t\t\t\t\t\tlist[target.contentid] = target.name\n\t\t\t\t\t\tOCGUI.SaveSettings()\n\t\t\t\t\telse\n\t\t\t\t\t\tAnyoneCore.Shotcall(\"Entry for \" .. target.name .. \" already exists!\", false, 5, false)\n\t\t\t\t\tend\n\t\t\t\tend\n\t\t\telse\n\t\t\t\td(\"No target to add\")\n\t\t\tend\n\t\tend\n\n\t\tGUI:Text(\"Filter\")\n\t\tGUI:SameLine()\n\t\tGUI:PushItemWidth(GUI:GetContentRegionAvailWidth())\n\t\tlocal newText, changed = GUI:InputText(\"##filter\" .. win.id, win.filter or \"\", 256)\n\t\tGUI:PopItemWidth()\n\t\tif changed then\n\t\t\twin.filter = newText\n\t\tend\n\n\t\tGUI:BeginChild(win.id .. \"ScrollRegion\", 0, 0, true)\n\t\tif table.valid(list) then\n\t\t\tlocal filter = string.lower(win.filter or \"\")\n\t\t\tfor contentid, name in pairs(list) do\n\t\t\t\tlocal combined = name .. \" [\" .. contentid .. \"]\"\n\t\t\t\t-- plain find, so \"(\" in a name cannot blow up the filter\n\t\t\t\tif filter == \"\" or string.find(string.lower(combined), filter, 1, true) then\n\t\t\t\t\tif GUI:Button(\"Remove##\" .. win.id .. contentid) then\n\t\t\t\t\t\tlist[contentid] = nil\n\t\t\t\t\t\tOCGUI.SaveSettings()\n\t\t\t\t\tend\n\t\t\t\t\tGUI:SameLine()\n\t\t\t\t\tGUI:Text(combined)\n\t\t\t\tend\n\t\t\tend\n\t\telse\n\t\t\tGUI:Text(rec.emptyText or \"Nothing in here yet! :>\")\n\t\tend\n\t\tGUI:EndChild()\n\tend\n\n\tlocal function listWindowRecord(rec)\n\t\treturn {\n\t\t\tid = rec.id,\n\t\t\ttitle = rec.title,\n\t\t\tbuttonLabel = rec.buttonLabel,\n\t\t\tkey = rec.key,\n\t\t\thelp = rec.help,\n\t\t\temptyText = rec.emptyText,\n\t\t\tsameline = rec.sameline,\n\t\t\twidth = rec.width,\n\t\t\theight = rec.height\n\t\t}\n\tend\n\n\tfunction OCGUI.SaveListWindows()\n\t\tlocal records = {}\n\t\tfor i, rec in ipairs(OCGUI.listWindows) do\n\t\t\trecords[i] = listWindowRecord(rec)\n\t\tend\n\t\tif table.deepcompare(records, OCGUI.PreviousListWindows) then\n\t\t\treturn\n\t\tend\n\t\tensureFolder()\n\n\t\tFileSave(OCGUI.ListWindowsFile, records)\n\t\tOCGUI.PreviousListWindows = table.deepcopy(records)\n\t\td(\"[OCGUI] List windows saved (\" .. #records .. \")\")\n\tend\n\n\t-- Builds the live window for a stored record. No saving, so the loader and\n\t-- AddListWindow can share it.\n\tlocal function applyListWindow(rec)\n\t\tif OCGUI.settings[rec.key] == nil then\n\t\t\tOCGUI.settings[rec.key] = {}\n\t\tend\n\n\t\tlocal win =\n\t\t\tOCGUI.AddWindow(\n\t\t\trec.id,\n\t\t\t{\n\t\t\t\ttitle = rec.title,\n\t\t\t\twidth = rec.width,\n\t\t\t\theight = rec.height,\n\t\t\t\tbuttonLabel = rec.buttonLabel,\n\t\t\t\tsameline = rec.sameline,\n\t\t\t\tdraw = function(w)\n\t\t\t\t\tOCGUI.DrawTargetList(w, rec)\n\t\t\t\tend\n\t\t\t}\n\t\t)\n\t\tif win ~= nil then\n\t\t\twin.filter = win.filter or \"\"\n\t\t\twin.listKey = rec.key\n\t\tend\n\t\treturn win\n\tend\n\n\tlocal function makeListWindowRec(id, opts)\n\t\treturn {\n\t\t\tid = id,\n\t\t\ttitle = opts.title or id,\n\t\t\tbuttonLabel = opts.buttonLabel or opts.title or id,\n\t\t\tkey = opts.key or id,\n\t\t\thelp = opts.help,\n\t\t\temptyText = opts.emptyText,\n\t\t\tsameline = (opts.sameline == true),\n\t\t\twidth = opts.width or 350,\n\t\t\theight = opts.height or 500\n\t\t}\n\tend\n\n\tlocal function findListWindow(id)\n\t\tfor i, rec in ipairs(OCGUI.listWindows) do\n\t\t\tif rec.id == id then\n\t\t\t\treturn i, rec\n\t\t\tend\n\t\tend\n\t\treturn nil\n\tend\n\n\tfunction OCGUI.LoadListWindows()\n\t\tOCGUI.listWindows = {}\n\n\t\tlocal stored = FileLoad(OCGUI.ListWindowsFile)\n\t\tif table.valid(stored) then\n\t\t\tfor _, rec in ipairs(stored) do\n\t\t\t\tif type(rec) == \"table\" and type(rec.id) == \"string\" and rec.id ~= \"\" then\n\t\t\t\t\tlocal built = makeListWindowRec(rec.id, rec)\n\t\t\t\t\ttable.insert(OCGUI.listWindows, built)\n\t\t\t\t\tapplyListWindow(built)\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\n\t\tlocal records = {}\n\t\tfor i, rec in ipairs(OCGUI.listWindows) do\n\t\t\trecords[i] = listWindowRecord(rec)\n\t\tend\n\t\tOCGUI.PreviousListWindows = records\n\tend\n\n\tfunction OCGUI.AddListWindow(id, opts)\n\t\tif type(id) ~= \"string\" or id == \"\" then\n\t\t\td(\"[OCGUI] AddListWindow needs a non-empty string id\")\n\t\t\treturn nil\n\t\tend\n\t\topts = opts or {}\n\n\t\tlocal built = makeListWindowRec(id, opts)\n\t\tlocal index = findListWindow(id)\n\t\tif index ~= nil then\n\t\t\tOCGUI.listWindows[index] = built\n\t\telse\n\t\t\ttable.insert(OCGUI.listWindows, built)\n\t\tend\n\n\t\tlocal win = applyListWindow(built)\n\t\tOCGUI.SaveListWindows()\n\t\tOCGUI.SaveSettings()\n\t\treturn win\n\tend\n\n\tfunction OCGUI.RemoveListWindow(id)\n\t\tlocal index = findListWindow(id)\n\t\tif index == nil then\n\t\t\treturn false\n\t\tend\n\t\ttable.remove(OCGUI.listWindows, index)\n\t\tOCGUI.RemoveWindow(id)\n\t\tOCGUI.SaveListWindows()\n\t\treturn true\n\tend\n\n\t-- ===================== start up =====================\n\n\tOCGUI.LoadSettings()\n\tOCGUI.LoadToggles()\n\tOCGUI.LoadListWindows()\n\tOCGUI.RefreshToggles()\n\n\t-- Nothing is registered here on purpose. The stock toggles and list windows\n\t-- live in the \"[Extra] Example Toggles\" reaction, which hooks into this API\n\t-- exactly the way a third party reaction would. Anything either of them adds\n\t-- is saved, so it survives on its own from then on.\n\tOCGUI.init = true\n\tOCGUI.SaveSettings()\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"1d38aceb-831a-88f5-8452-17c4b312c663",
								false,
							},
							
							{
								"c9ab060f-fb19-9be7-97f2-bca853a67c87",
								true,
							},
						},
						gVar = "ACR_RikuAST2_CD",
						name = "Init",
						uuid = "be19cab4-1f6d-bf2f-9928-e3acf5ba49c3",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "if OCGUI.GUI.open then\n\tGUI:SetNextWindowSize(280, 0, GUI.SetCond_Appearing)\n\tOCGUI.GUI.visible, OCGUI.GUI.open = GUI:Begin(\"Occult Crescent Settings\", OCGUI.GUI.open)\n\tif OCGUI.GUI.visible then\n\t\tlocal changed\n\t\tOCGUI.settings.LockedToggles, changed =\n\t\t\tGUI:Checkbox(GetString(\"Lock Toggle GUI\"), OCGUI.settings.LockedToggles)\n\t\tif changed then\n\t\t\tOCGUI.SaveSettings()\n\t\tend\n\n\t\tGUI:Separator()\n\n\t\t-- This ImGui build has no BeginTabBar, so the tab strip is a row of\n\t\t-- buttons with the active one tinted. Hidden entirely while everything\n\t\t-- sits on one tab.\n\t\tlocal tabsPerRow = 5\n\t\tlocal tabStripWidth = 0\n\t\tlocal active, tabs = OCGUI.GetActiveTab()\n\t\tif #tabs > 1 then\n    \t\tlocal rowWidth = 0\n    \t\tfor i, tab in ipairs(tabs) do\n        \t\tlocal tabWidth = GUI:CalcTextSize(tab) + 16\n        \t\tif (i % tabsPerRow) == 1 then\n            \t\trowWidth = tabWidth          -- start a new row\n        \t\telse\n            \tGUI:SameLine()\n            \trowWidth = rowWidth + 8 + tabWidth\n        \t\tend\n        \t\tif rowWidth > tabStripWidth then\n            \t\ttabStripWidth = rowWidth     -- widest row wins\n        \t\tend\n\n\t\t\t\tlocal isActive = (tab == active)\n\t\t\t\tif isActive then\n\t\t\t\t\tlocal c = OCGUI.settings.ToggleColorEnable\n\t\t\t\t\tGUI:PushStyleColor(GUI.Col_Button, c.r, c.g, c.b, c.a)\n\t\t\t\tend\n\t\t\t\tif GUI:Button(tab .. \"##ocguitab\") then\n\t\t\t\t\tOCGUI.SetActiveTab(tab)\n\t\t\t\tend\n\t\t\t\tif isActive then\n\t\t\t\t\tGUI:PopStyleColor()\n\t\t\t\tend\n\t\t\tend\n\t\t\tGUI:Separator()\n\t\tend\n\n\t\tGUI:Text(\"Toggles:\")\n\n\t\tlocal data = OCGUI.settings.Toggles.data\n\t\tlocal visible = {}\n\t\tif active ~= nil then\n\t\t\tvisible = OCGUI.GetTabToggles(active)\n\t\tend\n\n\t\t-- Spill into a new column every TogglesPerColumn entries.\n\t\tlocal perColumn = OCGUI.settings.TogglesPerColumn or 10\n\t\tlocal columns = 1\n\t\tif perColumn > 0 and #visible > perColumn then\n\t\t\tcolumns = math.ceil(#visible / perColumn)\n\t\tend\n\t\tif columns > 1 then\n\t\t\tGUI:Columns(columns, \"##ocguitogglecols\", false)\n\t\tend\n\n\t\tfor i, def in ipairs(visible) do\n\t\t\tlocal key = def.name\n\t\t\tlocal entry = data[key]\n\t\t\tif entry ~= nil then\n\t\t\t\tlocal shown, changed = GUI:Checkbox(GetString(\"##\" .. key), entry.shown)\n\t\t\t\tif changed then\n\t\t\t\t\tOCGUI.SetShown(key, shown)\n\t\t\t\tend\n\t\t\t\tGUI:SameLine()\n\n\t\t\t\tif entry.bool == true then\n\t\t\t\t\tGUI:TextColored(1, 1, 1, 1, key)\n\t\t\t\telse\n\t\t\t\t\tGUI:TextColored(1, 0.10, 0.10, 1, key)\n\t\t\t\tend\n\n\t\t\t\tif GUI:IsItemHovered() then\n\t\t\t\t\tif def.tooltip ~= nil then\n\t\t\t\t\t\tGUI:SetTooltip(def.tooltip)\n\t\t\t\t\tend\n\t\t\t\t\tif GUI:IsItemClicked(0) then\n\t\t\t\t\t\tOCGUI.SetToggle(key, not entry.bool)\n\t\t\t\t\tend\n\t\t\t\tend\n\t\t\tend\n\n\t\t\tif columns > 1 and (i % perColumn) == 0 and i < #visible then\n\t\t\t\tGUI:NextColumn()\n\t\t\tend\n\t\tend\n\n\t\tif columns > 1 then\n\t\t\tGUI:Columns(1)\n\t\tend\n\n\t\tif GUI:Button(\"Reset/Restore Toggles\") then\n\t\t\tOCGUI.ResetToggles()\n\t\tend\n\n\t\tif #OCGUI.buttons > 0 then\n\t\t\tGUI:NewLine()\n\t\t\tGUI:Text(\"Additional Settings: \")\n\n\t\t\tfor i, button in ipairs(OCGUI.buttons) do\n\t\t\t\tif button.sameline and i > 1 then\n\t\t\t\t\tGUI:SameLine()\n\t\t\t\tend\n\t\t\t\tif GUI:Button(button.label) then\n\t\t\t\t\tif type(button.callback) == \"function\" then\n\t\t\t\t\t\tbutton.callback()\n\t\t\t\t\tend\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\n\t\tlocal windowWidth = 280 + ((columns - 1) * 150)\n\t\tif (tabStripWidth + 16) > windowWidth then\n    \t\twindowWidth = tabStripWidth + 16     -- +16 = WindowPadding.x both sides\n\t\tend\n\t\tGUI:SetWindowSize(windowWidth, 0)\n\tend\n\n\tGUI:End()\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"1d38aceb-831a-88f5-8452-17c4b312c663",
								true,
							},
							
							{
								"c9ab060f-fb19-9be7-97f2-bca853a67c87",
								true,
							},
						},
						gVar = "ACR_RikuAST2_CD",
						name = "Settings Menu",
						uuid = "0e9b1755-ef8a-4a48-bbf9-ea005b5b9759",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "-- Draws every window registered through OCGUI.AddWindow / OCGUI.AddListWindow.\nfor _, win in pairs(OCGUI.windows) do\n\tif win.open then\n\t\tGUI:SetNextWindowSize(win.width, win.height, GUI.SetCond_Appearing)\n\t\twin.visible, win.open = GUI:Begin(win.title, win.open)\n\t\tif win.visible and type(win.draw) == \"function\" then\n\t\t\twin.draw(win)\n\t\tend\n\t\tGUI:End()\n\tend\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"1d38aceb-831a-88f5-8452-17c4b312c663",
								true,
							},
							
							{
								"c9ab060f-fb19-9be7-97f2-bca853a67c87",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Sub Windows",
						uuid = "6c4a38d3-8dcb-7098-b03a-d7d72ef61ab0",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "if OCGUI.init == true and #OCGUI.toggles > 0 then\n\tif TimeSince(OCGUI.lastTick) > 1000 then\n\t\tOCGUI.RefreshToggles()\n\t\tOCGUI.lastTick = Now()\n\tend\n\n\tlocal settings = OCGUI.settings\n\tlocal scale = settings.ToggleScale\n\tlocal winFlags =\n\t\t(GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoScrollbar +\n\t\tGUI.WindowFlags_NoCollapse)\n\tif settings.LockedToggles == true then\n\t\twinFlags = winFlags + GUI.WindowFlags_NoMove\n\tend\n\n\tfor _, def in ipairs(OCGUI.toggles) do\n\t\tlocal key = def.name\n\t\tlocal entry = settings.Toggles.data[key]\n\n\t\tif entry ~= nil and def.active == true and entry.shown == true and def.group ~= 0 then\n\t\t\tGUI:SetNextWindowSize(0, 0, GUI.SetCond_Always)\n\t\t\tGUI:PushStyleColor(GUI.Col_WindowBg, 0.070, 0.070, 0.070, settings.ToggleBGAlpha or 0.45)\n\t\t\tGUI:Begin(\"OCGUIToggles\" .. def.group, true, winFlags)\n\t\t\tGUI:PopStyleColor()\n\t\t\tGUI:SetWindowFontSize(scale)\n\n\t\t\tlocal color = settings.ToggleColorDisable\n\t\t\tif entry.bool == true then\n\t\t\t\tcolor = settings.ToggleColorEnable\n\t\t\tend\n\n\t\t\tGUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding, 5)\n\t\t\tGUI:PushStyleVar(GUI.StyleVar_ItemSpacing, 3, 3)\n\t\t\tGUI:PushStyleColor(GUI.Col_ChildWindowBg, color.r, color.g, color.b, color.a)\n\n\t\t\tlocal strlenght = GUI:CalcTextSize(key)\n\t\t\tlocal btnWidth = settings.ToggleWidth\n\t\t\tlocal btnHeight = settings.ToggleHeight\n\t\t\tlocal btnSpacing = GUI:GetTextLineHeightWithSpacing()\n\t\t\tGUI:BeginChild(key .. \"##extra1\", btnWidth, btnHeight, false, GUI.WindowFlags_AlwaysAutoResize)\n\t\t\tGUI:SetWindowFontSize(scale)\n\t\t\tGUI:SetCursorPosX((btnWidth - strlenght) * 0.5)\n\t\t\tGUI:SetCursorPosY((btnHeight - btnSpacing) * 0.5)\n\n\t\t\tGUI:Text(key)\n\t\t\tGUI:EndChild()\n\n\t\t\tif (GUI:IsItemHovered()) then\n\t\t\t\tif (GUI:IsMouseClicked(0)) then\n\t\t\t\t\tOCGUI.SetToggle(key, not entry.bool)\n\t\t\t\tend\n\t\t\t\tif GUI:IsMouseClicked(1) then\n\t\t\t\t\tOCGUI.GUI.open = not OCGUI.GUI.open\n\t\t\t\tend\n\t\t\tend\n\n\t\t\tGUI:PopStyleColor()\n\t\t\tGUI:PopStyleVar()\n\t\t\tGUI:PopStyleVar()\n\n\t\t\t-- paired with the Begin above, unlike the old loop\n\t\t\tGUI:End()\n\t\tend\n\tend\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"1d38aceb-831a-88f5-8452-17c4b312c663",
								true,
							},
							
							{
								"c9ab060f-fb19-9be7-97f2-bca853a67c87",
								true,
							},
						},
						gVar = "ACR_RikuAST2_CD",
						name = "Toggles Draw",
						uuid = "3c5ea42e-06f2-f5cd-a2cc-a784ae3aab27",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI ~= nil",
						name = "OCGUI Init",
						uuid = "1d38aceb-831a-88f5-8452-17c4b312c663",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1278,
							1252,
							1346,
						},
						uuid = "c9ab060f-fb19-9be7-97f2-bca853a67c87",
						version = 3,
					},
				},
			},
			eventType = 13,
			name = "[Extra] Occult GUI",
			uuid = "404d6d8c-bfd9-0576-ba82-f04184b6c8ed",
			version = 2,
		},
		inheritedIndex = 58,
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
						actionLua = "-- The stock Occult Crescent toggles and blacklist windows. Nothing in here is\n-- special: it is the same public API any other reaction uses to hook in.\n-- Runs once, guarded by the reaction condition:\n--   return OCGUI ~= nil and OCGUI.init == true and OCGUI.builtinsRegistered ~= true\n\n-- name, phantom job buff id, settings window tab.\n-- The tab is just a label: leave it off and the toggle lands on \"Main\", which\n-- is also where anything a third party adds without a tab ends up.\n-- OCGUI.PhantomBuffs returns a table of the buff IDs. You can also just pass the buff ID if you want.\n\nlocal builtinToggles = {\n\t-- IDK what the fuck you guys do for your ESP, but you can make these available. IDK?\n\t{\"Chest ESP\", OCGUI.PhantomBuffs.Global, \"Main\"},\n\t--{\"Survey ESP\", OCGUI.PhantomBuffs.Global, \"Main\"},\n\t{\"Carrot ESP\", OCGUI.PhantomBuffs.Global, \"Main\"},\n\t{\"Chem Raise\", OCGUI.PhantomBuffs.Chemist, \"Combat\"},\n\t{\"Vigilance\", OCGUI.PhantomBuffs.Thief, \"Thief\"},\n\t{\"Steal\", OCGUI.PhantomBuffs.Thief, \"Thief\"},\n\t{\"Pilfer\", OCGUI.PhantomBuffs.Thief, \"Thief\"},\n\t{\"Heal\", OCGUI.PhantomBuffs.Knight, \"Knight\"},\n\t{\"Pray\", OCGUI.PhantomBuffs.Knight, \"Knight\"},\n\t{\"Pledge\", OCGUI.PhantomBuffs.Knight, \"Knight\"},\n\t{\"Heal\", OCGUI.PhantomBuffs.Knight, \"Knight\"},\n\t{\"Counterstance\", OCGUI.PhantomBuffs.Monk, \"Monk\"},\n\t{\"Counter\", OCGUI.PhantomBuffs.Monk, \"Monk\"},\n\t{\"Kick\", OCGUI.PhantomBuffs.Monk, \"Monk\"},\n\t{\"Chakra\", OCGUI.PhantomBuffs.Monk, \"Monk\"},\n\t{\"Hero's Rime\", OCGUI.PhantomBuffs.Bard, \"Bard\"},\n\t{\"Mighty March\", OCGUI.PhantomBuffs.Bard, \"Bard\"},\n\t{\"Aria\", OCGUI.PhantomBuffs.Bard, \"Bard\"},\n\t{\"Cannons\", OCGUI.PhantomBuffs.Cannoneer, \"Combat\"},\n\t{\"Zeninage\", OCGUI.PhantomBuffs.Samurai, \"Samurai\"},\n\t{\"Iainuki\", OCGUI.PhantomBuffs.Samurai, \"Samurai\"},\n\t{\"Deadly Blow\", OCGUI.PhantomBuffs.Berserker, \"Combat\"},\n\t{\"Mage Masher\", OCGUI.PhantomBuffs.TimeMage, \"Time Mage\"},\n\t{\"Quick\", OCGUI.PhantomBuffs.TimeMage, \"Time Mage\"},\n\t{\"Comet\", OCGUI.PhantomBuffs.TimeMage, \"Time Mage\"},\n\t{\"Predict\", OCGUI.PhantomBuffs.Oracle, \"Combat\"},\n\t{\"Battle Bell\", OCGUI.PhantomBuffs.Geomancer, \"Geomancer\"},\n\t{\"Suspend\", OCGUI.PhantomBuffs.Geomancer, \"Geomancer\"},\n\t{\"Ringing Respite\", OCGUI.PhantomBuffs.Geomancer, \"Geomancer\"},\n\t{\"Quickstep\", OCGUI.PhantomBuffs.Dancer, \"Dancer\"},\n\t{\"Dance\", OCGUI.PhantomBuffs.Dancer, \"Dancer\"},\n\t{\"Mystic Skills\", OCGUI.PhantomBuffs.MysticKnight, \"Combat\"},\n\t{\"Shuriken\", OCGUI.PhantomBuffs.Ninja, \"Ninja\"},\n\t{\"Scrolls\", OCGUI.PhantomBuffs.Ninja, \"Ninja\"},\n\t{\"Smoke\", OCGUI.PhantomBuffs.Ninja, \"Ninja\"},\n\t{\"GLD Skills\", OCGUI.PhantomBuffs.Gladiator, \"Combat\"},\n\t{\"WHM Attacks\", OCGUI.PhantomBuffs.WhiteMage, \"White Mage\"},\n\t{\"WHM Heals\", OCGUI.PhantomBuffs.WhiteMage, \"White Mage\"},\n\t{\"WHM Raise\", OCGUI.PhantomBuffs.WhiteMage, \"White Mage\"},\n\t{\"Summons\", OCGUI.PhantomBuffs.Summoner, \"Combat\"},\n\t{\"Aim\", OCGUI.PhantomBuffs.Ranger, \"Combat\"},\n\t{\"Jump\", OCGUI.PhantomBuffs.Dragoon, \"Dragoon\"},\n\t{\"Lance\", OCGUI.PhantomBuffs.Dragoon, \"Dragoon\"},\n\t{\"Libra\", OCGUI.PhantomBuffs.RedMage, \"Red Mage\"},\n\t{\"RDM Skills\", OCGUI.PhantomBuffs.RedMage, \"Red Mage\"},\n\t{\"BLU Skills\", OCGUI.PhantomBuffs.BlueMage, \"Combat\"},\n\t{\"Drain Touch\", OCGUI.PhantomBuffs.Necromancer, \"Necromancer\"},\n\t{\"Necro Skills\", OCGUI.PhantomBuffs.Necromancer, \"Necromancer\"},\n\t{\"BLM Skills\", OCGUI.PhantomBuffs.BlackMage, \"Combat\"},\n}\n\nfor _, toggle in ipairs(builtinToggles) do\n\tOCGUI.AddToggle(toggle[1], {phantom = toggle[2], tab = toggle[3]})\nend\n\n--[[\nOCGUI.AddListWindow(\n\t\"StealBlacklist\",\n\t{\n\t\ttitle = \"Steal Blacklist Menu\",\n\t\tbuttonLabel = \"Steal Blacklist\",\n\t\tkey = \"StealBlacklistTable\",\n\t\thelp = \"First select a target to blacklist\\nThen press the Add Target button\",\n\t\temptyText = \"Go add some enemies to your blacklist!\"\n\t}\n)\nOCGUI.AddListWindow(\n\t\"StunBlacklist\",\n\t{\n\t\ttitle = \"Stun Blacklist Menu\",\n\t\tbuttonLabel = \"Stun Blacklist\",\n\t\tkey = \"StunBlacklistTable\",\n\t\tsameline = true,\n\t\thelp = \"First select a target to blacklist\\nThen press the Add Target button\",\n\t\temptyText = \"Go add some enemies to your blacklist!\"\n\t}\n)\n\nOCGUI.AddListWindow(\n\t\"UndeadPriority\",\n\t{\n\t\ttitle = \"Undead Priority Menu\",\n\t\tbuttonLabel = \"Undead Priority\",\n\t\tkey = \"UndeadPriorityTable\",\n\t\thelp = \"First select a target to priority\\nThen press the Add Target button\",\n\t\temptyText = \"Go add some enemies to your priority list!\"\n\t}\n)\n]]--\n\nOCGUI.builtinsRegistered = true\nOCGUI.SaveSettings()\nself.used = true\n",
						conditions = 
						{
							
							{
								"215f281f-88e3-ce45-954c-48f460743681",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Example Built-ins",
						uuid = "d95e8138-1efe-c617-91b9-694de5dacaad",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI ~= nil and OCGUI.init == true and OCGUI.builtinsRegistered ~= true",
						name = "Examples Registered",
						uuid = "215f281f-88e3-ce45-954c-48f460743681",
						version = 3,
					},
				},
			},
			eventType = 13,
			name = "[Extra] Occult GUI Built-in Toggles",
			uuid = "6effb3c9-bff2-6d30-98a3-655b2bd77f62",
			version = 2,
		},
		inheritedIndex = 59,
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
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
								true,
							},
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								true,
							},
							
							{
								"f1fcce61-dd9c-69d0-92e1-cc90b93ebdd5",
								true,
							},
							
							{
								"6b6b1fde-3d0c-43eb-88ba-0ebf9586a230",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Stop Casting",
						uuid = "5457814d-3ddf-07ea-b993-3178136c2e34",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
								true,
							},
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"3f8c09fd-599e-e425-935a-4a2e47b26bb7",
								true,
							},
							
							{
								"41488e26-0694-059b-bd0c-61b4e51917af",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								true,
							},
							
							{
								"88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
								true,
							},
							
							{
								"34195b16-5994-1b85-bb59-e9f2f302e007",
								true,
							},
							
							{
								"69db96b4-50c5-b63f-8302-96b4a12c36e6",
								true,
							},
							
							{
								"09e738b2-8ab5-5736-ba29-5a36d8384456",
								true,
							},
							
							{
								"7ae11b51-a023-a1a9-a351-9c4827a33a82",
								true,
							},
							
							{
								"aacd0685-3c44-ba18-86ef-df2d9f1c8a3b",
								true,
							},
							
							{
								"b613834c-5be0-64cd-ad4e-92a2fc55e702",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction1",
						name = "Occult Fire",
						targetType = "Most Clustered Enemy",
						uuid = "6ff99f53-6a37-b32b-8bca-25dc1664fa5f",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = true\nself.used = true",
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
								true,
							},
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"3f8c09fd-599e-e425-935a-4a2e47b26bb7",
								true,
							},
							
							{
								"41488e26-0694-059b-bd0c-61b4e51917af",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								true,
							},
							
							{
								"88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
								true,
							},
							
							{
								"34195b16-5994-1b85-bb59-e9f2f302e007",
								true,
							},
							
							{
								"69db96b4-50c5-b63f-8302-96b4a12c36e6",
								true,
							},
							
							{
								"eaf33b66-cfeb-0183-ba40-33027700e29a",
								true,
							},
							
							{
								"09e738b2-8ab5-5736-ba29-5a36d8384456",
								true,
							},
							
							{
								"7bc51f84-db08-eecf-a9ac-eade5b39d44a",
								true,
							},
							
							{
								"aacd0685-3c44-ba18-86ef-df2d9f1c8a3b",
								true,
							},
							
							{
								"b613834c-5be0-64cd-ad4e-92a2fc55e702",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction4",
						name = "Occult Blizzard",
						targetType = "Most Clustered Enemy",
						uuid = "710fde25-ef3c-7f43-8a9c-0ad0cccc378f",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] = true\nself.used = true",
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
								true,
							},
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"3f8c09fd-599e-e425-935a-4a2e47b26bb7",
								true,
							},
							
							{
								"41488e26-0694-059b-bd0c-61b4e51917af",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								true,
							},
							
							{
								"88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
								true,
							},
							
							{
								"34195b16-5994-1b85-bb59-e9f2f302e007",
								true,
							},
							
							{
								"69db96b4-50c5-b63f-8302-96b4a12c36e6",
								true,
							},
							
							{
								"b8bba6c4-6253-6d3f-aaf9-ad5b06c59bf8",
								true,
							},
							
							{
								"09e738b2-8ab5-5736-ba29-5a36d8384456",
								true,
							},
							
							{
								"a18d17a7-36b7-b794-8e24-938c04369a92",
								true,
							},
							
							{
								"aacd0685-3c44-ba18-86ef-df2d9f1c8a3b",
								true,
							},
							
							{
								"b613834c-5be0-64cd-ad4e-92a2fc55e702",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction5",
						name = "Occult Thunder",
						targetSubType = "Most Clustered",
						targetType = "Most Clustered Enemy",
						uuid = "4ace2d05-8a41-264c-8499-e010902045cf",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionID = 41630,
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						atomicPriority = true,
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
								true,
							},
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"3f8c09fd-599e-e425-935a-4a2e47b26bb7",
								true,
							},
							
							{
								"41488e26-0694-059b-bd0c-61b4e51917af",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								true,
							},
							
							{
								"88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
								true,
							},
							
							{
								"34195b16-5994-1b85-bb59-e9f2f302e007",
								true,
							},
							
							{
								"69db96b4-50c5-b63f-8302-96b4a12c36e6",
								true,
							},
							
							{
								"09e738b2-8ab5-5736-ba29-5a36d8384456",
								true,
							},
							
							{
								"aacd0685-3c44-ba18-86ef-df2d9f1c8a3b",
								true,
							},
							
							{
								"b613834c-5be0-64cd-ad4e-92a2fc55e702",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction1",
						ignoreWeaveRules = true,
						name = "Occult Fire (No Vuln)",
						targetType = "Most Clustered Enemy",
						uuid = "e2706396-3fe7-767e-a3e6-15d3144d1c6b",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
					inheritedOverwrites = 
					{
						conditions = 
						{
							
							{
								type = "add",
								value = 
								{
									"80ab686f-c3ab-907f-b320-9a079f92fd11",
									true,
								},
							},
						},
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								false,
							},
							
							{
								"6b6b1fde-3d0c-43eb-88ba-0ebf9586a230",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_CD",
						name = "Fallback Dequeue",
						uuid = "06e8f51b-eb9f-0f9e-8809-24b51ec83945",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5334,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Red Mage",
						uuid = "a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						name = "Self Living",
						uuid = "3f8c09fd-599e-e425-935a-4a2e47b26bb7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Self Missing Transcendent",
						uuid = "41488e26-0694-059b-bd0c-61b4e51917af",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "09d2463d-fbb9-bc41-affd-1a796e900b59",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil and TimeSince(data.ocCombatTimer) > 2400",
						dequeueIfLuaFalse = true,
						name = "Combat > 2.4s",
						uuid = "34195b16-5994-1b85-bb59-e9f2f302e007",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "69db96b4-50c5-b63f-8302-96b4a12c36e6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,34):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Blizzard",
						uuid = "eaf33b66-cfeb-0183-ba40-33027700e29a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,35):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Thunder",
						uuid = "b8bba6c4-6253-6d3f-aaf9-ad5b06c59bf8",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49092,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Fire/Blizz/Thunder CD <= 3s",
						uuid = "09e738b2-8ab5-5736-ba29-5a36d8384456",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5322,
						name = "Target Fire Weak",
						uuid = "7ae11b51-a023-a1a9-a351-9c4827a33a82",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5323,
						name = "Target Ice Weak",
						uuid = "7bc51f84-db08-eecf-a9ac-eade5b39d44a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5324,
						name = "Target Lightning Weak",
						uuid = "a18d17a7-36b7-b794-8e24-938c04369a92",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.getEntitySpeed(TensorCore.mGetPlayer().id) > 0",
						dequeueIfLuaFalse = true,
						name = "Player moving",
						uuid = "e9b651dc-8d33-d497-9404-f0701a646dcc",
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
								"e9b651dc-8d33-d497-9404-f0701a646dcc",
								false,
							},
						},
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "F: movement",
						partyTargetNumber = 0,
						uuid = "aacd0685-3c44-ba18-86ef-df2d9f1c8a3b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.mGetPlayer():IsMoving()",
						name = "Self Moving",
						uuid = "f1fcce61-dd9c-69d0-92e1-cc90b93ebdd5",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\" ] or _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\" ] or _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\" ] or _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\" ] == true",
						dequeueIfLuaFalse = true,
						name = "Is Queued",
						uuid = "6b6b1fde-3d0c-43eb-88ba-0ebf9586a230",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"RDM Skills\")",
						name = "Toggle",
						uuid = "b613834c-5be0-64cd-ad4e-92a2fc55e702",
						version = 3,
					},
				},
			},
			name = "P. Red Mage",
			throttleTime = 250,
			timeout = 2.5,
			uuid = "b154c88e-e0cd-2b0c-bdd5-5a5cb8dc7300",
			version = 2,
		},
		inheritedIndex = 60,
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
						actionLua = "local green,yellow,red,blue = 1677786914,1677787134,1677721855,1694449152\n\ndata.dedoTargetNames = data.dedoTargetNames or {\n    -- Non-treasure objects you want to track.\n    -- Treasure objects are detected by ent.type == 4.\n\n    [\"survey point\"] = yellow,\n    [\"2010139\"] = {color = red, forceVisible = true}, -- Carrots\n    -- [\"Random Test Name\"] = blue,\n\n    -- You can also use any U32 color value from Anyone's Dev Monitor.\n}\n\ndata.dedoArrowEnts = data.dedoArrowEnts or {}\ndata.dedoArrowTime = Now()\ntable.clear(data.dedoArrowEnts)\n\nfor id, ent in pairs(TensorCore.entityList(\"\")) do\n    local targetConfig\n\n    -- Track all treasure objects by type.\n    if ent.type == 4 then\n        targetConfig = green\n    else\n        -- All other tracked objects still use name/contentid matching.\n        local lowerName = string.lower(ent.name)\n        targetConfig = data.dedoTargetNames[lowerName] or data.dedoTargetNames[tostring(ent.contentid)]\n    end\n\n    if targetConfig then\n        local color, forceVisible\n\n        if type(targetConfig) == \"table\" then\n            color = targetConfig.color\n            forceVisible = targetConfig.forceVisible or false\n        else\n            color = targetConfig\n            forceVisible = false\n        end\n\n        local dist = TensorCore.getDistance2d(TensorCore.mGetPlayer().pos, ent.pos)\n\n        if dist > 5 then\n            data.dedoArrowEnts[id] = {\n                name = ent.name,\n                pos = ent.pos,\n                color = color,\n                dist = dist,\n            }\n        end\n    end\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"2daac994-6b45-bc9f-a201-75cf47112acf",
								true,
							},
							
							{
								"76cf4cc7-0310-8b22-89b8-9ca4d11dfd4c",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Modify List",
						uuid = "cd63cd05-6492-be10-a239-d2c45dd18bfa",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local player = TensorCore.mGetPlayer()\nfor id, ent in pairs(data.dedoArrowEnts) do\n\tlocal g = TensorCore.getStaticDrawer(ent.color)\n\tg.colorOutline = 4294967295\n\tg:addArrow(player.pos.x, player.pos.y, player.pos.z,TensorCore.getHeadingToTarget(player.pos, ent.pos),1.5, 0.25, nil, nil, true)\n\tg:addCircle(ent.pos.x, ent.pos.y, ent.pos.z, 1, true)\n\tg.colorOutline = nil\nend\nself.used = true",
						conditions = 
						{
							
							{
								"2daac994-6b45-bc9f-a201-75cf47112acf",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						uuid = "b8f1e279-9905-2a5c-9953-de97dcb3a596",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						localmapid = 1252,
						uuid = "2daac994-6b45-bc9f-a201-75cf47112acf",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.dedoArrowTime == nil or TimeSince(data.dedoArrowTime) > 1000",
						uuid = "76cf4cc7-0310-8b22-89b8-9ca4d11dfd4c",
						version = 3,
					},
				},
			},
			enabled = false,
			eventType = 12,
			name = "Arrow objects (old)",
			uuid = "b4dea9fb-caa4-148e-9ae8-92c5564e94af",
			version = 2,
		},
		inheritedIndex = 61,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "ACR",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
								true,
							},
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"3f8c09fd-599e-e425-935a-4a2e47b26bb7",
								true,
							},
							
							{
								"41488e26-0694-059b-bd0c-61b4e51917af",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								true,
							},
							
							{
								"88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
								true,
							},
							
							{
								"09162f46-edd0-e0ab-a575-e9cbe3ddec4d",
								true,
							},
							
							{
								"69db96b4-50c5-b63f-8302-96b4a12c36e6",
								true,
							},
							
							{
								"eaf33b66-cfeb-0183-ba40-33027700e29a",
								true,
							},
							
							{
								"09e738b2-8ab5-5736-ba29-5a36d8384456",
								true,
							},
							
							{
								"7c1c9a3e-654e-c38a-8a7a-42752dec5c88",
								true,
							},
							
							{
								"51dc004c-96c3-a3e6-ba5a-c843757e279c",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction3",
						name = "Refresh Libra",
						targetType = "Current Target",
						uuid = "5d8b9137-6dbc-aa88-bd40-52a5c22ab550",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
								true,
							},
							
							{
								"a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
								true,
							},
							
							{
								"3f8c09fd-599e-e425-935a-4a2e47b26bb7",
								true,
							},
							
							{
								"41488e26-0694-059b-bd0c-61b4e51917af",
								true,
							},
							
							{
								"09d2463d-fbb9-bc41-affd-1a796e900b59",
								true,
							},
							
							{
								"88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
								true,
							},
							
							{
								"69db96b4-50c5-b63f-8302-96b4a12c36e6",
								true,
							},
							
							{
								"eaf33b66-cfeb-0183-ba40-33027700e29a",
								true,
							},
							
							{
								"09e738b2-8ab5-5736-ba29-5a36d8384456",
								true,
							},
							
							{
								"fbb59714-adb4-fad6-aa1e-0d35e6c6f5a6",
								true,
							},
							
							{
								"44c9ceba-564a-3630-8970-d25e51cb9847",
								false,
							},
							
							{
								"51dc004c-96c3-a3e6-ba5a-c843757e279c",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuDRK3_Hotbar_DutyAction3",
						name = "Libra",
						targetType = "Current Target",
						uuid = "9379030c-f4ec-bca7-a30e-56af272d741c",
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
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "1e7919a1-6e5f-2acd-ac59-94cfa6d99365",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5334,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Red Mage",
						uuid = "a053ee8a-0f3d-e8ec-928f-353a1bba7a96",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						name = "Self Living",
						uuid = "3f8c09fd-599e-e425-935a-4a2e47b26bb7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Self Missing Transcendent",
						uuid = "41488e26-0694-059b-bd0c-61b4e51917af",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "09d2463d-fbb9-bc41-affd-1a796e900b59",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "88a0ee56-2ae6-6a84-9cbb-dc57270d5c5c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil and TimeSince(data.ocCombatTimer) > 2400",
						dequeueIfLuaFalse = true,
						name = "Combat > 2.4s",
						uuid = "09162f46-edd0-e0ab-a575-e9cbe3ddec4d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "69db96b4-50c5-b63f-8302-96b4a12c36e6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,33):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Libra Unlocked",
						uuid = "eaf33b66-cfeb-0183-ba40-33027700e29a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 1,
						actionID = 49094,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Libra CD <= 1s",
						uuid = "09e738b2-8ab5-5736-ba29-5a36d8384456",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 6,
						buffIDList = 
						{
							5322,
							5323,
							5324,
							5325,
						},
						matchAnyBuff = true,
						name = "Target Missing Libra",
						uuid = "fbb59714-adb4-fad6-aa1e-0d35e6c6f5a6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 5,
						buffIDList = 
						{
							5322,
							5323,
							5324,
							5325,
						},
						matchAnyBuff = true,
						name = "Target Has Libra",
						uuid = "44c9ceba-564a-3630-8970-d25e51cb9847",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 7,
						buffDuration = 20,
						buffIDList = 
						{
							5322,
							5323,
							5324,
							5325,
						},
						comparator = 2,
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Libra Duration <= 20s",
						uuid = "7c1c9a3e-654e-c38a-8a7a-42752dec5c88",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.getEntitySpeed(TensorCore.mGetPlayer().id) > 0",
						dequeueIfLuaFalse = true,
						name = "Player moving",
						uuid = "e9b651dc-8d33-d497-9404-f0701a646dcc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.mGetPlayer():IsMoving()",
						name = "Self Moving",
						uuid = "f1fcce61-dd9c-69d0-92e1-cc90b93ebdd5",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\" ] or _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\" ] or _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\" ] or _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\" ] == true",
						dequeueIfLuaFalse = true,
						name = "Is Queued",
						uuid = "6b6b1fde-3d0c-43eb-88ba-0ebf9586a230",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Libra\")",
						name = "Toggle",
						uuid = "51dc004c-96c3-a3e6-ba5a-c843757e279c",
						version = 3,
					},
				},
			},
			name = "P. Red Mage Libra",
			throttleTime = 1250,
			timeout = 2.5,
			uuid = "384be111-76d5-d45b-af4a-8643d34d5822",
			version = 2,
		},
		inheritedIndex = 62,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 49098,
						conditions = 
						{
							
							{
								"08200ceb-e12f-422c-996e-47fcdd5dc467",
								true,
							},
							
							{
								"092c811b-68b8-d1a9-acd0-92ffa3a2f971",
								true,
							},
							
							{
								"10a8596d-b51f-0488-bc9e-80f55d2995cf",
								true,
							},
							
							{
								"3b59fa48-57ef-5088-aebb-bb740a04587b",
								true,
							},
							
							{
								"d41beda5-2a4b-487c-80a9-a29bb94e874d",
								true,
							},
							
							{
								"1cdfbfad-9abd-890b-959c-0a1a7d59d407",
								true,
							},
							
							{
								"779ef1d5-2e1c-6eb4-aba8-5538338ab096",
								true,
							},
							
							{
								"acfab9f6-e13a-546f-8cdd-f508c1da8a2a",
								true,
							},
							
							{
								"4118ed3d-9985-9fed-ba1b-0692f3d87ef3",
								true,
							},
							
							{
								"d0e4b497-04d7-1142-9a34-aa44079c41f9",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						targetType = "Current Target",
						uuid = "14f615a5-006b-56d2-aefc-3156425b6b23",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						actionID = 49099,
						conditions = 
						{
							
							{
								"08200ceb-e12f-422c-996e-47fcdd5dc467",
								true,
							},
							
							{
								"092c811b-68b8-d1a9-acd0-92ffa3a2f971",
								true,
							},
							
							{
								"10a8596d-b51f-0488-bc9e-80f55d2995cf",
								true,
							},
							
							{
								"3b59fa48-57ef-5088-aebb-bb740a04587b",
								true,
							},
							
							{
								"d41beda5-2a4b-487c-80a9-a29bb94e874d",
								true,
							},
							
							{
								"1cdfbfad-9abd-890b-959c-0a1a7d59d407",
								true,
							},
							
							{
								"49226ef3-e891-e41d-9506-4602c4259620",
								true,
							},
							
							{
								"e9a87634-6087-4465-bbf0-e0c7a8b4e2c4",
								true,
							},
							
							{
								"4118ed3d-9985-9fed-ba1b-0692f3d87ef3",
								true,
							},
							
							{
								"d0e4b497-04d7-1142-9a34-aa44079c41f9",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						targetType = "Current Target",
						uuid = "b5fa4cd7-7330-7354-878e-f32d9a5a1120",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						actionID = 49100,
						conditions = 
						{
							
							{
								"08200ceb-e12f-422c-996e-47fcdd5dc467",
								true,
							},
							
							{
								"092c811b-68b8-d1a9-acd0-92ffa3a2f971",
								true,
							},
							
							{
								"10a8596d-b51f-0488-bc9e-80f55d2995cf",
								true,
							},
							
							{
								"3b59fa48-57ef-5088-aebb-bb740a04587b",
								true,
							},
							
							{
								"d41beda5-2a4b-487c-80a9-a29bb94e874d",
								true,
							},
							
							{
								"1cdfbfad-9abd-890b-959c-0a1a7d59d407",
								true,
							},
							
							{
								"dd0e530f-6084-ce35-89bf-553e8012c13e",
								true,
							},
							
							{
								"723894dc-b212-6550-a413-ce46a9457bff",
								true,
							},
							
							{
								"4118ed3d-9985-9fed-ba1b-0692f3d87ef3",
								true,
							},
							
							{
								"d0e4b497-04d7-1142-9a34-aa44079c41f9",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						targetType = "Current Target",
						uuid = "5f2f0901-df39-1c03-95da-15664fcbd24d",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "In Occult Crescent",
						uuid = "08200ceb-e12f-422c-996e-47fcdd5dc467",
						version = 3,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Is Bot Running",
						uuid = "092c811b-68b8-d1a9-acd0-92ffa3a2f971",
						version = 3,
					},
					inheritedIndex = 2,
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						hpValue = 99,
						uuid = "10a8596d-b51f-0488-bc9e-80f55d2995cf",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5335,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is Necro",
						uuid = "3b59fa48-57ef-5088-aebb-bb740a04587b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						uuid = "d41beda5-2a4b-487c-80a9-a29bb94e874d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "1cdfbfad-9abd-890b-959c-0a1a7d59d407",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49099,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						name = "Hell wind on cd",
						uuid = "49226ef3-e891-e41d-9506-4602c4259620",
						version = 3,
					},
					inheritedIndex = 7,
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49100,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						name = "Chaos Drive on cd",
						uuid = "dd0e530f-6084-ce35-89bf-553e8012c13e",
						version = 3,
					},
					inheritedIndex = 8,
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49098,
						buffCheckType = 2,
						buffID = 4232,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						name = "Deep freeze on CD",
						uuid = "779ef1d5-2e1c-6eb4-aba8-5538338ab096",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5324,
						name = "Target Lightning Weak",
						uuid = "723894dc-b212-6550-a413-ce46a9457bff",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5323,
						name = "Target Ice Weak",
						uuid = "acfab9f6-e13a-546f-8cdd-f508c1da8a2a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5325,
						name = "Target Wind Weak",
						uuid = "e9a87634-6087-4465-bbf0-e0c7a8b4e2c4",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Self Missing Transcendent",
						uuid = "4118ed3d-9985-9fed-ba1b-0692f3d87ef3",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Necro Skills\")",
						dequeueIfLuaFalse = true,
						name = "Toggle",
						uuid = "d0e4b497-04d7-1142-9a34-aa44079c41f9",
						version = 3,
					},
				},
			},
			enabled = false,
			name = "P. Necromancer (Disabled by def)",
			uuid = "001e8bf0-9e11-b65b-8fc4-327132fb50f2",
			version = 2,
		},
		inheritedIndex = 63,
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
						actionLua = "local a2=tonumber(eventArgs.a2)\nlocal a3=tonumber(eventArgs.a3)\nlocal shape=nil\nif a2==1 and a3==2 then shape=\"cone\"\nelseif a2==16 and a3==32 then shape=\"circle\"\nelse self.used=true;return end\nlocal eventObject=TensorCore.mGetEntity(eventArgs.entityID)\nif not eventObject or not eventObject.pos then self.used=true;return end\nlocal order=data.appallingBehaviorAOEOrder\nif order==nil then order={};data.appallingBehaviorAOEOrder=order end\nlocal pos=eventObject.pos\nlocal entry=nil\nlocal bestD2=4.0\nfor _,candidate in ipairs(order) do\n if candidate.x~=nil and candidate.z~=nil then\n  local dx=candidate.x-pos.x\n  local dz=candidate.z-pos.z\n  local d2=dx*dx+dz*dz\n  if d2<=bestD2 then bestD2=d2;entry=candidate end\n end\nend\nif entry==nil then entry={};order[#order+1]=entry end\nentry.x=pos.x;entry.y=pos.y;entry.z=pos.z;entry.h=pos.h;entry.type=shape\nif entry.sequence==nil then\n local sequence=(data.appallingBehaviorSequence or 0)+1\n data.appallingBehaviorSequence=sequence\n entry.sequence=sequence\nend\nself.used=true",
						conditions = 
						{
							
							{
								"e9acbcc6-dc1e-f791-afbf-64351a1c9e74",
								true,
							},
							
							{
								"4dcc6558-a17e-4251-95bd-a3d0bd7e575a",
								true,
							},
							
							{
								"4e151852-b0a1-23ef-8882-017a7b376d1d",
								true,
							},
							
							{
								"3a88cfc4-3bcf-1701-a911-f98a6e3db192",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Match VFX to Keeper + Sequence",
						uuid = "955b5f57-e0b8-1e54-8129-887e67487db5",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "In North Horn",
						uuid = "e9acbcc6-dc1e-f791-afbf-64351a1c9e74",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 2015274,
						name = "Hidden Entity",
						uuid = "4dcc6558-a17e-4251-95bd-a3d0bd7e575a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventIntValue = 1,
						name = "a2 >= 1",
						uuid = "4e151852-b0a1-23ef-8882-017a7b376d1d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						comparator = 2,
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventIntValue = 16,
						name = "a2 <= 16",
						uuid = "3a88cfc4-3bcf-1701-a911-f98a6e3db192",
						version = 3,
					},
				},
			},
			eventType = 20,
			name = "[AppallingBehavior] Store Type",
			uuid = "4cbd8d02-6e99-04ef-b984-8f4fc8b8774c",
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
						actionLua = "data.appallingBehaviorAOEOrder={}\ndata.appallingBehaviorSequence=0\ndata.appallingBehaviorSwapApplied=nil\nself.used=true",
						conditions = 
						{
							
							{
								"76a1ab78-39e7-23ef-821d-cef9a605c1df",
								true,
							},
							
							{
								"bbac79fd-f3c0-b345-bb27-a839b5319c35",
								true,
							},
							
							{
								"1bc2f7e1-77cb-b7d4-8ac9-b5b2f59fbb8f",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Reset Doll Cycle",
						uuid = "21526daa-d113-2cad-bc6c-1dd539908ae6",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "In North Horn",
						uuid = "76a1ab78-39e7-23ef-821d-cef9a605c1df",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventBoolValue = 2,
						eventSpellID = 49772,
						name = "Summon Idols 49772",
						spellIDList = 
						{
							49773,
							49774,
						},
						uuid = "1bc2f7e1-77cb-b7d4-8ac9-b5b2f59fbb8f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 14714,
						name = "Pallmagia ContentID",
						uuid = "bbac79fd-f3c0-b345-bb27-a839b5319c35",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[AppallingBehavior] Begin Idol Cycle Reset",
			uuid = "3b19f57d-58a4-62f4-a510-8833dbfc7afe",
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
						actionLua = "local order=data.appallingBehaviorAOEOrder\nif order==nil then self.used=true;return end\nlocal entries={}\nfor _,entry in ipairs(order) do\n if entry.type~=nil and entry.sequence~=nil and entry.x~=nil and entry.y~=nil and entry.z~=nil then entries[#entries+1]=entry end\nend\ntable.sort(entries,function(a,b) return a.sequence<b.sequence end)\nlocal drawer=TensorCore.getMoogleDrawer()\nfor _,entry in ipairs(entries) do\n local delay=(entry.sequence-1)*4500\n if entry.type==\"cone\" and entry.h~=nil then\n  drawer:addTimedCone(6500,entry.x,entry.y,entry.z,50,math.rad(100),entry.h,delay)\n elseif entry.type==\"circle\" then\n  drawer:addTimedCircle(6500,entry.x,entry.y,entry.z,30,delay)\n end\nend\nself.used=true",
						conditions = 
						{
							
							{
								"496521f7-b3be-a575-b1c5-afb970ae8e40",
								true,
							},
							
							{
								"d458eb78-1900-c148-9cc0-2ec671568050",
								true,
							},
							
							{
								"11911316-cfa1-4f07-9d19-5b52241a2fa9",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Draw Ordered Unsafe Dolls",
						uuid = "2c36b967-917b-2ffb-af81-2c705ec2cd22",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "In North Horn",
						uuid = "496521f7-b3be-a575-b1c5-afb970ae8e40",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 14714,
						name = "Pallmagia ContentID",
						uuid = "d458eb78-1900-c148-9cc0-2ec671568050",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 3,
						eventArgType = 2,
						name = "Normal Instruction (49773)",
						spellIDList = 
						{
							49773,
						},
						uuid = "11911316-cfa1-4f07-9d19-5b52241a2fa9",
						version = 3,
					},
				},
			},
			eventType = 2,
			name = "[AppallingBehavior] OnEntityCast Draws",
			uuid = "e69d7ffd-c8a8-b2c9-9014-7eba5c81c0b1",
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
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"9352f316-0b87-58b2-9925-9e52f9eaf999",
								true,
							},
							
							{
								"fa12a1b5-576e-c38b-962f-cd36b59c3686",
								true,
							},
							
							{
								"68ffdc57-38d6-2993-be46-969f767c278d",
								true,
							},
							
							{
								"74748392-3717-36df-a079-fc75a02dcf22",
								true,
							},
							
							{
								"57557896-4ccd-2e37-8814-6c11a09cc2d8",
								true,
							},
							
							{
								"65c23125-414a-35fc-aa05-29de4729582e",
								true,
							},
							
							{
								"d89d9a36-ce2b-8495-a04d-0a5bdd112475",
								false,
							},
							
							{
								"7f6fb411-f42d-391a-aa0e-da3549b1f675",
								true,
							},
							
							{
								"f02cb8c6-8caa-a0f8-bf06-93dcd07d6986",
								true,
							},
							
							{
								"ddc9803b-018e-c200-8aba-78173484c211",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction3",
						name = "Occult Thunder III",
						targetType = "Most Clustered Enemy",
						uuid = "d6b5e0d2-6979-f582-be5f-dd16a09be702",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] = false\nself.used = true",
						clusterMinTarget = 0,
						conditions = 
						{
							
							{
								"9352f316-0b87-58b2-9925-9e52f9eaf999",
								true,
							},
							
							{
								"57557896-4ccd-2e37-8814-6c11a09cc2d8",
								true,
							},
							
							{
								"d89d9a36-ce2b-8495-a04d-0a5bdd112475",
								true,
							},
							
							{
								"3d42f605-8171-63e2-9b6b-3ea6dc26f1aa",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction5",
						gVarValue = 2,
						name = "Stop Cast - Movement",
						targetType = "Most Clustered Enemy",
						uuid = "a2823257-b5f5-3535-896c-015822a25e77",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						clusterMinTarget = 0,
						conditions = 
						{
							
							{
								"9352f316-0b87-58b2-9925-9e52f9eaf999",
								true,
							},
							
							{
								"85b87344-fdd0-770a-bf60-c7dbd58164f8",
								true,
							},
							
							{
								"1155fc61-31e5-cd70-a00b-9991dc48a34d",
								true,
							},
							
							{
								"74748392-3717-36df-a079-fc75a02dcf22",
								true,
							},
							
							{
								"57557896-4ccd-2e37-8814-6c11a09cc2d8",
								true,
							},
							
							{
								"65c23125-414a-35fc-aa05-29de4729582e",
								true,
							},
							
							{
								"d89d9a36-ce2b-8495-a04d-0a5bdd112475",
								false,
							},
							
							{
								"7f6fb411-f42d-391a-aa0e-da3549b1f675",
								true,
							},
							
							{
								"ddc9803b-018e-c200-8aba-78173484c211",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction5",
						name = "Occult Flare",
						targetType = "Most Clustered Enemy",
						uuid = "8da363d4-4840-39a3-af43-3c389ed4f3a8",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"9352f316-0b87-58b2-9925-9e52f9eaf999",
								true,
							},
							
							{
								"ac93c2a5-f3d6-b8d8-9253-e1a5fcbf0119",
								true,
							},
							
							{
								"68ffdc57-38d6-2993-be46-969f767c278d",
								true,
							},
							
							{
								"74748392-3717-36df-a079-fc75a02dcf22",
								true,
							},
							
							{
								"57557896-4ccd-2e37-8814-6c11a09cc2d8",
								true,
							},
							
							{
								"65c23125-414a-35fc-aa05-29de4729582e",
								true,
							},
							
							{
								"d89d9a36-ce2b-8495-a04d-0a5bdd112475",
								false,
							},
							
							{
								"7f6fb411-f42d-391a-aa0e-da3549b1f675",
								true,
							},
							
							{
								"70c6f43f-b954-5fe2-9bab-cdad00513a82",
								true,
							},
							
							{
								"ddc9803b-018e-c200-8aba-78173484c211",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction1",
						name = "Occult Fire III",
						targetType = "Most Clustered Enemy",
						uuid = "9faf8761-62d7-b561-b503-4da02506936f",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"9352f316-0b87-58b2-9925-9e52f9eaf999",
								true,
							},
							
							{
								"6bdf3b44-44df-040b-843d-d21c34fb88b2",
								true,
							},
							
							{
								"68ffdc57-38d6-2993-be46-969f767c278d",
								true,
							},
							
							{
								"74748392-3717-36df-a079-fc75a02dcf22",
								true,
							},
							
							{
								"57557896-4ccd-2e37-8814-6c11a09cc2d8",
								true,
							},
							
							{
								"65c23125-414a-35fc-aa05-29de4729582e",
								true,
							},
							
							{
								"d89d9a36-ce2b-8495-a04d-0a5bdd112475",
								false,
							},
							
							{
								"7f6fb411-f42d-391a-aa0e-da3549b1f675",
								true,
							},
							
							{
								"b2d42f2b-3438-a153-b386-ed63324010cd",
								true,
							},
							
							{
								"ddc9803b-018e-c200-8aba-78173484c211",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction2",
						name = "Occult Blizzard III",
						targetType = "Most Clustered Enemy",
						uuid = "0ced8d07-c5a6-c2ae-a5cf-c84350318918",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "ACR",
						clusterMinTarget = 0,
						clusterRadius = 5,
						conditions = 
						{
							
							{
								"9352f316-0b87-58b2-9925-9e52f9eaf999",
								true,
							},
							
							{
								"ac93c2a5-f3d6-b8d8-9253-e1a5fcbf0119",
								true,
							},
							
							{
								"68ffdc57-38d6-2993-be46-969f767c278d",
								true,
							},
							
							{
								"74748392-3717-36df-a079-fc75a02dcf22",
								true,
							},
							
							{
								"57557896-4ccd-2e37-8814-6c11a09cc2d8",
								true,
							},
							
							{
								"65c23125-414a-35fc-aa05-29de4729582e",
								true,
							},
							
							{
								"d89d9a36-ce2b-8495-a04d-0a5bdd112475",
								false,
							},
							
							{
								"7f6fb411-f42d-391a-aa0e-da3549b1f675",
								true,
							},
							
							{
								"ddc9803b-018e-c200-8aba-78173484c211",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction1",
						name = "Fallback Occult Fire III",
						targetType = "Most Clustered Enemy",
						uuid = "fc646d71-001f-5bc7-9377-aeebc1491ff9",
						variableIsHover = true,
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"] = false\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] = false\nself.used = true",
						clusterMinTarget = 0,
						conditions = 
						{
							
							{
								"9352f316-0b87-58b2-9925-9e52f9eaf999",
								true,
							},
							
							{
								"74748392-3717-36df-a079-fc75a02dcf22",
								true,
							},
							
							{
								"57557896-4ccd-2e37-8814-6c11a09cc2d8",
								false,
							},
							
							{
								"3d42f605-8171-63e2-9b6b-3ea6dc26f1aa",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_DutyAction5",
						gVarValue = 2,
						name = "Fallback Deactivate",
						targetType = "Most Clustered Enemy",
						uuid = "67c5d075-39c7-011d-bcf9-6d966fdc7af9",
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
						buffID = 5330,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is BLM",
						uuid = "9352f316-0b87-58b2-9925-9e52f9eaf999",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,31):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Occult Fire III",
						uuid = "ac93c2a5-f3d6-b8d8-9253-e1a5fcbf0119",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,32):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Occult Blizzard III",
						uuid = "6bdf3b44-44df-040b-843d-d21c34fb88b2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,33):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Occult Thunder III",
						uuid = "fa12a1b5-576e-c38b-962f-cd36b59c3686",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,34):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Occult Toad",
						uuid = "52e5a69a-024c-45f9-a6cd-bb49d85f9a37",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,35):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Occult Flare",
						uuid = "85b87344-fdd0-770a-bf60-c7dbd58164f8",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49072,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Fire/Blizzard/Thunder CD <= 3s",
						uuid = "68ffdc57-38d6-2993-be46-969f767c278d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49076,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Occult Flare CD <= 3s",
						uuid = "1155fc61-31e5-cd70-a00b-9991dc48a34d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "74748392-3717-36df-a079-fc75a02dcf22",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "57557896-4ccd-2e37-8814-6c11a09cc2d8",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "65c23125-414a-35fc-aa05-29de4729582e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"BLM Skills\")",
						name = "Toggle",
						uuid = "ddc9803b-018e-c200-8aba-78173484c211",
						version = 3,
					},
					inheritedIndex = 12,
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.mGetPlayer():IsMoving()",
						dequeueIfLuaFalse = true,
						name = "Player Moving",
						uuid = "d89d9a36-ce2b-8495-a04d-0a5bdd112475",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "7f6fb411-f42d-391a-aa0e-da3549b1f675",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"]\nor _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"]\nor _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction3\"]\nor _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction4\"]\nor _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"]",
						dequeueIfLuaFalse = true,
						name = "Is Cast queued",
						uuid = "3d42f605-8171-63e2-9b6b-3ea6dc26f1aa",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5322,
						dequeueIfLuaFalse = true,
						name = "Target - Fire Weak",
						uuid = "70c6f43f-b954-5fe2-9bab-cdad00513a82",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5323,
						dequeueIfLuaFalse = true,
						name = "Target - Ice Weak",
						uuid = "b2d42f2b-3438-a153-b386-ed63324010cd",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5324,
						dequeueIfLuaFalse = true,
						name = "Target - Lightning Weak",
						uuid = "f02cb8c6-8caa-a0f8-bf06-93dcd07d6986",
						version = 3,
					},
				},
			},
			name = "P. BLM",
			throttleTime = 100,
			timeout = 2.75,
			uuid = "caa3b091-3ad6-f0cd-a769-4a79b53f5634",
			version = 2,
		},
		inheritedIndex = 67,
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
						actionLua = "local currentWeather = GetCurrentWeather()\n\nif GlobalCurrentWeather == nil or GlobalCurrentWeather ~= currentWeather then\n    GlobalCurrentWeather = currentWeather\n    if currentWeather == 192 then\n        AnyoneCore.Shotcall(\"Weather for Forked Tower spawned.\", false, 8, true)\n        TensorCore.sendParsedChatMessage(\"/e {color:228,208,10}[Occult Crescent Notification]{color:255,255,255} Weather for forked tower spawned! <se.9>\")\n    end\nend\nself.eventConditionMismatch = true\nself.used = true",
						conditions = 
						{
							
							{
								"1c7f8070-dc2f-6ae3-b064-5fd0cbde6520",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Weather Shotcall",
						uuid = "4c2db6d6-f895-2eb9-b512-1ef28440c30b",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "self.used = true",
						conditions = 
						{
							
							{
								"1c7f8070-dc2f-6ae3-b064-5fd0cbde6520",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "empty reaction for throttle",
						uuid = "22b18714-63c5-87a1-a27e-b2298d3218d9",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "1c7f8070-dc2f-6ae3-b064-5fd0cbde6520",
						version = 3,
					},
				},
			},
			name = "[OC] Weather sound shotcall",
			throttleTime = 5000,
			uuid = "15ccc7ec-407e-4c0c-ac79-88a64b9cc4b7",
			version = 2,
		},
		inheritedIndex = 68,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 49097,
						conditions = 
						{
							
							{
								"20740ce7-cdb3-97bf-9b81-9c410fc83e5c",
								true,
							},
							
							{
								"a51d26c1-7fc1-6540-a3cc-03be8dea15a8",
								true,
							},
							
							{
								"f24daf54-6067-71ab-a584-757a29445a83",
								true,
							},
							
							{
								"62c17b9a-2c02-06c5-b811-941a048134d9",
								true,
							},
							
							{
								"06156a3b-a878-5be8-931b-f77af014d2dc",
								true,
							},
							
							{
								"cdb26cce-0ad5-fffd-b52d-7b0a3b8fc5a7",
								true,
							},
							
							{
								"226548b2-a460-63fe-a1ae-a347ee634c6c",
								true,
							},
							
							{
								"4eefd4f3-8b3d-f524-b53a-fd0b29a1c402",
								true,
							},
							
							{
								"e202feb7-6b71-f99e-941f-9ce00c5426d2",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_Hotbar_SixSidedStar",
						targetType = "Current Target",
						uuid = "ced6f3ef-1c02-46ff-8a81-0dbc5fdd2f56",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "In Occult Crescent",
						uuid = "20740ce7-cdb3-97bf-9b81-9c410fc83e5c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 5335,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is Necro",
						uuid = "a51d26c1-7fc1-6540-a3cc-03be8dea15a8",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Is Bot Running",
						uuid = "f24daf54-6067-71ab-a584-757a29445a83",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "62c17b9a-2c02-06c5-b811-941a048134d9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						name = "Self Living",
						uuid = "06156a3b-a878-5be8-931b-f77af014d2dc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 49097,
						buffCheckType = 2,
						buffID = 4232,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "On CD",
						uuid = "cdb26cce-0ad5-fffd-b52d-7b0a3b8fc5a7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 30,
						name = "Target <= 30y",
						uuid = "226548b2-a460-63fe-a1ae-a347ee634c6c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 49098,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						uuid = "91035cbb-cb0b-3140-b245-0be25ea084ed",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						comparator = 2,
						dequeueIfLuaFalse = true,
						hpValue = 30,
						matchAnyBuff = true,
						name = "Self Missing Transcendent",
						uuid = "4eefd4f3-8b3d-f524-b53a-fd0b29a1c402",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Drain Touch\")",
						name = "Toggle",
						uuid = "e202feb7-6b71-f99e-941f-9ce00c5426d2",
						version = 3,
					},
				},
			},
			name = "P. Necromancer (USE on warrior)",
			uuid = "78a6c2ef-7e57-09cd-b705-562934c6bedc",
			version = 2,
		},
		inheritedIndex = 69,
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
						actionLua = "local id = eventArgs.entityID\nlocal e = TensorCore.mGetEntity(id)\n\nlocal gaze = {\n    id          = id,\n    addedAt     = Now(),\n    channelTime = (eventArgs.channelTimeMax + .25 ) * 1000,\n    pos         = e.pos,\n}\n\nif data.gaze1 == nil then\n    data.gaze1 = gaze\nelseif data.gaze2 == nil then\n    data.gaze2 = gaze\nelseif data.gaze1.addedAt <= data.gaze2.addedAt then\n    data.gaze1 = gaze\nelse\n    data.gaze2 = gaze\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"580991dc-6fa1-8a65-a6ab-73874302a058",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						uuid = "2be71a66-6f6f-9645-991c-6b5ef5206778",
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
						conditionType = 12,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "Occult Crescent",
						uuid = "8585bf26-81c3-8633-a4a7-6fa2ea58a7b5",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						eventArgOptionType = 3,
						eventArgType = 2,
						eventSpellID = 47152,
						name = "Gaze Channels",
						spellIDList = 
						{
							47152,
							47148,
							47191,
						},
						uuid = "580991dc-6fa1-8a65-a6ab-73874302a058",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Extra] Gaze Tracker",
			uuid = "ef41ca3b-b8b3-b055-9750-acd44ba586ba",
			version = 2,
		},
		inheritedIndex = 70,
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
						actionLua = "local g1, g2 = data.gaze1, data.gaze2\n\nif g1 ~= nil and TimeSince(g1.addedAt) >= g1.channelTime then\n    data.gaze1, g1 = nil, nil\nend\nif g2 ~= nil and TimeSince(g2.addedAt) >= g2.channelTime then\n    data.gaze2, g2 = nil, nil\nend\n\nif g1 == nil and g2 == nil then\n    -- nothing live -- release the lock, but only if we were the one holding it\n    if data.gazeLocked then\n        TensorCore.API.TensorACR.toggleLockFace(false)\n        data.gazeLocked = nil\n    end\nelse\n    local h\n    local p = TensorCore.mGetPlayer()\n   \n\n    if g1 ~= nil and g2 ~= nil then\n        h = TensorCore.Avoidance.getHeadingBetweenPos(p.pos, TensorCore.mGetEntity(g1.id).pos, TensorCore.mGetEntity(g2.id).pos)\n    elseif g1 ~= nil then\n        h = TensorCore.getHeadingToTarget(p.pos, TensorCore.mGetEntity(g1.id).pos)\n    elseif g2 ~= nil then\n        h = TensorCore.getHeadingToTarget(p.pos, TensorCore.mGetEntity(g2.id).pos)\n\tend\n\n    h = h + math.pi\n    TensorCore.API.TensorACR.setLockFaceHeading(h)\n\n    if not data.gazeLocked then\n        TensorCore.API.TensorACR.toggleLockFace(true)\n        data.gazeLocked = true\n    end\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"82688da5-fbc1-d9ce-8558-f22096750a4b",
								true,
							},
							
							{
								"c466a5b4-da07-b94c-8d31-302e253a99d0",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						uuid = "5e58978f-57b2-7b38-8327-6269b5b4be39",
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
						conditionType = 12,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "Occult Crescent",
						uuid = "82688da5-fbc1-d9ce-8558-f22096750a4b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true",
						name = "Bot Running",
						uuid = "c466a5b4-da07-b94c-8d31-302e253a99d0",
						version = 3,
					},
				},
			},
			eventType = 12,
			name = "[Extra] Gaze Resolver",
			uuid = "eb4b56b6-2b74-6468-8fba-53017fc139c8",
			version = 2,
		},
		inheritedIndex = 71,
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
						actionLua = "MoogleTelegraphs.Settings.aoeIDUserBlacklist[47308] = {label = \"Knowledge Level 5 Death\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[47309] = {label = \"Knowledge Level 3 Flare\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[47311] = {label = \"Knowledge Level 5 Death\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[47312] = {label = \"Knowledge Level 3 Flare\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[47313] = {label = \"Knowledge Level 4 Holy\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[47314] = {label = \"Prime Knowledge Level Death\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[50554] = {label = \"Knowledge Level 5 Death\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[50555] = {label = \"Knowledge Level 3 Flare\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[50557] = {label = \"Knowledge Level 5 Death\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[50558] = {label = \"Knowledge Level 3 Flare\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[50559] = {label = \"Knowledge Level 4 Holy\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[50560] = {label = \"Prime Knowledge Level Death\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[50561] = {label = \"Prime Knowledge Level Death\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[41284] = {label = \"Ancient Holy\", source = \"Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[41395] = {label = \"Ancient Holy\", source = \"Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[41315] = {label = \"Lethal Nails\", source = \"Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[41316] = {label = \"Lethal Nails\", source = \"Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[41317] = {label = \"Lethal Nails\", source = \"Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[41830] = {label = \"Barefisted Death\", source = \"Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[47073] = {label = \"Garrote\", source = \"Occult Reactions - Double Trouble CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[47152] = {label = \"Sinister Sight\", source = \"Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[47191] = {label = \"Stunning Sheen\", source = \"Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[49879] = {label = \"Prime Knowledge Level Death\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserSetCones[50691] = {name=\"Dual Cut\",angle=180,source=\"Occult Crescent Reactions - Double Trouble CE\"}\nMoogleTelegraphs.Settings.aoeIDUserSetCones[50692] = {name=\"Dual Cut\",angle=180,source=\"Occult Crescent Reactions - Double Trouble CE\"}\nMoogleTelegraphs.Settings.aoeIDUserSetDonuts[41759] = {name=\"Crystallized Chaos\",radius=7,source=\"CE: Trial by Claw Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserSetDonuts[41760] = {name=\"Crystallized Chaos\",radius=13,source=\"CE: Trial by Claw Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserSetDonuts[41761] = {name=\"Crystallized Chaos\",radius=19,source=\"CE: Trial by Claw Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserSetDonuts[41729] = {name=\"Crystallized Chaos\",radius=7,source=\"CE: Trial by Claw Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserSetDonuts[41731] = {name=\"Crystallized Chaos\",radius=19,source=\"CE: Trial by Claw Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserSetDonuts[41733] = {name=\"Crystallized Chaos\",radius=7,source=\"CE: Trial by Claw Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserSetDonuts[41734] = {name=\"Crystallized Chaos\",radius=13,source=\"CE: Trial by Claw Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserSetDonuts[41735] = {name=\"Crystallized Chaos\",radius=19,source=\"CE: Trial by Claw Occult Reactions\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[47310] = {label = \"Knowledge Level 4 Holy\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[50556] = {label = \"Knowledge Level 4 Holy\", source = \"Occult Reactions - Folios CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[47439] = { label = 'Tendon Ripper', source = 'North Horn Reactions - Abductor' }\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[49799] = {label = \"Plaincracker\", source = \"Occult Reactions - Appaling Behavior CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[49779] = {label = \"Bad Breath\", source = \"Occult Reactions - Appaling Behavior CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[49777] = {label = \"Bad Breath\", source = \"Occult Reactions - Appaling Behavior CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[47443] = { label = 'Splinter', source = 'North Horn Reactions - Abductor' }\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[47175] = {label = \"Explosion\", source = \"Occult Reactions - Dark Artistry CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[47176] = {label = \"Explosion\", source = \"Occult Reactions - Dark Artistry CE\"}\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[48311] = { label = \"Tiny Flare\", source = \"North Horn Reactions - Tiny Terror\" }\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[48312] = { label = \"Tiny Holy\", source = \"North Horn Reactions - Tiny Terror\" }\n\n-- Topaz circles follow stone visibility. Wall-contact rooms are pre-drawn from\n-- the room controller, with the AOE packet retained as a fallback.\n-- 48296/48297 are instant follow-up hits and create no Moogle AOE.\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[48281] = { label = 'Topaz Ray wall-contact room', source = 'North Horn Reactions - A Beast Unleashed' }\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[48282] = { label = 'Topaz Ray early stone circle', source = 'North Horn Reactions - A Beast Unleashed' }\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[48294] = { label = 'Claw to Tail', source = 'North Horn Reactions - A Beast Unleashed' }\nMoogleTelegraphs.Settings.aoeIDUserBlacklist[48295] = { label = 'Tail to Claw', source = 'North Horn Reactions - A Beast Unleashed' }\n\n-- lint: allow moogle-blacklist,\n-- Cleanup loops below never populate Settings overrides.\n-- Reset Beast-owned timed shapes and state when this profile is loaded.\nfor _, uuid in pairs(data.northHornBeastTopazCircles or {}) do\n\tif uuid then Argus.deleteTimedShape(uuid) end\nend\nfor _, uuid in ipairs(data.northHornBeastEarlyFixedDraws or {}) do\n\tif uuid then Argus.deleteTimedShape(uuid) end\nend\nlocal oldRoomState = data.northHornBeastTopazRoomWave\nif oldRoomState and oldRoomState.provisional then\n\tfor _, uuid in ipairs(oldRoomState.provisional) do\n\t\tif uuid then Argus.deleteTimedShape(uuid) end\n\tend\nend\n\ndata.northHornBeastBossID = nil\ndata.northHornBeastTopazCircles = {}\ndata.northHornBeastVisibleStones = {}\ndata.northHornBeastStoneCells = {}\ndata.northHornBeastTopazWaveToken = 0\ndata.northHornBeastCommittedCells = nil\ndata.northHornBeastEarlyFixedDraws = nil\ndata.northHornBeastEarlyFixedWaveToken = nil\ndata.northHornBeastTopazRoomWave = nil\n\n-- A one-time reload recovery scan is acceptable; the live mechanics are event-driven.\nlocal bosses = TensorCore.entityList(\"contentid=14791,attackable,maxdistance=80\") or {}\nfor _, boss in pairs(bosses) do\n\tif boss.id and Argus.isEntityVisible(boss) and\n\t\tArgus.getEntityModel(boss) == 19535 then\n\t\tdata.northHornBeastBossID = boss.id\n\t\tbreak\n\tend\nend\n\n-- Algol legacy renderer: begin\n-- These action IDs are unique to Algol. Preserve any existing per-action\n-- render choices and force only the legacy drawing path for readability.\nlocal algolLegacyDraws = {\n    [48118] = \"Deathwall\",\n    [48112] = \"Rotten Onion (fast)\",\n    [48110] = \"Rotten Onion (slow)\",\n    [50427] = \"Shrill Peal\",\n    [48104] = \"Inhale\",\n    [50469] = \"Devour (short)\",\n    [48109] = \"Rotten Tomato (slow)\",\n    [48111] = \"Rotten Tomato (fast)\",\n    [48971] = \"Cursed Screech\",\n    [48113] = \"Spinning Inhale\",\n    [50942] = \"Spinning Inhale (outer)\",\n    [48114] = \"Spinning Inhale (inner)\",\n    [48249] = \"Spinning Inhale (cone)\",\n    [48105] = \"Devour\",\n    [50422] = \"Devour (cone 1)\",\n    [50467] = \"Devour (cone 2)\",\n    [48116] = \"Digested Juice\",\n    [50424] = \"Digested Juice (helper)\",\n    [48117] = \"Malady\",\n    [50425] = \"Malady (helper)\",\n}\nfor aoeID, label in pairs(algolLegacyDraws) do\n    local current = MoogleTelegraphs.Settings.aoeIDUserSetRender[aoeID] or {}\n    current.name = current.name or (\"Algol - \" .. label)\n    current.overlay = current.overlay == true\n    current.disableTerrainWarp = current.disableTerrainWarp == true\n    current.flat = current.flat == true\n    current.oldDraw = true\n    current.disableVFX = current.disableVFX == true\n    current.delay = tonumber(current.delay) or 0\n    current.source = \"Occult Reactions - Algol\"\n    MoogleTelegraphs.Settings.aoeIDUserSetRender[aoeID] = current\nend\n-- Algol legacy renderer: end\n\nself.used = true",
						conditions = 
						{
							
							{
								"07fa8a6f-9963-dc2a-b0a3-3d17971ac0a4",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuMNK3_CD",
						uuid = "c8a70073-5277-c09f-9529-db7c9ea85b0a",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						localmapid = 1252,
						name = "South Horn",
						uuid = "07fa8a6f-9963-dc2a-b0a3-3d17971ac0a4",
						version = 3,
					},
				},
			},
			eventType = 11,
			name = "Blacklist+draws moogle (enable this)",
			uuid = "0c591123-b2c0-d2e0-aca9-9e17cf24d43e",
			version = 2,
		},
		inheritedIndex = 72,
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
						actionLua = "-- Gaze Tracker display  (companion to the channel-event tracker)\n-- Reads the shared globals: data.gaze1 / data.gaze2\nlocal GUI_FLAGS = 97\n\n-- ── tuning ──────────────────────────────────────────────────────────\nlocal WARN_MS   = 2000    -- remaining <= this -> yellow\nlocal DANGER_MS = 750     -- remaining <= this -> red\n-- ────────────────────────────────────────────────────────────────────\n\nif data.gazeAutoClear == nil then data.gazeAutoClear = true end\n\nlocal function fmtPos(p)\n    if p == nil then return \"n/a\" end\n    return string.format(\"%.1f, %.1f, %.1f\", p.x or 0, p.y or 0, p.z or 0)\nend\n\n-- entity may have despawned since it was captured, so guard the lookup\nlocal function liveEntity(id)\n    local ok, e = pcall(TensorCore.mGetEntity, id)\n    if ok then return e end\n    return nil\nend\n\nlocal function drawSlot(label, g)\n    GUI:TextColored(0.55, 0.55, 0.55, 1.0, label)\n\n    if g == nil then\n        GUI:Text(\"   -- empty --\")\n        return nil\n    end\n\n    local remaining = (g.addedAt + g.channelTime) - Now()\n    if remaining < 0 then remaining = 0 end\n\n    local r, gr, b = 0.3, 1.0, 0.4\n    if remaining <= DANGER_MS then\n        r, gr, b = 1.0, 0.25, 0.25\n    elseif remaining <= WARN_MS then\n        r, gr, b = 1.0, 0.85, 0.2\n    end\n\n    local e    = liveEntity(g.id)\n    local name = (e and e.name) or \"?\"\n\n    GUI:Text(string.format(\"   %s  (id %d)\", tostring(name), g.id))\n    GUI:TextColored(r, gr, b, 1.0,\n        string.format(\"   %.2fs left  /  %.2fs total\",\n            remaining / 1000, g.channelTime / 1000))\n    GUI:Text(\"   spawn pos: \" .. fmtPos(g.pos))\n    if e and e.pos then\n        GUI:Text(\"   live  pos: \" .. fmtPos(e.pos))\n    else\n        GUI:TextColored(0.8, 0.5, 0.5, 1.0, \"   live  pos: entity gone\")\n    end\n\n    return remaining\nend\n\nGUI:Begin(\"GazeTracker#Cherry\", true, GUI_FLAGS)\n\nGUI:SetWindowFontSize(1.25)\nGUI:TextColored(0, 1, 1, 1.0, \"Gaze Tracker\")\nGUI:SetWindowFontSize(1.0)\n\nlocal rem1 = drawSlot(\"Gaze 1\", data.gaze1)\nGUI:Separator()\nlocal rem2 = drawSlot(\"Gaze 2\", data.gaze2)\nGUI:Separator()\n\ndata.gazeAutoClear = GUI:Checkbox(\"Auto-clear expired\", data.gazeAutoClear)\nif GUI:Button(\"Clear both\") then\n    data.gaze1 = nil\n    data.gaze2 = nil\nend\n\nif data.gazeAutoClear then\n    if rem1 ~= nil and rem1 <= 0 then data.gaze1 = nil end\n    if rem2 ~= nil and rem2 <= 0 then data.gaze2 = nil end\nend\n\nGUI:End()\nself.used = true",
						conditions = 
						{
							
							{
								"054370dc-acb1-d5a6-bf38-116bddca4aae",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						uuid = "dc89f476-dba2-4fde-9e93-74c9f1654c5c",
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
						conditionType = 12,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "Occult Crescent",
						uuid = "054370dc-acb1-d5a6-bf38-116bddca4aae",
						version = 3,
					},
				},
			},
			eventType = 12,
			name = "[Extra] Gaze Display",
			uuid = "ccc078bf-d8c3-16bf-a777-ce9c90a5be43",
			version = 2,
		},
		inheritedIndex = 73,
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
						actionLua = "local function deleteShape(uuid)\n    if uuid then Argus.deleteTimedShape(uuid) end\nend\n\nlocal function deleteText(uuid)\n    if uuid then AnyoneCore.removeTimedWorldText(uuid) end\nend\n\nlocal function clearBeastDraws(state)\n    local stampede = state.northHornBeastStampede\n    if stampede then\n        for _, entry in pairs(stampede.entries or {}) do\n            deleteShape(entry.shape)\n            deleteText(entry.text)\n        end\n        for _, entry in pairs(stampede.guidance or {}) do\n            deleteShape(entry.arrow)\n            deleteShape(entry.landing)\n        end\n    end\n    for _, uuid in pairs(state.northHornBeastTopazCircles or {}) do\n        deleteShape(uuid)\n    end\n    for _, uuid in ipairs(state.northHornBeastEarlyFixedDraws or {}) do\n        deleteShape(uuid)\n    end\n    local roomState = state.northHornBeastTopazRoomWave\n    if roomState then\n        for _, uuid in ipairs(roomState.provisional or {}) do\n            deleteShape(uuid)\n        end\n    end\n    for _, uuid in ipairs(state.northHornBeastTransientDraws or {}) do\n        deleteShape(uuid)\n    end\n\n    state.northHornBeastStampede = nil\n    state.northHornBeastTopazCircles = {}\n    state.northHornBeastVisibleStones = {}\n    state.northHornBeastStoneCells = {}\n    state.northHornBeastTopazWaveToken = 0\n    state.northHornBeastCommittedCells = nil\n    state.northHornBeastEarlyFixedDraws = nil\n    state.northHornBeastEarlyFixedWaveToken = nil\n    state.northHornBeastTopazRoomWave = nil\n    state.northHornBeastSelectedTiling = nil\n    state.northHornBeastTransientDraws = nil\nend\n\nlocal entityID = eventArgs.entityID\nif eventArgs.wasVisible == false then\n    data.northHornBeastBossID = entityID\nelseif data.northHornBeastBossID == entityID then\n    clearBeastDraws(data)\n    data.northHornBeastBossID = nil\nend\nself.used = true",
						conditions = 
						{
							
							{
								"32000109-0000-4000-8000-000000000001",
								true,
							},
							
							{
								"32000109-0000-4000-8000-000000000301",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Reset or clean up the real boss",
						uuid = "32000109-0000-4000-8000-000000000201",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local entityID = eventArgs.entityID\nlocal circles = data.northHornBeastTopazCircles or {}\nlocal visible = data.northHornBeastVisibleStones or {}\nlocal stoneCells = data.northHornBeastStoneCells or {}\ndata.northHornBeastTopazCircles = circles\ndata.northHornBeastVisibleStones = visible\ndata.northHornBeastStoneCells = stoneCells\n\nif eventArgs.wasVisible == false then\n\tlocal stone = TensorCore.mGetEntity(entityID)\n\tif not stone or not stone.pos or Argus.getEntityModel(stone) ~= 19536 then\n\t\tself.used = true\n\t\treturn\n\tend\n\n\tif next(visible) == nil then\n\t\tfor _, uuid in ipairs(data.northHornBeastEarlyFixedDraws or {}) do\n\t\t\tif uuid then Argus.deleteTimedShape(uuid) end\n\t\tend\n\t\tlocal oldState = data.northHornBeastTopazRoomWave\n\t\tif oldState and oldState.provisional then\n\t\t\tfor _, uuid in ipairs(oldState.provisional) do\n\t\t\t\tif uuid then Argus.deleteTimedShape(uuid) end\n\t\t\tend\n\t\tend\n\t\tdata.northHornBeastTopazWaveToken =\n\t\t\t(data.northHornBeastTopazWaveToken or 0) + 1\n\t\tdata.northHornBeastCommittedCells = nil\n\t\tdata.northHornBeastEarlyFixedDraws = nil\n\t\tdata.northHornBeastEarlyFixedWaveToken = nil\n\t\tdata.northHornBeastTopazRoomWave = nil\n\tend\n\n\tvisible[entityID] = true\n\tlocal column = math.max(0, math.min(3, math.floor((stone.pos.x - 218) / 10)))\n\tlocal row = math.max(0, math.min(3, math.floor((stone.pos.z - 332) / 10)))\n\tlocal cell = (row * 4) + column\n\tstoneCells[entityID] = cell\n\n\tlocal previous = circles[entityID]\n\tif previous then Argus.deleteTimedShape(previous) end\n\tcircles[entityID] =\n\t\tTensorCore.getMoogleDrawer():addTimedCircleOnEnt(600000, entityID, 4)\nelse\n\tlocal uuid = circles[entityID]\n\tif uuid then Argus.deleteTimedShape(uuid) end\n\tcircles[entityID] = nil\n\tvisible[entityID] = nil\n\tstoneCells[entityID] = nil\n\n\tif next(visible) == nil then\n\t\tfor _, earlyUUID in ipairs(data.northHornBeastEarlyFixedDraws or {}) do\n\t\t\tif earlyUUID then Argus.deleteTimedShape(earlyUUID) end\n\t\tend\n\t\tlocal roomState = data.northHornBeastTopazRoomWave\n\t\tif roomState and roomState.provisional then\n\t\t\tfor _, provisionalUUID in ipairs(roomState.provisional) do\n\t\t\t\tif provisionalUUID then Argus.deleteTimedShape(provisionalUUID) end\n\t\t\tend\n\t\tend\n\t\tdata.northHornBeastCommittedCells = nil\n\t\tdata.northHornBeastEarlyFixedDraws = nil\n\t\tdata.northHornBeastEarlyFixedWaveToken = nil\n\t\tdata.northHornBeastTopazRoomWave = nil\n\tend\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"32000109-0000-4000-8000-000000000001",
								true,
							},
							
							{
								"32000109-0000-4000-8000-000000000302",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Attach or remove Topaz circles",
						uuid = "32000109-0000-4000-8000-000000000202",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "Zone",
						uuid = "32000109-0000-4000-8000-000000000001",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 14791,
						name = "Atlas Carbuncle visibility",
						uuid = "32000109-0000-4000-8000-000000000301",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 14792,
						name = "Topaz Stone visibility",
						uuid = "32000109-0000-4000-8000-000000000302",
						version = 3,
					},
				},
			},
			eventType = 22,
			name = "[A Beast Unleashed] Visibility Lifecycle",
			uuid = "32000109-0000-4000-8000-000000000999",
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
						actionLua = "local green,yellow,red,blue = 1677786914,1677787134,1677721855,1694449152\ndata.dedoTargetNames = data.dedoTargetNames or {\n-- Add names or contentid you want to track here\n-- after modifying the table you have to trigger onwipe under Debug tab \n-- or reload lua for it to reflect\n\n-- the value can either be a color or a table if you want to force to show invisible ents\n\n    [\"treasure coffer\"] = green,\n    [\"survey point\"] = yellow,\n    [\"2010139\"] = {color = red, forceVisible = true}, \n   -- [\"Random Test Name\"] = blue,\n    \n    \n-- if you want other colors than those 4 you can just put in a u32 color value\n-- color codes can be found in Anyone's Dev Monitor > Tools & Debugging Helper > Color Picker \n-- its the U32 Value you want.\n\n}\n\ndata.dedoArrowEnts = data.dedoArrowEnts or {}\ndata.dedoArrowTime = Now()\ntable.clear(data.dedoArrowEnts)\n\nfor id, ent in pairs(TensorCore.entityList(\"\")) do\n    local lowerName = string.lower(ent.name)\n    local pot = data.magicPotTreasure\n    if lowerName == \"treasure coffer\" and pot and pot.solved and pot.target and ent.pos then\n        local dx = ent.pos.x - pot.target.x\n        local dz = ent.pos.z - pot.target.z\n        if dx * dx + dz * dz <= 36 and ent.targetable == true then\n            pot.cofferEntityID = id\n        end\n    end\n    local targetConfig = data.dedoTargetNames[lowerName] or data.dedoTargetNames[tostring(ent.contentid)]\n    \n    if targetConfig then\n        local color, forceVisible\n        if type(targetConfig) == \"table\" then\n            color = targetConfig.color\n            forceVisible = targetConfig.forceVisible or false\n        else\n            color = targetConfig\n            forceVisible = false\n        end\n        \n        local dist = TensorCore.getDistance2d(TensorCore.mGetPlayer().pos, ent.pos)\n        local isVisible = Argus.isEntityVisible(ent)\n        \n        local canTrack = lowerName ~= \"treasure coffer\" or ent.targetable == true\n        if dist > 5 and canTrack and (isVisible or forceVisible) then\n            data.dedoArrowEnts[id] = {name = ent.name,pos = ent.pos,color = color,dist = dist,}\n        end\n    end\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"6cdcc0ad-fa02-e3af-97af-f926c182182f",
								true,
							},
							
							{
								"c7b2860b-8289-7795-a478-9d3865187c43",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Modify List",
						uuid = "dc3172cf-0216-5185-925c-d466070e4db1",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local player = TensorCore.mGetPlayer()\nfor id, ent in pairs(data.dedoArrowEnts) do\n\tlocal g = TensorCore.getStaticDrawer(ent.color)\n\tg.colorOutline = 4294967295\n\tg:addArrow(player.pos.x, player.pos.y, player.pos.z,TensorCore.getHeadingToTarget(player.pos, ent.pos),1.5, 0.25, nil, nil, true)\n\tg:addCircle(ent.pos.x, ent.pos.y, ent.pos.z, 1, true)\n\tg.colorOutline = nil\nend\n\nlocal pot = data.magicPotTreasure\nif player and player.pos and pot and pot.solved and pot.target then\n    local dx = pot.target.x - player.pos.x\n    local dz = pot.target.z - player.pos.z\n    if dx * dx + dz * dz > 9 then\n        local color = GUI:ColorConvertFloat4ToU32(0.1, 1.0, 0.2, 0.90)\n        local potDrawer = TensorCore.getStaticDrawer(color)\n        potDrawer.colorOutline = 4294967295\n        potDrawer:addArrow(\n            player.pos.x,\n            player.pos.y,\n            player.pos.z,\n            TensorCore.getHeadingToTarget(player.pos, pot.target),\n            2.2,\n            0.35,\n            nil,\n            nil,\n            true\n        )\n        potDrawer.colorOutline = nil\n    end\nend\nself.used = true",
						conditions = 
						{
							
							{
								"6cdcc0ad-fa02-e3af-97af-f926c182182f",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						uuid = "c27fb81b-9bdc-0481-a815-bbb07fe0385b",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						localmapid = 1252,
						uuid = "6cdcc0ad-fa02-e3af-97af-f926c182182f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.dedoArrowTime == nil or TimeSince(data.dedoArrowTime) > 1000",
						uuid = "c7b2860b-8289-7795-a478-9d3865187c43",
						version = 3,
					},
				},
			},
			eventType = 12,
			name = "Arrow objects",
			uuid = "6d0328b9-df88-b08a-a5f2-c23e5dd03dd9",
			version = 2,
		},
		inheritedIndex = 75,
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
						actionLua = "local currentWeather = GetCurrentWeather()\n\nif GlobalCurrentWeather == nil or GlobalCurrentWeather ~= currentWeather then\n    GlobalCurrentWeather = currentWeather\n    if currentWeather == 192 then\n       TensorCore.showRaidWarning(\"Weather for Forked Tower spawned!\", 0, 15)\n\t   TensorCore.sendParsedChatMessage(\"/e {color:228,208,10}[Occult Crescent Notification]{color:255,255,255} Weather for forked tower spawned!\")\n    end\nend\nself.used = true",
						conditions = 
						{
							
							{
								"4b9ce06b-2e8a-4bb6-aef8-63b65ecbe699",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Weather Shotcall",
						uuid = "e25652c9-033a-4802-8191-96fe1fc4ed69",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "self.used = true",
						conditions = 
						{
							
							{
								"4b9ce06b-2e8a-4bb6-aef8-63b65ecbe699",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "empty reaction for throttle",
						uuid = "ed9f9916-a111-4703-8ea8-2ee55de2e3a0",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "4b9ce06b-2e8a-4bb6-aef8-63b65ecbe699",
						version = 3,
					},
				},
			},
			enabled = false,
			name = "[OC] Weather Text Shotcall",
			throttleTime = 5000,
			uuid = "5dc65816-0d2a-4fd3-9218-ad0eb935e372",
			version = 2,
		},
		inheritedIndex = 76,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 7561,
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"e7de50ca-b2f8-752a-b528-db724f2d7054",
								true,
							},
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"a4bae7f0-15e7-e380-89ed-28e6f8f500ff",
								true,
							},
							
							{
								"68842e46-8c8e-f38e-80f1-1c565d84de04",
								true,
							},
							
							{
								"36e0cdc9-6f67-832d-af9d-962934e8d8cc",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								true,
							},
							
							{
								"b89deb6f-ac1d-7569-98b2-ce63b9dc89ac",
								true,
							},
							
							{
								"d776f17c-758b-4921-9144-157ce819e49f",
								true,
							},
							
							{
								"066cc251-0be0-1ddd-8963-58a814259fbd",
								true,
							},
							
							{
								"1e471142-f907-e1dd-abd5-6325e970db36",
								true,
							},
							
							{
								"15e16ad4-c97f-fcfe-949e-c60c37b28519",
								true,
							},
							
							{
								"d037fcde-5780-d93b-9db9-0bd05e6004b1",
								true,
							},
							
							{
								"4497846d-7152-a5f9-8eec-2d45e16ccb82",
								true,
							},
							
							{
								"0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
								true,
							},
							
							{
								"65026472-ef44-c2dc-a211-9b5279bcfa9c",
								true,
							},
							
							{
								"396394da-16bb-d2ab-a20c-1c1083191a95",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						ignoreWeaveRules = true,
						name = "Swiftcast CD Enabled",
						uuid = "b8fb2967-ec8b-3e1a-90c2-d4cc7d3703c8",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						actionID = 7561,
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"e7de50ca-b2f8-752a-b528-db724f2d7054",
								true,
							},
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"a4bae7f0-15e7-e380-89ed-28e6f8f500ff",
								true,
							},
							
							{
								"68842e46-8c8e-f38e-80f1-1c565d84de04",
								true,
							},
							
							{
								"36e0cdc9-6f67-832d-af9d-962934e8d8cc",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								true,
							},
							
							{
								"b89deb6f-ac1d-7569-98b2-ce63b9dc89ac",
								true,
							},
							
							{
								"066cc251-0be0-1ddd-8963-58a814259fbd",
								true,
							},
							
							{
								"1e471142-f907-e1dd-abd5-6325e970db36",
								true,
							},
							
							{
								"15e16ad4-c97f-fcfe-949e-c60c37b28519",
								false,
							},
							
							{
								"d037fcde-5780-d93b-9db9-0bd05e6004b1",
								true,
							},
							
							{
								"4497846d-7152-a5f9-8eec-2d45e16ccb82",
								true,
							},
							
							{
								"0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
								true,
							},
							
							{
								"65026472-ef44-c2dc-a211-9b5279bcfa9c",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						ignoreWeaveRules = true,
						name = "Swiftcast CD Disabled",
						uuid = "ee46b937-034e-1ffb-84ed-9beca8a8c1fe",
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
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "e7de50ca-b2f8-752a-b528-db724f2d7054",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4365,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. TMage",
						uuid = "2312ae26-c802-ad39-bbbf-0830ed918dac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.mGetPlayer().alive",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 0.10000000149012,
						name = "Am Alive",
						uuid = "a4bae7f0-15e7-e380-89ed-28e6f8f500ff",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "68842e46-8c8e-f38e-80f1-1c565d84de04",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "36e0cdc9-6f67-832d-af9d-962934e8d8cc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "e27ae646-5033-f9d0-8f32-0bab1ca37b02",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "b89deb6f-ac1d-7569-98b2-ce63b9dc89ac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil and TimeSince(data.ocCombatTimer) > 4000",
						dequeueIfLuaFalse = true,
						name = "Combat > 4s",
						uuid = "d776f17c-758b-4921-9144-157ce819e49f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,32):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Comet",
						uuid = "066cc251-0be0-1ddd-8963-58a814259fbd",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_AOE\"]",
						dequeueIfLuaFalse = true,
						name = "AOE Enabled",
						uuid = "1e471142-f907-e1dd-abd5-6325e970db36",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_CD\"]",
						dequeueIfLuaFalse = true,
						name = "CD Enabled",
						uuid = "15e16ad4-c97f-fcfe-949e-c60c37b28519",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 28,
						name = "Target <= 28y",
						uuid = "d037fcde-5780-d93b-9db9-0bd05e6004b1",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 7561,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Swiftcast Not CD",
						uuid = "4497846d-7152-a5f9-8eec-2d45e16ccb82",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 41623,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Comet Not CD",
						uuid = "0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 6,
						buffIDList = 
						{
							4260,
							1211,
							1249,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Missing InstaCast",
						uuid = "65026472-ef44-c2dc-a211-9b5279bcfa9c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] == false",
						dequeueIfLuaFalse = true,
						name = "Quick Not Queued",
						uuid = "396394da-16bb-d2ab-a20c-1c1083191a95",
						version = 3,
					},
				},
			},
			name = "P. TMage Comet Swiftcast",
			throttleTime = 1500,
			uuid = "c9178b74-f32c-817a-950c-32b1fc0a7ee8",
			version = 2,
		},
		inheritedIndex = 77,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 7561,
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"e7de50ca-b2f8-752a-b528-db724f2d7054",
								true,
							},
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"a4bae7f0-15e7-e380-89ed-28e6f8f500ff",
								true,
							},
							
							{
								"68842e46-8c8e-f38e-80f1-1c565d84de04",
								true,
							},
							
							{
								"36e0cdc9-6f67-832d-af9d-962934e8d8cc",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								true,
							},
							
							{
								"7cda01fc-abb8-7f7b-b78d-6ec0522771a2",
								true,
							},
							
							{
								"8ef4627a-d7bb-0732-93fc-5d32cd4e013b",
								true,
							},
							
							{
								"066cc251-0be0-1ddd-8963-58a814259fbd",
								true,
							},
							
							{
								"15e16ad4-c97f-fcfe-949e-c60c37b28519",
								true,
							},
							
							{
								"4497846d-7152-a5f9-8eec-2d45e16ccb82",
								true,
							},
							
							{
								"0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
								true,
							},
							
							{
								"65026472-ef44-c2dc-a211-9b5279bcfa9c",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						ignoreWeaveRules = true,
						name = "Swiftcast",
						uuid = "b8fb2967-ec8b-3e1a-90c2-d4cc7d3703c8",
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
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "e7de50ca-b2f8-752a-b528-db724f2d7054",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4365,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. TMage",
						uuid = "2312ae26-c802-ad39-bbbf-0830ed918dac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.mGetPlayer().alive",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 0.10000000149012,
						name = "Am Alive",
						uuid = "a4bae7f0-15e7-e380-89ed-28e6f8f500ff",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "68842e46-8c8e-f38e-80f1-1c565d84de04",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "36e0cdc9-6f67-832d-af9d-962934e8d8cc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "e27ae646-5033-f9d0-8f32-0bab1ca37b02",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "7cda01fc-abb8-7f7b-b78d-6ec0522771a2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil and TimeSince(data.ocCombatTimer) > 2000",
						dequeueIfLuaFalse = true,
						name = "Combat > 2s",
						uuid = "8ef4627a-d7bb-0732-93fc-5d32cd4e013b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,35):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Quick",
						uuid = "066cc251-0be0-1ddd-8963-58a814259fbd",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_CD\"]",
						dequeueIfLuaFalse = true,
						name = "CD Enabled",
						uuid = "15e16ad4-c97f-fcfe-949e-c60c37b28519",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 7561,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Swiftcast Not CD",
						uuid = "4497846d-7152-a5f9-8eec-2d45e16ccb82",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 41625,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Quick Not CD",
						uuid = "0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 6,
						buffIDList = 
						{
							1211,
							1249,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Missing InstaCast",
						uuid = "65026472-ef44-c2dc-a211-9b5279bcfa9c",
						version = 3,
					},
				},
			},
			name = "P. TMage Quick Swiftcast",
			throttleTime = 1500,
			uuid = "eb688e35-87ab-c255-a605-63f5423c3c0a",
			version = 2,
		},
		inheritedIndex = 78,
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
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"e7de50ca-b2f8-752a-b528-db724f2d7054",
								true,
							},
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"a4bae7f0-15e7-e380-89ed-28e6f8f500ff",
								true,
							},
							
							{
								"68842e46-8c8e-f38e-80f1-1c565d84de04",
								true,
							},
							
							{
								"36e0cdc9-6f67-832d-af9d-962934e8d8cc",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								true,
							},
							
							{
								"b89deb6f-ac1d-7569-98b2-ce63b9dc89ac",
								true,
							},
							
							{
								"7a1b35d4-b11f-bdcc-a54f-314ef5b4f5cb",
								true,
							},
							
							{
								"fdcbe872-f73b-6950-866f-abbc5cd004b9",
								true,
							},
							
							{
								"1e471142-f907-e1dd-abd5-6325e970db36",
								true,
							},
							
							{
								"b3f3779f-97e1-26c8-aab2-1d54bd11306a",
								true,
							},
							
							{
								"2c3b763e-60cc-5072-92b9-f8232d3fbcd1",
								true,
							},
							
							{
								"b77c75a7-c8bf-d56b-9d04-5a7f236d29d5",
								true,
							},
							
							{
								"60d03392-f834-a5a4-97c8-50ff6b2bdd06",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Quick Swiftcast",
						uuid = "29afcef9-cb5c-08b4-b59b-cb9bb5fc1db4",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"e7de50ca-b2f8-752a-b528-db724f2d7054",
								true,
							},
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"a4bae7f0-15e7-e380-89ed-28e6f8f500ff",
								true,
							},
							
							{
								"68842e46-8c8e-f38e-80f1-1c565d84de04",
								true,
							},
							
							{
								"36e0cdc9-6f67-832d-af9d-962934e8d8cc",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								true,
							},
							
							{
								"b89deb6f-ac1d-7569-98b2-ce63b9dc89ac",
								true,
							},
							
							{
								"7a1b35d4-b11f-bdcc-a54f-314ef5b4f5cb",
								true,
							},
							
							{
								"fdcbe872-f73b-6950-866f-abbc5cd004b9",
								true,
							},
							
							{
								"1e471142-f907-e1dd-abd5-6325e970db36",
								true,
							},
							
							{
								"b3f3779f-97e1-26c8-aab2-1d54bd11306a",
								true,
							},
							
							{
								"0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
								true,
							},
							
							{
								"60d03392-f834-a5a4-97c8-50ff6b2bdd06",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Quick Hardcast",
						uuid = "b8fb2967-ec8b-3e1a-90c2-d4cc7d3703c8",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"e7de50ca-b2f8-752a-b528-db724f2d7054",
								true,
							},
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								false,
							},
							
							{
								"099f59da-08f9-92fa-9fcf-a8dcb6b21ed6",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Fallback Deactivate",
						uuid = "6d4c3c5f-85a6-2c6e-a753-1c1de23016b6",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "e7de50ca-b2f8-752a-b528-db724f2d7054",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4365,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. TMage",
						uuid = "2312ae26-c802-ad39-bbbf-0830ed918dac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.mGetPlayer().alive",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 0.10000000149012,
						name = "Am Alive",
						uuid = "a4bae7f0-15e7-e380-89ed-28e6f8f500ff",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "68842e46-8c8e-f38e-80f1-1c565d84de04",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "36e0cdc9-6f67-832d-af9d-962934e8d8cc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "e27ae646-5033-f9d0-8f32-0bab1ca37b02",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "b89deb6f-ac1d-7569-98b2-ce63b9dc89ac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 4260,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Missing Quick",
						uuid = "b3f3779f-97e1-26c8-aab2-1d54bd11306a",
						version = 3,
					},
					inheritedIndex = 8,
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil and TimeSince(data.ocCombatTimer) > 2000",
						dequeueIfLuaFalse = true,
						name = "Combat > 2s",
						uuid = "7a1b35d4-b11f-bdcc-a54f-314ef5b4f5cb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,35):CanCastResult() ~= 579",
						dequeueIfLuaFalse = true,
						name = "Has Quick",
						uuid = "fdcbe872-f73b-6950-866f-abbc5cd004b9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_CD\"]",
						dequeueIfLuaFalse = true,
						name = "CD Enabled",
						uuid = "1e471142-f907-e1dd-abd5-6325e970db36",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 5,
						buffID = 4260,
						buffIDList = 
						{
							167,
							1211,
							1249,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Has InstaCast",
						uuid = "2c3b763e-60cc-5072-92b9-f8232d3fbcd1",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 41625,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Quick Not CD",
						uuid = "b77c75a7-c8bf-d56b-9d04-5a7f236d29d5",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41625,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Quick CD <= 3s",
						uuid = "0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] == true",
						dequeueIfLuaFalse = true,
						name = "Is Queued",
						uuid = "099f59da-08f9-92fa-9fcf-a8dcb6b21ed6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Quick\")",
						name = "Toggle",
						uuid = "60d03392-f834-a5a4-97c8-50ff6b2bdd06",
						version = 3,
					},
				},
			},
			name = "P. TMage Quick",
			throttleTime = 1500,
			uuid = "1c6bbd54-6018-485a-9f05-9819fa8aa68e",
			version = 2,
		},
		inheritedIndex = 79,
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
						actionID = 41623,
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = false\nself.used = true",
						clusterMinTarget = 0,
						clusterRadius = 10,
						conditions = 
						{
							
							{
								"e7de50ca-b2f8-752a-b528-db724f2d7054",
								true,
							},
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								true,
							},
							
							{
								"b89deb6f-ac1d-7569-98b2-ce63b9dc89ac",
								true,
							},
							
							{
								"066cc251-0be0-1ddd-8963-58a814259fbd",
								true,
							},
							
							{
								"1e471142-f907-e1dd-abd5-6325e970db36",
								false,
							},
							
							{
								"0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
								true,
							},
							
							{
								"df310d5b-5794-9575-9601-ddca08c2fa44",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Stop Comet AOE",
						targetType = "Most Clustered Enemy",
						uuid = "42dbc802-95f2-daac-a984-3091e28fc17b",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionID = 41623,
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = false\nself.used = true",
						clusterMinTarget = 0,
						clusterRadius = 10,
						conditions = 
						{
							
							{
								"e7de50ca-b2f8-752a-b528-db724f2d7054",
								true,
							},
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								true,
							},
							
							{
								"b89deb6f-ac1d-7569-98b2-ce63b9dc89ac",
								true,
							},
							
							{
								"066cc251-0be0-1ddd-8963-58a814259fbd",
								true,
							},
							
							{
								"b3f3779f-97e1-26c8-aab2-1d54bd11306a",
								false,
							},
							
							{
								"0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
								true,
							},
							
							{
								"df310d5b-5794-9575-9601-ddca08c2fa44",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Stop Comet InstaCast",
						targetType = "Most Clustered Enemy",
						uuid = "828f448b-18e5-0f87-8618-de51f8974773",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionID = 41623,
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = true\nself.used = true",
						clusterMinTarget = 0,
						clusterRadius = 10,
						conditions = 
						{
							
							{
								"e7de50ca-b2f8-752a-b528-db724f2d7054",
								true,
							},
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								true,
							},
							
							{
								"b89deb6f-ac1d-7569-98b2-ce63b9dc89ac",
								true,
							},
							
							{
								"066cc251-0be0-1ddd-8963-58a814259fbd",
								true,
							},
							
							{
								"1e471142-f907-e1dd-abd5-6325e970db36",
								true,
							},
							
							{
								"db326cd9-0771-af42-91e9-0687e5bd91f0",
								true,
							},
							
							{
								"fa8dce00-a664-d474-b1e8-0bb60572ebcf",
								true,
							},
							
							{
								"11c4ce1d-1541-1505-9090-f9e8ebef088d",
								true,
							},
							
							{
								"b3f3779f-97e1-26c8-aab2-1d54bd11306a",
								true,
							},
							
							{
								"0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
								true,
							},
							
							{
								"79eb5ff3-df2c-678d-a1a8-a37bc9759ab1",
								true,
							},
							
							{
								"3817f0f4-5ac6-f43c-8ca8-c727d7a0eb5b",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Comet CD Enabled",
						targetType = "Most Clustered Enemy",
						uuid = "b8fb2967-ec8b-3e1a-90c2-d4cc7d3703c8",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionID = 41623,
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = true\nself.used = true",
						clusterMinTarget = 0,
						clusterRadius = 10,
						conditions = 
						{
							
							{
								"e7de50ca-b2f8-752a-b528-db724f2d7054",
								true,
							},
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								true,
							},
							
							{
								"b89deb6f-ac1d-7569-98b2-ce63b9dc89ac",
								true,
							},
							
							{
								"066cc251-0be0-1ddd-8963-58a814259fbd",
								true,
							},
							
							{
								"1e471142-f907-e1dd-abd5-6325e970db36",
								true,
							},
							
							{
								"db326cd9-0771-af42-91e9-0687e5bd91f0",
								false,
							},
							
							{
								"11c4ce1d-1541-1505-9090-f9e8ebef088d",
								true,
							},
							
							{
								"b3f3779f-97e1-26c8-aab2-1d54bd11306a",
								true,
							},
							
							{
								"0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
								true,
							},
							
							{
								"3817f0f4-5ac6-f43c-8ca8-c727d7a0eb5b",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_Hotbar_DutyAction4",
						name = "Comet CD Disabled",
						targetType = "Most Clustered Enemy",
						uuid = "6bdec0fb-35ce-bdc4-8e91-5e73c85f8762",
						variableTogglesType = 2,
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"e7de50ca-b2f8-752a-b528-db724f2d7054",
								true,
							},
							
							{
								"2312ae26-c802-ad39-bbbf-0830ed918dac",
								true,
							},
							
							{
								"e27ae646-5033-f9d0-8f32-0bab1ca37b02",
								false,
							},
							
							{
								"df310d5b-5794-9575-9601-ddca08c2fa44",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Fallback Deactivate",
						uuid = "040e587f-31dc-c22b-a1b5-b83ae8f3d87c",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "e7de50ca-b2f8-752a-b528-db724f2d7054",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4365,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. TMage",
						uuid = "2312ae26-c802-ad39-bbbf-0830ed918dac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "e27ae646-5033-f9d0-8f32-0bab1ca37b02",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "b89deb6f-ac1d-7569-98b2-ce63b9dc89ac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return ActionList:Get(5,32):CanCastResult() ~= 579 or ActionList:Get(5,34):CanCastResult() == 582",
						dequeueIfLuaFalse = true,
						name = "Has Comet",
						uuid = "066cc251-0be0-1ddd-8963-58a814259fbd",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_AOE\"]",
						dequeueIfLuaFalse = true,
						name = "AOE Enabled",
						uuid = "1e471142-f907-e1dd-abd5-6325e970db36",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_CD\"]",
						dequeueIfLuaFalse = true,
						name = "CD Enabled",
						uuid = "db326cd9-0771-af42-91e9-0687e5bd91f0",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.ocCombatTimer ~= nil and TimeSince(data.ocCombatTimer) > 4000",
						dequeueIfLuaFalse = true,
						name = "Combat > 4s",
						uuid = "fa8dce00-a664-d474-b1e8-0bb60572ebcf",
						version = 3,
					},
				},
				
				{
					data = 
					{
						comparator = 2,
						conditionType = 6,
						dequeueIfLuaFalse = true,
						inRangeValue = 28,
						name = "Target <= 28y",
						uuid = "11c4ce1d-1541-1505-9090-f9e8ebef088d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 5,
						buffID = 4260,
						buffIDList = 
						{
							167,
							4260,
							1211,
							1249,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Has InstaCast",
						uuid = "b3f3779f-97e1-26c8-aab2-1d54bd11306a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionID = 41623,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Comet Not CD",
						uuid = "0c8bbab7-4820-17c9-a40c-f1c3e4572b6e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction2\"] == true",
						dequeueIfLuaFalse = true,
						name = "Is Queued",
						uuid = "df310d5b-5794-9575-9601-ddca08c2fa44",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction5\"] == false",
						dequeueIfLuaFalse = true,
						name = "Quick Not Queued",
						uuid = "79eb5ff3-df2c-678d-a1a8-a37bc9759ab1",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Vigilance\")",
						name = "Toggle",
						uuid = "3817f0f4-5ac6-f43c-8ca8-c727d7a0eb5b",
						version = 3,
					},
				},
			},
			name = "P. TMage Comet",
			throttleTime = 100,
			uuid = "9c5b9d73-ae0e-195a-940a-540bca4454b2",
			version = 2,
		},
		inheritedIndex = 80,
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
						actionLua = "data.oraclePredictJudgement = false\ndata.oraclePredictBlessing = false\ndata.oraclePredictCleansing = false\ndata.oraclePredictStarfall = false\ndata.oraclePredictTimer = Now()\nself.used = true",
						conditions = 
						{
							
							{
								"2f5da793-8d62-b900-91b7-d2287c31ad94",
								true,
							},
							
							{
								"689d986b-3892-68da-9d97-7ffdb0c20ed3",
								true,
							},
							
							{
								"19d6b4d2-cb63-d3a0-9701-23ac8a56f8d4",
								true,
							},
							
							{
								"7a9be408-97e3-401a-a51a-b2d1c1da02d1",
								true,
							},
							
							{
								"2a2d8a92-e6f1-b50a-b6a4-0102a46eae94",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_CD",
						name = "Set New Predict",
						uuid = "f2218a47-49cc-308a-8bbe-71548f36c847",
						version = 2.1,
					},
					inheritedIndex = 1,
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "2f5da793-8d62-b900-91b7-d2287c31ad94",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4368,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Oracle",
						uuid = "689d986b-3892-68da-9d97-7ffdb0c20ed3",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4265,
						buffIDList = 
						{
							4265,
							4266,
							4267,
						},
						category = "Self",
						conditionType = 5,
						dequeueIfLuaFalse = true,
						lastSkillID = 41636,
						matchAnyBuff = true,
						name = "Used Predict",
						uuid = "19d6b4d2-cb63-d3a0-9701-23ac8a56f8d4",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 6,
						buffIDList = 
						{
							4265,
							4266,
							4267,
							4268,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "No Predicts",
						uuid = "7a9be408-97e3-401a-a51a-b2d1c1da02d1",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 6,
						buffIDList = 
						{
							4265,
							4266,
							4267,
							4268,
						},
						category = "Lua",
						conditionLua = "return data.oraclePredictTimer == nil or TimeSince(data.oraclePredictTimer) >= 20000",
						dequeueIfLuaFalse = true,
						name = "Current Predict Over",
						uuid = "2a2d8a92-e6f1-b50a-b6a4-0102a46eae94",
						version = 3,
					},
				},
			},
			name = "P. Oracle New Predict",
			uuid = "b175b050-f2bb-2ffe-bd7e-bff2941f8634",
			version = 2,
		},
		inheritedIndex = 81,
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
						actionLua = "if not data.oraclePredictJudgement then\n    if data.oraclePredictCounter == nil then\n        data.oraclePredictCounter = 1\n    else\n        data.oraclePredictCounter = data.oraclePredictCounter + 1\n    end\n\n    data.oraclePredictJudgement = true\n    self.used = true\nend",
						conditions = 
						{
							
							{
								"c98fc8ca-3024-f3e1-b80d-5a6ca8a4846b",
								true,
							},
							
							{
								"689d986b-3892-68da-9d97-7ffdb0c20ed3",
								true,
							},
							
							{
								"da2fea5f-44e3-b375-9f26-908381110868",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_CD",
						name = "Count Judgement",
						uuid = "f2218a47-49cc-308a-8bbe-71548f36c847",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "if not data.oraclePredictCleansing then\n    if data.oraclePredictCounter == nil then\n        data.oraclePredictCounter = 1\n    else\n        data.oraclePredictCounter = data.oraclePredictCounter + 1\n    end\n\n    data.oraclePredictCleansing = true\n    self.used = true\nend",
						conditions = 
						{
							
							{
								"c98fc8ca-3024-f3e1-b80d-5a6ca8a4846b",
								true,
							},
							
							{
								"689d986b-3892-68da-9d97-7ffdb0c20ed3",
								true,
							},
							
							{
								"f9772982-5571-e7ca-8ce8-d0b95106091b",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_CD",
						name = "Count Cleansing",
						uuid = "ecdfcd96-d545-614a-90e9-e8d1b9b60fc9",
						version = 2.1,
					},
					inheritedIndex = 2,
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "if not data.oraclePredictBlessing then\n    if data.oraclePredictCounter == nil then\n        data.oraclePredictCounter = 1\n    else\n        data.oraclePredictCounter = data.oraclePredictCounter + 1\n    end\n\n    data.oraclePredictBlessing = true\n    self.used = true\nend",
						conditions = 
						{
							
							{
								"c98fc8ca-3024-f3e1-b80d-5a6ca8a4846b",
								true,
							},
							
							{
								"689d986b-3892-68da-9d97-7ffdb0c20ed3",
								true,
							},
							
							{
								"ffe9b916-3ab0-da65-92bd-6fc5317d7207",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_CD",
						name = "Count Blessing",
						uuid = "8644771d-e09e-cec0-9719-c9b5718640ef",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "if not data.oraclePredictStarfall then\n    if data.oraclePredictCounter == nil then\n        data.oraclePredictCounter = 1\n    else\n        data.oraclePredictCounter = data.oraclePredictCounter + 1\n    end\n\n    data.oraclePredictStarfall = true\n    self.used = true\nend",
						conditions = 
						{
							
							{
								"c98fc8ca-3024-f3e1-b80d-5a6ca8a4846b",
								true,
							},
							
							{
								"689d986b-3892-68da-9d97-7ffdb0c20ed3",
								true,
							},
							
							{
								"8e665495-c2d2-d8bc-bcd2-4047503e7449",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_RikuRDM3_CD",
						name = "Count Starfall",
						uuid = "212bae4d-09cb-b35f-90ba-98f73e3908bc",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "c98fc8ca-3024-f3e1-b80d-5a6ca8a4846b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4368,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Oracle",
						uuid = "689d986b-3892-68da-9d97-7ffdb0c20ed3",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4268,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Has Starfall",
						uuid = "8e665495-c2d2-d8bc-bcd2-4047503e7449",
						version = 3,
					},
					inheritedIndex = 3,
				},
				
				{
					data = 
					{
						buffID = 4265,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Has Judgement",
						uuid = "da2fea5f-44e3-b375-9f26-908381110868",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4266,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Has Cleansing",
						uuid = "f9772982-5571-e7ca-8ce8-d0b95106091b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4267,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Has Blessing",
						uuid = "ffe9b916-3ab0-da65-92bd-6fc5317d7207",
						version = 3,
					},
				},
			},
			name = "P. Oracle Record Predict Count",
			uuid = "9278be18-034c-9f92-abab-1d3e0055a418",
			version = 2,
		},
		inheritedIndex = 82,
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
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = true\nself.used = true",
						conditions = 
						{
							
							{
								"2ade3bb0-fe6c-ce0d-8fb3-6e7565b3a2e2",
								true,
							},
							
							{
								"ac335586-7de4-5e38-b9da-8495a9efdd41",
								true,
							},
							
							{
								"12a0f8c6-a507-a2e4-9c4a-c1dc0385b35d",
								true,
							},
							
							{
								"20fa62b1-a245-0e9c-af9b-4fabfedcb7b6",
								true,
							},
							
							{
								"5d1b2ae3-f7bd-35b6-8cfc-33cc3f39b9c9",
								true,
							},
							
							{
								"4ad26c8e-1973-b537-836b-8dec4032deef",
								true,
							},
							
							{
								"ef2c81f6-7b6a-3ed2-ac82-95bca89dccb2",
								true,
							},
							
							{
								"adea2d2c-d0b5-b568-9ad7-b74b309a9b6b",
								true,
							},
							
							{
								"6c4525ee-9fd0-41dd-bc57-c766de237b22",
								true,
							},
							
							{
								"f3241bd8-b216-c3e0-8805-e07f3bc8eacb",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Predict",
						uuid = "5072d63a-a97a-96e3-9571-5609b0c0c8aa",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nself.used = true",
						conditions = 
						{
							
							{
								"2ade3bb0-fe6c-ce0d-8fb3-6e7565b3a2e2",
								true,
							},
							
							{
								"ac335586-7de4-5e38-b9da-8495a9efdd41",
								true,
							},
							
							{
								"4ad26c8e-1973-b537-836b-8dec4032deef",
								false,
							},
							
							{
								"5360af84-5d13-5563-bcbe-976e9652e09c",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorMagnum3_CD",
						name = "Fallback Deactivate",
						uuid = "f28ce769-ec22-0f59-b972-92cd768a38ab",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "2ade3bb0-fe6c-ce0d-8fb3-6e7565b3a2e2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4368,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Oracle",
						uuid = "ac335586-7de4-5e38-b9da-8495a9efdd41",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return TensorCore.mGetPlayer().alive",
						conditionType = 2,
						dequeueIfLuaFalse = true,
						hpValue = 0.10000000149012,
						name = "Am Alive",
						uuid = "12a0f8c6-a507-a2e4-9c4a-c1dc0385b35d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "20fa62b1-a245-0e9c-af9b-4fabfedcb7b6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "5d1b2ae3-f7bd-35b6-8cfc-33cc3f39b9c9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 7,
						dequeueIfLuaFalse = true,
						uuid = "4ad26c8e-1973-b537-836b-8dec4032deef",
						version = 3,
					},
				},
				
				{
					data = 
					{
						conditionType = 5,
						dequeueIfLuaFalse = true,
						uuid = "ef2c81f6-7b6a-3ed2-ac82-95bca89dccb2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_CD\"]",
						dequeueIfLuaFalse = true,
						name = "CD Enabled",
						uuid = "adea2d2c-d0b5-b568-9ad7-b74b309a9b6b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 3,
						actionID = 41636,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						name = "Predict CD <= 3s",
						uuid = "6c4525ee-9fd0-41dd-bc57-c766de237b22",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] == true",
						dequeueIfLuaFalse = true,
						name = "Is Queued",
						uuid = "5360af84-5d13-5563-bcbe-976e9652e09c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Predict\")",
						name = "Toggle",
						uuid = "f3241bd8-b216-c3e0-8805-e07f3bc8eacb",
						version = 3,
					},
				},
			},
			enabled = false,
			name = "P. Oracle Use Predict[NOT SAFE]",
			throttleTime = 1500,
			uuid = "4c3d9549-4ff9-6f51-a0a1-292851ddf5a7",
			version = 2,
		},
		inheritedIndex = 83,
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						actionID = 41620,
						conditions = 
						{
							
							{
								"dc067595-2ebe-4625-a548-1a90499d46f1",
								true,
							},
							
							{
								"5c84db7a-5a39-f23e-be46-a4cb18d08ff8",
								true,
							},
							
							{
								"0a49f18a-75ad-dbf1-9ca1-e4c496d8eead",
								true,
							},
							
							{
								"86e868dc-33c3-6f2a-9a8b-1a3eb2fffe94",
								true,
							},
							
							{
								"4d8e016f-b320-19ea-88a8-c12221eb79d2",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_ArmsLength",
						targetType = "Detection Target",
						uuid = "9ec06c4c-b371-6720-973e-2d03f423be2a",
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
						buffID = 4364,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Phantom Geomancer",
						uuid = "dc067595-2ebe-4625-a548-1a90499d46f1",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Levitate\")",
						dequeueIfLuaFalse = true,
						name = "Button Enabled",
						uuid = "5c84db7a-5a39-f23e-be46-a4cb18d08ff8",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Assist Enabled",
						uuid = "0a49f18a-75ad-dbf1-9ca1-e4c496d8eead",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 4258,
						category = "Party",
						name = "Missing Suspend",
						partyTargetType = "Detection Target",
						uuid = "361e2e5c-7107-cff1-ae22-b1b9fdd09481",
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
						partyTargetType = "Detection Target",
						uuid = "4cb72cee-b39d-b031-b616-976f9db6d064",
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
								"361e2e5c-7107-cff1-ae22-b1b9fdd09481",
								true,
							},
							
							{
								"4cb72cee-b39d-b031-b616-976f9db6d064",
								true,
							},
						},
						filterTargetType = "Party",
						name = "Filter",
						uuid = "86e868dc-33c3-6f2a-9a8b-1a3eb2fffe94",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Suspend\")",
						name = "Toggle",
						uuid = "4d8e016f-b320-19ea-88a8-c12221eb79d2",
						version = 3,
					},
				},
			},
			name = "P. Geomancer Levitate Party",
			uuid = "228a73f9-c34a-52ed-8402-2b3ccba1f5c1",
			version = 2,
		},
		inheritedIndex = 84,
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
						actionLua = "if _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] == true then\n\t_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_Hotbar_DutyAction1\"] = false\nend\ndata.oraclePredictCounter = 0\ndata.oraclePredictJudgement = false\ndata.oraclePredictCleansing = false\ndata.oraclePredictBlessing = false\ndata.oraclePredictStarfall = false\nself.used = true",
						conditions = 
						{
							
							{
								"ffbc6bd6-f41a-fea3-a827-6c080a314acc",
								true,
							},
							
							{
								"b7995653-e4e2-e753-91d9-89e71703711c",
								true,
							},
							
							{
								"93783665-3a39-218a-b4c7-05aeb1a3a810",
								true,
							},
							
							{
								"5ad64f50-a902-e2f8-9be5-cd7055460245",
								true,
							},
							
							{
								"198fa4c6-d68a-4051-93d7-325f5ecef315",
								true,
							},
						},
						endIfUsed = true,
						gVar = "ACR_TensorWeeb3_CD",
						name = "Reset Predict",
						uuid = "d3445634-2d11-25bd-a024-2b2201d290bc",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "ffbc6bd6-f41a-fea3-a827-6c080a314acc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4368,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is P. Oracle",
						uuid = "b7995653-e4e2-e753-91d9-89e71703711c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 6,
						buffID = 4265,
						buffIDList = 
						{
							4265,
							4266,
							4267,
							4268,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "No Predicts",
						uuid = "93783665-3a39-218a-b4c7-05aeb1a3a810",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 6,
						buffIDList = 
						{
							4265,
							4266,
							4267,
							4268,
						},
						category = "Lua",
						conditionLua = "return data.oraclePredictCounter ~= nil and data.oraclePredictCounter > 0",
						dequeueIfLuaFalse = true,
						name = "Predict Counter > 0",
						uuid = "5ad64f50-a902-e2f8-9be5-cd7055460245",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffCheckType = 6,
						buffIDList = 
						{
							4265,
							4266,
							4267,
							4268,
						},
						category = "Lua",
						conditionLua = "return TimeSince(data.oraclePredictTimer) >= 20000",
						dequeueIfLuaFalse = true,
						name = "Current Predict Over",
						uuid = "198fa4c6-d68a-4051-93d7-325f5ecef315",
						version = 3,
					},
				},
			},
			name = "P. Oracle Reset Predict",
			uuid = "978328eb-ccac-48cf-bcfc-9c31d4cf6f4d",
			version = 2,
		},
		inheritedIndex = 85,
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
			name = "-- Utility reactions below here --",
			uuid = "dc22849f-d549-0cd1-ae73-c86f4d770c5a",
			version = 2,
		},
		inheritedIndex = 86,
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
			name = "-- Occult Crescent",
			uuid = "7affaeba-16a3-388a-9c7a-193cccdb0287",
			version = 2,
		},
		inheritedIndex = 87,
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
						actionLua = "local token = data.northHornBeastTopazWaveToken or 0\nif data.northHornBeastEarlyFixedWaveToken == token then\n    self.used = true\n    return\nend\n\nlocal timeout = ((eventArgs.duration or 3) + 0.35) * 1000\nlocal uuid = TensorCore.getMoogleDrawer():addTimedCircle(\n    timeout,\n    eventArgs.x,\n    eventArgs.y,\n    eventArgs.z,\n    eventArgs.aoeLength or 4,\n    0,\n    false,\n    false\n)\nif uuid then\n    data.northHornBeastTransientDraws =\n        data.northHornBeastTransientDraws or {}\n    table.insert(data.northHornBeastTransientDraws, uuid)\nend\nself.used = true",
						conditions = 
						{
							
							{
								"32000112-0000-4000-8000-000000000001",
								true,
							},
							
							{
								"32000112-0000-4000-8000-000000000301",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Fallback exact Topaz Ray circle",
						uuid = "32000112-0000-4000-8000-000000000201",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local drawer = TensorCore.getMoogleDrawer()\nlocal duration = eventArgs.duration or 5.7\nlocal firstTimeout = (duration + 0.3) * 1000\nlocal firstUUID = drawer:addTimedCone(\n    firstTimeout,\n    eventArgs.x,\n    eventArgs.y,\n    eventArgs.z,\n    eventArgs.aoeLength or 45,\n    math.pi,\n    eventArgs.heading\n)\nlocal secondUUID = drawer:addTimedCone(\n    3300,\n    eventArgs.x,\n    eventArgs.y,\n    eventArgs.z,\n    eventArgs.aoeLength or 45,\n    math.pi,\n    eventArgs.heading + math.pi,\n    firstTimeout\n)\ndata.northHornBeastTransientDraws =\n    data.northHornBeastTransientDraws or {}\nif firstUUID then\n    table.insert(data.northHornBeastTransientDraws, firstUUID)\nend\nif secondUUID then\n    table.insert(data.northHornBeastTransientDraws, secondUUID)\nend\nd(\"A Beast Unleashed Claw/Tail\")\nself.used = true",
						conditions = 
						{
							
							{
								"32000112-0000-4000-8000-000000000001",
								true,
							},
							
							{
								"32000112-0000-4000-8000-000000000302",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Draw Claw and Tail sequence",
						uuid = "32000112-0000-4000-8000-000000000202",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "Zone",
						uuid = "32000112-0000-4000-8000-000000000001",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.contentID == 14792 and eventArgs.aoeID == 48281\n",
						dequeueIfLuaFalse = true,
						name = "Topaz room contact AOE",
						uuid = "32000112-0000-4000-8000-000000000301",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id = eventArgs.aoeID\nreturn eventArgs.contentID == 14791 and (id == 48294 or id == 48295)\n",
						dequeueIfLuaFalse = true,
						name = "Claw or Tail AOE",
						uuid = "32000112-0000-4000-8000-000000000302",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[A Beast Unleashed] AOE Draws",
			uuid = "32000112-0000-4000-8000-000000000999",
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
						actionLua = "-- Event Type: OnEventObjectScript\n-- External conditions:\n--   Event entity ContentID == 2015276\n--   eventArgs.a2 == 4\n--   eventArgs.a3 == 16 OR eventArgs.a3 == 32\n--   eventArgs.a4 == 0\n-- eventArgs.a3 is 16 for counterclockwise and 32 for clockwise.\n\nlocal ring = TensorCore.mGetEntity(eventArgs.entityID)\nif not ring then\n    self.used = true\n    return\nend\n\nlocal param1 = eventArgs.a2\nlocal param2 = eventArgs.a3\nlocal param3 = eventArgs.a4\n\nlocal isClockwise = param2 == 32\nlocal direction = isClockwise and -1 or 1\n\nlocal arenaCenter = {\n    x = 807,\n    y = ring.pos.y,\n    z = -562,\n}\n\n-- The inner danger sectors are 120 degrees wide. The safe gaps between\n-- the two opposing danger sectors are therefore 60 degrees wide.\nlocal dangerHeading = ring.pos.h\n    + math.rad(120) * direction\n    + math.rad(-60)\nlocal safeHeading = dangerHeading + math.pi / 2\nlocal safeAngle = math.rad(60)\n\nlocal renderFlags = Argus2.RenderFlags.FLAG_RENDER_OVERLAY\nlocal safeDrawer = TensorCore.getCachedDrawer(\n    0x6000FF00,\n    0x6000FF00,\n    0x6000FF00,\n    0xFF00FF00,\n    2,\n    0,\n    renderFlags\n)\n\nsafeDrawer:addTimedDonutCone(\n    10300,\n    arenaCenter.x, arenaCenter.y, arenaCenter.z,\n    5, 12,\n    safeAngle,\n    safeHeading,\n    0,\n    false,\n    true,\n    renderFlags\n)\n\nsafeDrawer:addTimedDonutCone(\n    10300,\n    arenaCenter.x, arenaCenter.y, arenaCenter.z,\n    5, 12,\n    safeAngle,\n    safeHeading + math.pi,\n    0,\n    false,\n    true,\n    renderFlags\n)\n\nself.used = true",
						conditions = 
						{
							
							{
								"390cbbd5-27f2-6dda-9b3a-8d837fbde340",
								true,
							},
							
							{
								"b1914d93-b2a0-9a2f-ab33-f4c9ba95bb8b",
								true,
							},
							
							{
								"5b610aae-cfc4-a3e9-9ff7-0f4b0f777bd9",
								true,
							},
							
							{
								"af8ce7a6-4f02-3fa5-8fe6-60bf31642331",
								true,
							},
							
							{
								"cb71fa4a-cc19-68c4-a56f-53de2df52c31",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Inner Ring",
						uuid = "f874959a-4236-3f8b-ae4a-1eb610241557",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "-- Event Type: OnEventObjectScript\n-- External conditions:\n--   Event entity ContentID == 2015275\n--   eventArgs.a2 == 4\n--   eventArgs.a3 == 16 OR eventArgs.a3 == 32\n--   eventArgs.a4 == 0\n-- eventArgs.a3 is 16 for counterclockwise and 32 for clockwise.\n\nlocal ring = TensorCore.mGetEntity(eventArgs.entityID)\nif not ring then\n    self.used = true\n    return\nend\n\nlocal param1 = eventArgs.a2\nlocal param2 = eventArgs.a3\nlocal param3 = eventArgs.a4\n\nlocal isClockwise = param2 == 32\nlocal direction = isClockwise and -1 or 1\n\nlocal arenaCenter = {\n    x = 807,\n    y = ring.pos.y,\n    z = -562,\n}\n\n-- The outer danger sectors are 135 degrees wide. The safe gaps between\n-- the two opposing danger sectors are therefore 45 degrees wide.\nlocal dangerHeading = ring.pos.h\n    + math.rad(67.5) * direction\n    + math.rad(22.5)\nlocal safeHeading = dangerHeading + math.pi / 2\nlocal safeAngle = math.rad(45)\n\nlocal renderFlags = Argus2.RenderFlags.FLAG_RENDER_OVERLAY\nlocal safeDrawer = TensorCore.getCachedDrawer(\n    0x6000FF00,\n    0x6000FF00,\n    0x6000FF00,\n    0xFF00FF00,\n    2,\n    0,\n    renderFlags\n)\n\nsafeDrawer:addTimedDonutCone(\n    10300,\n    arenaCenter.x, arenaCenter.y, arenaCenter.z,\n    12, 20,\n    safeAngle,\n    safeHeading,\n    0,\n    false,\n    true,\n    renderFlags\n)\n\nsafeDrawer:addTimedDonutCone(\n    10300,\n    arenaCenter.x, arenaCenter.y, arenaCenter.z,\n    12, 20,\n    safeAngle,\n    safeHeading + math.pi,\n    0,\n    false,\n    true,\n    renderFlags\n)\n\nself.used = true",
						conditions = 
						{
							
							{
								"390cbbd5-27f2-6dda-9b3a-8d837fbde340",
								true,
							},
							
							{
								"342519fd-835c-cae6-a30c-6f09252009b5",
								true,
							},
							
							{
								"5b610aae-cfc4-a3e9-9ff7-0f4b0f777bd9",
								true,
							},
							
							{
								"af8ce7a6-4f02-3fa5-8fe6-60bf31642331",
								true,
							},
							
							{
								"cb71fa4a-cc19-68c4-a56f-53de2df52c31",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Outer Ring",
						uuid = "7823fc9e-ce5e-4911-9215-e0118a92e329",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "In North Horn",
						uuid = "390cbbd5-27f2-6dda-9b3a-8d837fbde340",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 2015276,
						name = "Event: Content ID 2015276",
						uuid = "b1914d93-b2a0-9a2f-ab33-f4c9ba95bb8b",
						version = 3,
					},
					inheritedIndex = 2,
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 2015275,
						name = "Event: Content ID 2015275",
						uuid = "342519fd-835c-cae6-a30c-6f09252009b5",
						version = 3,
					},
					inheritedIndex = 3,
				},
				
				{
					data = 
					{
						category = "Event",
						comparator = 3,
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventIntValue = 4,
						name = "Event: a2 == 4",
						uuid = "5b610aae-cfc4-a3e9-9ff7-0f4b0f777bd9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						comparator = 3,
						dequeueIfLuaFalse = true,
						eventArgType = 4,
						name = "Event: a4 == 0",
						uuid = "af8ce7a6-4f02-3fa5-8fe6-60bf31642331",
						version = 3,
					},
					inheritedIndex = 5,
				},
				
				{
					data = 
					{
						category = "Event",
						comparator = 3,
						dequeueIfLuaFalse = true,
						eventArgType = 3,
						eventIntValue = 16,
						name = "Event: a3 == 16",
						uuid = "80fd06a8-8054-6451-b89e-e98522b4a8af",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						comparator = 3,
						eventArgType = 3,
						eventIntValue = 32,
						name = "Event: a3 == 32",
						uuid = "7260f008-2dd5-01d1-9e3a-93a6d1110d3b",
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
								"80fd06a8-8054-6451-b89e-e98522b4a8af",
								true,
							},
							
							{
								"7260f008-2dd5-01d1-9e3a-93a6d1110d3b",
								true,
							},
						},
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "OR Gate: a3 16 or 32",
						partyTargetNumber = 0,
						uuid = "cb71fa4a-cc19-68c4-a56f-53de2df52c31",
						version = 3,
					},
				},
			},
			eventType = 19,
			name = "[AppallingBehavior] Roulette Safe Spot",
			uuid = "315e9ecf-074f-933d-ac0b-6a8add1e9855",
			version = 2,
		},
		inheritedIndex = 89,
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
						actionLua = "local drawer = TensorCore.getMoogleDrawer()\n\ndrawer:addTimedCircleOnEnt(\n    6700,                  -- timeout\n    eventArgs.entityID,    -- entID\n    8,                     -- radius\n    0                      -- delay\n)\n\nself.used = true",
						conditions = 
						{
							
							{
								"356a68a7-956f-740f-b561-432590ec3659",
								true,
							},
							
							{
								"c9746966-6679-c719-a063-989af125d78f",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Draw Circle",
						uuid = "91aa7baa-245c-e0db-8b97-13ae7cdac491",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local drawer = TensorCore.getMoogleDrawer()\n\ndrawer:addTimedCrossOnEnt(\n    8500,                  -- timeout\n    eventArgs.entityID,    -- entID\n    80,                    -- length\n    7                      -- width\n)\n\nself.used = true",
						conditions = 
						{
							
							{
								"2bd3bb20-e032-f136-b424-3dd1c3c554ac",
								true,
							},
							
							{
								"c9746966-6679-c719-a063-989af125d78f",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						name = "Draw Cross",
						uuid = "2c026d19-94c7-dc2e-bc6b-df643fa5f531",
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
						eventEntityContentID = 14515,
						eventEntityID = 14515,
						name = "Ent: Long-dead Explorer",
						uuid = "356a68a7-956f-740f-b561-432590ec3659",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 14514,
						eventEntityID = 14514,
						name = "Ent: Long-dead Pirate",
						uuid = "2bd3bb20-e032-f136-b424-3dd1c3c554ac",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 3,
						name = "Is Visible: true",
						uuid = "c9746966-6679-c719-a063-989af125d78f",
						version = 3,
					},
				},
			},
			eventType = 22,
			name = "[DarkArtistry] Draws",
			uuid = "14fbab9e-c492-5ff4-83fe-0199b05b4660",
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
						actionLua = "local apprentice = TensorCore.mGetEntity(eventArgs.entityID)\nif not apprentice or not apprentice.id or not apprentice.pos or apprentice.pos.h == nil then return end\n\nlocal drawer = TensorCore.getMoogleDrawer()\nif not drawer then return end\n\n-- Arcane Aggregation faces directly toward the fourth and final apprentice.\n-- Resolve that endpoint immediately instead of waiting for the Recharge handoffs.\nlocal expectedX = apprentice.pos.x - math.sin(apprentice.pos.h) * 14.15\nlocal expectedZ = apprentice.pos.z + math.cos(apprentice.pos.h) * 14.15\nlocal finalApprentice\nlocal bestDistance\nfor _, candidate in pairs(TensorCore.entityList(\"contentid=14796,maxdistance=50\") or {}) do\n    if candidate.id ~= apprentice.id and candidate.pos then\n        local dx = candidate.pos.x - expectedX\n        local dz = candidate.pos.z - expectedZ\n        local distance = (dx * dx) + (dz * dz)\n        if not bestDistance or distance < bestDistance then\n            bestDistance = distance\n            finalApprentice = candidate\n        end\n    end\nend\nif not finalApprentice or not bestDistance or bestDistance > 4 then return end\n\nif eventArgs.spellID == 48307 then\n    drawer:addTimedCircleOnEnt(16200, finalApprentice.id, 18)\n    d(\"Tiny Mage final passed Flare Sphere\")\nelseif eventArgs.spellID == 48308 then\n    local player = TensorCore.mGetPlayer()\n    if not player or not player.id then return end\n\n    -- Mark the future Holy/blue knockback origin and track the exact 15y push.\n    local blue = TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(0.15, 0.55, 1.0, 0.9))\n    if blue then\n        blue:addTimedCircleOnEnt(16200, finalApprentice.id, 2, 0, false, true)\n    end\n    drawer:addTimedArrowOnEnt(16200, player.id, 12, 0.7, 3, 2.2, finalApprentice.id, 0, false, math.pi, false)\n    d(\"Tiny Mage final passed Holy Sphere\")\nelse\n    return\nend\nself.used = true",
						conditions = 
						{
							
							{
								"63407fab-d304-cbcb-b68d-7b0eb5f3e085",
								true,
							},
							
							{
								"223c95d7-038c-5224-bdff-6a513dc8391c",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Pre-draw final handoff apprentice",
						uuid = "f155aac7-a68f-d3fe-96dc-10a29dc65ee0",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "63407fab-d304-cbcb-b68d-7b0eb5f3e085",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.entityContentID == 14796 and (eventArgs.spellID == 48307 or eventArgs.spellID == 48308)",
						dequeueIfLuaFalse = true,
						name = "Tiny Apprentice sphere setup",
						uuid = "223c95d7-038c-5224-bdff-6a513dc8391c",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Tiny Terror] Apprentice Spheres",
			uuid = "25c8d4d1-446b-e6d9-a178-b52c6f84fe8b",
			version = 3,
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
						actionLua = "local now = Now()\nif data.northHornQuarriedScanNext and now < data.northHornQuarriedScanNext then\n\tself.used = true\n\treturn\nend\ndata.northHornQuarriedScanNext = now + 100\n\nlocal predictions = data.northHornQuarriedGolemPredictions or {}\ndata.northHornQuarriedGolemPredictions = predictions\n\nlocal bosses = TensorCore.entityList(\"contentid=14509,maxdistance=80\")\nif not table.valid(bosses) then\n\tfor entityID, prediction in pairs(predictions) do\n\t\tfor _, uuid in ipairs(prediction.draws or {}) do\n\t\t\tif uuid then Argus.deleteTimedShape(uuid) end\n\t\tend\n\t\tpredictions[entityID] = nil\n\tend\n\tdata.northHornQuarriedSeenAOEs = {}\n\tself.used = true\n\treturn\nend\n\nlocal drawer = TensorCore.getMoogleDrawer()\nif not drawer then return end\n\n-- Visibility fixes the first cone before its AOE exists. Helper model 20157\n-- exposes aura 2843/2844/2845/2846 for three/two/one/zero left turns.\nlocal visible = data.northHornQuarriedVisibleScratch or {}\ndata.northHornQuarriedVisibleScratch = visible\nfor entityID in pairs(visible) do visible[entityID] = nil end\n\nfor _, golem in pairs(TensorCore.entityList(\"contentid=14510,maxdistance=80\") or {}) do\n\tif golem.id and golem.pos and golem.pos.h ~= nil and Argus.isEntityVisible(golem) then\n\t\tvisible[golem.id] = true\n\t\tif not predictions[golem.id] then\n\t\t\tlocal uuid = drawer:addTimedCone(13400, golem.pos.x, golem.pos.y + 0.02,\n\t\t\t\tgolem.pos.z, 40, math.pi / 2, golem.pos.h)\n\t\t\tpredictions[golem.id] = {\n\t\t\t\tdraws = { uuid },\n\t\t\t\tfutureDraws = {},\n\t\t\t\tfutureHeadings = {},\n\t\t\t\tx = golem.pos.x,\n\t\t\t\ty = golem.pos.y + 0.02,\n\t\t\t\tz = golem.pos.z,\n\t\t\t\theading = golem.pos.h,\n\t\t\t\tfirstEndAt = now + 13400,\n\t\t\t\tfollowSeen = 0,\n\t\t\t}\n\t\tend\n\tend\nend\nfor entityID, prediction in pairs(predictions) do\n\tif not visible[entityID] then\n\t\tfor _, uuid in ipairs(prediction.draws or {}) do\n\t\t\tif uuid then Argus.deleteTimedShape(uuid) end\n\t\tend\n\t\tpredictions[entityID] = nil\n\tend\nend\n\nfor _, arrow in pairs(TensorCore.entityList(\"contentid=108,maxdistance=80\") or {}) do\n\tif arrow.id and Argus.getEntityModel(arrow) == 20157 then\n\t\tlocal persistentAura, activeAura1, activeAura2 = Argus.getEntityAuras(arrow)\n\t\tlocal turnAura = activeAura1\n\t\tif not turnAura or turnAura < 2843 or turnAura > 2846 then\n\t\t\tturnAura = activeAura2\n\t\tend\n\t\tif not turnAura or turnAura < 2843 or turnAura > 2846 then\n\t\t\tturnAura = persistentAura\n\t\tend\n\t\tif not turnAura or turnAura < 2843 or turnAura > 2846 then\n\t\t\tturnAura = nil\n\t\tend\n\t\tif turnAura then\n\t\t\tlocal golem = TensorCore.mGetEntity(arrow.id + 1)\n\t\t\tlocal prediction = golem and predictions[golem.id]\n\t\t\tif prediction and prediction.turnAura ~= turnAura then\n\t\t\t\tfor _, uuid in ipairs(prediction.futureDraws or {}) do\n\t\t\t\t\tif uuid then Argus.deleteTimedShape(uuid) end\n\t\t\t\tend\n\t\t\t\tprediction.futureDraws = {}\n\t\t\t\tprediction.futureHeadings = {}\n\t\t\t\tprediction.followSeen = 0\n\t\t\t\tprediction.turnAura = turnAura\n\t\t\t\tprediction.heading = golem.pos.h\n\t\t\t\tlocal turns = math.max(0, math.min(3, 2846 - turnAura))\n\t\t\t\tlocal firstEndAt = prediction.firstEndAt or (now + 10400)\n\t\t\t\tlocal startOffsets = { 0, 8350, 15900 }\n\t\t\t\tlocal durations = { 8350, 7550, 7550 }\n\t\t\t\tfor index = 1, 3 do\n\t\t\t\t\tlocal heading = prediction.heading\n\t\t\t\t\t\t- (math.min(index, turns) * (math.pi / 2))\n\t\t\t\t\tprediction.futureHeadings[index] = heading\n\n\t\t\t\t\tlocal startAt = firstEndAt + startOffsets[index]\n\t\t\t\t\tlocal endAt = startAt + durations[index]\n\t\t\t\t\tif endAt > now then\n\t\t\t\t\t\tlocal delay = math.max(0, startAt - now)\n\t\t\t\t\t\tlocal timeout = endAt - math.max(now, startAt)\n\t\t\t\t\t\tlocal uuid = drawer:addTimedCone(timeout,\n\t\t\t\t\t\t\tprediction.x, prediction.y, prediction.z, 40,\n\t\t\t\t\t\t\tmath.pi / 2, heading, delay)\n\t\t\t\t\t\tprediction.futureDraws[index] = uuid\n\t\t\t\t\t\tprediction.draws[#prediction.draws + 1] = uuid\n\t\t\t\t\tend\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\tend\nend\n\nlocal seenAOEs = data.northHornQuarriedSeenAOEs or {}\ndata.northHornQuarriedSeenAOEs = seenAOEs\nfor _, aoe in ipairs(Argus.getCurrentAOEs() or {}) do\n\tlocal id = aoe.aoeID\n\tlocal isGolem = aoe.contentID == 14510 and (id == 47157 or id == 47158)\n\tlocal isCombination = aoe.contentID == 14509 and (id == 47166 or id == 47167)\n\tif (isGolem or isCombination) and aoe.x and aoe.y and aoe.z and aoe.heading ~= nil then\n\t\tlocal key = string.format(\"%s:%s:%.2f:%.2f:%.3f:%s\",\n\t\t\taoe.entityID or 0, id, aoe.x, aoe.z, aoe.heading, aoe.startTime or 0)\n\t\tif not seenAOEs[key] then\n\t\t\tseenAOEs[key] = now\n\t\t\tlocal duration = aoe.duration or (id == 47157 and 11.7 or 2.7)\n\t\t\tif isCombination then\n\t\t\t\tduration = aoe.duration or 4.7\n\t\t\t\tdrawer:addTimedCone((duration + 0.3) * 1000, aoe.x, aoe.y, aoe.z,\n\t\t\t\t\taoe.aoeLength or 40, math.pi, aoe.heading)\n\t\t\t\tdrawer:addTimedCone(2500, aoe.x, aoe.y, aoe.z,\n\t\t\t\t\taoe.aoeLength or 40, math.pi, aoe.heading + math.pi, duration * 1000)\n\t\t\t\td(\"Quarried Away Left/Right Combination\")\n\t\t\telseif id == 47157 then\n\t\t\t\tlocal prediction = predictions[aoe.entityID]\n\t\t\t\tlocal samePrediction = prediction\n\t\t\t\t\tand math.abs(prediction.x - aoe.x) < 0.5\n\t\t\t\t\tand math.abs(prediction.z - aoe.z) < 0.5\n\t\t\t\t\tand math.abs(math.atan2(math.sin(prediction.heading - aoe.heading), math.cos(prediction.heading - aoe.heading))) < 0.05\n\t\t\t\tif not samePrediction then\n\t\t\t\t\tif prediction then\n\t\t\t\t\t\tfor _, uuid in ipairs(prediction.draws or {}) do\n\t\t\t\t\t\t\tif uuid then Argus.deleteTimedShape(uuid) end\n\t\t\t\t\t\tend\n\t\t\t\t\tend\n\t\t\t\t\tlocal firstTimeout = (duration + 0.3) * 1000\n\t\t\t\t\tlocal uuid = drawer:addTimedCone(firstTimeout,\n\t\t\t\t\t\taoe.x, aoe.y, aoe.z, aoe.aoeLength or 40, math.pi / 2, aoe.heading)\n\t\t\t\t\tpredictions[aoe.entityID] = {\n\t\t\t\t\t\tdraws = { uuid },\n\t\t\t\t\t\tfutureDraws = {},\n\t\t\t\t\t\tfutureHeadings = {},\n\t\t\t\t\t\tx = aoe.x,\n\t\t\t\t\t\ty = aoe.y,\n\t\t\t\t\t\tz = aoe.z,\n\t\t\t\t\t\theading = aoe.heading,\n\t\t\t\t\t\tfirstEndAt = now + firstTimeout,\n\t\t\t\t\t\tfollowSeen = 0,\n\t\t\t\t\t}\n\t\t\t\tend\n\t\t\telse\n\t\t\t\tlocal prediction = predictions[aoe.entityID]\n\t\t\t\tlocal followIndex = prediction and ((prediction.followSeen or 0) + 1)\n\t\t\t\tlocal expected = followIndex and prediction.futureHeadings[followIndex]\n\t\t\t\tlocal samePrediction = expected\n\t\t\t\t\tand math.abs(math.atan2(math.sin(expected - aoe.heading), math.cos(expected - aoe.heading))) < 0.05\n\t\t\t\tif prediction then prediction.followSeen = followIndex end\n\t\t\t\tif not samePrediction then\n\t\t\t\t\tlocal wrong = prediction and prediction.futureDraws[followIndex]\n\t\t\t\t\tif wrong then Argus.deleteTimedShape(wrong) end\n\t\t\t\t\tdrawer:addTimedCone((duration + 0.3) * 1000,\n\t\t\t\t\t\taoe.x, aoe.y, aoe.z, aoe.aoeLength or 40,\n\t\t\t\t\t\tmath.pi / 2, aoe.heading)\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\tend\nend\n\nfor key, lastSeen in pairs(seenAOEs) do\n\tif now - lastSeen > 20000 then seenAOEs[key] = nil end\nend\nself.used = true",
						conditions = 
						{
							
							{
								"32000026-0000-4000-8000-000000000001",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Scan Quarried Away mechanics",
						uuid = "32000026-0000-4000-8000-000000000101",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn zone",
						uuid = "32000026-0000-4000-8000-000000000001",
						version = 3,
					},
				},
			},
			eventType = 12,
			name = "[Quarried Away] Draws",
			throttleTime = 100,
			uuid = "c5f4f5bb-2ed9-59b0-b7b5-11a50aeb7af0",
			version = 2,
		},
		inheritedIndex = 92,
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
						actionLua = "local entityID = eventArgs.entityID\ndata.northHornAbductorPlumes = data.northHornAbductorPlumes or {}\n\nlocal old = data.northHornAbductorPlumes[entityID]\nif old then\n\tArgus.deleteTimedShape(old)\n\tdata.northHornAbductorPlumes[entityID] = nil\nend\n\n-- Splinter resolves 7.4-7.6s after the plume appears.  Visibility gives the\n-- plume's real entity ID and position roughly three seconds before its cast.\nif eventArgs.wasVisible == false then\n\tlocal drawer = TensorCore.getMoogleDrawer()\n\tif not drawer then return end\n\tdata.northHornAbductorPlumes[entityID] = drawer:addTimedCircleOnEnt(7800, entityID, 13)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"32000042-0000-4000-8000-000000000001",
								true,
							},
							
							{
								"32000042-0000-4000-8000-000000000151",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Draw plume circle on appearance",
						uuid = "32000042-0000-4000-8000-000000000201",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "32000042-0000-4000-8000-000000000001",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.entityContentID == 14507",
						dequeueIfLuaFalse = true,
						name = "Abductor's Plume visibility",
						uuid = "32000042-0000-4000-8000-000000000151",
						version = 3,
					},
				},
			},
			eventType = 22,
			name = "[Lost on the Wind] Abductor - Plumes",
			uuid = "d11651c2-77ca-a156-8136-388eeea52a44",
			version = 2,
		},
		inheritedIndex = 93,
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
						actionLua = "local aoePos = {x = eventArgs.x, y = eventArgs.y, z = eventArgs.z}\nlocal aoeHeading = eventArgs.heading\nlocal aoeAngle = 60\n\nlocal dirX, dirZ = math.sin(aoeHeading), math.cos(aoeHeading)\nlocal cosAngle = math.cos(math.rad(aoeAngle/2))\n\nlocal isDoubleCast = eventArgs.duration > 5\n\nfor _, entity in pairs(TensorCore.entityList(\"contentid=13651\")) do\n\tlocal entityPos = entity.pos\n\tlocal relX, relZ = entityPos.x - aoePos.x, entityPos.z - aoePos.z\n\tlocal forward = (relX * dirX) + (relZ * dirZ)\n\tlocal distToAOE = TensorCore.getDistance2d(aoePos, entityPos)\n\tif (forward / distToAOE) >= cosAngle then\n\t\tlocal drawDelay = (isDoubleCast and 7000) or 0\n\t\tlocal orbExplosionDelay = 2500\n\t\tTensorCore.getMoogleDrawer():addTimedCircleOnEnt((eventArgs.duration*1000)+orbExplosionDelay-drawDelay,entity.id,15,drawDelay)\n\tend\nend\nself.used = true",
						conditions = 
						{
							
							{
								"a21dd969-932e-6398-8760-438fd6c6737d",
								true,
							},
							
							{
								"84173e32-97e2-9885-bf35-7bc51c1c6c91",
								true,
							},
						},
						gVar = "ACR_TensorWeeb3_CD",
						name = "Wind Orb",
						uuid = "a1d006ec-9474-4c7c-8b0d-a34f4c004099",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local aoePos = {x = eventArgs.x, y = eventArgs.y, z = eventArgs.z}\nlocal aoeHeading = eventArgs.heading\nlocal aoeAngle = 60\n\nlocal dirX, dirZ = math.sin(aoeHeading), math.cos(aoeHeading)\nlocal cosAngle = math.cos(math.rad(aoeAngle/2))\n\nlocal isDoubleCast = eventArgs.duration > 5\n\nfor _, entity in pairs(TensorCore.entityList(\"contentid=13652\")) do\n\tlocal entityPos = entity.pos\n\tlocal relX, relZ = entityPos.x - aoePos.x, entityPos.z - aoePos.z\n\tlocal forward = (relX * dirX) + (relZ * dirZ)\n\tlocal distToAOE = TensorCore.getDistance2d(aoePos, entityPos)\n\tif (forward / distToAOE) >= cosAngle then\n\t\tlocal drawDelay = (isDoubleCast and 7000) or 0\n\t\tlocal orbExplosionDelay = 2500\n\t\tTensorCore.getMoogleDrawer():addTimedCircleOnEnt((eventArgs.duration*1000)+orbExplosionDelay-drawDelay,entity.id,15,drawDelay)\n\tend\nend\nself.used = true",
						conditions = 
						{
							
							{
								"a21dd969-932e-6398-8760-438fd6c6737d",
								true,
							},
							
							{
								"2015fdfa-2327-1a4f-b24c-255145965531",
								true,
							},
						},
						gVar = "ACR_TensorWeeb3_CD",
						name = "Earth Orb",
						uuid = "8b88c007-2f89-e57d-9b54-d424d2c3316e",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						name = "In OC",
						uuid = "a21dd969-932e-6398-8760-438fd6c6737d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeName == \"Ancient Aero III\"",
						dequeueIfLuaFalse = true,
						name = "Is Wind",
						uuid = "84173e32-97e2-9885-bf35-7bc51c1c6c91",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeName == \"Ancient Stone III\"",
						dequeueIfLuaFalse = true,
						name = "Is Earth",
						uuid = "2015fdfa-2327-1a4f-b24c-255145965531",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[RepairedLion] Orb AoE",
			uuid = "063b86b6-c420-08c8-b4d6-9f5efd9b1e6a",
			version = 2,
		},
		inheritedIndex = 94,
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
						actionLua = "data.ocGarulaRushingRumbleRampage = true\nself.used=true",
						conditions = 
						{
							
							{
								"3d713919-4904-c97e-bb72-5fba1cc7d8d1",
								true,
							},
							
							{
								"831587ec-aa31-c05d-9716-7138cd1f2de9",
								true,
							},
							
							{
								"31ab17ca-1766-b858-8c32-5e1ede7eab12",
								true,
							},
						},
						gVar = "ACR_TensorWeeb3_CD",
						name = "Record Rushing Rumble Rampage",
						uuid = "cfc2248e-d420-e105-be82-c70775882def",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local pi = math.pi\nlocal back = pi\nlocal left = pi / 2\nlocal right = -pi / 2\n\nlocal coneAngle = 45\nlocal coneRad = coneAngle * (pi / 180)\nlocal coneLength = 70\nlocal circleRadius = 30\nlocal birdHitRadius = 6\n\nlocal drawDuration = 10000\n\nlocal function normalizeHeading(heading)\n    return ((heading + pi) % (2 * pi)) - pi\nend\n\nlocal neoGarulaPos\nfor _, foundEntity in pairs(TensorCore.entityList(\"contentid=13638,attackable\")) do\n\tneoGarulaPos = foundEntity.pos\n\tbreak\nend\n\nlocal chatterbirdEnt = TensorCore.mGetEntity(data.ocGarulaMarkerBirdEntID)\nlocal chatterbirdPos = chatterbirdEnt.pos\n\nlocal garulaEndPoint = TensorCore.getPosInDirection(chatterbirdPos, chatterbirdPos.h, birdHitRadius)\ndata.ocGarulaPrevEndPoint = garulaEndPoint\n\nlocal garulaToEndPointHeading = TensorCore.getHeadingToTarget(neoGarulaPos, garulaEndPoint)\n\nlocal directionOffsets = { 0, pi, pi / 2, -pi / 2 }\nif data.ocGarulaIntercardLightning then\n    for i = 1, #directionOffsets do\n        directionOffsets[i] = directionOffsets[i] - (pi / 4)\n    end\nend\n\nlocal moogleDrawer = TensorCore.getMoogleDrawer()\nfor _, offset in ipairs(directionOffsets) do\n    local coneHeading = normalizeHeading(garulaToEndPointHeading + offset)\n    moogleDrawer:addTimedCone(drawDuration, garulaEndPoint.x, garulaEndPoint.y, garulaEndPoint.z, coneLength, coneRad, coneHeading)\nend\nmoogleDrawer:addTimedCircle(drawDuration,garulaEndPoint.x,garulaEndPoint.y,garulaEndPoint.z,circleRadius)\n\ndata.ocGarulaChargeCount = 1\n\nself.used=true",
						conditions = 
						{
							
							{
								"3d713919-4904-c97e-bb72-5fba1cc7d8d1",
								true,
							},
							
							{
								"831587ec-aa31-c05d-9716-7138cd1f2de9",
								true,
							},
							
							{
								"a1b5af49-de07-7460-9a69-50545e276d84",
								true,
							},
						},
						gVar = "ACR_TensorWeeb3_CD",
						name = "Draw AOE Charge 1",
						uuid = "c4f1f772-3f43-ca0d-9b65-950c281fa28c",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						name = "In OC",
						uuid = "3d713919-4904-c97e-bb72-5fba1cc7d8d1",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 13638,
						name = "Is Neo Garula",
						uuid = "831587ec-aa31-c05d-9716-7138cd1f2de9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 3,
						eventArgType = 2,
						eventMarkerID = 578,
						name = "Is Rushing Rumble (Rampage)",
						spellIDList = 
						{
							41175,
							41177,
						},
						uuid = "a1b5af49-de07-7460-9a69-50545e276d84",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventMarkerID = 578,
						eventSpellID = 41177,
						name = "Is Rushing Rumble Rampage",
						spellIDList = 
						{
							41175,
							41177,
						},
						uuid = "31ab17ca-1766-b858-8c32-5e1ede7eab12",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[NeoGarula] Rushing Rumble Cast",
			throttleTime = 250,
			uuid = "9221989a-79a6-6bde-834c-88fc67082d1c",
			version = 2,
		},
		inheritedIndex = 95,
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
						actionLua = "local sphere = TensorCore.mGetEntity(eventArgs.sourceEntityID)\nlocal target = TensorCore.mGetEntity(eventArgs.newTargetID)\nif not sphere or not sphere.id or not sphere.pos or not target or not target.id or not target.pos then return end\n\nlocal contentID = tonumber(eventArgs.sourceEntityContentID) or sphere.contentid\nif contentID ~= 14797 and contentID ~= 14798 then return end\n\nlocal now = Now()\nlocal state = data.northHornTinyPairTethers\nif not state or not state.lastSeen or now < state.lastSeen or now - state.lastSeen > 2000 then\n    state = { lastSeen = now, pairs = {}, seen = {}, drawn = false }\n    data.northHornTinyPairTethers = state\nend\nstate.lastSeen = now\n\n-- Ignore repeated notifications for the same tether and late callbacks after\n-- this set has already been rendered.\nif state.drawn then\n    self.used = true\n    return\nend\nlocal low = math.min(sphere.id, target.id)\nlocal high = math.max(sphere.id, target.id)\nlocal key = tostring(low) .. \":\" .. tostring(high)\nif state.seen[key] then\n    self.used = true\n    return\nend\nstate.seen[key] = true\n\nlocal dx = sphere.pos.x - target.pos.x\nlocal dz = sphere.pos.z - target.pos.z\ntable.insert(state.pairs, {\n    contentID = contentID,\n    x = (sphere.pos.x + target.pos.x) / 2,\n    y = (sphere.pos.y + target.pos.y) / 2 + 0.02,\n    z = (sphere.pos.z + target.pos.z) / 2,\n    distanceSquared = (dx * dx) + (dz * dz)\n})\n\n-- The four exact collision points are known now. They resolve shortest pair\n-- first, beginning 9.1s later and then every 3s.\nif #state.pairs < 4 then\n    self.used = true\n    return\nend\ntable.sort(state.pairs, function(a, b)\n    return a.distanceSquared < b.distanceSquared\nend)\n\nlocal drawer = TensorCore.getMoogleDrawer()\nlocal blue = TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(0.15, 0.55, 1.0, 0.9))\nif not drawer or not blue then return end\n\nfor index, pair in ipairs(state.pairs) do\n    local lifetime = 9350 + ((index - 1) * 3000)\n    if pair.contentID == 14797 then\n        -- Show the complete 18y fire PB immediately, through its explosion.\n        drawer:addTimedCircle(lifetime, pair.x, pair.y, pair.z, 18, 0, false, false)\n    else\n        -- Cyan is the future Holy/blue knockback origin, not a safe spot.\n        blue:addTimedCircle(lifetime, pair.x, pair.y, pair.z, 2, 0, false, true)\n    end\nend\n\nstate.drawn = true\nd(\"Tiny Mage paired sphere landing points pre-drawn\")\nself.used = true",
						conditions = 
						{
							
							{
								"07ab1579-78b7-2c69-9b7d-971d443296b5",
								true,
							},
							
							{
								"90617d0a-87ff-4651-88ab-4fb6ec78b176",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Draw paired sphere result",
						uuid = "593f266e-e35c-7aeb-a08e-7d335ce47dd9",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "07ab1579-78b7-2c69-9b7d-971d443296b5",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local e=TensorCore.mGetEntity(eventArgs.sourceEntityID) return eventArgs.newTetherID == 415 and e and (e.contentid == 14797 or e.contentid == 14798)",
						dequeueIfLuaFalse = true,
						name = "Active paired sphere tether",
						uuid = "90617d0a-87ff-4651-88ab-4fb6ec78b176",
						version = 3,
					},
				},
			},
			eventType = 15,
			name = "[Tiny Terror] Paired Spheres",
			uuid = "b865ed57-a56a-d906-bbac-138706f67f9e",
			version = 4,
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
						actionLua = "local now = Now()\nif data.northHornTinyCometScanNext and now < data.northHornTinyCometScanNext then\n\tself.used = true\n\treturn\nend\ndata.northHornTinyCometScanNext = now + 200\n\nlocal points = {}\nlocal apprentices = TensorCore.entityList(\"contentid=14796,alive\")\nif table.valid(apprentices) then\n\tfor _, apprentice in pairs(apprentices) do\n\t\tif apprentice.pos and Argus.isEntityVisible(apprentice) then\n\t\t\tpoints[#points + 1] = apprentice.pos\n\t\tend\n\tend\nend\n\nif #points ~= 9 then\n\tfor _, label in pairs(data.northHornTinyCometPrelabels or {}) do\n\t\tAnyoneCore.removeTimedWorldText(label.uuid)\n\tend\n\tdata.northHornTinyCometPrelabels = nil\n\tif #points == 0 or (data.northHornTinyCometDone and now - data.northHornTinyCometDone > 70000) then\n\t\tdata.northHornTinyCometDone = nil\n\tend\n\tself.used = true\n\treturn\nend\nif data.northHornTinyCometPrelabels or data.northHornTinyCometDone then\n\tself.used = true\n\treturn\nend\n\nlocal groups = {}\nwhile #points > 0 do\n\tlocal group = { table.remove(points) }\n\tlocal i = 1\n\twhile i <= #group do\n\t\tlocal point = group[i]\n\t\tfor j = #points, 1, -1 do\n\t\t\tlocal other = points[j]\n\t\t\tlocal dx, dz = point.x - other.x, point.z - other.z\n\t\t\tif dx * dx + dz * dz <= 81 then\n\t\t\t\tgroup[#group + 1] = table.remove(points, j)\n\t\t\tend\n\t\tend\n\t\ti = i + 1\n\tend\n\tgroups[#groups + 1] = group\nend\n\nlocal order = {\n\t[4] = { \"1 - KILL FIRST\", GUI:ColorConvertFloat4ToU32(1.0, 0.25, 0.2, 1.0) },\n\t[3] = { \"2 - KILL SECOND\", GUI:ColorConvertFloat4ToU32(1.0, 0.8, 0.2, 1.0) },\n\t[2] = { \"3 - KILL LAST\", GUI:ColorConvertFloat4ToU32(0.75, 0.85, 1.0, 1.0) },\n}\nif #groups ~= 3 then\n\tself.used = true\n\treturn\nend\nfor _, group in ipairs(groups) do\n\tif not order[#group] then\n\t\tself.used = true\n\t\treturn\n\tend\nend\n\nlocal labels = {}\nfor _, group in ipairs(groups) do\n\tlocal x, y, z = 0, 0, 0\n\tfor _, point in ipairs(group) do\n\t\tx, y, z = x + point.x, y + point.y, z + point.z\n\tend\n\tlocal size = #group\n\tlocal info = order[size]\n\tlocal pos = { x = x / size, y = y / size + 2.5, z = z / size }\n\tlabels[size] = {\n\t\tuuid = AnyoneCore.addTimedWorldText(65000, info[1], pos, info[2], true, 1.5),\n\t\ttext = info[1],\n\t\tcolor = info[2],\n\t\tpos = pos,\n\t}\nend\ndata.northHornTinyCometPrelabels = labels\nd(\"Tiny Terror early comet order\")\nself.used = true\n",
						conditions = 
						{
							
							{
								"32000047-0000-4000-8000-000000000001",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Pre-place comet kill order",
						uuid = "32000047-0000-4000-8000-000000000201",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local labels = data.northHornTinyCometPrelabels\nif not labels then\n\tself.used = true\n\treturn\nend\n\nlocal now = Now()\nif data.northHornTinySphereScanNext and now < data.northHornTinySphereScanNext then\n\tself.used = true\n\treturn\nend\ndata.northHornTinySphereScanNext = now + 200\n\nlocal spheres = {}\nlocal found = TensorCore.entityList(\"contentid=14800,alive\")\nif table.valid(found) then\n\tfor _, sphere in pairs(found) do\n\t\tif sphere.pos and Argus.isEntityVisible(sphere) then spheres[#spheres + 1] = sphere end\n\tend\nend\nif #spheres ~= 3 then\n\tself.used = true\n\treturn\nend\n\nlocal used = {}\nfor _, label in pairs(labels) do\n\tlocal best, distance = nil, math.huge\n\tfor _, sphere in ipairs(spheres) do\n\t\tif not used[sphere.id] then\n\t\t\tlocal dx, dz = label.pos.x - sphere.pos.x, label.pos.z - sphere.pos.z\n\t\t\tlocal d = dx * dx + dz * dz\n\t\t\tif d < distance then best, distance = sphere, d end\n\t\tend\n\tend\n\tused[best.id] = true\n\tAnyoneCore.removeTimedWorldText(label.uuid)\n\tAnyoneCore.addTimedWorldTextOnEnt(58750, label.text, best.id, label.color, true, 1.5, 2.5)\nend\n\ndata.northHornTinyCometPrelabels = nil\ndata.northHornTinyCometDone = now\nd(\"Tiny Terror comet kill order\")\n-- Keep Moogle 48327: the labels complement its Comet AOE.\nself.used = true\n",
						conditions = 
						{
							
							{
								"32000047-0000-4000-8000-000000000001",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Attach comet kill order",
						uuid = "32000047-0000-4000-8000-000000000202",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "32000047-0000-4000-8000-000000000001",
						version = 3,
					},
				},
			},
			eventType = 12,
			name = "[Tiny Terror] Comet Kill Order",
			uuid = "db975c9e-7808-7edf-8b6a-c4d9917311f3",
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
						actionLua = "local dash = TensorCore.mGetEntity(eventArgs.entityID)\nif not dash or not dash.pos or dash.pos.h == nil then return end\n\nlocal finish = TensorCore.getPosInDirection(dash.pos, dash.pos.h, 40)\nif not finish then return end\n\nlocal drawer = TensorCore.getMoogleDrawer()\nif not drawer then return end\n\nlocal vx = finish.x - dash.pos.x\nlocal vz = finish.z - dash.pos.z\nlocal lengthSquared = (vx * vx) + (vz * vz)\nif lengthSquared <= 0 then return end\nlocal timeout = ((eventArgs.channelTimeMax or 6.7) + 1.8) * 1000\nlocal hazes = TensorCore.entityList('contentid=14788')\nif not table.valid(hazes) then return end\n\nd('Claret Dragon Soar lines')\nfor _, haze in pairs(hazes) do\n\tif haze and haze.pos and haze.pos.h ~= nil and Argus.isEntityVisible(haze) then\n\t\tlocal wx = haze.pos.x - dash.pos.x\n\t\tlocal wz = haze.pos.z - dash.pos.z\n\t\tlocal along = ((wx * vx) + (wz * vz)) / lengthSquared\n\t\tif along >= 0 and along <= 1 then\n\t\t\tlocal nearestX = dash.pos.x + (along * vx)\n\t\t\tlocal nearestZ = dash.pos.z + (along * vz)\n\t\t\tlocal dx = haze.pos.x - nearestX\n\t\t\tlocal dz = haze.pos.z - nearestZ\n\t\t\tif ((dx * dx) + (dz * dz)) <= 27.5625 then\n\t\t\t\tdrawer:addTimedRect(timeout, haze.pos.x, haze.pos.y + 0.02, haze.pos.z, 40, 10, haze.pos.h)\n\t\t\tend\n\t\tend\n\tend\nend\nself.used = true",
						conditions = 
						{
							
							{
								"ef66683c-a406-fca2-987e-566f827347bc",
								true,
							},
							
							{
								"6ab4c5d1-0211-eda8-b411-7b0ac55f8cc0",
								true,
							},
							
							{
								"f62a609e-1dd5-638e-adbb-b08ff551249f",
								true,
							},
						},
						gVar = "ACR_RikuMNK3_CD",
						name = "Draw dash-activated Necrohaze lines",
						uuid = "d37d9e96-4a04-667f-a5df-210027642226",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn zone",
						uuid = "ef66683c-a406-fca2-987e-566f827347bc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 14787,
						name = "Claret Dragon",
						uuid = "6ab4c5d1-0211-eda8-b411-7b0ac55f8cc0",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventSpellID = 48265,
						name = "Cauterize dash telegraph",
						uuid = "f62a609e-1dd5-638e-adbb-b08ff551249f",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Cursed Resurgence] Soar Necrohaze Lines",
			throttleTime = 500,
			uuid = "19cc1f22-dfb2-267b-9e70-c0db82a62e7c",
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
						actionLua = "local entityID = eventArgs.entityID\ndata.metamorphWindSphereDraws = data.metamorphWindSphereDraws or {}\nlocal draws = data.metamorphWindSphereDraws\nlocal old = draws[entityID]\nif old then Argus.deleteTimedShape(old) end\n\ndraws[entityID] = TensorCore.getMoogleDrawer():addTimedCircleOnEnt(\n    60000,\n    entityID,\n    17.5,\n    0,\n    false,\n    true\n)\nself.used = true",
						conditions = 
						{
							
							{
								"56af726e-13d6-fd3d-a5d2-c8ce0598fc2d",
								true,
							},
							
							{
								"9c43b1a3-fac3-9c23-bd82-7e49034b7f1c",
								true,
							},
						},
						name = "Attach 17.5y wind-sphere radius",
						uuid = "7acc0314-03fc-ac5b-a922-794ff03229d1",
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
						conditionLua = "return eventArgs.entityContentID == 2015388",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 2015388,
						name = "Metamorph wind sphere",
						uuid = "9c43b1a3-fac3-9c23-bd82-7e49034b7f1c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Self",
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "56af726e-13d6-fd3d-a5d2-c8ce0598fc2d",
						version = 3,
					},
				},
			},
			eventType = 5,
			name = "[Metamorph] Wind Sphere Blast Radius",
			uuid = "e363ffe9-0427-b465-8439-9b13dbf99fa2",
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
						actionLua = "local orderByID = {\n    [48347] = 1,\n    [48348] = 2,\n    [48349] = 3,\n}\nlocal order = orderByID[eventArgs.aoeID]\nlocal now = Now()\nlocal tellAt = tonumber(eventArgs.startTime) or now\nif tellAt <= 0 or math.abs(now - tellAt) > 10000 then\n    tellAt = now\nend\n\nlocal state = data.metamorphHellishBreath\nif not state then\n    state = { entries = {}, lastTellAt = nil }\n    data.metamorphHellishBreath = state\nend\nstate.entries = state.entries or {}\n\nif not state.lastTellAt or tellAt < state.lastTellAt or tellAt - state.lastTellAt > 3000 then\n    for _, entry in pairs(state.entries) do\n        if entry.shape then Argus.deleteTimedShape(entry.shape) end\n        if entry.text then AnyoneCore.removeTimedWorldText(entry.text) end\n    end\n    state.entries = {}\nend\nstate.lastTellAt = tellAt\n\nlocal old = state.entries[order]\nif old then\n    if old.shape then Argus.deleteTimedShape(old.shape) end\n    if old.text then AnyoneCore.removeTimedWorldText(old.text) end\nend\n\nlocal lifetime = 60000\nlocal radius = tonumber(eventArgs.aoeLength) or 60\nlocal origin = { x = eventArgs.x, y = eventArgs.y, z = eventArgs.z }\nlocal shapeUUID = TensorCore.getMoogleDrawer():addTimedCone(\n    lifetime,\n    origin.x,\n    origin.y,\n    origin.z,\n    radius,\n    math.rad(60),\n    eventArgs.heading,\n    0,\n    false,\n    true\n)\n\nlocal colors = {\n    [1] = GUI:ColorConvertFloat4ToU32(1.0, 0.20, 0.15, 1.0),\n    [2] = GUI:ColorConvertFloat4ToU32(1.0, 0.80, 0.10, 1.0),\n    [3] = GUI:ColorConvertFloat4ToU32(0.35, 0.75, 1.0, 1.0),\n}\nlocal labelPos = TensorCore.getPosInDirection(\n    origin,\n    eventArgs.heading,\n    math.min(12, radius * 0.5)\n)\nlabelPos.y = labelPos.y + 1.5\nlocal textUUID = AnyoneCore.addTimedWorldText(\n    lifetime,\n    tostring(order),\n    labelPos,\n    colors[order],\n    true,\n    2.0\n)\nstate.entries[order] = {\n    shape = shapeUUID,\n    text = textUUID,\n}\nself.used = true",
						conditions = 
						{
							
							{
								"3bb7625f-5da4-896a-8c74-36777141456d",
								true,
							},
							
							{
								"0adbb494-b5e0-4c03-a67f-8dbc1f0421b0",
								true,
							},
						},
						name = "Draw Ordered Flame Cone",
						uuid = "72bfc52b-72dd-5c68-8404-ed8e88e27859",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "3bb7625f-5da4-896a-8c74-36777141456d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 48347 or eventArgs.aoeID == 48348 or eventArgs.aoeID == 48349",
						dequeueIfLuaFalse = true,
						name = "Hellish Breath Preview 1-3",
						uuid = "0adbb494-b5e0-4c03-a67f-8dbc1f0421b0",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Metamorph] Hellish Breath Order",
			uuid = "3ceae8c4-85d0-aa70-bbb6-fee87f365a15",
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
						actionLua = "if eventArgs.markerID == 546 then\n    data.occultMetamorphSupercellIncrement = -math.rad(30)\nelse\n    data.occultMetamorphSupercellIncrement = math.rad(30)\nend\ndata.occultMetamorphSupercellMarkerAt = Now()\nself.used = true",
						conditions = 
						{
							
							{
								"e43a46f0-f317-f22a-9124-224ea4d75af9",
								true,
							},
							
							{
								"a60e868b-66b2-0019-a624-29675350e9ec",
								true,
							},
						},
						name = "Store Supercell Rotation",
						uuid = "c616c2d1-e413-44ec-b55d-d7ed80430b7a",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "e43a46f0-f317-f22a-9124-224ea4d75af9",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.markerID == 546 or eventArgs.markerID == 547",
						dequeueIfLuaFalse = true,
						name = "Turn Right or Left",
						uuid = "a60e868b-66b2-0019-a624-29675350e9ec",
						version = 3,
					},
				},
			},
			eventType = 4,
			name = "[Metamorph] Supercell Direction",
			uuid = "0779ceab-e100-f20e-b3a6-7fdab4ba9c15",
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
						actionLua = "local now = Now()\nlocal increment = data.occultMetamorphSupercellIncrement\nlocal startAt = tonumber(eventArgs.startTime) or now\nif startAt <= 0 or math.abs(now - startAt) > 10000 then\n    startAt = now\nend\n\nlocal initialDurationMs = math.max(100, (tonumber(eventArgs.duration) or 6) * 1000)\nlocal firstActivationAt = startAt + initialDurationMs\nlocal intervalMs = 2500\nlocal radius = tonumber(eventArgs.aoeLength) or 60\nlocal angle = math.rad(90)\nlocal drawer = TensorCore.getMoogleDrawer()\n\nfor step = 0, 5 do\n    local drawStartAt\n    local drawEndAt\n    if step == 0 then\n        drawStartAt = now\n        drawEndAt = firstActivationAt\n    else\n        drawStartAt = firstActivationAt + ((step - 1) * intervalMs)\n        drawEndAt = firstActivationAt + (step * intervalMs)\n    end\n\n    if drawEndAt > now then\n        local delay = math.max(0, drawStartAt - now)\n        local timeout = drawEndAt - math.max(now, drawStartAt)\n        if timeout > 0 then\n            drawer:addTimedCone(\n                math.floor(timeout),\n                eventArgs.x,\n                eventArgs.y,\n                eventArgs.z,\n                radius,\n                angle,\n                TensorCore.convertHeading(eventArgs.heading + (increment * step)),\n                math.floor(delay),\n                false,\n                true\n            )\n        end\n    end\nend\nself.used = true",
						conditions = 
						{
							
							{
								"89f34485-9ee7-db54-ab47-7c8e94b06400",
								true,
							},
							
							{
								"948b8bef-a285-7263-a164-a3d43d1ab4f7",
								true,
							},
							
							{
								"5718198a-f0ed-93ab-94fb-884ddabbddb2",
								true,
							},
						},
						name = "Draw Six Rotating Cone Waves",
						uuid = "950478a9-4009-4cb9-abb5-d85849a09f47",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "89f34485-9ee7-db54-ab47-7c8e94b06400",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 48357",
						dequeueIfLuaFalse = true,
						name = "Initial Supercell Cone",
						uuid = "948b8bef-a285-7263-a164-a3d43d1ab4f7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local at = data.occultMetamorphSupercellMarkerAt\nreturn type(data.occultMetamorphSupercellIncrement) == \"number\"\n    and type(at) == \"number\"\n    and Now() >= at\n    and Now() - at <= 8000",
						name = "Fresh Rotation Cue",
						uuid = "5718198a-f0ed-93ab-94fb-884ddabbddb2",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Metamorph] Supercell Rotating Cones",
			timeout = 8,
			uuid = "3480152e-ec79-c842-9583-1fabde5c291d",
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
						actionID = 41619,
						conditions = 
						{
							
							{
								"d8720967-962e-a798-b184-d2ca5366f741",
								true,
							},
							
							{
								"15447371-b7b2-205c-879f-6c9b8f3492f4",
								true,
							},
							
							{
								"e930a2b8-8623-f4bd-a86a-4025d41e6e91",
								true,
							},
							
							{
								"4bf7209d-8c34-782c-a4dd-63b77e3e4ae6",
								true,
							},
							
							{
								"545c4e2e-fb48-d9e3-b695-3ab27bf011ad",
								true,
							},
							
							{
								"8f2bd06a-156f-77f1-8d4b-6642ebeec189",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						targetType = "Target of Current Target",
						uuid = "8020dfc9-8a08-9162-91c4-c9a4a69daab4",
						version = 2.1,
					},
					inheritedIndex = 1,
				},
				
				{
					data = 
					{
						actionID = 41619,
						conditions = 
						{
							
							{
								"d8720967-962e-a798-b184-d2ca5366f741",
								true,
							},
							
							{
								"15447371-b7b2-205c-879f-6c9b8f3492f4",
								true,
							},
							
							{
								"e930a2b8-8623-f4bd-a86a-4025d41e6e91",
								true,
							},
							
							{
								"4bf7209d-8c34-782c-a4dd-63b77e3e4ae6",
								true,
							},
							
							{
								"545c4e2e-fb48-d9e3-b695-3ab27bf011ad",
								false,
							},
							
							{
								"8f2bd06a-156f-77f1-8d4b-6642ebeec189",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_CD",
						ignoreWeaveRules = true,
						uuid = "ba53d819-261f-6c17-aafe-5a272d9b52fd",
						version = 2.1,
					},
					inheritedIndex = 2,
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Self",
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
							1346,
						},
						name = "In Occult Crescent",
						uuid = "d8720967-962e-a798-b184-d2ca5366f741",
						version = 3,
					},
				},
				
				{
					data = 
					{
						buffID = 4364,
						category = "Self",
						dequeueIfLuaFalse = true,
						name = "Is Geomancer",
						uuid = "15447371-b7b2-205c-879f-6c9b8f3492f4",
						version = 3,
					},
				},
				
				{
					data = 
					{
						actionCDValue = 2.5,
						actionID = 41619,
						category = "Self",
						comparator = 2,
						conditionType = 4,
						dequeueIfLuaFalse = true,
						uuid = "e930a2b8-8623-f4bd-a86a-4025d41e6e91",
						version = 3,
					},
					inheritedIndex = 3,
				},
				
				{
					data = 
					{
						buffCheckType = 3,
						buffDuration = 5,
						buffID = 4257,
						category = "Self",
						name = "Has Ringing Respite",
						uuid = "545c4e2e-fb48-d9e3-b695-3ab27bf011ad",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return FFXIV_Common_BotRunning == true or (HusbandoMaxStatus and HusbandoMaxStatus()) or false",
						dequeueIfLuaFalse = true,
						name = "Bot Running",
						uuid = "4bf7209d-8c34-782c-a4dd-63b77e3e4ae6",
						version = 3,
					},
					inheritedIndex = 5,
				},
				
				{
					data = 
					{
						buffCheckType = 2,
						buffID = 418,
						buffIDList = 
						{
							418,
							148,
						},
						category = "Self",
						dequeueIfLuaFalse = true,
						matchAnyBuff = true,
						name = "Not Invuln",
						uuid = "9e163534-7e2d-de04-9fca-c1039077a3ef",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.rezzTimer == nil or TimeSince(data.rezzTimer) >= 1000",
						dequeueIfLuaFalse = true,
						name = "Check Rezz Timer",
						uuid = "ad5d769a-5e84-6753-a3d4-8b35add04643",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return OCGUI.GetToggle(\"Ringing Respite\")",
						name = "Toggle",
						uuid = "8f2bd06a-156f-77f1-8d4b-6642ebeec189",
						version = 3,
					},
				},
			},
			name = "P. Geomancer Ringing Respite",
			uuid = "124cd983-fe7a-d7f9-9ed9-ad6f8a38cf30",
			version = 2,
		},
		inheritedIndex = 103,
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
						actionLua = "local id = eventArgs.aoeID\nlocal now = Now()\nlocal startAt = tonumber(eventArgs.startTime) or now\nif startAt <= 0 or math.abs(now - startAt) > 10000 then\n    startAt = now\nend\n\nlocal function clearEntry(entry)\n    if not entry then return end\n    if entry.shape then Argus.deleteTimedShape(entry.shape) end\n    if entry.text then AnyoneCore.removeTimedWorldText(entry.text) end\nend\n\nlocal function clearGuidanceEntry(entry)\n    if not entry then return end\n    if entry.arrow then Argus.deleteTimedShape(entry.arrow) end\n    if entry.landing then Argus.deleteTimedShape(entry.landing) end\nend\n\nlocal function clearStateDraws(state)\n    if not state then return end\n    for _, entry in pairs(state.entries or {}) do\n        clearEntry(entry)\n    end\n    for _, entry in pairs(state.guidance or {}) do\n        clearGuidanceEntry(entry)\n    end\nend\n\nlocal state = data.northHornBeastStampede\nif id == 48289 then\n    clearStateDraws(state)\n    state = {\n        startedAt = startAt,\n        first = nil,\n        second = nil,\n        arrowsDrawn = false,\n        entries = {},\n        guidance = {},\n    }\n    data.northHornBeastStampede = state\nelseif not state or type(state.startedAt) ~= \"number\" or now - state.startedAt > 12000 then\n    clearStateDraws(state)\n    state = {\n        startedAt = startAt,\n        first = nil,\n        second = nil,\n        arrowsDrawn = false,\n        entries = {},\n        guidance = {},\n    }\n    data.northHornBeastStampede = state\nend\nstate.entries = state.entries or {}\nstate.guidance = state.guidance or {}\n\nlocal centerY = tonumber(eventArgs.y) or 15\nlocal center = { x = 238, y = centerY + 0.03, z = 352 }\nlocal firstColor = GUI:ColorConvertFloat4ToU32(1.0, 0.42, 0.05, 0.82)\nlocal secondColor = GUI:ColorConvertFloat4ToU32(0.10, 0.72, 1.0, 0.82)\nlocal firstTextColor = GUI:ColorConvertFloat4ToU32(1.0, 0.50, 0.05, 1.0)\nlocal secondTextColor = GUI:ColorConvertFloat4ToU32(0.20, 0.82, 1.0, 1.0)\nlocal markerMs = 60000\nlocal pathMs = 15000\n\nlocal function drawMarker(order, pos, drawer, textColor)\n    clearEntry(state.entries[order])\n    local shapeUUID = drawer:addTimedCircle(\n        markerMs,\n        pos.x,\n        pos.y + 0.03,\n        pos.z,\n        2.6,\n        0,\n        false,\n        true\n    )\n    local textUUID = AnyoneCore.addTimedWorldText(\n        markerMs,\n        tostring(order),\n        { x = pos.x, y = pos.y + 1.6, z = pos.z },\n        textColor,\n        true,\n        2.0\n    )\n    state.entries[order] = {\n        shape = shapeUUID,\n        text = textUUID,\n    }\nend\n\nif id == 48289 then\n    local boss = data.northHornBeastBossID\n        and TensorCore.mGetEntity(data.northHornBeastBossID)\n    if not boss then\n        for _, entity in pairs(TensorCore.entityList(\"contentid=14791,attackable\")) do\n            boss = entity\n            break\n        end\n    end\n\n    local p = boss and boss.pos\n    local firstPos = p\n        and { x = p.x, y = p.y, z = p.z }\n        or { x = eventArgs.x, y = eventArgs.y, z = eventArgs.z }\n\n    state.first = {\n        pos = firstPos,\n        heading = eventArgs.heading,\n        startAt = startAt,\n    }\n    drawMarker(\n        1,\n        firstPos,\n        TensorCore.getStaticFlatDrawer(firstColor),\n        firstTextColor\n    )\nelseif id == 48288 then\n    local secondPos = {\n        x = tonumber(eventArgs.x) or center.x,\n        y = tonumber(eventArgs.y) or center.y,\n        z = tonumber(eventArgs.z) or center.z,\n    }\n\n    state.second = {\n        pos = secondPos,\n        startAt = startAt,\n    }\n    drawMarker(\n        2,\n        secondPos,\n        TensorCore.getStaticFlatDrawer(secondColor),\n        secondTextColor\n    )\nend\n\nif state.first and state.second and not state.arrowsDrawn then\n    local player = TensorCore.mGetPlayer()\n    if player and player.pos then\n        local secondPos = state.second.pos\n        local plusHeading = state.first.heading + (math.pi * 0.5)\n        local minusHeading = state.first.heading - (math.pi * 0.5)\n        local plusPoint = TensorCore.getPosInDirection(center, plusHeading, 1)\n        local minusPoint = TensorCore.getPosInDirection(center, minusHeading, 1)\n\n        if plusPoint and minusPoint then\n            local playerDX = player.pos.x - center.x\n            local playerDZ = player.pos.z - center.z\n            local plusDX = plusPoint.x - center.x\n            local plusDZ = plusPoint.z - center.z\n            local sideDot = (playerDX * plusDX) + (playerDZ * plusDZ)\n            local firstHeading\n\n            if math.abs(sideDot) < 0.25 then\n                local sourceDX = secondPos.x - center.x\n                local sourceDZ = secondPos.z - center.z\n                local plusScore = (sourceDX * plusDX) + (sourceDZ * plusDZ)\n                firstHeading = plusScore >= 0 and plusHeading or minusHeading\n            else\n                firstHeading = sideDot >= 0 and plusHeading or minusHeading\n            end\n\n            local firstLanding = TensorCore.getPosInDirection(\n                player.pos,\n                firstHeading,\n                15\n            )\n            if firstLanding then\n                local awayDX = firstLanding.x - secondPos.x\n                local awayDZ = firstLanding.z - secondPos.z\n                local secondHeading\n                if (awayDX * awayDX) + (awayDZ * awayDZ) < 0.25 then\n                    secondHeading = TensorCore.getHeadingToTarget(secondPos, center)\n                else\n                    secondHeading = TensorCore.getHeadingToTarget(\n                        secondPos,\n                        firstLanding\n                    )\n                end\n\n                local finalLanding = TensorCore.getPosInDirection(\n                    firstLanding,\n                    secondHeading,\n                    30\n                )\n                if finalLanding then\n                    for _, entry in pairs(state.guidance) do\n                        clearGuidanceEntry(entry)\n                    end\n                    state.guidance = {}\n\n                    local firstArrow = TensorCore.getStaticFlatDrawer(firstColor)\n                        :addTimedArrowOnEnt(\n                            pathMs,\n                            player.id,\n                            13,\n                            0.55,\n                            2,\n                            1.5,\n                            nil,\n                            0,\n                            false,\n                            firstHeading,\n                            true\n                        )\n                    local secondArrow = TensorCore.getStaticFlatDrawer(secondColor)\n                        :addTimedArrow(\n                            pathMs,\n                            firstLanding.x,\n                            firstLanding.y + 0.03,\n                            firstLanding.z,\n                            secondHeading,\n                            28,\n                            0.55,\n                            2,\n                            1.5,\n                            0,\n                            false\n                        )\n\n                    state.guidance[1] = { arrow = firstArrow }\n                    state.guidance[2] = { arrow = secondArrow }\n                    state.arrowsDrawn = true\n                end\n            end\n        end\n    end\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"074de658-471c-7d63-b812-b2d78b281a4a",
								true,
							},
							
							{
								"6531133e-304b-7df6-b41f-e101dc9c604e",
								true,
							},
						},
						name = "Draw order and thin personal knockback path",
						uuid = "1b1caa05-fa1b-fb5d-a7ad-0ddc902ef6c7",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "074de658-471c-7d63-b812-b2d78b281a4a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 48289 or eventArgs.aoeID == 48288",
						dequeueIfLuaFalse = true,
						name = "Stampede preview 1 or 2",
						uuid = "6531133e-304b-7df6-b41f-e101dc9c604e",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[A Beast Unleashed] Stampede Order & KB Arrows",
			timeout = 10,
			uuid = "80377eef-4fa6-74ca-a6c6-2416028991f6",
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
						actionID = 7548,
						conditions = 
						{
							
							{
								"bcb2eb58-8b3b-39f7-942a-6fdbe4d9546c",
								true,
							},
							
							{
								"481951ec-fa40-fd1b-83b5-b8d941a9ca75",
								true,
							},
							
							{
								"4c6af452-ec0f-6a98-809f-e300894659cb",
								true,
							},
						},
						gVar = "ACR_RikuWAR3_Hotbar_ArmsLength",
						name = "Use Arm's Length",
						uuid = "babe6bd0-9c3f-681f-886c-45e8a81b0e90",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "bcb2eb58-8b3b-39f7-942a-6fdbe4d9546c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 48288",
						dequeueIfLuaFalse = true,
						name = "Second Stampede preview",
						uuid = "481951ec-fa40-fd1b-83b5-b8d941a9ca75",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local now = Now()\nlocal startAt = tonumber(eventArgs.startTime) or now\nif startAt <= 0 or math.abs(now - startAt) > 10000 then\n    startAt = now\nend\nlocal castMs = math.max(0, (tonumber(eventArgs.duration) or 2.5) * 1000)\nlocal requestAt = startAt + castMs + 1000\nlocal stopAt = startAt + castMs + 2500\nreturn now >= requestAt and now <= stopAt",
						name = "Arm's Length timing window",
						uuid = "4c6af452-ec0f-6a98-809f-e300894659cb",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[A Beast Unleashed] Stampede Arm's Length",
			timeout = 8,
			uuid = "69a5ef67-a58d-d43c-ab1f-bb16330634bc",
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
						actionLua = "local state = data.manyMouthsPoisonSafe\nif not state then\n    state = { pending = nil, drawUUIDs = {} }\n    data.manyMouthsPoisonSafe = state\nend\n\nlocal at = tonumber(eventArgs.startTime) or Now()\nlocal position = { x = eventArgs.x, y = eventArgs.y, z = eventArgs.z, at = at }\n\nif state.pending and (at < state.pending.at or at - state.pending.at > 3000) then\n    state.pending = nil\nend\n\nif not state.pending then\n    state.pending = position\n    self.used = true\n    return\nend\n\nlocal first = state.pending\nlocal second = position\nstate.pending = nil\n\nlocal dx = second.x - first.x\nlocal dz = second.z - first.z\nlocal length = math.sqrt((dx * dx) + (dz * dz))\nif length < 0.1 then\n    self.used = true\n    return\nend\n\nfor _, uuid in ipairs(state.drawUUIDs) do\n    if uuid then Argus.deleteTimedShape(uuid) end\nend\nstate.drawUUIDs = {}\n\nlocal centerX, centerZ = -870, -560\nlocal firstD = math.sqrt(((first.x - centerX) ^ 2) + ((first.z - centerZ) ^ 2))\nlocal secondD = math.sqrt(((second.x - centerX) ^ 2) + ((second.z - centerZ) ^ 2))\nlocal puddleOffset = (firstD + secondD) * 0.5\nlocal safeOffset = ((47 * 47) - (puddleOffset * puddleOffset)) / 94\nsafeOffset = math.max(0, math.min(23, safeOffset))\n\nlocal perpendicularX = -dz / length\nlocal perpendicularZ = dx / length\nlocal floorY = ((first.y or 0) + (second.y or 0)) * 0.5 + 0.04\nlocal color = GUI:ColorConvertFloat4ToU32(0.10, 1.00, 0.25, 0.78)\nlocal drawer = TensorCore.getStaticFlatDrawer(color)\nlocal timeoutMs = 18000\n\nfor sign = -1, 1, 2 do\n    local uuid = drawer:addTimedCircle(\n        timeoutMs,\n        centerX + (perpendicularX * safeOffset * sign),\n        floorY,\n        centerZ + (perpendicularZ * safeOffset * sign),\n        1.25,\n        0,\n        false,\n        true\n    )\n    if uuid then state.drawUUIDs[#state.drawUUIDs + 1] = uuid end\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"b39077be-8f4a-43eb-b4c4-4fdbade208a2",
								true,
							},
							
							{
								"ab082d87-8968-eaae-9cb7-4c9750aee1c0",
								true,
							},
						},
						name = "Draw green poison safe pockets",
						uuid = "588b6dc0-b947-0429-8359-6ec0f6b05de9",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "b39077be-8f4a-43eb-b4c4-4fdbade208a2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 47216",
						dequeueIfLuaFalse = true,
						name = "Venom puddle tell",
						uuid = "ab082d87-8968-eaae-9cb7-4c9750aee1c0",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Many Mouths to Feed] Poison Safe Pockets",
			timeout = 8,
			uuid = "e5a1bd39-18b0-7e89-a344-090d129761fe",
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
						actionLua = "data.shorelineChimeraRotation = data.shorelineChimeraRotation or { drawUUIDs = {} }\nlocal state = data.shorelineChimeraRotation\nstate.cast = {\n    x = eventArgs.x,\n    y = eventArgs.y,\n    z = eventArgs.z,\n    heading = eventArgs.heading,\n    radius = tonumber(eventArgs.aoeLength) or 30,\n    duration = tonumber(eventArgs.duration) or 6,\n    startAt = tonumber(eventArgs.startTime) or Now(),\n    seenAt = Now()\n}\n\nlocal function tryDraw(state)\n    local cast = state.cast\n    local increment = state.increment\n    if not cast or type(increment) ~= \"number\" then return end\n\n    local now = Now()\n    if math.abs((cast.seenAt or now) - (state.markerAt or now)) > 8000 then\n        if (cast.seenAt or 0) < (state.markerAt or 0) then state.cast = nil else state.increment = nil end\n        return\n    end\n\n    for _, uuid in ipairs(state.drawUUIDs or {}) do\n        if uuid then Argus.deleteTimedShape(uuid) end\n    end\n    state.drawUUIDs = {}\n\n    local startAt = tonumber(cast.startAt) or now\n    if startAt <= 0 or math.abs(now - startAt) > 10000 then startAt = now end\n    local durationMs = math.max(100, (tonumber(cast.duration) or 6) * 1000)\n    local firstActivationAt = startAt + durationMs\n    local intervalMs = 2700\n    local drawer = TensorCore.getMoogleDrawer()\n\n    for step = 0, 2 do\n        local drawStartAt\n        local drawEndAt\n        if step == 0 then\n            drawStartAt = now\n            drawEndAt = firstActivationAt\n        else\n            drawStartAt = firstActivationAt + ((step - 1) * intervalMs)\n            drawEndAt = firstActivationAt + (step * intervalMs)\n        end\n\n        if drawEndAt > now then\n            local delay = math.max(0, drawStartAt - now)\n            local timeout = drawEndAt - math.max(now, drawStartAt)\n            if timeout > 0 then\n                local uuid = drawer:addTimedCone(\n                    math.floor(timeout),\n                    cast.x, cast.y, cast.z,\n                    cast.radius or 30,\n                    math.rad(120),\n                    TensorCore.convertHeading(cast.heading + (increment * step)),\n                    math.floor(delay),\n                    false,\n                    true\n                )\n                if uuid then state.drawUUIDs[#state.drawUUIDs + 1] = uuid end\n            end\n        end\n    end\n\n    state.cast = nil\n    state.increment = nil\n    state.markerAt = nil\nend\ntryDraw(state)\nself.used = true",
						conditions = 
						{
							
							{
								"56ddb2cc-87e0-a2a2-a005-e13734d24d16",
								true,
							},
							
							{
								"f64e2518-a049-e223-978d-032df41afc72",
								true,
							},
						},
						name = "Store cast and draw rotating cleaves",
						uuid = "2d4f2f4f-21c3-53c6-9324-ce86a3c51782",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "56ddb2cc-87e0-a2a2-a005-e13734d24d16",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 48629 or eventArgs.aoeID == 48631",
						dequeueIfLuaFalse = true,
						name = "Initial rotating breath",
						uuid = "f64e2518-a049-e223-978d-032df41afc72",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Shoreline Showdown] Rotating Breath Cast",
			timeout = 8,
			uuid = "c9f3a3ea-9de8-95ad-9a4e-2d6f8519f688",
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
						actionLua = "data.shorelineChimeraRotation = data.shorelineChimeraRotation or { drawUUIDs = {} }\nlocal state = data.shorelineChimeraRotation\nstate.increment = eventArgs.markerID == 547 and math.rad(120) or -math.rad(120)\nstate.markerAt = Now()\n\nlocal function tryDraw(state)\n    local cast = state.cast\n    local increment = state.increment\n    if not cast or type(increment) ~= \"number\" then return end\n\n    local now = Now()\n    if math.abs((cast.seenAt or now) - (state.markerAt or now)) > 8000 then\n        if (cast.seenAt or 0) < (state.markerAt or 0) then state.cast = nil else state.increment = nil end\n        return\n    end\n\n    for _, uuid in ipairs(state.drawUUIDs or {}) do\n        if uuid then Argus.deleteTimedShape(uuid) end\n    end\n    state.drawUUIDs = {}\n\n    local startAt = tonumber(cast.startAt) or now\n    if startAt <= 0 or math.abs(now - startAt) > 10000 then startAt = now end\n    local durationMs = math.max(100, (tonumber(cast.duration) or 6) * 1000)\n    local firstActivationAt = startAt + durationMs\n    local intervalMs = 2700\n    local drawer = TensorCore.getMoogleDrawer()\n\n    for step = 0, 2 do\n        local drawStartAt\n        local drawEndAt\n        if step == 0 then\n            drawStartAt = now\n            drawEndAt = firstActivationAt\n        else\n            drawStartAt = firstActivationAt + ((step - 1) * intervalMs)\n            drawEndAt = firstActivationAt + (step * intervalMs)\n        end\n\n        if drawEndAt > now then\n            local delay = math.max(0, drawStartAt - now)\n            local timeout = drawEndAt - math.max(now, drawStartAt)\n            if timeout > 0 then\n                local uuid = drawer:addTimedCone(\n                    math.floor(timeout),\n                    cast.x, cast.y, cast.z,\n                    cast.radius or 30,\n                    math.rad(120),\n                    TensorCore.convertHeading(cast.heading + (increment * step)),\n                    math.floor(delay),\n                    false,\n                    true\n                )\n                if uuid then state.drawUUIDs[#state.drawUUIDs + 1] = uuid end\n            end\n        end\n    end\n\n    state.cast = nil\n    state.increment = nil\n    state.markerAt = nil\nend\ntryDraw(state)\nself.used = true",
						conditions = 
						{
							
							{
								"b0594a5a-9521-c38e-bcb3-bf9b048bd5d1",
								true,
							},
							
							{
								"eadc7b7a-f802-6141-9ddf-c6c3b39867d0",
								true,
							},
							
							{
								"de36cf79-b5a9-07dd-85fb-aef9a6d87f65",
								true,
							},
						},
						name = "Store direction and draw rotating cleaves",
						uuid = "b62c8ede-9fcc-4573-97d9-5a476a374342",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "b0594a5a-9521-c38e-bcb3-bf9b048bd5d1",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 3,
						markerIDList = 
						{
							546,
							547,
						},
						name = "Left or right turn",
						uuid = "eadc7b7a-f802-6141-9ddf-c6c3b39867d0",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return Argus.getEntityModel(eventArgs.entityID) == 19581",
						dequeueIfLuaFalse = true,
						name = "Regnant Chimera marker",
						uuid = "de36cf79-b5a9-07dd-85fb-aef9a6d87f65",
						version = 3,
					},
				},
			},
			eventType = 4,
			name = "[Shoreline Showdown] Rotating Breath Direction",
			timeout = 8,
			uuid = "cc2cb467-0306-1c87-b949-b3d5a3fe8378",
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
						actionLua = "data.shorelineChimeraOrbDraws = data.shorelineChimeraOrbDraws or {}\nlocal draws = data.shorelineChimeraOrbDraws\nlocal old = draws[eventArgs.entityID]\nif old then Argus.deleteTimedShape(old) end\ndraws[eventArgs.entityID] = TensorCore.getMoogleDrawer():addTimedCircleOnEnt(\n    30000,\n    eventArgs.entityID,\n    6,\n    0,\n    false,\n    true\n)\nself.used = true",
						conditions = 
						{
							
							{
								"c699f0d8-0c2d-1be8-a4a7-74f643f99c62",
								true,
							},
							
							{
								"ddca7348-70a2-c8e3-9811-b6143bfb53ff",
								true,
							},
						},
						name = "Attach six-yalm orb circle",
						uuid = "b8af83d6-5801-ad90-9328-1fb97bd85ab2",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "c699f0d8-0c2d-1be8-a4a7-74f643f99c62",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return Argus.getEntityModel(eventArgs.entityID) == 19313",
						dequeueIfLuaFalse = true,
						name = "Cacophony orb",
						uuid = "ddca7348-70a2-c8e3-9811-b6143bfb53ff",
						version = 3,
					},
				},
			},
			eventType = 5,
			name = "[Shoreline Showdown] Cacophony Orb Radius",
			uuid = "5d8f9f42-5b70-1d5e-aae0-b4b066d1f1f4",
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
						actionLua = "data.shorelineChimeraOrbDraws = data.shorelineChimeraOrbDraws or {}\nlocal draws = data.shorelineChimeraOrbDraws\nlocal old = draws[eventArgs.entityID]\nif old then Argus.deleteTimedShape(old) end\nlocal timeoutMs = math.max(100, math.floor(((tonumber(eventArgs.channelTimeMax) or 1.5) + 0.2) * 1000))\ndraws[eventArgs.entityID] = TensorCore.getMoogleDrawer():addTimedCircleOnEnt(\n    timeoutMs,\n    eventArgs.entityID,\n    6,\n    0,\n    false,\n    true\n)\nself.used = true",
						conditions = 
						{
							
							{
								"a0653c90-c8d7-4e39-9abc-632b1a30f0e6",
								true,
							},
							
							{
								"bd65aaa1-4171-947e-bc12-db567898aa79",
								true,
							},
						},
						name = "Refresh orb circle to explosion",
						uuid = "6a6ccc4e-98b5-dbe5-b70d-a185e286b7dd",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "a0653c90-c8d7-4e39-9abc-632b1a30f0e6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventSpellID = 50114,
						name = "Chaotic Chorus",
						uuid = "bd65aaa1-4171-947e-bc12-db567898aa79",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Shoreline Showdown] Cacophony Explosion Timing",
			uuid = "7e457026-589d-e4ae-881d-7dbe70caff34",
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
						actionLua = "data.ragingThrallSwipeOrder = data.ragingThrallSwipeOrder or {\n    count = 0,\n    queue = {},\n}\nlocal state = data.ragingThrallSwipeOrder\nstate.queue = state.queue or {}\nlocal at = tonumber(eventArgs.startTime) or Now()\n\nif state.count >= 8 or not state.lastAt or at < state.lastAt or at - state.lastAt > 2500 then\n    for _, entry in ipairs(state.queue) do\n        if entry.text then AnyoneCore.removeTimedWorldText(entry.text) end\n    end\n    state.queue = {}\n    state.count = 0\nend\n\nstate.count = state.count + 1\nstate.lastAt = at\nlocal order = state.count\nlocal origin = { x = eventArgs.x, y = eventArgs.y, z = eventArgs.z }\nlocal distance = order <= 4 and 10 or 17\nlocal labelPos = TensorCore.getPosInDirection(origin, eventArgs.heading, distance)\nlabelPos.y = labelPos.y + 1.5\n\nlocal textUUID = AnyoneCore.addTimedWorldText(\n    60000,\n    tostring(order),\n    labelPos,\n    GUI:ColorConvertFloat4ToU32(1.0, 0.80, 0.10, 1.0),\n    true,\n    2.0\n)\ntable.insert(state.queue, { text = textUUID })\nself.used = true",
						conditions = 
						{
							
							{
								"3abc9c2c-7673-fc6d-a00f-bd13c257178e",
								true,
							},
							
							{
								"e25b93bd-d86d-292b-a314-5b4055078814",
								true,
							},
						},
						name = "Number the eight club cleaves",
						uuid = "abdf36f4-98c3-07f0-8c86-cacee70dfdea",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "3abc9c2c-7673-fc6d-a00f-bd13c257178e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 47601",
						dequeueIfLuaFalse = true,
						name = "Octuple Swipe tell",
						uuid = "e25b93bd-d86d-292b-a314-5b4055078814",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Raging Thrall] Octuple Swipe Order",
			uuid = "0be17249-ead3-ab1e-8848-fd606e26a8dc",
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
						actionLua = "local state = data.phantomHydraBreath\nif state and state.queue then\n    for _, entry in ipairs(state.queue) do\n        if entry.shape then Argus.deleteTimedShape(entry.shape) end\n        if entry.text then AnyoneCore.removeTimedWorldText(entry.text) end\n    end\nend\n\ndata.phantomHydraBreath = {\n    count = 0,\n    queue = {},\n}\nself.used = true",
						conditions = 
						{
							
							{
								"16994f1d-7344-3cee-9b80-cc8dfdf4f387",
								true,
							},
							
							{
								"ca0abccf-caa4-c018-8973-b0e5309f48fd",
								true,
							},
						},
						name = "Reset ordered breath draws",
						uuid = "e815bf5d-162b-4999-b9ff-4b745a011cea",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "16994f1d-7344-3cee-9b80-cc8dfdf4f387",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 3,
						eventArgType = 2,
						name = "Many-headed Breath umbrella",
						spellIDList = 
						{
							47213,
						},
						uuid = "ca0abccf-caa4-c018-8973-b0e5309f48fd",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Ahead of the Competition] Breath Order Reset",
			uuid = "8ee6be2a-3cc2-9b30-8d47-adaa6f61af5c",
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
						actionLua = "data.phantomHydraBreath = data.phantomHydraBreath or {\n    count = 0,\n    queue = {},\n}\n\nlocal state = data.phantomHydraBreath\nstate.count = (state.count or 0) + 1\nstate.queue = state.queue or {}\nlocal order = state.count\nlocal origin = {\n    x = eventArgs.x,\n    y = eventArgs.y,\n    z = eventArgs.z,\n}\nlocal radius = tonumber(eventArgs.aoeLength) or 30\nlocal heading = tonumber(eventArgs.heading) or 0\nlocal lifetime = 60000\n\nlocal shapeUUID = TensorCore.getMoogleDrawer():addTimedCone(\n    lifetime,\n    origin.x,\n    origin.y,\n    origin.z,\n    radius,\n    math.rad(120),\n    heading,\n    0,\n    false,\n    true\n)\n\nlocal colors = {\n    GUI:ColorConvertFloat4ToU32(1.0, 0.20, 0.15, 1.0),\n    GUI:ColorConvertFloat4ToU32(1.0, 0.80, 0.10, 1.0),\n    GUI:ColorConvertFloat4ToU32(0.35, 0.75, 1.0, 1.0),\n    GUI:ColorConvertFloat4ToU32(0.75, 0.40, 1.0, 1.0),\n}\nlocal distance = math.min(17, 8 + ((order - 1) * 4))\nlocal labelPos = TensorCore.getPosInDirection(origin, heading, distance)\nlabelPos.y = labelPos.y + 1.5\nlocal textUUID = AnyoneCore.addTimedWorldText(\n    lifetime,\n    tostring(order),\n    labelPos,\n    colors[((order - 1) % #colors) + 1],\n    true,\n    2.0\n)\n\ntable.insert(state.queue, {\n    shape = shapeUUID,\n    text = textUUID,\n})\nself.used = true",
						conditions = 
						{
							
							{
								"1106cc57-ff43-2353-b1b3-d116ff7901d5",
								true,
							},
							
							{
								"0e75f982-00bf-cb60-a349-20e768af8460",
								true,
							},
						},
						name = "Draw and number queued breath cone",
						uuid = "35051466-853e-34bd-a29d-4bbf341f4403",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "1106cc57-ff43-2353-b1b3-d116ff7901d5",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 47212",
						dequeueIfLuaFalse = true,
						name = "Many-headed Breath preview",
						uuid = "0e75f982-00bf-cb60-a349-20e768af8460",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Ahead of the Competition] Many-headed Breath Order",
			uuid = "fa6a9ef7-cae8-9370-8165-2e3b6b228851",
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
						actionLua = "local state = data.phantomHydraBreath\nif state and state.queue and #state.queue > 0 then\n    local entry = table.remove(state.queue, 1)\n    if entry.shape then Argus.deleteTimedShape(entry.shape) end\n    if entry.text then AnyoneCore.removeTimedWorldText(entry.text) end\nend\nself.used = true",
						conditions = 
						{
							
							{
								"21d84a5c-b80c-a994-b437-01d20ed0d733",
								true,
							},
							
							{
								"236872ea-bc13-0dcd-9bb5-61dd9de24cec",
								true,
							},
						},
						name = "Remove resolved breath cone",
						uuid = "b8ce45ce-0b1e-70ff-afac-f269456ef318",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "21d84a5c-b80c-a994-b437-01d20ed0d733",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 3,
						eventArgType = 2,
						name = "Many-headed Breath executions",
						spellIDList = 
						{
							50673,
							50674,
							50675,
						},
						uuid = "236872ea-bc13-0dcd-9bb5-61dd9de24cec",
						version = 3,
					},
				},
			},
			eventType = 2,
			name = "[Ahead of the Competition] Breath Resolve Cleanup",
			uuid = "230fa375-1005-7c97-84d6-5c1ce4f9ed0f",
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
						actionLua = "local entityID = eventArgs.entityID\ndata.phantomHydraPoisonDraws = data.phantomHydraPoisonDraws or {}\nlocal draws = data.phantomHydraPoisonDraws\nlocal old = draws[entityID]\nif old then Argus.deleteTimedShape(old) end\n\ndraws[entityID] = TensorCore.getMoogleDrawer():addTimedCircleOnEnt(\n    60000,\n    entityID,\n    8.5,\n    0,\n    false,\n    true\n)\nself.used = true",
						conditions = 
						{
							
							{
								"eb8e5503-44fd-fe73-b9de-289eac376217",
								true,
							},
							
							{
								"de01b9f5-929b-5f17-8fb5-54824baa79d0",
								true,
							},
						},
						name = "Attach 8.5y poison pool",
						uuid = "2d6937ac-1949-fd8e-ad6b-296cfbda68d1",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "eb8e5503-44fd-fe73-b9de-289eac376217",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 2015175,
						name = "Phantom Hydra poison orb",
						uuid = "de01b9f5-929b-5f17-8fb5-54824baa79d0",
						version = 3,
					},
				},
			},
			eventType = 5,
			name = "[Ahead of the Competition] Poison Flood Pools",
			uuid = "7abe2b38-756f-dbb2-9289-be544682dcb3",
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
						actionLua = "local orderByID = {\n    [48662] = 1,\n    [48663] = 2,\n    [50677] = 3,\n}\nlocal state = data.metamorphHellishBreath\nlocal order = orderByID[eventArgs.spellID]\nlocal entry = state and state.entries and state.entries[order]\nif entry then\n    if entry.shape then Argus.deleteTimedShape(entry.shape) end\n    if entry.text then AnyoneCore.removeTimedWorldText(entry.text) end\n    state.entries[order] = nil\nend\nself.used = true",
						conditions = 
						{
							
							{
								"020a2ba8-2e0f-5502-b461-7075603bb1cf",
								true,
							},
							
							{
								"37e24ac1-5fb3-6385-ac13-9befeec316b1",
								true,
							},
						},
						name = "Remove resolved Hellish Breath tell",
						uuid = "e1420144-ee07-3514-88b1-52f2d11622af",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "020a2ba8-2e0f-5502-b461-7075603bb1cf",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 3,
						eventArgType = 2,
						name = "Hellish Breath executions",
						spellIDList = 
						{
							48662,
							48663,
							50677,
						},
						uuid = "37e24ac1-5fb3-6385-ac13-9befeec316b1",
						version = 3,
					},
				},
			},
			eventType = 2,
			name = "[Metamorph] Hellish Breath Resolve Cleanup",
			uuid = "656236a8-3da7-0ca1-a794-374a42697659",
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
						actionLua = "local orderByID = {\n    [49507] = 1,\n    [49506] = 2,\n}\nlocal state = data.northHornBeastStampede\nlocal order = orderByID[eventArgs.spellID]\n\nlocal function clearEntry(entry)\n    if not entry then return end\n    if entry.shape then Argus.deleteTimedShape(entry.shape) end\n    if entry.text then AnyoneCore.removeTimedWorldText(entry.text) end\nend\n\nlocal function clearGuidance(entry)\n    if not entry then return end\n    if entry.arrow then Argus.deleteTimedShape(entry.arrow) end\n    if entry.landing then Argus.deleteTimedShape(entry.landing) end\nend\n\nlocal entry = state and state.entries and state.entries[order]\nif entry then\n    clearEntry(entry)\n    state.entries[order] = nil\nend\n\nlocal guidance = state and state.guidance and state.guidance[order]\nif guidance then\n    clearGuidance(guidance)\n    state.guidance[order] = nil\nend\n\nif state and order == 1 and state.second and state.second.pos then\n    local oldSecond = state.guidance and state.guidance[2]\n    if oldSecond then\n        clearGuidance(oldSecond)\n        state.guidance[2] = nil\n    end\n\n    local player = TensorCore.mGetPlayer()\n    if player and player.pos then\n        local source = state.second.pos\n        local dx = player.pos.x - source.x\n        local dz = player.pos.z - source.z\n        local heading\n        if (dx * dx) + (dz * dz) < 0.25 then\n            heading = TensorCore.getHeadingToTarget(\n                source,\n                { x = 238, y = source.y, z = 352 }\n            )\n        else\n            heading = TensorCore.getHeadingToTarget(source, player.pos)\n        end\n\n        local arrow = TensorCore.getStaticFlatDrawer(\n            GUI:ColorConvertFloat4ToU32(0.10, 0.72, 1.0, 0.82)\n        ):addTimedArrowOnEnt(\n            10000,\n            player.id,\n            28,\n            0.55,\n            2,\n            1.5,\n            nil,\n            0,\n            false,\n            heading,\n            true\n        )\n        state.guidance = state.guidance or {}\n        state.guidance[2] = { arrow = arrow }\n    end\nelseif state and order == 2 then\n    for _, remaining in pairs(state.entries or {}) do\n        clearEntry(remaining)\n    end\n    for _, remaining in pairs(state.guidance or {}) do\n        clearGuidance(remaining)\n    end\n    data.northHornBeastStampede = nil\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"571c2684-e72b-20e7-a4e3-76a07efabe3e",
								true,
							},
							
							{
								"e0a95b01-e9e5-cbba-a721-7edc6c8ad04c",
								true,
							},
						},
						name = "Remove resolved Stampede number and refresh path",
						uuid = "0270c3f1-28ec-5ee7-8ff2-5d1f9bec044c",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "571c2684-e72b-20e7-a4e3-76a07efabe3e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 3,
						eventArgType = 2,
						name = "Stampede executions",
						spellIDList = 
						{
							49507,
							49506,
						},
						uuid = "e0a95b01-e9e5-cbba-a721-7edc6c8ad04c",
						version = 3,
					},
				},
			},
			eventType = 2,
			name = "[A Beast Unleashed] Stampede Resolve Cleanup",
			uuid = "26004e40-972c-4ebf-ac0a-8e7b1b4681c5",
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
						actionLua = "local state = data.ragingThrallSwipeOrder\nif state and state.queue and #state.queue > 0 then\n    local entry = table.remove(state.queue, 1)\n    if entry.text then AnyoneCore.removeTimedWorldText(entry.text) end\nend\nself.used = true",
						conditions = 
						{
							
							{
								"4a7ae43f-1f74-5d8a-b386-592bdd6bae53",
								true,
							},
							
							{
								"f894a3aa-4113-ee13-82bf-cf30fa3f33c8",
								true,
							},
						},
						name = "Remove resolved Octuple Swipe number",
						uuid = "7858ce7c-adb4-9f77-9cec-464e90ced86f",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "4a7ae43f-1f74-5d8a-b386-592bdd6bae53",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 3,
						eventArgType = 2,
						name = "Octuple Swipe executions",
						spellIDList = 
						{
							47602,
							47603,
							47604,
							47605,
						},
						uuid = "f894a3aa-4113-ee13-82bf-cf30fa3f33c8",
						version = 3,
					},
				},
			},
			eventType = 2,
			name = "[Raging Thrall] Octuple Swipe Resolve Cleanup",
			uuid = "a200e074-97fd-3f34-ac55-186fcfecc4df",
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
						actionLua = "local draws = data.phantomHydraPoisonDraws\nlocal uuid = draws and draws[eventArgs.entityID]\nif uuid then Argus.deleteTimedShape(uuid) end\nif draws then draws[eventArgs.entityID] = nil end\nself.used = true",
						conditions = 
						{
							
							{
								"1b605b56-8728-c4fb-a7d4-e2a7190e1313",
								true,
							},
							
							{
								"c2f09ece-f0cf-184d-9bdc-a6b2809ad8e8",
								true,
							},
						},
						name = "Remove poison pool draw",
						uuid = "c914376d-04ef-01bc-93c8-467181ae3973",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "1b605b56-8728-c4fb-a7d4-e2a7190e1313",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.phantomHydraPoisonDraws ~= nil and data.phantomHydraPoisonDraws[eventArgs.entityID] ~= nil",
						dequeueIfLuaFalse = true,
						name = "Tracked Hydra poison pool",
						uuid = "c2f09ece-f0cf-184d-9bdc-a6b2809ad8e8",
						version = 3,
					},
				},
			},
			eventType = 6,
			name = "[Ahead of the Competition] Poison Flood Pool Cleanup",
			uuid = "d4af253c-8ac8-5601-888b-68335c180ea0",
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
						actionLua = "local draws = data.metamorphWindSphereDraws\nlocal uuid = draws and draws[eventArgs.entityID]\nif uuid then Argus.deleteTimedShape(uuid) end\nif draws then draws[eventArgs.entityID] = nil end\nself.used = true",
						conditions = 
						{
							
							{
								"cc7f01b1-e987-85ed-a6c5-17f7ee88defb",
								true,
							},
							
							{
								"1a9521dc-9aca-3c3b-84df-17fa72dc309f",
								true,
							},
						},
						name = "Remove wind-sphere draw",
						uuid = "9211d710-2c95-6c2b-a5aa-178ca24f8955",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "cc7f01b1-e987-85ed-a6c5-17f7ee88defb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.metamorphWindSphereDraws ~= nil and data.metamorphWindSphereDraws[eventArgs.entityID] ~= nil",
						dequeueIfLuaFalse = true,
						name = "Tracked Metamorph wind sphere",
						uuid = "1a9521dc-9aca-3c3b-84df-17fa72dc309f",
						version = 3,
					},
				},
			},
			eventType = 6,
			name = "[Metamorph] Wind Sphere Cleanup",
			uuid = "aaa1b4e4-2917-f1a9-b745-248e756e266b",
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
						actionLua = "data.iambeSeedBursts = data.iambeSeedBursts or {}\nlocal state = data.iambeSeedBursts\nstate.seeds = state.seeds or {}\n\nlocal entityID = eventArgs.entityID\nlocal previous = state.seeds[entityID]\nif previous and previous.shape then\n    Argus.deleteTimedShape(previous.shape)\nend\n\nstate.seeds[entityID] = {}\nself.used = true",
						conditions = 
						{
							
							{
								"ddd320be-82a3-e651-8662-ba06df431427",
								true,
							},
							
							{
								"df46dc4d-cf83-f95a-b2ae-d14e6792837a",
								true,
							},
						},
						name = "Track Winsome Seed",
						uuid = "f6245080-03e0-84e3-9295-be1d112c9ce4",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "ddd320be-82a3-e651-8662-ba06df431427",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 19523,
						name = "Winsome Seed",
						uuid = "df46dc4d-cf83-f95a-b2ae-d14e6792837a",
						version = 3,
					},
				},
			},
			eventType = 5,
			name = "[Inconstant Gardener] Track Winsome Seeds",
			uuid = "a75af3ab-3cce-d438-b2c4-247acddfdfe3",
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
						actionLua = "local state = data.iambeSeedBursts\nif not state or not state.seeds then\n    self.used = true\n    return\nend\n\nlocal centerX = tonumber(eventArgs.x)\nlocal centerZ = tonumber(eventArgs.z)\nif not centerX or not centerZ then\n    self.used = true\n    return\nend\n\nlocal now = Now()\nlocal startAt = tonumber(eventArgs.startTime) or now\nlocal castSeconds = tonumber(eventArgs.duration) or 6\nlocal activationAt = startAt + ((castSeconds + 3.5) * 1000)\nlocal timeoutMs = math.max(500, math.floor(activationAt - now + 200))\nlocal drawer = TensorCore.getMoogleDrawer()\n\nfor entityID, entry in pairs(state.seeds) do\n    local seed = TensorCore.mGetEntity(entityID)\n    if seed and seed.pos then\n        local dx = seed.pos.x - centerX\n        local dz = seed.pos.z - centerZ\n        if ((dx * dx) + (dz * dz)) <= 25 then\n            if entry.shape then\n                Argus.deleteTimedShape(entry.shape)\n            end\n            entry.shape = drawer:addTimedCircleOnEnt(\n                timeoutMs,\n                entityID,\n                15,\n                0,\n                false,\n                true\n            )\n        end\n    end\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"64372b54-f6df-f8da-852b-0245b217be95",
								true,
							},
							
							{
								"6d90bfb6-4a90-4385-80d7-b5ef1a8c7146",
								true,
							},
						},
						name = "Draw selected seed bursts",
						uuid = "fab31e16-d608-6354-9a54-b820847f072a",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "64372b54-f6df-f8da-852b-0245b217be95",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 48032",
						dequeueIfLuaFalse = true,
						name = "Gardener's Hymn selector",
						uuid = "6d90bfb6-4a90-4385-80d7-b5ef1a8c7146",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Inconstant Gardener] Seed Burst Prediction",
			uuid = "73ebef20-972e-ed43-8a31-ebbe1502454e",
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
						actionLua = "data.iambeSeedBursts = data.iambeSeedBursts or {}\nlocal state = data.iambeSeedBursts\nstate.seeds = state.seeds or {}\n\nlocal entityID = eventArgs.entityID\nlocal entry = state.seeds[entityID] or {}\nstate.seeds[entityID] = entry\n\nif entry.shape then\n    Argus.deleteTimedShape(entry.shape)\nend\n\nlocal timeoutMs = math.max(\n    500,\n    math.floor(((tonumber(eventArgs.channelTimeMax) or 2) + 0.2) * 1000)\n)\nentry.shape = TensorCore.getMoogleDrawer():addTimedCircleOnEnt(\n    timeoutMs,\n    entityID,\n    15,\n    0,\n    false,\n    true\n)\n\nself.used = true",
						conditions = 
						{
							
							{
								"dd4b35b6-bcf2-2039-82b5-0dd7943d320e",
								true,
							},
							
							{
								"5e114270-4424-544c-8413-6ab50f14da1b",
								true,
							},
						},
						name = "Refresh seed circle to explosion",
						uuid = "593e611f-116c-57c9-9c9b-89e667052809",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "dd4b35b6-bcf2-2039-82b5-0dd7943d320e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventSpellID = 48033,
						name = "Seed Burst",
						uuid = "5e114270-4424-544c-8413-6ab50f14da1b",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Inconstant Gardener] Seed Burst Timing",
			uuid = "fe9e68a0-90d6-57d7-baeb-21a8acbe40ed",
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
						actionLua = "local state = data.iambeSeedBursts\nlocal entry = state and state.seeds and state.seeds[eventArgs.entityID]\nif entry and entry.shape then\n    Argus.deleteTimedShape(entry.shape)\nend\nif state and state.seeds then\n    state.seeds[eventArgs.entityID] = nil\nend\nself.used = true",
						conditions = 
						{
							
							{
								"f4e56e82-bfc9-4d17-ba93-8d00786d1eed",
								true,
							},
							
							{
								"042ff834-88ee-6cd5-b8e7-a03d43272878",
								true,
							},
						},
						name = "Remove seed burst draw",
						uuid = "6c776a22-a5f2-de6e-b9d6-1d9c660f6ebd",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "f4e56e82-bfc9-4d17-ba93-8d00786d1eed",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.iambeSeedBursts ~= nil and data.iambeSeedBursts.seeds ~= nil and data.iambeSeedBursts.seeds[eventArgs.entityID] ~= nil",
						dequeueIfLuaFalse = true,
						name = "Tracked Winsome Seed",
						uuid = "042ff834-88ee-6cd5-b8e7-a03d43272878",
						version = 3,
					},
				},
			},
			eventType = 6,
			name = "[Inconstant Gardener] Seed Cleanup",
			uuid = "e2deb93e-2ce8-0940-a03a-b85e60f6f057",
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
						actionLua = "local player = TensorCore.mGetPlayer()\nif not player or not player.pos then\n    self.used = true\n    return\nend\n\nlocal old = data.magicPotTreasure\nif old then\n    for _, uuid in ipairs(old.draws or {}) do\n        if uuid then Argus.deleteTimedShape(uuid) end\n    end\n    for _, uuid in ipairs(old.texts or {}) do\n        if uuid then AnyoneCore.removeTimedWorldText(uuid) end\n    end\nend\n\nlocal px, pz = player.pos.x, player.pos.z\nlocal northDX, northDZ = px - 233, pz + 470\nlocal southDX, southDZ = px + 505.28, pz - 244.04\nlocal side = (northDX * northDX + northDZ * northDZ <= southDX * southDX + southDZ * southDZ) and \"north\" or \"south\"\n\ndata.magicPotTreasure = {\n    side = side,\n    mode = \"initial\",\n    candidates = nil,\n    draws = {},\n    texts = {},\n    target = nil,\n    solved = false\n}\nself.used = true",
						conditions = 
						{
							
							{
								"e38f6a16-2f91-c7f5-adca-fe2df3c07ac2",
								true,
							},
							
							{
								"3fd53851-09f0-a6ec-9128-3bf92a63677e",
								true,
							},
							
							{
								"d1652ac0-88ba-eddf-8827-c2563c670116",
								true,
							},
						},
						name = "Initialize Pot coffer candidates",
						uuid = "7fbc766c-0fc2-8151-9656-396f92031bf5",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1346,
						},
						name = "North Horn",
						uuid = "e38f6a16-2f91-c7f5-adca-fe2df3c07ac2",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventBuffID = 1531,
						name = "Cache Me if You Can",
						uuid = "3fd53851-09f0-a6ec-9128-3bf92a63677e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local player = TensorCore.mGetPlayer()\nreturn player ~= nil and eventArgs.entityID == player.id",
						dequeueIfLuaFalse = true,
						name = "Local player only",
						uuid = "d1652ac0-88ba-eddf-8827-c2563c670116",
						version = 3,
					},
				},
			},
			eventType = 8,
			name = "[Magic Pot] Begin North Horn Treasure Hunt",
			uuid = "fc9f8cc2-808c-f0f7-990c-bfb58b3fe5f7",
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
						actionLua = "local state = data.magicPotTreasure\nif state then\n    for _, uuid in ipairs(state.draws or {}) do\n        if uuid then Argus.deleteTimedShape(uuid) end\n    end\n    for _, uuid in ipairs(state.texts or {}) do\n        if uuid then AnyoneCore.removeTimedWorldText(uuid) end\n    end\n    state.mode = \"reroll\"\n    state.candidates = nil\n    state.draws = {}\n    state.texts = {}\n    state.target = nil\n    state.cofferEntityID = nil\n    state.solved = false\nend\nself.used = true",
						conditions = 
						{
							
							{
								"654d7ab0-d598-9adf-bf3f-0877815a3d2d",
								true,
							},
							
							{
								"0314536b-704a-b1b6-bf0e-259e0eced9d4",
								true,
							},
						},
						name = "Switch to gold bonus coffer pool",
						uuid = "09d3a74b-d4fa-5687-b498-def27e8e1ff8",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1346,
						},
						name = "North Horn",
						uuid = "654d7ab0-d598-9adf-bf3f-0877815a3d2d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventChatLine = "another treasure",
						name = "Pot offers another coffer",
						uuid = "0314536b-704a-b1b6-bf0e-259e0eced9d4",
						version = 3,
					},
				},
			},
			eventType = 7,
			name = "[Magic Pot] Bonus Coffer Reset",
			uuid = "210d7371-369a-0adc-8f3b-52f0fb138a43",
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
						actionLua = "local player = TensorCore.mGetPlayer()\nlocal raw = eventArgs.line and eventArgs.line.line or \"\"\nif not player or not player.pos or type(raw) ~= \"string\" then\n    self.used = true\n    return\nend\n\nlocal compact = string.lower(raw):gsub(\"[^a-z]\", \"\")\nlocal wanted = nil\nlocal directionNames = {\n    \"northeast\", \"northwest\", \"southeast\", \"southwest\",\n    \"north\", \"east\", \"south\", \"west\"\n}\nfor _, name in ipairs(directionNames) do\n    if compact:find(name, 1, true) then\n        wanted = name\n        break\n    end\nend\nif not wanted then\n    self.used = true\n    return\nend\n\nlocal pools = {\n    north = {\n        {x=714.698,y=69.24771,z=262.6901},{x=-455.989,y=39.688915,z=-365.5418},\n        {x=593,y=39.622505,z=34},{x=-251.781,y=65.949005,z=-864.3828},\n        {x=151.9998,y=61.106945,z=-842.0175},{x=385,y=33,z=-177},\n        {x=452.6,y=57.10005,z=-310.3},{x=-223.8233,y=10.891144,z=-353.9438},\n        {x=1.768392,y=71.555756,z=-872.2798},{x=-252.1626,y=66.55432,z=-879.5855},\n        {x=440.298,y=60.615795,z=-926.5872},{x=782.4979,y=70.34123,z=-56.4099},\n        {x=-190,y=61.75258,z=-763},{x=939.2178,y=80.269966,z=-273.1175},\n        {x=912.2978,y=61.18964,z=-461.5099},{x=-269.6122,y=107.93719,z=875.6997},\n        {x=32.4,y=56.835186,z=-777.3},{x=-530,y=67.77658,z=-58},\n        {x=948.5978,y=63.594563,z=-567.0099},{x=830.0979,y=77.75924,z=-148.9099},\n        {x=928.8978,y=74.0003,z=-332.8099},{x=-498.7,y=11.051006,z=128.9},\n        {x=546.56,y=36.120197,z=143.3104},{x=927.0178,y=54,z=-155.2175},\n        {x=929.4178,y=54,z=-1.817501},{x=-86,y=60.596237,z=-737},\n        {x=321.198,y=59.85,z=-889.8872},{x=-536.1014,y=87.01824,z=149.8447},\n        {x=-596,y=41.869873,z=-285},{x=810.8979,y=78.39757,z=-278.8099}\n    },\n    south = {\n        {x=47.6,y=3.8843424,z=-218.3},{x=-172.6,y=6.0019975,z=103.2},\n        {x=-330,y=42,z=-628},{x=-184.5137,y=71.1816,z=667.8036},\n        {x=-747.4032,y=28.970308,z=-492.1095},{x=-512,y=41.999996,z=-389},\n        {x=52,y=25.316154,z=552},{x=-127,y=71.47446,z=808.4},\n        {x=28.10088,y=3.9999995,z=-16.69861},{x=-109.5452,y=8.047999,z=-210.1855},\n        {x=-975.4507,y=17.57744,z=-526.2878},{x=-834,y=18.913685,z=-587.4},\n        {x=190.3622,y=3.880325,z=-204.7095},{x=-259.6,y=3.6823246,z=56.9},\n        {x=210,y=98.400055,z=916},{x=-628.4385,y=49.07533,z=-449.5009},\n        {x=-88.43135,y=2.400001,z=4.891054},{x=-15.89468,y=4.0000005,z=-20.29277},\n        {x=-586.3,y=47.81013,z=-715.2},{x=237.9156,y=-0.29999995,z=309.4334},\n        {x=194.2296,y=-0.3000001,z=352.9844},{x=0.9425046,y=41.80327,z=623.2599},\n        {x=-339.8588,y=85.47024,z=861.5197},{x=71.10001,y=81.074875,z=942.3},\n        {x=11.98766,y=68.15505,z=795.707},{x=93.4,y=3.7155468,z=-114.3},\n        {x=-113.4943,y=5.0879984,z=-74.15943},{x=-853.493,y=58,z=-323.8983},\n        {x=-960,y=48,z=-425.8},{x=889.2178,y=53.999996,z=155.9825}\n    },\n    reroll = {\n        {x=782.8808,y=60.390976,z=-611.7695},{x=925.6533,y=70.21527,z=-906.2195},\n        {x=909,y=97.05797,z=-961.8},{x=-661,y=160,z=937},\n        {x=-527,y=160.1012,z=834},{x=-631.9453,y=160,z=808.8979},\n        {x=-809,y=6.3495464,z=-879},{x=671.2,y=60.99496,z=-550.1},\n        {x=701,y=59.999992,z=-945},{x=-623,y=160,z=883},\n        {x=-585,y=160,z=842},{x=-656.9,y=23.036425,z=-799.3},\n        {x=-839.9977,y=160,z=740},{x=-487.8,y=48.000015,z=-953.2},\n        {x=-603,y=32,z=-869},{x=-637.2283,y=32,z=-950.4841},\n        {x=-866,y=-41.01304,z=-775},{x=626.3,y=61.119125,z=-844.9},\n        {x=943.4631,y=70.21487,z=-879.5159},{x=-449.6,y=45.6567,z=-967.0001}\n    }\n}\n\nlocal state = data.magicPotTreasure\nif not state then\n    local px, pz = player.pos.x, player.pos.z\n    local northDX, northDZ = px - 233, pz + 470\n    local southDX, southDZ = px + 505.28, pz - 244.04\n    state = {\n        side = (northDX * northDX + northDZ * northDZ <= southDX * southDX + southDZ * southDZ) and \"north\" or \"south\",\n        mode = \"initial\",\n        candidates = nil,\n        draws = {},\n        texts = {},\n        target = nil,\n        solved = false\n    }\n    data.magicPotTreasure = state\nend\n\nlocal function clone(list)\n    local result = {}\n    for i, point in ipairs(list or {}) do result[i] = point end\n    return result\nend\n\nlocal function sector(point)\n    local dx = point.x - player.pos.x\n    local dz = point.z - player.pos.z\n    if dx * dx + dz * dz < 1 then return nil end\n    local ax, az = math.abs(dx), math.abs(dz)\n    local edge = 0.4142135623730951\n    if ax <= az * edge then return dz < 0 and \"north\" or \"south\" end\n    if az <= ax * edge then return dx > 0 and \"east\" or \"west\" end\n    if dz < 0 then return dx > 0 and \"northeast\" or \"northwest\" end\n    return dx > 0 and \"southeast\" or \"southwest\"\nend\n\nlocal function filter(list)\n    local result = {}\n    for _, point in ipairs(list or {}) do\n        if sector(point) == wanted then result[#result + 1] = point end\n    end\n    return result\nend\n\nlocal key = state.mode == \"reroll\" and \"reroll\" or state.side\nif not state.candidates then state.candidates = clone(pools[key]) end\nlocal matches = filter(state.candidates)\n\nif #matches == 0 and state.solved and state.mode ~= \"reroll\" then\n    state.mode = \"reroll\"\n    state.candidates = clone(pools.reroll)\n    matches = filter(state.candidates)\nend\nif #matches == 0 then\n    self.used = true\n    return\nend\n\nstate.candidates = matches\nfor _, uuid in ipairs(state.draws or {}) do\n    if uuid then Argus.deleteTimedShape(uuid) end\nend\nfor _, uuid in ipairs(state.texts or {}) do\n    if uuid then AnyoneCore.removeTimedWorldText(uuid) end\nend\nstate.draws = {}\nstate.texts = {}\nstate.cofferEntityID = nil\n\nlocal unique = #matches == 1\nlocal color = unique\n    and GUI:ColorConvertFloat4ToU32(0.1, 1.0, 0.2, 0.82)\n    or GUI:ColorConvertFloat4ToU32(1.0, 0.62, 0.05, 0.68)\nlocal drawer = TensorCore.getStaticFlatDrawer(color)\nlocal lifetime = unique and 900000 or 6500\nlocal radius = unique and 5 or 2.5\n\nfor _, point in ipairs(matches) do\n    local uuid = drawer:addTimedCircle(lifetime, point.x, point.y, point.z, radius, 0, false, true)\n    if uuid then state.draws[#state.draws + 1] = uuid end\nend\n\nif unique then\n    local target = matches[1]\n    state.target = target\n    state.solved = true\n    local textUUID = AnyoneCore.addTimedWorldText(900000, \"POT CHEST\", {x=target.x,y=target.y+2.5,z=target.z}, color, true, 1.5)\n    if textUUID then state.texts[#state.texts + 1] = textUUID end\nelse\n    state.target = nil\n    state.solved = false\n    local textUUID = AnyoneCore.addTimedWorldTextOnEnt(6500, \"POT: \" .. tostring(#matches) .. \" POSSIBLE - USE ELIXIR AGAIN\", player.id, color, true, 1.25, 2.5)\n    if textUUID then state.texts[#state.texts + 1] = textUUID end\nend\nself.used = true",
						conditions = 
						{
							
							{
								"025b2b1f-1927-397d-90c9-cee9546a2edb",
								true,
							},
							
							{
								"79478ed7-45f2-51f1-84f9-877b06d77283",
								true,
							},
						},
						name = "Refine and draw coffer candidates",
						uuid = "b616ec4f-908a-daa9-9871-d657617968f8",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1346,
						},
						name = "North Horn",
						uuid = "025b2b1f-1927-397d-90c9-cee9546a2edb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventChatLine = "You sense something",
						name = "Magic Pot direction hint",
						uuid = "79478ed7-45f2-51f1-84f9-877b06d77283",
						version = 3,
					},
				},
			},
			eventType = 7,
			name = "[Magic Pot] North Horn Coffer Hint Solver",
			uuid = "1b50e46b-7a45-1b95-b95a-065d0bf52299",
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
						actionLua = "local id = tonumber(eventArgs.aoeID)\nlocal x = tonumber(eventArgs.x)\nlocal y = tonumber(eventArgs.y)\nlocal z = tonumber(eventArgs.z)\n\nif not x or not y or not z then\n    self.used = true\n    return\nend\n\nlocal now = Now()\nlocal startAt = tonumber(eventArgs.startTime) or now\nif startAt <= 0 or math.abs(now - startAt) > 10000 then\n    startAt = now\nend\n\nlocal duration = tonumber(eventArgs.duration) or 0\nif duration <= 0 then\n    duration = 6\nend\nlocal remainingMs = math.max(100, math.floor(startAt + (duration * 1000) - now))\nlocal drawer = TensorCore.getMoogleDrawer()\n\nif id == 48360 or id == 50767 then\n    drawer:addTimedCircle(remainingMs, x, y, z, 8, 0, false, true)\nelseif id == 48361 then\n    drawer:addTimedDonut(remainingMs, x, y, z, 8, 16, 0, false, true)\nelseif id == 48362 then\n    drawer:addTimedDonut(remainingMs, x, y, z, 16, 30, 0, false, true)\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"435631ba-3859-d71e-921f-8dd262510469",
								true,
							},
							
							{
								"32d38391-7ea9-2489-a8a7-f1f23686e70a",
								true,
							},
						},
						name = "Draw exact Supercell circle or donut",
						uuid = "85c5703a-fa6c-bd10-9dcd-3ee56de8f9e4",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "435631ba-3859-d71e-921f-8dd262510469",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id = eventArgs.aoeID\nreturn id == 48360 or id == 50767 or id == 48361 or id == 48362",
						dequeueIfLuaFalse = true,
						name = "Supercell PB or donut",
						uuid = "32d38391-7ea9-2489-a8a7-f1f23686e70a",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Metamorph] Supercell Point-Blank & Donuts",
			timeout = 8,
			uuid = "06c33e9d-ef01-4c66-a6ea-21cdc3d39884",
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
						actionLua = "local state = data.magicPotTreasure\nif state then\n    for _, uuid in ipairs(state.draws or {}) do\n        if uuid then Argus.deleteTimedShape(uuid) end\n    end\n    for _, uuid in ipairs(state.texts or {}) do\n        if uuid then AnyoneCore.removeTimedWorldText(uuid) end\n    end\n    state.draws = {}\n    state.texts = {}\n    state.target = nil\n    state.candidates = nil\n    state.cofferEntityID = nil\n    state.solved = false\nend\n\nif data.dedoArrowEnts then\n    data.dedoArrowEnts[eventArgs.entityID] = nil\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"81b0cee1-7af9-af37-86f2-7767303eaebf",
								true,
							},
							
							{
								"6916ec6f-18ea-9acc-92e2-21835ac43d18",
								true,
							},
						},
						name = "Remove collected coffer markers",
						uuid = "3d8de46d-562f-38cf-857c-82f1e11b531a",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1346,
						},
						name = "North Horn",
						uuid = "81b0cee1-7af9-af37-86f2-7767303eaebf",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local state = data.magicPotTreasure\nif not state or state.solved ~= true or not state.target then\n    return false\nend\nif state.cofferEntityID and eventArgs.entityID == state.cofferEntityID then\n    return true\nend\nreturn string.lower(eventArgs.entityName or \"\") == \"treasure coffer\"",
						dequeueIfLuaFalse = true,
						name = "Solved Pot coffer removed",
						uuid = "6916ec6f-18ea-9acc-92e2-21835ac43d18",
						version = 3,
					},
				},
			},
			eventType = 6,
			name = "[Magic Pot] Collected Coffer Cleanup",
			uuid = "37411b06-8ec5-eb3a-adf5-7d757f96d781",
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
						actionLua = "local state = eventArgs.oldData\nif not state then\n    self.used = true\n    return\nend\n\nlocal function deleteShape(uuid)\n    if uuid then Argus.deleteTimedShape(uuid) end\nend\n\nlocal function deleteText(uuid)\n    if uuid then AnyoneCore.removeTimedWorldText(uuid) end\nend\n\nlocal stampede = state.northHornBeastStampede\nif stampede then\n    for _, entry in pairs(stampede.entries or {}) do\n        deleteShape(entry.shape)\n        deleteText(entry.text)\n    end\n    for _, entry in pairs(stampede.guidance or {}) do\n        deleteShape(entry.arrow)\n        deleteShape(entry.landing)\n    end\nend\nfor _, uuid in pairs(state.northHornBeastTopazCircles or {}) do\n    deleteShape(uuid)\nend\nfor _, uuid in ipairs(state.northHornBeastEarlyFixedDraws or {}) do\n    deleteShape(uuid)\nend\nlocal roomState = state.northHornBeastTopazRoomWave\nif roomState then\n    for _, uuid in ipairs(roomState.provisional or {}) do\n        deleteShape(uuid)\n    end\nend\nfor _, uuid in ipairs(state.northHornBeastTransientDraws or {}) do\n    deleteShape(uuid)\nend\n\nself.used = true",
						name = "Remove all A Beast Unleashed draws after wipe",
						uuid = "0008c217-f242-541f-95d3-229d2a7b03ff",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
			},
			eventType = 9,
			name = "[A Beast Unleashed] Wipe Draw Cleanup",
			uuid = "5cde495e-5f9a-a25d-8fe4-16a319ca374d",
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
						actionLua = "data.shorelineChimeraIceOrbDraws =\n    data.shorelineChimeraIceOrbDraws or {}\nlocal draws = data.shorelineChimeraIceOrbDraws\nlocal old = draws[eventArgs.entityID]\nif old then Argus.deleteTimedShape(old) end\n\ndraws[eventArgs.entityID] = TensorCore.getMoogleDrawer():addTimedCircleOnEnt(\n    30000,\n    eventArgs.entityID,\n    12,\n    0,\n    false,\n    true\n)\nself.used = true",
						conditions = 
						{
							
							{
								"1e3b29bf-a62c-f9ec-8206-de9f2d2495c3",
								true,
							},
							
							{
								"a96b20d9-8e52-30e3-a20f-0707bff20534",
								true,
							},
						},
						name = "Attach twelve-yalm ice orb circle",
						uuid = "8f23d3dc-f52c-5faa-94dd-440aacf5cd80",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "1e3b29bf-a62c-f9ec-8206-de9f2d2495c3",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 14769,
						name = "Glacipotent Orb (CID 14769)",
						uuid = "a96b20d9-8e52-30e3-a20f-0707bff20534",
						version = 3,
					},
				},
			},
			eventType = 5,
			name = "[Shoreline Showdown] Glacipotent Orb Radius",
			uuid = "ea003152-b95f-0e6f-8b33-3d4cb994d333",
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
						actionLua = "data.shorelineChimeraIceOrbDraws =\n    data.shorelineChimeraIceOrbDraws or {}\nlocal draws = data.shorelineChimeraIceOrbDraws\nlocal old = draws[eventArgs.entityID]\nif old then Argus.deleteTimedShape(old) end\n\nlocal timeoutMs = math.max(\n    100,\n    math.floor(((tonumber(eventArgs.channelTimeMax) or 1) + 0.2) * 1000)\n)\ndraws[eventArgs.entityID] = TensorCore.getMoogleDrawer():addTimedCircleOnEnt(\n    timeoutMs,\n    eventArgs.entityID,\n    12,\n    0,\n    false,\n    true\n)\nself.used = true",
						conditions = 
						{
							
							{
								"0c4bf4d3-eeb1-351b-be01-70084b123d9e",
								true,
							},
							
							{
								"44b42c3f-64f0-dcc0-9963-9012cdc79856",
								true,
							},
						},
						name = "Refresh ice orb circle to explosion",
						uuid = "1c477adc-2ed6-ceb7-b1ba-26e57633c3a1",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "0c4bf4d3-eeb1-351b-be01-70084b123d9e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventSpellID = 48635,
						name = "the Ram's Voice",
						uuid = "44b42c3f-64f0-dcc0-9963-9012cdc79856",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Shoreline Showdown] Glacipotent Explosion Timing",
			uuid = "983f204c-94e1-2a26-95c8-18725bfb0f8a",
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
						actionLua = "local state = data.magicPotTreasure\nif state then\n    state.cofferEntityID = eventArgs.entityID\nend\nself.used = true",
						conditions = 
						{
							
							{
								"f051dc30-e950-4360-9bc7-a7f7110dd154",
								true,
							},
							
							{
								"111747a4-fb38-0953-99a9-02cb622f03da",
								true,
							},
							
							{
								"c8f8d9c6-c2ad-887a-9f2c-d71859af54fb",
								true,
							},
						},
						name = "Remember revealed Pot coffer",
						uuid = "359cd064-98e5-260a-af1b-fccca0f96322",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1346,
						},
						name = "North Horn",
						uuid = "f051dc30-e950-4360-9bc7-a7f7110dd154",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 3,
						eventEntityName = "Treasure Coffer",
						name = "Treasure Coffer",
						uuid = "111747a4-fb38-0953-99a9-02cb622f03da",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local state = data.magicPotTreasure\nif not state or state.solved ~= true or not state.target then\n    return false\nend\nlocal entity = TensorCore.mGetEntity(eventArgs.entityID)\nif not entity or not entity.pos then\n    return false\nend\nlocal dx = entity.pos.x - state.target.x\nlocal dz = entity.pos.z - state.target.z\nreturn dx * dx + dz * dz <= 36",
						name = "Matches solved Pot location",
						uuid = "c8f8d9c6-c2ad-887a-9f2c-d71859af54fb",
						version = 3,
					},
				},
			},
			eventType = 5,
			name = "[Magic Pot] Track Revealed Coffer",
			uuid = "9306f1b7-f795-539f-b34f-c2e60a1f7dc6",
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
						actionLua = "local state = data.magicPotTreasure\nif state then\n    for _, uuid in ipairs(state.draws or {}) do\n        if uuid then Argus.deleteTimedShape(uuid) end\n    end\n    for _, uuid in ipairs(state.texts or {}) do\n        if uuid then AnyoneCore.removeTimedWorldText(uuid) end\n    end\n    state.draws = {}\n    state.texts = {}\n    state.target = nil\n    state.candidates = nil\n    state.cofferEntityID = nil\n    state.solved = false\nend\nif data.dedoArrowEnts then\n    data.dedoArrowEnts[eventArgs.entityID] = nil\nend\nself.used = true",
						conditions = 
						{
							
							{
								"fe189244-2e42-7b24-9ea2-1ffa13c79648",
								true,
							},
							
							{
								"c7093971-a30f-17c0-bd0b-dc46cca70fdc",
								true,
							},
							
							{
								"03a97b77-bb03-1314-b0b7-bd0e8a4d7706",
								true,
							},
							
							{
								"acf8038f-ea82-f052-b5cb-72cc4d7ac90b",
								true,
							},
						},
						name = "Remove collected Pot coffer draws",
						uuid = "f09031b7-eb21-5698-8307-8fab33564bd1",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1346,
						},
						name = "North Horn",
						uuid = "fe189244-2e42-7b24-9ea2-1ffa13c79648",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						name = "Was targetable",
						uuid = "c7093971-a30f-17c0-bd0b-dc46cca70fdc",
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
						uuid = "03a97b77-bb03-1314-b0b7-bd0e8a4d7706",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local state = data.magicPotTreasure\nif not state or state.solved ~= true or not state.target then\n    return false\nend\nif state.cofferEntityID and eventArgs.entityID == state.cofferEntityID then\n    return true\nend\nlocal entity = TensorCore.mGetEntity(eventArgs.entityID)\nif not entity or not entity.pos or string.lower(entity.name or \"\") ~= \"treasure coffer\" then\n    return false\nend\nlocal dx = entity.pos.x - state.target.x\nlocal dz = entity.pos.z - state.target.z\nreturn dx * dx + dz * dz <= 36",
						name = "Matches solved Pot coffer",
						uuid = "acf8038f-ea82-f052-b5cb-72cc4d7ac90b",
						version = 3,
					},
				},
			},
			eventType = 26,
			name = "[Magic Pot] Collected Coffer Targetable Cleanup",
			uuid = "601b8109-75d8-d413-8187-ed20aa9591eb",
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
						actionLua = "local id = eventArgs.entityID\nlocal ent = TensorCore.mGetEntity(id)\nif not ent or not ent.pos then\n    self.used = true\n    return\nend\n\ndata.familiarTacticsDiscs = data.familiarTacticsDiscs or {}\nlocal discs = data.familiarTacticsDiscs\nlocal old = discs[id]\nlocal function clearPath(entry)\n    if not entry then return end\n    if entry.hitbox then Argus.deleteTimedShape(entry.hitbox) end\n    if entry.arrow then Argus.deleteTimedShape(entry.arrow) end\n    if entry.pathArrow then Argus.deleteTimedShape(entry.pathArrow) end\n    if entry.path then\n        for _, uuid in pairs(entry.path) do\n            if uuid then Argus.deleteTimedShape(uuid) end\n        end\n    end\nend\nclearPath(old)\n\nlocal danger = TensorCore.getStaticFlatDrawer(\n    GUI:ColorConvertFloat4ToU32(1.00, 0.06, 0.06, 0.30)\n)\ndanger.colorOutline = GUI:ColorConvertFloat4ToU32(1.00, 0.12, 0.12, 0.95)\nlocal hitbox = danger:addTimedCircleOnEnt(45000, ent, 4.2, 0, false, true)\ndanger.colorOutline = nil\n\nif data.familiarTacticsDiscMode == nil then\n    local function nearTen(v)\n        local q = v / 10\n        local n = q >= 0 and math.floor(q + 0.5) or math.ceil(q - 0.5)\n        return math.abs(v - n * 10) < 1\n    end\n    local ox = ent.pos.x + 390\n    local oz = ent.pos.z - 700\n    data.familiarTacticsDiscMode = (nearTen(ox) and nearTen(oz)) and \"straight\" or \"circular\"\nend\n\ndiscs[id] = { hitbox = hitbox, path = {}, stopped = false }\nself.used = true",
						conditions = 
						{
							
							{
								"f68ca04e-7c6e-ef58-801e-234a7065a15b",
								true,
							},
							
							{
								"8ac58f5c-e887-2596-84cb-5a720b118db9",
								true,
							},
						},
						name = "Track 4.2y hitbox and future path",
						uuid = "28b1d248-47be-61cf-99c9-2a8359fda520",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "f68ca04e-7c6e-ef58-801e-234a7065a15b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local ent = TensorCore.mGetEntity(eventArgs.entityID)\nif ent == nil or Argus == nil or Argus.getEntityModel == nil then return false end\nreturn tonumber(Argus.getEntityModel(ent)) == 19418",
						dequeueIfLuaFalse = true,
						name = "Elm Gigas moving disc model 0x4BDA",
						uuid = "8ac58f5c-e887-2596-84cb-5a720b118db9",
						version = 3,
					},
				},
			},
			eventType = 5,
			name = "[Familiar Tactics] Moving Disc Hitbox + Direction",
			uuid = "46df8284-6303-2a7e-b28d-e39fc5f2f8e1",
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
						actionLua = "local discs = data.familiarTacticsDiscs\nlocal entry = discs and discs[eventArgs.entityID]\nif entry then\n    if entry.arrow then Argus.deleteTimedShape(entry.arrow); entry.arrow = nil end\n    if entry.pathArrow then Argus.deleteTimedShape(entry.pathArrow); entry.pathArrow = nil end\n    if entry.path then\n        for _, uuid in pairs(entry.path) do\n            if uuid then Argus.deleteTimedShape(uuid) end\n        end\n        entry.path = {}\n    end\n    entry.stopped = true\nend\nself.used = true",
						conditions = 
						{
							
							{
								"2784c3a6-fe58-1251-9ded-7fe049b54659",
								true,
							},
							
							{
								"af81b7ef-48da-c6a3-908d-e15f5c9ab016",
								true,
							},
						},
						name = "Stop future path when disc stops",
						uuid = "5f96eee5-7295-e7f7-9b9a-fa0f05af2294",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "2784c3a6-fe58-1251-9ded-7fe049b54659",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id = tonumber(eventArgs.spellID)\nreturn id == 47534 or id == 47535",
						dequeueIfLuaFalse = true,
						name = "Disc terminal cast",
						uuid = "af81b7ef-48da-c6a3-908d-e15f5c9ab016",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Familiar Tactics] Stop Disc Direction Arrow",
			uuid = "9566cad2-c1e9-4309-bb34-61428e20ac0f",
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
						actionLua = "local discs = data.familiarTacticsDiscs\nlocal entry = discs and discs[eventArgs.entityID]\nif entry then\n    if entry.hitbox then Argus.deleteTimedShape(entry.hitbox) end\n    if entry.arrow then Argus.deleteTimedShape(entry.arrow) end\n    if entry.pathArrow then Argus.deleteTimedShape(entry.pathArrow) end\n    if entry.path then\n        for _, uuid in pairs(entry.path) do\n            if uuid then Argus.deleteTimedShape(uuid) end\n        end\n    end\n    discs[eventArgs.entityID] = nil\nend\nif discs and next(discs) == nil then\n    data.familiarTacticsDiscs = nil\n    data.familiarTacticsDiscMode = nil\nend\nself.used = true",
						conditions = 
						{
							
							{
								"b89695e9-b2ea-b4da-9292-b14c0f454f23",
								true,
							},
							
							{
								"cbc7cb9c-d9ce-f87a-89b9-372bb431b616",
								true,
							},
						},
						name = "Clear disc hitbox and path after resolve",
						uuid = "ad882ec8-d5d9-6129-bd9a-dbcf3a8b848f",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "b89695e9-b2ea-b4da-9292-b14c0f454f23",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id = tonumber(eventArgs.spellID)\nreturn id == 47534 or id == 47535",
						dequeueIfLuaFalse = true,
						name = "Disc terminal resolve",
						uuid = "cbc7cb9c-d9ce-f87a-89b9-372bb431b616",
						version = 3,
					},
				},
			},
			eventType = 2,
			name = "[Familiar Tactics] Clear Finished Disc",
			uuid = "5b9ca71c-4a0f-b72d-aa11-301deffc5f72",
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
						actionLua = "local spellID = tonumber(eventArgs.spellID)\nlocal entID = eventArgs.entityID\nif not entID then\n    self.used = true\n    return\nend\n\nlocal timeoutMs = math.max(\n    100,\n    math.floor(((tonumber(eventArgs.channelTimeMax) or 4) + 0.25) * 1000)\n)\nlocal drawer = TensorCore.getMoogleDrawer()\nif spellID == 48633 then\n    drawer:addTimedCircleOnEnt(timeoutMs, entID, 9, 0, false, true)\nelseif spellID == 48634 then\n    drawer:addTimedDonutOnEnt(timeoutMs, entID, 8, 30, 0, false, true)\nend\nself.used = true",
						conditions = 
						{
							
							{
								"6c7bbe29-2a5f-638b-b31f-4118d5205bb4",
								true,
							},
							
							{
								"ab2cd43c-9f84-c12a-b8ee-4cded83f0083",
								true,
							},
						},
						name = "Draw boss voice AOE",
						uuid = "7e9b8c92-928d-8b55-aea4-5747ce46c434",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "6c7bbe29-2a5f-638b-b31f-4118d5205bb4",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.spellID == 48633 or eventArgs.spellID == 48634",
						dequeueIfLuaFalse = true,
						name = "Boss Ram or Dragon Voice",
						uuid = "ab2cd43c-9f84-c12a-b8ee-4cded83f0083",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Shoreline Showdown] Ram + Dragon Voice Head AOEs",
			timeout = 8,
			uuid = "513295ff-be8e-2c33-bcfa-85daf686a769",
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
						actionLua = "local x = tonumber(eventArgs.x)\nlocal y = tonumber(eventArgs.y)\nlocal z = tonumber(eventArgs.z)\nlocal heading = tonumber(eventArgs.heading)\nif not x or not y or not z or not heading then\n    self.used = true\n    return\nend\n\nlocal radius = tonumber(eventArgs.aoeLength) or 40\nlocal castMs = math.max(\n    100,\n    math.floor((tonumber(eventArgs.duration) or 4.7) * 1000)\n)\nlocal firstEndMs = castMs + 250\nlocal drawer = TensorCore.getMoogleDrawer()\n\ndrawer:addTimedCone(\n    firstEndMs,\n    x, y, z,\n    radius,\n    math.pi,\n    TensorCore.convertHeading(heading),\n    0,\n    false,\n    true\n)\n\ndrawer:addTimedCone(\n    3300,\n    x, y, z,\n    radius,\n    math.pi,\n    TensorCore.convertHeading(heading + math.pi),\n    firstEndMs,\n    false,\n    true\n)\nself.used = true",
						conditions = 
						{
							
							{
								"9b9dad41-97fd-cc33-9197-79a9501d2f42",
								true,
							},
							
							{
								"d13a1b72-776d-fcf6-aa02-973d290f3388",
								true,
							},
						},
						name = "Draw first and opposite head cleaves",
						uuid = "83ff79b2-ae13-285b-ae14-c288790bc6ae",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "9b9dad41-97fd-cc33-9197-79a9501d2f42",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 50111 or eventArgs.aoeID == 50112",
						dequeueIfLuaFalse = true,
						name = "Left or Right Duobreath",
						uuid = "d13a1b72-776d-fcf6-aa02-973d290f3388",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Shoreline Showdown] Duobreath Two-Head Sequence",
			timeout = 8,
			uuid = "88957328-4e94-fae9-9eda-b6430ad2264c",
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
						actionLua = "local order = data.appallingBehaviorAOEOrder\nif order == nil then\n    self.used = true\n    return\nend\n\nif not data.appallingBehaviorSwapApplied then\n    for _, entry in ipairs(order) do\n        entry.swapped = nil\n    end\nend\n\nlocal sourceIndex\nlocal targetIndex\n\nfor index, entry in ipairs(order) do\n    if entry.sourceEntityID == eventArgs.sourceEntityID then\n        sourceIndex = index\n    elseif entry.sourceEntityID == eventArgs.newTargetID then\n        targetIndex = index\n    end\nend\n\nif sourceIndex and targetIndex then\n    local sourceEntry = order[sourceIndex]\n    local targetEntry = order[targetIndex]\n\n    sourceEntry.x, targetEntry.x = targetEntry.x, sourceEntry.x\n    sourceEntry.y, targetEntry.y = targetEntry.y, sourceEntry.y\n    sourceEntry.z, targetEntry.z = targetEntry.z, sourceEntry.z\n    sourceEntry.h, targetEntry.h = targetEntry.h, sourceEntry.h\n\n    sourceEntry.swapped = true\n    targetEntry.swapped = true\n    data.appallingBehaviorSwapApplied = true\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"f8596457-0d34-0c40-8890-e70c79b9b79b",
								true,
							},
							
							{
								"5a257eeb-bfa4-b2a8-ad1e-8bdec7f3f214",
								true,
							},
							
							{
								"00c31d70-7a33-cbf3-9f9b-4f1959121278",
								true,
							},
							
							{
								"ff022d4a-c95a-7f9d-97ac-1a86d3065b71",
								true,
							},
						},
						name = "Swap + Mark Unsafe Dolls",
						uuid = "0ae774ca-ef94-ac51-b368-1caad67f0876",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "In North Horn",
						uuid = "f8596457-0d34-0c40-8890-e70c79b9b79b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						comparator = 3,
						dequeueIfLuaFalse = true,
						eventArgType = 5,
						eventIntValue = 207,
						name = "Swap Tether 207",
						uuid = "5a257eeb-bfa4-b2a8-ad1e-8bdec7f3f214",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 14715,
						name = "Pallkeeper Source",
						uuid = "00c31d70-7a33-cbf3-9f9b-4f1959121278",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventArgType = 7,
						eventTargetContentID = 14715,
						name = "Pallkeeper Target",
						uuid = "ff022d4a-c95a-7f9d-97ac-1a86d3065b71",
						version = 3,
					},
				},
			},
			eventType = 15,
			name = "[AppallingBehavior] Apply Doll Swap",
			uuid = "b4645654-32c3-4142-8462-58fe27495c93",
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
						actionLua = "local order=data.appallingBehaviorAOEOrder\nif not data.appallingBehaviorSwapApplied or order==nil then self.used=true;return end\nlocal entries={}\nfor _,entry in ipairs(order) do\n if entry.swapped and entry.type~=nil and entry.sequence~=nil and entry.x~=nil and entry.y~=nil and entry.z~=nil then entries[#entries+1]=entry end\nend\ntable.sort(entries,function(a,b) return a.sequence<b.sequence end)\nlocal drawer=TensorCore.getMoogleDrawer()\nfor _,entry in ipairs(entries) do\n local delay=(entry.sequence-1)*4500\n if entry.type==\"cone\" and entry.h~=nil then\n  drawer:addTimedCone(6500,entry.x,entry.y,entry.z,50,math.rad(100),entry.h,delay)\n elseif entry.type==\"circle\" then\n  drawer:addTimedCircle(6500,entry.x,entry.y,entry.z,30,delay)\n end\nend\nself.used=true",
						conditions = 
						{
							
							{
								"a2a3f789-d328-ba85-9040-0757fd72e766",
								true,
							},
							
							{
								"1a3645a0-98c0-d9f7-b353-13c47ea8206c",
								true,
							},
							
							{
								"e4c233f0-2bc0-08d3-80f5-e612bd960080",
								true,
							},
						},
						name = "Draw Swapped Unsafe Dolls Only",
						uuid = "398e5285-e80f-b0a8-9b61-26111233faf2",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "In North Horn",
						uuid = "a2a3f789-d328-ba85-9040-0757fd72e766",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 14714,
						name = "Pallmagia",
						uuid = "1a3645a0-98c0-d9f7-b353-13c47ea8206c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventSpellID = 49775,
						name = "Reverse Polarity",
						uuid = "e4c233f0-2bc0-08d3-80f5-e612bd960080",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[AppallingBehavior] Swapped Unsafe Only",
			uuid = "cf6cff82-bb76-180a-9c81-1ab83e5971cd",
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
						actionLua = "local x = tonumber(eventArgs.x)\nlocal y = tonumber(eventArgs.y)\nlocal z = tonumber(eventArgs.z)\nlocal heading = tonumber(eventArgs.heading) or 0\nif not x or not y or not z then\n    self.used = true\n    return\nend\n\nlocal now = Now()\nlocal startAt = tonumber(eventArgs.startTime)\nif not startAt or startAt <= 0 or math.abs(now - startAt) > 15000 then\n    startAt = now\nend\nlocal seconds = tonumber(eventArgs.duration)\nif not seconds or seconds <= 0 then\n    seconds = tonumber(eventArgs.aoeID) == 50691 and 2.8 or 4.8\nend\nlocal lifetime = math.max(100, math.floor(startAt + seconds * 1000 - now + 250))\n\nTensorCore.getMoogleDrawer():addTimedCone(\n    lifetime,\n    x, y, z,\n    60,\n    math.pi,\n    heading,\n    0,\n    false,\n    true\n)\nself.used = true",
						conditions = 
						{
							
							{
								"9d111e03-6175-7abd-a98a-9fbefda35423",
								true,
							},
							
							{
								"f3986607-ca64-247c-af05-0d2a93a9642b",
								true,
							},
						},
						name = "Draw fixed 60y Dual Cut half-room cleave",
						uuid = "290ae251-d941-facf-a19d-ec4e7c86c877",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "In North Horn",
						uuid = "9d111e03-6175-7abd-a98a-9fbefda35423",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id = tonumber(eventArgs.aoeID)\nreturn id == 50691 or id == 50692",
						dequeueIfLuaFalse = true,
						name = "Dual Cut AOEs",
						uuid = "f3986607-ca64-247c-af05-0d2a93a9642b",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Doubled Trouble] Dual Cut Cleaves",
			uuid = "8a4a9611-0417-24c3-b9b7-9670ddf305a2",
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
						actionLua = "local state = data.northHornBeastStampede\nlocal now = Now()\n\nlocal function clearMarker(entry)\n    if not entry then return end\n    if entry.shape then Argus.deleteTimedShape(entry.shape) end\n    if entry.text then AnyoneCore.removeTimedWorldText(entry.text) end\nend\n\nlocal function clearGuidance(entry)\n    if not entry then return end\n    if entry.arrow then Argus.deleteTimedShape(entry.arrow) end\n    if entry.landing then Argus.deleteTimedShape(entry.landing) end\nend\n\nlocal function clearState()\n    for _, entry in pairs(state.entries or {}) do clearMarker(entry) end\n    for _, entry in pairs(state.guidance or {}) do clearGuidance(entry) end\n    data.northHornBeastStampede = nil\nend\n\nif type(state) ~= \"table\" then\n    self.used = true\n    return\nend\n\nlocal startedAt = tonumber(state.startedAt) or now\nif now - startedAt > 22000 then\n    clearState()\n    self.used = true\n    return\nend\n\nlocal hasFirst = state.first and state.first.heading ~= nil\nlocal hasSecond = state.second and state.second.pos ~= nil\nif not hasFirst and not hasSecond then\n    clearState()\n    self.used = true\n    return\nend\n\nlocal player = TensorCore.mGetPlayer()\nif not player or not player.pos then\n    self.used = true\n    return\nend\n\nstate.guidance = state.guidance or {}\nlocal center = { x = 238, y = player.pos.y, z = 352 }\nlocal firstColor = GUI:ColorConvertFloat4ToU32(1.0, 0.42, 0.05, 0.88)\nlocal secondColor = GUI:ColorConvertFloat4ToU32(0.10, 0.72, 1.0, 0.88)\nlocal firstDrawer = TensorCore.getStaticFlatDrawer(firstColor)\nlocal secondDrawer = TensorCore.getStaticFlatDrawer(secondColor)\nlocal refreshMs = 650\n\nlocal function updateEntityArrow(entry, drawer, totalLength, heading)\n    entry = entry or {}\n    local tipLength = 2\n    local baseLength = totalLength - tipLength\n    local ok = false\n    if entry.arrow then\n        ok = drawer:updateTimedArrowOnEnt(\n            entry.arrow,\n            refreshMs,\n            player,\n            baseLength,\n            0.55,\n            tipLength,\n            1.5,\n            nil,\n            0,\n            false,\n            heading,\n            true\n        )\n    end\n    if not ok then\n        if entry.arrow then Argus.deleteTimedShape(entry.arrow) end\n        entry.arrow = drawer:addTimedArrowOnEnt(\n            refreshMs,\n            player,\n            baseLength,\n            0.55,\n            tipLength,\n            1.5,\n            nil,\n            0,\n            false,\n            heading,\n            true\n        )\n    end\n    return entry\nend\n\nlocal function updateWorldArrow(entry, drawer, origin, totalLength, heading)\n    entry = entry or {}\n    local tipLength = 2\n    local baseLength = totalLength - tipLength\n    local ok = false\n    if entry.arrow then\n        ok = drawer:updateTimedArrow(\n            entry.arrow,\n            refreshMs,\n            origin.x,\n            origin.y + 0.03,\n            origin.z,\n            heading,\n            baseLength,\n            0.55,\n            tipLength,\n            1.5,\n            0,\n            false\n        )\n    end\n    if not ok then\n        if entry.arrow then Argus.deleteTimedShape(entry.arrow) end\n        entry.arrow = drawer:addTimedArrow(\n            refreshMs,\n            origin.x,\n            origin.y + 0.03,\n            origin.z,\n            heading,\n            baseLength,\n            0.55,\n            tipLength,\n            1.5,\n            0,\n            false\n        )\n    end\n    return entry\nend\n\nlocal firstStillPending = hasFirst\n    and state.entries\n    and state.entries[1] ~= nil\nlocal secondStillPending = hasSecond\n    and state.entries\n    and state.entries[2] ~= nil\n\nif firstStillPending then\n    local plusHeading = state.first.heading + (math.pi * 0.5)\n    local minusHeading = state.first.heading - (math.pi * 0.5)\n    local plusPoint = TensorCore.getPosInDirection(center, plusHeading, 1)\n    local minusPoint = TensorCore.getPosInDirection(center, minusHeading, 1)\n\n    if plusPoint and minusPoint then\n        local playerDX = player.pos.x - center.x\n        local playerDZ = player.pos.z - center.z\n        local plusDX = plusPoint.x - center.x\n        local plusDZ = plusPoint.z - center.z\n        local sideDot = (playerDX * plusDX) + (playerDZ * plusDZ)\n        local firstHeading\n\n        if math.abs(sideDot) < 0.20 and state.liveFirstHeading then\n            firstHeading = state.liveFirstHeading\n        elseif math.abs(sideDot) < 0.20 and hasSecond then\n            local sourceDX = state.second.pos.x - center.x\n            local sourceDZ = state.second.pos.z - center.z\n            local plusScore = (sourceDX * plusDX) + (sourceDZ * plusDZ)\n            firstHeading = plusScore >= 0 and plusHeading or minusHeading\n        elseif math.abs(sideDot) < 0.20 then\n            firstHeading = plusHeading\n        else\n            firstHeading = sideDot >= 0 and plusHeading or minusHeading\n        end\n        state.liveFirstHeading = firstHeading\n\n        local firstLanding = TensorCore.getPosInDirection(\n            player.pos,\n            firstHeading,\n            15\n        )\n        if firstLanding then\n            state.guidance[1] = updateEntityArrow(\n                state.guidance[1],\n                firstDrawer,\n                15,\n                firstHeading\n            )\n\n            if hasSecond then\n                local awayDX = firstLanding.x - state.second.pos.x\n                local awayDZ = firstLanding.z - state.second.pos.z\n                local secondHeading\n                if (awayDX * awayDX) + (awayDZ * awayDZ) < 0.25 then\n                    secondHeading = TensorCore.getHeadingToTarget(\n                        state.second.pos,\n                        center\n                    )\n                else\n                    secondHeading = TensorCore.getHeadingToTarget(\n                        state.second.pos,\n                        firstLanding\n                    )\n                end\n\n                state.guidance[2] = updateWorldArrow(\n                    state.guidance[2],\n                    secondDrawer,\n                    firstLanding,\n                    30,\n                    secondHeading\n                )\n            elseif state.guidance[2] then\n                clearGuidance(state.guidance[2])\n                state.guidance[2] = nil\n            end\n        end\n    end\nelseif secondStillPending then\n    if state.guidance[1] then\n        clearGuidance(state.guidance[1])\n        state.guidance[1] = nil\n    end\n\n    local dx = player.pos.x - state.second.pos.x\n    local dz = player.pos.z - state.second.pos.z\n    local secondHeading\n    if (dx * dx) + (dz * dz) < 0.25 then\n        secondHeading = TensorCore.getHeadingToTarget(\n            state.second.pos,\n            center\n        )\n    else\n        secondHeading = TensorCore.getHeadingToTarget(\n            state.second.pos,\n            player.pos\n        )\n    end\n\n    state.guidance[2] = updateEntityArrow(\n        state.guidance[2],\n        secondDrawer,\n        30,\n        secondHeading\n    )\nelse\n    clearState()\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"bac74020-17f7-0fd7-a04e-1ad9e69e845e",
								true,
							},
							
							{
								"f087f77d-6852-b590-a10b-b4ee6edb0c1a",
								true,
							},
						},
						name = "Update live standalone + combined KB arrows",
						uuid = "262347e0-ce27-f1a7-a0f9-2d1cfe9381c1",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "bac74020-17f7-0fd7-a04e-1ad9e69e845e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local s = data.northHornBeastStampede\nreturn type(s) == \"table\"",
						dequeueIfLuaFalse = true,
						name = "Active Stampede state",
						uuid = "f087f77d-6852-b590-a10b-b4ee6edb0c1a",
						version = 3,
					},
				},
			},
			eventType = 12,
			name = "[A Beast Unleashed] Live Stampede KB Arrows",
			throttleTime = 100,
			uuid = "92900e64-bb3f-fa6d-89dd-cdcb7a8d2e55",
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
						actionLua = "local id=tonumber(eventArgs.aoeID)\nlocal now=Now()\nlocal function clear(state)\n if not state then return end\n for _,u in ipairs(state.draws or {}) do if u then Argus.deleteTimedShape(u) end end\n state.draws={}\nend\nlocal function addLine(state,ent,x,y,z,h,len)\n if not ent or not ent.id or not ent.pos then return false end\n local key=tostring(ent.id)\n if state.lines[key] then return false end\n state.lines[key]={x=tonumber(x) or ent.pos.x,y=tonumber(y) or ent.pos.y,z=tonumber(z) or ent.pos.z,heading=tonumber(h) or tonumber(ent.pos.h) or 0,length=(tonumber(len) and tonumber(len)>1) and tonumber(len) or 50,halfWidth=2}\n state.lineCount=state.lineCount+1\n return true\nend\nlocal function collectEarly(state)\n local list=TensorCore.getEntityGroupList(\"All\",{noAliveCheck=true}) or {}\n for _,ent in pairs(list) do\n  if ent and ent.pos and tonumber(Argus.getEntityModel(ent))==18088 then\n   local dx,dz=ent.pos.x-450,ent.pos.z-357\n   if dx*dx+dz*dz<3600 then addLine(state,ent,ent.pos.x,ent.pos.y,ent.pos.z,ent.pos.h,50) end\n  end\n end\nend\nlocal function rectDistance(x,z,line)\n local dx,dz=x-line.x,z-line.z\n local s,c=math.sin(line.heading),math.cos(line.heading)\n local f,l=dx*s+dz*c,dx*c-dz*s\n local du=0\n if f<0 then du=-f elseif f>line.length then du=f-line.length end\n local dv=math.max(math.abs(l)-line.halfWidth,0)\n return math.sqrt(du*du+dv*dv)\nend\nlocal function draw(state)\n clear(state)\n local life=math.max(250,math.floor(state.endAt-Now()+250))\n local red=TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(1,0.1,0.08,0.72),1)\n red.colorOutline=4294967295\n local u\n if state.mode==\"out\" then u=red:addTimedCircle(life,state.x,state.y+0.03,state.z,16,0,false,true)\n else u=red:addTimedDonut(life,state.x,state.y+0.03,state.z,8,30,0,false,true) end\n if u then state.draws[#state.draws+1]=u end\n for _,line in pairs(state.lines) do\n  u=red:addTimedRect(life,line.x,line.y+0.03,line.z,line.length,4,line.heading,0,false,true)\n  if u then state.draws[#state.draws+1]=u end\n end\n red.colorOutline=nil\n if state.lineCount<12 then return end\n local aminx,amaxx,aminz,amaxz=430,470,337,377\n local margin,step=0.8,0.4\n local minx,maxx,minz,maxz=aminx+margin,amaxx-margin,aminz+margin,amaxz-margin\n local nx,nz=math.floor((maxx-minx)/step)+1,math.floor((maxz-minz)/step)+1\n local safe,score={},{}\n for ix=1,nx do\n  safe[ix]={};score[ix]={}\n  local x=minx+(ix-1)*step\n  for iz=1,nz do\n   local z=minz+(iz-1)*step\n   local dx,dz=x-state.x,z-state.z\n   local dist=math.sqrt(dx*dx+dz*dz)\n   local hc=state.mode==\"out\" and (dist-16) or (8-dist)\n   local best=math.min(hc,x-aminx,amaxx-x,z-aminz,amaxz-z)\n   local ok=best>margin\n   if ok then\n    for _,line in pairs(state.lines) do\n     local c=rectDistance(x,z,line)\n     if c<=margin then ok=false break end\n     best=math.min(best,c)\n    end\n   end\n   safe[ix][iz]=ok;score[ix][iz]=ok and best or 0\n  end\n end\n local visited={}\n for ix=1,nx do visited[ix]={} end\n local comps={}\n local dirs={{1,0},{-1,0},{0,1},{0,-1}}\n for ix=1,nx do\n  for iz=1,nz do\n   if safe[ix][iz] and not visited[ix][iz] then\n    local qx,qz={ix},{iz};local head,count=1,0;local best=nil\n    visited[ix][iz]=true\n    while head<=#qx do\n     local cx,cz=qx[head],qz[head];head=head+1;count=count+1\n     local sc=score[cx][cz]\n     if not best or sc>best.score then best={x=minx+(cx-1)*step,z=minz+(cz-1)*step,score=sc} end\n     for _,d in ipairs(dirs) do\n      local tx,tz=cx+d[1],cz+d[2]\n      if tx>=1 and tx<=nx and tz>=1 and tz<=nz and safe[tx][tz] and not visited[tx][tz] then visited[tx][tz]=true;qx[#qx+1]=tx;qz[#qz+1]=tz end\n     end\n    end\n    if best and count>=6 and best.score>0.95 then comps[#comps+1]=best end\n   end\n  end\n end\n table.sort(comps,function(a,b) return a.score>b.score end)\n local green=TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(0.08,1,0.16,0.9),1)\n green.colorOutline=4294967295\n for i=1,math.min(#comps,4) do\n  local p=comps[i]\n  local radius=math.min(1.35,math.max(0.55,p.score-0.35))\n  u=green:addTimedCircle(life,p.x,state.y+0.06,p.z,radius,0,false,true)\n  if u then state.draws[#state.draws+1]=u end\n end\n green.colorOutline=nil\nend\nlocal state=data.southHornBlackRegiment\nif id==41147 or id==41148 then\n clear(state)\n local dur=tonumber(eventArgs.duration) or 7\n state={mode=id==41147 and \"out\" or \"in\",x=tonumber(eventArgs.x) or 450,y=tonumber(eventArgs.y) or 0,z=tonumber(eventArgs.z) or 357,endAt=now+dur*1000,lines={},lineCount=0,draws={}}\n data.southHornBlackRegiment=state\n collectEarly(state)\n draw(state)\n self.used=true\n return\nend\nif id==41163 and state and now<=state.endAt+1000 then\n local ent=TensorCore.mGetEntity(eventArgs.entityID)\n if ent and ent.pos then\n  local len=tonumber(eventArgs.aoeLength) or 0\n  if len<=1 then\n   local ex,ez=tonumber(eventArgs.x),tonumber(eventArgs.z)\n   if ex and ez then local dx,dz=ex-ent.pos.x,ez-ent.pos.z;local d=math.sqrt(dx*dx+dz*dz);if d>1 then len=d end end\n  end\n  if addLine(state,ent,ent.pos.x,ent.pos.y,ent.pos.z,eventArgs.heading,len) then draw(state) end\n end\nend\nself.used=true",
						conditions = 
						{
							
							{
								"41c18547-aa8f-c94d-846c-1851aaaa7be0",
								true,
							},
							
							{
								"e29eaeea-3bff-eaf4-b914-31cb9b8253bb",
								true,
							},
						},
						name = "Exact boss hazard, early lines, and safe spots",
						uuid = "bdaee975-be27-df15-ad6b-6b1454960834",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						name = "South Horn",
						uuid = "41c18547-aa8f-c94d-846c-1851aaaa7be0",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 41147 or eventArgs.aoeID == 41148 or eventArgs.aoeID == 41163",
						dequeueIfLuaFalse = true,
						name = "Windstorm, Cyclone, or Choco Beak",
						uuid = "e29eaeea-3bff-eaf4-b914-31cb9b8253bb",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Black Regiment] Exact In-Out + Early Beak Safe Spots",
			timeout = 10,
			uuid = "a69d462f-ec64-5741-8a3f-b4501f194495",
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
						actionLua = "local now = Now()\nlocal targetID = tonumber(eventArgs.newTargetID)\nlocal beacon = targetID and TensorCore.mGetEntity(targetID) or nil\nif not beacon or not beacon.pos then self.used = true return end\nlocal model = Argus.getEntityModel(beacon)\nif model and tonumber(model) ~= 18141 then self.used = true return end\nlocal center = { x = 636, y = beacon.pos.y, z = -54 }\nlocal offX = beacon.pos.x - center.x\nlocal offZ = beacon.pos.z - center.z\nif offX * offX + offZ * offZ < 1 then self.used = true return end\nlocal state = data.southHornOnTheHuntLasers\nif type(state) ~= \"table\" or now - (tonumber(state.startedAt) or 0) > 6500 then\n if type(state) == \"table\" and type(state.entries) == \"table\" then\n  for _, e in pairs(state.entries) do if e.uuid then Argus.deleteTimedShape(e.uuid) end end\n end\n state = { startedAt = now, seen = {}, entries = {} }\n data.southHornOnTheHuntLasers = state\nend\nlocal key = tostring(targetID)\nif state.seen[key] then self.used = true return end\nstate.seen[key] = true\nlocal facing = tonumber(beacon.pos.h) or 0\nlocal forwardX = math.sin(facing)\nlocal forwardZ = math.cos(facing)\nlocal clockwise = (offX * forwardZ - offZ * forwardX) > 0\nlocal heading = TensorCore.getHeadingToTarget(center, beacon.pos)\nheading = (heading + (clockwise and -math.rad(160) or math.rad(160))) % (math.pi * 2)\nlocal red = TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(1.00, 0.06, 0.06, 0.78))\nred.colorOutline = 4294967295\nlocal uuid = red:addTimedRect(5200, center.x, center.y + 0.03, center.z, 28, 10, heading, 0, false, true)\nred.colorOutline = nil\nstate.entries[key] = { id = targetID, at = now + 5200, uuid = uuid, y = center.y + 0.03 }\nself.used = true",
						conditions = 
						{
							
							{
								"f97fded1-0a0f-e79d-851a-185b406ef239",
								true,
							},
							
							{
								"6d7896a2-3232-743e-81c5-135ea2dedd90",
								true,
							},
						},
						name = "Corrected ray prediction + live state",
						uuid = "e4717e08-c065-ee2d-a9ff-acda09ebbf10",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						name = "South Horn",
						uuid = "f97fded1-0a0f-e79d-851a-185b406ef239",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.newTetherID == 312",
						dequeueIfLuaFalse = true,
						name = "Beacon countdown tether",
						uuid = "6d7896a2-3232-743e-81c5-135ea2dedd90",
						version = 3,
					},
				},
			},
			eventType = 15,
			name = "[On The Hunt] Predicted Aetherial Ray Landings",
			timeout = 6,
			uuid = "57be71cc-2fa7-0932-bf87-bdb059e65a64",
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
						actionLua = "local entity = TensorCore.mGetEntity(eventArgs.entityID)\nif not entity or not entity.pos then\n    self.used = true\n    return\nend\n\nlocal duration = tonumber(eventArgs.channelTimeMax) or 5\nlocal life = math.max(250, math.floor(duration * 1000 + 250))\nlocal red = TensorCore.getStaticFlatDrawer(\n    GUI:ColorConvertFloat4ToU32(1.00, 0.06, 0.06, 0.78)\n)\nred.colorOutline = 4294967295\nred:addTimedCircle(\n    life,\n    entity.pos.x,\n    entity.pos.y + 0.03,\n    entity.pos.z,\n    12,\n    0,\n    false,\n    true\n)\nred.colorOutline = nil\nself.used = true",
						conditions = 
						{
							
							{
								"269b1828-9f1f-7731-a40e-1dbc87db845e",
								true,
							},
							
							{
								"30a84423-7358-a02d-a56e-56f3532c7d41",
								true,
							},
						},
						name = "Draw red 12y rock point-blank",
						uuid = "cbae75c3-da0b-da93-9cf4-3e50c0382a26",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						name = "South Horn",
						uuid = "269b1828-9f1f-7731-a40e-1dbc87db845e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.spellID == 41407",
						dequeueIfLuaFalse = true,
						name = "Decompress (41407)",
						uuid = "30a84423-7358-a02d-a56e-56f3532c7d41",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[On The Hunt] Ochre Stone Point-Blank Explosions",
			timeout = 6,
			uuid = "aee11592-2d69-1dda-a0c1-814e85376636",
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
						actionLua = "local discs = data.familiarTacticsDiscs\nif discs == nil then self.used = true return end\n\nlocal danger = TensorCore.getStaticFlatDrawer(\n    GUI:ColorConvertFloat4ToU32(1.00, 0.06, 0.06, 0.18)\n)\ndanger.colorOutline = GUI:ColorConvertFloat4ToU32(1.00, 0.12, 0.12, 0.82)\nlocal direction = TensorCore.getStaticFlatDrawer(\n    GUI:ColorConvertFloat4ToU32(1.00, 0.72, 0.08, 0.90)\n)\ndirection.colorOutline = 4294967295\n\nlocal cx, cz = -390, 700\nlocal life = 350\nlocal dead = {}\nfor id, entry in pairs(discs) do\n    if not entry.stopped then\n        local ent = TensorCore.mGetEntity(id)\n        if ent == nil or ent.pos == nil then\n            dead[#dead + 1] = id\n        else\n            entry.path = entry.path or {}\n            local h = tonumber(ent.pos.h) or 0\n            local ox, oz = ent.pos.x - cx, ent.pos.z - cz\n            local dirx, dirz = math.sin(h), math.cos(h)\n            local r = math.sqrt(ox * ox + oz * oz)\n            local circular = data.familiarTacticsDiscMode == \"circular\" and r > 0.1\n            local turn = 1\n            if circular and (ox * dirz - oz * dirx) > 0 then turn = -1 end\n\n            for i = 1, 8 do\n                local d = i * 0.5\n                local x, z\n                if circular then\n                    local a = turn * d / r\n                    local ca, sa = math.cos(a), math.sin(a)\n                    x = cx + ox * ca - oz * sa\n                    z = cz + ox * sa + oz * ca\n                else\n                    x = ent.pos.x + dirx * d\n                    z = ent.pos.z + dirz * d\n                end\n                local uuid = entry.path[i]\n                local ok = false\n                if uuid then\n                    ok = danger:updateTimedCircle(uuid, life, x, ent.pos.y + 0.04, z, 4.2, 0, false, true)\n                end\n                if not ok then\n                    entry.path[i] = danger:addTimedCircle(life, x, ent.pos.y + 0.04, z, 4.2, 0, false, true)\n                end\n            end\n\n            local ok = false\n            if entry.pathArrow then\n                ok = direction:updateTimedArrowOnEnt(\n                    entry.pathArrow, life, ent, 2.9, 0.34, 1.1, 0.90,\n                    nil, 0, false, 0, false\n                )\n            end\n            if not ok then\n                entry.pathArrow = direction:addTimedArrowOnEnt(\n                    life, ent, 2.9, 0.34, 1.1, 0.90,\n                    nil, 0, false, 0, false\n                )\n            end\n        end\n    end\nend\n\nfor _, id in ipairs(dead) do\n    local entry = discs[id]\n    if entry then\n        if entry.hitbox then Argus.deleteTimedShape(entry.hitbox) end\n        if entry.pathArrow then Argus.deleteTimedShape(entry.pathArrow) end\n        if entry.path then\n            for _, uuid in pairs(entry.path) do\n                if uuid then Argus.deleteTimedShape(uuid) end\n            end\n        end\n    end\n    discs[id] = nil\nend\nif next(discs) == nil then\n    data.familiarTacticsDiscs = nil\n    data.familiarTacticsDiscMode = nil\nend\n\ndanger.colorOutline = nil\ndirection.colorOutline = nil\nself.used = true",
						conditions = 
						{
							
							{
								"b743218e-3e33-19fe-b925-b0c21b753863",
								true,
							},
							
							{
								"d06f82b4-23be-82b8-ad3c-0ed1b9e61d62",
								true,
							},
						},
						name = "Update 4y disc travel paths",
						uuid = "30b910c2-288b-2de0-aac0-357a7e77330c",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn",
						uuid = "b743218e-3e33-19fe-b925-b0c21b753863",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local discs = data.familiarTacticsDiscs\nreturn discs ~= nil and next(discs) ~= nil",
						dequeueIfLuaFalse = true,
						name = "Active Familiar Tactics discs",
						uuid = "d06f82b4-23be-82b8-ad3c-0ed1b9e61d62",
						version = 3,
					},
				},
			},
			eventType = 12,
			name = "[Familiar Tactics] Moving Disc Future Path",
			throttleTime = 100,
			uuid = "d533a302-fba3-1af7-a709-ef5051803f74",
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
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\nlocal aura = a.newActiveAura1\nif aura ~= 2993 and aura ~= 3052 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil or ent.contentid ~= 14822 then return end\n\n-- Start a new set after the previous aura batch expires.\nif data.b2LlSwords == nil or (data.b2LlLastAura ~= nil and TimeSince(data.b2LlLastAura) > 25000) then\n    data.b2LlSwords = {}\n    data.b2LlCount = 0\n    data.b2LlBeats = 0\n    data.b2LlFirstAura = nil\n    data.b2LlAOEOrders = nil\n    data.b2LlAOECalled = nil\nend\nif data.b2LlSwords[a.entityID] ~= nil then return end\n\nif data.b2LlFirstAura == nil then data.b2LlFirstAura = Now() end\ndata.b2LlLastAura = Now()\ndata.b2LlCount = data.b2LlCount + 1\n\nlocal isAOE = (aura == 3052)\n-- A Steelsforge sword uses one beat for its circle and one for knockback.\nlocal beatIdx = data.b2LlBeats\nlocal hitAt = data.b2LlFirstAura + 11300 + beatIdx * 2500\ndata.b2LlBeats = data.b2LlBeats + (isAOE and 2 or 1)\nlocal dur = hitAt - Now() + 1500\nif dur < 3000 then dur = 12000 end\n\nlocal p = ent.pos\nlocal rec = { kind = isAOE and \"AOE\" or \"KB\", x = p.x, z = p.z, y = p.y,\n              order = data.b2LlCount, beatIdx = beatIdx,\n              -- Steelsforge knockback follows its circle by one beat.\n              hitAt = hitAt + (isAOE and 2500 or 0),\n              uuids = {}, texts = {} }\n\n-- Wait for both Steelsforge auras before announcing their order.\nif isAOE then\n    data.b2LlAOEOrders = data.b2LlAOEOrders or {}\n    data.b2LlAOEOrders[#data.b2LlAOEOrders + 1] = data.b2LlCount\n    if #data.b2LlAOEOrders == 2 and data.b2LlAOECalled == nil then\n        data.b2LlAOECalled = true\n        if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n            local W = { \"one\", \"two\", \"three\", \"four\", \"five\" }\n            local o1, o2 = data.b2LlAOEOrders[1], data.b2LlAOEOrders[2]\n            AnyoneCore.Shotcall(\"Circles on \" .. (W[o1] or o1) .. \" and \" .. (W[o2] or o2), true, 6)\n        end\n    end\nend\nif isAOE then\n    local red = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.25, 0.2, 0.45), 1)\n    rec.uuids[#rec.uuids + 1] = red:addTimedCircle(dur, p.x, p.y, p.z, 13)\nelse\n    local blue = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.3, 0.6, 1.0, 0.55), 2)\n    rec.uuids[#rec.uuids + 1] = blue:addTimedCircle(dur, p.x, p.y, p.z, 2)\nend\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n    local label = (isAOE and \"AOE \" or \"KB \") .. tostring(data.b2LlCount)\n    local col\n    if isAOE then\n        col = GUI:ColorConvertFloat4ToU32(1.0, 0.35, 0.3, 1.0)\n    else\n        col = GUI:ColorConvertFloat4ToU32(0.4, 0.7, 1.0, 1.0)\n    end\n    rec.texts[#rec.texts + 1] = AnyoneCore.addTimedWorldText(dur, label, { x = p.x, y = p.y + 2.0, z = p.z }, col, true, 1.3)\nend\ndata.b2LlSwords[a.entityID] = rec\nself.used = true\n",
						conditions = 
						{
							
							{
								"ada4555c-08ce-ba3a-937e-629898f2e77e",
								true,
							},
							
							{
								"f5c618ce-70aa-4bc3-99c6-282da3d2b95d",
								true,
							},
						},
						name = "SD - Predraw KB/AOE Swords",
						uuid = "e1d84d72-9dff-8de4-b0d6-f57e65c23316",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\nlocal aura = a.newActiveAura1\nif aura ~= 2942 and aura ~= 2943 and aura ~= 2944 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil or ent.contentid ~= 14825 then return end\n\nif data.b2Rings == nil or (data.b2RingLast ~= nil and TimeSince(data.b2RingLast) > 30000) then\n    data.b2Rings = {}\n    data.b2RingCount = 0\nend\nif data.b2Rings[a.entityID] ~= nil and data.b2Rings[a.entityID].stage ~= \"done\" then return end\ndata.b2RingLast = Now()\ndata.b2RingCount = data.b2RingCount + 1\n\nlocal R = { [2942] = 10, [2943] = 15, [2944] = 20 }\nlocal r = R[aura]\n-- Setup tells land ~4s before the spawn aura. A stale record is a\n-- leftover from an earlier set (setup events for THIS set may have\n-- been lost) - never trust it across sets.\nlocal ord = data.b2RingOrder and data.b2RingOrder[a.entityID]\nif ord ~= nil and ord.at ~= nil and TimeSince(ord.at) > 15000 then ord = nil end\n-- The idle-34 wipe is the r10 donut-first tell ONLY. On r15/r20 the\n-- real pose IDs (210/211) exist, so a 34-only record means the real\n-- pose event was lost - treat as no pose. A false donut call cuts an\n-- annulus from the overlay and paints the ring's center green over\n-- true chariot danger (live 2026-08-06 CS3).\nif ord ~= nil and ord.tell == \"idle34\" and r ~= 10 then\n    AnyoneCore.log(\"[B2 Cyclo] Ignoring idle-34 tell on r\" .. r .. \" ring (r10-only tell).\", 5)\n    ord = nil\nend\nlocal firstShape = ord ~= nil and ord.first or nil\nif ord ~= nil and ord.tell == \"idle34\" then\n    AnyoneCore.log(\"[B2 Cyclo] r10 donut tell (idle wipe at setup).\", 5)\nend\n-- Pose is persistent state on the entity (ent.action); events are\n-- lossy, the poll is not. Size in the pose ID must match the aura.\nlocal POSE = { [3604] = { r = 10, f = \"chariot\" }, [5896] = { r = 15, f = \"chariot\" },\n               [6847] = { r = 20, f = \"chariot\" }, [210] = { r = 15, f = \"donut\" },\n               [211] = { r = 20, f = \"donut\" } }\nlocal pp = POSE[ent.action] or POSE[ent.lastaction]\nlocal polled\nif pp ~= nil then\n    if pp.r == r then\n        polled = pp.f\n    else\n        AnyoneCore.log(\"[B2 Cyclo] Pose poll size mismatch (pose r\" .. pp.r .. \" on r\" .. r .. \" ring) - poll ignored.\", 5)\n    end\nelseif ent.action == 34 and r == 10 then\n    polled = \"donut\"\nend\nif polled ~= nil then\n    if firstShape ~= nil and firstShape ~= polled then\n        AnyoneCore.log(\"[B2 Cyclo] Pose poll (\" .. polled .. \") overrides event record (\" .. firstShape .. \").\", 5)\n    end\n    firstShape = polled\nend\nlocal donutFirst = firstShape == \"donut\"\nlocal p = ent.pos\n-- Fallback duration only - the second Spin's cleanup deletes shapes\n-- at set end. Must outlive the longest spawn->hit1 (CS3's staggered\n-- cascade reaches ~18.3s).\nlocal dur = 20000\n\nif data.b2RingHelpers == nil then\n    data.b2RingHelpers = true\n    data.b2RingWipe = function(rec)\n        if rec == nil then return end\n        for i = 1, #rec.shapes do Argus.deleteTimedShape(rec.shapes[i]) end\n        rec.shapes = {}\n        if rec.text ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n            AnyoneCore.removeTimedWorldText(rec.text)\n            rec.text = nil\n        end\n    end\n    -- Unknown order shows outlines of both possible shapes. staged =\n    -- CS3 queue: dim fill + queue label instead of \"now\".\n    data.b2RingDraw = function(rec, shape, ms, staged, ordn)\n        data.b2RingWipe(rec)\n        if shape == nil then\n            local amber = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.8, 0.2, 0.6), 2)\n            rec.shapes[#rec.shapes + 1] = amber:addTimedCircle(ms, rec.x, rec.y, rec.z, rec.r)\n            rec.shapes[#rec.shapes + 1] = amber:addTimedDonut(ms, rec.x, rec.y, rec.z, rec.r, rec.r + 1)\n            if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n                rec.text = AnyoneCore.addTimedWorldText(ms, \"?\", { x = rec.x, y = rec.y + 2.0, z = rec.z }, GUI:ColorConvertFloat4ToU32(1.0, 0.85, 0.3, 1.0), true, 1.6)\n            end\n            return\n        end\n        -- Kept soft to sit level with the rest of the profile's tints.\n        local red\n        if staged then\n            red = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.55, 0.2, 0.12), 1)\n        else\n            red = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, 0.30), 1)\n        end\n        if shape == \"chariot\" then\n            rec.shapes[#rec.shapes + 1] = red:addTimedCircle(ms, rec.x, rec.y, rec.z, rec.r)\n        else\n            rec.shapes[#rec.shapes + 1] = red:addTimedDonut(ms, rec.x, rec.y, rec.z, rec.r, 31)\n        end\n        if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n            local lbl = shape == \"chariot\" and \"OUT\" or \"IN\"\n            if staged then\n                lbl = lbl .. \" \" .. (ordn or \"later\")\n            else\n                -- Silent rings are called confidently; rec.assumed\n                -- stays internal so hit-1 validation and elimination\n                -- still correct a miss.\n                lbl = lbl .. \" now\"\n            end\n            rec.text = AnyoneCore.addTimedWorldText(ms, lbl, { x = rec.x, y = rec.y + 2.0, z = rec.z }, GUI:ColorConvertFloat4ToU32(1, 1, 1, 1), true, 1.3)\n        end\n    end\n    -- Find the post-flip point with the greatest clearance.\n    data.b2RingNext = function()\n        if data.b2NextShapes ~= nil then\n            for i = 1, #data.b2NextShapes do Argus.deleteTimedShape(data.b2NextShapes[i]) end\n            data.b2NextShapes = nil\n        end\n        if data.b2NextText ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n            AnyoneCore.removeTimedWorldText(data.b2NextText)\n            data.b2NextText = nil\n        end\n        local live = {}\n        for _, rec in pairs(data.b2Rings) do\n            if rec.stage == 1 or rec.stage == 2 then\n                live[#live + 1] = rec\n            end\n        end\n        -- The NEXT marker is only useful for multi-ring patterns.\n        if #live < 2 then return end\n        -- CS3 (staggered): NEXT = the FOLLOWING beat's pocket - the\n        -- active (earliest stage-1) ring's second shape plus the next\n        -- queued ring's first. Current stage-2 rings are done by then.\n        local minA, maxA\n        for i = 1, #live do\n            local t0 = live[i].auraAt or 0\n            if minA == nil or t0 < minA then minA = t0 end\n            if maxA == nil or t0 > maxA then maxA = t0 end\n        end\n        if (maxA - minA) > 1500 then\n            table.sort(live, function(x2, y2) return (x2.auraAt or 0) < (y2.auraAt or 0) end)\n            local A, B\n            for i = 1, #live do\n                if live[i].stage == 1 then\n                    if A == nil then A = live[i] elseif B == nil then B = live[i] end\n                end\n            end\n            local nx = {}\n            if A ~= nil then\n                nx[#nx + 1] = { x = A.x, y = A.y, z = A.z, r = A.r, second = A.second }\n            end\n            if B ~= nil then\n                nx[#nx + 1] = { x = B.x, y = B.y, z = B.z, r = B.r, second = B.first }\n            end\n            if #nx == 0 then return end\n            live = nx\n        end\n        for i = 1, #live do\n            -- Treat the factory pose as known until the first hit corrects it.\n            if live[i].second == nil then return end\n        end\n        -- Fine sampling is required for narrow safe pockets.\n        local cx, cz = 600.0, 703.975\n        local best, bestScore\n        for ri = 0, 19 do\n            local r = ri * 1.5\n            local steps = ri == 0 and 1 or 32\n            for ai = 0, steps - 1 do\n                local ang = ai * (2 * math.pi / steps)\n                local px = cx + r * math.sin(ang)\n                local pz = cz + r * math.cos(ang)\n                local score = 29.5 - r\n                for i = 1, #live do\n                    local rec = live[i]\n                    local dx, dz = px - rec.x, pz - rec.z\n                    local d = math.sqrt(dx * dx + dz * dz)\n                    local c\n                    if rec.second == \"chariot\" then\n                        c = d - rec.r\n                    else\n                        c = rec.r - d\n                    end\n                    if c < score then score = c end\n                end\n                if bestScore == nil or score > bestScore then\n                    bestScore = score\n                    best = { x = px, z = pz }\n                end\n            end\n        end\n        if best == nil or bestScore == nil or bestScore < 0.3 then\n            AnyoneCore.log(\"[B2 Cyclo] No shared safe position found.\", 5)\n            return\n        end\n        local y = live[1].y\n        local yellow = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.9, 0.2, 0.8), 2)\n        -- Set-end cleanup normally removes this first.\n        data.b2NextShapes = { yellow:addTimedCircle(25000, best.x, y, best.z, 1.5) }\n        if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n            data.b2NextText = AnyoneCore.addTimedWorldText(25000, \"NEXT\", { x = best.x, y = y + 1.6, z = best.z }, GUI:ColorConvertFloat4ToU32(1.0, 0.95, 0.4, 1.0), true, 1.3)\n        end\n    end\n    -- Ring-composition elimination REMOVED: a live set with 1\n    -- chariot-first + 2 donut-first exists (2026-08-06 CS3), so the\n    -- \"2 chariot + 1 donut\" invariant does not hold. Unknown rings\n    -- stay on the factory assumption; hit 1 corrects.\n    -- Build the shared safe overlay from all live rings.\n    data.b2RingOverlay = function()\n        if ArgusDrawsPlus == nil or ArgusDrawsPlus.getEnabled() ~= true\n            or Argus2 == nil or Argus2.getNextUnusedChannel == nil\n            or TensorCore.getStaticFlatDrawer == nil then return end\n        if data.b2SafeShapes ~= nil then\n            for i = 1, #data.b2SafeShapes do Argus.deleteTimedShape(data.b2SafeShapes[i]) end\n        end\n        data.b2SafeShapes = {}\n        local live = {}\n        for _, rec in pairs(data.b2Rings) do\n            if rec.stage == 1 or rec.stage == 2 then live[#live + 1] = rec end\n        end\n        if #live < 1 then return end\n        -- CS3 (staggered auras): shapes never coexist as damage - the\n        -- next beat's danger is the stage-2 rings plus only the\n        -- EARLIEST-activated stage-1 ring. CS2 (same-frame auras)\n        -- keeps the all-live intersection.\n        local minA, maxA\n        for i = 1, #live do\n            local t0 = live[i].auraAt or 0\n            if minA == nil or t0 < minA then minA = t0 end\n            if maxA == nil or t0 > maxA then maxA = t0 end\n        end\n        local staggered = (maxA - minA) > 1500\n        if staggered then\n            local danger = {}\n            local firstS1\n            for i = 1, #live do\n                local rec = live[i]\n                if rec.stage == 2 then\n                    danger[#danger + 1] = rec\n                elseif firstS1 == nil or (rec.auraAt or 0) < (firstS1.auraAt or 0) then\n                    firstS1 = rec\n                end\n            end\n            if firstS1 ~= nil then danger[#danger + 1] = firstS1 end\n            -- Restyle per-ring danger: active beat full (\"now\"),\n            -- queued rings dim with queue labels (stage-predraw rule).\n            table.sort(live, function(x2, y2) return (x2.auraAt or 0) < (y2.auraAt or 0) end)\n            local qn = 0\n            for i = 1, #live do\n                local rec = live[i]\n                local inSet = false\n                for j = 1, #danger do\n                    if danger[j] == rec then inSet = true break end\n                end\n                local shape = rec.stage == 1 and rec.first or rec.second\n                if inSet then\n                    data.b2RingDraw(rec, shape, 20000)\n                else\n                    qn = qn + 1\n                    data.b2RingDraw(rec, shape, 20000, true, qn == 1 and \"next\" or \"last\")\n                end\n            end\n            live = danger\n            if #live < 1 then return end\n        else\n            -- Only multi-ring patterns need the safe overlay.\n            if #live < 2 then return end\n        end\n        for i = 1, #live do\n            local shape = live[i].stage == 1 and live[i].first or live[i].second\n            -- Include rings using the factory pose assumption.\n            if shape == nil then return end\n        end\n        local channel = data.b2SafeChannel\n        if channel == nil then\n            channel = Argus2.getNextUnusedChannel(true)\n            if channel == nil then channel = 1 end\n            data.b2SafeChannel = channel\n        end\n        local green = 1493237504\n        local occ = Argus2.RenderFlags.FLAG_OCCLUDE\n        local cx, cz = 600.0, 703.975\n        local hy = live[1].y + 0.05\n        local ss = data.b2SafeShapes\n        -- Same fallback logic as the ring danger (cleanup owns removal).\n        local dur2 = 20000\n        local base = TensorCore.getStaticFlatDrawer(green, nil, channel)\n        ss[#ss + 1] = base:addTimedCircle(dur2, cx, hy, cz, 29.5, 0, false, true, 0)\n        local cut = TensorCore.getStaticFlatDrawer(green, nil, channel)\n        for i = 1, #live do\n            local rec = live[i]\n            local shape = rec.stage == 1 and rec.first or rec.second\n            if shape == \"chariot\" then\n                ss[#ss + 1] = cut:addTimedCircle(dur2, rec.x, hy, rec.z, rec.r, 0, false, false, occ)\n            else\n                ss[#ss + 1] = cut:addTimedDonut(dur2, rec.x, hy, rec.z, rec.r, 60, 0, false, false, occ)\n            end\n        end\n        -- Repaint danger shapes above the cutout overlay.\n        local ch2 = data.b2DangerChannel\n        if ch2 == nil then\n            ch2 = Argus2.getNextUnusedChannel(true)\n            if ch2 == nil then ch2 = channel + 1 end\n            data.b2DangerChannel = ch2\n        end\n        local redF = TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, 0.22), nil, ch2)\n        for i = 1, #live do\n            local rec = live[i]\n            local shape = rec.stage == 1 and rec.first or rec.second\n            if shape == \"chariot\" then\n                ss[#ss + 1] = redF:addTimedCircle(dur2, rec.x, hy, rec.z, rec.r, 0, false, true, 0)\n            else\n                ss[#ss + 1] = redF:addTimedDonut(dur2, rec.x, hy, rec.z, rec.r, 60, 0, false, true, 0)\n            end\n        end\n    end\nend\n\n-- Rings without a pose event use the factory chariot-first pose.\nlocal assumed = firstShape == nil\nlocal f1 = firstShape or \"chariot\"\nlocal rec = {\n    x = p.x, y = p.y, z = p.z, r = r,\n    first = f1,\n    second = f1 == \"donut\" and \"chariot\" or \"donut\",\n    assumed = assumed or nil,\n    stage = 1, shapes = {}, text = nil,\n    auraAt = Now(),\n}\ndata.b2Rings[a.entityID] = rec\ndata.b2RingDraw(rec, rec.first, dur)\ndata.b2RingOverlay()\ndata.b2RingNext()\nif assumed then\n    AnyoneCore.log(\"[B2 Cyclo] Pose unavailable; using default chariot-first order.\", 5)\nend\n\n-- Other actor state exposes ring size but not shape order.\n\n-- Only the centered single-ring pattern receives a callout.\nlocal ddx, ddz = p.x - 600.0, p.z - 703.975\nif firstShape ~= nil and ddx * ddx + ddz * ddz < 9 and AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n    AnyoneCore.Shotcall(donutFirst and \"Go in first, then out\" or \"Go out first, then in\", true, 6)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"ada4555c-08ce-ba3a-937e-629898f2e77e",
								true,
							},
							
							{
								"5a81308b-5131-8689-91e2-0a60aa99827e",
								true,
							},
						},
						name = "B2 - Cycloswords Rings",
						uuid = "43884502-d72a-842d-bbac-fee26f2c8440",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\nlocal aura = a.newActiveAura1\nif aura ~= 2890 and aura ~= 2891 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil or ent.contentid ~= 14722 then return end\n\nlocal cx, cz, cy = 0.0, -628.0, -684.0\ndata.idxPredict = data.idxPredict or {}\nif data.idxPredict[a.entityID] ~= nil then return end\n\nlocal spawnAng = math.atan2(ent.pos.x - cx, ent.pos.z - cz)\nlocal finAng = spawnAng - 1.0472\nlocal R = 15.55\nlocal fx = cx + R * math.sin(finAng)\nlocal fz = cz + R * math.cos(finAng)\ndata.idxPredict[a.entityID] = { x = fx, z = fz, aura = aura }\n\nlocal dur = 10400\nlocal red = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.35, 0.2, 0.45), 1)\nif aura == 2891 then\n    red:addTimedCircle(dur, fx, cy, fz, 10)\nelse\n    red:addTimedDonut(dur, fx, cy, fz, 4, 15)\nend\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n    AnyoneCore.addTimedWorldText(dur, aura == 2891 and \"AWAY\" or \"UNDER\",\n        { x = fx, y = cy + 2.0, z = fz }, GUI:ColorConvertFloat4ToU32(1, 1, 1, 1), true, 1.3)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"ada4555c-08ce-ba3a-937e-629898f2e77e",
								true,
							},
							
							{
								"db4948a2-6e67-f7e3-849e-8fd9bbcc851b",
								true,
							},
						},
						name = "B4 - Predict Orbs",
						uuid = "167f85d8-b67a-efee-a748-03cfc69dc2e2",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\nlocal W = { [2764] = \"BOW\", [2765] = \"SWORD\", [2766] = \"BELL\", [2767] = \"HARP\" }\nlocal w = W[a.newActiveAura1]\nif w == nil then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.contentid ~= 14717 then return end\n\n-- Separate glow sequences by their arrival gap.\nif data.idxQuad == nil or (data.idxQuadAt ~= nil and TimeSince(data.idxQuadAt) > 8000) then\n    data.idxQuad = { n = 0 }\nend\ndata.idxQuadAt = Now()\nlocal st = data.idxQuad\nst.n = st.n + 1\n\n-- Call the required movement rather than the weapon name.\nlocal CALL = {\n    SWORD = \"Sword, between platforms\",\n    BELL = \"Bell, on platforms\",\n    BOW = \"Bow, get in\",\n    HARP = \"Harp, out of middle\",\n}\n-- Standalone Bell/Bow glows remain ambiguous until their windup.\nlocal msg = CALL[w]\n-- The Quadrilogy flag resolves the first-glow ambiguity.\nlocal inQuad = data.idxQuadSetUntil ~= nil and Now() < data.idxQuadSetUntil\nif st.n == 1 and (w == \"HARP\" or w == \"BOW\") and not inQuad then\n    msg = nil\nend\n\n\nst.order = st.order or {}\nst.order[st.n] = w\n-- Stage the first safe spots once the sequence is unambiguous.\nif data.idxWeaponStage ~= nil and st.staged1 == nil then\n    local inQuadNow = data.idxQuadSetUntil ~= nil and Now() < data.idxQuadSetUntil\n    if st.n == 1 and inQuadNow then\n        st.staged1 = true\n        data.idxWeaponStage(w, 15000)\n    elseif st.n == 2 then\n        st.staged1 = true\n        data.idxWeaponStage(st.order[1], 12000)\n    end\nend\nif data.idxWeaponDraw == nil then\n    -- Platform and letter axes are offset by 60 degrees.\n    local cx, cz, cy = 0.0, -628.0, -684.0\n    local P = { 0.0, 2.0944, -2.0944 }\n    local L = { math.pi, 1.0472, -1.0472 }\n    local PLAT = { { x = -17.754, z = -638.25 }, { x = 17.754, z = -638.25 }, { x = 0.0, z = -607.5 } }\n    -- Active shapes are red; the next weapon is staged in amber.\n    -- Cone width follows the verified rendered result.\n    local function weaponShapes(d, wpn, ms, delay)\n        if wpn == \"HARP\" then\n            d:addTimedCircle(ms, cx, cy, cz, 16, delay)\n        elseif wpn == \"BOW\" then\n            for i = 1, 3 do d:addTimedCircle(ms, PLAT[i].x, cy, PLAT[i].z, 11, delay) end\n        elseif wpn == \"SWORD\" then\n            for i = 1, 3 do d:addTimedCone(ms, cx, cy, cz, 32, math.rad(60), P[i], delay) end\n        elseif wpn == \"BELL\" then\n            for i = 1, 3 do d:addTimedCone(ms, cx, cy, cz, 25, math.rad(60), L[i], delay) end\n        end\n    end\n    -- Draw explicit complements to avoid stacked overlay alpha.\n    local function weaponSafe(wpn, ms, delay)\n        if ArgusDrawsPlus == nil or ArgusDrawsPlus.getEnabled() ~= true\n            or Argus2 == nil or Argus2.getNextUnusedChannel == nil\n            or TensorCore.getStaticFlatDrawer == nil then return false end\n        -- Avoid duplicate layers during the active overlay window.\n        data.idxSafeShown = data.idxSafeShown or {}\n        local showAt = Now() + (delay or 0)\n        local prev = data.idxSafeShown[wpn]\n        if prev ~= nil and showAt >= prev.from - 200 and showAt <= prev.to then return true end\n        data.idxSafeShown[wpn] = { from = showAt, to = showAt + ms }\n        local ch = data.idxSafeChannel\n        if ch == nil then\n            ch = Argus2.getNextUnusedChannel(true)\n            if ch == nil then ch = 1 end\n            data.idxSafeChannel = ch\n        end\n        local ch2 = data.idxDangerChannel\n        if ch2 == nil then\n            ch2 = Argus2.getNextUnusedChannel(true)\n            if ch2 == nil then ch2 = ch + 1 end\n            data.idxDangerChannel = ch2\n        end\n        local hy = cy + 0.05\n        local g = TensorCore.getStaticFlatDrawer(1493237504, 0, ch)\n        local redF = TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, 0.32), 0, ch2)\n        if wpn == \"HARP\" then\n            -- Safe area: platform wedges outside the center circle.\n            for i = 1, 3 do\n                g:addTimedDonutCone(ms, cx, hy, cz, 16, 32, math.rad(60), P[i], delay, false, true, 0)\n            end\n            redF:addTimedCircle(ms, cx, hy, cz, 16, delay, false, true, 0)\n        elseif wpn == \"BOW\" then\n            -- Carve platform circles from one inscribed green donut.\n            local occ = Argus2.RenderFlags.FLAG_OCCLUDE\n            g:addTimedDonut(ms, cx, hy, cz, 3, 15.5, delay, false, true, 0)\n            for i = 1, 3 do\n                g:addTimedCircle(ms, PLAT[i].x, hy, PLAT[i].z, 11, delay, false, false, occ)\n                redF:addTimedCircle(ms, PLAT[i].x, hy, PLAT[i].z, 11, delay, false, true, 0)\n            end\n        elseif wpn == \"SWORD\" then\n            -- Safe area: letter wedges.\n            for i = 1, 3 do\n                g:addTimedCone(ms, cx, hy, cz, 15.5, math.rad(60), L[i], delay, false, true, 0)\n                redF:addTimedCone(ms, cx, hy, cz, 32, math.rad(60), P[i], delay, false, true, 0)\n            end\n        elseif wpn == \"BELL\" then\n            -- Safe area: platform wedges.\n            for i = 1, 3 do\n                g:addTimedCone(ms, cx, hy, cz, 32, math.rad(60), P[i], delay, false, true, 0)\n                redF:addTimedCone(ms, cx, hy, cz, 25, math.rad(60), L[i], delay, false, true, 0)\n            end\n        end\n        return true\n    end\n    -- Use world-space danger only when the flat overlay is unavailable.\n    data.idxWeaponDraw = function(wpn, ms, delay)\n        if not weaponSafe(wpn, ms, delay or 0) then\n            weaponShapes(TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, 0.45), 1), wpn, ms, delay or 0)\n        end\n    end\n    -- Standalone harp omits the safe overlay during Omni volleys.\n    data.idxWeaponRed = function(wpn, ms, delay)\n        weaponShapes(TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, 0.45), 1), wpn, ms, delay or 0)\n    end\n    data.idxWeaponStage = function(wpn, ms)\n        if data.idxNextTexts ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n            for i = 1, #data.idxNextTexts do AnyoneCore.removeTimedWorldText(data.idxNextTexts[i]) end\n        end\n        data.idxNextTexts = {}\n        if data.idxNextShapes ~= nil and Argus ~= nil and Argus.deleteTimedShape ~= nil then\n            for i = 1, #data.idxNextShapes do Argus.deleteTimedShape(data.idxNextShapes[i]) end\n        end\n        data.idxNextShapes = {}\n        if wpn == nil then return end\n        -- Never place safe markers in the arena-center hole.\n        local pts\n        if wpn == \"BOW\" or wpn == \"BELL\" then\n            pts = {}\n            for i = 1, 3 do\n                pts[#pts + 1] = { x = cx + 8 * math.sin(P[i]), z = cz + 8 * math.cos(P[i]) }\n            end\n        elseif wpn == \"SWORD\" then\n            pts = {}\n            \n            for i = 1, 3 do\n                pts[#pts + 1] = { x = cx + 8 * math.sin(L[i]), z = cz + 8 * math.cos(L[i]) }\n            end\n        else\n            pts = PLAT\n        end\n        -- Use large ground labels and a line to the nearest point.\n        local yellow = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.9, 0.2, 0.8), 2)\n        local me = TensorCore.mGetPlayer()\n        local nearest, nearD\n        for i = 1, #pts do\n            data.idxNextShapes[#data.idxNextShapes + 1] = yellow:addTimedCircle(ms, pts[i].x, cy, pts[i].z, 2.4)\n            data.idxNextShapes[#data.idxNextShapes + 1] = yellow:addTimedCircle(ms, pts[i].x, cy, pts[i].z, 0.8)\n            if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n                data.idxNextTexts[#data.idxNextTexts + 1] = AnyoneCore.addTimedWorldText(ms, \"NEXT\",\n                    { x = pts[i].x, y = cy + 1.8, z = pts[i].z },\n                    GUI:ColorConvertFloat4ToU32(1.0, 0.95, 0.4, 1.0), true, 2.6)\n            end\n            if me ~= nil and me.pos ~= nil then\n                local dd = (me.pos.x - pts[i].x) ^ 2 + (me.pos.z - pts[i].z) ^ 2\n                if nearD == nil or dd < nearD then nearest, nearD = pts[i], dd end\n            end\n        end\n        if nearest ~= nil and Argus2 ~= nil and Argus2.addTimedRectFilled ~= nil then\n            local lc = GUI:ColorConvertFloat4ToU32(1.0, 0.9, 0.2, 0.22)\n            data.idxNextShapes[#data.idxNextShapes + 1] = Argus2.addTimedRectFilled(\n                ms, nearest.x, cy + 0.05, nearest.z, 50, 0.6, 0, lc, lc, lc,\n                0, nil, me.id, false, nil, nil, nil, nil, nil, false, false, 0, false, 0)\n        end\n    end\nend\nif st.n == 4 and st.order[1] ~= nil then\n    -- Roll active and staged shapes through the weapon schedule.\n    local EST = { 5350, 8600, 11900, 15100 }\n    for k = 1, 4 do\n        if st.order[k] ~= nil then\n            data.idxWeaponDraw(st.order[k], 3100, EST[k] - 2600)\n        end\n    end\n    st.windN = 1\nend\n\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n    -- Show movement actions on the center order board.\n    local ACT = { HARP = \"OUT OF MID\", SWORD = \"BETWEEN PLATS\", BELL = \"ON PLATS\", BOW = \"IN MID\" }\n    local lbl = ACT[w]\n    if st.n == 1 and (w == \"HARP\" or w == \"BOW\")\n        and not (data.idxQuadSetUntil ~= nil and Now() < data.idxQuadSetUntil) then\n        lbl = w\n    end\n    local handle = AnyoneCore.addTimedWorldText(15500, tostring(st.n) .. \"  \" .. lbl,\n        { x = 0.0, y = -684.0 + 4.0 - 1.2 * st.n, z = -628.0 },\n        GUI:ColorConvertFloat4ToU32(1, 1, 1, 1), true, 1.15)\n    if lbl == w then\n        -- Retain an ambiguous first slot for later promotion.\n        st.boardPending = { handle = handle, w = w }\n    elseif st.n >= 2 and st.boardPending ~= nil then\n        -- A second glow confirms Quadrilogy and resolves slot one.\n        if AnyoneCore.removeTimedWorldText ~= nil then\n            AnyoneCore.removeTimedWorldText(st.boardPending.handle)\n        end\n        AnyoneCore.addTimedWorldText(12500, \"1  \" .. ACT[st.boardPending.w],\n            { x = 0.0, y = -684.0 + 4.0 - 1.2, z = -628.0 },\n            GUI:ColorConvertFloat4ToU32(1, 1, 1, 1), true, 1.15)\n        st.boardPending = nil\n    end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"ada4555c-08ce-ba3a-937e-629898f2e77e",
								true,
							},
							
							{
								"086638e9-2517-f401-ab93-792078189996",
								true,
							},
						},
						name = "B4 - Quadrilogy Glows",
						uuid = "0fa1f00a-3ce1-4b4f-af74-e0f69af92c4b",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1346,
						},
						name = "North Horn",
						uuid = "ada4555c-08ce-ba3a-937e-629898f2e77e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.newActiveAura1 == 2993 or eventArgs.newActiveAura1 == 3052)",
						dequeueIfLuaFalse = true,
						name = "Sword KB/AOE Aura",
						uuid = "f5c618ce-70aa-4bc3-99c6-282da3d2b95d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.newActiveAura1 == 2942 or eventArgs.newActiveAura1 == 2943 or eventArgs.newActiveAura1 == 2944)",
						dequeueIfLuaFalse = true,
						name = "Cycloswords Ring Aura",
						uuid = "5a81308b-5131-8689-91e2-0a60aa99827e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.newActiveAura1 == 2890 or eventArgs.newActiveAura1 == 2891)",
						dequeueIfLuaFalse = true,
						name = "Index Predict Orb Aura",
						uuid = "db4948a2-6e67-f7e3-849e-8fd9bbcc851b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and eventArgs.newActiveAura1 ~= nil and eventArgs.newActiveAura1 >= 2764 and eventArgs.newActiveAura1 <= 2767",
						dequeueIfLuaFalse = true,
						name = "Index Quadrilogy Glow Auras",
						uuid = "086638e9-2517-f401-ab93-792078189996",
						version = 3,
					},
				},
			},
			eventType = 25,
			name = "[FTM Normal] B2 + Index Predict Auras",
			uuid = "0a41f09a-9c3b-2401-aecd-244a3c5e2d79",
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
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\n-- Resolve content ID from the entity when absent from the payload.\nlocal mcid = a.entityContentID\nif mcid == nil then\n    local me = TensorCore.mGetEntity(a.entityID)\n    mcid = me ~= nil and me.contentid or nil\nend\nif mcid ~= 2015283 then return end\nif a.a2 ~= 1 then return end\nlocal cx, cz = 600.0, 703.975\nlocal QU = math.pi / 4\n\nif data.b2SdMarks == nil or (data.b2SdMarksAt ~= nil and TimeSince(data.b2SdMarksAt) > 20000) then\n    data.b2SdMarks = { n = 0, axes = {}, seen = {} }\n    data.b2DancePre = nil\n    data.b2DancePreTexts = nil\nend\ndata.b2SdMarksAt = Now()\nlocal st = data.b2SdMarks\nif st.seen[a.entityID] then return end\nst.seen[a.entityID] = true\n\nlocal ent = TensorCore.mGetEntity(a.entityID)\nlocal h = ent ~= nil and ent.pos ~= nil and ent.pos.h or nil\nif h == nil then\n    if AnyoneCore ~= nil and AnyoneCore.log ~= nil then\n        AnyoneCore.log(\"[Sword Dance] Ground mark entity unavailable.\", 5)\n    end\n    return\nend\nlocal player = TensorCore.mGetPlayer()\nlocal py = player ~= nil and player.pos ~= nil and player.pos.y or -674.0\n\nst.n = st.n + 1\nlocal n = st.n\nif n > 4 then return end\nlocal hm = h % math.pi\nlocal axis = math.floor(hm / QU + 0.5) % 4\nst.axes[n] = axis\n\ndata.b2DancePre = data.b2DancePre or {}\ndata.b2DancePreTexts = data.b2DancePreTexts or {}\nlocal pre, preTexts = data.b2DancePre, data.b2DancePreTexts\n\n-- Label both ends of each lane axis.\nlocal labelDur = 8300 + 600 * n\nlocal lcol = GUI:ColorConvertFloat4ToU32(1, 1, 1, 1)\nif n == 1 then lcol = GUI:ColorConvertFloat4ToU32(1, 0.5, 0.4, 1) end\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n    local ang = axis * QU\n    for _, s in ipairs({ 1, -1 }) do\n        preTexts[#preTexts + 1] = AnyoneCore.addTimedWorldText(labelDur, tostring(n),\n            { x = cx + s * 12 * math.sin(ang), y = py + 1.5, z = cz + s * 12 * math.cos(ang) },\n            lcol, true, 1.3)\n    end\nend\n\nif n == 1 then\n    -- Predraw the first slash.\n    local red = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, 0.30), 1)\n    pre[#pre + 1] = red:addTimedCenteredRect(9200, cx, py, cz, 60, 20, h)\nend\n\n-- Three distinct axes determine the fourth.\nlocal commit\nif n == 3 then\n    local forced = 6 - (st.axes[1] + st.axes[2] + st.axes[3])\n    if forced >= 0 and forced <= 3 then\n        st.predicted4 = forced\n        st.axes[4] = forced\n        commit = true\n    end\nelseif n == 4 then\n    if st.predicted4 ~= nil and st.predicted4 ~= axis then\n        if AnyoneCore ~= nil and AnyoneCore.log ~= nil then\n            AnyoneCore.log(\"[Sword Dance] Lane order updated.\", 5)\n        end\n        st.axes[4] = axis -- Replace an incorrect prediction.\n        commit = true\n    elseif st.predicted4 == nil then\n        st.axes[4] = axis\n        commit = true\n    end\nend\nif commit == nil then\n    self.used = true\n    return\nend\n\n-- Choose the latest lane adjacent to lane one.\nlocal startLane = 4\nif (st.axes[4] - st.axes[1]) % 4 == 2 then startLane = 3 end\n\n-- Mark the initial stand lane.\nlocal a4 = st.axes[startLane] * QU\nlocal a1 = st.axes[1] * QU\nlocal cyan = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.15, 0.75, 1.0, 0.30), 1)\npre[#pre + 1] = cyan:addTimedCenteredRect(12000, cx, py, cz, 60, 20, a4)\n\n-- Snap route points to nearby waymarks.\nlocal R = 16\nlocal function axisEnd(ang, sign)\n    local dirAng = sign > 0 and ang or (ang + math.pi)\n    local dirx, dirz = math.sin(dirAng), math.cos(dirAng)\n    local ex, ez = cx + R * dirx, cz + R * dirz\n    local name\n    if data.lib ~= nil then\n        local n, mx, mz = data.lib.markNearDir(cx, cz, dirx, dirz, math.rad(15), 60, true)\n        if n ~= nil then name, ex, ez = n, mx, mz end\n    end\n    if name == nil and data.lib ~= nil then\n        name = data.lib.compassFromDir(dirx, dirz)\n    end\n    if name == nil then name = \"unknown\" end\n    return { x = ex, z = ez, name = name }\nend\n-- Draw both symmetric routes and call the nearest one.\nlocal dodgePairs = {}\nfor _, s4 in ipairs({ 1, -1 }) do\n    local sE = axisEnd(a4, s4)\n    local mBest, mD\n    for _, s1 in ipairs({ 1, -1 }) do\n        local mE = axisEnd(a1, s1)\n        local dd = (sE.x - mE.x) ^ 2 + (sE.z - mE.z) ^ 2\n        if mD == nil or dd < mD then mBest, mD = mE, dd end\n    end\n    local d = 0\n    if player ~= nil and player.pos ~= nil then\n        d = (player.pos.x - sE.x) ^ 2 + (player.pos.z - sE.z) ^ 2\n    end\n    dodgePairs[#dodgePairs + 1] = { s = sE, m = mBest, d = d }\nend\ntable.sort(dodgePairs, function(x, y) return x.d < y.d end)\n-- Route markers outlive the first-lane cleanup.\nlocal dur = 13000\nlocal green = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.1, 1.0, 0.25, 0.7), 2)\nfor i = 1, #dodgePairs do\n    local pr = dodgePairs[i]\n    green:addTimedCircle(dur, pr.s.x, py, pr.s.z, 1.8)\n    green:addTimedCircle(dur, pr.m.x, py, pr.m.z, 1.2)\n    if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n        AnyoneCore.addTimedWorldText(dur, \"START\",\n            { x = pr.s.x, y = py + 1.6, z = pr.s.z }, GUI:ColorConvertFloat4ToU32(0.3, 1.0, 0.4, 1.0), true, 1.5)\n        AnyoneCore.addTimedWorldText(dur, \"THEN\",\n            { x = pr.m.x, y = py + 1.6, z = pr.m.z }, GUI:ColorConvertFloat4ToU32(0.3, 1.0, 0.4, 1.0), true, 1.2)\n    end\nend\nif dodgePairs[1] ~= nil and AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n    AnyoneCore.Shotcall(\"Start \" .. dodgePairs[1].s.name .. \", into \" .. dodgePairs[1].m.name, true, 8)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"271dc76b-ec2e-2982-9391-ed03b599f5f6",
								true,
							},
							
							{
								"0fc1a2e6-3193-6c41-bfee-2b644e3a59b3",
								true,
							},
						},
						name = "B2 - Sword Dance Marks",
						uuid = "7f1352fc-7c23-ac6e-aef2-9af69b3c2a35",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1346,
						},
						name = "North Horn",
						uuid = "271dc76b-ec2e-2982-9391-ed03b599f5f6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local e = eventArgs ~= nil and eventArgs.entityID ~= nil and TensorCore.mGetEntity(eventArgs.entityID) or nil return e ~= nil and e.contentid == 2015283",
						dequeueIfLuaFalse = true,
						name = "Sword Dance Ground Marks",
						uuid = "0fc1a2e6-3193-6c41-bfee-2b644e3a59b3",
						version = 3,
					},
				},
			},
			eventType = 19,
			name = "[FTM Normal] Sword Dance Objects",
			uuid = "3450e014-4d86-76cf-8397-98cfcd4041f1",
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
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\n-- Resolve content ID from the entity when absent from the payload.\nlocal cid = a.entityContentID\nif cid == nil then\n    local e = TensorCore.mGetEntity(a.entityID)\n    cid = e ~= nil and e.contentid or nil\nend\nif cid == nil then return end\nlocal POINTER = { [2015240] = \"FIRE\", [2015241] = \"ICE\", [2015242] = \"LIGHTNING\" }\nlocal RING = { [2015243] = \"FIRE\", [2015244] = \"ICE\", [2015245] = \"LIGHTNING\" }\nif POINTER[cid] == nil and RING[cid] == nil then return end\nlocal cx, cz, cy = 0.0, -628.0, -684.0\n\nif data.idxOmni == nil or (data.idxOmniAt ~= nil and TimeSince(data.idxOmniAt) > 45000) then\n    data.idxOmni = { dirs = {}, ringN = 0, seen = {} }\nend\ndata.idxOmniAt = Now()\nlocal st = data.idxOmni\n\nlocal COLOR = {\n    FIRE = { 1.0, 0.35, 0.15 },\n    ICE = { 0.35, 0.75, 1.0 },\n    LIGHTNING = { 1.0, 0.9, 0.2 },\n}\n\nif POINTER[cid] ~= nil then\n    if a.a2 ~= nil and a.a2 ~= 1 then return end\n    local ent = TensorCore.mGetEntity(a.entityID)\n    local h = ent ~= nil and ent.pos ~= nil and ent.pos.h or nil\n    if h == nil then return end\n    local elem = POINTER[cid]\n    st.dirs[elem] = h\n    -- Label both ends of each element axis.\n    if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n        local c = COLOR[elem]\n        for _, sgn in ipairs({ 1, -1 }) do\n            AnyoneCore.addTimedWorldText(24000, elem,\n                { x = cx + sgn * 10 * math.sin(h), y = cy + 2.0, z = cz + sgn * 10 * math.cos(h) },\n                GUI:ColorConvertFloat4ToU32(c[1], c[2], c[3], 1), true, 1.5)\n        end\n    end\n    self.used = true\n    return\nend\n\n-- The second-ring gap distinguishes sequential and paired patterns.\nlocal elem = RING[cid]\nif data.idxOmniGuide == nil then\n    -- Replace the previous danger pair at the requested opacity.\n    data.idxOmniPair = function(rec2, alpha)\n        if rec2 == nil or rec2.h == nil then return end\n        if rec2.shapes ~= nil and Argus ~= nil and Argus.deleteTimedShape ~= nil then\n            for i = 1, #rec2.shapes do Argus.deleteTimedShape(rec2.shapes[i]) end\n        end\n        rec2.shapes = {}\n        -- Show order only for the imminent and next pairs.\n        if rec2.texts ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n            for i = 1, #rec2.texts do AnyoneCore.removeTimedWorldText(rec2.texts[i]) end\n        end\n        rec2.texts = {}\n        if rec2.n ~= nil and rec2.c ~= nil and AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n            for _, sgn in ipairs({ 1, -1 }) do\n                rec2.texts[#rec2.texts + 1] = AnyoneCore.addTimedWorldText(7500, tostring(rec2.n),\n                    { x = cx + sgn * 10 * math.sin(rec2.h), y = cy + 3.6, z = cz + sgn * 10 * math.cos(rec2.h) },\n                    GUI:ColorConvertFloat4ToU32(rec2.c[1], rec2.c[2], rec2.c[3], 1), true, 1.8)\n            end\n        end\n        if ArgusDrawsPlus ~= nil and ArgusDrawsPlus.getEnabled() == true\n            and TensorCore.getStaticFlatDrawer ~= nil\n            and Argus2 ~= nil and Argus2.getNextUnusedChannel ~= nil then\n            local ch2 = data.idxDangerChannel\n            if ch2 == nil then\n                ch2 = Argus2.getNextUnusedChannel(true)\n                if ch2 == nil then ch2 = 1 end\n                data.idxDangerChannel = ch2\n            end\n            local dr = TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, alpha), 0, ch2)\n            rec2.shapes[#rec2.shapes + 1] = dr:addTimedCone(7500, cx, cy + 0.05, cz, 30, math.rad(60), rec2.h, 0, false, true, 0)\n            rec2.shapes[#rec2.shapes + 1] = dr:addTimedCone(7500, cx, cy + 0.05, cz, 30, math.rad(60), rec2.h + math.pi, 0, false, true, 0)\n        else\n            local d = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, alpha + 0.13), 1)\n            rec2.shapes[#rec2.shapes + 1] = d:addTimedCone(7500, cx, cy, cz, 30, math.rad(60), rec2.h)\n            rec2.shapes[#rec2.shapes + 1] = d:addTimedCone(7500, cx, cy, cz, 30, math.rad(60), rec2.h + math.pi)\n        end\n    end\n    -- Mark both axis ends unless the route selects one.\n    data.idxOmniGuide = function(st2, targetElem, label, endAng)\n        if st2.guideTexts ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n            for i = 1, #st2.guideTexts do AnyoneCore.removeTimedWorldText(st2.guideTexts[i]) end\n        end\n        st2.guideTexts = {}\n        if AnyoneCore == nil or AnyoneCore.addTimedWorldText == nil then return end\n        local angs\n        if endAng ~= nil then\n            angs = { endAng }\n        else\n            local h = st2.dirs[targetElem]\n            if h == nil then return end\n            angs = { h, h + math.pi }\n        end\n        for _, ang in ipairs(angs) do\n            st2.guideTexts[#st2.guideTexts + 1] = AnyoneCore.addTimedWorldText(14000, label,\n                { x = cx + 13 * math.sin(ang), y = cy + 1.6, z = cz + 13 * math.cos(ang) },\n                GUI:ColorConvertFloat4ToU32(0.3, 1.0, 0.4, 1.0), true, 1.5)\n        end\n    end\nend\nif a.a2 == 3 then\n    -- Clean the resolved pair and advance the route.\n    local rec = st.seen[a.entityID]\n    if rec ~= nil then\n        if rec.texts ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n            for i = 1, #rec.texts do AnyoneCore.removeTimedWorldText(rec.texts[i]) end\n            rec.texts = nil\n        end\n        if rec.shapes ~= nil and Argus ~= nil and Argus.deleteTimedShape ~= nil then\n            for i = 1, #rec.shapes do Argus.deleteTimedShape(rec.shapes[i]) end\n            rec.shapes = nil\n        end\n    end\n    local cl = st.cluster\n    if cl ~= nil then\n        cl.boomN = (cl.boomN or 0) + 1\n        -- Promote only the next two sequential pairs.\n        if cl.v2 ~= true and cl.recs ~= nil and data.idxOmniPair ~= nil then\n            data.idxOmniPair(cl.recs[cl.boomN + 1], 0.32)\n            data.idxOmniPair(cl.recs[cl.boomN + 2], 0.14)\n        end\n        -- Announce the next paired volley's safe element.\n        if cl.riders ~= nil and cl.boomN < 3 and AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n            local nr, ng = cl.riders[cl.boomN + 1], cl.seq[cl.boomN + 1]\n            if nr ~= nil and ng ~= nil then\n                local safe\n                for _, e in ipairs({ \"FIRE\", \"ICE\", \"LIGHTNING\" }) do\n                    if e ~= nr and e ~= ng then safe = e end\n                end\n                if safe ~= nil then\n                    AnyoneCore.Shotcall(\"Move counterclockwise, \" .. safe, true, 7)\n                    data.idxOmniSafeCall = { e = safe, at = Now() }\n                    data.idxOmniGuide(st, safe, \"GO \" .. safe)\n                end\n            end\n        end\n        if cl.plan ~= nil then\n            -- Move when the destination clears.\n            for i = 1, #cl.plan do\n                local hop = cl.plan[i]\n                if hop.moveSlot == cl.boomN then\n                    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n                        AnyoneCore.Shotcall(\"Move \" .. hop.to .. \" now\", true, 7)\n                    end\n                    data.idxOmniSafeCall = { e = hop.to, at = Now() }\n                    data.idxOmniGuide(st, hop.to, \"GO \" .. hop.to, hop.endAng)\n                    -- Preview the following hop.\n                    local nxt = cl.plan[i + 1]\n                    if nxt ~= nil and nxt.endAng ~= nil and AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n                        st.guideTexts[#st.guideTexts + 1] = AnyoneCore.addTimedWorldText(14000, \"THEN \" .. nxt.to,\n                            { x = cx + 13 * math.sin(nxt.endAng), y = cy + 1.6, z = cz + 13 * math.cos(nxt.endAng) },\n                            GUI:ColorConvertFloat4ToU32(0.3, 1.0, 0.4, 1.0), true, 1.5)\n                    end\n                end\n            end\n        end\n        -- Flush a deferred Predict personal call (TTS + GO texts)\n        -- once no route moves remain - it then lands right after\n        -- the final move call.\n        if data.idxRingDefer ~= nil and data.idxRingGo ~= nil then\n            local rem = false\n            if cl.plan ~= nil then\n                for i = 1, #cl.plan do\n                    if (cl.plan[i].moveSlot or 0) > cl.boomN then rem = true end\n                end\n            end\n            if not rem then\n                data.idxRingGo(data.idxRingDefer)\n                data.idxRingDefer = nil\n            end\n        end\n    end\n    self.used = true\n    return\nend\nif a.a2 ~= nil and a.a2 ~= 1 then return end\nif st.seen[a.entityID] ~= nil then return end\n-- Separate clusters by ring-spawn gaps.\nif st.cluster == nil or (st.lastRing ~= nil and TimeSince(st.lastRing) > 10000) then\n    st.cluster = { seq = {}, boomN = 0 }\n    if st.guideTexts ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n        for i = 1, #st.guideTexts do AnyoneCore.removeTimedWorldText(st.guideTexts[i]) end\n        st.guideTexts = nil\n    end\nend\nlocal cl = st.cluster\n-- Ignore repeated events and rings beyond the six-slot pattern.\ncl.lastElemAt = cl.lastElemAt or {}\nif cl.lastElemAt[elem] ~= nil and TimeSince(cl.lastElemAt[elem]) < 2000 then return end\ncl.lastElemAt[elem] = Now()\nlocal prevRing = st.lastRing\nst.lastRing = Now()\nlocal n\nif cl.filled6 == true and #cl.seq == 6 then\n    -- Reconcile the physical sixth ring with the inferred slot.\n    cl.filled6 = nil\n    n = 6\n    if cl.seq[6] ~= elem then\n        AnyoneCore.log(\"[IDX Omni] Final ring prediction changed; correcting order.\", 5)\n        cl.seq[6] = elem\n    end\nelseif #cl.seq >= 6 then\n    AnyoneCore.log(\"[IDX Omni] Extra ring event ignored.\", 5)\n    return\nelse\n    cl.seq[#cl.seq + 1] = elem\n    n = #cl.seq\nend\nif n == 2 and prevRing ~= nil then\n    -- Short gaps are sequential; long gaps are paired.\n    cl.v2 = TimeSince(prevRing) > 3000\nend\nlocal rec = { shapes = {} }\nst.seen[a.entityID] = rec\n\nlocal h = st.dirs[elem]\nif h ~= nil then\n    local c = COLOR[elem]\n    rec.texts = {}\n    rec.n = n\n    rec.c = c\n    -- Sequential patterns show only the imminent and next pairs.\n    rec.h = h\n    cl.recs = cl.recs or {}\n    cl.recs[n] = rec\n    if data.idxOmniPair ~= nil then\n        if cl.v2 == true or n == 1 then\n            data.idxOmniPair(rec, 0.32)\n        elseif n == 2 then\n            data.idxOmniPair(rec, 0.14)\n        end\n    end\nelse\n    AnyoneCore.log(\"[IDX Omni] Pointer direction unavailable for \" .. elem .. \".\", 5)\nend\n\n-- Pair each ring with the matching pinwheel rider.\nlocal o2 = data.idxOmni2\nif o2 ~= nil and o2.riders ~= nil and TimeSince(o2.at) < 30000 then\n    cl.v2 = true\n    cl.riders = o2.riders\nend\nif cl.riders ~= nil and AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n    local safe\n    for _, e in ipairs({ \"FIRE\", \"ICE\", \"LIGHTNING\" }) do\n        if e ~= cl.riders[n] and e ~= elem then safe = e end\n    end\n    if n == 1 and safe ~= nil then\n        AnyoneCore.Shotcall(\"Start \" .. safe, true, 7)\n        data.idxOmniSafeCall = { e = safe, at = Now() }\n        data.idxOmniGuide(st, safe, \"START\")\n    end\n\nend\n\n-- Build the sequential movement route.\nif cl.v2 ~= true then\n    if n == 3 then\n        -- Start on the element whose first explosion is latest.\n        local seen3 = {}\n        for i = 1, 3 do seen3[cl.seq[i]] = true end\n        local startE = elem\n        for _, e in ipairs({ \"FIRE\", \"ICE\", \"LIGHTNING\" }) do\n            if not seen3[e] then startE = e end\n        end\n        cl.startElem = startE\n        if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n            AnyoneCore.Shotcall(\"Start \" .. startE, true, 7)\n        end\n        data.idxOmniSafeCall = { e = startE, at = Now() }\n        data.idxOmniGuide(st, startE, \"START\")\n    elseif n == 5 then\n        -- Infer the sixth ring from the two-per-element invariant.\n        local count = { FIRE = 0, ICE = 0, LIGHTNING = 0 }\n        for i = 1, 5 do count[cl.seq[i]] = count[cl.seq[i]] + 1 end\n        for _, e in ipairs({ \"FIRE\", \"ICE\", \"LIGHTNING\" }) do\n            if count[e] < 2 then cl.seq[6] = e cl.filled6 = true end\n        end\n        if cl.seq[6] == nil then\n            AnyoneCore.log(\"[IDX Omni] Invalid element distribution.\", 5)\n        else\n            local seq = cl.seq\n            local function nextBoom(e, after)\n                for k = after + 1, 6 do if seq[k] == e then return k end end\n                return 99\n            end\n            local plan = {}\n            local cur = cl.startElem or seq[3]\n            local hopAt = nextBoom(cur, 0)\n            while hopAt <= 6 do\n                local best, bestNext\n                for _, e in ipairs({ \"FIRE\", \"ICE\", \"LIGHTNING\" }) do\n                    if e ~= seq[hopAt] and e ~= cur then\n                        local nb = nextBoom(e, hopAt)\n                        if bestNext == nil or nb > bestNext then best, bestNext = e, nb end\n                    end\n                end\n                if best == nil then break end\n                plan[#plan + 1] = { slot = hopAt, to = best }\n                cur = best\n                hopAt = nextBoom(best, hopAt)\n            end\n            cl.plan = plan\n            -- Chain adjacent endpoints and move as each destination clears.\n            local me = TensorCore.mGetPlayer()\n            local prevAng\n            if me ~= nil and me.pos ~= nil then\n                prevAng = math.atan2(me.pos.x - cx, me.pos.z - cz)\n            end\n            local function nearestEnd(e2, ref)\n                local hh = st.dirs[e2]\n                if hh == nil then return nil end\n                if ref == nil then return hh end\n                local function ad(x)\n                    return math.abs((x - ref + math.pi) % (2 * math.pi) - math.pi)\n                end\n                if ad(hh) <= ad(hh + math.pi) then return hh end\n                return hh + math.pi\n            end\n            local words = {}\n            for i = 1, #plan do\n                local hop = plan[i]\n                local legal\n                for k = 1, hop.slot - 1 do\n                    if seq[k] == hop.to then legal = k end\n                end\n                hop.moveSlot = legal or (hop.slot - 1)\n                hop.endAng = nearestEnd(hop.to, prevAng)\n                prevAng = hop.endAng or prevAng\n                words[#words + 1] = hop.to\n            end\n            -- Bias adjacent stands toward their shared boundary.\n            if plan[2] ~= nil and plan[1].endAng ~= nil and plan[2].endAng ~= nil then\n                local dd = (plan[2].endAng - plan[1].endAng + math.pi) % (2 * math.pi) - math.pi\n                local sgn = dd >= 0 and 1 or -1\n                plan[1].endAng = plan[1].endAng + sgn * 0.31\n                plan[2].endAng = plan[2].endAng - sgn * 0.31\n            end\n            if #words > 0 and AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n                AnyoneCore.Shotcall(\"Then \" .. table.concat(words, \", then \"), true, 6)\n            end\n            if plan[1] ~= nil then\n                data.idxOmniGuide(st, plan[1].to, \"THEN \" .. plan[1].to, plan[1].endAng)\n            end\n        end\n    end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"79745439-5d4a-d2f1-a5a1-085de79445fb",
								true,
							},
							
							{
								"aad1a82a-b946-dce0-91e5-e97268b08385",
								true,
							},
						},
						name = "B4 - Omni Elements 2",
						uuid = "f1930bec-133d-7ca6-a816-d4ba6f51bd07",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\n-- Resolve content ID from the entity when absent from the payload.\nlocal mcid = a.entityContentID\nif mcid == nil then\n    local me = TensorCore.mGetEntity(a.entityID)\n    mcid = me ~= nil and me.contentid or nil\nend\nif mcid ~= 2015283 then return end\nif a.a2 ~= 1 then return end\nlocal cx, cz = 600.0, 703.975\nlocal QU = math.pi / 4\n\nif data.b2SdMarks == nil or (data.b2SdMarksAt ~= nil and TimeSince(data.b2SdMarksAt) > 20000) then\n    data.b2SdMarks = { n = 0, axes = {}, seen = {} }\n    data.b2DancePre = nil\n    data.b2DancePreTexts = nil\nend\ndata.b2SdMarksAt = Now()\nlocal st = data.b2SdMarks\nif st.seen[a.entityID] then return end\nst.seen[a.entityID] = true\n\nlocal ent = TensorCore.mGetEntity(a.entityID)\nlocal h = ent ~= nil and ent.pos ~= nil and ent.pos.h or nil\nif h == nil then\n    if AnyoneCore ~= nil and AnyoneCore.log ~= nil then\n        AnyoneCore.log(\"[Sword Dance] Ground mark entity unavailable.\", 5)\n    end\n    return\nend\nlocal player = TensorCore.mGetPlayer()\nlocal py = player ~= nil and player.pos ~= nil and player.pos.y or -674.0\n\nst.n = st.n + 1\nlocal n = st.n\nif n > 4 then return end\nlocal hm = h % math.pi\nlocal axis = math.floor(hm / QU + 0.5) % 4\nst.axes[n] = axis\n\ndata.b2DancePre = data.b2DancePre or {}\ndata.b2DancePreTexts = data.b2DancePreTexts or {}\nlocal pre, preTexts = data.b2DancePre, data.b2DancePreTexts\n\n-- Label both ends of each lane axis.\nlocal labelDur = 8300 + 600 * n\nlocal lcol = GUI:ColorConvertFloat4ToU32(1, 1, 1, 1)\nif n == 1 then lcol = GUI:ColorConvertFloat4ToU32(1, 0.5, 0.4, 1) end\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n    local ang = axis * QU\n    for _, s in ipairs({ 1, -1 }) do\n        preTexts[#preTexts + 1] = AnyoneCore.addTimedWorldText(labelDur, tostring(n),\n            { x = cx + s * 12 * math.sin(ang), y = py + 1.5, z = cz + s * 12 * math.cos(ang) },\n            lcol, true, 1.3)\n    end\nend\n\nif n == 1 then\n    -- Predraw the first slash.\n    local red = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, 0.30), 1)\n    pre[#pre + 1] = red:addTimedCenteredRect(9200, cx, py, cz, 60, 20, h)\nend\n\n-- Three distinct axes determine the fourth.\nlocal commit\nif n == 3 then\n    local forced = 6 - (st.axes[1] + st.axes[2] + st.axes[3])\n    if forced >= 0 and forced <= 3 then\n        st.predicted4 = forced\n        st.axes[4] = forced\n        commit = true\n    end\nelseif n == 4 then\n    if st.predicted4 ~= nil and st.predicted4 ~= axis then\n        if AnyoneCore ~= nil and AnyoneCore.log ~= nil then\n            AnyoneCore.log(\"[Sword Dance] Lane order updated.\", 5)\n        end\n        st.axes[4] = axis -- Replace an incorrect prediction.\n        commit = true\n    elseif st.predicted4 == nil then\n        st.axes[4] = axis\n        commit = true\n    end\nend\nif commit == nil then\n    self.used = true\n    return\nend\n\n-- Choose the latest lane adjacent to lane one.\nlocal startLane = 4\nif (st.axes[4] - st.axes[1]) % 4 == 2 then startLane = 3 end\n\n-- Mark the initial stand lane.\nlocal a4 = st.axes[startLane] * QU\nlocal a1 = st.axes[1] * QU\nlocal cyan = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.15, 0.75, 1.0, 0.30), 1)\npre[#pre + 1] = cyan:addTimedCenteredRect(12000, cx, py, cz, 60, 20, a4)\n\n-- Snap route points to nearby waymarks.\nlocal R = 16\nlocal function axisEnd(ang, sign)\n    local dirAng = sign > 0 and ang or (ang + math.pi)\n    local dirx, dirz = math.sin(dirAng), math.cos(dirAng)\n    local ex, ez = cx + R * dirx, cz + R * dirz\n    local name\n    if data.lib ~= nil then\n        local n, mx, mz = data.lib.markNearDir(cx, cz, dirx, dirz, math.rad(15), 60, true)\n        if n ~= nil then name, ex, ez = n, mx, mz end\n    end\n    if name == nil and data.lib ~= nil then\n        name = data.lib.compassFromDir(dirx, dirz)\n    end\n    if name == nil then name = \"unknown\" end\n    return { x = ex, z = ez, name = name }\nend\n-- Draw both symmetric routes and call the nearest one.\nlocal dodgePairs = {}\nfor _, s4 in ipairs({ 1, -1 }) do\n    local sE = axisEnd(a4, s4)\n    local mBest, mD\n    for _, s1 in ipairs({ 1, -1 }) do\n        local mE = axisEnd(a1, s1)\n        local dd = (sE.x - mE.x) ^ 2 + (sE.z - mE.z) ^ 2\n        if mD == nil or dd < mD then mBest, mD = mE, dd end\n    end\n    local d = 0\n    if player ~= nil and player.pos ~= nil then\n        d = (player.pos.x - sE.x) ^ 2 + (player.pos.z - sE.z) ^ 2\n    end\n    dodgePairs[#dodgePairs + 1] = { s = sE, m = mBest, d = d }\nend\ntable.sort(dodgePairs, function(x, y) return x.d < y.d end)\n-- Route markers outlive the first-lane cleanup.\nlocal dur = 13000\nlocal green = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.1, 1.0, 0.25, 0.7), 2)\nfor i = 1, #dodgePairs do\n    local pr = dodgePairs[i]\n    green:addTimedCircle(dur, pr.s.x, py, pr.s.z, 1.8)\n    green:addTimedCircle(dur, pr.m.x, py, pr.m.z, 1.2)\n    if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n        AnyoneCore.addTimedWorldText(dur, \"START\",\n            { x = pr.s.x, y = py + 1.6, z = pr.s.z }, GUI:ColorConvertFloat4ToU32(0.3, 1.0, 0.4, 1.0), true, 1.5)\n        AnyoneCore.addTimedWorldText(dur, \"THEN\",\n            { x = pr.m.x, y = py + 1.6, z = pr.m.z }, GUI:ColorConvertFloat4ToU32(0.3, 1.0, 0.4, 1.0), true, 1.2)\n    end\nend\nif dodgePairs[1] ~= nil and AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n    AnyoneCore.Shotcall(\"Start \" .. dodgePairs[1].s.name .. \", into \" .. dodgePairs[1].m.name, true, 8)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"79745439-5d4a-d2f1-a5a1-085de79445fb",
								true,
							},
							
							{
								"72da6b79-f11b-b9a2-8ee7-79423ea65906",
								true,
							},
						},
						name = "B2 - Sword Dance Marks 2",
						uuid = "c6893ffe-48bc-2de8-a94c-ec826f28fe67",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1346,
						},
						name = "North Horn",
						uuid = "79745439-5d4a-d2f1-a5a1-085de79445fb",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local e = eventArgs ~= nil and eventArgs.entityID ~= nil and TensorCore.mGetEntity(eventArgs.entityID) or nil return e ~= nil and e.contentid ~= nil and e.contentid >= 2015240 and e.contentid <= 2015245",
						dequeueIfLuaFalse = true,
						name = "Index Omni Objects",
						uuid = "aad1a82a-b946-dce0-91e5-e97268b08385",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local e = eventArgs ~= nil and eventArgs.entityID ~= nil and TensorCore.mGetEntity(eventArgs.entityID) or nil return e ~= nil and e.contentid == 2015283",
						dequeueIfLuaFalse = true,
						name = "Sword Dance Ground Marks",
						uuid = "72da6b79-f11b-b9a2-8ee7-79423ea65906",
						version = 3,
					},
				},
			},
			eventType = 20,
			name = "[FTM Normal] Sword Dance + Index Elements",
			uuid = "1d00c535-d946-689e-a91b-a158ed250f90",
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
						actionLua = "local id = eventArgs.entityID\nlocal show = true\ndata.ftmThiefCoffers = data.ftmThiefCoffers or {}\nlocal coffers = data.ftmThiefCoffers\nlocal old = coffers[id]\nlocal function clear(entry)\n    if entry == nil then return end\n    if entry.circle then Argus.deleteTimedShape(entry.circle) end\n    if entry.text and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n        AnyoneCore.removeTimedWorldText(entry.text)\n    end\nend\nclear(old)\ncoffers[id] = nil\nif not show then\n    self.used = true\n    return\nend\nlocal ent = TensorCore.mGetEntity(id)\nif ent == nil or ent.pos == nil then\n    self.used = true\n    return\nend\nlocal green = TensorCore.getStaticFlatDrawer(\n    GUI:ColorConvertFloat4ToU32(0.10, 1.00, 0.25, 0.34)\n)\ngreen.colorOutline = GUI:ColorConvertFloat4ToU32(0.30, 1.00, 0.45, 1.00)\nlocal life = 900000\nlocal circle = green:addTimedCircleOnEnt(life, ent, 3.5, 0, false, true)\ngreen.colorOutline = nil\nlocal text\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldTextOnEnt ~= nil then\n    text = AnyoneCore.addTimedWorldTextOnEnt(\n        life, \"THIEF COFFER\", id,\n        GUI:ColorConvertFloat4ToU32(0.30, 1.00, 0.45, 1.00),\n        true, 1.7, 2.2\n    )\nend\ncoffers[id] = { circle = circle, text = text }\nself.used = true",
						conditions = 
						{
							
							{
								"4428ee0b-fb78-6258-8352-d21759c14e5c",
								true,
							},
							
							{
								"35d8cd1d-c2ed-79d0-b026-e3fdfef1f802",
								true,
							},
						},
						name = "Mark Thief coffer",
						uuid = "af271867-6eb2-2f83-a319-fbfb7dc577d4",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn / FTM",
						uuid = "4428ee0b-fb78-6258-8352-d21759c14e5c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local cid = tonumber(eventArgs.entityContentID)\nif cid == 2042 then return true end\nlocal ent = TensorCore.mGetEntity(eventArgs.entityID)\nif ent == nil then return false end\nlocal name = string.lower(tostring(ent.name or \"\"))\nreturn string.find(name, \"treasure coffer\", 1, true) ~= nil",
						dequeueIfLuaFalse = true,
						name = "Treasure Coffer entity",
						uuid = "35d8cd1d-c2ed-79d0-b026-e3fdfef1f802",
						version = 3,
					},
				},
			},
			eventType = 5,
			name = "[FTM][Thief] Track Hidden Coffer Spawn",
			uuid = "06bd5d22-e0d2-41de-b0b0-7d733b406f12",
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
						actionLua = "local id = eventArgs.entityID\nlocal show = eventArgs.isVisible == true\ndata.ftmThiefCoffers = data.ftmThiefCoffers or {}\nlocal coffers = data.ftmThiefCoffers\nlocal old = coffers[id]\nlocal function clear(entry)\n    if entry == nil then return end\n    if entry.circle then Argus.deleteTimedShape(entry.circle) end\n    if entry.text and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n        AnyoneCore.removeTimedWorldText(entry.text)\n    end\nend\nclear(old)\ncoffers[id] = nil\nif not show then\n    self.used = true\n    return\nend\nlocal ent = TensorCore.mGetEntity(id)\nif ent == nil or ent.pos == nil then\n    self.used = true\n    return\nend\nlocal green = TensorCore.getStaticFlatDrawer(\n    GUI:ColorConvertFloat4ToU32(0.10, 1.00, 0.25, 0.34)\n)\ngreen.colorOutline = GUI:ColorConvertFloat4ToU32(0.30, 1.00, 0.45, 1.00)\nlocal life = 900000\nlocal circle = green:addTimedCircleOnEnt(life, ent, 3.5, 0, false, true)\ngreen.colorOutline = nil\nlocal text\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldTextOnEnt ~= nil then\n    text = AnyoneCore.addTimedWorldTextOnEnt(\n        life, \"THIEF COFFER\", id,\n        GUI:ColorConvertFloat4ToU32(0.30, 1.00, 0.45, 1.00),\n        true, 1.7, 2.2\n    )\nend\ncoffers[id] = { circle = circle, text = text }\nself.used = true",
						conditions = 
						{
							
							{
								"1921a2a6-ec69-fbc1-99ec-f4505526b14d",
								true,
							},
							
							{
								"18aa4769-1337-c4c3-8bc5-c2452a34e942",
								true,
							},
						},
						name = "Mark Thief coffer",
						uuid = "e99d8098-be0a-a2de-b4d4-d0c54197d126",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn / FTM",
						uuid = "1921a2a6-ec69-fbc1-99ec-f4505526b14d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local cid = tonumber(eventArgs.entityContentID)\nif cid == 2042 then return true end\nlocal ent = TensorCore.mGetEntity(eventArgs.entityID)\nif ent == nil then return false end\nlocal name = string.lower(tostring(ent.name or \"\"))\nreturn string.find(name, \"treasure coffer\", 1, true) ~= nil",
						dequeueIfLuaFalse = true,
						name = "Treasure Coffer visibility",
						uuid = "18aa4769-1337-c4c3-8bc5-c2452a34e942",
						version = 3,
					},
				},
			},
			eventType = 22,
			name = "[FTM][Thief] Coffer Visibility Refresh",
			uuid = "4e48ac42-c112-b8fc-9911-1a77e9134d7d",
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
						actionLua = "local id = eventArgs.entityID\nlocal show = eventArgs.isTargetable == true\ndata.ftmThiefCoffers = data.ftmThiefCoffers or {}\nlocal coffers = data.ftmThiefCoffers\nlocal old = coffers[id]\nlocal function clear(entry)\n    if entry == nil then return end\n    if entry.circle then Argus.deleteTimedShape(entry.circle) end\n    if entry.text and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n        AnyoneCore.removeTimedWorldText(entry.text)\n    end\nend\nclear(old)\ncoffers[id] = nil\nif not show then\n    self.used = true\n    return\nend\nlocal ent = TensorCore.mGetEntity(id)\nif ent == nil or ent.pos == nil then\n    self.used = true\n    return\nend\nlocal green = TensorCore.getStaticFlatDrawer(\n    GUI:ColorConvertFloat4ToU32(0.10, 1.00, 0.25, 0.34)\n)\ngreen.colorOutline = GUI:ColorConvertFloat4ToU32(0.30, 1.00, 0.45, 1.00)\nlocal life = 900000\nlocal circle = green:addTimedCircleOnEnt(life, ent, 3.5, 0, false, true)\ngreen.colorOutline = nil\nlocal text\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldTextOnEnt ~= nil then\n    text = AnyoneCore.addTimedWorldTextOnEnt(\n        life, \"THIEF COFFER\", id,\n        GUI:ColorConvertFloat4ToU32(0.30, 1.00, 0.45, 1.00),\n        true, 1.7, 2.2\n    )\nend\ncoffers[id] = { circle = circle, text = text }\nself.used = true",
						conditions = 
						{
							
							{
								"a0f297d3-2273-7963-bf4b-b3b982700add",
								true,
							},
							
							{
								"b14c55d7-ddfc-89ea-9fdb-53b4e7f90865",
								true,
							},
						},
						name = "Mark Thief coffer",
						uuid = "b59484d2-c9ea-606f-82fc-f9b609c8a872",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn / FTM",
						uuid = "a0f297d3-2273-7963-bf4b-b3b982700add",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local cid = tonumber(eventArgs.entityContentID)\nif cid == 2042 then return true end\nlocal ent = TensorCore.mGetEntity(eventArgs.entityID)\nif ent == nil then return false end\nlocal name = string.lower(tostring(ent.name or \"\"))\nreturn string.find(name, \"treasure coffer\", 1, true) ~= nil",
						dequeueIfLuaFalse = true,
						name = "Treasure Coffer targetability",
						uuid = "b14c55d7-ddfc-89ea-9fdb-53b4e7f90865",
						version = 3,
					},
				},
			},
			eventType = 26,
			name = "[FTM][Thief] Coffer Targetable Refresh",
			uuid = "b6caa5f0-450b-8bc5-9658-1bc93d1853bd",
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
						actionLua = "local coffers = data.ftmThiefCoffers\nlocal entry = coffers and coffers[eventArgs.entityID]\nif entry then\n    if entry.circle then Argus.deleteTimedShape(entry.circle) end\n    if entry.text and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n        AnyoneCore.removeTimedWorldText(entry.text)\n    end\n    coffers[eventArgs.entityID] = nil\nend\nif coffers and next(coffers) == nil then data.ftmThiefCoffers = nil end\nself.used = true",
						conditions = 
						{
							
							{
								"56b52262-9ac0-b513-8a1b-da896d5cff37",
								true,
							},
							
							{
								"611811c5-b20a-1d19-9db8-d772867e0a06",
								true,
							},
						},
						name = "Clear Thief coffer marker",
						uuid = "d5ad3126-991f-bd9b-8530-f24d4448c867",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1346,
						name = "North Horn / FTM",
						uuid = "56b52262-9ac0-b513-8a1b-da896d5cff37",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local coffers = data.ftmThiefCoffers\nreturn coffers ~= nil and coffers[eventArgs.entityID] ~= nil",
						dequeueIfLuaFalse = true,
						name = "Tracked Thief coffer",
						uuid = "611811c5-b20a-1d19-9db8-d772867e0a06",
						version = 3,
					},
				},
			},
			eventType = 6,
			name = "[FTM][Thief] Clear Removed Coffer",
			uuid = "a566defb-e981-0903-9620-5780d759b358",
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
						actionLua = "local a=eventArgs\nif a==nil then self.used=true return end\nlocal id=tonumber(a.aoeID)\nlocal x,y,z=tonumber(a.x),tonumber(a.y),tonumber(a.z)\nlocal h=tonumber(a.heading) or 0\nif id==nil or x==nil or y==nil or z==nil then self.used=true return end\nlocal now=Now()\nlocal started=tonumber(a.startTime) or now\nlocal seconds=tonumber(a.duration) or 1\nlocal finish=started+seconds*1000\nif finish<now+100 then finish=now+seconds*1000 end\nlocal life=math.max(250,math.floor(finish-now+200))\nlocal red=TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0,0.28,0.12,0.38),1)\nlocal function circle(r,dur,delay)\n red:addTimedCircle(dur or life,x,y+0.03,z,r,delay or 0)\nend\nlocal function rect(len,w,dur,delay)\n red:addTimedRect(dur or life,x,y+0.03,z,len,w,h,delay or 0)\nend\nlocal function tracked(model,dur,near)\n local st=data.ftmNormalOrbs\n if st==nil then return end\n for eid,rec in pairs(st) do\n  if rec.model==model and rec.at~=nil and TimeSince(rec.at)<120000 then\n   local ent=TensorCore.mGetEntity(eid)\n   if ent~=nil and ent.pos~=nil then\n    local dx,dz=ent.pos.x-x,ent.pos.z-z\n    if not near or dx*dx+dz*dz<=225 then red:addTimedCircleOnEnt(dur,ent,15) end\n   end\n  end\n end\nend\nif id==47617 then circle(18)\nelseif id==50658 then rect(40,10)\nelseif id==50697 or id==50698 then\n circle(15)\n tracked(id==50697 and 19478 or 19479,life+2400,true)\nelseif id==47706 or id==47707 then circle(15)\nelseif id==50703 or id==50704 or id==50705 then\n circle(5)\n red:addTimedDonut(2500,x,y+0.03,z,5,60,math.max(0,life-200))\nelseif id==49720 then rect(60,5)\nelseif id==47747 or id==47748 then\n local target=a.targetAttach and TensorCore.mGetEntity(a.targetAttach) or nil\n if target~=nil and target.pos~=nil then red:addTimedCircleOnEnt(life,target,6) else circle(6) end\nelseif id==50525 or id==50526 then\n local len=tonumber(a.aoeLength) or 0\n if len<=0 and a.targetAttach~=nil then\n  local s=TensorCore.mGetEntity(a.entityID)\n  local t=TensorCore.mGetEntity(a.targetAttach)\n  if s~=nil and s.pos~=nil and t~=nil and t.pos~=nil then\n   local dx,dz=t.pos.x-s.pos.x,t.pos.z-s.pos.z\n   len=math.sqrt(dx*dx+dz*dz)\n  end\n end\n if len<=0 then len=48 end\n rect(len,7)\nelseif id==49575 or id==49578 or id==49883 then\n red:addTimedDonutCone(life,x,y+0.03,z,9,14,math.rad(90),h)\nelseif id==49577 or id==49580 or id==49889 then\n red:addTimedDonutCone(life,x,y+0.03,z,19,24,math.rad(90),h)\nelseif id==49585 then rect(48,96)\nelseif id==49589 then red:addTimedDonut(life,x,y+0.03,z,15,60)\nelseif id==49592 then circle(15)\nelseif id==49593 then circle(20)\nelseif id==49595 then circle(5)\nelseif id==49616 then rect(60,6)\nelseif id==47477 then\n rect(60,10)\n local later=math.max(0,life-200)\n local lx,lz=-math.cos(h),math.sin(h)\n for _,s in ipairs({-1,1}) do\n  red:addTimedRect(life+2100,x+lx*10*s,y+0.03,z+lz*10*s,60,10,h)\n  red:addTimedRect(4200,x+lx*20*s,y+0.03,z+lz*20*s,60,10,h,later)\n end\nelseif id==48385 then circle(15)\nelseif id==48387 then circle(11)\nelseif id==48905 then red:addTimedCenteredRect(life,x,y+0.03,z,15,15,h)\nelseif id==48389 or id==48391 then red:addTimedCone(life,x,y+0.03,z,30,math.rad(60),h)\nelseif id==48413 then circle(10)\nelseif id==48414 then red:addTimedDonut(life,x,y+0.03,z,4,15)\nelseif id==48406 then circle(15)\nend\nself.used=true",
						conditions = 
						{
							
							{
								"baf46c38-53ab-c32a-a2b7-421c3282d601",
								true,
							},
							
							{
								"34a63363-ebf6-d06b-bda5-7d5581d3850c",
								true,
							},
						},
						name = "Normal exact hazards",
						uuid = "346a8253-8006-714b-9523-fcac7725cf0b",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1346,
						},
						name = "North Horn",
						uuid = "baf46c38-53ab-c32a-a2b7-421c3282d601",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id=eventArgs and tonumber(eventArgs.aoeID)\nlocal ids={\n [47617]=true,[50658]=true,[50697]=true,[50698]=true,[47706]=true,[47707]=true,\n [50703]=true,[50704]=true,[50705]=true,[49720]=true,[47747]=true,[47748]=true,\n [50525]=true,[50526]=true,[49575]=true,[49578]=true,[49883]=true,[49577]=true,[49580]=true,[49889]=true,\n [49585]=true,[49589]=true,[49592]=true,[49593]=true,[49595]=true,[49616]=true,\n [47477]=true,[48385]=true,[48387]=true,[48905]=true,[48389]=true,[48391]=true,\n [48413]=true,[48414]=true,[48406]=true\n}\nreturn id~=nil and ids[id]==true",
						dequeueIfLuaFalse = true,
						name = "Normal FTM event",
						uuid = "34a63363-ebf6-d06b-bda5-7d5581d3850c",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[FTM Normal] Corrected AOEs + Dark Current",
			uuid = "74d046ea-12f3-23ec-97fb-7de5f983352e",
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
						actionLua = "local a=eventArgs\nlocal m=Argus.getEntityModel(a.entityID)\nif m~=19478 and m~=19479 then self.used=true return end\ndata.ftmNormalOrbs=data.ftmNormalOrbs or {}\ndata.ftmNormalOrbs[a.entityID]={model=m,at=Now()}\nself.used=true",
						conditions = 
						{
							
							{
								"843682c2-120c-8c9b-a245-90802273169d",
								true,
							},
							
							{
								"fe500990-9e4a-92df-819a-84c124d7335e",
								true,
							},
						},
						name = "Track normal Aevis orb",
						uuid = "288a5bba-85d7-3f3f-8910-72914bfb92be",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1346,
						},
						name = "North Horn",
						uuid = "843682c2-120c-8c9b-a245-90802273169d",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local a=eventArgs\nif a==nil or a.entityID==nil or Argus==nil or Argus.getEntityModel==nil then return false end\nlocal m=Argus.getEntityModel(a.entityID)\nreturn m==19478 or m==19479",
						dequeueIfLuaFalse = true,
						name = "Normal FTM event",
						uuid = "fe500990-9e4a-92df-819a-84c124d7335e",
						version = 3,
					},
				},
			},
			eventType = 5,
			name = "[FTM Normal] Track Aevis Orbs",
			uuid = "3fb424a1-9556-e5e1-9fb0-c9e0abdf3408",
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
						actionLua = "local a=eventArgs\nif a==nil then self.used=true return end\nlocal id=tonumber(a.spellID)\nlocal ent=a.entityID and TensorCore.mGetEntity(a.entityID) or nil\nlocal player=TensorCore.mGetPlayer()\nlocal ms=math.max(500,math.floor((tonumber(a.channelTimeMax) or 1)*1000+250))\nlocal red=TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0,0.28,0.12,0.38),1)\nlocal function kb(sx,sz,len,onlyInside)\n if player==nil or player.pos==nil then return end\n local dx,dz=player.pos.x-sx,player.pos.z-sz\n local d2=dx*dx+dz*dz\n if onlyInside and d2>225 then return end\n local h=d2>0.0025 and math.atan2(dx,dz) or 0\n local cyan=TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(0.10,0.85,1.0,0.92),1)\n cyan:addTimedArrowOnEnt(ms,player,math.max(1,len-2),0.34,2,0.95,nil,0,false,h,true)\n local green=TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.15,1.0,0.25,0.82),2)\n green:addTimedCircle(ms,player.pos.x+math.sin(h)*len,player.pos.y+0.05,player.pos.z+math.cos(h)*len,1.25)\nend\nif id==47613 then\n kb(-900,700,14,false)\nelseif id==47735 then\n local st=data.ftmNormalOrbs\n if st~=nil then\n  for eid,rec in pairs(st) do\n   if rec.at~=nil and TimeSince(rec.at)<120000 then\n    local e=TensorCore.mGetEntity(eid)\n    if e~=nil and e.pos~=nil then red:addTimedCircleOnEnt(ms+2700,e,15) end\n   end\n  end\n end\nelseif id==49599 or id==50359 then\n if ent~=nil and ent.pos~=nil then kb(ent.pos.x,ent.pos.z,24,false) end\nelseif id==48406 then\n if ent~=nil and ent.pos~=nil then kb(ent.pos.x,ent.pos.z,9,true) end\nend\nself.used=true",
						conditions = 
						{
							
							{
								"df769eca-44cd-bfec-9347-44c2c1a22331",
								true,
							},
							
							{
								"788e04a3-a6de-44e7-8059-fe50b3972560",
								true,
							},
						},
						name = "Normal channels and KB arrows",
						uuid = "ffc79dce-299d-b7a1-9629-1135022e69f5",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1346,
						},
						name = "North Horn",
						uuid = "df769eca-44cd-bfec-9347-44c2c1a22331",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id=eventArgs and tonumber(eventArgs.spellID)\nreturn id==47613 or id==47735 or id==49599 or id==50359 or id==48406",
						dequeueIfLuaFalse = true,
						name = "Normal FTM event",
						uuid = "788e04a3-a6de-44e7-8059-fe50b3972560",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[FTM Normal] KB Arrows + Tempest Orbs",
			uuid = "eb2aab6c-b5ac-a0e3-9573-667ce96a46c1",
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
						actionLua = "local a=eventArgs\nlocal player=TensorCore.mGetPlayer()\nif player==nil or player.pos==nil or player.id~=a.entityID then self.used=true return end\nlocal id=tonumber(a.buffID)\nlocal h=id==5403 and (math.pi*1.5) or (math.pi*0.5)\nlocal len=21\nlocal life=math.max(1000,math.floor((tonumber(a.buffDuration) or 8)*1000))\nlocal cyan=TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(0.10,0.85,1.0,0.92),1)\ncyan:addTimedArrowOnEnt(life,player,19,0.34,2,0.95,nil,0,false,h,true)\nlocal green=TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.15,1.0,0.25,0.82),2)\ngreen:addTimedCircle(life,player.pos.x+math.sin(h)*len,player.pos.y+0.05,player.pos.z+math.cos(h)*len,1.25)\nself.used=true",
						conditions = 
						{
							
							{
								"34987b0a-3bb4-a2ff-8b97-a00490bce342",
								true,
							},
							
							{
								"3738ae9c-3cb2-00e1-b4f6-732ec3c229e3",
								true,
							},
						},
						name = "Hissing Reprise 21y arrow",
						uuid = "38615810-56c3-0b9c-be17-462e98de429b",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1346,
						},
						name = "North Horn",
						uuid = "34987b0a-3bb4-a2ff-8b97-a00490bce342",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local a=eventArgs\nif a==nil then return false end\nlocal id=tonumber(a.buffID)\nreturn id==5403 or id==5404",
						dequeueIfLuaFalse = true,
						name = "Normal FTM event",
						uuid = "3738ae9c-3cb2-00e1-b4f6-732ec3c229e3",
						version = 3,
					},
				},
			},
			eventType = 8,
			name = "[FTM Normal] Hissing Reprise Direction",
			uuid = "34dc95e1-f8da-0d5d-84df-327d5c4e4db2",
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
						alertDuration = 3500,
						alertPriority = 3,
						alertScale = 1,
						alertTTS = true,
						alertText = "FIRE - STAND STILL / STOP ATTACKING",
						alertVolume = 100,
						conditions = 
						{
							
							{
								"4681f860-4697-6c06-98b0-f163d3763c54",
								true,
							},
							
							{
								"09285032-2727-5039-bc01-2396041c78ef",
								true,
							},
							
							{
								"03e7fcbc-a740-1b8e-ad3e-284c95ad0099",
								true,
							},
						},
						name = "Fire - stand still",
						uuid = "481dc0e2-a6c2-1db3-a742-e6317cbe07ff",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Alert",
						alertDuration = 3500,
						alertPriority = 3,
						alertScale = 1,
						alertTTS = true,
						alertText = "ICE - KEEP MOVING",
						alertVolume = 100,
						conditions = 
						{
							
							{
								"4681f860-4697-6c06-98b0-f163d3763c54",
								true,
							},
							
							{
								"9d0fd9e5-c087-f485-8561-e4bdd5520ada",
								true,
							},
							
							{
								"03e7fcbc-a740-1b8e-ad3e-284c95ad0099",
								true,
							},
						},
						name = "Ice - keep moving",
						uuid = "3e67a598-8883-cca4-9925-37ea226fd01c",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Alert",
						alertDuration = 3500,
						alertPriority = 3,
						alertScale = 1,
						alertTTS = true,
						alertText = "SHELL KB - FACE SAFE",
						alertVolume = 100,
						conditions = 
						{
							
							{
								"4681f860-4697-6c06-98b0-f163d3763c54",
								true,
							},
							
							{
								"133f7099-a8f7-9138-9ce4-b94500b57529",
								true,
							},
							
							{
								"03e7fcbc-a740-1b8e-ad3e-284c95ad0099",
								true,
							},
						},
						name = "Shell - face safe",
						uuid = "3b074876-f376-66ae-8146-5786a516a88a",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local player=TensorCore.mGetPlayer()\nif player==nil then self.used=true return end\nlocal life=math.max(1000,math.floor((tonumber(eventArgs.buffDuration) or 5)*1000))\nlocal color=GUI:ColorConvertFloat4ToU32(0.10,0.85,1.0,0.92)\nlocal drawer=TensorCore.getStaticFlatDrawer(color,1)\ndrawer:addTimedArrowOnEnt(life,player,30,0.38,5,1.05,nil,0,false,0,false)\nself.used=true",
						conditions = 
						{
							
							{
								"4681f860-4697-6c06-98b0-f163d3763c54",
								true,
							},
							
							{
								"133f7099-a8f7-9138-9ce4-b94500b57529",
								true,
							},
							
							{
								"03e7fcbc-a740-1b8e-ad3e-284c95ad0099",
								true,
							},
						},
						name = "35y live-facing KB arrow",
						uuid = "87318027-3db0-90b9-88f0-810e4c51792f",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
						},
						name = "South Horn",
						uuid = "4681f860-4697-6c06-98b0-f163d3763c54",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local p=TensorCore.mGetPlayer()\nlocal alive=TensorCore.isEntityAlive(13695)\nreturn p~=nil and eventArgs.entityID==p.id and alive==true",
						dequeueIfLuaFalse = true,
						name = "Self status during Trade Tortoise",
						uuid = "03e7fcbc-a740-1b8e-ad3e-284c95ad0099",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventBuffID = 4342,
						name = "Fire - stand still",
						uuid = "09285032-2727-5039-bc01-2396041c78ef",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventBuffID = 4343,
						name = "Ice - keep moving",
						uuid = "9d0fd9e5-c087-f485-8561-e4bdd5520ada",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventBuffID = 4344,
						name = "Shell forward KB",
						uuid = "133f7099-a8f7-9138-9ce4-b94500b57529",
						version = 3,
					},
				},
			},
			eventType = 8,
			name = "[Trade Tortoise] Fire Ice + Shell KB",
			uuid = "1b49457a-3bf4-e68b-b2cc-5e071d7b20ea",
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
						actionLua = "local required=(tonumber(eventArgs.newTetherID) or 327)-327\nAnyoneCore.Shotcall(\"Need \"..tostring(required)..\" coins\",true,6)\nself.used=true",
						conditions = 
						{
							
							{
								"589dac6d-b8ff-d103-9276-bd417dcb8fb3",
								true,
							},
							
							{
								"ee7b14e3-472e-739e-9708-c81abf717acc",
								true,
							},
							
							{
								"aa9ef747-d77d-4068-946c-cf4630cf8e72",
								true,
							},
							
							{
								"6a3b9ef0-3cb5-87cc-9881-087c2f90261b",
								true,
							},
						},
						name = "Call required coins",
						uuid = "d4ef4ad2-bd41-8d84-be91-adeafba8d098",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
						},
						name = "South Horn",
						uuid = "589dac6d-b8ff-d103-9276-bd417dcb8fb3",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 5,
						eventIntValue = 328,
						name = "Coin tether >= 328",
						uuid = "ee7b14e3-472e-739e-9708-c81abf717acc",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						comparator = 2,
						dequeueIfLuaFalse = true,
						eventArgType = 5,
						eventIntValue = 333,
						name = "Coin tether <= 333",
						uuid = "aa9ef747-d77d-4068-946c-cf4630cf8e72",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local p=TensorCore.mGetPlayer()\nlocal alive=TensorCore.isEntityAlive(13695)\nreturn p~=nil and eventArgs.sourceEntityID==p.id and alive==true",
						dequeueIfLuaFalse = true,
						name = "Self has Trade Tortoise coin tether",
						uuid = "6a3b9ef0-3cb5-87cc-9881-087c2f90261b",
						version = 3,
					},
				},
			},
			eventType = 15,
			name = "[Trade Tortoise] Coin Requirement",
			uuid = "d45c1ba3-8fd0-db43-b46a-8a033e302794",
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
						actionLua = "local source=TensorCore.mGetEntity(eventArgs.entityID)\nif source==nil or source.pos==nil then self.used=true return end\nlocal now=Now()\nlocal old=data.tradeTortoiseCostKB\nif type(old)==\"table\" and tonumber(old.armedAt)~=nil and now-old.armedAt<750 then self.used=true return end\nif type(old)==\"table\" then\n if old.arrow then Argus.deleteTimedShape(old.arrow) end\n if old.landing then Argus.deleteTimedShape(old.landing) end\nend\nlocal life=math.max(1000,math.floor((tonumber(eventArgs.channelTimeMax) or 7)*1000+400))\ndata.tradeTortoiseCostKB={source={x=source.pos.x,z=source.pos.z},armedAt=now,expiresAt=now+life}\nAnyoneCore.Shotcall(\"Knockback\",true,4)\nself.used=true",
						conditions = 
						{
							
							{
								"36f744ea-41df-ef73-9f29-f10a01e7636a",
								true,
							},
							
							{
								"f0e428cc-5c3d-accf-a3e8-bd87080c4c34",
								true,
							},
						},
						name = "Arm live 30y radial KB guide",
						uuid = "785e9e70-308c-eaf7-ae17-5b84bcf29547",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
						},
						name = "South Horn",
						uuid = "36f744ea-41df-ef73-9f29-f10a01e7636a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgType = 2,
						eventSpellID = 41522,
						name = "Cost of Living",
						uuid = "f0e428cc-5c3d-accf-a3e8-bd87080c4c34",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Trade Tortoise] Cost of Living KB Arm",
			uuid = "647eb172-bebc-f56d-8e06-d54707fc62c4",
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
						actionLua = "local s=data.tradeTortoiseCostKB\nlocal now=Now()\nif type(s)~=\"table\" then self.used=true return end\nlocal function clear()\n if s.arrow then Argus.deleteTimedShape(s.arrow) end\n if s.landing then Argus.deleteTimedShape(s.landing) end\n data.tradeTortoiseCostKB=nil\nend\nif now>(tonumber(s.expiresAt) or 0) then clear() self.used=true return end\nlocal player=TensorCore.mGetPlayer()\nif player==nil or player.pos==nil or s.source==nil then self.used=true return end\nlocal vx=player.pos.x-s.source.x\nlocal vz=player.pos.z-s.source.z\nlocal d2=vx*vx+vz*vz\nif d2<0.0001 then self.used=true return end\nlocal heading=math.atan2(vx,vz)\nlocal ux=math.sin(heading)\nlocal uz=math.cos(heading)\nlocal ox=player.pos.x-72\nlocal oz=player.pos.z+545\nlocal b=ox*ux+oz*uz\nlocal c=ox*ox+oz*oz-(24.5*24.5)\nlocal disc=b*b-c\nlocal edge=disc>0 and (-b+math.sqrt(disc)) or 0.5\nlocal length=math.min(30,math.max(0.5,edge-0.15))\nlocal tip=math.min(5,length/3)\nlocal base=math.max(0.1,length-tip)\nlocal refresh=450\nlocal cyan=TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(0.10,0.85,1.0,0.92),1)\nlocal ok=false\nif s.arrow then ok=cyan:updateTimedArrowOnEnt(s.arrow,refresh,player,base,0.38,tip,1.05,nil,0,false,heading,true) end\nif not ok then\n if s.arrow then Argus.deleteTimedShape(s.arrow) end\n s.arrow=cyan:addTimedArrowOnEnt(refresh,player,base,0.38,tip,1.05,nil,0,false,heading,true)\nend\nlocal lx=player.pos.x+ux*length\nlocal lz=player.pos.z+uz*length\nlocal green=TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.15,1.0,0.25,0.82),2)\nlocal circleOK=false\nif s.landing then circleOK=green:updateTimedCircle(s.landing,refresh,lx,player.pos.y+0.05,lz,1.25,0,false,true) end\nif not circleOK then\n if s.landing then Argus.deleteTimedShape(s.landing) end\n s.landing=green:addTimedCircle(refresh,lx,player.pos.y+0.05,lz,1.25,0,false,true)\nend\nself.used=true",
						conditions = 
						{
							
							{
								"18ee0a27-5720-b45c-92fd-82d5de04905a",
								true,
							},
							
							{
								"dfedb7be-300a-b302-90e1-98d46642ac34",
								true,
							},
						},
						name = "Update live distance-correct KB arrow",
						uuid = "a4734a63-4c85-51ea-900e-2a00ff434988",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
						},
						name = "South Horn",
						uuid = "18ee0a27-5720-b45c-92fd-82d5de04905a",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local s=data.tradeTortoiseCostKB\nreturn type(s)==\"table\" and tonumber(s.expiresAt)~=nil",
						dequeueIfLuaFalse = true,
						name = "Active Cost of Living KB",
						uuid = "dfedb7be-300a-b302-90e1-98d46642ac34",
						version = 3,
					},
				},
			},
			eventType = 12,
			name = "[Trade Tortoise] Live Cost of Living KB Arrow",
			throttleTime = 100,
			uuid = "3932f370-686c-c2f7-a53c-15a50c780a4e",
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
						actionLua = "local x=tonumber(eventArgs.x)\nlocal y=tonumber(eventArgs.y)\nlocal z=tonumber(eventArgs.z)\nlocal heading=tonumber(eventArgs.heading)\nif not x or not y or not z or not heading then self.used=true return end\nlocal castMS=math.max(0,(tonumber(eventArgs.duration) or 5)*1000)\nlocal red=TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(1.00,0.06,0.04,0.86),1)\nlocal future=TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(1.00,0.34,0.05,0.68),1)\nred.colorOutline=4294967295\nfuture.colorOutline=4294967295\nlocal sx=math.sin(heading)\nlocal sz=math.cos(heading)\nfor i=0,4 do\n    local px=x+sx*(i*5)\n    local pz=z+sz*(i*5)\n    local life=math.max(300,math.floor(castMS+i*1100+300))\n    local drawer=i==0 and red or future\n    drawer:addTimedCircle(life,px,y+0.03,pz,5,0,false,true)\nend\nlocal pathLife=math.max(300,math.floor(castMS+4*1100+300))\nfuture:addTimedArrow(pathLife,x,y+0.06,z,heading,18,0.28,2,0.85,0,false)\nred.colorOutline=nil\nfuture.colorOutline=nil\nself.used=true",
						conditions = 
						{
							
							{
								"33720a53-9702-9ada-a422-05ffd414537c",
								true,
							},
							
							{
								"8abe133f-4d97-a5a2-adf5-0ca224f3727a",
								true,
							},
						},
						name = "Draw five-step exaflare path",
						uuid = "fa3f3319-f5ce-7d3b-9eda-6d5fd1449b16",
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
						conditionType = 12,
						dequeueIfLuaFalse = true,
						localMapIDList = 
						{
							1252,
						},
						name = "South Horn",
						uuid = "33720a53-9702-9ada-a422-05ffd414537c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 41151",
						dequeueIfLuaFalse = true,
						name = "Choco Slaughter first exaflare",
						uuid = "8abe133f-4d97-a5a2-adf5-0ca224f3727a",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Black Regiment] Choco Slaughter Exaflare Paths",
			timeout = 10,
			uuid = "d846cd62-1a4e-a24a-993c-b8986949de4e",
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
						actionLua = "local now = Now()\nlocal red = TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(1.00, 0.06, 0.06, 0.78))\nred.colorOutline = 4294967295\nlocal center = { x = 636, y = 0, z = -54 }\n\nlocal lasers = data.southHornOnTheHuntLasers\nif type(lasers) == \"table\" and type(lasers.entries) == \"table\" then\n for key, e in pairs(lasers.entries) do\n  local rem = (tonumber(e.at) or 0) - now\n  if rem > 0 and rem <= 850 then\n   local beacon = TensorCore.mGetEntity(e.id)\n   if beacon and beacon.pos then\n    center.y = beacon.pos.y + 0.03\n    local heading = TensorCore.getHeadingToTarget(center, beacon.pos)\n    local life = math.max(100, math.floor(rem + 150))\n    local ok = e.uuid and red:updateTimedRect(e.uuid, life, center.x, center.y, center.z, 28, 10, heading, 0, false, true)\n    if not ok then e.uuid = red:addTimedRect(life, center.x, center.y, center.z, 28, 10, heading, 0, false, true) end\n   end\n  elseif rem <= -250 then\n   lasers.entries[key] = nil\n  end\n end\nend\n\nlocal roundels = data.southHornOnTheHuntRoundels\nif type(roundels) == \"table\" and type(roundels.entries) == \"table\" then\n for key, e in pairs(roundels.entries) do\n  local rem = (tonumber(e.at) or 0) - now\n  if rem > 0 and rem <= 850 then\n   local orb = TensorCore.mGetEntity(e.id)\n   if orb and orb.pos then\n    local life = math.max(100, math.floor(rem + 150))\n    local ok = e.uuid and red:updateTimedCircle(e.uuid, life, orb.pos.x, orb.pos.y + 0.03, orb.pos.z, 12, 0, false, true)\n    if not ok then e.uuid = red:addTimedCircle(life, orb.pos.x, orb.pos.y + 0.03, orb.pos.z, 12, 0, false, true) end\n   end\n  elseif rem <= -250 then\n   roundels.entries[key] = nil\n  end\n end\nend\nred.colorOutline = nil\nself.used = true",
						conditions = 
						{
							
							{
								"77f0e5db-7d46-be2d-a1ba-004bf3036287",
								true,
							},
							
							{
								"22ca82f2-cbf0-9016-a4d5-f5eba36d495a",
								true,
							},
						},
						name = "Follow live beacon and Roundel",
						uuid = "4eb19f1c-2b4a-adc9-9ce6-a4f934675467",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						name = "South Horn",
						uuid = "77f0e5db-7d46-be2d-a1ba-004bf3036287",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local now = Now()\nlocal function active(state)\n if type(state) ~= \"table\" or type(state.entries) ~= \"table\" then return false end\n for _, e in pairs(state.entries) do\n  local rem = (tonumber(e.at) or 0) - now\n  if rem > 0 and rem <= 850 then return true end\n end\n return false\nend\nreturn active(data.southHornOnTheHuntLasers) or active(data.southHornOnTheHuntRoundels)",
						dequeueIfLuaFalse = true,
						name = "Final 0.8s correction active",
						uuid = "22ca82f2-cbf0-9016-a4d5-f5eba36d495a",
						version = 3,
					},
				},
			},
			eventType = 12,
			name = "[On The Hunt] Final Live Rotation Correction",
			throttleTime = 50,
			uuid = "e866464d-72a3-c4b8-a463-5c4e207962f0",
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
						actionLua = "local id = tonumber(eventArgs.spellID)\nlocal key = id == 41402 and \"southHornOnTheHuntLasers\" or (id == 41403 and \"southHornOnTheHuntRoundels\" or nil)\nif key then\n local state = data[key]\n if type(state) == \"table\" and type(state.entries) == \"table\" then\n  for _, e in pairs(state.entries) do if e.uuid then Argus.deleteTimedShape(e.uuid) end end\n end\n data[key] = nil\nend\nself.used = true",
						conditions = 
						{
							
							{
								"301d7f22-2225-2f23-897e-8f0d95ab5b88",
								true,
							},
							
							{
								"07fa2705-f627-d351-b28e-acf762be8dfc",
								true,
							},
						},
						name = "Clear resolved live predictions",
						uuid = "f6b28872-edc0-12ed-8e9b-8d306d313302",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						name = "South Horn",
						uuid = "301d7f22-2225-2f23-897e-8f0d95ab5b88",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id = tonumber(eventArgs.spellID)\nreturn id == 41402 or id == 41403",
						dequeueIfLuaFalse = true,
						name = "Aetherial Ray or Bright Pulse",
						uuid = "07fa2705-f627-d351-b28e-acf762be8dfc",
						version = 3,
					},
				},
			},
			eventType = 2,
			name = "[On The Hunt] Ray + Roundel Cleanup",
			uuid = "0ca20712-e510-9a1e-a23f-908ecef356d8",
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
						actionLua = "local id = tonumber(eventArgs.spellID)\nlocal now = Now()\nlocal state = data.flameOfDuskMemory\n\nlocal function clearState(s)\n if type(s) ~= \"table\" then return end\n if s.summary then AnyoneCore.removeTimedWorldText(s.summary) end\n for _, e in ipairs(s.order or {}) do\n  if e.text then AnyoneCore.removeTimedWorldText(e.text) end\n end\nend\n\nif id == 41368 or id == 41369 then\n if type(state) ~= \"table\" or now - (tonumber(state.startedAt) or 0) > 1000 then\n  clearState(state)\n  state = { startedAt = now, order = {}, seen = {}, next = 1 }\n  data.flameOfDuskMemory = state\n end\n self.used = true\n return\nend\n\nif type(state) ~= \"table\" or now - (tonumber(state.startedAt) or 0) > 40000 then\n clearState(state)\n state = { startedAt = now, order = {}, seen = {}, next = 1 }\n data.flameOfDuskMemory = state\nend\nif #state.order >= 4 then self.used = true return end\n\nlocal sourceID = tonumber(eventArgs.entityID)\nlocal source = sourceID and TensorCore.mGetEntity(sourceID) or nil\nif not source or not source.pos then self.used = true return end\nlocal key = tostring(sourceID) .. \":\" .. tostring(id)\nif state.seen[key] then self.used = true return end\nstate.seen[key] = true\n\nlocal kind = id == 41374 and \"donut\" or (id == 41377 and \"cross\" or \"kb\")\nlocal label = kind == \"donut\" and \"IN - DONUT\" or (kind == \"cross\" and \"OUT - CROSS\" or \"IN - KB 20y\")\nlocal seq = #state.order + 1\nlocal entry = { number = seq, kind = kind, label = label, sourceID = sourceID }\nlocal yellow = GUI:ColorConvertFloat4ToU32(1.00, 0.82, 0.12, 1.00)\nentry.text = AnyoneCore.addTimedWorldTextOnEnt(30000, tostring(seq) .. \"  \" .. label, sourceID, yellow, true, 1.15, 3.0)\nstate.order[#state.order + 1] = entry\n\nlocal player = TensorCore.mGetPlayer()\nif player and player.id then\n if state.summary then AnyoneCore.removeTimedWorldText(state.summary) end\n local parts = {}\n for _, e in ipairs(state.order) do parts[#parts + 1] = tostring(e.number) .. \" \" .. e.label end\n state.summary = AnyoneCore.addTimedWorldTextOnEnt(30000, table.concat(parts, \"  >  \"), player.id, yellow, true, 0.95, 3.7)\nend\nself.used = true",
						conditions = 
						{
							
							{
								"c1d1e85e-8aa4-7815-9a32-dd02dd96e187",
								true,
							},
							
							{
								"0c5fc79a-ec94-8fe9-a05b-d8475738b531",
								true,
							},
						},
						name = "Number and label random order",
						uuid = "c16538fd-ce1a-6a6e-b415-a83fbd1d6543",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						name = "South Horn",
						uuid = "c1d1e85e-8aa4-7815-9a32-dd02dd96e187",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id = tonumber(eventArgs.spellID)\nreturn id == 41368 or id == 41369 or id == 41374 or id == 41377 or id == 41379",
						dequeueIfLuaFalse = true,
						name = "Molt or omen cast",
						uuid = "0c5fc79a-ec94-8fe9-a05b-d8475738b531",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Flame of Dusk] Numbered Omen Memory",
			uuid = "fd8e8985-088b-abfb-91b2-fe2dc6f352c3",
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
						actionLua = "local id = tonumber(eventArgs.spellID)\nlocal sourceID = tonumber(eventArgs.entityID)\nlocal source = sourceID and TensorCore.mGetEntity(sourceID) or nil\nif not source or not source.pos then self.used = true return end\nlocal life = math.max(1000, math.floor((tonumber(eventArgs.channelTimeMax) or 2) * 1000 + 3000))\nlocal kind = (id == 41372 or id == 41373) and \"donut\" or ((id == 41375 or id == 41376) and \"cross\" or \"kb\")\nlocal queued = id == 41373 or id == 41376 or id == 41378\nlocal state = data.flameOfDuskMemory\nlocal number = nil\nlocal label = kind == \"donut\" and \"IN - DONUT\" or (kind == \"cross\" and \"OUT - CROSS / AVOID DIAGONALS\" or \"IN - KB 20y\")\nif queued and type(state) == \"table\" then\n local idx = tonumber(state.next) or 1\n local entry = state.order and state.order[idx] or nil\n number = entry and entry.number or idx\n if entry and entry.text then AnyoneCore.removeTimedWorldText(entry.text); entry.text = nil end\n state.next = idx + 1\nend\nlocal prefix = queued and (\"NEXT \" .. tostring(number or \"?\") .. \"  \") or \"BOSS  \"\nlocal orange = GUI:ColorConvertFloat4ToU32(1.00, 0.72, 0.08, 1.00)\nAnyoneCore.addTimedWorldTextOnEnt(life, prefix .. label, sourceID, orange, true, 1.25, 3.2)\n\nif queued and type(state) == \"table\" then\n local player = TensorCore.mGetPlayer()\n if state.summary then AnyoneCore.removeTimedWorldText(state.summary); state.summary = nil end\n if player and player.id then\n  local parts = {}\n  local first = tonumber(state.next) or 1\n  for i = first, #(state.order or {}) do\n   local e = state.order[i]\n   parts[#parts + 1] = tostring(e.number) .. \" \" .. e.label\n  end\n  if #parts > 0 then\n   state.summary = AnyoneCore.addTimedWorldTextOnEnt(30000, \"NEXT  \" .. table.concat(parts, \"  >  \"), player.id, orange, true, 0.95, 3.7)\n  end\n end\nend\n\nlocal red = TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(1.00, 0.08, 0.06, 0.78), 1)\nred.colorOutline = 4294967295\nif kind == \"donut\" then\n red:addTimedDonut(life, source.pos.x, source.pos.y + 0.03, source.pos.z, 7, 50, 0, false, true)\n local green = TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(0.10, 1.00, 0.18, 0.40), 1)\n green:addTimedCircle(life, source.pos.x, source.pos.y + 0.05, source.pos.z, 6.5, 0, false, true)\nelseif kind == \"cross\" then\n red:addTimedCross(life, source.pos.x, source.pos.y + 0.03, source.pos.z, 50, 15, math.rad(45), 0, false, true)\nelse\n local player = TensorCore.mGetPlayer()\n if player and player.pos then\n  local heading = TensorCore.getHeadingToTarget(source.pos, player.pos)\n  local cyan = TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(0.08, 0.88, 1.00, 0.95), 1)\n  cyan.colorOutline = 4294967295\n  cyan:addTimedArrowOnEnt(life, player, 18.5, 0.16, 1.5, 0.52, nil, 0, false, heading, true)\n  cyan.colorOutline = nil\n  local lx = player.pos.x + math.sin(heading) * 20\n  local lz = player.pos.z + math.cos(heading) * 20\n  local green = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.10, 1.00, 0.18, 0.82), 2)\n  green:addTimedCircle(life, lx, player.pos.y + 0.05, lz, 1.1, 0, false, true)\n end\nend\nred.colorOutline = nil\nself.used = true",
						conditions = 
						{
							
							{
								"a6b2084e-2704-f2cb-bb05-f36a9c941a30",
								true,
							},
							
							{
								"128b1048-4e40-d5f9-a8f3-268b88e9c4e3",
								true,
							},
						},
						name = "Exact AOE, NEXT label, and 20y arrow",
						uuid = "963a4d6e-2e5f-f18a-9cb6-1ae105b3fd60",
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
						conditionType = 8,
						dequeueIfLuaFalse = true,
						localmapid = 1252,
						name = "South Horn",
						uuid = "a6b2084e-2704-f2cb-bb05-f36a9c941a30",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id = tonumber(eventArgs.spellID)\nreturn id == 41372 or id == 41373 or id == 41375 or id == 41376 or id == 41378",
						dequeueIfLuaFalse = true,
						name = "Donut, cross, or knockback activation",
						uuid = "128b1048-4e40-d5f9-a8f3-268b88e9c4e3",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Flame of Dusk] Exact Active Draws + Thin KB",
			uuid = "1484a04d-f1cf-8d75-9d86-306f6acbb337",
			version = 2,
		},
	}, 
	inheritedProfiles = 
	{
	},
}



return tbl