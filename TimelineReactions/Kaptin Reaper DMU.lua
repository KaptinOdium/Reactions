local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "d12cbef6-16fa-e362-cc83-0baccef1ace6",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "a578d5d2-b59c-d3ee-627a-31cc6c2b1c02",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Reaper Optimization",
				uuid = "c2918482-6f6e-2985-a7c3-43b7c075c977",
			},
			objectType = "folder",
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
							actionLua = "-- Public ACR potion ID; finite lease cannot leave a toggle disabled.\nTensorCore.API.TensorACR.holdActionUntil(846, Now() + 1000, 1)\nself.used = true",
							conditions = 
							{
								
								{
									"519a42ac-c4d3-d77a-933f-f89647d82b34",
									true,
								},
								
								{
									"537802d7-15a7-ad48-97f5-ceb2edd54d3f",
									true,
								},
								
								{
									"8dcac637-b80c-2a50-a15e-5e3f242fd507",
									true,
								},
								
								{
									"0365aa10-b3f3-b778-899c-76b64464308d",
									true,
								},
								
								{
									"132dfad6-0987-4428-a48c-1ea8453c43f1",
									true,
								},
								
								{
									"e7075fa0-eb55-18fa-80f6-370de9ca99a1",
									true,
								},
							},
							name = "Potion hold - expires in 1s",
							uuid = "35c484ee-6f9f-25c0-a146-8894d161b122",
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
								39,
							},
							name = "RPR",
							uuid = "519a42ac-c4d3-d77a-933f-f89647d82b34",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							uuid = "537802d7-15a7-ad48-97f5-ceb2edd54d3f",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 2,
							hpValue = 0.001,
							name = "Alive",
							uuid = "8dcac637-b80c-2a50-a15e-5e3f242fd507",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return ACR_TensorReaper3_Potion == true\n  and ACR_TensorReaper3_CD == true\n  and ACR_TensorReaper3_ArcaneCircle == true\n  and ACR_TensorReaper3_NoHolds == false",
							name = "Potion + burst enabled",
							uuid = "0365aa10-b3f3-b778-899c-76b64464308d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionCDValue = 2,
							actionID = 846,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Potion <=2s",
							uuid = "132dfad6-0987-4428-a48c-1ea8453c43f1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "-- F03: reserve the opener potion for the first later party burst.\n-- 60s only excludes the opener; actual Arcane Circle cooldown controls release.\nlocal elapsed = TensorReactions_CurrentCombatTimer\nif type(elapsed) ~= \"number\" or elapsed < 0 then return false end\nif elapsed < 60 then return true end\nlocal a = ActionList:Get(1, 24405)\nif not a or a.isoncd ~= true then return false end\nif type(a.cd) ~= \"number\" or type(a.cdmax) ~= \"number\" or a.cdmax <= 0 then return false end\nreturn math.max(0, a.cdmax - a.cd) > 8 and a.cd > 6",
							name = "Hold until burst",
							uuid = "e7075fa0-eb55-18fa-80f6-370de9ca99a1",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization",
				loop = true,
				mechanicTime = 15.261765625,
				name = "[RPR Opti] P1 reserve potion for burst",
				throttleTime = 400,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 182.26042222126,
				timerStartOffset = -15.261765625,
				uuid = "d1ea0a6f-f4a7-0a2f-9f83-d4ff2e3bac5d",
				version = 2,
			},
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
									"bafe0d20-b9db-18d0-88bb-0dee988c8a57",
									true,
								},
								
								{
									"d22cab38-642f-1434-a17c-e26c849cb94b",
									true,
								},
								
								{
									"59a104b3-eb42-69c5-a34d-de516b7db3da",
									true,
								},
								
								{
									"e3dcda51-64af-e14f-a7c0-764030c69783",
									true,
								},
								
								{
									"290904d0-20ae-8788-aa5e-368ada915afc",
									true,
								},
								
								{
									"f990da54-93f9-fc3c-9521-f738750684df",
									true,
								},
								
								{
									"7ee3810b-b7bb-3f7f-bfb4-b3081d3c4030",
									true,
								},
							},
							potType = 4,
							usePot = true,
							uuid = "13670da5-58e2-ca91-93b8-d3e213d8449d",
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
								39,
							},
							name = "RPR",
							uuid = "bafe0d20-b9db-18d0-88bb-0dee988c8a57",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							uuid = "d22cab38-642f-1434-a17c-e26c849cb94b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 2,
							hpValue = 0.001,
							name = "Alive",
							uuid = "59a104b3-eb42-69c5-a34d-de516b7db3da",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return ACR_TensorReaper3_Potion == true\n  and ACR_TensorReaper3_CD == true\n  and ACR_TensorReaper3_ArcaneCircle == true\n  and ACR_TensorReaper3_NoHolds == false",
							name = "Potion + burst enabled",
							uuid = "e3dcda51-64af-e14f-a7c0-764030c69783",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionCDValue = 2,
							actionID = 846,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Potion <=2s",
							uuid = "290904d0-20ae-8788-aa5e-368ada915afc",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local a = ActionList:Get(1, 24405)\nif not a or type(a.isoncd) ~= \"boolean\" then return false end\nif not a.isoncd then return true end\nif type(a.cd) ~= \"number\" or type(a.cdmax) ~= \"number\" or a.cdmax <= 0 then return false end\nreturn math.max(0, a.cdmax - a.cd) <= 8 or a.cd <= 6",
							name = "Arcane Circle window",
							uuid = "f990da54-93f9-fc3c-9521-f738750684df",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local p = TensorCore.mGetPlayer()\nlocal t = TensorCore.mGetTarget()\nif not p or not t or t.alive ~= true or t.attackable ~= true or t.targetable ~= true then return false end\nif not p.pos or not t.pos or type(t.hitradius) ~= \"number\" then return false end\nreturn TensorCore.getDistance2d(p.pos, t.pos) <= 3 + t.hitradius",
							name = "Live melee target",
							uuid = "7ee3810b-b7bb-3f7f-bfb4-b3081d3c4030",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization",
				mechanicTime = 15.261765625,
				name = "[RPR Opti] P1 first burst potion",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 182.238234375,
				timerStartOffset = 44.738234375,
				uuid = "1891dbf7-515b-8704-8381-935340b0ee5c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "Reaper Optimization",
				name = "Non-potion",
				uuid = "e110adc3-392b-e3ce-b0d9-222c9c5a0ee7",
			},
			objectType = "folder",
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
							actionLua = "local p=TensorCore.mGetPlayer()\nlocal s=data.kaptinRprDmuTrial\nif not s or s.playerID~=p.id then\n  s={playerID=p.id,known=false}\n  data.kaptinRprDmuTrial=s\nend\nlocal id,now=eventArgs.spellID,Now()\nif id==24394 then\n  s.known,s.active,s.cycleAt,s.reapingCount=true,true,now,0\n  s.sacrAt,s.communioAt,s.pending=nil,nil,nil\n  s.cycleTargetID,s.trialCycleAt=nil,nil\n  s.trialActive,s.trialStage=false,nil\nelseif id==24395 or id==24396 or id==24397 then\n  s.pending=nil\n  if s.trialActive then\n    s.trialActive=false\n    s.trialAbortedCycle=s.trialCycleAt\n    s.trialResult=\"cancelled: Reaping after package selection\"\n  end\n  if s.known and s.active and s.reapingCount and s.reapingCount<4 then\n    s.reapingCount=s.reapingCount+1\n  else s.known=false end\nelseif id==36969 then\n  if s.known and s.active then s.sacrAt,s.cycleTargetID=now,eventArgs.targetID end\nelseif id==24398 then\n  s.known,s.active,s.communioAt=true,false,now\n  s.communioTargetID=eventArgs.targetID\n  if s.trialActive and s.trialStage==\"armed\" and s.trialCycleAt==s.cycleAt\n      and s.trialTargetID==eventArgs.targetID and s.reapingCount==s.trialReapings then\n    s.trialStage,s.trialResult=\"communio\",\"Communio confirmed\"\n  elseif s.trialActive then\n    s.trialActive=false\n    s.trialAbortedCycle=s.trialCycleAt\n    s.trialResult=\"cancelled: unexpected Communio\"\n  end\nelseif id==36973 then\n  local clock=TensorReactions_CurrentTimer\n  s.perfectioAt=now\n  if s.trialActive and s.trialStage==\"communio\" and s.trialTargetID==eventArgs.targetID then\n    s.trialStage,s.trialResult=\"perfectio\",\"Perfectio confirmed\"\n  end\n  if s.known and s.active==false and s.communioAt\n      and now>=s.communioAt and now-s.communioAt<=15000\n      and s.communioTargetID==eventArgs.targetID\n      and clock>=356.48132335556 and clock<379.98132335556\n      and eventArgs.targetContentID==7131 then\n    s.pending=s.pending or {}\n    s.pending.at,s.pending.timeline=now,clock\n    s.pending.targetID=eventArgs.targetID\n  end\nelseif id==24393 then\n  s.gluttonyAt,s.pending=now,nil\n  if s.trialActive and s.trialStage==\"perfectio\" and s.trialTargetID==eventArgs.targetID then\n    s.trialStage,s.trialResult=\"gluttony\",\"Gluttony confirmed; awaiting Executioners\"\n    s.trialExecutions=0\n  elseif s.trialActive then\n    s.trialAbortedCycle=s.trialCycleAt\n    s.trialStage,s.trialResult=\"aborted\",\"cancelled: Gluttony before Perfectio\"\n  end\n  s.trialActive=false\nelseif id==36970 or id==36971 then\n  if s.trialStage==\"gluttony\" and s.trialTargetID==eventArgs.targetID\n      and s.gluttonyAt and now-s.gluttonyAt<15000 then\n    s.trialExecutions=s.trialExecutions+1\n    if s.trialExecutions==2 then\n      s.trialStage,s.trialResult=\"complete\",\"Communio, Perfectio, Gluttony and both Executioners confirmed\"\n    end\n  end\nelseif id==24389 or id==24390 or id==24391 or id==24392 then\n  if s.trialActive then\n    s.trialActive=false\n    s.trialAbortedCycle=s.trialCycleAt\n    s.trialStage,s.trialResult=\"aborted\",\"cancelled: competing Soul spender\"\n  end\nend\nself.used=true",
							conditions = 
							{
								
								{
									"18b2581c-20ec-3cbc-8e1c-16b1134c8000",
									true,
								},
								
								{
									"05181fcf-7334-7da3-b682-c77e4644b951",
									true,
								},
								
								{
									"3c38d745-4e9c-5bb9-b03d-3c52979f9565",
									true,
								},
							},
							name = "Track own successful casts",
							uuid = "3498814e-8d18-7f5d-a678-bc95a46b437b",
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
							name = "Cycle casts",
							spellIDList = 
							{
								24394,
								24395,
								24396,
								24397,
								36969,
								24398,
								36973,
								24393,
								36970,
								36971,
								24389,
								24390,
								24391,
								24392,
							},
							uuid = "18b2581c-20ec-3cbc-8e1c-16b1134c8000",
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
								39,
							},
							name = "RPR",
							uuid = "05181fcf-7334-7da3-b682-c77e4644b951",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local p = TensorCore.mGetPlayer()\nreturn p ~= nil and eventArgs.entityID == p.id",
							dequeueIfLuaFalse = true,
							name = "Own cast",
							uuid = "3c38d745-4e9c-5bb9-b03d-3c52979f9565",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization/Non-potion",
				eventType = 2,
				mechanicTime = 15.261765625,
				name = "[RPR Opti] Confirmed cycle state",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 1200,
				timerStartOffset = -15.261765480042,
				uuid = "64535336-0095-5119-b7bc-7f74b4b2cbe9",
				version = 2,
			},
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
							actionLua = "data.kaptinRprDmuTrial = nil\nself.used = true",
							conditions = 
							{
								
								{
									"11cef048-b68a-152c-927a-e483e18dd3b7",
									true,
								},
							},
							name = "Discard dead cycle",
							uuid = "f69bfedc-dc88-f1da-8039-6d8497fb2e29",
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
								39,
							},
							name = "RPR",
							uuid = "11cef048-b68a-152c-927a-e483e18dd3b7",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization/Non-potion",
				eventType = 10,
				mechanicTime = 15.261765625,
				name = "[RPR Opti] Clear cycle after death",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 1200,
				timerStartOffset = -15.261765480042,
				uuid = "25d58769-2a25-5c0e-85b0-a04836af27de",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"889347a6-1241-670a-abcf-372b74d35e43",
									true,
								},
							},
							gVar = "ACR_TensorReaper3_TripleEnshroud",
							uuid = "6b228643-809a-2945-b3ad-255298251bf3",
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
								39,
							},
							name = "RPR",
							uuid = "889347a6-1241-670a-abcf-372b74d35e43",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization/Non-potion",
				mechanicTime = 15.261765625,
				name = "[RPR Opti] Triple Enshroud baseline",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = -12.461765289307,
				timerStartOffset = -14.461765289307,
				uuid = "db24ac94-2630-def8-97f4-ef26253b62fe",
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
				uuid = "88878793-d9e6-5d3f-3511-0a195d0ea1c3",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "5572ada8-9777-6604-799a-1aea4c0dc458",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "a5aec9b8-eb29-52c4-9d13-5716290832e8",
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
				uuid = "703cce91-fef9-49a5-cf8b-787b64eec841",
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
				uuid = "3ee9296e-1c2c-8052-cdd0-7560fd02859e",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "5b351359-1617-2c0d-eda0-2c7b3429d089",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6332b2bf-ff3b-3213-0dc6-230dbc29a42f",
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
				uuid = "7475a844-1c62-7438-a37d-1adab06cb0f4",
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
				uuid = "059ba1ed-f782-da79-3c75-c75f2389dc9d",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	}, 
	[10] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "eff176be-8a97-c552-938e-839ccd142dae",
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
				uuid = "e930a2e1-6d64-8ea5-24fc-bcb75205e8d1",
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
				uuid = "85334e14-8acd-b938-2b15-142656f0ca84",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[15] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "990b9ab5-555b-be11-8763-6a4bc61b8565",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "cd35ff38-0129-1504-6321-dc4e78ff77e8",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "d4ef3188-5994-97c4-baa3-7daa8bb2c2f8",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[17] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "cac40edd-b96c-b1d9-4387-f1cbb17621cd",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "719031e3-4851-a23f-e3c9-cf5d5759f3d3",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "f0842986-eb45-543a-5e26-0db4e22ec036",
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
				uuid = "0bdbe349-eaba-916d-b877-07ef6f6c2739",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[20] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "59c7ba5b-fd1d-011f-4544-6539c5ae4a8b",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "842345ad-991c-cf01-f29c-245f25fbf01d",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[22] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "940eeed5-ec79-e049-37fd-b68f0a842705",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "df12fe1b-e201-06ef-a9d1-62315842870b",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[23] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "6ca122d0-859f-d8f4-98c8-4842b44192c0",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "f777bc00-87b0-0cb4-52b1-960e356d01f0",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "583ce9b6-4002-c8c2-38b8-6b58a5192fe6",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[26] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "78547187-d373-0683-87b5-4c458594e077",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[29] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "ec341592-549f-1326-18a0-8ecc6e9d2f82",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[30] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "ab7b2b70-14a4-1724-18e0-2c4af402a7e0",
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
				uuid = "3fd44f8e-21a0-7a02-feb7-65e039e4367e",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "5f75570b-7601-4c4f-7688-3fa55104b3fb",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "9c0a199d-a422-a7f1-e692-d9eb33f8558d",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[34] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "b1dceb7c-f3ca-6fc8-eedb-c29a2fe7932c",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e9e205dc-d52b-ec18-af5a-0f4688ac644c",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "fba309f7-6944-9973-19ef-de0983c60d67",
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
				uuid = "1b275966-c629-7132-3e21-033cc3458996",
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
				uuid = "105bbc29-9fe1-7705-b756-87d75b433c99",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[38] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "a1886fe8-f019-6b8c-0624-a0e2a8c440d8",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Reaper Optimization",
				uuid = "70642fef-9eeb-a3db-9126-4a37ee9758a3",
			},
			objectType = "folder",
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
							actionLua = "-- Public ACR potion ID; finite lease cannot leave a toggle disabled.\nTensorCore.API.TensorACR.holdActionUntil(846, Now() + 1000, 1)\nself.used = true",
							conditions = 
							{
								
								{
									"df9ac8e8-7f90-3f1c-86a5-d1a40c5294b0",
									true,
								},
								
								{
									"33b5d04e-9f47-76f4-8055-71c2dd529920",
									true,
								},
								
								{
									"26bf5989-0f36-0715-a41c-1fd2311fb825",
									true,
								},
								
								{
									"8e91feae-618b-bbec-94ac-572c5d2f994c",
									true,
								},
								
								{
									"b918343f-4f49-0611-bf72-262cf3e4d91a",
									true,
								},
							},
							name = "Potion hold - expires in 1s",
							uuid = "55bf5c47-ee4c-15d3-b56f-aee05f37dd5a",
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
								39,
							},
							name = "RPR",
							uuid = "df9ac8e8-7f90-3f1c-86a5-d1a40c5294b0",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							uuid = "33b5d04e-9f47-76f4-8055-71c2dd529920",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 2,
							hpValue = 0.001,
							name = "Alive",
							uuid = "26bf5989-0f36-0715-a41c-1fd2311fb825",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return ACR_TensorReaper3_Potion == true\n  and ACR_TensorReaper3_CD == true\n  and ACR_TensorReaper3_ArcaneCircle == true\n  and ACR_TensorReaper3_NoHolds == false",
							name = "Potion + burst enabled",
							uuid = "8e91feae-618b-bbec-94ac-572c5d2f994c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionCDValue = 2,
							actionID = 846,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Potion <=2s",
							uuid = "b918343f-4f49-0611-bf72-262cf3e4d91a",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization",
				loop = true,
				mechanicTime = 197.52218784626,
				name = "[RPR Opti] P2 reserve potion for P3",
				throttleTime = 400,
				timeRange = true,
				timelineIndex = 38,
				timerEndOffset = 229.93739488292,
				uuid = "a2dd33aa-2af5-2a5e-89d6-0933bc28eee3",
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
				uuid = "d58edec3-caed-09a7-19bb-b27558b29033",
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
				uuid = "f9d436e7-c607-a273-560f-afe527625d57",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[41] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "c9ae9fac-80e4-eac8-adde-27b64c42df1c",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "feba8dcc-31ee-f518-061a-1692ae2cd8bc",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[42] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "d1516619-fca4-8005-e74e-1e5389fbb389",
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
				uuid = "3953b316-22ec-7a32-1ba6-ed781f65e4c6",
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
				uuid = "b8986bf5-2111-3ff9-1fba-3fef5f10d025",
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
				uuid = "6a10d160-7167-2024-5d08-582eba29f350",
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
				uuid = "3fbd76da-dab3-58ce-e6e4-f50488ec01ca",
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
				uuid = "c7940239-46cc-ceb5-d778-1d5badba24a9",
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
				uuid = "55a38164-60d0-ee20-5974-ef7aec500b54",
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
				uuid = "c08c56f6-6feb-5b32-819b-be58cb3121a6",
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
				uuid = "108f2725-4606-0a61-ef74-dfc3454d5855",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "10f0d48d-e8e8-dae9-71cb-2cc3d94920bd",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "10d10f93-4ac0-1c4f-fd07-3a95008f7583",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "f8865691-f5e1-0235-4e8f-e22fc6393e01",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[56] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "92510e84-3c0e-05b8-fb20-59527d00c5f4",
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
				uuid = "8e6fecba-4d59-9106-c561-2c701149ebaa",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "fea95e9b-764f-a7c7-21fb-9685f1887bcb",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "8de529ed-68b1-4ac9-e836-b18b3a703d5d",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "3c476781-e0f8-ad2d-e426-734bd13f16f1",
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
				uuid = "e6f6adde-9c64-55fa-3da5-7630ab0cbece",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "7da1d9c9-02e6-f555-d0a2-6ccb8b57b1f9",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "852b9f6f-3be8-659b-408c-d85d6a34cf1f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "2adaa534-544d-2380-1766-86aa41c08624",
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
				uuid = "9827b603-f970-def7-f6ae-8f3120da5973",
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
				uuid = "e32d6142-b512-5136-f051-8c9cf345e032",
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
				uuid = "769d9f03-d529-d907-3ad4-23e996610873",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[67] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "f498a798-9f61-740c-252b-e83aeb2b5cc8",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "c7d8cf28-f444-c6ec-87d8-1d2602485b18",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[70] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "30f1bda4-bce0-a5c0-aa8a-8caaa92bb394",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b7ceafa4-0850-92f0-2ec3-07d6b2621b94",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[73] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "474d4071-f8df-811d-fe26-13a7165f7061",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[74] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "84f26948-20b4-f1fc-abd3-63bea65477b8",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Reaper Optimization",
				uuid = "1f21069c-9c42-fcfc-bde5-f80fd64fcac9",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "Reaper Optimization",
				name = "Non-potion",
				uuid = "41958043-78bf-076f-9f99-c7d54e0e3c71",
			},
			objectType = "folder",
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
							actionLua = "local s=data.kaptinRprDmuTrial\nif s then\n s.pending=nil\n if s.trialActive then\n  s.trialActive=false\n  s.trialAbortedCycle=s.trialCycleAt\n  s.trialResult=\"cancelled: Kefka untargetable\"\n end\nend\nself.used=true",
							conditions = 
							{
								
								{
									"99493a60-d7a6-2505-ab9a-75c18bcb1161",
									true,
								},
								
								{
									"6e255793-433c-15fb-b848-7112a066679e",
									true,
								},
							},
							name = "Cancel pending Gluttony",
							uuid = "3351f05f-c6c5-a18e-99db-daa7efd4e276",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return eventArgs.entityContentID == 7131 and eventArgs.isTargetable == false",
							dequeueIfLuaFalse = true,
							name = "Kefka lost",
							uuid = "99493a60-d7a6-2505-ab9a-75c18bcb1161",
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
								39,
							},
							name = "RPR",
							uuid = "6e255793-433c-15fb-b848-7112a066679e",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization/Non-potion",
				eventType = 26,
				mechanicTime = 381.48132335556,
				name = "[RPR Opti] Cancel P2 request on loss",
				timeRange = true,
				timelineIndex = 74,
				timerEndOffset = 1,
				timerStartOffset = -25,
				uuid = "dca217f2-0e35-ce5b-8472-391c0326d47b",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							actionID = 24393,
							conditions = 
							{
								
								{
									"bf05090a-712d-e5b2-9082-2f6557470423",
									true,
								},
								
								{
									"d9abfc61-7a7c-c745-b26a-87d46beabc9a",
									true,
								},
								
								{
									"1118eb03-2d67-f6c2-afc5-187563b800a5",
									true,
								},
								
								{
									"197c8f97-74d3-2734-81d8-fd7fe7305509",
									true,
								},
								
								{
									"9bfe0583-12bd-d6b7-82d0-92c3020d5103",
									true,
								},
							},
							targetType = "Current Target",
							uuid = "6fb148e6-68ce-9ee4-9323-c11e7d65d88a",
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
								39,
							},
							name = "RPR",
							uuid = "bf05090a-712d-e5b2-9082-2f6557470423",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							uuid = "d9abfc61-7a7c-c745-b26a-87d46beabc9a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 6,
							buffIDList = 
							{
								2587,
								3858,
								2593,
								3860,
							},
							category = "Self",
							name = "No pending cycle or spender",
							uuid = "1118eb03-2d67-f6c2-afc5-187563b800a5",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 24393,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Gluttony ready",
							uuid = "197c8f97-74d3-2734-81d8-fd7fe7305509",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s = data.kaptinRprDmuTrial\nif s and s.trialActive then return false end\nif not s or not s.known or s.active ~= false or not s.pending then return false end\nlocal q = s.pending\nlocal p = TensorCore.mGetPlayer()\nlocal t = TensorCore.mGetTarget()\nlocal clock = TensorReactions_CurrentTimer\nlocal age = (Now() - q.at) / 1000\n-- No stale request after death, a timeline resync, target loss or target change.\nif not p or not p.alive or p.id ~= s.playerID\n    or age < 0 or age > 3\n    or clock < 356.48132335556 or clock >= 379.98132335556\n    or math.abs((clock - q.timeline) - age) > 0.75\n    or not t or t.id ~= q.targetID or t.contentid ~= 7131\n    or not t.alive or not t.attackable or not t.targetable then\n  s.pending = nil\n  return false\nend\nif not p.pos or not t.pos or type(t.hitradius) ~= \"number\" then return false end\nif TensorCore.getDistance2d(p.pos, t.pos) > 3 + t.hitradius then return false end\nif ACR_TensorReaper3_CD ~= true or ACR_TensorReaper3_Gluttony ~= true\n    or ACR_TensorReaper3_SoulGauge ~= true then return false end\nlocal gcd = ActionList:Get(1, 24373)\nlocal gluttony = ActionList:Get(1, 24393)\nif not gcd or not gluttony or type(gcd.recasttime) ~= \"number\"\n    or gcd.recasttime < 1.5 or gcd.recasttime > 3 then return false end\n-- Two complete GCDs plus 1.5s for application/latency, rechecked at every attempt.\nlocal budget = 2 * gcd.recasttime + 1.5\nif clock + budget >= 381.48132335556 then\n  s.pending = nil\n  return false\nend\nlocal design = TensorCore.getBuff(t, 2586, p.id)\nif not design or type(design.duration) ~= \"number\" or design.duration <= budget then return false end\n-- Native validation proves current Soul/resource eligibility; no guessed gauge index.\nreturn gluttony:CanCastResult(t.id) == 0",
							name = "Fresh Perfectio; two hits fit",
							uuid = "9bfe0583-12bd-d6b7-82d0-92c3020d5103",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization/Non-potion",
				mechanicTime = 381.48132335556,
				name = "[RPR Opti] P2 Gluttony after Perfectio",
				timeRange = true,
				timelineIndex = 74,
				timerEndOffset = -1.5,
				timerStartOffset = -25,
				uuid = "50e3687a-c7e8-7f21-a43b-a6a78b171dc1",
				version = 2,
			},
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
							actionLua = "local s=data.kaptinRprDmuTrial\ns.trialCycleAt=s.cycleAt\ns.trialTargetID=TensorCore.mGetTarget().id\ns.trialAt,s.trialTimeline=Now(),TensorReactions_CurrentTimer\ns.trialReapings,s.trialStage=s.reapingCount,\"armed\"\ns.trialActive,s.trialExecutions=true,0\ns.trialResult=\"armed: zero additional Reapings selected\"\nself.used=true",
							conditions = 
							{
								
								{
									"b255a56c-fe1c-99bf-a992-02235be72874",
									true,
								},
								
								{
									"5d83b918-2683-a895-9b0b-4ddaee86fe2b",
									true,
								},
							},
							name = "Arm selected cycle",
							uuid = "be2bec93-1cec-b073-9d4e-937ba56454ae",
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							actionID = 24398,
							conditions = 
							{
								
								{
									"b255a56c-fe1c-99bf-a992-02235be72874",
									true,
								},
								
								{
									"f6869a44-9298-cf42-ba32-911e34bdb9e6",
									true,
								},
								
								{
									"5d83b918-2683-a895-9b0b-4ddaee86fe2b",
									true,
								},
							},
							targetType = "Current Target",
							uuid = "c775a1d4-7431-e7f2-b3e5-bc87a0bffc88",
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							actionID = 36973,
							conditions = 
							{
								
								{
									"b255a56c-fe1c-99bf-a992-02235be72874",
									true,
								},
								
								{
									"f6869a44-9298-cf42-ba32-911e34bdb9e6",
									true,
								},
								
								{
									"bd8c76cb-cab9-3077-b5fd-10f779e52d77",
									true,
								},
								
								{
									"af244b6d-6779-d4e7-9e42-536026f9d133",
									true,
								},
							},
							targetType = "Current Target",
							uuid = "f2a2a4c2-c35f-31aa-81cb-7fdba985aefd",
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							actionID = 24393,
							conditions = 
							{
								
								{
									"b255a56c-fe1c-99bf-a992-02235be72874",
									true,
								},
								
								{
									"f6869a44-9298-cf42-ba32-911e34bdb9e6",
									true,
								},
								
								{
									"bd8c76cb-cab9-3077-b5fd-10f779e52d77",
									true,
								},
								
								{
									"3b27f352-406e-bb35-beeb-841eaccf8742",
									true,
								},
								
								{
									"1a22341a-7581-6c5e-85f7-f5c360986f17",
									true,
								},
							},
							targetType = "Current Target",
							uuid = "e9b5ac62-eaa9-12e6-a445-ba996e6b3d73",
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
								39,
							},
							name = "RPR",
							uuid = "b255a56c-fe1c-99bf-a992-02235be72874",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "-- Gauge indices verified against the 2026-09-19 live Reaper dummy capture.\nlocal s = data.kaptinRprDmuTrial\nlocal p, t = TensorCore.mGetPlayer(), TensorCore.mGetTarget()\nlocal now, clock = Now(), TensorReactions_CurrentTimer\nif not s or not p or not t or not p.alive or not p.incombat\n    or not t.alive or not t.attackable or not t.targetable or t.contentid ~= 7131\n    or s.playerID ~= p.id or s.cycleTargetID ~= t.id\n    or s.known ~= true or s.active ~= true\n    or not s.sacrAt or not s.cycleAt or s.sacrAt < s.cycleAt\n    or now < s.sacrAt or now - s.cycleAt > 30000\n    or clock < 356.48132335556 or clock >= 379.98132335556 then return false end\nif ACR_TensorReaper3_CD ~= true or ACR_TensorReaper3_Enshroud ~= true\n    or ACR_TensorReaper3_Gluttony ~= true or ACR_TensorReaper3_SoulGauge ~= true\n    or ACR_TensorReaper3_NoHolds ~= false then return false end\nlocal g = p.gauge\nfor i=1,5 do\n  if type(g[i]) ~= \"number\" or g[i] ~= g[i] or g[i] % 1 ~= 0 then return false end\nend\nlocal soul, shroud, enshroudMs, lemure, void = g[1],g[2],g[3],g[4],g[5]\nif soul < 50 or soul > 100 or shroud < 0 or shroud > 100\n    or enshroudMs <= 0 or enshroudMs > 30000\n    or lemure < 2 or lemure > 5 or void < 0 or void >= 2\n    or s.reapingCount ~= 5-lemure then return false end\nif s.trialActive and (s.trialCycleAt ~= s.cycleAt\n    or s.trialReapings ~= s.reapingCount or s.trialStage ~= \"armed\") then return false end\nif s.trialAbortedCycle == s.cycleAt then return false end\nif TensorCore.hasBuff(p,2587) or TensorCore.hasBuff(p,3858)\n    or TensorCore.hasBuff(p,3860) or TensorCore.hasBuff(p,3857) then return false end\nlocal occulta, design = TensorCore.getBuff(p,3859), TensorCore.getBuff(t,2586,p.id)\nif not occulta or not design or type(occulta.duration)~=\"number\"\n    or type(design.duration)~=\"number\" then return false end\nif not p.pos or not t.pos or type(t.hitradius)~=\"number\"\n    or TensorCore.getDistance2d(p.pos,t.pos)>3+t.hitradius then return false end\nlocal comm, glut = ActionList:Get(1,24398), ActionList:Get(1,24393)\nlocal reap, perf, ex = ActionList:Get(1,24395), ActionList:Get(1,36973), ActionList:Get(1,36970)\nif not comm or not glut or not reap or not perf or not ex\n    or comm.id~=24398 or glut.id~=24393 or glut.recasttime~=60 then return false end\nif type(comm.cdmax)~=\"number\" or type(comm.cd)~=\"number\"\n    or type(glut.cdmax)~=\"number\" or type(glut.cd)~=\"number\"\n    or type(comm.casttime)~=\"number\" or comm.casttime<=0\n    or type(reap.recasttime)~=\"number\" or reap.recasttime<=0\n    or type(comm.recasttime)~=\"number\" or comm.recasttime<=0\n    or type(perf.recasttime)~=\"number\" or perf.recasttime<=0\n    or type(ex.recasttime)~=\"number\" or ex.recasttime<=0 then return false end\nlocal gcdWait = math.max(0,comm.cdmax-comm.cd)\nlocal glutWait = math.max(0,glut.cdmax-glut.cd)\nlocal horizon, remaining = 381.48132335556-clock, lemure-1\nlocal chosen, zeroFinish, zeroGlut\n-- Each candidate has the same Communio/Perfectio/Gluttony/two-Executioner package.\n-- Conservative trial allowances: 0.10/Reaping, 0.25/Lemure weave, 0.80/hit,\n-- 0.20/proc update, 0.85/weave-lock, and a final 1.20s reserve.\nfor k=0,remaining do\n  local commStart=gcdWait+k*(reap.recasttime+0.10)+0.25*math.floor((void+k)/2)\n  local commHit=commStart+comm.casttime+0.80\n  local perfStart=math.max(commStart+comm.recasttime,commHit+0.20)\n  local glutStart=perfStart+0.85\n  local ex1=math.max(perfStart+perf.recasttime,glutStart+0.85)\n  local ex2=ex1+ex.recasttime\n  local finish=math.max(commHit,perfStart+0.80,glutStart+0.80,ex2+0.80)+1.20\n  local legal=glutWait<=glutStart and commHit+0.20<occulta.duration\n      and commHit+0.20<enshroudMs/1000 and finish<design.duration\n  if k==remaining and (not legal or finish<horizon) then return false end\n  if legal and finish<horizon then chosen=k end\n  if k==0 then zeroFinish,zeroGlut=finish,glutStart end\nend\nif chosen~=0 or comm:CanCastResult(t.id)~=0 then return false end\ns.n01CandidateFinish,s.n01CandidateGlut=zeroFinish,zeroGlut\nreturn true",
							name = "Verified resources; package fits",
							uuid = "5d83b918-2683-a895-9b0b-4ddaee86fe2b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionUUID = "be2bec93-1cec-b073-9d4e-937ba56454ae",
							category = "Action",
							name = "Trial armed",
							uuid = "f6869a44-9298-cf42-ba32-911e34bdb9e6",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinRprDmuTrial\nlocal p,t=TensorCore.mGetPlayer(),TensorCore.mGetTarget()\nlocal now,clock=Now(),TensorReactions_CurrentTimer\nif not s or not s.trialActive then return false end\nlocal age=(now-s.trialAt)/1000\nif not p or not t or not p.alive or not p.incombat or not t.alive\n    or not t.targetable or not t.attackable or t.contentid~=7131\n    or p.id~=s.playerID or t.id~=s.trialTargetID\n    or s.trialCycleAt~=s.cycleAt or not s.known\n    or age<0 or age>15 or clock<356.48132335556 or clock>=379.98132335556\n    or math.abs((clock-s.trialTimeline)-age)>0.75 then\n  s.trialActive=false\n  s.trialAbortedCycle=s.trialCycleAt\n  s.trialResult=\"cancelled: target, life, age or clock\"\n  return false\nend\nif ACR_TensorReaper3_CD~=true or ACR_TensorReaper3_Gluttony~=true\n    or ACR_TensorReaper3_SoulGauge~=true or ACR_TensorReaper3_NoHolds~=false then return false end\nlocal g=p.gauge\nif type(g[1])~=\"number\" or g[1]<50 or g[1]>100\n    or g[3]~=0 or g[4]~=0 or s.active~=false then return false end\nif not p.pos or not t.pos or type(t.hitradius)~=\"number\"\n    or TensorCore.getDistance2d(p.pos,t.pos)>3+t.hitradius then return false end\nlocal gcd=ActionList:Get(1,24373)\nif not gcd or type(gcd.recasttime)~=\"number\" or gcd.recasttime<1.5 or gcd.recasttime>3\n    or type(gcd.cdmax)~=\"number\" or type(gcd.cd)~=\"number\" then return false end\nlocal wait=math.max(0,gcd.cdmax-gcd.cd)\nif s.trialStage~=\"communio\" or not s.communioAt\n    or s.communioAt<s.trialCycleAt or s.communioTargetID~=t.id then return false end\nlocal budget=wait+2*gcd.recasttime+2.0\nlocal parata,design=TensorCore.getBuff(p,3860),TensorCore.getBuff(t,2586,p.id)\nif not parata or not design or parata.duration<=wait+0.80\n    or design.duration<=budget or clock+budget>=381.48132335556 then return false end\nlocal action=ActionList:Get(1,36973)\nreturn action~=nil and action:CanCastResult(t.id)==0",
							name = "Own compressed Communio confirmed",
							uuid = "af244b6d-6779-d4e7-9e42-536026f9d133",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 6,
							buffIDList = 
							{
								2587,
								3858,
							},
							category = "Self",
							name = "No competing spender",
							uuid = "bd8c76cb-cab9-3077-b5fd-10f779e52d77",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 24393,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Gluttony ready",
							uuid = "3b27f352-406e-bb35-beeb-841eaccf8742",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s=data.kaptinRprDmuTrial\nlocal p,t=TensorCore.mGetPlayer(),TensorCore.mGetTarget()\nlocal now,clock=Now(),TensorReactions_CurrentTimer\nif not s or not s.trialActive then return false end\nlocal age=(now-s.trialAt)/1000\nif not p or not t or not p.alive or not p.incombat or not t.alive\n    or not t.targetable or not t.attackable or t.contentid~=7131\n    or p.id~=s.playerID or t.id~=s.trialTargetID\n    or s.trialCycleAt~=s.cycleAt or not s.known\n    or age<0 or age>15 or clock<356.48132335556 or clock>=379.98132335556\n    or math.abs((clock-s.trialTimeline)-age)>0.75 then\n  s.trialActive=false\n  s.trialAbortedCycle=s.trialCycleAt\n  s.trialResult=\"cancelled: target, life, age or clock\"\n  return false\nend\nif ACR_TensorReaper3_CD~=true or ACR_TensorReaper3_Gluttony~=true\n    or ACR_TensorReaper3_SoulGauge~=true or ACR_TensorReaper3_NoHolds~=false then return false end\nlocal g=p.gauge\nif type(g[1])~=\"number\" or g[1]<50 or g[1]>100\n    or g[3]~=0 or g[4]~=0 or s.active~=false then return false end\nif not p.pos or not t.pos or type(t.hitradius)~=\"number\"\n    or TensorCore.getDistance2d(p.pos,t.pos)>3+t.hitradius then return false end\nlocal gcd=ActionList:Get(1,24373)\nif not gcd or type(gcd.recasttime)~=\"number\" or gcd.recasttime<1.5 or gcd.recasttime>3\n    or type(gcd.cdmax)~=\"number\" or type(gcd.cd)~=\"number\" then return false end\nlocal wait=math.max(0,gcd.cdmax-gcd.cd)\nif s.trialStage~=\"perfectio\" or not s.perfectioAt\n    or s.perfectioAt<s.communioAt then return false end\nlocal budget=math.max(wait,0.85)+gcd.recasttime+2.0\nlocal design=TensorCore.getBuff(t,2586,p.id)\nif not design or design.duration<=budget or clock+budget>=381.48132335556 then return false end\nlocal action=ActionList:Get(1,24393)\nreturn action~=nil and action:CanCastResult(t.id)==0",
							name = "Own Perfectio; Gluttony package fits",
							uuid = "1a22341a-7581-6c5e-85f7-f5c360986f17",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization/Non-potion",
				mechanicTime = 381.48132335556,
				name = "[RPR Opti] P2 early Communio trial",
				timeRange = true,
				timelineIndex = 74,
				timerEndOffset = -1.5,
				timerStartOffset = -25,
				uuid = "8b6e82c1-c00e-2611-a129-79e40322dddb",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "Reaper Optimization",
				name = "Disabled drafts",
				uuid = "98162f6b-ec62-8d42-b40e-217b2ce2792b",
			},
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
				uuid = "79beab16-9ff9-59fa-3210-5eb0e47f5f46",
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
				uuid = "430c0f85-6d31-23a9-61f7-4b3bc63a6835",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Reaper Optimization",
				uuid = "da1d17eb-c935-2ba9-818c-a7ee49869382",
			},
			objectType = "folder",
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
							actionLua = "-- Public ACR potion ID; finite lease cannot leave a toggle disabled.\nTensorCore.API.TensorACR.holdActionUntil(846, Now() + 1000, 1)\nself.used = true",
							conditions = 
							{
								
								{
									"a912eac7-cd11-5122-8f4a-1b9a801e7885",
									true,
								},
								
								{
									"734adaaa-59a3-113f-8e5c-4dab1b9a2b17",
									true,
								},
								
								{
									"42893777-1e67-a73b-8800-7b34af234382",
									true,
								},
								
								{
									"3817a58d-47e7-7abe-ab5f-62d6b5cb447c",
									true,
								},
								
								{
									"70001aa9-3d30-1234-8b07-32d232f51d2c",
									true,
								},
								
								{
									"f263a13a-4551-fafc-9bb9-7f41de9c5a17",
									true,
								},
							},
							name = "Potion hold - expires in 1s",
							uuid = "78a27ba1-79d1-87af-b62a-8daf47f6511d",
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
								39,
							},
							name = "RPR",
							uuid = "a912eac7-cd11-5122-8f4a-1b9a801e7885",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							uuid = "734adaaa-59a3-113f-8e5c-4dab1b9a2b17",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 2,
							hpValue = 0.001,
							name = "Alive",
							uuid = "42893777-1e67-a73b-8800-7b34af234382",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return ACR_TensorReaper3_Potion == true\n  and ACR_TensorReaper3_CD == true\n  and ACR_TensorReaper3_ArcaneCircle == true\n  and ACR_TensorReaper3_NoHolds == false",
							name = "Potion + burst enabled",
							uuid = "3817a58d-47e7-7abe-ab5f-62d6b5cb447c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionCDValue = 2,
							actionID = 846,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Potion <=2s",
							uuid = "70001aa9-3d30-1234-8b07-32d232f51d2c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local a = ActionList:Get(1, 24405)\nif not a or a.isoncd ~= true then return false end\nif type(a.cd) ~= \"number\" or type(a.cdmax) ~= \"number\" or a.cdmax <= 0 then return false end\nreturn math.max(0, a.cdmax - a.cd) > 8 and a.cd > 6",
							name = "Hold until burst",
							uuid = "f263a13a-4551-fafc-9bb9-7f41de9c5a17",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization",
				loop = true,
				mechanicTime = 427.45958272918,
				name = "[RPR Opti] P3-P4 align ready potion",
				throttleTime = 400,
				timeRange = true,
				timelineIndex = 77,
				timerEndOffset = 538.18851940454,
				uuid = "0182935b-91c7-5cad-b4eb-73f08f23bf05",
				version = 2,
			},
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
									"6682c746-6800-7f42-b59b-c2588383e21e",
									true,
								},
								
								{
									"b5ab172e-9ccf-839b-a5ef-6795b7d8cfd6",
									true,
								},
								
								{
									"875235f8-26d0-d4a2-879f-1d3bcb769174",
									true,
								},
								
								{
									"891c5c7d-6378-55e5-b69e-64d6229bd849",
									true,
								},
								
								{
									"7f3a6575-4423-83b0-b2ce-27ee5de3d93b",
									true,
								},
								
								{
									"69c4ebf0-8b4c-b3b3-b37d-a60c963264b1",
									true,
								},
								
								{
									"ed2ca6ab-3072-e183-94ea-f305527a9fd8",
									true,
								},
								
								{
									"15590731-d4b7-dd41-b2f5-4036a1c5bb3f",
									true,
								},
							},
							potType = 4,
							usePot = true,
							uuid = "c2a1d12c-14f9-ddcf-8416-2b5ac5bafd71",
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
								39,
							},
							name = "RPR",
							uuid = "6682c746-6800-7f42-b59b-c2588383e21e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							uuid = "b5ab172e-9ccf-839b-a5ef-6795b7d8cfd6",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 2,
							hpValue = 0.001,
							name = "Alive",
							uuid = "875235f8-26d0-d4a2-879f-1d3bcb769174",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return ACR_TensorReaper3_Potion == true\n  and ACR_TensorReaper3_CD == true\n  and ACR_TensorReaper3_ArcaneCircle == true\n  and ACR_TensorReaper3_NoHolds == false",
							name = "Potion + burst enabled",
							uuid = "891c5c7d-6378-55e5-b69e-64d6229bd849",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionCDValue = 2,
							actionID = 846,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Potion <=2s",
							uuid = "7f3a6575-4423-83b0-b2ce-27ee5de3d93b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local a = ActionList:Get(1, 24405)\nif not a or type(a.isoncd) ~= \"boolean\" then return false end\nif not a.isoncd then return true end\nif type(a.cd) ~= \"number\" or type(a.cdmax) ~= \"number\" or a.cdmax <= 0 then return false end\nreturn math.max(0, a.cdmax - a.cd) <= 8 or a.cd <= 6",
							name = "Arcane Circle window",
							uuid = "69c4ebf0-8b4c-b3b3-b37d-a60c963264b1",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local p = TensorCore.mGetPlayer()\nlocal t = TensorCore.mGetTarget()\nif not p or not t or t.alive ~= true or t.attackable ~= true or t.targetable ~= true then return false end\nif not p.pos or not t.pos or type(t.hitradius) ~= \"number\" then return false end\nreturn TensorCore.getDistance2d(p.pos, t.pos) <= 3 + t.hitradius",
							name = "Live melee target",
							uuid = "ed2ca6ab-3072-e183-94ea-f305527a9fd8",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local p = TensorCore.mGetPlayer()\nlocal t = TensorCore.mGetTarget()\nif not p or not t then return false end\nlocal fated = TensorCore.hasBuff(p, 4194)\nlocal epic = TensorCore.hasBuff(p, 4192)\nreturn (fated and not epic and t.contentid == 6052)\n  or (epic and not fated and t.contentid == 7691)",
							name = "Assigned P3 boss",
							uuid = "15590731-d4b7-dd41-b2f5-4036a1c5bb3f",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization",
				mechanicTime = 427.45958272918,
				name = "[RPR Opti] P3 return burst potion",
				timeRange = true,
				timelineIndex = 77,
				timerEndOffset = 70,
				uuid = "21bb4ff3-6f79-462f-a67a-32d8160f9bc7",
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
				uuid = "9344040c-fe5d-d768-b129-59ce58a2cefc",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[Opti] Target Boss of your debuff",
				uuid = "f1c24f07-4fe2-5ed7-9099-0443972c4ff6",
				version = 2,
			},
			inheritedObjectUUID = "a5eab0c0-8148-2269-a73b-877cd8fcddfc",
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
								name = "Target Chaos",
								uuid = "8467eff0-7ba0-89d7-a89a-36c03773ba2b",
								version = 2.1,
							},
							inheritedObjectUUID = "1f3b8fe9-7f25-1339-af67-1e4e67d0db96",
							inheritedOverwrites = 
							{
								conditions = 
								{
									
									{
										type = "remove",
										value = 
										{
											"a358d095-18af-221c-9173-99f92e6f5841",
											true,
										},
									},
									
									{
										position = 1,
										type = "add",
										value = 
										{
											"ffa58145-ae03-f96f-82ce-51ed924aa0f1",
											true,
										},
									},
									
									{
										position = 2,
										type = "add",
										value = 
										{
											"a358d095-18af-221c-9173-99f92e6f5841",
											true,
										},
									},
								},
							},
						},
					},
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "Target Exdeath",
								uuid = "a945c54a-97a7-915d-bfd9-811d39f05bd2",
								version = 2.1,
							},
							inheritedObjectUUID = "a261ce8f-9c82-2df7-8258-d25ce4a5ac87",
							inheritedOverwrites = 
							{
								conditions = 
								{
									
									{
										type = "remove",
										value = 
										{
											"370181de-e82b-921a-8ff6-b04baf02e001",
											true,
										},
									},
									
									{
										position = 1,
										type = "add",
										value = 
										{
											"ffa58145-ae03-f96f-82ce-51ed924aa0f1",
											true,
										},
									},
									
									{
										position = 2,
										type = "add",
										value = 
										{
											"370181de-e82b-921a-8ff6-b04baf02e001",
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
								category = "Party",
								conditionType = 10,
								dequeueIfLuaFalse = true,
								name = "Self Assignment",
								partyTargetType = "Event Entity",
								uuid = "ffa58145-ae03-f96f-82ce-51ed924aa0f1",
								version = 3,
							},
						},
					},
				},
				displayPath = "store\\anyone\\dmu\\main/anyone\\dmu\\modules\\optimization",
			},
		},
	},
	[79] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "8a08f8e1-1ff3-f57d-4c7c-2a4f1240cf51",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6e17a227-3264-4643-d75b-b1f1b05b2897",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "e60ff52b-eb8e-993f-4383-06a10c41cb9b",
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
				uuid = "de7b408a-c745-0fee-d907-3ed46cbdbbfa",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[86] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "af18da49-10a1-85a5-86c0-78a312a91e39",
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
				uuid = "782c2888-dd0c-492c-0c1d-18462eefb9f8",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "fd7e5d77-6d0d-13cb-8fe7-8fd938f38667",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "88b747b9-b090-c55d-7b8a-ac3f3d8a89a9",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[93] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "de6a5181-4be7-ba45-4646-aaaf5d7ac5f1",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1b916887-542a-604b-8894-c81128d1d777",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "e2cbe57a-f7dc-0a26-be06-c338b943596a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[98] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e65f4e2e-e33f-bfc2-6d08-5c2ca2b1901e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[101] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "d6cd55e3-2f34-32bf-7049-e441e4c13913",
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
				uuid = "18432248-b4e6-5494-c1af-c7763af70478",
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
				uuid = "b58023a3-1d9d-bb4f-c559-b079069e3553",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "2b3f8e72-dcef-6a46-3b16-6290552b53a2",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6ca1a17e-6e5e-84a2-70c0-6ec07c586f2e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[105] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "7242b1a1-c8be-a135-3386-e6db014a2a51",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "3e553029-9c52-925d-beb8-781b13484719",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "2f22758f-a143-3863-4a26-226df4cfa77f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[108] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "be2e0d2e-4905-9f5a-5260-2804ddb6215e",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "a462e04a-2037-3006-b900-28c478c5067a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[112] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "91311367-194a-6473-5df5-ec912073e557",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "627d58fa-d867-a996-6b90-fe9cea9571aa",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "d9f575e6-f5ca-1932-c716-933c4e131ed6",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "6a4947f0-4444-bf24-a1d5-bc4a56970620",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "1d636d09-a983-4bb5-0176-5bffaa7c87f9",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "f377fdaf-5e5e-e93b-6fb5-8da18fa1811f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[122] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "35ed1412-1162-d30e-f4c1-5cf0d8d32d42",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "a5c4ca5e-bbc7-926a-0cec-62607201ad0e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "a1fb7dc2-4ada-5fe6-a196-1ecc0462d172",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[129] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b07f70b7-0541-e543-10aa-dc45330a4ee7",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "43309162-f189-5cde-891d-d7343b2b3e52",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "8600cdee-6f41-f4fa-cbc8-7ef4aeb8da9e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[135] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "f1e85c76-ebd3-3e4a-8972-6e58448a8be6",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "ec907a52-87ef-f036-4464-00e81de17102",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "424cda0d-3d13-5001-79a1-dcc36ed736fd",
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
				uuid = "762e4b28-0217-f10c-0c56-56e6c1a6a358",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "4d7b4437-f894-7493-09e3-60711d9055e7",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "c7e6d479-6bdc-b565-9e7e-9af74991d429",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "713ef402-921a-da76-984d-97687f415272",
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
				uuid = "c59fc64f-b9ab-16d3-d0c4-414dc6c50bff",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[143] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "e3953ef9-e27f-580d-ac8d-04139256f429",
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
				uuid = "93e7aa18-2c72-36c4-e5fd-e82e08d38e48",
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
				uuid = "28005773-1b2f-413f-6aef-a351a6108fa3",
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
				uuid = "ba45bbd6-be22-f33a-9a53-4d002b6d2f46",
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
				uuid = "922ec483-2987-3d67-3be7-2bb564b9dab3",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Reaper Optimization",
				uuid = "3e64a87d-fd54-f2de-8593-039dee9ad927",
			},
			objectType = "folder",
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
									"d979b80f-eff0-8213-8ea3-69e795d50fdf",
									true,
								},
								
								{
									"96cf166a-ef92-7f1c-94ee-b95ae06945f6",
									true,
								},
								
								{
									"aaaf3712-a482-d45e-93f0-24f0d02aba5c",
									true,
								},
								
								{
									"427a37dc-3adc-39e1-9354-82d10a30ecef",
									true,
								},
								
								{
									"671189cf-dc31-27db-b4e5-0fdf478477b0",
									true,
								},
								
								{
									"074fcc6d-0088-8460-8d9b-0e7d7f6542ea",
									true,
								},
								
								{
									"43359dcd-09e3-d09d-9c06-41bff33fd1d1",
									true,
								},
							},
							potType = 4,
							usePot = true,
							uuid = "a6657626-855a-88da-8b02-321c62c4817c",
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
								39,
							},
							name = "RPR",
							uuid = "d979b80f-eff0-8213-8ea3-69e795d50fdf",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							uuid = "96cf166a-ef92-7f1c-94ee-b95ae06945f6",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 2,
							hpValue = 0.001,
							name = "Alive",
							uuid = "aaaf3712-a482-d45e-93f0-24f0d02aba5c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return ACR_TensorReaper3_Potion == true\n  and ACR_TensorReaper3_CD == true\n  and ACR_TensorReaper3_ArcaneCircle == true\n  and ACR_TensorReaper3_NoHolds == false",
							name = "Potion + burst enabled",
							uuid = "427a37dc-3adc-39e1-9354-82d10a30ecef",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionCDValue = 2,
							actionID = 846,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Potion <=2s",
							uuid = "671189cf-dc31-27db-b4e5-0fdf478477b0",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local a = ActionList:Get(1, 24405)\nif not a or type(a.isoncd) ~= \"boolean\" then return false end\nif not a.isoncd then return true end\nif type(a.cd) ~= \"number\" or type(a.cdmax) ~= \"number\" or a.cdmax <= 0 then return false end\nreturn math.max(0, a.cdmax - a.cd) <= 8 or a.cd <= 6",
							name = "Arcane Circle window",
							uuid = "074fcc6d-0088-8460-8d9b-0e7d7f6542ea",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local p = TensorCore.mGetPlayer()\nlocal t = TensorCore.mGetTarget()\nif not p or not t or t.alive ~= true or t.attackable ~= true or t.targetable ~= true then return false end\nif not p.pos or not t.pos or type(t.hitradius) ~= \"number\" then return false end\nreturn TensorCore.getDistance2d(p.pos, t.pos) <= 3 + t.hitradius",
							name = "Live melee target",
							uuid = "43359dcd-09e3-d09d-9c06-41bff33fd1d1",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization",
				mechanicTime = 801.88345429349,
				name = "[RPR Opti] P4 return burst potion",
				timeRange = true,
				timelineIndex = 150,
				timerEndOffset = 70,
				uuid = "310d06ca-3785-7ccf-9f9b-b522e86950ba",
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
				uuid = "b30f2818-9b3d-232c-90e7-f9c6d097a408",
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
				uuid = "d6eca755-0104-6c99-146b-c2e303c86c45",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "236eaea6-4854-326a-52bd-12384b16a2d6",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "febe86c2-6906-b996-77ca-c2886125da72",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[154] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "3c185a49-8a26-ef75-e32c-c23f1269c539",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "a0bcc4ef-9b7e-dafb-8c0c-33e16eaf445f",
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
				uuid = "466bcab4-99c3-d7e0-92cd-07beeb9ca264",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "4cbb7b1f-bc5a-43fb-ff97-e7690523168f",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "57d88d01-d9b9-858d-90c6-45cf25e48231",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[157] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "c3078f12-a539-c67e-5594-4e1465eda842",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "0287d35e-6f70-7d5a-280e-df14cec4b60e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "6fa9274b-0869-29df-9564-503d01c4f57b",
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
				uuid = "c9282a30-8556-87e4-de19-da8a0009f260",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[162] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "5156dede-8456-f702-caf0-003c30473c4e",
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
				uuid = "8b23bfdb-d8b7-c94f-fe85-3f3110ad51cb",
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
				uuid = "61e5730c-5680-ecc8-f813-074e0324353c",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "563d7bec-a809-8b18-a05c-16aa0fa1a39c",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "9ce0d201-3af5-1f2d-d879-1ccb36b97431",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "37228e07-3c22-3873-c982-685da10fdcb7",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "170b0636-9907-1032-c69b-0630a7283426",
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
				uuid = "bbf4ddf7-8c2f-e973-b753-c34590a444a7",
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
				uuid = "c08f08f8-c2f7-0a8c-fffa-af5e773757a8",
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
				uuid = "8c3639d3-9dca-a8a7-554b-690125fc2783",
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
				uuid = "c238ee6b-5fd3-7e1f-58f6-78958407281b",
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
				uuid = "fa0c660a-16a9-b45e-cd83-77c03dce753a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Reaper Optimization",
				uuid = "5d8e8d92-df42-a42a-9dce-b7a174da744d",
			},
			objectType = "folder",
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
									"f6d78b14-f42e-d6bf-82f5-0e482a850753",
									true,
								},
								
								{
									"7fcea588-21b9-c1f9-a7bc-3f091adf18ee",
									true,
								},
								
								{
									"70da6582-79fe-17bc-af90-93279991476d",
									true,
								},
								
								{
									"efcdcb4a-29e6-6e5d-897a-f3f8734fd80e",
									true,
								},
								
								{
									"92d46668-742c-dfd0-a1a7-6b23a8744920",
									true,
								},
								
								{
									"71bd4006-0795-ad00-a937-bb51857fef49",
									true,
								},
								
								{
									"f633e16d-e4cc-e99a-98b1-b8630963e5f5",
									true,
								},
							},
							potType = 4,
							usePot = true,
							uuid = "4e3f1b5a-2f42-295c-a265-b16b2fc1f786",
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
								39,
							},
							name = "RPR",
							uuid = "f6d78b14-f42e-d6bf-82f5-0e482a850753",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 7,
							uuid = "7fcea588-21b9-c1f9-a7bc-3f091adf18ee",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 2,
							hpValue = 0.001,
							name = "Alive",
							uuid = "70da6582-79fe-17bc-af90-93279991476d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return ACR_TensorReaper3_Potion == true\n  and ACR_TensorReaper3_CD == true\n  and ACR_TensorReaper3_ArcaneCircle == true\n  and ACR_TensorReaper3_NoHolds == false",
							name = "Potion + burst enabled",
							uuid = "efcdcb4a-29e6-6e5d-897a-f3f8734fd80e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionCDValue = 2,
							actionID = 846,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Potion <=2s",
							uuid = "92d46668-742c-dfd0-a1a7-6b23a8744920",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local a = ActionList:Get(1, 24405)\nif not a or type(a.isoncd) ~= \"boolean\" then return false end\nif not a.isoncd then return true end\nif type(a.cd) ~= \"number\" or type(a.cdmax) ~= \"number\" or a.cdmax <= 0 then return false end\nreturn math.max(0, a.cdmax - a.cd) <= 8 or a.cd <= 6",
							name = "Arcane Circle window",
							uuid = "71bd4006-0795-ad00-a937-bb51857fef49",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local p = TensorCore.mGetPlayer()\nlocal t = TensorCore.mGetTarget()\nif not p or not t or t.alive ~= true or t.attackable ~= true or t.targetable ~= true then return false end\nif not p.pos or not t.pos or type(t.hitradius) ~= \"number\" then return false end\nreturn TensorCore.getDistance2d(p.pos, t.pos) <= 3 + t.hitradius",
							name = "Live melee target",
							uuid = "f633e16d-e4cc-e99a-98b1-b8630963e5f5",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization",
				mechanicTime = 965.64810213372,
				name = "[RPR Opti] P5 available burst potion",
				timeRange = true,
				timelineIndex = 171,
				timerEndOffset = 218.35189786628,
				uuid = "268d62df-e9a5-819b-9e9c-7e0e9536f7fe",
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
				uuid = "01a11aab-b4de-a5ef-a6e9-2b6d26a476db",
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
				uuid = "b67a2ca0-e856-55f4-a69e-9a1e00651290",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[177] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "ea421dfc-f78b-d5a8-1e72-d0768c58732c",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[179] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "fd799aa2-277c-b226-46fc-5338dd20e652",
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
				name = "Lj\\umad\\draws_lpdu",
				uuid = "fdb6901e-5eb8-c34a-6532-8ed470751c8e",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "f07b003a-2b2c-e736-61fc-ced468879aea",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "c060c937-9e3b-c2db-86a5-9a9d9075dae7",
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
				uuid = "3f04fe2c-ca67-b980-ebdd-39e2c65514dc",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[188] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "64cde176-dbe4-1422-f8ab-799cb77010e6",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[191] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "ab03e0d4-463a-5090-386a-2f0ea9720304",
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
				uuid = "157fa8a1-c578-bcbd-d854-bd5fa4872151",
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
				uuid = "0fde987e-0e2e-470a-5542-1b641f95662e",
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
				uuid = "9d6d2d2b-d1e5-5cc7-ba91-e42910623a5b",
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
				uuid = "196e03ae-41e4-d75a-c5a1-b3d4d695595e",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[208] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "a198db23-6b2b-234f-3517-4e09542b9d53",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[209] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "2f020078-9a7a-f694-e43c-129ac9610468",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "045bd9c8-0273-bc94-ca81-7f4688846c78",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "64d9b50a-16b4-f8e6-3fe9-c804e7bbd37a",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b055a2f6-4886-6002-4b32-08c4a1ead966",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[212] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "c30311cc-93d1-1058-bf6d-456268776b7c",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[216] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "5f664a40-8cc7-f4f4-7c35-3652323eab70",
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
				uuid = "9e7087e2-cfba-048e-e3ff-cf4c340a7652",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[219] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "8d8fc22f-ef5b-0c0b-5dd3-84413cd70e5f",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[221] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "cbd2a096-aafd-9a42-de22-270c68d24206",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "fad57632-9ca6-9c0e-e5e2-37ec599cb862",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
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
				uuid = "d7065ec8-d168-6264-c7dd-744a59008478",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
	},
	[225] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_lpdu",
				uuid = "04dc6902-9026-94d6-1a39-dc50b07e08f2",
			},
			inheritanceRoot = "Lj\\umad\\draws_lpdu",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b29c54ce-2f07-c072-45ea-9480349704fe",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[227] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Reaper Optimization",
				uuid = "2ed767af-4a81-2ffa-a4af-248599c6ad46",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "Reaper Optimization",
				name = "Non-potion",
				uuid = "8e740599-23ba-d248-b11c-607d4a3c865c",
			},
			objectType = "folder",
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
							actionLua = "local p,t=TensorCore.mGetPlayer(),TensorCore.mGetTarget()\nlocal c=t.castinginfo\ndata.kaptinRprTerminal={\n  playerID=p.id,targetID=t.id,spellID=eventArgs.spellID,\n  at=Now(),clock=TensorReactions_CurrentTimer,\n  deadline=Now()+(26-c.channeltime)*1000\n}\nself.used=true",
							conditions = 
							{
								
								{
									"f3b30c49-5379-ff29-bf88-2c1db186ec3b",
									true,
								},
								
								{
									"70ef87df-8811-a3ae-8678-03c3e00f9ece",
									true,
								},
							},
							name = "Capture enrage caster and deadline",
							uuid = "4ebb2adb-9ff0-0845-8ebc-bb951f34aabb",
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
								39,
							},
							name = "RPR",
							uuid = "f3b30c49-5379-ff29-bf88-2c1db186ec3b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local p,t=TensorCore.mGetPlayer(),TensorCore.mGetTarget()\nlocal clock=TensorReactions_CurrentTimer\nif not p or not t or not p.alive or not p.incombat\n    or t.id~=eventArgs.entityID or not t.alive or not t.attackable or not t.targetable\n    or eventArgs.channelTimeMax~=26 then return false end\nlocal c=t.castinginfo\nif not c or c.channelingid~=eventArgs.spellID or c.casttime~=26\n    or type(c.channeltime)~=\"number\" or c.channeltime<0 or c.channeltime>0.75\n    or math.abs(clock+26-c.channeltime-1185.8235474604)>0.75 then return false end\nreturn true",
							name = "Observed 26s enrage at native deadline",
							uuid = "70ef87df-8811-a3ae-8678-03c3e00f9ece",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization/Non-potion",
				eventType = 3,
				mechanicTime = 1185.8235474604,
				name = "[RPR Opti] Observe final enrage",
				timeRange = true,
				timelineIndex = 227,
				timerEndOffset = -24,
				timerStartOffset = -28,
				uuid = "7a99fb18-bb5c-8547-8f81-759fd710aebd",
				version = 2,
			},
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
							actionLua = "local e,s=data.kaptinRprTerminal,data.kaptinRprDmuTrial\ne.cycleAt,e.reapings,e.armAt=s.cycleAt,s.reapingCount,Now()\ne.result=\"armed: terminal Communio + Perfectio trial\"\nself.used=true",
							conditions = 
							{
								
								{
									"eb27cf91-4775-870b-bbfe-2a3fd5e3f910",
									true,
								},
								
								{
									"3ef5bece-5553-0891-ba3c-03a7f6b1b143",
									true,
								},
							},
							name = "Arm final cycle",
							uuid = "2178ca5f-e29f-9dff-a304-1820d4f4df30",
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							actionID = 24398,
							conditions = 
							{
								
								{
									"eb27cf91-4775-870b-bbfe-2a3fd5e3f910",
									true,
								},
								
								{
									"15146594-3e92-78d1-b4dc-1469cda20583",
									true,
								},
								
								{
									"3ef5bece-5553-0891-ba3c-03a7f6b1b143",
									true,
								},
							},
							targetType = "Current Target",
							uuid = "3d4085f5-06a0-342f-8939-a9608c397774",
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							actionID = 36973,
							conditions = 
							{
								
								{
									"eb27cf91-4775-870b-bbfe-2a3fd5e3f910",
									true,
								},
								
								{
									"15146594-3e92-78d1-b4dc-1469cda20583",
									true,
								},
								
								{
									"ee3f084a-43fd-e9f1-9edf-ead867381193",
									true,
								},
								
								{
									"c6b4d8df-cfe5-189d-9fb8-81ab589f251d",
									true,
								},
							},
							targetType = "Current Target",
							uuid = "d0d87147-0506-e458-aed0-fba6f9073e18",
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
								39,
							},
							name = "RPR",
							uuid = "eb27cf91-4775-870b-bbfe-2a3fd5e3f910",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local e=data.kaptinRprTerminal\nlocal s=data.kaptinRprDmuTrial\nlocal p,t=TensorCore.mGetPlayer(),TensorCore.mGetTarget()\nlocal now,clock=Now(),TensorReactions_CurrentTimer\nif e and e.armAt and (not t or t.id~=e.targetID or not t.alive or not t.targetable) then e.invalid=true end\nif not e or not s or not p or not t or not p.alive or not p.incombat\n    or p.id~=e.playerID or p.id~=s.playerID or t.id~=e.targetID\n    or not t.alive or not t.targetable or not t.attackable\n    or e.invalid or clock<1173.8235474604 or clock>=1185.8235474604 then return false end\nlocal c=t.castinginfo\nlocal age=(now-e.at)/1000\nif not c or c.channelingid~=e.spellID or c.casttime~=26\n    or type(c.channeltime)~=\"number\" or c.channeltime<0 or c.channeltime>26\n    or age<0 or age>28 or math.abs(clock-e.clock-age)>0.75\n    or math.abs((e.deadline-now)/1000-(26-c.channeltime))>0.75 then\n  e.invalid=true\n  return false\nend\nlocal horizon=math.min(1185.8235474604-clock,(e.deadline-now)/1000,26-c.channeltime)\nif ACR_TensorReaper3_CD~=true or ACR_TensorReaper3_Enshroud~=true\n    or ACR_TensorReaper3_NoHolds~=false then return false end\nif not p.pos or not t.pos or type(t.hitradius)~=\"number\"\n    or TensorCore.getDistance2d(p.pos,t.pos)>3+t.hitradius then return false end\nlocal design=TensorCore.getBuff(t,2586,p.id)\nif not design or type(design.duration)~=\"number\" or design.duration<=horizon then return false end\n\nif s.known~=true or s.active~=true or s.cycleTargetID~=t.id\n    or not s.cycleAt or not s.sacrAt or s.sacrAt<s.cycleAt\n    or now<s.sacrAt or now-s.cycleAt>30000 then return false end\nlocal g=p.gauge\nif not g then return false end\nfor i=1,5 do\n  if type(g[i])~=\"number\" or g[i]~=g[i] or g[i]%1~=0 then return false end\nend\nlocal soul,shroud,ensh,lemure,void=g[1],g[2],g[3],g[4],g[5]\n-- Narrow resource state: no unmodeled post-cycle avatar or Enshroud package.\nif soul<0 or soul>=50 or shroud<0 or shroud>=50 or ensh<=horizon*1000\n    or ensh>30000 or lemure<3 or lemure>5 or void<0 or void>=2\n    or s.reapingCount~=5-lemure then return false end\nif e.cycleAt and (e.cycleAt~=s.cycleAt or e.reapings~=s.reapingCount) then return false end\nif TensorCore.hasBuff(p,2587) or TensorCore.hasBuff(p,3858)\n    or TensorCore.hasBuff(p,3860) or TensorCore.hasBuff(p,3857)\n    or TensorCore.hasBuff(p,3905) or TensorCore.hasBuff(p,2594)\n    or TensorCore.hasBuff(p,2592) then return false end\nlocal occulta=TensorCore.getBuff(p,3859)\nif not occulta or type(occulta.duration)~=\"number\" or occulta.duration<=horizon then return false end\nlocal comm,reap,perf=ActionList:Get(1,24398),ActionList:Get(1,24395),ActionList:Get(1,36973)\nif not comm or not reap or not perf or comm.id~=24398\n    or type(comm.cdmax)~=\"number\" or type(comm.cd)~=\"number\"\n    or type(comm.casttime)~=\"number\" or comm.casttime<=0\n    or type(comm.recasttime)~=\"number\" or comm.recasttime<1.5 or comm.recasttime>3\n    or reap.recasttime~=1.5 or type(perf.recasttime)~=\"number\"\n    or perf.recasttime<1.5 or perf.recasttime>3 then return false end\nlocal wait=math.max(0,comm.cdmax-comm.cd)\n-- 7.5 single-target potency bounds; conservative trial timing, not measured latency.\n-- Compare landed prefixes, including consuming ALL Lemure without Communio.\n-- Alternatives get zero added weave cost, so optional skipped-weave paths cannot be missed.\nlocal function reapScore(k)\n  local score=0\n  for i=1,k do\n    local start=wait+(i-1)*(reap.recasttime+0.10)\n    if start+0.80+1.20<horizon then score=score+640 end\n    if (void+i)%2==0 and start+0.85+0.80+1.20<horizon then score=score+280 end\n  end\n  return score\nend\nlocal bestK,bestScore,zeroFinish=nil,-1,nil\nlocal alternative=-1\nfor k=0,lemure-1 do\n  local start=wait+k*(reap.recasttime+0.10)\n  local commHit=start+comm.casttime+0.80\n  local perfStart=math.max(start+comm.recasttime+0.10,commHit+0.20)\n  local finish=perfStart+0.80+1.20\n  local score=reapScore(k)\n  if commHit+1.20<horizon then score=score+1100 end\n  if finish<horizon then score=score+1300 end\n  if k==lemure-1 and finish<horizon then return false end\n  if k==0 then zeroFinish=finish else alternative=math.max(alternative,score) end\n  if score>=bestScore then bestK,bestScore=k,score end\nend\nlocal pure=reapScore(lemure)\n-- Optimistic 1300-potency filler bound if a GCD can follow complete gauge consumption.\nlocal nextGcd=wait+lemure*(reap.recasttime+0.10)\nwhile nextGcd+0.80+1.20<horizon do\n  pure=pure+1300\n  nextGcd=nextGcd+perf.recasttime\nend\nalternative=math.max(alternative,pure)\nif bestK~=0 or bestScore~=2400 or zeroFinish>=horizon\n    or bestScore<=alternative+100 or comm:CanCastResult(t.id)~=0 then return false end\ne.candidateScore,e.alternativeScore,e.finish=bestScore,alternative,zeroFinish\nreturn true",
							name = "Terminal package beats remaining Reapings",
							uuid = "3ef5bece-5553-0891-ba3c-03a7f6b1b143",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionUUID = "2178ca5f-e29f-9dff-a304-1820d4f4df30",
							category = "Action",
							name = "Final cycle armed",
							uuid = "15146594-3e92-78d1-b4dc-1469cda20583",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local e=data.kaptinRprTerminal\nlocal s=data.kaptinRprDmuTrial\nlocal p,t=TensorCore.mGetPlayer(),TensorCore.mGetTarget()\nlocal now,clock=Now(),TensorReactions_CurrentTimer\nif e and e.armAt and (not t or t.id~=e.targetID or not t.alive or not t.targetable) then e.invalid=true end\nif not e or not s or not p or not t or not p.alive or not p.incombat\n    or p.id~=e.playerID or p.id~=s.playerID or t.id~=e.targetID\n    or not t.alive or not t.targetable or not t.attackable\n    or e.invalid or clock<1173.8235474604 or clock>=1185.8235474604 then return false end\nlocal c=t.castinginfo\nlocal age=(now-e.at)/1000\nif not c or c.channelingid~=e.spellID or c.casttime~=26\n    or type(c.channeltime)~=\"number\" or c.channeltime<0 or c.channeltime>26\n    or age<0 or age>28 or math.abs(clock-e.clock-age)>0.75\n    or math.abs((e.deadline-now)/1000-(26-c.channeltime))>0.75 then\n  e.invalid=true\n  return false\nend\nlocal horizon=math.min(1185.8235474604-clock,(e.deadline-now)/1000,26-c.channeltime)\nif ACR_TensorReaper3_CD~=true or ACR_TensorReaper3_Enshroud~=true\n    or ACR_TensorReaper3_NoHolds~=false then return false end\nif not p.pos or not t.pos or type(t.hitradius)~=\"number\"\n    or TensorCore.getDistance2d(p.pos,t.pos)>3+t.hitradius then return false end\nlocal design=TensorCore.getBuff(t,2586,p.id)\nif not design or type(design.duration)~=\"number\" or design.duration<=horizon then return false end\n\nif not e.armAt or now<e.armAt or now-e.armAt>10000\n    or e.cycleAt~=s.cycleAt or e.reapings~=s.reapingCount\n    or s.known~=true or s.active~=false or s.communioTargetID~=t.id\n    or not s.communioAt or s.communioAt<e.armAt\n    or (s.perfectioAt and s.perfectioAt>=s.communioAt) then return false end\nlocal g=p.gauge\nif not g or g[3]~=0 or g[4]~=0 then return false end\nlocal parata=TensorCore.getBuff(p,3860)\nlocal action=ActionList:Get(1,36973)\nif not parata or type(parata.duration)~=\"number\" or not action\n    or type(action.cdmax)~=\"number\" or type(action.cd)~=\"number\" then return false end\nlocal wait=math.max(0,action.cdmax-action.cd)\nif wait+0.80+1.20>=horizon or parata.duration<=wait+0.80 then return false end\nreturn action:CanCastResult(t.id)==0",
							name = "Own Communio confirmed; Perfectio fits",
							uuid = "c6b4d8df-cfe5-189d-9fb8-81ab589f251d",
							version = 3,
						},
					},
					
					{
						data = 
						{
							buffCheckType = 6,
							buffIDList = 
							{
								2587,
								3858,
							},
							category = "Self",
							name = "No pending avatar proc",
							uuid = "ee3f084a-43fd-e9f1-9edf-ead867381193",
							version = 3,
						},
					},
				},
				displayPath = "Reaper Optimization/Non-potion",
				mechanicTime = 1185.8235474604,
				name = "[RPR Opti] Final Communio + Perfectio trial",
				timeRange = true,
				timelineIndex = 227,
				timerEndOffset = -0.5,
				timerStartOffset = -12,
				uuid = "a32b100d-9496-4797-bb42-7c6f6352b61e",
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