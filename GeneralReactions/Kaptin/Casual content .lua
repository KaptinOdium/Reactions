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
						actionLua = "local now=Now()\nlocal at=tonumber(eventArgs.startTime) or now\nif at<=0 or math.abs(now-at)>20000 then at=now end\nlocal duration=tonumber(eventArgs.duration) or 6.2\nlocal finish=at+duration*1000\nlocal life=math.max(250,math.floor(finish-now+250))\nlocal x=tonumber(eventArgs.x)\nlocal y=tonumber(eventArgs.y)\nlocal z=tonumber(eventArgs.z)\nif not x or not y or not z then self.used=true return end\nlocal radius=tonumber(eventArgs.aoeLength) or 36\nlocal heading=TensorCore.convertHeading(tonumber(eventArgs.heading) or 0)\nlocal drawer=TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(1.00,0.05,0.05,0.42))\ndrawer.colorOutline=GUI:ColorConvertFloat4ToU32(1.00,0.18,0.18,0.95)\ndrawer:addTimedCone(life,x,y+0.03,z,radius,math.rad(50),heading,0,false,true)\ndrawer.colorOutline=nil\nself.used=true",
						conditions = 
						{
							
							{
								"dac8eed5-ccf7-9990-946c-2fda53aa83bb",
								true,
							},
						},
						name = "Draw Argus unsafe cones in red",
						uuid = "c8b6fe92-bdbb-63d3-b92b-2ebdf9303c5a",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 37386",
						dequeueIfLuaFalse = true,
						name = "Heavyweight Needles cones (37386)",
						uuid = "dac8eed5-ccf7-9990-946c-2fda53aa83bb",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Tender Valley] Heavyweight Needles Unsafe Cones",
			timeout = 10,
			uuid = "6c945190-67b8-6392-a2dc-43143cee4629",
			version = 2,
		},
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
						actionLua = "local now = Now()\nlocal at = tonumber(eventArgs.startTime) or now\nlocal durationMs = (tonumber(eventArgs.duration) or 7) * 1000\nlocal remainingMs = math.max(100, math.floor(at + durationMs - now))\nlocal safeHeading = TensorCore.convertHeading(eventArgs.heading + math.pi)\nlocal origin = { x = eventArgs.x, y = eventArgs.y + 0.03, z = eventArgs.z }\nlocal drawer = TensorCore.getStaticFlatDrawer(\n    GUI:ColorConvertFloat4ToU32(0.10, 1.00, 0.25, 0.80)\n)\n\ndrawer:addTimedCone(\n    remainingMs,\n    origin.x,\n    origin.y,\n    origin.z,\n    20,\n    math.rad(26),\n    safeHeading,\n    0,\n    false,\n    true\n)\n\nlocal labelPos = TensorCore.getPosInDirection(origin, safeHeading, 10)\nlabelPos.y = labelPos.y + 1.5\nAnyoneCore.addTimedWorldText(\n    remainingMs,\n    \"SAFE\",\n    labelPos,\n    GUI:ColorConvertFloat4ToU32(0.15, 1.00, 0.30, 1.0),\n    true,\n    1.6\n)\n\nself.used = true",
						conditions = 
						{
							
							{
								"b332b018-64c1-3e9b-b428-d98f40076dc2",
								true,
							},
						},
						name = "Draw narrow safe side",
						uuid = "ec30e0e3-fcc3-48d5-a778-e2c92b6163ac",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 39154 or eventArgs.aoeID == 39155",
						dequeueIfLuaFalse = true,
						name = "Prickly Left or Right",
						uuid = "b332b018-64c1-3e9b-b428-d98f40076dc2",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Tender Valley] Prickly Safe Side",
			timeout = 8,
			uuid = "e90d1dd3-5379-fa74-bf7c-697518afc310",
			version = 2,
		},
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
						actionLua = "local state=data.tenderValleyBarrelBreaker\nif not state then state={}; data.tenderValleyBarrelBreaker=state end\nstate.small=state.small or {}\nstate.large=state.large or {}\nstate.armedSmall=state.armedSmall or {}\nstate.armedLarge=state.armedLarge or {}\nstate.drawUUIDs=state.drawUUIDs or {}\nlocal function deleteDraws()\n for _,u in ipairs(state.drawUUIDs or {}) do if u then Argus.deleteTimedShape(u) end end\n state.drawUUIDs={}\n if state.arrow then Argus.deleteTimedShape(state.arrow); state.arrow=nil end\n if state.walkArrow then Argus.deleteTimedShape(state.walkArrow); state.walkArrow=nil end\n state.arrowColorKey=nil\n state.lastArrowUpdate=nil\nend\nlocal function reset()\n deleteDraws()\n state.small={}\n state.large={}\n state.source=nil\n state.guides=nil\n state.expiresAt=nil\n state.arrowExpiresAt=nil\n state.drawnFor=nil\nend\nlocal id=tonumber(eventArgs.aoeID)\nlocal now=Now()\nif state.lastSeenAt and now-state.lastSeenAt>9000 then reset() end\nstate.lastSeenAt=now\nlocal at=tonumber(eventArgs.startTime) or now\nif at<=0 or math.abs(now-at)>20000 then at=now end\nlocal duration=tonumber(eventArgs.duration) or (id==37390 and 6 or 5)\nlocal finish=at+duration*1000\nlocal ex=tonumber(eventArgs.x)\nlocal ey=tonumber(eventArgs.y)\nlocal ez=tonumber(eventArgs.z)\nif not ex or not ey or not ez then self.used=true return end\nif id==37390 then\n local earlySmall={}\n local earlyLarge={}\n if state.armedAt and now-state.armedAt<=8000 and #state.armedSmall>=2 and #state.armedLarge>=6 then\n  for _,p in ipairs(state.armedSmall) do earlySmall[#earlySmall+1]={id=p.id,x=p.x,y=p.y,z=p.z,radius=p.radius} end\n  for _,p in ipairs(state.armedLarge) do earlyLarge[#earlyLarge+1]={id=p.id,x=p.x,y=p.y,z=p.z,radius=p.radius} end\n end\n reset()\n state.small=earlySmall\n state.large=earlyLarge\n state.lastSeenAt=now\n state.source={x=ex,y=ey+0.03,z=ez,at=at,endAt=finish}\n state.arrowExpiresAt=finish+350\nelse\n if not state.source or now>(state.source.endAt or 0)+1500 then\n  reset()\n  state.lastSeenAt=now\n  self.used=true\n  return\n end\n local list=id==37388 and state.small or state.large\n local found=false\n for _,p in ipairs(list) do\n  local dx=p.x-ex\n  local dz=p.z-ez\n  if dx*dx+dz*dz<0.25 then\n   p.endAt=math.max(p.endAt or finish,finish)\n   p.radius=tonumber(eventArgs.aoeLength) or p.radius\n   found=true\n   break\n  end\n end\n if not found then list[#list+1]={x=ex,y=ey+0.03,z=ez,radius=tonumber(eventArgs.aoeLength) or (id==37388 and 6 or 11),endAt=finish} end\nend\nif not state.source or #state.small<2 or #state.large<6 or state.drawnFor==state.source.at then self.used=true return end\nlocal resolve=state.source.endAt or now+5000\nfor _,p in ipairs(state.small) do resolve=math.max(resolve,p.endAt or resolve) end\nfor _,p in ipairs(state.large) do resolve=math.max(resolve,p.endAt or resolve) end\nstate.expiresAt=resolve+650\ndeleteDraws()\nlocal hazards={}\nfor _,p in ipairs(state.small) do hazards[#hazards+1]=p end\nfor _,p in ipairs(state.large) do hazards[#hazards+1]=p end\nlocal candidates={}\nlocal half=20.0\nlocal landingRadius=22.0\nfor deg=0,358,2 do\n local a=math.rad(deg)\n local ux=math.sin(a)\n local uz=-math.cos(a)\n local x=state.source.x+ux*landingRadius\n local z=state.source.z+uz*landingRadius\n local clearance=math.min(half-math.abs(x-state.source.x),half-math.abs(z-state.source.z))\n for _,h in ipairs(hazards) do\n  local hx=x-h.x\n  local hz=z-h.z\n  clearance=math.min(clearance,math.sqrt(hx*hx+hz*hz)-h.radius)\n end\n local nearSmall=false\n for _,s in ipairs(state.small) do\n  local sx=x-s.x\n  local sz=z-s.z\n  if sx*sx+sz*sz<=144 then nearSmall=true break end\n end\n if nearSmall then candidates[#candidates+1]={x=x,y=state.source.y,z=z,ux=ux,uz=uz,clearance=clearance} end\nend\ntable.sort(candidates,function(a,b) return a.clearance>b.clearance end)\nlocal guides={}\nfor _,c in ipairs(candidates) do\n if c.clearance>0.65 then\n  local separated=true\n  for _,g in ipairs(guides) do if c.ux*g.safe.ux+c.uz*g.safe.uz>0 then separated=false break end end\n  if separated then\n   guides[#guides+1]={safe=c,pre={x=state.source.x+c.ux*2.0,y=state.source.y,z=state.source.z+c.uz*2.0},clearance=c.clearance}\n   if #guides>=2 then break end\n  end\n end\nend\nstate.guides=guides\nstate.drawnFor=state.source.at\nif #guides==0 then self.used=true return end\nlocal life=math.max(500,math.floor(state.expiresAt-now))\nlocal safeDrawer=TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(0.10,1.00,0.18,0.90))\nlocal preDrawer=TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(0.30,1.00,0.55,0.94))\nfor _,g in ipairs(guides) do\n local u=safeDrawer:addTimedCircle(life,g.safe.x,g.safe.y,g.safe.z,1.8,0,false,true)\n if u then state.drawUUIDs[#state.drawUUIDs+1]=u end\n local p=preDrawer:addTimedCircle(life,g.pre.x,g.pre.y,g.pre.z,1.0,0,false,true)\n if p then state.drawUUIDs[#state.drawUUIDs+1]=p end\nend\nself.used=true",
						conditions = 
						{
							
							{
								"0f92d8d8-0f6c-7c3b-815f-be94f53cd665",
								true,
							},
						},
						name = "Build early 20y KB safe spots",
						uuid = "60ff6afe-65f3-107d-b146-5a590d2e8fc0",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 37388 or eventArgs.aoeID == 37389 or eventArgs.aoeID == 37390",
						dequeueIfLuaFalse = true,
						name = "Barrel or cactus tell",
						uuid = "0f92d8d8-0f6c-7c3b-815f-be94f53cd665",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Tender Valley] Barrel Breaker KB Safe + Player Arrow",
			timeout = 10,
			uuid = "27ecbd79-ddbf-6a87-a234-27a306fcb773",
			version = 2,
		},
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
						actionLua = "local state=data.tenderValleyLabyrinth or {}\ndata.tenderValleyLabyrinth=state\nlocal function clearDraws()\n for _,u in ipairs(state.drawUUIDs or {}) do if u then Argus.deleteTimedShape(u) end end\n for _,u in ipairs(state.textUUIDs or {}) do if u then AnyoneCore.removeTimedWorldText(u) end end\n state.drawUUIDs={}\n state.textUUIDs={}\nend\nlocal a1=tonumber(eventArgs.a1) or 0\nlocal a2=tonumber(eventArgs.a2) or 0\nlocal a3=tonumber(eventArgs.a3) or 0\nif state.solved and a1==2 and a2==4 and a3==4 then\n clearDraws()\n state.armedUntil=nil\n state.solved=false\n state.patternKey=nil\n self.used=true\n return\nend\nlocal key=a3*65536+a2\nlocal patterns={\n [16777344]={entry={x=6,z=2},goal={x=-10,z=-10}},\n [67109376]={entry={x=2,z=-6},goal={x=10,z=10}},\n [268437504]={entry={x=-2,z=6},goal={x=10,z=-10}},\n [131073]={entry={x=-6,z=-2},goal={x=-10,z=10}},\n}\nlocal pattern=patterns[key]\nif not pattern then self.used=true return end\nclearDraws()\nlocal center=state.center or {x=-130,y=-170,z=-554}\nlocal y=(center.y or -170)+0.03\nlocal entryPos={x=center.x+pattern.entry.x,y=y,z=center.z+pattern.entry.z}\nlocal goalPos={x=center.x+pattern.goal.x,y=y,z=center.z+pattern.goal.z}\nlocal life=15500\nlocal entryColor=GUI:ColorConvertFloat4ToU32(0.10,1.00,0.25,0.88)\nlocal goalColor=GUI:ColorConvertFloat4ToU32(0.10,0.82,1.00,0.88)\nlocal entry=TensorCore.getStaticFlatDrawer(entryColor)\nlocal goal=TensorCore.getStaticFlatDrawer(goalColor)\nlocal u=entry:addTimedCenteredRect(life,entryPos.x,y,entryPos.z,4,4,0,0,false,true)\nif u then state.drawUUIDs[#state.drawUUIDs+1]=u end\nu=goal:addTimedCenteredRect(life,goalPos.x,y,goalPos.z,4,4,0,0,false,true)\nif u then state.drawUUIDs[#state.drawUUIDs+1]=u end\nlocal heading=TensorCore.getHeadingToTarget(center,entryPos)\nu=entry:addTimedArrow(life,center.x,y,center.z,heading,4.5,0.55,1.5,1.35,0,false)\nif u then state.drawUUIDs[#state.drawUUIDs+1]=u end\nu=AnyoneCore.addTimedWorldText(life,\"START\",entryPos,entryColor,true,1.6)\nif u then state.textUUIDs[#state.textUUIDs+1]=u end\nu=AnyoneCore.addTimedWorldText(life,\"O SAFE\",goalPos,goalColor,true,1.6)\nif u then state.textUUIDs[#state.textUUIDs+1]=u end\nstate.solved=true\nstate.patternKey=key\nself.used=true",
						conditions = 
						{
							
							{
								"77b92825-bd38-bc10-b5ec-7b18125ad29a",
								true,
							},
						},
						name = "Draw Labyrinth start and O cubes",
						uuid = "7339e681-22a2-f53a-9f28-718534551910",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local state=data.tenderValleyLabyrinth\nif not state or type(state.armedUntil)~=\"number\" or Now()>state.armedUntil then return false end\nlocal a1=tonumber(eventArgs.a1) or 0\nlocal a2=tonumber(eventArgs.a2) or 0\nlocal a3=tonumber(eventArgs.a3) or 0\nif state.solved then\n return a1==2 and a2==4 and a3==4\nend\nif a1~=1 then return false end\nlocal key=a3*65536+a2\nreturn key==16777344 or key==67109376 or key==268437504 or key==131073",
						dequeueIfLuaFalse = true,
						name = "Packed Labyrinth pattern or cleanup while armed",
						uuid = "77b92825-bd38-bc10-b5ec-7b18125ad29a",
						version = 3,
					},
				},
			},
			eventType = 14,
			name = "[Tender Valley] Greatest Labyrinth Safe Cubes",
			timeout = 18,
			uuid = "d66b87c0-286e-67b3-8200-704fd6472b1a",
			version = 2,
		},
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
						actionLua = "local player=TensorCore.mGetPlayer()\nif not player or not player.pos then self.used=true return end\nlocal state=data.pilgrim99 or {} data.pilgrim99=state\nfor _,uuid in ipairs(state.drainDraws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end\nstate.drainDraws={}\nlocal id=eventArgs.spellID\nlocal light=id==44088 or id==44089\nlocal first=id==44088 or id==44091\nlocal points\nlocal call\nif light then\n points={{x=-604.414,z=-287.327},{x=-587.827,z=-309.586},{x=-581.436,z=-292.284},{x=-596.630,z=-303.435},{x=-610.436,z=-303.370}}\n call=first and \"Light first, then dark\" or \"Switch to Light\"\nelse\n points={{x=-612.173,z=-290.414},{x=-595.586,z=-312.673},{x=-618.564,z=-307.716},{x=-589.564,z=-296.630},{x=-603.370,z=-296.564}}\n call=first and \"Dark first, then light\" or \"Switch to Dark\"\nend\nlocal best,bestD\nfor _,p in ipairs(points) do local dx=p.x-player.pos.x local dz=p.z-player.pos.z local d=dx*dx+dz*dz if not bestD or d<bestD then bestD=d best=p end end\nlocal lifetime=math.max(1500,math.floor(((tonumber(eventArgs.channelTimeMax) or (first and 7 or 12))+0.5)*1000))\nlocal green=GUI:ColorConvertFloat4ToU32(0.10,1.0,0.20,0.90)\nlocal drawer=TensorCore.getStaticFlatDrawer(green)\nlocal dot=drawer:addTimedCircle(lifetime,best.x,player.pos.y+0.03,best.z,1.4,0,false,true)\nif dot then table.insert(state.drainDraws,dot) end\nlocal distance=math.sqrt(bestD)\nif distance>2.5 then local heading=TensorCore.getHeadingToTarget(player.pos,{x=best.x,y=player.pos.y,z=best.z}) local arrow=drawer:addTimedArrow(lifetime,player.pos.x,player.pos.y+0.03,player.pos.z,heading,math.max(1,distance-2.5),0.38,2.5,1.1,0,false) if arrow then table.insert(state.drainDraws,arrow) end end\nTensorCore.addAlertText(3500,call,1.4,2,true,90)\nstate.drainWant=light and 4560 or 4559\nself.used=true",
						conditions = 
						{
							
							{
								"b2e8316c-84a9-0c12-bd9a-76ebb8854be7",
								true,
							},
							
							{
								"61b10af3-2f87-179d-a183-d9f080f345ce",
								true,
							},
						},
						name = "Call and mark required vengeance color",
						uuid = "239c1997-be23-3828-bb20-c3c3e6c9f27b",
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
							1290,
							1333,
						},
						name = "Pilgrim 99 / Final Verse",
						uuid = "b2e8316c-84a9-0c12-bd9a-76ebb8854be7",
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
						name = "Drain Aether sequence",
						spellIDList = 
						{
							44088,
							44089,
							44091,
							44093,
						},
						uuid = "61b10af3-2f87-179d-a183-d9f080f345ce",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Pilgrim 99] Drain Aether Color Guidance",
			uuid = "a449fd02-6725-1eef-8ea6-223e3725afd8",
			version = 2,
		},
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
						actionLua = "local id=eventArgs.spellID\nlocal player=TensorCore.mGetPlayer()\nlocal bait=id==44061 or id==44068\nlocal call=bait and \"Keep moving, bait puddles\" or \"Stop moving\"\nTensorCore.addAlertText(3800,call,1.45,bait and 2 or 3,true,95)\nif bait and player then local state=data.pilgrim99 or {} data.pilgrim99=state if state.baitDraw then Argus.deleteTimedShape(state.baitDraw) end local lifetime=math.max(1000,math.floor(((tonumber(eventArgs.channelTimeMax) or 6)+0.3)*1000)) state.baitDraw=TensorCore.getMoogleDrawer():addTimedCircleOnEnt(lifetime,player.id,6,0,false,true) end\nself.used=true",
						conditions = 
						{
							
							{
								"0c107925-ebc3-5d7f-8126-a93fd0821887",
								true,
							},
							
							{
								"d1a82154-f9d4-4d32-a6db-261937a3737e",
								true,
							},
						},
						name = "Call movement rule",
						uuid = "d4868234-708e-039a-88dd-727dd6d5b25d",
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
							1290,
							1333,
						},
						name = "Pilgrim 99 / Final Verse",
						uuid = "0c107925-ebc3-5d7f-8126-a93fd0821887",
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
						name = "Ball of Fire or Chains",
						spellIDList = 
						{
							44061,
							44068,
							44063,
							44069,
						},
						uuid = "d1a82154-f9d4-4d32-a6db-261937a3737e",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Pilgrim 99] Puddle Bait / Stand Still TTS",
			uuid = "6d0f09f7-770b-294a-93dd-22ebeeb48f9d",
			version = 2,
		},
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
						actionLua = "local player=TensorCore.mGetPlayer()\nif not player or not player.pos then self.used=true return end\nlocal state=data.pilgrim99 or {} data.pilgrim99=state\nlocal now=Now()\nlocal bounds=state.bounds\nif not bounds or type(bounds.startedAt)~=\"number\" or now-bounds.startedAt>25000 or #(bounds.casts or {})>=12 then\n if bounds then for _,uuid in ipairs(bounds.draws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end end\n bounds={casts={},draws={},startedAt=now,keys={}}\n state.bounds=bounds\nend\nbounds.casts=bounds.casts or {}\nbounds.draws=bounds.draws or {}\nbounds.keys=bounds.keys or {}\nlocal startAt=tonumber(eventArgs.startTime) or now\nif startAt<=0 or math.abs(now-startAt)>20000 then startAt=now end\nlocal activation=startAt+((tonumber(eventArgs.duration) or 3)*1000)\nlocal x=tonumber(eventArgs.x) or 0\nlocal z=tonumber(eventArgs.z) or 0\nlocal key=math.floor(x*100+0.5)..\":\"..math.floor(z*100+0.5)..\":\"..math.floor(activation/10)\nif not bounds.keys[key] then\n bounds.keys[key]=true\n table.insert(bounds.casts,{x=x,y=tonumber(eventArgs.y) or player.pos.y,z=z,activation=activation})\nend\nif #bounds.casts>=12 then\n table.sort(bounds.casts,function(a,b) return a.activation<b.activation end)\n local a=bounds.casts[#bounds.casts-1]\n local b=bounds.casts[#bounds.casts]\n local ax=a.x+600 local az=a.z+300 local ad=math.sqrt(ax*ax+az*az)\n local bx=b.x+600 local bz=b.z+300 local bd=math.sqrt(bx*bx+bz*bz)\n if ad>0.1 and bd>0.1 then\n  local dx=ax/ad+bx/bd\n  local dz=az/ad+bz/bd\n  local d=math.sqrt(dx*dx+dz*dz)\n  if d<=0.1 then dx=bx/bd dz=bz/bd d=1 end\n  local target={x=-600+dx/d*11,y=b.y,z=-300+dz/d*11}\n  for _,uuid in ipairs(bounds.draws) do if uuid then Argus.deleteTimedShape(uuid) end end\n  bounds.draws={}\n  local lifetime=math.max(1200,math.floor(math.max(a.activation,b.activation)+3000-now))\n  local green=GUI:ColorConvertFloat4ToU32(0.10,1.0,0.20,0.90)\n  local drawer=TensorCore.getStaticFlatDrawer(green)\n  local dot=drawer:addTimedCircle(lifetime,target.x,target.y+0.03,target.z,1.35,0,false,true)\n  if dot then table.insert(bounds.draws,dot) end\n  local dist=TensorCore.getDistance2d(player.pos,target)\n  if dist and dist>2.5 then\n   local h=TensorCore.getHeadingToTarget(player.pos,target)\n   local arrow=drawer:addTimedArrow(lifetime,player.pos.x,player.pos.y+0.03,player.pos.z,h,math.max(1,dist-2.5),0.38,2.5,1.1,0,false)\n   if arrow then table.insert(bounds.draws,arrow) end\n  end\n  if not bounds.called then TensorCore.addAlertText(2600,\"Exit between final blasts\",1.25,1,true,90) bounds.called=true end\n end\nend\nself.used=true",
						conditions = 
						{
							
							{
								"ebeb98c0-3c23-86af-bc04-04318cf682a8",
								true,
							},
							
							{
								"c8ab34fb-522a-2bc1-a527-43cfeb95628b",
								true,
							},
						},
						name = "Mark gap between final Bounds blasts",
						uuid = "b67e9529-2d9a-0f31-bb35-e9de58f9060e",
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
							1290,
							1333,
						},
						name = "Pilgrim 99 / Final Verse",
						uuid = "ebeb98c0-3c23-86af-bc04-04318cf682a8",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.aoeID == 44083",
						dequeueIfLuaFalse = true,
						name = "Bounds rotating circle",
						uuid = "c8ab34fb-522a-2bc1-a527-43cfeb95628b",
						version = 3,
					},
				},
			},
			eventType = 18,
			name = "[Pilgrim 99] Bounds of Sin Exit Spot",
			uuid = "896ecf4e-9dda-dae7-9005-9f2057a9f888",
			version = 2,
		},
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
						actionLua = "local state=data.pilgrim99 or {} data.pilgrim99=state state.spinelashTarget=eventArgs.entityID state.spinelashAt=Now() self.used=true",
						conditions = 
						{
							
							{
								"e33a3390-fd5d-a7cc-91c6-e5679d3d81cf",
								true,
							},
							
							{
								"cca07f26-88e0-4617-9b5e-bf45fa7b856a",
								true,
							},
						},
						name = "Store Spinelash marked player",
						uuid = "505edd5f-27f2-ca11-90f3-a0d87bf9f0eb",
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
							1290,
							1333,
						},
						name = "Pilgrim 99 / Final Verse",
						uuid = "e33a3390-fd5d-a7cc-91c6-e5679d3d81cf",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.markerID == 234",
						dequeueIfLuaFalse = true,
						name = "Spinelash target icon",
						uuid = "cca07f26-88e0-4617-9b5e-bf45fa7b856a",
						version = 3,
					},
				},
			},
			eventType = 4,
			name = "[Pilgrim 99] Spinelash Marker Capture",
			uuid = "e13bed3c-692a-2356-ae23-3820939d09ee",
			version = 2,
		},
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
						actionLua = "local state=data.pilgrim99\nlocal boss=TensorCore.mGetEntity(eventArgs.entityID)\nlocal target=state and TensorCore.mGetEntity(state.spinelashTarget)\nif not state or not boss or not boss.pos or not target or not target.pos then self.used=true return end\nfor _,uuid in ipairs(state.spinelashDraws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end state.spinelashDraws={}\nlocal lifetime=math.max(1000,math.floor(((tonumber(eventArgs.channelTimeMax) or 2)+2.2)*1000))\nlocal h=TensorCore.getHeadingToTarget(boss.pos,target.pos)\nlocal danger=TensorCore.getMoogleDrawer()\nlocal rect=danger:addTimedRect(lifetime,boss.pos.x,boss.pos.y,boss.pos.z,60,4,h,0,false,true)\nif rect then table.insert(state.spinelashDraws,rect) end\nlocal player=TensorCore.mGetPlayer()\nif player and player.id==target.id then\n local laneX=math.abs(player.pos.x+593)<=math.abs(player.pos.x+607) and -593 or -607\n local laneZ=math.max(-313.5,math.min(-286.5,player.pos.z))\n local green=GUI:ColorConvertFloat4ToU32(0.10,1.0,0.20,0.92) local safe=TensorCore.getStaticFlatDrawer(green)\n local dot=safe:addTimedCircle(lifetime,laneX,player.pos.y+0.03,laneZ,1.25,0,false,true) if dot then table.insert(state.spinelashDraws,dot) end\n local line=safe:addTimedLine(lifetime,laneX,player.pos.y+0.03,-313.5,laneX,player.pos.y+0.03,-286.5,0.35,0.7,0) if line then table.insert(state.spinelashDraws,line) end\n TensorCore.addAlertText(3300,\"Bait laser on gold line\",1.35,2,true,90)\nend\nself.used=true",
						conditions = 
						{
							
							{
								"1858e218-bee8-fae8-a1d3-4b032dee6a60",
								true,
							},
							
							{
								"9eb8596e-00e5-179a-ab53-15c1d92b13b5",
								true,
							},
							
							{
								"b0622157-2810-b3f4-a961-db6dc7431e8e",
								true,
							},
						},
						name = "Draw Spinelash bait lane and cleave",
						uuid = "bd22ea40-0d85-f384-a55c-3f9aed4aa3af",
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
							1290,
							1333,
						},
						name = "Pilgrim 99 / Final Verse",
						uuid = "1858e218-bee8-fae8-a1d3-4b032dee6a60",
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
						name = "Spinelash",
						spellIDList = 
						{
							44085,
							44086,
						},
						uuid = "9eb8596e-00e5-179a-ab53-15c1d92b13b5",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local s=data.pilgrim99\nreturn s and s.spinelashTarget and Now()-(s.spinelashAt or 0)<8000",
						name = "Spinelash target known",
						uuid = "b0622157-2810-b3f4-a961-db6dc7431e8e",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Pilgrim 99] Spinelash Safe Gold Line & Cleave",
			uuid = "579d2330-1fb7-a4a8-a37e-fc7a737a8fda",
			version = 2,
		},
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
						actionLua = "local state=data.pilgrim99 or {} data.pilgrim99=state local now=Now()\nif not state.blaze or #(state.blaze.crystals or {})>=8 or now-(state.blaze.startedAt or 0)>25000 then if state.blaze then for _,uuid in ipairs(state.blaze.draws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end end state.blaze={crystals={},draws={},startedAt=now} end\nlocal id=eventArgs.spellID state.blaze.dir=(id==44074 or id==44076) and \"h\" or \"v\" state.blaze.modeAt=now self.used=true",
						conditions = 
						{
							
							{
								"9d92cc1d-2e8c-c99f-a0c5-ee54ac40d162",
								true,
							},
							
							{
								"9b387185-6ccb-bf47-aae3-9c77a930f6a5",
								true,
							},
						},
						name = "Capture crystal travel direction",
						uuid = "7ecd2787-cd42-245f-9524-e26155cc0d0c",
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
							1290,
							1333,
						},
						name = "Pilgrim 99 / Final Verse",
						uuid = "9d92cc1d-2e8c-c99f-a0c5-ee54ac40d162",
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
						name = "Abyssal Blaze orientation",
						spellIDList = 
						{
							44074,
							44075,
						},
						uuid = "9b387185-6ccb-bf47-aae3-9c77a930f6a5",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Pilgrim 99] Abyssal Blaze Direction Capture",
			uuid = "51e332dd-f037-e595-9ab8-5aad9857c765",
			version = 2,
		},
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
						actionLua = "local state=data.pilgrim99 or {} data.pilgrim99=state local now=Now()\nif not state.blaze or #(state.blaze.crystals or {})>=8 or now-(state.blaze.startedAt or 0)>25000 then if state.blaze then for _,uuid in ipairs(state.blaze.draws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end end state.blaze={crystals={},draws={},startedAt=now} end\nlocal id=eventArgs.spellID state.blaze.dir=(id==44074 or id==44076) and \"h\" or \"v\" state.blaze.modeAt=now self.used=true",
						conditions = 
						{
							
							{
								"37d45233-3887-14f8-bea1-4c8ff3329789",
								true,
							},
							
							{
								"edbbb531-a680-4736-a969-dfb7f80fdf6f",
								true,
							},
						},
						name = "Update crystal travel direction",
						uuid = "db9a2e26-d12e-c89b-8503-18571d8309ce",
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
							1290,
							1333,
						},
						name = "Pilgrim 99 / Final Verse",
						uuid = "37d45233-3887-14f8-bea1-4c8ff3329789",
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
						name = "Abyssal Blaze instant orientation",
						spellIDList = 
						{
							44076,
							44077,
						},
						uuid = "edbbb531-a680-4736-a969-dfb7f80fdf6f",
						version = 3,
					},
				},
			},
			eventType = 2,
			name = "[Pilgrim 99] Abyssal Blaze Direction Switch",
			uuid = "8574c7f9-8061-62e7-a7c4-72b738fe2bd6",
			version = 2,
		},
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
						actionLua = "local state=data.pilgrim99 local blaze=state and state.blaze local ent=TensorCore.mGetEntity(eventArgs.entityID)\nif not blaze or not blaze.dir or not ent or not ent.pos then self.used=true return end\nblaze.crystals=blaze.crystals or {} table.insert(blaze.crystals,{x=ent.pos.x,z=ent.pos.z,dir=blaze.dir})\nif #blaze.crystals>=8 then\n for _,uuid in ipairs(blaze.draws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end blaze.draws={}\n local candidates={{x=-605.75,z=-313,name=\"Northwest\"},{x=-594.25,z=-313,name=\"Northeast\"},{x=-594.25,z=-287,name=\"Southeast\"},{x=-605.75,z=-287,name=\"Southwest\"}}\n local safePoints={}\n for _,p in ipairs(candidates) do local unsafe=false for _,c in ipairs(blaze.crystals) do if (c.dir==\"h\" and math.abs(p.z-c.z)<=5) or (c.dir==\"v\" and math.abs(p.x-c.x)<=5) then unsafe=true break end end if not unsafe then table.insert(safePoints,p) end end\n if #safePoints>0 then\n  local player=TensorCore.mGetPlayer() local best=safePoints[1]\n  if player then local bestD for _,p in ipairs(safePoints) do local dx=p.x-player.pos.x local dz=p.z-player.pos.z local d=dx*dx+dz*dz if not bestD or d<bestD then bestD=d best=p end end end\n  local y=player and player.pos.y or ent.pos.y local green=GUI:ColorConvertFloat4ToU32(0.10,1.0,0.20,0.92) local drawer=TensorCore.getStaticFlatDrawer(green)\n  local dot=drawer:addTimedCircle(18000,best.x,y+0.03,best.z,1.5,0,false,true) if dot then table.insert(blaze.draws,dot) end\n  if player then local dist=TensorCore.getDistance2d(player.pos,{x=best.x,y=y,z=best.z}) if dist and dist>2.5 then local h=TensorCore.getHeadingToTarget(player.pos,{x=best.x,y=y,z=best.z}) local a=drawer:addTimedArrow(18000,player.pos.x,player.pos.y+0.03,player.pos.z,h,math.max(1,dist-2.5),0.38,2.5,1.1,0,false) if a then table.insert(blaze.draws,a) end end end\n  TensorCore.addAlertText(3000,best.name..\" safe\",1.3,1,true,90)\n end\nend\nself.used=true",
						conditions = 
						{
							
							{
								"ed7b5fec-9c45-4036-ac1d-781f0a11c697",
								true,
							},
							
							{
								"3158ed39-c4a5-a30a-9b44-c65beef1837a",
								true,
							},
						},
						name = "Solve crystal safe corner",
						uuid = "18d304a6-1e0d-e304-b4ea-4b2f9eab443b",
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
							1290,
							1333,
						},
						name = "Pilgrim 99 / Final Verse",
						uuid = "ed7b5fec-9c45-4036-ac1d-781f0a11c697",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.entityContentID == 2014832",
						dequeueIfLuaFalse = true,
						name = "Abyssal crystal event object",
						uuid = "3158ed39-c4a5-a30a-9b44-c65beef1837a",
						version = 3,
					},
				},
			},
			eventType = 5,
			name = "[Pilgrim 99] Abyssal Blaze Safe Corner",
			uuid = "0573eefc-77aa-aaf8-abc1-39f189911cfd",
			version = 2,
		},
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
						actionLua = "local state=data.pilgrim99\nif state then for _,uuid in ipairs(state.drainDraws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end if state.baitDraw then Argus.deleteTimedShape(state.baitDraw) end for _,uuid in ipairs((state.bounds and state.bounds.draws) or {}) do if uuid then Argus.deleteTimedShape(uuid) end end for _,uuid in ipairs(state.spinelashDraws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end for _,uuid in ipairs((state.blaze and state.blaze.draws) or {}) do if uuid then Argus.deleteTimedShape(uuid) end end end data.pilgrim99=nil self.used=true",
						name = "Remove all Pilgrim guidance",
						uuid = "e9f7186e-4dda-e2b6-a675-be417b72217f",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
			},
			eventType = 11,
			name = "[Pilgrim 99] Map Cleanup",
			uuid = "18c97503-c45b-1417-9d4b-c03a56e559be",
			version = 2,
		},
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
						actionLua = "local state=(eventArgs.oldData or {}).pilgrim99\nif state then for _,uuid in ipairs(state.drainDraws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end if state.baitDraw then Argus.deleteTimedShape(state.baitDraw) end for _,uuid in ipairs((state.bounds and state.bounds.draws) or {}) do if uuid then Argus.deleteTimedShape(uuid) end end for _,uuid in ipairs(state.spinelashDraws or {}) do if uuid then Argus.deleteTimedShape(uuid) end end for _,uuid in ipairs((state.blaze and state.blaze.draws) or {}) do if uuid then Argus.deleteTimedShape(uuid) end end end self.used=true",
						name = "Remove all Pilgrim guidance from old state",
						uuid = "8ed95a2f-447c-78c9-81d4-07ae3246e03f",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
			},
			eventType = 9,
			name = "[Pilgrim 99] Wipe Cleanup",
			uuid = "cd7d49be-c2ab-3a69-a2d6-8eee4e6f3259",
			version = 2,
		},
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
						actionLua = "local state=data.tenderValleyLabyrinth or {}\nfor _,u in ipairs(state.drawUUIDs or {}) do if u then Argus.deleteTimedShape(u) end end\nfor _,u in ipairs(state.textUUIDs or {}) do if u then AnyoneCore.removeTimedWorldText(u) end end\nstate.drawUUIDs={}\nstate.textUUIDs={}\nstate.solved=false\nstate.patternKey=nil\nlocal ent=TensorCore.mGetEntity(eventArgs.entityID)\nif ent and ent.pos then\n state.center={x=ent.pos.x,y=ent.pos.y,z=ent.pos.z}\nelse\n state.center={x=-130,y=-170,z=-554}\nend\nstate.armedUntil=Now()+20000\ndata.tenderValleyLabyrinth=state\nself.used=true",
						conditions = 
						{
							
							{
								"35640b00-ab05-1c9e-af37-b7fd49716336",
								true,
							},
						},
						name = "Arm labyrinth pattern capture",
						uuid = "20a19bf2-12d5-6ea1-abcb-2bd8cb5453ab",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs.spellID == 36745",
						dequeueIfLuaFalse = true,
						name = "Greatest Labyrinth cast",
						uuid = "35640b00-ab05-1c9e-af37-b7fd49716336",
						version = 3,
					},
				},
			},
			eventType = 3,
			name = "[Tender Valley] Greatest Labyrinth Arm + Reset",
			uuid = "bdc7bf1f-8519-afc8-ae5a-b4b8a5e24ebd",
			version = 2,
		},
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
						actionLua = "local state=data.tenderValleyBarrelBreaker\nlocal now=Now()\nlocal function clearArrows()\n if not state then return end\n if state.arrow then Argus.deleteTimedShape(state.arrow); state.arrow=nil end\n if state.walkArrow then Argus.deleteTimedShape(state.walkArrow); state.walkArrow=nil end\n state.arrowColorKey=nil\nend\nif not state or not state.source or not state.guides or #state.guides==0 or not state.arrowExpiresAt or now>state.arrowExpiresAt then\n clearArrows()\n self.used=true\n return\nend\nif state.lastArrowUpdate and now-state.lastArrowUpdate<50 then self.used=true return end\nstate.lastArrowUpdate=now\nlocal player=TensorCore.mGetPlayer()\nif not player or not player.pos then self.used=true return end\nlocal nearest=nil\nlocal nearestD2=math.huge\nfor _,g in ipairs(state.guides) do\n local gx=g.pre.x-player.pos.x\n local gz=g.pre.z-player.pos.z\n local gd2=gx*gx+gz*gz\n if gd2<nearestD2 then nearestD2=gd2; nearest=g end\nend\nif not nearest then clearArrows(); self.used=true return end\nlocal life=math.max(150,math.floor(state.arrowExpiresAt-now))\nlocal walkDistance=math.sqrt(nearestD2)\nif walkDistance>1.5 then\n local total=math.min(11.0,walkDistance)\n local tip=math.min(1.7,total*0.35)\n local base=math.max(0.6,total-tip)\n local walkDrawer=TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.00,0.82,0.10,0.94))\n walkDrawer.colorOutline=4294967295\n local walkHeading=TensorCore.getHeadingToTarget(player.pos,nearest.pre)\n local walkOK=false\n if state.walkArrow then walkOK=walkDrawer:updateTimedArrowOnEnt(state.walkArrow,life,player,base,0.22,tip,0.70,nil,0,false,walkHeading,true) end\n if not walkOK then state.walkArrow=walkDrawer:addTimedArrowOnEnt(life,player,base,0.22,tip,0.70,nil,0,false,walkHeading,true) end\n walkDrawer.colorOutline=nil\nelseif state.walkArrow then\n Argus.deleteTimedShape(state.walkArrow)\n state.walkArrow=nil\nend\nlocal px=player.pos.x\nlocal pz=player.pos.z\nlocal dx=px-state.source.x\nlocal dz=pz-state.source.z\nlocal d=math.sqrt(dx*dx+dz*dz)\nlocal ux,uz\nif d>0.05 then\n ux=dx/d\n uz=dz/d\nelse\n ux=nearest.safe.ux\n uz=nearest.safe.uz\nend\nlocal landing={x=px+ux*20.0,y=player.pos.y,z=pz+uz*20.0}\nlocal valid=false\nfor _,g in ipairs(state.guides) do\n local sx=landing.x-g.safe.x\n local sz=landing.z-g.safe.z\n if sx*sx+sz*sz<=9 then valid=true break end\nend\nlocal colorKey=valid and 1 or 0\nif state.arrow and state.arrowColorKey~=colorKey then\n Argus.deleteTimedShape(state.arrow)\n state.arrow=nil\nend\nstate.arrowColorKey=colorKey\nlocal color=valid and GUI:ColorConvertFloat4ToU32(0.10,1.00,0.18,0.90) or GUI:ColorConvertFloat4ToU32(0.10,0.85,1.00,0.90)\nlocal kbDrawer=TensorCore.getStaticDrawer(color)\nkbDrawer.colorOutline=4294967295\nlocal kbHeading=TensorCore.getHeadingToTarget(player.pos,landing)\nlocal kbOK=false\nif state.arrow then kbOK=kbDrawer:updateTimedArrowOnEnt(state.arrow,life,player,17.8,0.36,2.2,1.00,nil,0,false,kbHeading,true) end\nif not kbOK then state.arrow=kbDrawer:addTimedArrowOnEnt(life,player,17.8,0.36,2.2,1.00,nil,0,false,kbHeading,true) end\nkbDrawer.colorOutline=nil\nself.used=true",
						conditions = 
						{
							
							{
								"3a36f625-033b-8974-8e7a-8c9ea123ce21",
								true,
							},
						},
						name = "Draw walk cue and full 20y KB projection",
						uuid = "baac14f1-0fb8-a06f-8a08-f70ce087e2e7",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local state=data.tenderValleyBarrelBreaker\nreturn not not (state and state.source and state.guides and #state.guides>0 and state.arrowExpiresAt and Now()<=state.arrowExpiresAt)",
						dequeueIfLuaFalse = true,
						name = "Active Barrel Breaker arrows",
						uuid = "3a36f625-033b-8974-8e7a-8c9ea123ce21",
						version = 3,
					},
				},
			},
			name = "[Tender Valley] Barrel Breaker Walk + 20y KB Arrows",
			throttleTime = 50,
			timeout = 1,
			uuid = "514baa45-d2d9-a03d-b745-8db20c6daf86",
			version = 2,
		},
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
						actionLua = "local cid=tonumber(eventArgs.entityContentID)\nlocal now=Now()\nlocal ent=TensorCore.mGetEntity(eventArgs.entityID)\nif not ent or not ent.pos then self.used=true return end\nlocal state=data.tenderValleyBarrelBreaker\nif not state then\n state={small={},large={},source=nil,lastSeenAt=nil,drawUUIDs={},guides=nil,expiresAt=nil,drawnFor=nil,armedSmall={},armedLarge={}}\n data.tenderValleyBarrelBreaker=state\nend\nstate.armedSmall=state.armedSmall or {}\nstate.armedLarge=state.armedLarge or {}\nif not state.armedAt or now-state.armedAt>1000 then\n state.armedSmall={}\n state.armedLarge={}\nend\nstate.armedAt=now\nstate.lastSeenAt=now\nlocal list=cid==2014192 and state.armedSmall or state.armedLarge\nlocal id=tonumber(eventArgs.entityID)\nfor _,p in ipairs(list) do\n if p.id==id then\n  p.x=ent.pos.x\n  p.y=ent.pos.y+0.03\n  p.z=ent.pos.z\n  self.used=true\n  return\n end\nend\nlist[#list+1]={id=id,x=ent.pos.x,y=ent.pos.y+0.03,z=ent.pos.z,radius=cid==2014192 and 6 or 11}\nself.used=true",
						conditions = 
						{
							
							{
								"21bd511a-0f2d-c47d-8fee-c207421ca70e",
								true,
							},
						},
						name = "Cache active cactus geometry",
						uuid = "13871e0a-efaa-3e59-bd35-ea874e92159d",
						version = 2.1,
					},
				},
			},
			conditions = 
			{
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return tonumber(eventArgs.a2)==1 and tonumber(eventArgs.a3)==2 and tonumber(eventArgs.a4)==0 and (tonumber(eventArgs.entityContentID)==2014192 or tonumber(eventArgs.entityContentID)==2014193)",
						dequeueIfLuaFalse = true,
						name = "Active Barrel cactus object",
						uuid = "21bd511a-0f2d-c47d-8fee-c207421ca70e",
						version = 3,
					},
				},
			},
			eventType = 19,
			name = "[Tender Valley] Barrel Breaker Early Cactus Capture",
			uuid = "09b1f089-e74d-6e90-a54f-ad52527e4d58",
			version = 2,
		},
	}, 
	inheritedProfiles = 
	{
	},
}



return tbl