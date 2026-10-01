local tbl = 
{
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local marker = eventArgs.markerID\nlocal id = eventArgs.entityID\nlocal now = Now()\nlocal function clearState(state)\n    if not state then return end\n    for _, uuid in ipairs(state.draws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end\n    for _, uuid in ipairs(state.texts or {}) do if uuid then AnyoneCore.removeTimedWorldText(uuid) end end\nend\nif marker == 332 then\n    clearState(data.amtRaidplanHeaven)\n    data.amtRaidplanHeaven = { draws = {}, texts = {}, startedAt = now }\nend\nlocal state = data.amtRaidplanHeaven\nif not state or not state.startedAt or now - state.startedAt > 10000 then\n    clearState(state)\n    state = { draws = {}, texts = {}, startedAt = now }\n    data.amtRaidplanHeaven = state\nend\nstate.lastAt = now\nif marker == 332 then state.one = id\nelseif marker == 333 then state.two = id\nelseif marker == 652 then state.prey = id end\nself.used = true",
						conditions = 
						{
							
							{
								"ef39d203-9568-3411-9495-ab89f8dc7a0c",
								true,
							},
							
							{
								"117cf3f8-1ac6-2053-ab69-adade448a51d",
								true,
							},
						},
						name = "Capture Heaven assignment markers",
						uuid = "fd83c86f-a9cd-178c-87b2-e5598aaec591",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "ef39d203-9568-3411-9495-ab89f8dc7a0c",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id = eventArgs.markerID\nreturn id == 332 or id == 333 or id == 652",
						dequeueIfLuaFalse = true,
						name = "Heaven order/prey marker",
						uuid = "117cf3f8-1ac6-2053-ab69-adade448a51d",
						version = 3,
					},
				},
			},
			eventType = 4,
			name = "[Raidplan] Heaven Marker Capture",
			uuid = "d0fb95ca-6b64-31e9-b69d-bf38834f1e46",
			version = 2,
		},
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
						actionLua = "local state = data.amtRaidplanHeaven\nlocal player = TensorCore.mGetPlayer()\nif not state or not player or not player.pos then self.used = true return end\nfor _, uuid in ipairs(state.draws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end\nfor _, uuid in ipairs(state.texts or {}) do if uuid then AnyoneCore.removeTimedWorldText(uuid) end end\nstate.draws = {}\nstate.texts = {}\nlocal party = TensorCore.getEntityGroupList(\"Party\", \"Number\") or {}\nlocal marked = { [state.one] = true, [state.two] = true, [state.prey] = true }\nlocal unmarked\nfor _, ent in pairs(party) do\n    if ent and ent.id and not marked[ent.id] then unmarked = ent.id break end\nend\nstate.unmarked = unmarked\nlocal spell = eventArgs.spellID\nlocal near = spell == 47566 or spell == 47568\nlocal pair = spell == 47568 or spell == 47569\nlocal circleID = near and state.one or state.two\nlocal donutID = near and state.two or state.one\nlocal lifetime = math.max(1000, math.floor(((tonumber(eventArgs.channelTimeMax) or 5) + 1.0) * 1000))\nlocal danger = TensorCore.getMoogleDrawer()\nif TensorCore.mGetEntity(circleID) then\n    local uuid = danger:addTimedCircleOnEnt(lifetime, circleID, 8, 0, false, true)\n    if uuid then table.insert(state.draws, uuid) end\nend\nif TensorCore.mGetEntity(donutID) then\n    local uuid = danger:addTimedDonutOnEnt(lifetime, donutID, 8, 60, 0, false, true)\n    if uuid then table.insert(state.draws, uuid) end\nend\nlocal A = { x = 170, y = -15.97, z = -822 }\nlocal C = { x = 170, y = -15.97, z = -808 }\nlocal D = { x = 170, y = -15.97, z = -815 }\nlocal spot\nlocal partner\nlocal call\nif player.id == circleID then\n    spot = C\n    call = \"Point blank at C\"\nelseif player.id == donutID then\n    spot = D\n    call = \"Donut at D\"\n    if not pair then partner = unmarked end\nelseif player.id == state.prey then\n    spot = A\n    if pair then partner = unmarked call = \"Pair at A\" else call = \"Solo at A\" end\nelse\n    if pair then spot = A partner = state.prey call = \"Pair with prey at A\"\n    else spot = D partner = donutID call = \"Pair with donut at D\" end\nend\nlocal green = GUI:ColorConvertFloat4ToU32(0.10, 1.0, 0.20, 0.88)\nlocal safe = TensorCore.getStaticFlatDrawer(green)\nlocal spotUUID = safe:addTimedCircle(lifetime, spot.x, spot.y, spot.z, 1.15, 0, false, true)\nif spotUUID then table.insert(state.draws, spotUUID) end\nif partner and partner ~= player.id and TensorCore.mGetEntity(partner) then\n    local partnerUUID = safe:addTimedCircleOnEnt(lifetime, partner, 1.6, 0, false, true)\n    if partnerUUID then table.insert(state.draws, partnerUUID) end\n    local textUUID = AnyoneCore.addTimedWorldTextOnEnt(lifetime, \"PAIR\", partner, green, true, 1.4, 2.5)\n    if textUUID then table.insert(state.texts, textUUID) end\nend\nTensorCore.addAlertText(3500, call, 1.35, 2, true, 90)\nstate.solved = true\nstate.spell = spell\nself.used = true",
						conditions = 
						{
							
							{
								"caf63896-f88f-a5cd-adf1-ec6a41493f06",
								true,
							},
							
							{
								"e608f87b-7d58-99c7-bb71-e7e0fe20d9e7",
								true,
							},
							
							{
								"5794d1c9-b4be-5a8e-9dc9-6f4ae15d6a83",
								true,
							},
						},
						name = "Draw personal Heaven solution",
						uuid = "e62d9acb-ac55-4dbe-9ef2-4ee82749afc4",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "caf63896-f88f-a5cd-adf1-ec6a41493f06",
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
						name = "Near/Far from Heaven",
						spellIDList = 
						{
							47566,
							47567,
							47568,
							47569,
						},
						uuid = "e608f87b-7d58-99c7-bb71-e7e0fe20d9e7",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local s = data.amtRaidplanHeaven\nreturn s ~= nil and s.one ~= nil and s.two ~= nil and s.prey ~= nil",
						name = "All Heaven markers captured",
						uuid = "5794d1c9-b4be-5a8e-9dc9-6f4ae15d6a83",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Raidplan] Heaven Personal Spot, AOEs & TTS",
			timeout = 8,
			uuid = "bf8895d4-1895-b8ed-b946-6405087df5ec",
			version = 2,
		},
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
						actionLua = "local state = data.amtRaidplanHeaven\nif state then\n    for _, uuid in ipairs(state.draws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end\n    for _, uuid in ipairs(state.texts or {}) do if uuid then AnyoneCore.removeTimedWorldText(uuid) end end\nend\ndata.amtRaidplanHeaven = nil\nself.used = true",
						conditions = 
						{
							
							{
								"604cf58b-b445-42bf-8b2b-c86f085e5e3f",
								true,
							},
							
							{
								"e66c17bd-1a64-5301-b281-8c0cf0f0e73f",
								true,
							},
						},
						name = "Remove Heaven guidance",
						uuid = "d8c30a06-75c0-1996-b37c-2297766488ca",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "604cf58b-b445-42bf-8b2b-c86f085e5e3f",
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
						name = "Heaven resolutions",
						spellIDList = 
						{
							46687,
							46688,
							46689,
							46690,
						},
						uuid = "e66c17bd-1a64-5301-b281-8c0cf0f0e73f",
						version = 3,
					},
				},
			},
			eventType = 2,
			name = "[Raidplan] Heaven Resolve Cleanup",
			uuid = "0d59d417-d609-c9e6-b01a-0c0b5a95e1bc",
			version = 2,
		},
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
						actionLua = "local old=data.amtRaidplanMalefic\nif old then\n if old.shape then Argus.deleteTimedShape(old.shape) end\n if old.text then AnyoneCore.removeTimedWorldText(old.text) end\n for _,uuid in ipairs(old.mq2Draws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end\n for _,uuid in ipairs(old.mq2Texts or {}) do if uuid then AnyoneCore.removeTimedWorldText(uuid) end end\nend\ndata.amtRaidplanMalefic={masks={},directions={},lineTargets={},forceLines={},startedAt=Now()}\nself.used=true",
						conditions = 
						{
							
							{
								"24b8a096-b569-0a76-b9f7-4c9d6ef5a070",
								true,
							},
							
							{
								"bc550b18-3aea-002c-b965-5bf45703a322",
								true,
							},
						},
						name = "Reset personal Malefic state",
						uuid = "0f9a1d58-3e82-bbe1-958d-836f4567737a",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "24b8a096-b569-0a76-b9f7-4c9d6ef5a070",
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
						name = "Malefic Quartering",
						spellIDList = 
						{
							46693,
						},
						uuid = "bc550b18-3aea-002c-b965-5bf45703a322",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Raidplan] Malefic Quartering State Reset",
			uuid = "d4119745-0688-3af8-8ecc-28ce3afaead1",
			version = 2,
		},
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
						actionLua = "local state = data.amtRaidplanMalefic\nif not state then state = { masks = {}, startedAt = Now() } data.amtRaidplanMalefic = state end\nstate.masks = state.masks or {}\nstate.masks[eventArgs.entityID] = eventArgs.buffID - 4772\nself.used = true",
						conditions = 
						{
							
							{
								"7e097664-5bd4-2261-81cd-8c4758eebe79",
								true,
							},
							
							{
								"b836509b-dea1-68d4-bf46-4d5d4214d6ba",
								true,
							},
						},
						name = "Record party Malefic holes",
						uuid = "14ee2f58-07a8-2be5-8b12-53806e0b86bc",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "7e097664-5bd4-2261-81cd-8c4758eebe79",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id = eventArgs.buffID\nreturn id >= 4773 and id <= 4787",
						dequeueIfLuaFalse = true,
						name = "Malefic directional status",
						uuid = "b836509b-dea1-68d4-bf46-4d5d4214d6ba",
						version = 3,
					},
				},
			},
			eventType = 8,
			name = "[Raidplan] Malefic Status Capture",
			uuid = "31b70280-fdb7-9ab1-8c2f-e3b32d0b266f",
			version = 2,
		},
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
						actionLua = "local state=data.amtRaidplanMalefic\nif not state then state={masks={},startedAt=Now()} data.amtRaidplanMalefic=state end\nstate.masks=state.masks or {}\nstate.directions=state.directions or {}\nstate.lineTargets=state.lineTargets or {}\nlocal function clearGuide()\n if state.shape then Argus.deleteTimedShape(state.shape) end\n if state.text then AnyoneCore.removeTimedWorldText(state.text) end\n state.shape=nil state.text=nil\nend\nlocal party=TensorCore.getEntityGroupList(\"Party\",\"Number\") or {}\nlocal partyIDs={}\nfor _,ent in pairs(party) do if ent and ent.id then partyIDs[ent.id]=ent end end\nlocal function endpoint(targetID)\n if partyIDs[eventArgs.sourceEntityID] then return eventArgs.sourceEntityID end\n if targetID and partyIDs[targetID] then return targetID end\nend\nlocal n=tonumber(eventArgs.newTetherID) or 0\nlocal o=tonumber(eventArgs.oldTetherID) or 0\nlocal newEndpoint=endpoint(eventArgs.newTargetID)\nlocal oldEndpoint=endpoint(eventArgs.oldTargetID)\nlocal bits={[357]=8,[358]=1,[359]=2,[360]=4}\nif n==371 and newEndpoint then state.lineTargets[newEndpoint]=true end\nif o==371 and n~=371 and oldEndpoint then state.lineTargets[oldEndpoint]=nil end\nif bits[n] and newEndpoint then state.directions[newEndpoint]={bit=bits[n]} end\nif bits[o] and not bits[n] and oldEndpoint then state.directions[oldEndpoint]=nil end\nclearGuide()\nlocal player=TensorCore.mGetPlayer()\nif not player then self.used=true return end\nlocal myMask=state.masks[player.id]\nif not myMask then state.lastGuideKey=nil self.used=true return end\nlocal holder,other,bit,mode\nlocal mine=state.directions[player.id]\nif mine then\n holder=player.id bit=mine.bit mode=\"pass\"\n for id,_ in pairs(partyIDs) do\n  if id~=holder and state.masks[id]==myMask and not state.lineTargets[id] and math.floor(myMask/bit)%2==0 then\n   if other then other=nil break else other=id end\n  end\n end\nelse\n for id,dir in pairs(state.directions) do\n  if id~=player.id and state.masks[id]==myMask and not state.lineTargets[player.id] and math.floor(myMask/dir.bit)%2==0 then\n   if holder then holder=nil break else holder=id bit=dir.bit end\n  end\n end\n if holder then other=holder mode=\"take\" end\nend\nif not other or not partyIDs[other] then state.lastGuideKey=nil self.used=true return end\nlocal key=mode..\":\"..tostring(other)..\":\"..tostring(bit)\nlocal green=GUI:ColorConvertFloat4ToU32(0.10,1.0,0.20,0.90)\nlocal drawer=TensorCore.getStaticFlatDrawer(green)\nstate.shape=drawer:addTimedCircleOnEnt(9000,other,1.8,0,false,true)\nstate.text=AnyoneCore.addTimedWorldTextOnEnt(9000,mode==\"pass\" and \"PASS TO\" or \"TAKE FROM\",other,green,true,1.35,2.5)\nif state.lastGuideKey~=key then\n local name=partyIDs[other].name or \"highlighted player\"\n TensorCore.addAlertText(3200,(mode==\"pass\" and \"Pass tether to \" or \"Take tether from \")..name,1.25,2,true,90)\n state.lastGuideKey=key\nend\nself.used=true",
						conditions = 
						{
							
							{
								"64f0da49-cfcf-85f8-ac01-315e823633ab",
								true,
							},
							
							{
								"ba02a9c8-a9c8-b5fa-84f7-3314f3e7ca8d",
								true,
							},
						},
						name = "Highlight matching Malefic tether partner",
						uuid = "f16f945f-0587-28fd-8531-a27e000d7d6c",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "64f0da49-cfcf-85f8-ac01-315e823633ab",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local n = tonumber(eventArgs.newTetherID) or 0\nlocal o = tonumber(eventArgs.oldTetherID) or 0\nlocal function wanted(v) return v == 357 or v == 358 or v == 359 or v == 360 or v == 371 end\nreturn wanted(n) or wanted(o)",
						dequeueIfLuaFalse = true,
						name = "Portent or Force-of-Will tether",
						uuid = "ba02a9c8-a9c8-b5fa-84f7-3314f3e7ca8d",
						version = 3,
					},
				},
			},
			eventType = 15,
			name = "[Raidplan] Malefic Tether Partner Highlight",
			uuid = "73c4ec87-50a0-c600-a4ae-2d6f098ab983",
			version = 2,
		},
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
						actionLua = "local old=eventArgs.oldData or {}\nlocal heaven=old.amtRaidplanHeaven\nif heaven then\n for _,uuid in ipairs(heaven.draws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end\n for _,uuid in ipairs(heaven.texts or {}) do if uuid then AnyoneCore.removeTimedWorldText(uuid) end end\nend\nlocal malefic=old.amtRaidplanMalefic\nif malefic then\n if malefic.shape then Argus.deleteTimedShape(malefic.shape) end\n if malefic.text then AnyoneCore.removeTimedWorldText(malefic.text) end\n for _,uuid in ipairs(malefic.mq2Draws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end\n for _,uuid in ipairs(malefic.mq2Texts or {}) do if uuid then AnyoneCore.removeTimedWorldText(uuid) end end\nend\nself.used=true",
						name = "Remove all custom AMT guidance",
						uuid = "d2ffa574-4da2-4e1b-9fbc-79f006816169",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
			},
			eventType = 9,
			name = "[Raidplan] Another Merchant's Tale Cleanup",
			uuid = "7df90a48-b8c9-d3e1-a056-bef9ec34e68e",
			version = 2,
		},
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
						actionLua = "local state=data.amtRaidplanMalefic\nif not state then state={masks={},forceLines={},startedAt=Now()} data.amtRaidplanMalefic=state end\nstate.masks=state.masks or {}\nstate.forceLines=state.forceLines or {}\nlocal function clear()\n for _,uuid in ipairs(state.mq2Draws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end\n for _,uuid in ipairs(state.mq2Texts or {}) do if uuid then AnyoneCore.removeTimedWorldText(uuid) end end\n state.mq2Draws={} state.mq2Texts={}\nend\nlocal party=TensorCore.getEntityGroupList(\"Party\",\"Number\") or {}\nlocal partyIDs={}\nfor _,ent in pairs(party) do if ent and ent.id then partyIDs[ent.id]=ent end end\nlocal function endpoint(targetID)\n if partyIDs[eventArgs.sourceEntityID] then return eventArgs.sourceEntityID end\n if targetID and partyIDs[targetID] then return targetID end\nend\nlocal n=tonumber(eventArgs.newTetherID) or 0\nlocal o=tonumber(eventArgs.oldTetherID) or 0\nlocal newEndpoint=endpoint(eventArgs.newTargetID)\nlocal oldEndpoint=endpoint(eventArgs.oldTargetID)\nif o==371 and n~=371 and oldEndpoint then state.forceLines[oldEndpoint]=nil clear() state.mq2Key=nil end\nif n==371 and newEndpoint then\n local source=TensorCore.mGetEntity(eventArgs.sourceEntityID)\n local target=TensorCore.mGetEntity(eventArgs.newTargetID)\n if source and source.pos and target and target.pos then\n  local ax,az=source.pos.x,source.pos.z\n  local bx,bz=target.pos.x,target.pos.z\n  local vx,vz=bx-ax,bz-az\n  local vv=vx*vx+vz*vz\n  local t=0\n  if vv>0.001 then t=((170-ax)*vx+(-815-az)*vz)/vv t=math.max(0,math.min(1,t)) end\n  local dx=ax+vx*t-170\n  local dz=az+vz*t+815\n  state.forceLines[newEndpoint]={crosses=dx*dx+dz*dz<=4}\n end\nend\nlocal player=TensorCore.mGetPlayer()\nif not player or not player.pos then self.used=true return end\nlocal mask=state.masks[player.id]\nif mask~=3 and mask~=12 then self.used=true return end\nlocal partner\nfor id,_ in pairs(partyIDs) do\n if id~=player.id and state.masks[id]==mask then\n  if partner then partner=nil break else partner=id end\n end\nend\nif not partner or not state.forceLines[player.id] or not state.forceLines[partner] then clear() state.mq2Key=nil self.used=true return end\nlocal goRight=state.forceLines[player.id].crosses or state.forceLines[partner].crosses\nlocal initial\nif mask==3 then initial=player.pos.z<-815 and \"N\" or \"S\" else initial=player.pos.x>170 and \"E\" or \"W\" end\nlocal left={N=\"E\",E=\"S\",S=\"W\",W=\"N\"}\nlocal right={N=\"W\",E=\"N\",S=\"E\",W=\"S\"}\nlocal destination=(goRight and right or left)[initial]\nlocal spots={\n N={x=165,z=-832.5},\n E={x=187.5,z=-820},\n S={x=175,z=-797.5},\n W={x=152.5,z=-810}\n}\nlocal spot=spots[destination]\nlocal key=tostring(player.id)..\":\"..destination..\":\"..(goRight and \"R\" or \"L\")\nif state.mq2Key==key and #(state.mq2Draws or {})>0 then self.used=true return end\nclear()\nstate.mq2Key=key\nlocal lifetime=16000\nlocal green=GUI:ColorConvertFloat4ToU32(0.10,1.0,0.20,0.92)\nlocal drawer=TensorCore.getStaticFlatDrawer(green)\nlocal dot=drawer:addTimedCircle(lifetime,spot.x,player.pos.y+0.03,spot.z,1.35,0,false,true)\nif dot then table.insert(state.mq2Draws,dot) end\nlocal dist=TensorCore.getDistance2d(player.pos,{x=spot.x,y=player.pos.y,z=spot.z})\nif dist and dist>2.5 then\n local h=TensorCore.getHeadingToTarget(player.pos,{x=spot.x,y=player.pos.y,z=spot.z})\n local arrow=drawer:addTimedArrow(lifetime,player.pos.x,player.pos.y+0.03,player.pos.z,h,math.max(1,dist-2.5),0.38,2.5,1.1,0,false)\n if arrow then table.insert(state.mq2Draws,arrow) end\nend\nlocal text=AnyoneCore.addTimedWorldText(lifetime,goRight and \"RIGHT\" or \"LEFT\",{x=spot.x,y=player.pos.y+1.5,z=spot.z},green,true,1.35)\nif text then table.insert(state.mq2Texts,text) end\nTensorCore.addAlertText(3200,goRight and \"Go right\" or \"Go left\",1.3,1,true,90)\nself.used=true",
						conditions = 
						{
							
							{
								"c1a96ac2-7c62-015e-95cd-4e11ec306475",
								true,
							},
							
							{
								"eeb866df-460a-b4f9-a748-a54463fb3220",
								true,
							},
						},
						name = "Draw MQ2 left or right cubby",
						uuid = "07eff1e2-ef12-af45-a055-bc929298befc",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "c1a96ac2-7c62-015e-95cd-4e11ec306475",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local n=tonumber(eventArgs.newTetherID) or 0\nlocal o=tonumber(eventArgs.oldTetherID) or 0\nreturn n==371 or o==371",
						dequeueIfLuaFalse = true,
						name = "Force-of-Will tether",
						uuid = "eeb866df-460a-b4f9-a748-a54463fb3220",
						version = 3,
					},
				},
			},
			eventType = 15,
			name = "[Raidplan] Malefic Quartering 2 Personal Spot",
			uuid = "45818a20-c198-008a-80b2-5d69d7518d71",
			version = 2,
		},
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
						actionLua = "\nlocal root = data.amtRaidplanPari or {}\ndata.amtRaidplanPari = root\n\nlocal function clearState(state)\n    if not state then return end\n    for _, uuid in ipairs(state.draws or {}) do\n        if uuid then Argus.deleteTimedShape(uuid) end\n    end\n    for _, uuid in ipairs(state.texts or {}) do\n        if uuid then AnyoneCore.removeTimedWorldText(uuid) end\n    end\nend\n\nlocal function myRoleStep()\n    local roster = AnyoneCore and AnyoneCore.Roster\n    if roster and roster.isReady and roster.isReady() and roster.mySlot then\n        local slot = roster.mySlot()\n        if type(slot) == \"string\" then\n            local prefix = string.sub(slot, 1, 1)\n            if prefix == \"T\" then return 1, true end\n            if prefix == \"M\" then return 2, true end\n            if prefix == \"H\" then return 3, true end\n            if prefix == \"R\" then return 4, true end\n        end\n    end\n\n    local player = TensorCore.mGetPlayer()\n    if not player then return nil, false end\n    local step\n    if TensorCore.isTank(player) then step = 1\n    elseif TensorCore.isMelee(player, true) then step = 2\n    elseif TensorCore.isHealer(player) then step = 3\n    elseif TensorCore.isRanged(player, true) then step = 4\n    end\n\n    local counts = {0, 0, 0, 0}\n    local party = TensorCore.getEntityGroupList(\"Party\")\n    if party then\n        for _, ent in pairs(party) do\n            if type(ent) == \"number\" then ent = TensorCore.mGetEntity(ent) end\n            if ent then\n                if TensorCore.isTank(ent) then counts[1] = counts[1] + 1\n                elseif TensorCore.isMelee(ent, true) then counts[2] = counts[2] + 1\n                elseif TensorCore.isHealer(ent) then counts[3] = counts[3] + 1\n                elseif TensorCore.isRanged(ent, true) then counts[4] = counts[4] + 1\n                end\n            end\n        end\n    end\n    local standard = counts[1] == 1 and counts[2] == 1 and counts[3] == 1 and counts[4] == 1\n    return standard and step or nil, standard\nend\n\nlocal spell = eventArgs.spellID\nlocal now = Now()\n\nif spell == 45434 or spell == 45435 or spell == 45436 or spell == 45437 then\n    clearState(root.fireflight)\n    local right = spell == 45434 or spell == 45436\n    local spread = spell == 45434 or spell == 45435\n    root.fireflight = {\n        active = true,\n        side = right and -math.pi / 2 or math.pi / 2,\n        firstAt = now + ((tonumber(eventArgs.channelTimeMax) or 10) * 1000) + 2700,\n        count = 0,\n        seen = {},\n        entries = {},\n        draws = {},\n        texts = {},\n        finish = spread and \"SPREAD\" or \"STACK\"\n    }\n    TensorCore.addAlertText(4500, \"CARPETS: \" .. root.fireflight.finish, 1.5, 2, false)\n\nelseif spell == 45467 or spell == 45468 or spell == 47031 or spell == 47032 then\n    clearState(root.longNights)\n    local roleStep, standard = myRoleStep()\n    root.longNights = {\n        active = true,\n        charmed = spell == 47031 or spell == 47032,\n        firstAt = now + ((tonumber(eventArgs.channelTimeMax) or 17) * 1000) + 2200,\n        roleStep = roleStep,\n        standard = standard,\n        patterns = {},\n        directions = {},\n        markerCount = 0,\n        vfxCount = 0,\n        resolved = 0,\n        dotDrawn = {},\n        entries = {},\n        draws = {},\n        texts = {}\n    }\n    if not standard then\n        TensorCore.addAlertText(5500, \"NONSTANDARD PARTY: MANUAL BAIT STEP\", 1.35, 3, true)\n    end\n\nelseif spell == 45536 or spell == 45538 or spell == 45540 then\n    clearState(root.clone)\n    root.clone = {\n        active = true,\n        mode = spell == 45536 and \"SPREAD\" or \"STACK\",\n        seen = {},\n        cones = {},\n        draws = {},\n        texts = {}\n    }\n\nelseif spell == 45551 then\n    clearState(root.curse)\n    root.curse = {\n        active = true,\n        fire = false,\n        assignment = nil,\n        iceGemID = nil,\n        iceGemPos = nil,\n        iceCarpetID = nil,\n        iceCandidates = {},\n        iceAmbiguous = false,\n        dashCount = 0,\n        draws = {},\n        texts = {}\n    }\n    TensorCore.addAlertText(4500, \"PARI'S CURSE: READ DEBUFFS\", 1.4, 2, false)\n\nelseif spell == 45482 then\n    clearState(root.curse)\n    if root.curse then root.curse.active = false end\n    clearState(root.spurning)\n    root.spurning = {\n        active = true,\n        group = 0,\n        pending = {},\n        lastAt = nil,\n        draws = {},\n        texts = {}\n    }\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"51ba0583-79e7-5433-9c49-42515a05d217",
								true,
							},
							
							{
								"ce86d52a-8073-74c5-9263-33b66fcc75a4",
								true,
							},
						},
						name = "Initialize Pari mechanic",
						uuid = "6adc8ed5-4a5b-efc2-84ff-10504825ead1",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "51ba0583-79e7-5433-9c49-42515a05d217",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id=eventArgs.spellID; return id==45434 or id==45435 or id==45436 or id==45437 or id==45467 or id==45468 or id==47031 or id==47032 or id==45536 or id==45538 or id==45540 or id==45551 or id==45482",
						dequeueIfLuaFalse = true,
						name = "Initialize Pari mechanic event",
						uuid = "ce86d52a-8073-74c5-9263-33b66fcc75a4",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[AMT Raidplan] Pari Mechanic State",
			timeout = 8,
			uuid = "7a373f5a-e809-9d60-b9d4-1c7d928ed2fa",
			version = 2,
		},
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
						actionLua = "\nlocal root = data.amtRaidplanPari\nlocal state = root and root.fireflight\nif not state or not state.active or state.count >= 3 then\n    self.used = true\n    return\nend\n\nlocal key = tostring(eventArgs.sourceEntityID) .. \":\" .. tostring(eventArgs.newTargetID)\nif state.seen[key] then\n    self.used = true\n    return\nend\n\nlocal source = TensorCore.mGetEntity(eventArgs.sourceEntityID)\nlocal target = TensorCore.mGetEntity(eventArgs.newTargetID)\nif not source or not target or not source.pos or not target.pos then\n    self.used = true\n    return\nend\n\nstate.seen[key] = true\nstate.count = state.count + 1\nlocal step = state.count\nlocal now = Now()\nlocal sx, sy, sz = source.pos.x, source.pos.y, source.pos.z\nlocal tx, ty, tz = target.pos.x, target.pos.y, target.pos.z\nlocal midpoint = {x = (sx + tx) / 2, y = (sy + ty) / 2 + 0.03, z = (sz + tz) / 2}\nlocal segmentHeading = TensorCore.getHeadingToTarget(source.pos, target.pos)\nlocal dangerHeading = segmentHeading + state.side\nlocal dx, dz = tx - sx, tz - sz\nlocal width = math.sqrt(dx * dx + dz * dz)\nlocal activation = state.firstAt + ((step - 1) * 2100)\nlocal lifetime = math.max(500, math.floor(activation - now + 250))\nlocal color\nif step == 3 then\n    color = GUI:ColorConvertFloat4ToU32(1.0, 0.10, 0.78, 0.55)\nelse\n    color = GUI:ColorConvertFloat4ToU32(1.0, 0.25, 0.04, 0.36)\nend\nlocal drawer = TensorCore.getStaticFlatDrawer(color, 1)\nlocal shape = drawer:addTimedRect(lifetime, midpoint.x, midpoint.y, midpoint.z, 50, width, dangerHeading, 0, false, true)\nlocal labelPos = TensorCore.getPosInDirection(midpoint, dangerHeading, 9)\nlocal textColor = step == 3\n    and GUI:ColorConvertFloat4ToU32(1.0, 0.20, 0.90, 1.0)\n    or GUI:ColorConvertFloat4ToU32(1.0, 0.55, 0.05, 1.0)\nlocal textUUID = AnyoneCore.addTimedWorldText(lifetime, tostring(step), {x=labelPos.x, y=midpoint.y + 1.6, z=labelPos.z}, textColor, true, 2.2)\nif shape then table.insert(state.draws, shape) end\nif textUUID then table.insert(state.texts, textUUID) end\nstate.entries[step] = {shape=shape, text=textUUID}\n\nif step == 3 then\n    local donutEnd = activation + 2100\n    local donutLifetime = math.max(800, math.floor(donutEnd - now + 300))\n    local donut = TensorCore.getMoogleDrawer():addTimedDonut(donutLifetime, tx, ty + 0.03, tz, 8, 60, 0, false, true)\n    local safeColor = GUI:ColorConvertFloat4ToU32(0.10, 1.0, 0.25, 0.78)\n    local safe = TensorCore.getStaticFlatDrawer(safeColor, 1):addTimedCircle(donutLifetime, tx, ty + 0.05, tz, 2.0, 0, false, true)\n    local inText = AnyoneCore.addTimedWorldText(donutLifetime, \"3  THEN IN\", {x=tx, y=ty + 2.0, z=tz}, safeColor, true, 1.4)\n    if donut then table.insert(state.draws, donut) end\n    if safe then table.insert(state.draws, safe) end\n    if inText then table.insert(state.texts, inText) end\n    TensorCore.addAlertText(6000, \"THIRD CLEAVE, THEN IN - \" .. state.finish, 1.5, 2, true)\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"cd881660-f06d-b959-99dd-ee9b40fb36a3",
								true,
							},
							
							{
								"401790fc-f93b-0e2a-bcc5-60defa802bb6",
								true,
							},
						},
						name = "Draw carpet cleave order",
						uuid = "d4725e8c-3e2a-b89c-80a5-28c6c2052947",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "cd881660-f06d-b959-99dd-ee9b40fb36a3",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.newTetherID==355 and eventArgs.sourceEntityContentID==19061 and eventArgs.newTargetContentID==19061",
						dequeueIfLuaFalse = true,
						name = "Draw carpet cleave order event",
						uuid = "401790fc-f93b-0e2a-bcc5-60defa802bb6",
						version = 3,
					},
				},
			},
			eventType = 15,
			name = "[AMT Raidplan] Fireflight Numbered Cleaves",
			timeout = 8,
			uuid = "e2c18896-c888-9ce7-b631-475ee9aa7a28",
			version = 2,
		},
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
						actionLua = "\nlocal state = data.amtRaidplanPari and data.amtRaidplanPari.longNights\nif not state or not state.active or state.charmed or state.vfxCount >= 3 then\n    self.used = true\n    return\nend\n\nlocal farName = \"vfx/common/eff/m0973_stlpf_c0e1.avfx\"\nlocal isFar = eventArgs.vfxName == farName\nstate.vfxCount = state.vfxCount + 1\nstate.patterns[state.vfxCount] = isFar and \"F\" or \"C\"\n\nif state.vfxCount == 3 then\n    local a, b, c = state.patterns[1], state.patterns[2], state.patterns[3]\n    if a == b then\n        state.patterns[4] = a == \"C\" and \"F\" or \"C\"\n    elseif a == c then\n        state.patterns[4] = b\n    else\n        state.patterns[4] = a\n    end\n\n    local step = state.roleStep\n    if step and state.patterns[step] then\n        local pattern = state.patterns[step]\n        local call = pattern == \"C\" and \"BAIT NEAR\" or \"BAIT FAR\"\n        TensorCore.addAlertText(8500, \"STEP \" .. tostring(step) .. \": \" .. call, 1.65, 2, true)\n    end\nend\n\nlocal function drawDot(step)\n    if state.dotDrawn[step] or not state.directions[step] or not state.patterns[step] or not state.roleStep then return end\n    local now = Now()\n    local activation = state.firstAt + ((step - 1) * 3000)\n    local delay = math.max(0, math.floor(activation - now - 2700))\n    local dangerHeading = state.directions[step]\n    local localBait = step == state.roleStep\n    local close = state.patterns[step] == \"C\"\n    local radius\n    if localBait then radius = close and 3.5 or 16\n    else radius = close and 16 or 3.5 end\n    local center = {x=-760, y=-53.95, z=-805}\n    local point = TensorCore.getPosInDirection(center, dangerHeading + math.pi, radius)\n    local green = GUI:ColorConvertFloat4ToU32(0.10, 1.0, 0.22, 0.82)\n    local uuid = TensorCore.getStaticFlatDrawer(green, 1):addTimedCircle(2900, point.x, point.y, point.z, 1.5, delay, false, true)\n    if uuid then table.insert(state.draws, uuid) end\n    state.dotDrawn[step] = true\nend\n\nif state.vfxCount == 3 then\n    for step = 1, #state.directions do drawDot(step) end\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"af0e51f3-8ee8-424b-9bd9-a9c4bf5b3e4e",
								true,
							},
							
							{
								"5f8dcd3f-1378-bc7e-8c89-991c97afd33a",
								true,
							},
						},
						name = "Record near far and assign role",
						uuid = "6fc20073-d9f7-8722-8169-2ccb526a7b03",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "af0e51f3-8ee8-424b-9bd9-a9c4bf5b3e4e",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local n=eventArgs.vfxName; return n=='vfx/common/eff/m0973_stlpf_c0e1.avfx' or n=='vfx/common/eff/m0973_stlpn_c0e1.avfx'",
						dequeueIfLuaFalse = true,
						name = "Record near far and assign role event",
						uuid = "5f8dcd3f-1378-bc7e-8c89-991c97afd33a",
						version = 3,
					},
				},
			},
			eventType = 27,
			name = "[AMT Raidplan] Four Long Nights Near Far",
			timeout = 8,
			uuid = "59a587e7-0054-d7b9-9253-86ff3c945e4f",
			version = 2,
		},
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
						actionLua = "\nlocal state = data.amtRaidplanPari and data.amtRaidplanPari.longNights\nif not state or not state.active or state.markerCount >= 4 then\n    self.used = true\n    return\nend\n\nlocal marker = eventArgs.markerID\nlocal rotateR = {[1]=2, [2]=3, [3]=4, [4]=1}\nlocal rotateL = {[1]=4, [4]=3, [3]=2, [2]=1}\nlocal invert = {[1]=3, [2]=4, [3]=1, [4]=2}\n\nif state.markerCount == 0 then\n    state.prevCardinal = (marker == 624 or marker == 625) and 4 or 2\nend\n\nlocal nextCardinal\nif marker == 624 or marker == 644 then\n    nextCardinal = rotateR[state.prevCardinal]\nelse\n    nextCardinal = rotateL[state.prevCardinal]\nend\nstate.prevCardinal = invert[state.prevCardinal]\nstate.markerCount = state.markerCount + 1\nlocal step = state.markerCount\nlocal headings = {[1]=math.pi, [2]=math.pi/2, [3]=0, [4]=-math.pi/2}\nlocal heading = headings[nextCardinal]\nstate.directions[step] = heading\n\nlocal now = Now()\nlocal activation = state.firstAt + ((step - 1) * 3000)\nlocal delay = math.max(0, math.floor(activation - now - 2600))\nlocal hazardColor = step == 3\n    and GUI:ColorConvertFloat4ToU32(1.0, 0.10, 0.78, 0.52)\n    or GUI:ColorConvertFloat4ToU32(1.0, 0.24, 0.04, 0.34)\nlocal shape = TensorCore.getStaticFlatDrawer(hazardColor, 1):addTimedCone(2850, -760, -53.97, -805, 40, math.rad(90), heading, delay, false, true)\nif shape then table.insert(state.draws, shape) end\n\nlocal labelPoint = TensorCore.getPosInDirection({x=-760,y=-53.9,z=-805}, heading, 13)\nlocal textLifetime = math.max(600, math.floor(activation - now + 250))\nlocal textColor = step == 3\n    and GUI:ColorConvertFloat4ToU32(1.0, 0.20, 0.90, 1.0)\n    or GUI:ColorConvertFloat4ToU32(1.0, 0.55, 0.05, 1.0)\nlocal textUUID = AnyoneCore.addTimedWorldText(textLifetime, tostring(step), {x=labelPoint.x,y=-52.2,z=labelPoint.z}, textColor, true, 2.1)\nif textUUID then table.insert(state.texts, textUUID) end\nstate.entries[step] = {shape=shape, text=textUUID}\n\nlocal function drawDot(i)\n    if state.charmed or state.dotDrawn[i] or not state.patterns[i] or not state.roleStep then return end\n    local dotNow = Now()\n    local dotActivation = state.firstAt + ((i - 1) * 3000)\n    local dotDelay = math.max(0, math.floor(dotActivation - dotNow - 2700))\n    local localBait = i == state.roleStep\n    local close = state.patterns[i] == \"C\"\n    local radius\n    if localBait then radius = close and 3.5 or 16\n    else radius = close and 16 or 3.5 end\n    local point = TensorCore.getPosInDirection({x=-760,y=-53.95,z=-805}, state.directions[i] + math.pi, radius)\n    local green = GUI:ColorConvertFloat4ToU32(0.10, 1.0, 0.22, 0.82)\n    local uuid = TensorCore.getStaticFlatDrawer(green, 1):addTimedCircle(2900, point.x, point.y, point.z, 1.5, dotDelay, false, true)\n    if uuid then table.insert(state.draws, uuid) end\n    state.dotDrawn[i] = true\nend\n\ndrawDot(step)\nself.used = true",
						conditions = 
						{
							
							{
								"e79c5653-56bb-2b38-b040-f5fec1ba6cc6",
								true,
							},
							
							{
								"861a2b52-7f1c-6e39-afea-cb4010b91a7c",
								true,
							},
						},
						name = "Draw rotating half rooms and personal spot",
						uuid = "f0b82077-9c5c-9922-8379-045e6b4d4d0b",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "e79c5653-56bb-2b38-b040-f5fec1ba6cc6",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id=eventArgs.markerID; return id==624 or id==625 or id==644 or id==645",
						dequeueIfLuaFalse = true,
						name = "Draw rotating half rooms and personal spot event",
						uuid = "861a2b52-7f1c-6e39-afea-cb4010b91a7c",
						version = 3,
					},
				},
			},
			eventType = 4,
			name = "[AMT Raidplan] Four Long Nights Cleave Order",
			timeout = 8,
			uuid = "6cc23380-8402-d5db-8777-99ca124afb15",
			version = 2,
		},
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
						actionLua = "\nlocal state = data.amtRaidplanPari and data.amtRaidplanPari.curse\nlocal player = TensorCore.mGetPlayer()\nif not state or not state.active or not player or eventArgs.entityID ~= player.id then\n    self.used = true\n    return\nend\n\nif eventArgs.buffID == 4617 then\n    state.fire = true\n    TensorCore.addAlertText(6500, \"FIRE DEBUFF: TAKE BLUE CROSS\", 1.55, 3, true)\nelseif eventArgs.buffID == 4615 then\n    state.assignment = \"SPREAD\"\n    TensorCore.addAlertText(4500, \"SPREAD\", 1.5, 2, true)\nelseif eventArgs.buffID == 4616 then\n    state.assignment = \"STACK\"\n    TensorCore.addAlertText(4500, \"STACK\", 1.5, 2, true)\nend\nself.used = true",
						conditions = 
						{
							
							{
								"a306f455-27c1-2eb7-beef-e9223fc90685",
								true,
							},
							
							{
								"9ea6b584-3add-709e-91e0-bc0b94fc0e3e",
								true,
							},
						},
						name = "Call personal Curse assignment",
						uuid = "9f5a5737-e2f2-a65d-b8f0-dd65fc36bbe5",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "a306f455-27c1-2eb7-beef-e9223fc90685",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.buffID==4615 or eventArgs.buffID==4616 or eventArgs.buffID==4617",
						dequeueIfLuaFalse = true,
						name = "Call personal Curse assignment event",
						uuid = "9ea6b584-3add-709e-91e0-bc0b94fc0e3e",
						version = 3,
					},
				},
			},
			eventType = 8,
			name = "[AMT Raidplan] Pari Curse Personal Debuffs",
			timeout = 8,
			uuid = "d53b3d64-e329-06c1-b6d6-d39837cdf8f9",
			version = 2,
		},
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
						actionLua = "\nlocal state = data.amtRaidplanPari and data.amtRaidplanPari.curse\nif state and state.active then\n    state.iceGemID = eventArgs.entityID\n    local ent = TensorCore.mGetEntity(eventArgs.entityID)\n    if ent and ent.pos then\n        state.iceGemPos = {x=ent.pos.x,y=ent.pos.y,z=ent.pos.z}\n    end\nend\nself.used = true",
						conditions = 
						{
							
							{
								"a1c76e34-98d8-0a5b-bae2-1472751c8d3b",
								true,
							},
							
							{
								"7364c7c7-e7a8-d4a4-86dc-63967a0fa338",
								true,
							},
						},
						name = "Track the blue bauble",
						uuid = "c2809990-bdcc-118b-ab66-014135b91e38",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "a1c76e34-98d8-0a5b-bae2-1472751c8d3b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.entityContentID==19059",
						dequeueIfLuaFalse = true,
						name = "Track the blue bauble event",
						uuid = "7364c7c7-e7a8-d4a4-86dc-63967a0fa338",
						version = 3,
					},
				},
			},
			eventType = 5,
			name = "[AMT Raidplan] Pari Curse Ice Tracker",
			timeout = 8,
			uuid = "b418fb60-bc9a-843d-b3b7-8f1477444f29",
			version = 2,
		},
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
						actionLua = "\nlocal root = data.amtRaidplanPari\nif not root then self.used = true return end\nlocal spell = eventArgs.spellID\n\nlocal function clearState(state)\n    if not state then return end\n    for _, uuid in ipairs(state.draws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end\n    for _, uuid in ipairs(state.texts or {}) do if uuid then AnyoneCore.removeTimedWorldText(uuid) end end\nend\n\nif spell == 45442 or spell == 45443 then\n    local state = root.fireflight\n    if state and state.entries and #state.entries > 0 then\n        local entry = table.remove(state.entries, 1)\n        if entry then\n            if entry.shape then Argus.deleteTimedShape(entry.shape) end\n            if entry.text then AnyoneCore.removeTimedWorldText(entry.text) end\n        end\n    end\n\nelseif spell == 45448 then\n    clearState(root.fireflight)\n    root.fireflight = nil\n\nelseif spell == 45469 or spell == 45470 or spell == 45471 or spell == 45472 then\n    local state = root.longNights\n    if state and state.active then\n        state.resolved = (state.resolved or 0) + 1\n        local nextStep = state.resolved + 1\n        if nextStep <= 4 and nextStep == state.roleStep and state.patterns[nextStep] then\n            local call = state.patterns[nextStep] == \"C\" and \"BAIT NEAR\" or \"BAIT FAR\"\n            TensorCore.addAlertText(2800, call, 1.7, 2, true)\n        end\n        if state.resolved >= 4 then state.active = false end\n    end\n\nelseif spell == 45504 then\n    local state = root.curse\n    if state and state.active then\n        local carpet = TensorCore.mGetEntity(eventArgs.entityID)\n        local gem = state.iceGemID and TensorCore.mGetEntity(state.iceGemID)\n        local carpetPos = carpet and carpet.pos\n        local gemPos = (gem and gem.pos) or state.iceGemPos\n        if carpetPos and gemPos then\n            local dx, dz = carpetPos.x - gemPos.x, carpetPos.z - gemPos.z\n            if dx * dx + dz * dz <= 16 then\n                state.iceCandidates = state.iceCandidates or {}\n                if not state.iceCandidates[eventArgs.entityID] then\n                    state.iceCandidates[eventArgs.entityID] = true\n                    local count = 0\n                    local selected\n                    for id in pairs(state.iceCandidates) do\n                        count = count + 1\n                        selected = id\n                    end\n                    if count == 1 then\n                        state.iceCarpetID = selected\n                        state.iceAmbiguous = false\n                        state.dashCount = 0\n                    else\n                        state.iceCarpetID = nil\n                        state.iceAmbiguous = true\n                        TensorCore.addAlertText(4500, \"BLUE CARPET AMBIGUOUS - MANUAL\", 1.35, 3, true)\n                    end\n                end\n            end\n        end\n    end\n\nelseif spell == 47153 then\n    local state = root.curse\n    if state and state.active and not state.iceAmbiguous and state.iceCarpetID == eventArgs.entityID then\n        state.dashCount = (state.dashCount or 0) + 1\n        if state.dashCount == 3 then\n            local pos = {\n                x = tonumber(eventArgs.castPosX),\n                y = tonumber(eventArgs.castPosY) or -54,\n                z = tonumber(eventArgs.castPosZ)\n            }\n            if pos.x and pos.z then\n                local color\n                local message\n                if state.fire then\n                    color = GUI:ColorConvertFloat4ToU32(0.10, 1.0, 0.35, 0.56)\n                    message = \"TAKE BLUE CROSS\"\n                else\n                    color = GUI:ColorConvertFloat4ToU32(1.0, 0.12, 0.10, 0.42)\n                    message = \"AVOID BLUE CROSS\"\n                end\n                local drawer = TensorCore.getStaticFlatDrawer(color, 1)\n                local cross = drawer:addTimedCross(15000, pos.x, pos.y + 0.03, pos.z, 40, 10, 0, 0, false, true)\n                local point = drawer:addTimedCircle(15000, pos.x, pos.y + 0.05, pos.z, 2.0, 0, false, true)\n                local textUUID = AnyoneCore.addTimedWorldText(15000, message, {x=pos.x,y=pos.y+2,z=pos.z}, color, true, 1.35)\n                if cross then table.insert(state.draws, cross) end\n                if point then table.insert(state.draws, point) end\n                if textUUID then table.insert(state.texts, textUUID) end\n                TensorCore.addAlertText(6500, message, 1.55, state.fire and 1 or 3, true)\n            end\n        end\n    end\n\nelseif spell == 45537 or spell == 45539 or spell == 45541 then\n    clearState(root.clone)\n    root.clone = nil\n\nelseif spell == 45491 then\n    clearState(root.spurning)\n    root.spurning = nil\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"b570458c-ea2e-b220-85ec-85ed543d9620",
								true,
							},
							
							{
								"e7aa89e6-714a-847f-9e35-19a370f0651a",
								true,
							},
						},
						name = "Resolve Pari states and blue carpet",
						uuid = "2a35c668-cd38-49d6-86b8-836e4912396a",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "b570458c-ea2e-b220-85ec-85ed543d9620",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id=eventArgs.spellID; return id==45442 or id==45443 or id==45448 or id==45469 or id==45470 or id==45471 or id==45472 or id==45504 or id==47153 or id==45537 or id==45539 or id==45541 or id==45491",
						dequeueIfLuaFalse = true,
						name = "Resolve Pari states and blue carpet event",
						uuid = "e7aa89e6-714a-847f-9e35-19a370f0651a",
						version = 3,
					},
				},
			},
			eventType = 2,
			name = "[AMT Raidplan] Pari Resolve and Carpet Tracker",
			timeout = 8,
			uuid = "9b516f9b-0964-3685-b960-e8e91e751e91",
			version = 2,
		},
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
						actionLua = "\nlocal state = data.amtRaidplanPari and data.amtRaidplanPari.spurning\nif not state or not state.active then self.used = true return end\n\nlocal now = Now()\nif state.lastAt and now - state.lastAt > 1800 and #state.pending > 0 then\n    state.pending = {}\nend\nstate.lastAt = now\ntable.insert(state.pending, {x=eventArgs.x,y=eventArgs.y,z=eventArgs.z})\nif #state.pending < 4 then self.used = true return end\n\nstate.group = state.group + 1\nlocal candidates = {\n    {name=\"NORTH\", x=-760, z=-820},\n    {name=\"EAST\",  x=-745, z=-805},\n    {name=\"SOUTH\", x=-760, z=-790},\n    {name=\"WEST\",  x=-775, z=-805}\n}\nlocal best, bestScore\nfor _, candidate in ipairs(candidates) do\n    local minimum\n    for _, aoe in ipairs(state.pending) do\n        local dx, dz = candidate.x - aoe.x, candidate.z - aoe.z\n        local distance2 = dx * dx + dz * dz\n        if not minimum or distance2 < minimum then minimum = distance2 end\n    end\n    if not bestScore or minimum > bestScore then\n        best, bestScore = candidate, minimum\n    end\nend\nstate.pending = {}\n\nif best then\n    local durationMs = math.max(3500, math.floor(((tonumber(eventArgs.duration) or 4) * 1000) + 700))\n    local green = GUI:ColorConvertFloat4ToU32(0.10, 1.0, 0.22, 0.84)\n    local drawer = TensorCore.getStaticFlatDrawer(green, 1)\n    local circle = drawer:addTimedCircle(durationMs, best.x, eventArgs.y + 0.04, best.z, 2.0, 0, false, true)\n    local player = TensorCore.mGetPlayer()\n    local arrow\n    if player and player.pos then\n        local heading = TensorCore.getHeadingToTarget(player.pos, {x=best.x,y=player.pos.y,z=best.z})\n        local dx, dz = best.x - player.pos.x, best.z - player.pos.z\n        local distance = math.sqrt(dx*dx + dz*dz)\n        arrow = drawer:addTimedArrow(durationMs, player.pos.x, player.pos.y + 0.05, player.pos.z, heading, math.max(2, math.min(8, distance - 2)), 0.35, 1.8, 1.0, 0, false)\n    end\n    local textUUID = AnyoneCore.addTimedWorldText(durationMs, \"BAIT \" .. tostring(state.group), {x=best.x,y=eventArgs.y+2,z=best.z}, green, true, 1.35)\n    if circle then table.insert(state.draws, circle) end\n    if arrow then table.insert(state.draws, arrow) end\n    if textUUID then table.insert(state.texts, textUUID) end\n    TensorCore.addAlertText(3600, best.name .. \" BAIT\", 1.55, 1, true)\n\n    if state.group == 4 then\n        local delayCenter = math.floor((tonumber(eventArgs.duration) or 4) * 1000)\n        local center = drawer:addTimedCircle(4000, -760, eventArgs.y + 0.05, -805, 2.2, delayCenter, false, true)\n        if center then table.insert(state.draws, center) end\n\n        local function roleCorner()\n            local roster = AnyoneCore and AnyoneCore.Roster\n            if roster and roster.isReady and roster.isReady() and roster.mySlot then\n                local slot = roster.mySlot()\n                if type(slot) == \"string\" then\n                    local prefix = string.sub(slot,1,1)\n                    if prefix == \"T\" then return -775,-820,\"NW\" end\n                    if prefix == \"R\" then return -745,-820,\"NE\" end\n                    if prefix == \"H\" then return -745,-790,\"SE\" end\n                    if prefix == \"M\" then return -775,-790,\"SW\" end\n                end\n            end\n            local p = TensorCore.mGetPlayer()\n            if not p then return nil end\n            if TensorCore.isTank(p) then return -775,-820,\"NW\" end\n            if TensorCore.isRanged(p,true) then return -745,-820,\"NE\" end\n            if TensorCore.isHealer(p) then return -745,-790,\"SE\" end\n            if TensorCore.isMelee(p,true) then return -775,-790,\"SW\" end\n        end\n        local cx, cz = roleCorner()\n        if cx then\n            local corner = drawer:addTimedCircle(8000, cx, eventArgs.y + 0.05, cz, 2.2, delayCenter + 3500, false, true)\n            if corner then table.insert(state.draws, corner) end\n        end\n        TensorCore.addAlertText(6500, \"FOURTH BAIT - THEN CENTER - THEN YOUR CORNER\", 1.35, 2, true)\n    end\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"86969902-8f77-df88-932a-972dae44fa26",
								true,
							},
							
							{
								"c4c5c3d5-7e06-c314-bb2c-ecbaaccedd31",
								true,
							},
						},
						name = "Draw cardinal baits and role corner",
						uuid = "2acbb18d-416b-27f0-8961-0c6efa5e521e",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "86969902-8f77-df88-932a-972dae44fa26",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID==45527",
						dequeueIfLuaFalse = true,
						name = "Draw cardinal baits and role corner event",
						uuid = "c4c5c3d5-7e06-c314-bb2c-ecbaaccedd31",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[AMT Raidplan] Spurning Braindead Baits",
			timeout = 8,
			uuid = "eb00bdcf-f426-2463-850b-cd6fa83924c4",
			version = 2,
		},
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
						actionLua = "\nlocal old = eventArgs.oldData\nlocal root = old and old.amtRaidplanPari\nif root then\n    for _, state in pairs(root) do\n        if type(state) == \"table\" then\n            for _, uuid in ipairs(state.draws or {}) do\n                if uuid then Argus.deleteTimedShape(uuid) end\n            end\n            for _, uuid in ipairs(state.texts or {}) do\n                if uuid then AnyoneCore.removeTimedWorldText(uuid) end\n            end\n        end\n    end\nend\nself.used = true",
						name = "Remove all Pari raidplan draws",
						uuid = "d5fe9a71-e355-73ca-bfb7-9ec0de501035",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
			},
			eventType = 9,
			name = "[AMT Raidplan] Pari Draw Cleanup",
			timeout = 8,
			uuid = "987c7b18-0036-3cb9-9e4d-f40d558a62f5",
			version = 2,
		},
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
						actionLua = "\nlocal root = data.amtRaidplanPari\nif root then\n    for _, state in pairs(root) do\n        if type(state) == \"table\" then\n            for _, uuid in ipairs(state.draws or {}) do\n                if uuid then Argus.deleteTimedShape(uuid) end\n            end\n            for _, uuid in ipairs(state.texts or {}) do\n                if uuid then AnyoneCore.removeTimedWorldText(uuid) end\n            end\n        end\n    end\nend\ndata.amtRaidplanPari = nil\nself.used = true",
						name = "Remove Pari draws on map change",
						uuid = "0b3c6c71-9d1c-afc3-96b7-b1b5449e3ce2",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
			},
			eventType = 11,
			name = "[AMT Raidplan] Pari Map Cleanup",
			timeout = 8,
			uuid = "b9608573-6505-1409-af3d-518662b9c540",
			version = 2,
		},
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
						actionLua = "\nlocal state = data.amtRaidplanPari and data.amtRaidplanPari.clone\nif not state or not state.active then self.used = true return end\nif state.seen[eventArgs.entityID] then self.used = true return end\n\nlocal clone = TensorCore.mGetEntity(eventArgs.entityID)\nif not clone or not clone.pos or type(clone.pos.h) ~= \"number\" then\n    self.used = true\n    return\nend\n\nstate.seen[eventArgs.entityID] = true\nlocal offset = (eventArgs.markerID == 628 or eventArgs.markerID == 646) and -math.pi/2 or math.pi/2\nlocal actorHeading = clone.pos.h + offset\nlocal ahead = TensorCore.getPosInDirection(clone.pos, actorHeading, 1)\nlocal drawHeading = TensorCore.getHeadingToTarget(clone.pos, ahead)\nlocal ux, uz = ahead.x - clone.pos.x, ahead.z - clone.pos.z\nlocal length = math.sqrt(ux*ux + uz*uz)\nif length <= 0 then self.used = true return end\nux, uz = ux/length, uz/length\n\nlocal cone = {\n    x = clone.pos.x,\n    y = clone.pos.y + 0.03,\n    z = clone.pos.z,\n    heading = drawHeading,\n    ux = ux,\n    uz = uz\n}\ntable.insert(state.cones, cone)\n\nlocal red = GUI:ColorConvertFloat4ToU32(1.0, 0.15, 0.05, 0.34)\nlocal shape = TensorCore.getStaticFlatDrawer(red, 1):addTimedCone(12000, cone.x, cone.y, cone.z, 40, math.rad(90), cone.heading, 0, false, true)\nif shape then table.insert(state.draws, shape) end\n\nif #state.cones == 4 then\n    local safePoints = {}\n    for x = -779, -741, 1 do\n        for z = -824, -786, 1 do\n            local safe = true\n            for _, c in ipairs(state.cones) do\n                local dx, dz = x - c.x, z - c.z\n                local d2 = dx*dx + dz*dz\n                if d2 <= 1600 and (dx*c.ux + dz*c.uz) >= 0 then\n                    safe = false\n                    break\n                end\n            end\n            if safe then table.insert(safePoints, {x=x,z=z}) end\n        end\n    end\n\n    if #safePoints == 0 then\n        TensorCore.addAlertText(5000, \"CLONE SAFE TILE NOT FOUND\", 1.4, 3, true)\n        self.used = true\n        return\n    end\n\n    local cx, cz = 0, 0\n    for _, p in ipairs(safePoints) do cx=cx+p.x; cz=cz+p.z end\n    cx, cz = cx/#safePoints, cz/#safePoints\n\n    local function myRole()\n        local roster = AnyoneCore and AnyoneCore.Roster\n        if roster and roster.isReady and roster.isReady() and roster.mySlot then\n            local slot = roster.mySlot()\n            if type(slot) == \"string\" then\n                local prefix=string.sub(slot,1,1)\n                if prefix==\"T\" or prefix==\"H\" or prefix==\"M\" or prefix==\"R\" then return prefix end\n            end\n        end\n        local player=TensorCore.mGetPlayer()\n        if not player then return nil end\n        if TensorCore.isTank(player) then return \"T\" end\n        if TensorCore.isHealer(player) then return \"H\" end\n        if TensorCore.isMelee(player,true) then return \"M\" end\n        if TensorCore.isRanged(player,true) then return \"R\" end\n    end\n\n    local role = myRole()\n    local desiredX, desiredZ = cx, cz\n    if state.mode == \"SPREAD\" then\n        local offsets = {T={-2.6,-2.6}, R={2.6,-2.6}, H={2.6,2.6}, M={-2.6,2.6}}\n        local o = role and offsets[role]\n        if o then desiredX,desiredZ=cx+o[1],cz+o[2] end\n    else\n        local rx, rz = cx + 760, cz + 805\n        local rlen = math.sqrt(rx*rx + rz*rz)\n        if rlen > 0 then\n            rx,rz=rx/rlen,rz/rlen\n            local outward = role==\"H\" or role==\"R\"\n            local sign = outward and 1 or -1\n            desiredX,desiredZ=cx+(rx*2.8*sign),cz+(rz*2.8*sign)\n        end\n    end\n\n    local best, bestD2\n    for _, p in ipairs(safePoints) do\n        local dx,dz=p.x-desiredX,p.z-desiredZ\n        local d2=dx*dx+dz*dz\n        if not bestD2 or d2<bestD2 then best,bestD2=p,d2 end\n    end\n\n    if best then\n        local green=GUI:ColorConvertFloat4ToU32(0.10,1.0,0.22,0.86)\n        local drawer=TensorCore.getStaticFlatDrawer(green,1)\n        local spot=drawer:addTimedCircle(12000,best.x,-53.95,best.z,1.8,0,false,true)\n        local textUUID=AnyoneCore.addTimedWorldText(12000,state.mode==\"SPREAD\" and \"YOUR SPREAD\" or \"YOUR STACK\",{x=best.x,y=-52.1,z=best.z},green,true,1.35)\n        local player=TensorCore.mGetPlayer()\n        local arrow\n        if player and player.pos then\n            local h=TensorCore.getHeadingToTarget(player.pos,{x=best.x,y=player.pos.y,z=best.z})\n            local dx,dz=best.x-player.pos.x,best.z-player.pos.z\n            local dist=math.sqrt(dx*dx+dz*dz)\n            arrow=drawer:addTimedArrow(7000,player.pos.x,player.pos.y+0.05,player.pos.z,h,math.max(2,math.min(8,dist-2)),0.35,1.8,1.0,0,false)\n        end\n        if spot then table.insert(state.draws,spot) end\n        if arrow then table.insert(state.draws,arrow) end\n        if textUUID then table.insert(state.texts,textUUID) end\n        TensorCore.addAlertText(5500,state.mode==\"SPREAD\" and \"YOUR CLONE SPREAD SPOT\" or \"YOUR CLONE STACK SPOT\",1.45,1,true)\n    end\nend\n\nself.used = true",
						conditions = 
						{
							
							{
								"19cc0ddc-58aa-cda4-9f5e-2ce3a5d280b5",
								true,
							},
							
							{
								"fb5f9a3d-3826-aea2-b44d-204bf903f1b6",
								true,
							},
						},
						name = "Draw clone half rooms and solve spot",
						uuid = "0ff34ba8-e97b-95d8-a3bd-d4959fc3a06c",
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
						localmapid = 1317,
						name = "Another Merchant's Tale",
						uuid = "19cc0ddc-58aa-cda4-9f5e-2ce3a5d280b5",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local id=eventArgs.markerID; return id==628 or id==629 or id==646 or id==647",
						dequeueIfLuaFalse = true,
						name = "Pari clone rotation markers",
						uuid = "fb5f9a3d-3826-aea2-b44d-204bf903f1b6",
						version = 3,
					},
				},
			},
			eventType = 4,
			name = "[AMT Raidplan] Pari Clone Cleaves and Spot",
			timeout = 8,
			uuid = "87606ab8-7135-2873-be28-c6c9235bd41a",
			version = 2,
		},
	}, 
	inheritedProfiles = 
	{
		"store\\anyone\\modules\\criterion-merchant",
	},
}



return tbl