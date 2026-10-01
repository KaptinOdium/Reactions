local tbl = 
{
	[2] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin M12S P1 draws",
				uuid = "a87bd678-c3eb-8580-9581-80eaf217ff14",
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
				displayPath = "Kaptin M12S P1 draws",
				eventType = 5,
				execute = "local a=eventArgs\nif a==nil or a.entityID==nil or tonumber(a.entityContentID)~=14378 then self.used=true return end\nif Argus==nil or Argus.getEntityModel==nil then self.used=true return end\nlocal model=Argus.getEntityModel(a.entityID)\nif model~=19200 and model~=19201 then self.used=true return end\nlocal ent=TensorCore.mGetEntity(a.entityID)\nif ent==nil or ent.pos==nil then self.used=true return end\n\nlocal function deleteShape(uuid)\n if uuid~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(uuid) end\nend\nlocal function deleteText(uuid)\n if uuid~=nil and AnyoneCore~=nil and AnyoneCore.removeTimedWorldText~=nil then AnyoneCore.removeTimedWorldText(uuid) end\nend\nlocal function clearPersonal(s)\n if s==nil then return end\n deleteShape(s.groundUUID)\n deleteShape(s.arrowUUID)\n deleteShape(s.ringUUID)\n deleteText(s.textUUID)\n s.groundUUID=nil\n s.arrowUUID=nil\n s.ringUUID=nil\n s.textUUID=nil\nend\nlocal function getLocalSlot(playerID)\n local defs={\n  {\"MT\",\"Main Tank\",nil},\n  {\"OT\",\"Off Tank\",nil},\n  {\"H1\",\"Healer\",\"Topmost Partylist\"},\n  {\"H2\",\"Healer\",\"Bottom-most Partylist\"},\n  {\"M1\",\"Melee DPS\",\"Topmost Partylist\"},\n  {\"M2\",\"Melee DPS\",\"Bottom-most Partylist\"},\n  {\"R1\",\"Ranged DPS\",\"Topmost Partylist\"},\n  {\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\"},\n }\n for _,d in ipairs(defs) do\n  local member=TensorCore.getEntityByGroup(d[2],d[3],true)\n  if member~=nil and member.id==playerID then return d[1] end\n end\n return nil\nend\n\ndata.kaptinM12S=data.kaptinM12S or {}\nlocal root=data.kaptinM12S\nlocal now=Now()\nlocal s=root.mortalSlayerPersonal\nif s==nil or s.lastAt==nil or TimeSince(s.lastAt)>10000 then\n clearPersonal(s)\n s={orbs={},lastAt=now,pairIndex=0,lastPairAt=nil,assignedID=nil,assignedOrder=nil,groundUUID=nil,arrowUUID=nil,textUUID=nil,resolved=false}\n root.mortalSlayerPersonal=s\nend\nif s.orbs[a.entityID]~=nil then self.used=true return end\nif s.lastPairAt==nil or TimeSince(s.lastPairAt)>800 then\n s.pairIndex=(s.pairIndex or 0)+1\n s.lastPairAt=now\nend\ns.orbs[a.entityID]={id=a.entityID,model=model,at=now,order=s.pairIndex}\ns.lastAt=now\n\nlocal total=0\nfor _ in pairs(s.orbs) do total=total+1 end\nif total<8 or s.assignedID~=nil or s.resolved==true then self.used=true return end\n\nlocal greens={}\nlocal purples={}\nfor _,rec in pairs(s.orbs) do\n local orb=TensorCore.mGetEntity(rec.id)\n if orb==nil or orb.pos==nil then self.used=true return end\n rec.x=orb.pos.x\n rec.y=orb.pos.y\n rec.z=orb.pos.z\n if rec.model==19200 then\n  purples[#purples+1]=rec\n elseif rec.model==19201 then\n  greens[#greens+1]=rec\n end\nend\nif #greens~=6 or #purples~=2 then self.used=true return end\n\ntable.sort(greens,function(l,r)\n if math.abs(l.x-r.x)>0.01 then return l.x<r.x end\n return l.z<r.z\nend)\ntable.sort(purples,function(l,r)\n local samePair=math.abs((l.at or 0)-(r.at or 0))<=500\n if samePair then\n  local ld=math.abs(l.x-100)\n  local rd=math.abs(r.x-100)\n  if math.abs(ld-rd)>0.01 then return ld>rd end\n end\n if math.abs((l.at or 0)-(r.at or 0))>1 then return (l.at or 0)<(r.at or 0) end\n return l.id<r.id\nend)\n\nlocal player=TensorCore.mGetPlayer()\nif player==nil or player.id==nil then self.used=true return end\nlocal slot=getLocalSlot(player.id)\nif slot==nil then self.used=true return end\nlocal assigned={\n MT=purples[1],\n OT=purples[2],\n H1=greens[1],\n M1=greens[2],\n R1=greens[3],\n R2=greens[4],\n M2=greens[5],\n H2=greens[6],\n}\nlocal rec=assigned[slot]\nif rec==nil then self.used=true return end\nlocal target=TensorCore.mGetEntity(rec.id)\nif target==nil or target.pos==nil then self.used=true return end\n\nclearPersonal(s)\ns.assignedID=rec.id\ns.assignedSlot=slot\ns.assignedOrder=rec.order\ns.resolved=false\nlocal flags=Argus2.RenderFlags.FLAG_WARP_TERRAIN\nlocal color=GUI:ColorConvertFloat4ToU32(0.05,1.00,0.20,0.92)\nlocal guide=TensorCore.getStaticFlatDrawer(color,3,0,flags)\nif AnyoneCore~=nil and AnyoneCore.addTimedWorldText~=nil then\n local labelPos={x=target.pos.x,y=0.05,z=target.pos.z+1.35}\n s.textUUID=AnyoneCore.addTimedWorldText(16000,\"YOU\",labelPos,color,1.80)\nend\ns.arrowUUID=guide:addTimedArrowOnEnt(16000,player.id,1.00,0.38,0.90,1.10,rec.id,0,false,0,false,flags)\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 40.515,
				name = "[Kaptin] Mortal Slayer Personal Ground Guide",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 2,
				timerStartOffset = -18,
				uuid = "d67d7f06-6734-25fd-a0da-492e7d6f158e",
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
				displayPath = "Kaptin M12S P1 draws",
				eventType = 2,
				execute = "local a=eventArgs\nif a==nil then self.used=true return end\nlocal spellID=tonumber(a.spellID)\nif spellID~=46230 and spellID~=46232 then self.used=true return end\nlocal root=data.kaptinM12S\nlocal s=root and root.mortalSlayerPersonal or nil\nif s~=nil and s.assignedID~=nil and a.entityID==s.assignedID then\n if s.groundUUID~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(s.groundUUID) end\n if s.arrowUUID~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(s.arrowUUID) end\n if s.ringUUID~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(s.ringUUID) end\n if s.textUUID~=nil and AnyoneCore~=nil and AnyoneCore.removeTimedWorldText~=nil then AnyoneCore.removeTimedWorldText(s.textUUID) end\n s.groundUUID=nil\n s.arrowUUID=nil\n s.ringUUID=nil\n s.textUUID=nil\n s.assignedID=nil\n s.resolved=true\nend\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 40.515,
				name = "[Kaptin] Mortal Slayer Personal Orb Cleanup",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 12,
				timerStartOffset = -2,
				uuid = "b27368b6-b720-2155-8549-93f05b46d1ce",
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
				displayPath = "Kaptin M12S P1 draws",
				execute = "data.kaptinM12S=data.kaptinM12S or {}\nlocal s=data.kaptinM12S.mortalSlayerPersonal\nif s==nil or s.assignedID==nil or s.resolved==true then self.used=true return end\nlocal target=TensorCore.mGetEntity(s.assignedID)\nlocal player=TensorCore.mGetPlayer()\nif target==nil or target.pos==nil or player==nil or player.id==nil then self.used=true return end\n\nif s.groundUUID~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then\n Argus.deleteTimedShape(s.groundUUID)\n s.groundUUID=nil\nend\nif s.ringUUID~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then\n Argus.deleteTimedShape(s.ringUUID)\n s.ringUUID=nil\nend\n\nlocal flags=Argus2.RenderFlags.FLAG_WARP_TERRAIN\nlocal color=GUI:ColorConvertFloat4ToU32(0.05,1.00,0.20,0.98)\nlocal guide=TensorCore.getStaticFlatDrawer(color,3,0,flags)\nif s.arrowUUID==nil then\n s.arrowUUID=guide:addTimedArrowOnEnt(16000,player.id,1.00,0.38,0.90,1.10,s.assignedID,0,false,0,false,flags)\nend\nif AnyoneCore~=nil and AnyoneCore.addTimedWorldText~=nil then\n local labelPos={x=target.pos.x,y=0.05,z=target.pos.z+1.35}\n local nextText=AnyoneCore.addTimedWorldText(650,\"YOU\",labelPos,color,1.80)\n if nextText~=nil then\n  if s.textUUID~=nil and AnyoneCore.removeTimedWorldText~=nil then\n   AnyoneCore.removeTimedWorldText(s.textUUID)\n  end\n  s.textUUID=nextText\n end\nend\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 40.515,
				name = "[Kaptin] Mortal Slayer Ground Guide Keeper",
				throttleTime = 200,
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 12,
				timerStartOffset = -6,
				uuid = "022d204a-a084-bd8f-acea-6decd0140f03",
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
				name = "Kaptin M12S P1 draws",
				uuid = "ed9cea09-1fc6-79c8-8e29-df3e6b265d84",
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
							actionLua = "local a=eventArgs\nlocal spell=a and tonumber(a.spellID) or nil\nif spell~=46237 and spell~=46238 then self.used=true return end\n\nlocal function resolveLocalRole()\n local player=TensorCore.mGetPlayer()\n if player==nil or player.id==nil or player.pos==nil then return nil,nil end\n local defs={\n  {\"MT\",\"Main Tank\",nil,\"support\",1},\n  {\"OT\",\"Off Tank\",nil,\"support\",2},\n  {\"H1\",\"Healer\",\"Topmost Partylist\",\"support\",3},\n  {\"H2\",\"Healer\",\"Bottom-most Partylist\",\"support\",4},\n  {\"M1\",\"Melee DPS\",\"Topmost Partylist\",\"dps\",1},\n  {\"M2\",\"Melee DPS\",\"Bottom-most Partylist\",\"dps\",2},\n  {\"R1\",\"Ranged DPS\",\"Topmost Partylist\",\"dps\",3},\n  {\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\",\"dps\",4},\n }\n for _,d in ipairs(defs) do\n  local ent=TensorCore.getEntityByGroup(d[2],d[3],true)\n  if ent~=nil and ent.id==player.id then\n   return {slot=d[1],kind=d[4],idx=d[5]},player\n  end\n end\n return nil,player\nend\n\nlocal function clearGuide(state)\n if state.arrow then Argus.deleteTimedShape(state.arrow) end\n if state.dot then Argus.deleteTimedShape(state.dot) end\n state.arrow=nil\n state.dot=nil\nend\n\nlocal function drawGuide(state,player,x,z,life)\n clearGuide(state)\n local dst={x=x,y=player.pos.y,z=z}\n local distance=TensorCore.getDistance2d(player.pos,dst)\n local flags=Argus2.RenderFlags.FLAG_WARP_TERRAIN+Argus2.RenderFlags.FLAG_RENDER_OVERLAY\n local color=GUI:ColorConvertFloat4ToU32(0.05,1.00,0.15,0.92)\n local drawer=TensorCore.getStaticFlatDrawer(color,2.5,0,flags)\n if distance>0.12 then\n  local tip=math.min(0.90,math.max(0.20,distance*0.25))\n  local base=math.max(0.10,distance-tip)\n  local heading=TensorCore.getHeadingToTarget(player.pos,dst)\n  state.arrow=drawer:addTimedArrow(life,player.pos.x,player.pos.y+0.05,player.pos.z,heading,base,0.30,tip,0.78,0,false,flags)\n end\n state.dot=drawer:addTimedCircle(life,x,player.pos.y+0.05,z,0.32,0,false,true,flags)\nend\n\ndata.kaptinM12S=data.kaptinM12S or {}\nlocal state=data.kaptinM12S\n\nif spell==46237 then\n clearGuide(state)\n state.act1Guide=nil\n local role=resolveLocalRole()\n local source=TensorCore.mGetEntity(a.entityID)\n if role==nil or source==nil or source.pos==nil then self.used=true return end\n state.act1Guide={\n  armedAt=Now(),\n  lastPuddleWaveAt=nil,\n  puddleWaves=0,\n  fired=false,\n  east=source.pos.x>100,\n  roleIdx=role.idx,\n }\n state.phase=\"act1\"\n self.used=true\n return\nend\n\nlocal guide=state.act1Guide\nif guide==nil or guide.armedAt==nil or guide.fired==true or TimeSince(guide.armedAt)>10000 then\n self.used=true\n return\nend\nif guide.lastPuddleWaveAt~=nil and TimeSince(guide.lastPuddleWaveAt)<500 then\n self.used=true\n return\nend\nguide.lastPuddleWaveAt=Now()\nguide.puddleWaves=(guide.puddleWaves or 0)+1\nif guide.puddleWaves>=3 then\n local role,player=resolveLocalRole()\n if role~=nil and player~=nil then\n  local spread=TensorCore.hasBuff(player,4761)\n  local x,z\n  if spread then\n   local spots={\n    {103.137,85.998},\n    {107.958,93.610},\n    {115.724,100.036},\n    {108.838,108.796},\n   }\n   local point=spots[role.idx]\n   if point~=nil then\n    x=point[1]\n    z=point[2]\n    if not guide.east then x=200-x end\n   end\n  else\n   if guide.east then x,z=115.843,87.544 else x,z=84.099,87.589 end\n  end\n  if x~=nil and z~=nil then\n   drawGuide(state,player,x,z,7000)\n   guide.fired=true\n  end\n end\nend\nself.used=true",
							conditions = 
							{
								
								{
									"337bcc56-0d83-e1df-8674-3cce5b3300a6",
									true,
								},
							},
							name = "Last puddle arrow + exact roster assignment",
							uuid = "5ac19088-9e21-e9a9-b7fe-adc7092360c3",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local a=eventArgs\nlocal id=a and tonumber(a.spellID) or nil\nreturn id==46237 or id==46238",
							dequeueIfLuaFalse = true,
							name = "Act 1 Ravenous + puddle waves",
							uuid = "337bcc56-0d83-e1df-8674-3cce5b3300a6",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M12S P1 draws",
				eventType = 3,
				loop = true,
				mechanicTime = 69.75,
				name = "[Kaptin M12S] Act 1 Roster Guide",
				timeRange = true,
				timelineIndex = 6,
				timerEndOffset = 22,
				timerStartOffset = -2,
				uuid = "b6d2e984-251b-bf22-bf63-0f224a4234c9",
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
				displayPath = "Kaptin M12S P1 draws",
				eventType = 29,
				execute = "local a=eventArgs\nif a==nil then self.used=true return end\nlocal cid=tonumber(a.entityContentID) or 0\nlocal key=tonumber(a.keyID) or 0\nif (cid~=2015017 and key~=2015017) or tonumber(a.type)~=7 or tonumber(a.flags)~=5 then self.used=true return end\nlocal x,z=tonumber(a.x),tonumber(a.z)\nif x==nil or z==nil then self.used=true return end\n\ndata.kaptinM12S=data.kaptinM12S or {}\nlocal state=data.kaptinM12S\nlocal now=Now()\nif state.act1BlobAt==nil or TimeSince(state.act1BlobAt)>10000 then\n state.act1BlobCenters={}\n state.act1BlobKeys={}\nend\nstate.act1BlobAt=now\nstate.act1BlobCenters=state.act1BlobCenters or {}\nstate.act1BlobKeys=state.act1BlobKeys or {}\nlocal k=string.format(\"%.2f:%.2f\",x,z)\nif state.act1BlobKeys[k]~=true and #state.act1BlobCenters<5 then\n state.act1BlobKeys[k]=true\n state.act1BlobCenters[#state.act1BlobCenters+1]={x=x,z=z}\nend\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 69.75,
				name = "[Kaptin M12S] Act 1 Final Blob Pattern",
				timeRange = true,
				timelineIndex = 6,
				timerEndOffset = 30,
				timerStartOffset = -2,
				uuid = "2e2262e3-ff40-65e1-84a0-2bf0e83c42dd",
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
				name = "Kaptin M12S P1 draws",
				uuid = "87085806-8343-1c78-a689-ee7cdf182fe4",
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
				displayPath = "Kaptin M12S P1 draws",
				eventType = 2,
				execute = "local a=eventArgs\nif a==nil or tonumber(a.spellID)~=46254 then self.used=true return end\ndata.kaptinM12S=data.kaptinM12S or {}\nlocal state=data.kaptinM12S\nlocal g=state.act1Guide\nif g==nil or g.armedAt==nil or state.act1FinalFor==g.armedAt then self.used=true return end\nlocal player=TensorCore.mGetPlayer()\nif player==nil or player.id==nil or player.pos==nil then self.used=true return end\nlocal defs={\n {\"MT\",\"Main Tank\",nil},\n {\"OT\",\"Off Tank\",nil},\n {\"H1\",\"Healer\",\"Topmost Partylist\"},\n {\"H2\",\"Healer\",\"Bottom-most Partylist\"},\n {\"M1\",\"Melee DPS\",\"Topmost Partylist\"},\n {\"M2\",\"Melee DPS\",\"Bottom-most Partylist\"},\n {\"R1\",\"Ranged DPS\",\"Topmost Partylist\"},\n {\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\"},\n}\nlocal slot=nil\nfor _,d in ipairs(defs) do\n local ent=TensorCore.getEntityByGroup(d[2],d[3],true)\n if ent~=nil and ent.id==player.id then slot=d[1] break end\nend\nif slot==nil then self.used=true return end\nlocal tank=slot==\"MT\" or slot==\"OT\"\nlocal requiredEast=g.east\nif tank then requiredEast=not requiredEast end\nlocal candidates=requiredEast and {{118,87},{118,100}} or {{82,87},{82,100}}\nlocal centers=state.act1BlobCenters or {}\nif #centers<5 then self.used=true return end\n\nlocal best=nil\nlocal bestClear=-1\nfor _,p in ipairs(candidates) do\n local nearest=math.huge\n for _,c in ipairs(centers) do\n  local dx,dz=p[1]-c.x,p[2]-c.z\n  local d2=dx*dx+dz*dz\n  if d2<nearest then nearest=d2 end\n end\n if nearest>bestClear then bestClear=nearest best=p end\nend\nif best==nil then self.used=true return end\n\nif state.arrow~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(state.arrow) end\nif state.dot~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(state.dot) end\nstate.arrow=nil\nstate.dot=nil\n\nlocal x,z=best[1],best[2]\nlocal dst={x=x,y=player.pos.y,z=z}\nlocal distance=TensorCore.getDistance2d(player.pos,dst)\nlocal flags=Argus2.RenderFlags.FLAG_WARP_TERRAIN+Argus2.RenderFlags.FLAG_RENDER_OVERLAY\nlocal color=GUI:ColorConvertFloat4ToU32(0.05,1.00,0.15,0.98)\nlocal drawer=TensorCore.getStaticFlatDrawer(color,3,0,flags)\nif distance>0.12 then\n local tip=math.min(0.95,math.max(0.20,distance*0.25))\n local base=math.max(0.10,distance-tip)\n local heading=TensorCore.getHeadingToTarget(player.pos,dst)\n state.arrow=drawer:addTimedArrow(9700,player.pos.x,player.pos.y+0.05,player.pos.z,heading,base,0.34,tip,0.85,0,false,flags)\nend\nstate.dot=drawer:addTimedCircle(9700,x,player.pos.y+0.05,z,0.34,0,false,true,flags)\nif state.arrow~=nil or state.dot~=nil then state.act1FinalFor=g.armedAt end\nstate.phase=\"act1_final\"\nstate.act1FinalSlot=slot\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 87.969,
				name = "[Kaptin M12S] Act 1 Final Tank/Party Guide",
				timeRange = true,
				timelineIndex = 14,
				timerEndOffset = 3,
				timerStartOffset = -1,
				uuid = "0bf4aa75-831c-a54c-94e9-3034391857ce",
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
				name = "Kaptin M12S P1 draws",
				uuid = "ee9d4bde-f7a8-c197-af7b-66b244bc5cc6",
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
							actionLua = "local a=eventArgs\nlocal id=a and tonumber(a.spellID) or 0\nif id~=46241 and id~=46242 and id~=46251 and id~=46248 then self.used=true return end\n\nlocal function resolveLocalRole()\n local player=TensorCore.mGetPlayer()\n if player==nil or player.id==nil or player.pos==nil then return nil,nil end\n local defs={\n  {\"MT\",\"Tank\",\"Topmost Partylist\",\"support\",1},\n  {\"OT\",\"Tank\",\"Bottom-most Partylist\",\"support\",2},\n  {\"H1\",\"Healer\",\"Topmost Partylist\",\"support\",3},\n  {\"H2\",\"Healer\",\"Bottom-most Partylist\",\"support\",4},\n  {\"M1\",\"Melee DPS\",\"Topmost Partylist\",\"dps\",1},\n  {\"M2\",\"Melee DPS\",\"Bottom-most Partylist\",\"dps\",2},\n  {\"R1\",\"Ranged DPS\",\"Topmost Partylist\",\"dps\",3},\n  {\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\",\"dps\",4},\n }\n for _,d in ipairs(defs) do\n  local ent=TensorCore.getEntityByGroup(d[2],d[3],true)\n  if ent~=nil and ent.id==player.id then return {slot=d[1],kind=d[4],idx=d[5]},player end\n end\n return nil,player\nend\nlocal function clearGuide(state)\n if state.arrow then Argus.deleteTimedShape(state.arrow) end\n if state.dot then Argus.deleteTimedShape(state.dot) end\n state.arrow=nil\n state.dot=nil\nend\nlocal function drawGuide(state,player,x,z,life)\n clearGuide(state)\n local dst={x=x,y=player.pos.y,z=z}\n local distance=TensorCore.getDistance2d(player.pos,dst)\n local flags=Argus2.RenderFlags.FLAG_WARP_TERRAIN+Argus2.RenderFlags.FLAG_RENDER_OVERLAY\n local color=GUI:ColorConvertFloat4ToU32(0.05,1.00,0.15,0.92)\n local drawer=TensorCore.getStaticFlatDrawer(color,2.5,0,flags)\n if distance>0.12 then\n  local tip=math.min(0.90,math.max(0.20,distance*0.25))\n  local base=math.max(0.10,distance-tip)\n  local heading=TensorCore.getHeadingToTarget(player.pos,dst)\n  state.arrow=drawer:addTimedArrow(life,player.pos.x,player.pos.y+0.05,player.pos.z,heading,base,0.30,tip,0.78,0,false,flags)\n end\n state.dot=drawer:addTimedCircle(life,x,player.pos.y+0.05,z,0.32,0,false,true,flags)\nend\n\ndata.kaptinM12S=data.kaptinM12S or {}\nlocal state=data.kaptinM12S\nif id==46241 or id==46242 then\n state.layout=id==46241 and \"cardinal\" or \"intercardinal\"\n state.act3Stage2Drawn=false\n state.phase=\"act3_layout\"\n self.used=true\n return\nend\nif id==46248 then\n clearGuide(state)\n state.act3Stage2Drawn=false\n state.phase=nil\n self.used=true\n return\nend\nif state.act3Stage2Drawn==true then self.used=true return end\nlocal role,player=resolveLocalRole()\nif role==nil or (state.layout~=\"cardinal\" and state.layout~=\"intercardinal\") then self.used=true return end\nlocal cardinal={\n MT={99.636,93.486},OT={100.574,93.689},\n H1={90.965,99.848},H2={109.565,99.840},\n M1={90.780,88.800},M2={109.303,89.042},\n R1={81.068,100.237},R2={118.831,99.885},\n}\nlocal intercardinal={\n MT={99.559,100.066},OT={100.077,99.925},\n H1={91.118,99.849},H2={108.570,99.993},\n M1={85.800,87.653},M2={114.200,87.512},\n R1={85.697,112.363},R2={114.125,112.317},\n}\nlocal target=(state.layout==\"cardinal\" and cardinal or intercardinal)[role.slot]\nif target==nil then self.used=true return end\ndrawGuide(state,player,target[1],target[2],5000)\nstate.act3Stage2Drawn=true\nstate.phase=\"act3_stage2\"\nself.used=true",
							conditions = 
							{
								
								{
									"e1c05b68-74ef-0a12-b7dc-a1f308983df3",
									true,
								},
							},
							name = "Record layout / draw second bait / clear",
							uuid = "d7fb9c54-0363-e86f-ac9e-6e7cbf0c8fe0",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local a=eventArgs\nlocal id=a and tonumber(a.spellID) or 0\nreturn id==46241 or id==46242 or id==46251 or id==46248",
							dequeueIfLuaFalse = true,
							name = "Act 3 layout, second bait, or cleanup",
							uuid = "e1c05b68-74ef-0a12-b7dc-a1f308983df3",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M12S P1 draws",
				eventType = 2,
				loop = true,
				mechanicTime = 205.767,
				name = "[Kaptin M12S] Act 3 Layout + Stage 2 Guide",
				timeRange = true,
				timelineIndex = 31,
				timerEndOffset = 32,
				timerStartOffset = -1,
				uuid = "fcb6a075-208f-c9f3-8fd3-da121858f812",
				version = 2,
			},
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
							actionLua = "local a=eventArgs\nlocal a1=a and tonumber(a.a1) or -1\nlocal a2=a and tonumber(a.a2) or -1\nlocal a3=a and tonumber(a.a3) or -1\nlocal isCardinal=a1==0 and a2==16 and a3==32\nlocal isIntercardinal=a1==0 and a2==1024 and a3==2048\nif not isCardinal and not isIntercardinal then self.used=true return end\n\nlocal function resolveLocalRole()\n local player=TensorCore.mGetPlayer()\n if player==nil or player.id==nil or player.pos==nil then return nil,nil end\n local defs={\n  {\"MT\",\"Tank\",\"Topmost Partylist\",\"support\",1},\n  {\"OT\",\"Tank\",\"Bottom-most Partylist\",\"support\",2},\n  {\"H1\",\"Healer\",\"Topmost Partylist\",\"support\",3},\n  {\"H2\",\"Healer\",\"Bottom-most Partylist\",\"support\",4},\n  {\"M1\",\"Melee DPS\",\"Topmost Partylist\",\"dps\",1},\n  {\"M2\",\"Melee DPS\",\"Bottom-most Partylist\",\"dps\",2},\n  {\"R1\",\"Ranged DPS\",\"Topmost Partylist\",\"dps\",3},\n  {\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\",\"dps\",4},\n }\n for _,d in ipairs(defs) do\n  local ent=TensorCore.getEntityByGroup(d[2],d[3],true)\n  if ent~=nil and ent.id==player.id then return {slot=d[1],kind=d[4],idx=d[5]},player end\n end\n return nil,player\nend\nlocal function clearGuide(state)\n if state.arrow then Argus.deleteTimedShape(state.arrow) end\n if state.dot then Argus.deleteTimedShape(state.dot) end\n state.arrow=nil\n state.dot=nil\nend\nlocal function drawGuide(state,player,x,z,life)\n clearGuide(state)\n local dst={x=x,y=player.pos.y,z=z}\n local distance=TensorCore.getDistance2d(player.pos,dst)\n local flags=Argus2.RenderFlags.FLAG_WARP_TERRAIN+Argus2.RenderFlags.FLAG_RENDER_OVERLAY\n local color=GUI:ColorConvertFloat4ToU32(0.05,1.00,0.15,0.92)\n local drawer=TensorCore.getStaticFlatDrawer(color,2.5,0,flags)\n if distance>0.12 then\n  local tip=math.min(0.90,math.max(0.20,distance*0.25))\n  local base=math.max(0.10,distance-tip)\n  local heading=TensorCore.getHeadingToTarget(player.pos,dst)\n  state.arrow=drawer:addTimedArrow(life,player.pos.x,player.pos.y+0.05,player.pos.z,heading,base,0.30,tip,0.78,0,false,flags)\n end\n state.dot=drawer:addTimedCircle(life,x,player.pos.y+0.05,z,0.32,0,false,true,flags)\nend\n\ndata.kaptinM12S=data.kaptinM12S or {}\nlocal state=data.kaptinM12S\nstate.layout=isCardinal and \"cardinal\" or \"intercardinal\"\nlocal role,player=resolveLocalRole()\nif role==nil then self.used=true return end\nlocal cardinal={\n MT={90.721,85.644},OT={109.259,85.771},\n H1={95.709,100.078},H2={103.826,100.146},\n M1={99.044,90.522},M2={100.695,90.534},\n R1={89.102,99.778},R2={109.037,100.115},\n}\nlocal intercardinal={\n MT={91.028,96.814},OT={108.991,96.444},\n H1={98.158,101.838},H2={101.951,101.906},\n M1={85.800,87.653},M2={114.200,87.512},\n R1={85.697,112.363},R2={114.125,112.317},\n}\nlocal target=(state.layout==\"cardinal\" and cardinal or intercardinal)[role.slot]\nif target==nil then self.used=true return end\ndrawGuide(state,player,target[1],target[2],12000)\nstate.phase=\"act3_stage1\"\nself.used=true",
							conditions = 
							{
								
								{
									"2cc9fd3b-9df6-a789-a4dd-625adfd9a5c8",
									true,
								},
							},
							name = "Arrow + tiny first-bait dot",
							uuid = "eec7fb17-200c-5180-8911-e714dc9fb031",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local a=eventArgs\nlocal a1=a and tonumber(a.a1) or -1\nlocal a2=a and tonumber(a.a2) or -1\nlocal a3=a and tonumber(a.a3) or -1\nreturn a1==0 and ((a2==16 and a3==32) or (a2==1024 and a3==2048))",
							dequeueIfLuaFalse = true,
							name = "Act 3 floor split",
							uuid = "2cc9fd3b-9df6-a789-a4dd-625adfd9a5c8",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M12S P1 draws",
				eventType = 14,
				mechanicTime = 205.767,
				name = "[Kaptin M12S] Act 3 Stage 1 Roster Guide",
				timeRange = true,
				timelineIndex = 31,
				timerEndOffset = 25,
				timerStartOffset = -1,
				uuid = "28b8c087-267d-4f06-92a8-b088e445ffa8",
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
				name = "Kaptin M12S P1 draws",
				uuid = "eeb5889a-929f-3c1d-a9d9-c54bf2df68f3",
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
							actionLua = "local a=eventArgs\nif a==nil or tonumber(a.spellID)~=46237 then self.used=true return end\n\nlocal function resolveLocalRole()\n local player=TensorCore.mGetPlayer()\n if player==nil or player.id==nil or player.pos==nil then return nil,nil end\n local defs={\n  {\"MT\",\"Main Tank\",nil,\"support\",1},\n  {\"OT\",\"Off Tank\",nil,\"support\",2},\n  {\"H1\",\"Healer\",\"Topmost Partylist\",\"support\",3},\n  {\"H2\",\"Healer\",\"Bottom-most Partylist\",\"support\",4},\n  {\"M1\",\"Melee DPS\",\"Topmost Partylist\",\"dps\",1},\n  {\"M2\",\"Melee DPS\",\"Bottom-most Partylist\",\"dps\",2},\n  {\"R1\",\"Ranged DPS\",\"Topmost Partylist\",\"dps\",3},\n  {\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\",\"dps\",4},\n }\n for _,d in ipairs(defs) do\n  local ent=TensorCore.getEntityByGroup(d[2],d[3],true)\n  if ent~=nil and ent.id==player.id then return {slot=d[1],kind=d[4],idx=d[5]},player end\n end\n return nil,player\nend\nlocal function clearGuide(state)\n if state.arrow then Argus.deleteTimedShape(state.arrow) end\n if state.dot then Argus.deleteTimedShape(state.dot) end\n state.arrow=nil\n state.dot=nil\nend\nlocal function drawGuide(state,player,x,z,life)\n clearGuide(state)\n local dst={x=x,y=player.pos.y,z=z}\n local distance=TensorCore.getDistance2d(player.pos,dst)\n local flags=Argus2.RenderFlags.FLAG_WARP_TERRAIN+Argus2.RenderFlags.FLAG_RENDER_OVERLAY\n local color=GUI:ColorConvertFloat4ToU32(0.05,1.00,0.15,0.92)\n local drawer=TensorCore.getStaticFlatDrawer(color,2.5,0,flags)\n if distance>0.12 then\n  local tip=math.min(0.90,math.max(0.20,distance*0.25))\n  local base=math.max(0.10,distance-tip)\n  local heading=TensorCore.getHeadingToTarget(player.pos,dst)\n  state.arrow=drawer:addTimedArrow(life,player.pos.x,player.pos.y+0.05,player.pos.z,heading,base,0.30,tip,0.78,0,false,flags)\n end\n state.dot=drawer:addTimedCircle(life,x,player.pos.y+0.05,z,0.32,0,false,true,flags)\nend\n\nlocal role,player=resolveLocalRole()\nlocal source=TensorCore.mGetEntity(a.entityID)\nif role==nil or source==nil or source.pos==nil then self.used=true return end\ndata.kaptinM12S=data.kaptinM12S or {}\nlocal state=data.kaptinM12S\nlocal layout=state.layout\nif layout~=\"cardinal\" and layout~=\"intercardinal\" then self.used=true return end\nlocal purpleKind=layout==\"cardinal\" and \"dps\" or \"support\"\nlocal mode=role.kind==purpleKind and \"cleave\" or \"safe\"\nlocal cardinal={\n safe={{103.5,86},{108.5,93.5},{115.5,100},{108.5,106}},\n cleave={{91.5,86},{94.5,94.5},{100.25,101.5},{95.25,109.5}},\n}\nlocal intercardinal={\n safe={{105.75,85.75},{114,91},{105.75,114.25},{114,109}},\n cleave={{100,95.75},{107,100},{100,104.25},{93,100}},\n}\nlocal target=(layout==\"cardinal\" and cardinal or intercardinal)[mode][role.idx]\nlocal x,z=target[1],target[2]\nif source.pos.x<100 then x=200-x end\ndrawGuide(state,player,x,z,12000)\nstate.phase=\"curtain\"\nself.used=true",
							conditions = 
							{
								
								{
									"d73b8d7d-2585-19a0-816e-3fb2091f187a",
									true,
								},
							},
							name = "Arrow + tiny assigned dot",
							uuid = "702a7040-e252-09b4-bd76-d110cf5f82ea",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local a=eventArgs\nreturn a~=nil and tonumber(a.spellID)==46237",
							dequeueIfLuaFalse = true,
							name = "Curtain Ravenous Reach",
							uuid = "d73b8d7d-2585-19a0-816e-3fb2091f187a",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M12S P1 draws",
				eventType = 3,
				mechanicTime = 252.501,
				name = "[Kaptin M12S] Curtain Call Roster Guide",
				timeRange = true,
				timelineIndex = 43,
				timerEndOffset = 20,
				timerStartOffset = -1,
				uuid = "4db6bdf7-8005-54ff-b3dc-1ecac0c46f1a",
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
				name = "Kaptin M12S P1 draws",
				uuid = "a9fc7ede-2878-b8dc-acb8-3ddb7b23ab1e",
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
							actionLua = "local a=eventArgs\nif a==nil then self.used=true return end\n\nlocal function resolveLocalRole()\n local player=TensorCore.mGetPlayer()\n if player==nil or player.id==nil or player.pos==nil then return nil,nil end\n local defs={\n  {\"MT\",\"Main Tank\",nil,\"support\",1},\n  {\"OT\",\"Off Tank\",nil,\"support\",2},\n  {\"H1\",\"Healer\",\"Topmost Partylist\",\"support\",3},\n  {\"H2\",\"Healer\",\"Bottom-most Partylist\",\"support\",4},\n  {\"M1\",\"Melee DPS\",\"Topmost Partylist\",\"dps\",1},\n  {\"M2\",\"Melee DPS\",\"Bottom-most Partylist\",\"dps\",2},\n  {\"R1\",\"Ranged DPS\",\"Topmost Partylist\",\"dps\",3},\n  {\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\",\"dps\",4},\n }\n for _,d in ipairs(defs) do\n  local ent=TensorCore.getEntityByGroup(d[2],d[3],true)\n  if ent~=nil and ent.id==player.id then return {slot=d[1],kind=d[4],idx=d[5]},player end\n end\n return nil,player\nend\nlocal function clearGuide(state)\n if state.arrow then Argus.deleteTimedShape(state.arrow) end\n if state.dot then Argus.deleteTimedShape(state.dot) end\n state.arrow=nil\n state.dot=nil\nend\nlocal function drawGuide(state,player,x,z,life)\n clearGuide(state)\n local dst={x=x,y=player.pos.y,z=z}\n local distance=TensorCore.getDistance2d(player.pos,dst)\n local flags=Argus2.RenderFlags.FLAG_WARP_TERRAIN+Argus2.RenderFlags.FLAG_RENDER_OVERLAY\n local color=GUI:ColorConvertFloat4ToU32(0.05,1.00,0.15,0.92)\n local drawer=TensorCore.getStaticFlatDrawer(color,2.5,0,flags)\n if distance>0.12 then\n  local tip=math.min(0.90,math.max(0.20,distance*0.25))\n  local base=math.max(0.10,distance-tip)\n  local heading=TensorCore.getHeadingToTarget(player.pos,dst)\n  state.arrow=drawer:addTimedArrow(life,player.pos.x,player.pos.y+0.05,player.pos.z,heading,base,0.30,tip,0.78,0,false,flags)\n end\n state.dot=drawer:addTimedCircle(life,x,player.pos.y+0.05,z,0.32,0,false,true,flags)\nend\n\nlocal role,player=resolveLocalRole()\nif role==nil then self.used=true return end\ndata.kaptinM12S=data.kaptinM12S or {}\nlocal state=data.kaptinM12S\nlocal newID=tonumber(a.newTetherID) or 0\nif newID==366 then\n local targets={\n  MT={81,86},OT={81,94},H1={81,104},H2={81,114},\n  M1={119,86},M2={119,94.5},R1={119,104},R2={119,114},\n }\n local target=targets[role.slot]\n if target~=nil then\n  drawGuide(state,player,target[1],target[2],15000)\n  state.chainActive=true\n  state.chainSource=a.sourceEntityID\n  state.chainTarget=a.newTargetID\n  state.phase=\"chain\"\n end\nelseif newID==0 and state.chainActive then\n clearGuide(state)\n state.chainActive=false\n state.chainSource=nil\n state.chainTarget=nil\nend\nself.used=true",
							conditions = 
							{
								
								{
									"76d1b12c-3fdd-a71b-8d40-0fdc2dc04178",
									true,
								},
							},
							name = "Arrow + tiny chain-break dot",
							uuid = "836b86a7-8af0-69ec-80b9-4f866e52ffbb",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local a=eventArgs\nlocal p=TensorCore.mGetPlayer()\nif a==nil or p==nil then return false end\nlocal newID=tonumber(a.newTetherID) or 0\nif newID==366 then\n    return a.sourceEntityID==p.id or a.newTargetID==p.id\nend\nlocal s=data.kaptinM12S\nreturn newID==0 and s~=nil and s.chainActive==true\n    and (a.sourceEntityID==p.id or a.oldTargetID==p.id or a.sourceEntityID==s.chainSource)\n",
							dequeueIfLuaFalse = true,
							name = "Local Flesh tether lifecycle",
							uuid = "76d1b12c-3fdd-a71b-8d40-0fdc2dc04178",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M12S P1 draws",
				eventType = 15,
				loop = true,
				mechanicTime = 267.392,
				name = "[Kaptin M12S] Curtain Chain Break Guide",
				timeRange = true,
				timelineIndex = 51,
				timerEndOffset = 18,
				timerStartOffset = -2,
				uuid = "5cc4cfc0-74c9-7662-8d6b-dcc692522411",
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
				name = "Kaptin M12S P1 draws",
				uuid = "f80e446a-807a-dbe1-b643-3d6d5b62b038",
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
				displayPath = "Kaptin M12S P1 draws",
				eventType = 5,
				execute = "local a=eventArgs\nif a==nil or a.entityID==nil or tonumber(a.entityContentID)~=14378 then self.used=true return end\nif Argus==nil or Argus.getEntityModel==nil then self.used=true return end\nlocal model=Argus.getEntityModel(a.entityID)\nif model~=19200 and model~=19201 then self.used=true return end\nlocal ent=TensorCore.mGetEntity(a.entityID)\nif ent==nil or ent.pos==nil then self.used=true return end\n\nlocal function deleteShape(uuid)\n if uuid~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(uuid) end\nend\nlocal function deleteText(uuid)\n if uuid~=nil and AnyoneCore~=nil and AnyoneCore.removeTimedWorldText~=nil then AnyoneCore.removeTimedWorldText(uuid) end\nend\nlocal function clearPersonal(s)\n if s==nil then return end\n deleteShape(s.groundUUID)\n deleteShape(s.arrowUUID)\n deleteShape(s.ringUUID)\n deleteText(s.textUUID)\n s.groundUUID=nil\n s.arrowUUID=nil\n s.ringUUID=nil\n s.textUUID=nil\nend\nlocal function getLocalSlot(playerID)\n local defs={\n  {\"MT\",\"Main Tank\",nil},\n  {\"OT\",\"Off Tank\",nil},\n  {\"H1\",\"Healer\",\"Topmost Partylist\"},\n  {\"H2\",\"Healer\",\"Bottom-most Partylist\"},\n  {\"M1\",\"Melee DPS\",\"Topmost Partylist\"},\n  {\"M2\",\"Melee DPS\",\"Bottom-most Partylist\"},\n  {\"R1\",\"Ranged DPS\",\"Topmost Partylist\"},\n  {\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\"},\n }\n for _,d in ipairs(defs) do\n  local member=TensorCore.getEntityByGroup(d[2],d[3],true)\n  if member~=nil and member.id==playerID then return d[1] end\n end\n return nil\nend\n\ndata.kaptinM12S=data.kaptinM12S or {}\nlocal root=data.kaptinM12S\nlocal now=Now()\nlocal s=root.mortalSlayerPersonal\nif s==nil or s.lastAt==nil or TimeSince(s.lastAt)>10000 then\n clearPersonal(s)\n s={orbs={},lastAt=now,pairIndex=0,lastPairAt=nil,assignedID=nil,assignedOrder=nil,groundUUID=nil,arrowUUID=nil,textUUID=nil,resolved=false}\n root.mortalSlayerPersonal=s\nend\nif s.orbs[a.entityID]~=nil then self.used=true return end\nif s.lastPairAt==nil or TimeSince(s.lastPairAt)>800 then\n s.pairIndex=(s.pairIndex or 0)+1\n s.lastPairAt=now\nend\ns.orbs[a.entityID]={id=a.entityID,model=model,at=now,order=s.pairIndex}\ns.lastAt=now\n\nlocal total=0\nfor _ in pairs(s.orbs) do total=total+1 end\nif total<8 or s.assignedID~=nil or s.resolved==true then self.used=true return end\n\nlocal greens={}\nlocal purples={}\nfor _,rec in pairs(s.orbs) do\n local orb=TensorCore.mGetEntity(rec.id)\n if orb==nil or orb.pos==nil then self.used=true return end\n rec.x=orb.pos.x\n rec.y=orb.pos.y\n rec.z=orb.pos.z\n if rec.model==19200 then\n  purples[#purples+1]=rec\n elseif rec.model==19201 then\n  greens[#greens+1]=rec\n end\nend\nif #greens~=6 or #purples~=2 then self.used=true return end\n\ntable.sort(greens,function(l,r)\n if math.abs(l.x-r.x)>0.01 then return l.x<r.x end\n return l.z<r.z\nend)\ntable.sort(purples,function(l,r)\n local samePair=math.abs((l.at or 0)-(r.at or 0))<=500\n if samePair then\n  local ld=math.abs(l.x-100)\n  local rd=math.abs(r.x-100)\n  if math.abs(ld-rd)>0.01 then return ld>rd end\n end\n if math.abs((l.at or 0)-(r.at or 0))>1 then return (l.at or 0)<(r.at or 0) end\n return l.id<r.id\nend)\n\nlocal player=TensorCore.mGetPlayer()\nif player==nil or player.id==nil then self.used=true return end\nlocal slot=getLocalSlot(player.id)\nif slot==nil then self.used=true return end\nlocal assigned={\n MT=purples[1],\n OT=purples[2],\n H1=greens[1],\n M1=greens[2],\n R1=greens[3],\n R2=greens[4],\n M2=greens[5],\n H2=greens[6],\n}\nlocal rec=assigned[slot]\nif rec==nil then self.used=true return end\nlocal target=TensorCore.mGetEntity(rec.id)\nif target==nil or target.pos==nil then self.used=true return end\n\nclearPersonal(s)\ns.assignedID=rec.id\ns.assignedSlot=slot\ns.assignedOrder=rec.order\ns.resolved=false\nlocal flags=Argus2.RenderFlags.FLAG_WARP_TERRAIN\nlocal color=GUI:ColorConvertFloat4ToU32(0.05,1.00,0.20,0.92)\nlocal guide=TensorCore.getStaticFlatDrawer(color,3,0,flags)\nif AnyoneCore~=nil and AnyoneCore.addTimedWorldText~=nil then\n local labelPos={x=target.pos.x,y=0.05,z=target.pos.z+1.35}\n s.textUUID=AnyoneCore.addTimedWorldText(16000,\"YOU\",labelPos,color,1.80)\nend\ns.arrowUUID=guide:addTimedArrowOnEnt(16000,player.id,1.00,0.38,0.90,1.10,rec.id,0,false,0,false,flags)\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 314.97,
				name = "[Kaptin] Mortal Slayer Personal Ground Guide",
				timeRange = true,
				timelineIndex = 55,
				timerEndOffset = 2,
				timerStartOffset = -18,
				uuid = "6bf33257-ac1d-021b-ae20-2f132081f65f",
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
				displayPath = "Kaptin M12S P1 draws",
				eventType = 2,
				execute = "local a=eventArgs\nif a==nil then self.used=true return end\nlocal spellID=tonumber(a.spellID)\nif spellID~=46230 and spellID~=46232 then self.used=true return end\nlocal root=data.kaptinM12S\nlocal s=root and root.mortalSlayerPersonal or nil\nif s~=nil and s.assignedID~=nil and a.entityID==s.assignedID then\n if s.groundUUID~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(s.groundUUID) end\n if s.arrowUUID~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(s.arrowUUID) end\n if s.ringUUID~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(s.ringUUID) end\n if s.textUUID~=nil and AnyoneCore~=nil and AnyoneCore.removeTimedWorldText~=nil then AnyoneCore.removeTimedWorldText(s.textUUID) end\n s.groundUUID=nil\n s.arrowUUID=nil\n s.ringUUID=nil\n s.textUUID=nil\n s.assignedID=nil\n s.resolved=true\nend\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 314.97,
				name = "[Kaptin] Mortal Slayer Personal Orb Cleanup",
				timeRange = true,
				timelineIndex = 55,
				timerEndOffset = 12,
				timerStartOffset = -2,
				uuid = "f36eca8f-be64-98de-9a94-5e076de10efb",
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
				displayPath = "Kaptin M12S P1 draws",
				execute = "data.kaptinM12S=data.kaptinM12S or {}\nlocal s=data.kaptinM12S.mortalSlayerPersonal\nif s==nil or s.assignedID==nil or s.resolved==true then self.used=true return end\nlocal target=TensorCore.mGetEntity(s.assignedID)\nlocal player=TensorCore.mGetPlayer()\nif target==nil or target.pos==nil or player==nil or player.id==nil then self.used=true return end\n\nif s.groundUUID~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then\n Argus.deleteTimedShape(s.groundUUID)\n s.groundUUID=nil\nend\nif s.ringUUID~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then\n Argus.deleteTimedShape(s.ringUUID)\n s.ringUUID=nil\nend\n\nlocal flags=Argus2.RenderFlags.FLAG_WARP_TERRAIN\nlocal color=GUI:ColorConvertFloat4ToU32(0.05,1.00,0.20,0.98)\nlocal guide=TensorCore.getStaticFlatDrawer(color,3,0,flags)\nif s.arrowUUID==nil then\n s.arrowUUID=guide:addTimedArrowOnEnt(16000,player.id,1.00,0.38,0.90,1.10,s.assignedID,0,false,0,false,flags)\nend\nif AnyoneCore~=nil and AnyoneCore.addTimedWorldText~=nil then\n local labelPos={x=target.pos.x,y=0.05,z=target.pos.z+1.35}\n local nextText=AnyoneCore.addTimedWorldText(650,\"YOU\",labelPos,color,1.80)\n if nextText~=nil then\n  if s.textUUID~=nil and AnyoneCore.removeTimedWorldText~=nil then\n   AnyoneCore.removeTimedWorldText(s.textUUID)\n  end\n  s.textUUID=nextText\n end\nend\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 314.97,
				name = "[Kaptin] Mortal Slayer Ground Guide Keeper",
				throttleTime = 200,
				timeRange = true,
				timelineIndex = 55,
				timerEndOffset = 12,
				timerStartOffset = -6,
				uuid = "908ba88a-a4c8-d21f-b2c4-5c368b44cfae",
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
				name = "Kaptin M12S P1 draws",
				uuid = "70b61cf6-b3b5-ad33-91dc-41a39718c848",
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
				displayPath = "Kaptin M12S P1 draws",
				eventType = 19,
				execute = "local a=eventArgs\nif a==nil or tonumber(a.entityContentID)~=2015017 or tonumber(a.a2)~=16 or tonumber(a.a3)~=32 then self.used=true return end\nlocal ent=TensorCore.mGetEntity(tonumber(a.entityID))\nif ent==nil or ent.pos==nil then self.used=true return end\nlocal x,z=ent.pos.x,ent.pos.z\nif z<=94 or z>=100 or math.abs(x-100)<=8 then self.used=true return end\n\ndata.kaptinM12S=data.kaptinM12S or {}\nlocal root=data.kaptinM12S\nlocal s=root.slaughtershed or {}\nroot.slaughtershed=s\nif s.arrow~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(s.arrow) end\nif s.dot~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(s.dot) end\ns.arrow=nil\ns.dot=nil\ns.smallEast=x>100\ns.patternAt=Now()\ns.markerAt=nil\ns.localSpread=false\ns.sawStack=false\ns.drawn=false\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 339.143,
				name = "[Kaptin M12S] Slaughtershed Pattern",
				timeRange = true,
				timelineIndex = 59,
				timerEndOffset = 72,
				uuid = "a25dda51-7fa1-02d9-8a20-01e1080b16b9",
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
				displayPath = "Kaptin M12S P1 draws",
				eventType = 4,
				execute = "local a=eventArgs\nlocal marker=a and tonumber(a.markerID) or 0\nif marker~=317 and marker~=375 then self.used=true return end\ndata.kaptinM12S=data.kaptinM12S or {}\nlocal s=data.kaptinM12S.slaughtershed\nif s==nil or s.patternAt==nil or TimeSince(s.patternAt)>=3500 then self.used=true return end\nlocal player=TensorCore.mGetPlayer()\nif player==nil or player.id==nil then self.used=true return end\n\nif s.markerAt==nil or TimeSince(s.markerAt)>2500 then\n if s.arrow~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(s.arrow) end\n if s.dot~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(s.dot) end\n s.arrow=nil\n s.dot=nil\n s.markerAt=Now()\n s.localSpread=false\n s.sawStack=false\n s.drawn=false\nend\nif marker==317 then s.sawStack=true end\nif marker==375 and a.entityID==player.id then s.localSpread=true end\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 339.143,
				name = "[Kaptin M12S] Slaughtershed Assignment",
				timeRange = true,
				timelineIndex = 59,
				timerEndOffset = 72,
				uuid = "a253235c-880a-9c29-b7f4-b992a3618976",
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
				displayPath = "Kaptin M12S P1 draws",
				execute = "data.kaptinM12S=data.kaptinM12S or {}\nlocal s=data.kaptinM12S.slaughtershed\nif s==nil or s.patternAt==nil or s.markerAt==nil or s.sawStack~=true or s.drawn==true then self.used=true return end\nlocal markerAge=TimeSince(s.markerAt)\nif markerAge<350 or markerAge>=2500 or TimeSince(s.patternAt)>=3500 then self.used=true return end\nlocal player=TensorCore.mGetPlayer()\nif player==nil or player.id==nil or player.pos==nil then self.used=true return end\n\nlocal defs={\n {\"MT\",\"Main Tank\",nil,1},\n {\"OT\",\"Off Tank\",nil,2},\n {\"H1\",\"Healer\",\"Topmost Partylist\",3},\n {\"H2\",\"Healer\",\"Bottom-most Partylist\",4},\n {\"M1\",\"Melee DPS\",\"Topmost Partylist\",1},\n {\"M2\",\"Melee DPS\",\"Bottom-most Partylist\",2},\n {\"R1\",\"Ranged DPS\",\"Topmost Partylist\",3},\n {\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\",4},\n}\nlocal role=nil\nfor _,d in ipairs(defs) do\n local ent=TensorCore.getEntityByGroup(d[2],d[3],true)\n if ent~=nil and ent.id==player.id then role={slot=d[1],idx=d[4]} break end\nend\nif role==nil then self.used=true return end\n\nlocal x,z\nif s.localSpread==true then\n local east={{111.7,85.8},{112.7,93.6},{119.1,85.8},{119.0,93.6}}\n local point=east[role.idx]\n if point==nil then self.used=true return end\n x,z=point[1],point[2]\n if s.smallEast==true then x=200-x end\nelse\n x=s.smallEast==true and 118.25 or 81.75\n z=86.30\nend\n\nif s.arrow~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(s.arrow) end\nif s.dot~=nil and Argus~=nil and Argus.deleteTimedShape~=nil then Argus.deleteTimedShape(s.dot) end\nlocal dst={x=x,y=player.pos.y,z=z}\nlocal distance=TensorCore.getDistance2d(player.pos,dst)\nlocal flags=Argus2.RenderFlags.FLAG_WARP_TERRAIN+Argus2.RenderFlags.FLAG_RENDER_OVERLAY\nlocal color=GUI:ColorConvertFloat4ToU32(0.05,1.00,0.15,0.98)\nlocal drawer=TensorCore.getStaticFlatDrawer(color,3,0,flags)\nif distance>0.12 then\n local tip=math.min(0.95,math.max(0.20,distance*0.25))\n local base=math.max(0.10,distance-tip)\n local heading=TensorCore.getHeadingToTarget(player.pos,dst)\n s.arrow=drawer:addTimedArrow(7000,player.pos.x,player.pos.y+0.05,player.pos.z,heading,base,0.34,tip,0.85,0,false,flags)\nend\ns.dot=drawer:addTimedCircle(7000,x,player.pos.y+0.05,z,0.34,0,false,true,flags)\ns.drawn=true\ns.role=role.slot\ns.mode=s.localSpread==true and \"spread\" or \"stack\"\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 339.143,
				name = "[Kaptin M12S] Slaughtershed Roster Guide",
				throttleTime = 100,
				timeRange = true,
				timelineIndex = 59,
				timerEndOffset = 72,
				uuid = "5afcf29d-943b-43d4-a49b-b32bd5423500",
				version = 2,
			},
		},
	},
	inheritedProfiles = 
	{
	},
	timelineName = "r12s1",
	version = "1.5.1",
}



return tbl