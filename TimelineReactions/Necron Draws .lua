local tbl = 
{
	[2] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Shared draw helpers",
				uuid = "18e0d25f-c77f-9a4b-ac26-b4b956a8daa4",
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
							actionLua = "if data.kaptinNecron then self.used=true return end\n-- Pull-scoped renderer and Hector encounter state. APIs are documented in\n-- root_tensorcore.lua, reaping_draw_* and root_draw_update.lua.\nlocal N = {arrows={}, shapes={}, pending={}, handDrops={}, oldHands={}, spectral={}, circleCasts={}, mm=nil}\ndata.kaptinNecron = N\nlocal arrows = TensorCore.getCachedDrawer(0xFF00FFFF,0xFF0088FF,0xFF0000FF,0xFFFFFFFF,2,7)\nlocal friendly = TensorCore.getStaticDrawer(0x7030FF30,1.5,7)\nlocal danger = TensorCore.getMoogleDrawer(6)\nlocal overlay = Argus2.RenderFlags.FLAG_RENDER_OVERLAY\n\nfunction N.slot()\n    if not AnyoneCore or not AnyoneCore.Roster or not AnyoneCore.Roster.current() then return nil end\n    local slot=AnyoneCore.Roster.mySlot()\n    return N.strategy.valid[slot] and slot or nil\nend\nfunction N.clearArrow(key)\n    local a=N.arrows[key]\n    if a then\n        if a.uuid then Argus.deleteTimedShape(a.uuid) end\n        if a.dot then Argus.deleteTimedShape(a.dot);N.shapes[a.dot]=nil end\n        N.arrows[key]=nil\n    end\nend\nfunction N.remember(uuid,ms)\n    if uuid then N.shapes[uuid]=Now()+ms end\n    return uuid\nend\nfunction N.circle(x,z,r,ms,safe)\n    local p=TensorCore.mGetPlayer()\n    return N.remember((safe and friendly or danger):addTimedCircle(ms,x,p.pos.y,z,r,0,false,true),ms)\nend\nfunction N.rect(x,z,length,width,heading,ms)\n    local p=TensorCore.mGetPlayer()\n    return N.remember(danger:addTimedRect(ms,x,p.pos.y,z,length,width,heading,0,false,true),ms)\nend\nfunction N.arrow(x,z,ms,key)\n    if type(x)~=\"number\" or type(z)~=\"number\" or ms<=0 then return end\n    N.clearArrow(key)\n    local a={x=x,z=z,untilAt=Now()+ms,dest={x=x,y=0,z=z}}\n    a.dot=N.circle(x,z,0.6,ms,true)\n    N.arrows[key]=a\n    N.renderArrow(a)\nend\nfunction N.renderArrow(a)\n    local p=TensorCore.mGetPlayer()\n    local dest=a.dest\n    dest.y=p.pos.y\n    local distance=TensorCore.getDistance2d(p.pos,dest)\n    if distance<0.8 then\n        if a.uuid then Argus.deleteTimedShape(a.uuid);a.uuid=nil end\n        return\n    end\n    local ms=a.untilAt-Now()\n    if ms<=0 then return end\n    local head=TensorCore.getHeadingToTarget(p.pos,dest)\n    local tip=math.min(3,distance)\n    local base=math.max(0,distance-tip)\n    if a.uuid and arrows:updateTimedArrow(a.uuid,ms,p.pos.x,p.pos.y,p.pos.z,head,base,1,tip,math.min(3,1+distance/3),0,false,overlay) then return end\n    a.uuid=arrows:addTimedArrow(ms,p.pos.x,p.pos.y,p.pos.z,head,base,1,tip,math.min(3,1+distance/3),0,false,overlay)\nend\nfunction N.defer(key,ms,fn) N.pending[key]={at=Now()+ms,fn=fn} end\nfunction N.update()\n    local now=Now()\n    if not N.nextShapePrune or now>=N.nextShapePrune then\n        N.nextShapePrune=now+1000\n        for uuid,untilAt in pairs(N.shapes) do if now>=untilAt then N.shapes[uuid]=nil end end\n    end\n    for key,a in pairs(N.arrows) do\n        if now>=a.untilAt then N.clearArrow(key) else N.renderArrow(a) end\n    end\n    for key,task in pairs(N.pending) do\n        if now>=task.at then N.pending[key]=nil;task.fn() end\n    end\n    if N.reaping then N.reaping.updateRotation() end\n    if N.mass and N.mm and N.mm.active then N.mass.guide() end\n    if N.specter and next(N.circleCasts) then N.specter.circleGuide() end\nend\nfunction N.clear()\n    for key in pairs(N.arrows) do N.clearArrow(key) end\n    for uuid in pairs(N.shapes) do Argus.deleteTimedShape(uuid) end\n    N.shapes={};N.nextShapePrune=nil\n    N.pending={}\n    if N.reaping then N.reaping.clear() end\n    if N.gc then N.gc.clear() end\n    if N.mementoDraw then N.mementoDraw.clear() end\n    if N.hands then N.hands.clear() end\n    if N.cold then N.cold.clear() end\n    if N.specter then N.specter.clear() end\n    if N.mass then N.mass.clear() end\nend\n\nlocal function position(e)\n    if e.castPosX and e.castPosZ then return {x=e.castPosX,z=e.castPosZ} end\n    local ent=TensorCore.mGetEntity(e.entityID)\n    return ent and ent.pos or nil\nend\nN.position=position\n\nlocal function wasHit(e,id)\n    for _,v in ipairs(e.hitTargets or {}) do if v==id then return true end end\n    return false\nend\n\nN.wasHit=wasHit\n\nN.strategy=(function()\n-- Pure strategy module. No TensorCore/Minion calls and no drawing side effects.\n-- API glue must feed verified event identities and world geometry.\n-- Load once into the encounter's pull-scoped data table, not a permanent global.\nlocal S = {}\nS.slots = {\"T1\", \"T2\", \"H1\", \"H2\", \"M1\", \"M2\", \"R1\", \"R2\"}\nS.valid = {T1=true,T2=true,H1=true,H2=true,M1=true,M2=true,R1=true,R2=true}\n\nlocal mm = {\n    T1 = {\"four_n\", \"two_wn\", \"corner_nw\"},\n    T2 = {\"four_n\", \"two_en\", \"corner_ne\"},\n    H1 = {\"four_s\", \"two_ws\", \"three_sw\", \"three_se\"},\n    H2 = {\"four_s\", \"two_es\", \"three_ne\", \"three_nw\"},\n    M1 = {\"four_n\", \"two_es\", \"three_ne\", \"three_nw\"},\n    M2 = {\"four_n\", \"two_en\", \"three_ne\", \"three_nw\"},\n    R1 = {\"four_s\", \"two_ws\", \"three_sw\", \"three_se\"},\n    R2 = {\"four_s\", \"two_wn\", \"three_sw\", \"three_se\"},\n}\nlocal portalKeys = {\n    four_n=true, four_s=true,\n    two_wn=true, two_en=true, two_ws=true, two_es=true,\n    three_nw=true, three_ne=true, three_sw=true, three_se=true,\n}\nlocal handIndex = {\n    T1={\"north\",1}, M1={\"north\",2}, M2={\"north\",3}, T2={\"north\",4},\n    R1={\"south\",1}, H1={\"south\",2}, H2={\"south\",3}, R2={\"south\",4},\n}\n\n-- Returns side, vertical band, horizontal seat (1 west, 2 east).\n-- Layout solver must provide actual safe lane and separate spread-safe points.\n-- No hardcoded y/z: hand rows vary, and light-side healers must flex.\nfunction S.mementoSeat(slot, darkSide)\n    if not S.valid[slot] or (darkSide ~= \"west\" and darkSide ~= \"east\") then return nil end\n    if slot == \"T1\" then return darkSide, \"tank_safe_lane\", 1 end\n    if slot == \"T2\" then return darkSide, \"tank_safe_lane\", 2 end\n    local lightSide = darkSide == \"west\" and \"east\" or \"west\"\n    local band = (slot == \"M1\" or slot == \"M2\") and \"north\"\n        or ((slot == \"H1\" or slot == \"H2\") and \"middle\" or \"south\")\n    local seat = (slot == \"M1\" or slot == \"H1\" or slot == \"R1\") and 1 or 2\n    return lightSide, band, seat\nend\n\n-- Custom layout shape: layout[side][band][seat] is a caller-verified safe point.\n-- Hand coverage, arena bounds and spread separation are the caller's contract.\nfunction S.mementoTarget(slot, darkSide, layout)\n    local side, band, seat = S.mementoSeat(slot, darkSide)\n    if not side or not layout or not layout[side] or not layout[side][band] then return nil end\n    return layout[side][band][seat]\nend\n\nfunction S.handAssignment(slot)\n    local a = handIndex[slot]\n    if not a then return nil end\n    return a[1], a[2]\nend\n\n-- Caller supplies exactly the eight confirmed Fear of Death hands of THIS wave.\n-- The caller's normalized records are {id=entityID,x=worldX,z=worldZ}.\n-- Returns the original hand record, never a guessed entity ID.\nfunction S.handForSlot(slot, hands, arenaZ)\n    local row, index = S.handAssignment(slot)\n    if not row or not hands or #hands ~= 8 or type(arenaZ) ~= \"number\" then return nil end\n    local north, south, ids = {}, {}, {}\n    for i=1,8 do\n        local h = hands[i]\n        if not h or h.id == nil or ids[h.id] or type(h.x) ~= \"number\" or type(h.z) ~= \"number\"\n            or h.z == arenaZ then return nil end\n        ids[h.id] = true\n        local dst = h.z < arenaZ and north or south\n        dst[#dst+1] = h\n    end\n    if #north ~= 4 or #south ~= 4 then return nil end\n    local function westFirst(a,b) return a.x < b.x end\n    table.sort(north, westFirst)\n    table.sort(south, westFirst)\n    for i=2,4 do\n        if north[i].x == north[i-1].x or south[i].x == south[i-1].x then return nil end\n    end\n    return (row == \"north\" and north or south)[index]\nend\n\n-- For P2 opening giant hands: identical row/seat assignment, translated into\n-- the verified remaining horizontal safe lane. Root supplies two rows of points.\nfunction S.p2SpreadTarget(slot, safeLaneLayout)\n    local row, index = S.handAssignment(slot)\n    if not row or not safeLaneLayout or not safeLaneLayout[row] then return nil end\n    return safeLaneLayout[row][index]\nend\n\nfunction S.massRoute(slot) return mm[slot] end\n\nfunction S.newMassState()\n    return {active=true, completed={}, handsResolved=false, firstBuster=false, secondBuster=false}\nend\n\n-- These event strings are PRIVATE module contracts, not game/MCP event names.\n-- Root translates only verified packet IDs and belongs-to-this-occurrence events.\n-- portalKey identifies the exact fixed portal; don't advance on a generic cast.\nfunction S.massEvent(state, event, portalKey)\n    if not state or not state.active then return false end\n    if event == \"portal_resolved\" then\n        if not portalKeys[portalKey] then return false end\n        state.completed[portalKey] = true\n    elseif event == \"memento_hands_resolved\" then\n        state.handsResolved = true\n    elseif event == \"first_buster_resolved\" then\n        state.firstBuster = true\n    elseif event == \"second_buster_resolved\" then\n        state.secondBuster = true\n    elseif event == \"end\" then\n        state.active = false\n    else return false end\n    return true\nend\n\n-- Returns semantic destination key, instruction, phase.\n-- Caller must supply safe staging geometry for \"hold_\" keys outside portals,\n-- and actual safe hand-lane geometry for \"hands_west\"/\"hands_east\".\n-- vulnGone must be explicitly true after checking the REAL buff (nil is unknown).\nfunction S.massTarget(slot, state, vulnGone)\n    local route = mm[slot]\n    if not route or not state or not state.active then return nil end\n    if not state.completed[route[1]] then\n        return route[1], \"SOAK 4\", \"four\"\n    end\n    if not state.completed[route[2]] then\n        if vulnGone ~= true then return \"hold_\"..route[2], \"WAIT FOR VULN\", \"two_wait\" end\n        return route[2], \"SOAK 2\", \"two\"\n    end\n    if not state.handsResolved then\n        local west = route[2] == \"two_wn\" or route[2] == \"two_ws\"\n        return west and \"hands_west\" or \"hands_east\", \"DODGE HANDS\", \"hands\"\n    end\n    if slot == \"T1\" or slot == \"T2\" then\n        if state.secondBuster then return nil end\n        return route[3], \"BAIT BUSTER\", \"buster\"\n    end\n    if not state.completed[route[3]] then\n        if vulnGone ~= true then return \"hold_\"..route[3], \"WAIT FOR VULN\", \"three_first_wait\" end\n        return route[3], \"SOAK 3\", \"three_first\"\n    end\n    if not state.firstBuster then return route[3], \"WAIT FOR FIRST BUSTER\", \"cross_wait\" end\n    if not state.completed[route[4]] then\n        if vulnGone ~= true then return \"hold_\"..route[4], \"WAIT FOR VULN\", \"three_second_wait\" end\n        -- For three_se the point must be its WEST/inside half, not center.\n        return route[4], \"SOAK 3\", \"three_second\"\n    end\n    return nil\nend\n\nreturn S\n\nend)()\nself.used=true",
							name = "[Setup] Shared LJ renderer and roster",
							uuid = "7d486eab-4cd9-ebf5-9660-9efb3b07f852",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Shared draw helpers",
				mechanicTime = 14.8,
				name = "[Setup] Shared LJ renderer and roster",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 885.2,
				timerStartOffset = -44.8,
				uuid = "a4d462ca-0a9c-1afd-83dd-848feddf38e3",
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
							actionLua = "local N=data.kaptinNecron\nif N then N.update() end\nself.used=true",
							name = "[Draw] Refresh active LJ arrows",
							uuid = "b9f94748-23e3-55d9-914f-5fc04df95e08",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Shared draw helpers",
				loop = true,
				mechanicTime = 14.8,
				name = "[Draw] Refresh active LJ arrows",
				throttleTime = 100,
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 885.2,
				timerStartOffset = -44.8,
				uuid = "2b04eb35-9c59-c462-b325-51a19ef8e8d1",
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
							actionLua = "local old=eventArgs.oldData\nif old and old.kaptinNecron then old.kaptinNecron.clear()\nelseif old and old.kaptinNecronReaping then old.kaptinNecronReaping.clear() end\nself.used=true",
							name = "[Cleanup] Remove owned draws on wipe",
							uuid = "6536b025-0256-8d57-b760-12ce5082739b",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Shared draw helpers",
				eventType = 9,
				loop = true,
				mechanicTime = 14.8,
				name = "[Cleanup] Remove owned draws on wipe",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 885.20001220703,
				timerStartOffset = -44.799999237061,
				uuid = "c177eb20-d0d2-e493-85cb-1cd2a3ab3e4e",
				version = 2,
			},
		},
	},
	[4] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector helpers",
				uuid = "17b29758-e175-aba8-aa25-7c3b81ea8e95",
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
							actionLua = "local base=data.kaptinNecron\nif not base then return end\nif base.hands then self.used=true return end\n-- Focused module for the Necron Hector drawing profile.\n-- Initialized once per pull by its own setup reaction.\nlocal N=data.kaptinNecron\nlocal M={}\nN.hands=M\nlocal position,wasHit=N.position,N.wasHit\n\nlocal function collectDrop(e)\n    local pos=position(e);if not pos then return end\n    -- Ground-target puddle effects provide the actual eight positions.\n    local key=string.format(\"%.2f:%.2f\",pos.x,pos.z)\n    N.handDrops[key]={id=key,x=pos.x,z=pos.z}\n    local list={};for _,v in pairs(N.handDrops) do list[#list+1]=v end\n    if #list~=8 then return end\n    local slot=N.slot();if not slot then return end\n    local hand=N.strategy.handForSlot(slot,list,100)\n    if not hand then return end\n    N.oldHands[slot]=hand\n    local row=N.strategy.handAssignment(slot)\n    local z=math.max(85.6,math.min(114.4,hand.z+(row==\"north\" and -1.4 or 1.4)))\n    N.arrow(hand.x,z,2600,\"hand\")\nend\n\nfunction M.onChannel(e)\n    local id=e.spellID\n    local ent=TensorCore.mGetEntity(e.entityID)\n    if id==44550 then\n        N.handDrops={};N.clearArrow(\"hand\");N.clearArrow(\"embrace\")\n    elseif id==44567 and ent then\n        N.rect(ent.pos.x,ent.pos.z,24,6,ent.pos.h,e.channelTimeMax*1000)\n        N.clearArrow(\"hand\");N.clearArrow(\"embrace\")\n    elseif id==44597 then\n        local slot=N.slot();local hand=slot and N.oldHands[slot]\n        if hand then N.arrow(hand.x,hand.z,e.channelTimeMax*1000+500,\"embrace\") end\n    end\nend\nfunction M.onCast(e)\n    local id=e.spellID\n    if id==44551 then collectDrop(e)\n    elseif id==44552 then N.clearArrow(\"hand\")\n    elseif id==44598 then\n        local p=TensorCore.mGetPlayer()\n        if wasHit(e,p.id) then\n            local slot=N.slot();local row=slot and N.strategy.handAssignment(slot)\n            if row then N.arrow(p.pos.x,math.max(85.6,math.min(114.4,p.pos.z+(row==\"north\" and -1.4 or 1.4))),3400,\"embrace\") end\n        end\n    end\nend\n\nfunction M.clear() N.handDrops={};N.oldHands={} end\n\nself.used=true",
							name = "[Setup] Hand bait positions",
							uuid = "067bfb95-0367-8a1f-9dd9-6fdd39cf7318",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Hector helpers",
				mechanicTime = 28.9,
				name = "[Setup] Hand bait positions",
				timeRange = true,
				timelineIndex = 4,
				timerEndOffset = 871.1,
				timerStartOffset = -48.9,
				uuid = "091512ed-f579-0443-ab84-63a1771cacf6",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector draws",
				uuid = "837ef8c5-921c-30e2-a81c-c4da367754a6",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.hands then return end\nN.hands.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"9e1aea1a-b7d8-0bbf-9d81-fef232964c9f",
									true,
								},
							},
							name = "[Setup] Fear 1 collect this wave",
							uuid = "cb2ed2e5-3917-7198-8c06-31a88bee9099",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44550,
							},
							uuid = "9e1aea1a-b7d8-0bbf-9d81-fef232964c9f",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 28.9,
				name = "[Setup] Fear 1 collect this wave",
				timeRange = true,
				timelineIndex = 4,
				timerEndOffset = 9.1,
				timerStartOffset = -8.9,
				uuid = "57872ac5-27ee-f32c-b18c-31d780d8bfc6",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.hands then return end\nN.hands.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"a87af5b5-d908-bf75-b7cb-3893507c3332",
									true,
								},
							},
							name = "[Draw] Fear 1 LJ assigned hand",
							uuid = "0942dd4e-7998-7d6c-a4c7-012eab1004b7",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44551,
								44552,
							},
							uuid = "a87af5b5-d908-bf75-b7cb-3893507c3332",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 28.9,
				name = "[Draw] Fear 1 LJ assigned hand",
				timeRange = true,
				timelineIndex = 4,
				timerEndOffset = 9.1,
				timerStartOffset = -8.9,
				uuid = "17dd6c9f-7f12-3bbb-a642-db5c693b49a0",
				version = 2,
			},
		},
	},
	[7] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector helpers",
				uuid = "e98c6ea9-047a-43de-8ecf-a39b7244636a",
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
							actionLua = "local base=data.kaptinNecron\nif not base then return end\nif base.cold then self.used=true return end\n-- Focused module for the Necron Hector drawing profile.\n-- Initialized once per pull by its own setup reaction.\nlocal N=data.kaptinNecron\nlocal M={}\nN.cold=M\n\nfunction M.guide()\n    if not N.coldSide or not N.coldUntilAt or Now()>=N.coldUntilAt then return end\n    local p=TensorCore.mGetPlayer()\n    N.arrow(N.coldSide==\"west\" and 95 or 105,math.max(86,math.min(114,p.pos.z)),N.coldUntilAt-Now(),\"cold\")\nend\nfunction M.onChannel(e)\n    local id=e.spellID\n    local ent=TensorCore.mGetEntity(e.entityID)\n    if id==44553 or id==44554 then\n        N.coldSide=id==44553 and \"west\" or \"east\"\n        N.coldUntilAt=Now()+e.channelTimeMax*1000+1300\n        if N.p2Opening then N.coldPending=true else M.guide() end\n    elseif id==44567 and ent then\n        if N.p2Opening and N.coldPending then\n            -- The actual hand cast locks the bait before Cold Grip movement.\n            N.coldPending=nil\n            M.guide()\n        end\n    elseif id==44612 and ent then\n        N.rect(ent.pos.x,ent.pos.z,100,12,ent.pos.h,e.channelTimeMax*1000)\n    elseif id==44555 and ent then\n        N.rect(ent.pos.x,ent.pos.z,100,24,ent.pos.h,e.channelTimeMax*1000)\n    end\nend\nfunction M.onCast(e)\n    local id=e.spellID\n    if id==44612 and N.coldSide then\n        local p=TensorCore.mGetPlayer()\n        N.arrow(N.coldSide==\"west\" and 90 or 110,math.max(86,math.min(114,p.pos.z)),1600,\"cold\")\n    elseif id==44555 then\n        N.clearArrow(\"cold\")\n        N.coldPending=nil;N.coldUntilAt=nil\n        if N.p2Opening then N.p2Opening=false;N.clearArrow(\"embrace\") end\n    end\nend\n\nfunction M.clear() N.coldSide=nil;N.coldUntilAt=nil;N.coldPending=nil end\n\nself.used=true",
							name = "[Setup] Cold Grip stages",
							uuid = "c78a421a-28a8-d94d-a25c-02119238bacb",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Hector helpers",
				mechanicTime = 40,
				name = "[Setup] Cold Grip stages",
				timeRange = true,
				timelineIndex = 7,
				timerEndOffset = 860,
				timerStartOffset = -60,
				uuid = "26888831-ccfc-db15-be1f-f7f492449171",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector draws",
				uuid = "476849c7-3412-5f28-b782-ef227cbd57ba",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.cold then return end\nN.cold.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"e7e3d62a-eadb-267e-a65a-a8c8cd78b4b8",
									true,
								},
							},
							name = "[Draw] Cold Grip 1 seam and lines",
							uuid = "aacc6d80-b651-2781-ab10-af76f1023190",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44553,
								44554,
								44555,
								44612,
							},
							uuid = "e7e3d62a-eadb-267e-a65a-a8c8cd78b4b8",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 40,
				name = "[Draw] Cold Grip 1 seam and lines",
				timeRange = true,
				timelineIndex = 7,
				timerEndOffset = 4,
				timerStartOffset = -9,
				uuid = "174d52fe-7ab4-86f5-bd6f-27ee6a00f277",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.cold then return end\nN.cold.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"422fff26-0439-26e9-9c39-a5ef8b1f353e",
									true,
								},
							},
							name = "[Draw] Cold Grip 1 LJ final side",
							uuid = "ed852191-c11c-ffa9-b568-fc9693a543f8",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44555,
								44612,
							},
							uuid = "422fff26-0439-26e9-9c39-a5ef8b1f353e",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 40,
				name = "[Draw] Cold Grip 1 LJ final side",
				timeRange = true,
				timelineIndex = 7,
				timerEndOffset = 4,
				timerStartOffset = -9,
				uuid = "5ff9ce7a-b10d-01d8-8dfa-c0cc19fcf4d7",
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
				name = "Kaptin - Hector draws",
				uuid = "66067c76-3132-1f21-9f41-fab970a250ea",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Shared draw helpers",
				uuid = "e263ba6b-274c-faf8-95ea-10c67f093e5b",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector helpers",
				uuid = "faf9b7ea-cc8d-d7b7-bb50-6eb9cd2630da",
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
							actionLua = "local base=data.kaptinNecron\nif not base then return end\nif base.mementoDraw then self.used=true return end\n-- Focused module for the Necron Hector drawing profile.\n-- Initialized once per pull by its own setup reaction.\nlocal N=data.kaptinNecron\nlocal M={}\nN.mementoDraw=M\nlocal danger=TensorCore.getMoogleDrawer(6)\n\nfunction M.solve()\n    local m=N.memento\n    if not m or m.mass or not m.dark then return end\n    local darkRows,lightRows=m.rows[m.dark],m.rows[m.dark==\"west\" and \"east\" or \"west\"]\n    if #darkRows~=4 or #lightRows~=1 then return end\n    local function free(side,z)\n        for _,row in ipairs(m.rows[side]) do if math.abs(z-row)<3.35 then return false end end\n        return true\n    end\n    local layout={west={},east={}}\n    local function seats(side,z)\n        local left=side==\"west\" and 82.6 or 106.6\n        return {{x=left,z=z},{x=left+10.8,z=z}}\n    end\n    local best,bestScore\n    for z=85.6,114.4,0.2 do\n        if free(m.dark,z) then\n            local score=math.abs(z-100)\n            if not bestScore or score<bestScore then best,bestScore=z,score end\n        end\n    end\n    if not best then return end\n    layout[m.dark].tank_safe_lane=seats(m.dark,best)\n    local light=m.dark==\"west\" and \"east\" or \"west\"\n    local north,south\n    for z=85.6,114.4,0.2 do if free(light,z) then north=z;break end end\n    for z=114.4,85.6,-0.2 do if free(light,z) then south=z;break end end\n    if not north or not south then return end\n    best,bestScore=nil,nil\n    for z=north+10.2,south-10.2,0.2 do\n        if free(light,z) and (not bestScore or math.abs(z-100)<bestScore) then best,bestScore=z,math.abs(z-100) end\n    end\n    if not best then return end\n    layout[light].north=seats(light,north);layout[light].middle=seats(light,best);layout[light].south=seats(light,south)\n    local points={}\n    for _,slot in ipairs(N.strategy.slots) do points[#points+1]=N.strategy.mementoTarget(slot,m.dark,layout) end\n    for i=1,8 do for j=i+1,8 do\n        local a,b=points[i],points[j]\n        if not a or not b or (a.x-b.x)^2+(a.z-b.z)^2<10.1^2 then return end\n    end end\n    local target=N.strategy.mementoTarget(N.slot(),m.dark,layout)\n    if target then N.arrow(target.x,target.z,math.max(0,m.untilAt-Now()),\"memento\") end\nend\n\nfunction M.onChannel(e)\n    local id=e.spellID\n    local ent=TensorCore.mGetEntity(e.entityID)\n    if id==44565 or id==44566 then\n        local side=id==44566 and \"west\" or \"east\"\n        N.memento={dark=side,mass=N.mm and N.mm.active,rows={west={},east={}},casters={},untilAt=Now()+16000}\n        if not N.memento.mass then\n            local slot=N.slot();local targetSide=N.strategy.mementoSeat(slot,side)\n            if targetSide then\n                local p=TensorCore.mGetPlayer()\n                N.arrow(targetSide==\"west\" and 88 or 112,math.max(86,math.min(114,p.pos.z)),e.channelTimeMax*1000,\"memento\")\n            end\n        end\n    elseif id==44567 and ent then\n        local m=N.memento\n        if m and Now()<m.untilAt then\n            local tx,_,tz=TensorCore.getPosInDirection(ent.pos,ent.pos.h,24,true)\n            if math.abs(tx-ent.pos.x)>20 and math.abs(tz-ent.pos.z)<2 and not m.casters[e.entityID] then\n                m.casters[e.entityID]=true\n                local side=tx<ent.pos.x and \"west\" or \"east\"\n                m.rows[side][#m.rows[side]+1]=ent.pos.z\n                N.clearArrow(\"memento\")\n                M.solve()\n            end\n        end\n    elseif id==44602 then\n        local t=TensorCore.mGetEntity(e.targetID)\n        if t then N.remember(danger:addTimedCircleOnEnt(e.channelTimeMax*1000,t.id,10,0,false,true),e.channelTimeMax*1000) end\n    end\nend\nfunction M.onCast(e)\n    local id=e.spellID\n    if id==44602 then\n        if N.memento and not N.memento.mass then\n            N.clearArrow(\"memento\");N.memento=nil\n        end\n    end\nend\n\nfunction M.clear() N.memento=nil end\n\nself.used=true",
							name = "[Setup] Memento safe lanes",
							uuid = "a050ced0-ffa6-fd7d-a0bb-644acd2429c4",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Hector helpers",
				mechanicTime = 52.4,
				name = "[Setup] Memento safe lanes",
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = 847.6,
				timerStartOffset = -72.4,
				uuid = "eb3272d3-4cb9-e588-baff-2e7698b811ac",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector draws",
				uuid = "de54c9af-b4ad-31cc-8eb1-ccd9d857781c",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.mementoDraw then return end\nN.mementoDraw.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"b52e050e-6339-770b-bfd2-ff2ea044d6cb",
									true,
								},
							},
							name = "[Draw] Memento 1 LJ side and spread",
							uuid = "a9aad124-a15e-c2ff-9b0f-eb55e36dfd98",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44565,
								44566,
								44567,
								44602,
							},
							uuid = "b52e050e-6339-770b-bfd2-ff2ea044d6cb",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 52.4,
				name = "[Draw] Memento 1 LJ side and spread",
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = 12.6,
				timerStartOffset = -10.4,
				uuid = "4d546946-9471-df48-8bd9-0f9b3fb8b447",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.mementoDraw then return end\nN.mementoDraw.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"99dddbe6-3d96-e920-9ddb-1c8bdd435cb9",
									true,
								},
							},
							name = "[Cleanup] Memento 1 after Smite",
							uuid = "98ec866d-8004-78da-99c5-0abb827f93cb",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44602,
							},
							uuid = "99dddbe6-3d96-e920-9ddb-1c8bdd435cb9",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 52.4,
				name = "[Cleanup] Memento 1 after Smite",
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = 12.60000038147,
				timerStartOffset = -10.39999961853,
				uuid = "5ad3fdc8-e035-77a5-82cc-fb5ddad5f4bf",
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
				name = "Hector draws",
				uuid = "2b62107c-cebb-879a-8fc1-afc9884fb14a",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.hands then return end\nN.hands.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"a4d9060a-d830-121a-be0d-c2927f9860cf",
									true,
								},
							},
							name = "[Draw] Memento 1 hand cleaves",
							uuid = "3ca0a647-f827-fe0f-bb6a-bc2c6ab92d7d",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44567,
							},
							uuid = "a4d9060a-d830-121a-be0d-c2927f9860cf",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 58.6,
				name = "[Draw] Memento 1 hand cleaves",
				timeRange = true,
				timelineIndex = 10,
				timerEndOffset = 6.4,
				timerStartOffset = -16.6,
				uuid = "9ffab59f-036c-63b0-b209-0aa235e869cd",
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
				name = "Hector helpers",
				uuid = "6e302db2-963a-c4d9-bb9c-43e1cc4e2b61",
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
							actionLua = "local base=data.kaptinNecron\nif not base then return end\nif base.reaping then self.used=true return end\n-- Draft initializer for root integration. No engine callback registration.\n-- Calls are made only from TensorReactions native event actions.\n-- Verified sources and exact IDs: necron_events.md; live get_actions:\n-- reaping_action_verify.json. Public API definitions: reaping_draw_*.lua.\n-- Each native event action should invoke the matching module function then\n-- set self.used=true. All state is private to this pull-scoped data table.\n\nlocal M = {}\ndata.kaptinNecronReaping = M\n\nlocal shapes = {[604] = \"out\", [605] = \"in\", [606] = \"middle\", [607] = \"sides\"}\nlocal hits = {[45183] = \"out\", [45184] = \"in\", [44608] = \"middle\", [45185] = \"sides\"}\nlocal releaseGroups = {[44557] = 2, [44558] = 4, [45167] = 2, [45168] = 4}\nlocal s = {order = {}, shapeDraws = {}, stackDraws = {}, count = 0, rotationActors = {}, rotationSeen = {}}\nlocal labels = {['in']='IN', out='OUT', middle='MID SAFE', sides='SIDES SAFE'}\nM.state = s\n\n-- Optional root-owned hooks, not game API calls:\n-- M.guide(shape, groups, durationMs, finalShape): draw a verified Hector\n-- role position using the shared LJ arrow helper. No assumed role layout here.\n-- M.clearGuide(): remove only this module's currently-owned arrow/marker.\n-- M.stackAnchorSlots(groups): canonical roster slots whose cone axes are the\n-- agreed party assignment. Defaults are Hector's two healer groups or the\n-- support anchors T1/M1, T2/M2, H1/R1, H2/R2. Friendly cones are guides, NOT a\n-- claim about which support/DPS the enemy randomly selected this time.\n-- M.rotation(offset): may only be invoked from separately verified rotation\n-- evidence; does NOT assume Minion aura fields map to BossMod modelState.\n\nlocal function removeDraws(list)\n    for i = 1, #list do\n        Argus.deleteTimedShape(list[i])\n    end\n    for i = #list, 1, -1 do list[i] = nil end\nend\n\nlocal function keep(list, uuid)\n    if uuid ~= nil then list[#list + 1] = uuid end\nend\n\nfunction M.clear()\n    removeDraws(s.shapeDraws)\n    removeDraws(s.stackDraws)\n    if M.clearGuide then M.clearGuide() end\n    s.active, s.rotated, s.collecting = false, false, false\n    s.rotationActors, s.rotationUntil, s.noticeKey = {}, nil, nil\n    s.shape, s.step, s.sequenceText = nil, nil, nil\n    s.order, s.activeOrder = {}, nil\n    s.groups, s.count, s.expected, s.bossID = nil, 0, nil, nil\n    s.lastHitAt, s.lastHitShape, s.lastChannelAt, s.lastChannelShape = nil, nil, nil, nil\nend\n\nlocal function drawShape(shape, duration)\n    removeDraws(s.shapeDraws)\n    removeDraws(s.stackDraws)\n    if M.clearGuide then M.clearGuide() end\n    local boss = s.bossID and TensorCore.mGetEntity(s.bossID)\n    if boss == nil or duration <= 0 then return end\n    local d = TensorCore.getMoogleDrawer(6)\n    if shape == \"out\" then\n        keep(s.shapeDraws, d:addTimedCircleOnEnt(duration, boss.id, 20, 0, false, true))\n    elseif shape == \"in\" then\n        keep(s.shapeDraws, d:addTimedDonutOnEnt(duration, boss.id, 16, 60, 0, false, true))\n    elseif shape == \"middle\" then\n        local heading = TensorCore.getHeadingToTarget({x=88,z=85}, {x=88,z=115})\n        keep(s.shapeDraws, d:addTimedRect(duration, 88, boss.pos.y, 85, 100, 12, heading, 0, false, true))\n        keep(s.shapeDraws, d:addTimedRect(duration, 112, boss.pos.y, 85, 100, 12, heading, 0, false, true))\n    elseif shape == \"sides\" then\n        local heading = TensorCore.getHeadingToTarget({x=100,z=85}, {x=100,z=115})\n        keep(s.shapeDraws, d:addTimedRect(duration, 100, boss.pos.y, 85, 100, 12, heading, 0, false, true))\n    end\n    s.shape, s.step = shape, s.count + 1\n    local key = tostring(s.step)..\":\"..shape\n    if s.noticeKey ~= key then\n        s.noticeKey = key\n        local parts = {}\n        for i=s.step,s.expected do\n            local nextShape = s.activeOrder and s.activeOrder[i] or (i==s.step and shape or nil)\n            if nextShape then parts[#parts+1] = tostring(i)..\"-\"..labels[nextShape] end\n        end\n        s.sequenceText = table.concat(parts, \" > \")\n        if s.step==s.expected then\n            s.sequenceText=s.sequenceText..(s.groups==4 and \" + PAIRS\" or \" + STACKS\")\n        end\n        TensorCore.addAlertText(math.min(duration,2500),s.sequenceText,1.2,2,false)\n    end\n    if M.guide then M.guide(shape, s.groups, duration, s.count + 1 == s.expected) end\nend\n\nlocal function drawStacks(duration)\n    removeDraws(s.stackDraws)\n    if not (s.bossID and s.groups and AnyoneCore and AnyoneCore.Roster) then return end\n    local slots\n    if M.stackAnchorSlots then\n        slots = M.stackAnchorSlots(s.groups)\n    elseif s.groups == 2 then\n        slots = {\"H1\", \"H2\"}\n    elseif s.groups == 4 then\n        slots = {\"T1\", \"T2\", \"H1\", \"H2\"}\n    end\n    if slots == nil then return end\n    -- Green positioning cones, doNotDetect=true, never influence movement.\n    local d = TensorCore.getStaticDrawer(0x3030FF30, 1.5, 7)\n    for i = 1, #slots do\n        local id = AnyoneCore.Roster.idOf(slots[i])\n        if id ~= nil and TensorCore.mGetEntity(id) ~= nil then\n            keep(s.stackDraws, d:addTimedConeOnEnt(duration, s.bossID, 100,\n                math.rad(20), id, 0, false, true))\n        end\n    end\nend\n\nfunction M.rotation(offset)\n    if s.expected ~= 4 or s.count ~= 0 or #s.order ~= 4 then return false end\n    if offset ~= 0 and offset ~= 1 and offset ~= 2 and offset ~= 3 then return false end\n    s.activeOrder = {}\n    for i = 1, 4 do s.activeOrder[i] = s.order[((i + offset - 1) % 4) + 1] end\n    s.rotated = true\n    return true\nend\n\n-- The four tether source IDs are observed in this mechanic. Their identity is\n-- only used to bound the lookup; no order is inferred from entity IDs/tethers.\n-- Public Cactbot Crop Circle logic establishes status 2056's counts 0x3B8..BB\n-- and the single bottom actor (height < 5). Minion exposes status count as stacks.\nfunction M.onTether(e)\n    if s.expected~=4 or not s.collecting or e.newTargetID~=s.bossID then return end\n    s.rotationActors[e.sourceEntityID]=true\nend\n\nfunction M.tryRotation()\n    if s.expected~=4 or #s.order~=4 or s.count~=0 then return false end\n    local count,bottom,seen=0,nil,s.rotationSeen\n    for i=0,3 do seen[i]=nil end\n    for id in pairs(s.rotationActors) do\n        local ent=TensorCore.mGetEntity(id)\n        local buff=ent and TensorCore.getBuff(ent,2056)\n        if not ent or not buff then return false end\n        local offset=buff.stacks-952\n        if offset<0 or offset>3 or offset%1~=0 or seen[offset] then return false end\n        seen[offset]=true\n        count=count+1\n        if ent.pos.y<5 then\n            if bottom~=nil then return false end\n            bottom=offset\n        end\n    end\n    if count~=4 or bottom==nil then return false end\n    return M.rotation(bottom)\nend\n\nfunction M.updateRotation()\n    if not s.active or s.expected~=4 or s.rotated or s.count~=0 or not s.rotationUntil then return end\n    local remain=s.rotationUntil-Now()\n    if remain<=0 then s.rotationUntil=nil;return end\n    if M.tryRotation() then drawShape(s.activeOrder[1],remain) end\nend\n\nfunction M.onMarker(e)\n    local shape = shapes[e.markerID]\n    if shape == nil or not s.collecting or e.entityID ~= s.bossID then return end\n    if #s.order >= s.expected then return end\n    s.order[#s.order + 1] = shape\nend\n\nfunction M.onChannel(e)\n    local id = e.spellID\n    if id == 44556 or id == 44564 then\n        M.clear()\n        s.bossID, s.expected, s.collecting = e.entityID, (id == 44564 and 4 or 1), true\n        return\n    end\n\n    local groups = releaseGroups[id]\n    if groups ~= nil then\n        if s.bossID ~= e.entityID then return end\n        s.collecting, s.active, s.groups, s.count = false, true, groups, 0\n        s.lastHitAt, s.lastHitShape, s.lastChannelAt, s.lastChannelShape = nil, nil, nil, nil\n        local duration = math.max(0, e.channelTimeMax) * 1000\n        if id == 44557 or id == 44558 then\n            s.expected = 1\n            if #s.order == 1 then\n                s.activeOrder = {s.order[1]}\n                drawShape(s.order[1], duration + 1350)\n            end\n            drawStacks(duration + 1450)\n        else\n            s.expected = 4\n            s.rotationUntil=Now()+duration+1350\n            M.tryRotation()\n            -- If the public status path is unavailable, the first observed\n            -- helper remains the fail-closed fallback, never a guessed rotation.\n            if s.rotated and s.activeOrder ~= nil then\n                drawShape(s.activeOrder[1], duration + 1350)\n            end\n        end\n        return\n    end\n\n    local shape = hits[id]\n    if shape == nil or not s.active then return end\n    local now = Now()\n    -- Two side-lane helpers are one shape. Repeated handler delivery is also\n    -- ignored; successive legitimate shapes are ~2.9s apart.\n    if s.lastChannelShape == shape and s.lastChannelAt and now - s.lastChannelAt < 800 then return end\n    s.lastChannelAt, s.lastChannelShape = now, shape\n\n    if s.expected == 4 and s.count == 0 and not s.rotated then\n        local match, matches = nil, 0\n        for i = 1, #s.order do\n            if s.order[i] == shape then match, matches = i, matches + 1 end\n        end\n        if #s.order == 4 and matches == 1 then M.rotation(match - 1) end\n    end\n    -- A mismatch invalidates future predictions; observed geometry still works.\n    if s.activeOrder and s.activeOrder[s.count + 1] ~= shape then\n        s.activeOrder, s.rotated = nil, false\n    end\n    drawShape(shape, math.max(0, e.channelTimeMax) * 1000 + 150)\n    if s.count + 1 == s.expected then drawStacks(math.max(0, e.channelTimeMax) * 1000 + 250) end\nend\n\nfunction M.onCast(e)\n    if e.spellID == 44559 or e.spellID == 44560 then\n        removeDraws(s.shapeDraws)\n        removeDraws(s.stackDraws)\n        if M.clearGuide then M.clearGuide() end\n        s.active, s.rotationUntil = false, nil\n        s.shape, s.step, s.sequenceText, s.noticeKey = nil, nil, nil, nil\n        return\n    end\n    local shape = hits[e.spellID]\n    if shape == nil or not s.active then return end\n    local now = Now()\n    if s.lastHitShape == shape and s.lastHitAt and now - s.lastHitAt < 800 then return end\n    s.lastHitAt, s.lastHitShape = now, shape\n    removeDraws(s.shapeDraws)\n    if s.count+1<s.expected then\n        removeDraws(s.stackDraws)\n        if M.clearGuide then M.clearGuide() end\n    end\n    s.count = s.count + 1\n    if s.count < s.expected and s.activeOrder ~= nil then\n        local nextShape = s.activeOrder[s.count + 1]\n        if nextShape ~= nil then\n            -- Expected interval only bounds a preview; the next channel resets\n            -- it to the real observed cast deadline.\n            drawShape(nextShape, 3000)\n            if s.count + 1 == s.expected then drawStacks(3100) end\n        end\n    end\nend\n\n-- Hector role points use the CURRENT shape's safe region. Boss is at (100,78)\n-- in the clear; requiring both IN and MID at once prevented four-pair points.\n-- Half-yalm lane/arena margins and one-yalm circle/donut margins stay inside\n-- the sourced arena and AoE boundaries. Pair cone axes retain 22deg spacing.\nfunction M.rolePoints(bossPos, shape, groups)\n    local inside = shape == \"in\" or shape == \"middle\"\n    if not labels[shape] then return nil end\n    if groups ~= 2 and groups ~= 4 then return nil end\n    local bx,bz = bossPos.x,bossPos.z\n    local function ray(angle, side, far)\n        local radians=math.rad(angle*side)\n        local dx,dz=math.sin(radians),math.cos(radians)\n        local xMin,xMax\n        if shape==\"middle\" then xMin,xMax=94.5,105.5\n        elseif shape==\"sides\" and side<0 then xMin,xMax=82.5,93.5\n        elseif shape==\"sides\" then xMin,xMax=106.5,117.5\n        else xMin,xMax=82.5,117.5 end\n        local lo,hi=0,math.huge\n        local function slab(origin,direction,low,high)\n            if math.abs(direction)<0.000001 then return origin>=low and origin<=high end\n            local a,b=(low-origin)/direction,(high-origin)/direction\n            if a>b then a,b=b,a end\n            lo,hi=math.max(lo,a),math.min(hi,b)\n            return lo<=hi\n        end\n        if not slab(bx,dx,xMin,xMax) or not slab(bz,dz,85.5,114.5) then return nil end\n        if shape==\"in\" then hi=math.min(hi,15)\n        elseif shape==\"out\" then lo=math.max(lo,21) end\n        if lo>hi or hi<=0 then return nil end\n        local r=far and hi or lo\n        return {x=bx+r*dx,z=bz+r*dz,radius=r,angle=angle*side}\n    end\n    local best,bestScore\n    if groups==2 then\n        for a=12,70 do\n            local left,right=ray(a,-1,false),ray(a,1,false)\n            if left and right then\n                local score=math.abs(a-(inside and 25 or 40))+(left.radius+right.radius)*0.2\n                if not bestScore or score<bestScore then\n                    bestScore=score\n                    best={T1=left,H1=left,M1=left,R1=left,T2=right,H2=right,M2=right,R2=right}\n                end\n            end\n        end\n    else\n        for h=11,40 do\n            local lh,rh=ray(h,-1,true),ray(h,1,true)\n            if lh and rh then\n                for t=h+22,80 do\n                    local lt,rt=ray(t,-1,false),ray(t,1,false)\n                    if lt and rt and lt.z+1<=lh.z and rt.z+1<=rh.z then\n                        local score=math.abs(h-15)+math.abs(t-(inside and 35 or 50))*0.25\n                            +(lt.radius+rt.radius)*0.8\n                        if not bestScore or score<bestScore then\n                            bestScore=score\n                            best={T1=lt,M1=lt,T2=rt,M2=rt,H1=lh,R1=lh,H2=rh,R2=rh}\n                        end\n                    end\n                end\n            end\n        end\n    end\n    -- If the actual boss position makes these conservative regions infeasible,\n    -- do not invent a destination. Enemy AoE draws still remain available.\n    return best\nend\n\nfunction M.rolePoint(bossPos, shape, groups, slot)\n    local all=M.rolePoints(bossPos,shape,groups)\n    return all and all[slot] or nil\nend\n\n-- Root wrapper calls M.clear() on OnWipe/countdown cancellation as appropriate.\n-- Early rotation uses the public status path above; missing status evidence\n-- leaves the first observed helper as the conservative fallback.\nself.used = true\n\nlocal N=data.kaptinNecron\nN.reaping=data.kaptinNecronReaping\nN.reaping.clearGuide=function() N.clearArrow(\"reaping\") end\n-- IN/OUT use their danger telegraphs; no personal Reaping movement arrows.\nN.reaping.guide=function()\n    N.clearArrow(\"reaping\")\nend\nself.used=true",
							name = "[Setup] Reaping shape and pair solver",
							uuid = "db7725d4-6509-deb8-9271-9ea41925b43a",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Hector helpers",
				mechanicTime = 69.6,
				name = "[Setup] Reaping shape and pair solver",
				timeRange = true,
				timelineIndex = 12,
				timerEndOffset = 830.4,
				timerStartOffset = -89.6,
				uuid = "e47e516f-b864-d65f-9780-8a05d7a6f73a",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector draws",
				uuid = "fbfc3066-a8c1-0bd8-90ad-e003c3ad1c17",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"d73f87e2-7447-3224-b753-2ccc2aa27918",
									true,
								},
							},
							name = "[Setup] Soul 1 stored shapes",
							uuid = "373d46d5-9b8c-074a-b385-6cf2d46e5966",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44556,
							},
							uuid = "d73f87e2-7447-3224-b753-2ccc2aa27918",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 69.6,
				name = "[Setup] Soul 1 stored shapes",
				timeRange = true,
				timelineIndex = 12,
				timerEndOffset = 2.4,
				timerStartOffset = -7.6,
				uuid = "5be44bac-74fa-4301-a062-458b4c5e807e",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onMarker(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"f0ef8e3b-4c31-ad25-8c8a-d4ec7562bfef",
									true,
								},
							},
							name = "[Setup] Soul 1 shape markers",
							uuid = "9be04a11-1226-6b2e-a646-e9eb2db66f76",
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
							eventArgType = 3,
							markerIDList = 
							{
								604,
								605,
								606,
								607,
							},
							name = "Mechanic markers",
							uuid = "f0ef8e3b-4c31-ad25-8c8a-d4ec7562bfef",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 4,
				loop = true,
				mechanicTime = 69.6,
				name = "[Setup] Soul 1 shape markers",
				timeRange = true,
				timelineIndex = 12,
				timerEndOffset = 2.4,
				timerStartOffset = -7.6,
				uuid = "7a8eb2ed-55b4-79bc-bc0f-5e9a8d9c4e5e",
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
				name = "Hector draws",
				uuid = "c51a33f8-e124-e959-a8fe-4ecde72a827b",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"c3b8ca8c-4b8e-35fd-9f10-c9bb7768adeb",
									true,
								},
							},
							name = "[Draw] Soul 1 in-out and pairs-stack",
							uuid = "62adaa3e-7b83-c01a-9206-418f270c0866",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44557,
								44558,
								44608,
								45183,
								45184,
								45185,
							},
							uuid = "c3b8ca8c-4b8e-35fd-9f10-c9bb7768adeb",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 77.7,
				name = "[Draw] Soul 1 in-out and pairs-stack",
				timeRange = true,
				timelineIndex = 13,
				timerEndOffset = 2.3,
				timerStartOffset = -7.7,
				uuid = "f93e5041-af35-5900-b2d7-3225179aa69d",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"245f23cb-990a-9310-b87a-fc0d784a1e25",
									true,
								},
							},
							name = "[Draw] Soul 1 next shape and cleanup",
							uuid = "bcab34e7-b43c-05f4-9dd0-9d5447f02522",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44559,
								44560,
								44608,
								45183,
								45184,
								45185,
							},
							uuid = "245f23cb-990a-9310-b87a-fc0d784a1e25",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 77.7,
				name = "[Draw] Soul 1 next shape and cleanup",
				timeRange = true,
				timelineIndex = 13,
				timerEndOffset = 2.3,
				timerStartOffset = -7.7,
				uuid = "531d2fa1-041f-690c-8b75-46fc6e296413",
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
				name = "Hector draws",
				uuid = "a19c0eb2-1c02-218a-b748-6fa405307225",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"47e45516-fc99-557a-bd2d-f752fe312cbc",
									true,
								},
							},
							name = "[Setup] Soul 2 stored shapes",
							uuid = "ae0caa52-9dc5-4f97-a7a1-61613162b02d",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44556,
							},
							uuid = "47e45516-fc99-557a-bd2d-f752fe312cbc",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 84.7,
				name = "[Setup] Soul 2 stored shapes",
				timeRange = true,
				timelineIndex = 16,
				timerEndOffset = 6.3,
				timerStartOffset = -5.7,
				uuid = "6676af1f-740f-d089-9bee-cbbd228eb0ef",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onMarker(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"69dbb932-4ae0-c3e3-a02f-50e87bb32240",
									true,
								},
							},
							name = "[Setup] Soul 2 shape markers",
							uuid = "16cd7e8f-8316-c495-b121-58e35a8cd7b8",
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
							eventArgType = 3,
							markerIDList = 
							{
								604,
								605,
								606,
								607,
							},
							name = "Mechanic markers",
							uuid = "69dbb932-4ae0-c3e3-a02f-50e87bb32240",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 4,
				loop = true,
				mechanicTime = 84.7,
				name = "[Setup] Soul 2 shape markers",
				timeRange = true,
				timelineIndex = 16,
				timerEndOffset = 6.3,
				timerStartOffset = -5.7,
				uuid = "8ea0c506-cfb8-1b66-9cef-9ee78d1c8335",
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
				name = "Hector draws",
				uuid = "25e9468a-1e48-5813-b131-f1ebcfbb7a48",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.hands then return end\nN.hands.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"9324ef54-f6ea-8c74-9b4e-7adde85ba1b7",
									true,
								},
							},
							name = "[Setup] Fear 2 collect this wave",
							uuid = "3343d736-4e1f-267a-9387-d3c717d1e93b",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44550,
							},
							uuid = "9324ef54-f6ea-8c74-9b4e-7adde85ba1b7",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 92.8,
				name = "[Setup] Fear 2 collect this wave",
				timeRange = true,
				timelineIndex = 17,
				timerEndOffset = 10.2,
				timerStartOffset = -8.8,
				uuid = "e173eb75-8e17-365f-ae8e-ee94f5e606a7",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.hands then return end\nN.hands.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"0ba51852-c0cb-4d27-ab33-2c7bb88183bd",
									true,
								},
							},
							name = "[Draw] Fear 2 LJ assigned hand",
							uuid = "3210e449-43c0-5878-bd21-f60df7733eb3",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44551,
								44552,
							},
							uuid = "0ba51852-c0cb-4d27-ab33-2c7bb88183bd",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 92.8,
				name = "[Draw] Fear 2 LJ assigned hand",
				timeRange = true,
				timelineIndex = 17,
				timerEndOffset = 10.2,
				timerStartOffset = -8.8,
				uuid = "e1048e63-f6a5-8f9e-862f-8d85536a3eeb",
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
				name = "Hector draws",
				uuid = "5c55ab7b-00d5-be7e-9666-81d4c943484b",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.hands then return end\nN.hands.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"80ac174f-455e-ce2f-9d00-e1c892d32d79",
									true,
								},
							},
							name = "[Draw] Embrace 1 LJ hand bait",
							uuid = "81f5e08f-a44a-747f-b59d-4afaf724328a",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44567,
								44597,
							},
							uuid = "80ac174f-455e-ce2f-9d00-e1c892d32d79",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 102.9,
				name = "[Draw] Embrace 1 LJ hand bait",
				timeRange = true,
				timelineIndex = 20,
				timerEndOffset = 9.1,
				timerStartOffset = -6.9,
				uuid = "78e5f833-b034-197e-a1d1-6b127d9b49ee",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.hands then return end\nN.hands.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"3226f986-60b6-436f-b377-0280e7ab16c7",
									true,
								},
							},
							name = "[Draw] Embrace 1 post-drop bait",
							uuid = "e89d626c-c027-d10d-9b54-7f1af499b2d8",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44598,
							},
							uuid = "3226f986-60b6-436f-b377-0280e7ab16c7",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 102.9,
				name = "[Draw] Embrace 1 post-drop bait",
				timeRange = true,
				timelineIndex = 20,
				timerEndOffset = 9.1,
				timerStartOffset = -6.9,
				uuid = "d882ec50-9154-f2ff-bcf0-3189393d344a",
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
							actionLua = "local N=data.kaptinNecron\nif not N then return end\nif eventArgs.entityID==TensorCore.mGetPlayer().id then\n    local slot=N.slot();local hand=slot and N.oldHands[slot]\n    if hand then N.arrow(hand.x,hand.z,4100,\"embrace\") end\nend\nself.used=true",
							conditions = 
							{
								
								{
									"84880025-d3f4-8930-98e1-6841d34ce5b0",
									true,
								},
							},
							name = "[Draw] Embrace 1 marked drop",
							uuid = "1235def4-3a10-7bd5-824b-f530486b2d85",
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
							eventArgType = 3,
							markerIDList = 
							{
								614,
							},
							name = "Mechanic markers",
							uuid = "84880025-d3f4-8930-98e1-6841d34ce5b0",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 4,
				loop = true,
				mechanicTime = 102.9,
				name = "[Draw] Embrace 1 marked drop",
				timeRange = true,
				timelineIndex = 20,
				timerEndOffset = 9.1000003814697,
				timerStartOffset = -6.9000000953674,
				uuid = "85486645-49ea-e382-a7d0-56e54b8a40b2",
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
				name = "Hector draws",
				uuid = "5d4ac08b-6f8d-d86a-a64e-cf84e37a6c20",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"b2dae6ce-e4f9-c966-b4cd-d47cb335ca96",
									true,
								},
							},
							name = "[Draw] Soul 2 in-out and pairs-stack",
							uuid = "e7aa91e9-373d-e44e-bff8-9d538ae1b55f",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44557,
								44558,
								44608,
								45183,
								45184,
								45185,
							},
							uuid = "b2dae6ce-e4f9-c966-b4cd-d47cb335ca96",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 124.1,
				name = "[Draw] Soul 2 in-out and pairs-stack",
				timeRange = true,
				timelineIndex = 24,
				timerEndOffset = 4.9,
				timerStartOffset = -8.1,
				uuid = "ab97d765-9775-f3b4-92a4-02759b817454",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"85380c9a-1d7f-85de-854e-b69f33a35c4f",
									true,
								},
							},
							name = "[Draw] Soul 2 next shape and cleanup",
							uuid = "94cb3472-1a0f-a3e1-88bf-b4926d55eaf3",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44559,
								44560,
								44608,
								45183,
								45184,
								45185,
							},
							uuid = "85380c9a-1d7f-85de-854e-b69f33a35c4f",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 124.1,
				name = "[Draw] Soul 2 next shape and cleanup",
				timeRange = true,
				timelineIndex = 24,
				timerEndOffset = 4.9,
				timerStartOffset = -8.1,
				uuid = "2a7061a3-c1d5-c0aa-b74e-96c4ea6420e9",
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
				name = "Hector helpers",
				uuid = "02fced04-2d58-6687-acc7-fbdf3ea9a2ab",
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
							actionLua = "local base=data.kaptinNecron\nif not base then return end\nif base.gc then self.used=true return end\nlocal N=data.kaptinNecron\nN.gc=(function()\n-- Pure factory: root stores makeGrandCross(N) in its pull-scoped module table.\n-- Native GUI event-ID gates must precede onChannel/onCast/onMarker calls.\n-- Source: necron_hector.md + necron_events.md. No callbacks or polling.\n-- Contract: N.arrow(x,z,durationMs,key), N.clearArrow(key),\n-- N.circle(x,z,radius,durationMs,safe). All destinations stay within radius9.\nlocal function makeGrandCross(N)\n    local M = {}\n    local key = \"grandcross\"\n    local q = math.sqrt(0.5)\n    local directions = {\n        {x=0,z=-1,color=1,kind=\"card\"},\n        {x=q,z=-q,color=2,kind=\"inter\"},\n        {x=1,z=0,color=2,kind=\"card\"},\n        {x=q,z=q,color=3,kind=\"inter\"},\n        {x=0,z=1,color=3,kind=\"card\"},\n        {x=-q,z=q,color=4,kind=\"inter\"},\n        {x=-1,z=0,color=4,kind=\"card\"},\n        {x=-q,z=-q,color=1,kind=\"inter\"},\n    }\n    local colors = {\n        {slots={\"T1\",\"M1\"},card=directions[1],inter=directions[8]},\n        {slots={\"T2\",\"M2\"},card=directions[3],inter=directions[2]},\n        {slots={\"H2\",\"R2\"},card=directions[5],inter=directions[4]},\n        {slots={\"H1\",\"R1\"},card=directions[7],inter=directions[6]},\n    }\n    local colorOf = {T1=1,M1=1,T2=2,M2=2,H2=3,R2=3,H1=4,R1=4}\n    local s = {}\n    local previews = {}\n    local beams = {}\n    local red = TensorCore.getCachedDrawer(0x600000FF,0x600000FF,0x600000FF,0xFF0000FF,2,6)\n    local center = {x=100,y=0,z=100}\n    local forecasts = {}\n\n    local function removeShape(uuid)\n        if uuid then Argus.deleteTimedShape(uuid);N.shapes[uuid]=nil end\n    end\n    local function clearPreviews()\n        for uuid in pairs(previews) do removeShape(uuid) end\n        previews={}\n    end\n    local function removeForecast(source)\n        local f=forecasts[source]\n        if f then removeShape(f.uuid);forecasts[source]=nil end\n    end\n    local function beam(heading,ms,width)\n        center.y=TensorCore.mGetPlayer().pos.y\n        local x,y,z=TensorCore.getPosInDirection(center,heading+math.pi,20,true)\n        local uuid=N.remember(red:addTimedRect(ms,x,y,z,40,width,heading,0,false,true),ms)\n        if uuid then beams[uuid]=true end\n        return uuid\n    end\n\n    local function clearArrow()\n        N.clearArrow(key)\n    end\n\n    local function arrow(x,z,duration)\n        local dx,dz=x-100,z-100\n        if dx*dx+dz*dz > 81.0001 then clearArrow() return end\n        N.arrow(x,z,duration,key)\n    end\n\n    local function myColor()\n        local roster = AnyoneCore and AnyoneCore.Roster\n        if roster == nil or roster.current() == nil then return nil end\n        local slot = roster.mySlot()\n        return colorOf[slot],roster\n    end\n\n    local function clock(kind,radius,duration)\n        local color = myColor()\n        if color == nil then clearArrow() return end\n        local d = colors[color][kind]\n        arrow(100+d.x*radius,100+d.z*radius,duration)\n    end\n\n    local function resetWave()\n        s.markers,s.towers,s.channels,s.resolved = {},{},{},{}\n        s.markerCount,s.resolveCount = 0,0\n        s.previewSignature=nil\n        clearPreviews()\n    end\n\n    function M.clear()\n        clearArrow()\n        for uuid in pairs(beams) do removeShape(uuid) end\n        beams={};forecasts={}\n        s.active=false\n        s.wave,s.lasers,s.puddles=0,0,0\n        s.lastLaser,s.lastPuddle,s.started=nil,nil,nil\n        s.forecastLabelShown=false\n        resetWave()\n    end\n\n    local function begin()\n        M.clear()\n        s.active,s.wave,s.started=true,1,Now()\n        -- Grand Cross raidwide and arena shrink: everyone in center first.\n        arrow(100,100,15000)\n    end\n\n    local function active()\n        if not s.active then return false end\n        if Now()-s.started > 65000 then M.clear() return false end\n        return true\n    end\n\n    local function position(e)\n        -- OnEntityCast ground coordinates are optional. Tower helpers stand\n        -- at the tower location; channel events only supply their entity ID.\n        if type(e.castPosX)==\"number\" and type(e.castPosZ)==\"number\" then\n            return e.castPosX,e.castPosZ\n        end\n        local ent=TensorCore.mGetEntity(e.entityID)\n        if ent == nil then return nil end\n        return ent.pos.x,ent.pos.z\n    end\n\n    local function towerPoint(x,z)\n        if x==nil or z==nil then return nil end\n        local dx,dz=x-100,z-100\n        local radius=math.sqrt(dx*dx+dz*dz)\n        if radius<1 or radius>9.001 then return nil end\n        local best,bestDot\n        for i=1,#directions do\n            local d=directions[i]\n            local dot=(dx*d.x+dz*d.z)/radius\n            if bestDot==nil or dot>bestDot then best,bestDot=d,dot end\n        end\n        -- Fail closed on a position far from a cardinal/intercardinal.\n        if bestDot<0.98 then return nil end\n        return {x=x,z=z,radius=radius,color=best.color,kind=best.kind}\n    end\n\n    local function coordinateKey(x,z)\n        return string.format(\"%.2f:%.2f\",x,z)\n    end\n\n    local function assignment()\n        if s.wave~=1 and s.wave~=2 then return end\n        local needed=s.wave==1 and 2 or 5\n        local color,roster=myColor()\n        if color==nil then clearArrow() return end\n        if s.markerCount~=4 then return end\n        local c=colors[color]\n        local a,b=roster.idOf(c.slots[1]),roster.idOf(c.slots[2])\n        local player=TensorCore.mGetPlayer()\n        if a==nil or b==nil or player==nil then clearArrow() return end\n        -- Exactly one member of each color pair must have the spread.\n        if (s.markers[a]==true)==(s.markers[b]==true) then clearArrow() return end\n        local t=s.towers[color]\n        if type(t)~=\"table\" then return end\n        local duration=t.expiresAt-Now()\n        if duration<=0 then clearArrow() return end\n        local marked=s.markers[player.id]==true\n        local kind=marked and (t.kind==\"card\" and \"inter\" or \"card\") or t.kind\n        local previewRadius=math.min(t.radius,8.5)\n        local previewDirection=c[kind]\n        local signature=tostring(s.wave)..\":\"..tostring(marked)..\":\"..kind\n        if s.previewSignature~=signature then\n            clearPreviews()\n            local uuid=N.circle(100+previewDirection.x*previewRadius,100+previewDirection.z*previewRadius,marked and 0.6 or 3,duration,true)\n            if uuid then previews[uuid]=true end\n            s.previewSignature=signature\n        end\n        -- Show the future assignment immediately, but retain the safe waiting\n        -- arrow until the second/fifth laser has actually resolved.\n        if s.lasers<needed then return end\n        local radius=math.min(t.radius,8.5)\n        if marked then\n            local d=c[t.kind==\"card\" and \"inter\" or \"card\"]\n            arrow(100+d.x*radius,100+d.z*radius,duration)\n        elseif player.id==a or player.id==b then\n            -- Stand slightly in from an edge tower center while still inside\n            -- its3y circle; never point outside the shrunken arena.\n            local d=c[t.kind]\n            arrow(100+d.x*radius,100+d.z*radius,duration)\n        else\n            clearArrow()\n        end\n    end\n\n    function M.onChannel(e)\n        local id=e.spellID\n        if id==44568 then begin() return end\n        if not active() then return end\n        if id==44604 then\n            arrow(100,100,15000)\n        elseif id==44571 then\n            local now=Now()\n            -- Each puddle set has multiple helpers but the next set is2s later.\n            if s.lastPuddle and now-s.lastPuddle<1000 then return end\n            s.lastPuddle=now\n            s.puddles=s.puddles+1\n            if s.wave==1 and s.puddles<=2 then\n                -- Ground AOEs snapshot at cast start. Fan out in two steps.\n                clock(\"inter\",s.puddles==1 and 4 or 8,8000)\n            elseif s.wave==3 and s.puddles>=3 and s.puddles<=4 then\n                clock(\"inter\",s.puddles==3 and 4 or 8,8000)\n            else\n                clearArrow()\n            end\n        elseif id==44573 and (s.wave==1 or s.wave==2) then\n            if type(e.channelTimeMax)~=\"number\" or e.channelTimeMax<=0 then return end\n            local x,z=position(e)\n            local t=towerPoint(x,z)\n            if t==nil then return end\n            t.expiresAt=Now()+e.channelTimeMax*1000\n            local k=coordinateKey(x,z)\n            if s.channels[k] then return end\n            s.channels[k]=true\n            local old=s.towers[t.color]\n            if old==nil then\n                s.towers[t.color]=t\n            elseif type(old)~=\"table\" or math.abs(old.x-x)+math.abs(old.z-z)>0.1 then\n                s.towers[t.color]=false\n            end\n            assignment()\n        end\n    end\n\n    -- Native OnTetherChange GUI gate admits only 343/344.\n    -- Public BossMod predicts +42/+207 degrees; logs corroborate the\n    -- convention but show up to4.51-degree early uncertainty. The actual\n    -- laser channel replaces the forecast with its locked direction.\n    -- The9y-wide preview includes a2.5y lateral uncertainty margin per\n    -- edge within the9y arena. It is intentionally not the4y hitbox.\n    function M.onTether(e)\n        if not active() then return end\n        local ent=TensorCore.mGetEntity(e.sourceEntityID)\n        if not ent then return end\n        local offset=e.newTetherID==344 and 207 or 42\n        local ms=e.newTetherID==344 and 5000 or 7000\n        if not s.forecastLabelShown then\n            TensorCore.addAlertText(2500,\"RED = beam PREVIEW (wide margin)\",1,3,false)\n            s.forecastLabelShown=true\n        end\n        center.y=ent.pos.y\n        local heading=TensorCore.getHeadingToTarget(ent.pos,center)+math.rad(offset)\n        removeForecast(e.sourceEntityID)\n        forecasts[e.sourceEntityID]={uuid=beam(heading,ms+700,9),at=Now()+ms}\n    end\n\n    -- Native OnEntityChannel GUI gate admits only laser44569.\n    function M.onBeamChannel(e)\n        if not active() then return end\n        local source,best\n        for id,f in pairs(forecasts) do\n            local distance=math.abs(f.at-Now())\n            if best==nil or distance<best then source,best=id,distance end\n        end\n        if source and best<=1500 then removeForecast(source) end\n        local ent=TensorCore.mGetEntity(e.entityID)\n        if ent then beam(ent.pos.h,math.max(500,(e.channelTimeMax or 0)*1000+400),4) end\n    end\n\n    function M.onMarker(e)\n        if not active() or (s.wave~=1 and s.wave~=2) then return end\n        if e.markerID==611 and not s.markers[e.entityID] then\n            s.markers[e.entityID]=true\n            s.markerCount=s.markerCount+1\n            assignment()\n        end\n    end\n\n    function M.onCast(e)\n        local id=e.spellID\n        if id==44568 then\n            if not s.active then begin() end\n            return\n        end\n        if not active() then return end\n        if id==44569 then\n            local now=Now()\n            if s.lastLaser and now-s.lastLaser<1000 then return end\n            s.lastLaser=now\n            s.lasers=s.lasers+1\n            if s.lasers==2 or s.lasers==5 then assignment() end\n            if s.lasers>5 then clearArrow() end\n        elseif id==44573 and (s.wave==1 or s.wave==2) then\n            local x,z=position(e)\n            if x==nil then return end\n            local k=coordinateKey(x,z)\n            if not s.channels[k] or s.resolved[k] then return end\n            s.resolved[k]=true\n            s.resolveCount=s.resolveCount+1\n            if s.resolveCount==4 then\n                s.wave=s.wave+1\n                resetWave()\n                if s.wave==2 then\n                    -- After first towers the safe waiting clock is CARDINAL.\n                    clock(\"card\",8,12000)\n                else\n                    -- Rejoin center for the final two bait sets, then fan out.\n                    arrow(100,100,10000)\n                end\n            end\n        elseif id==44570 then\n            -- Proximity has resolved. No new destination until Neutron Ring.\n            clearArrow()\n        elseif id==44574 or id==44576 then\n            M.clear()\n        end\n    end\n\n    return M\nend\n\nreturn makeGrandCross\n\nend)()(N)\nself.used=true",
							name = "[Setup] Grand Cross tower assignments",
							uuid = "21814b6a-56e0-e836-87c6-57b8b5686a86",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Hector helpers",
				mechanicTime = 140.2,
				name = "[Setup] Grand Cross tower assignments",
				timeRange = true,
				timelineIndex = 27,
				timerEndOffset = 759.8,
				timerStartOffset = -160.2,
				uuid = "49a854b9-f9b1-3cd9-890a-a7129269e720",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector draws",
				uuid = "f355fa34-f048-b662-921f-b849ea2ec095",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"a8fed7aa-777c-63d2-a849-57a4883705e9",
									true,
								},
							},
							name = "[Draw] GC1 LJ center stack",
							uuid = "3a378d45-e263-9f26-b2d4-c4d3843c14cc",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44568,
								44604,
							},
							uuid = "a8fed7aa-777c-63d2-a849-57a4883705e9",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 140.2,
				name = "[Draw] GC1 LJ center stack",
				timeRange = true,
				timelineIndex = 27,
				timerEndOffset = 50.8,
				timerStartOffset = -10.2,
				uuid = "f1da9714-c42f-e5bc-9025-8c58c87bb7e4",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"332bb4b3-560f-e6cc-b5e4-3897205e1a72",
									true,
								},
							},
							name = "[Cleanup] GC1 arena reset",
							uuid = "d2a4a40f-e52c-6b07-962e-1d9c6662df70",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44568,
								44574,
								44576,
							},
							uuid = "332bb4b3-560f-e6cc-b5e4-3897205e1a72",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 140.2,
				name = "[Cleanup] GC1 arena reset",
				timeRange = true,
				timelineIndex = 27,
				timerEndOffset = 50.8,
				timerStartOffset = -10.2,
				uuid = "4e498819-41bd-5d85-b013-0097e58138da",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onTether(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"5485ee96-f701-c6a4-aead-9a29b59cc7bd",
									true,
								},
								
								{
									"3d3cbc44-6373-6ae3-b655-3a646d40590b",
									true,
								},
							},
							name = "[Draw] GC 1 red beam forecast",
							uuid = "8fc8f720-ad21-ff80-8485-ec4634629893",
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
							eventArgType = 5,
							eventIntValue = 343,
							name = "Tether minimum",
							uuid = "5485ee96-f701-c6a4-aead-9a29b59cc7bd",
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
							eventIntValue = 344,
							name = "Tether maximum",
							uuid = "3d3cbc44-6373-6ae3-b655-3a646d40590b",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 15,
				loop = true,
				mechanicTime = 140.2,
				name = "[Draw] GC 1 red beam forecast",
				timeRange = true,
				timelineIndex = 27,
				timerEndOffset = 55,
				timerStartOffset = -10,
				uuid = "89064b01-4905-3a43-823c-73ccf2af398e",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onBeamChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"49617098-ba6d-85c2-907d-e050a455f848",
									true,
								},
							},
							name = "[Draw] GC 1 locked red beam",
							uuid = "ac803b3a-d106-353f-b3b6-fe686be7f2cf",
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
							eventSpellID = 44569,
							name = "Laser cast",
							uuid = "49617098-ba6d-85c2-907d-e050a455f848",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 140.2,
				name = "[Draw] GC 1 locked red beam",
				timeRange = true,
				timelineIndex = 27,
				timerEndOffset = 55,
				timerStartOffset = -10,
				uuid = "2c28dd5d-7bcb-19d6-b234-f32a2f9dbcb9",
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
				name = "Hector draws",
				uuid = "e8bc6dfa-1cbf-a004-b744-98c98bf56a57",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"9db71fba-406e-d58c-92b2-21aa21e84742",
									true,
								},
							},
							name = "[Draw] GC1 LJ puddle drops",
							uuid = "6894e949-dd34-f394-a844-734350edb8e7",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44571,
							},
							uuid = "9db71fba-406e-d58c-92b2-21aa21e84742",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 148.3,
				name = "[Draw] GC1 LJ puddle drops",
				timeRange = true,
				timelineIndex = 28,
				timerEndOffset = 42.7,
				timerStartOffset = -18.3,
				uuid = "2c864f94-5c39-658a-bd07-6da114503687",
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
				name = "Hector draws",
				uuid = "78885168-5305-4a76-924a-5d6bc8b5e2ec",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"ac5a3356-5128-87da-ad5e-ec9f2f2965c7",
									true,
								},
							},
							name = "[Draw] GC1 safe stack after lasers",
							uuid = "13175ae9-e713-2059-b213-34dc2bd7cff6",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44569,
								44570,
							},
							uuid = "ac5a3356-5128-87da-ad5e-ec9f2f2965c7",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 150.7,
				name = "[Draw] GC1 safe stack after lasers",
				timeRange = true,
				timelineIndex = 30,
				timerEndOffset = 40.3,
				timerStartOffset = -20.7,
				uuid = "98a69233-d5f3-eefe-948f-a227dfb1171d",
				version = 2,
			},
		},
	},
	[32] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector draws",
				uuid = "672cc47f-206f-be20-bf46-686f4059171d",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"8b3ad7b2-5c8a-6777-a1bf-c5996cb7788e",
									true,
								},
							},
							name = "[Draw] GC1 assigned tower or spread",
							uuid = "0534bd83-66c9-0e8c-b2a8-23b65ca015fb",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44573,
							},
							uuid = "8b3ad7b2-5c8a-6777-a1bf-c5996cb7788e",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 154.3,
				name = "[Draw] GC1 assigned tower or spread",
				timeRange = true,
				timelineIndex = 32,
				timerEndOffset = 36.7,
				timerStartOffset = -24.3,
				uuid = "ea95f8a5-8842-aeb5-a635-a1446ba5cf02",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onMarker(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"dd39bc0d-8595-67b8-b186-db02307a6c99",
									true,
								},
							},
							name = "[Draw] GC1 mark tower or spread",
							uuid = "686b3714-9fdd-4d03-9789-2a93eb141020",
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
							eventArgType = 3,
							markerIDList = 
							{
								611,
							},
							name = "Mechanic markers",
							uuid = "dd39bc0d-8595-67b8-b186-db02307a6c99",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 4,
				loop = true,
				mechanicTime = 154.3,
				name = "[Draw] GC1 mark tower or spread",
				timeRange = true,
				timelineIndex = 32,
				timerEndOffset = 36.7,
				timerStartOffset = -24.3,
				uuid = "dc8a12f6-17e2-fcb9-bee6-55ec4183309e",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"51fb36a1-3dce-a568-a700-0ca06e06692b",
									true,
								},
							},
							name = "[Draw] GC1 next tower wave",
							uuid = "87525a2c-743f-debd-939e-19e0f489c43c",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44573,
							},
							uuid = "51fb36a1-3dce-a568-a700-0ca06e06692b",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 154.3,
				name = "[Draw] GC1 next tower wave",
				timeRange = true,
				timelineIndex = 32,
				timerEndOffset = 36.7,
				timerStartOffset = -24.3,
				uuid = "228a5073-6084-2af4-a302-59fc0ec3ef0d",
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
				name = "Hector helpers",
				uuid = "2a61e615-3a84-26d6-858a-f615e3a857d6",
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
							actionLua = "local base=data.kaptinNecron\nif not base then return end\nif base.specter then self.used=true return end\n-- Focused module for the Necron Hector drawing profile.\n-- Initialized once per pull by its own setup reaction.\nlocal N=data.kaptinNecron\nlocal M={}\nN.specter=M\nlocal position=N.position\nlocal danger=TensorCore.getMoogleDrawer(6)\n\nlocal function specterRow(z)\n    return z<99 and 90 or (z>101 and 110 or 100)\nend\n\n-- Circle helpers have overlapping seven-second casts. Keep the current orb\n-- until its actual effect arrives; a later cast must never replace it early.\nlocal circleOffsets={0,-2.4,2.4}\nlocal function pruneSpectral()\n    local now=Now()\n    for key,row in pairs(N.spectral) do\n        if now>=row.untilAt then N.spectral[key]=nil end\n    end\nend\nfunction M.circleGuide()\n    local first,firstID\n    for id,cast in pairs(N.circleCasts) do\n        if not first or cast.untilAt<first.untilAt then first,firstID=cast,id end\n    end\n    if not first or first.untilAt<=Now() then\n        M.circleGuideKey=nil;N.clearArrow(\"circle\");return\n    end\n    local p=TensorCore.mGetPlayer()\n    local targetZ\n    -- A 2.4y offset remains inside the verified 3y donut safe area. This\n    -- supports the partial-circle safe portion during later overlapping hands.\n    for _,offset in ipairs(circleOffsets) do\n        local z=first.z+offset\n        local safe=z>=85.6 and z<=114.4 and first.x>=82.6 and first.x<=117.4\n        if safe then\n            for _,row in pairs(N.spectral) do\n                if Now()<row.untilAt then\n                    if math.abs(z-row.z)<5.4 then safe=false;break end\n                    -- Do not point through a still-active full-width hand row.\n                    if (p.pos.z<row.z-5 and z>row.z+5)\n                        or (p.pos.z>row.z+5 and z<row.z-5) then safe=false;break end\n                end\n            end\n        end\n        if safe then targetZ=z;break end\n    end\n    if not targetZ then M.circleGuideKey=nil;N.clearArrow(\"circle\");return end\n    if M.circleGuideKey~=firstID or not N.arrows.circle or N.arrows.circle.z~=targetZ then\n        M.circleGuideKey=firstID\n        N.arrow(first.x,targetZ,first.untilAt-Now(),\"circle\")\n    end\nend\n\nfunction M.onChannel(e)\n    local id=e.spellID\n    local ent=TensorCore.mGetEntity(e.entityID)\n    if id==44606 then\n        -- The first Specter cast is the P2 opening Embrace sequence. Later\n        -- Specters belong to Circle of Lives and must not issue hand-grid arrows.\n        N.p2Opening=not N.phase2Seen\n        N.phase2Seen=true\n        -- The later Circle set starts its next Specter while the previous\n        -- hand is still casting. A new boss cast cannot clear that hazard.\n        pruneSpectral()\n        if N.p2Opening then N.oldHands={} end\n    elseif id==44818 and ent then\n        N.rect(ent.pos.x,ent.pos.z,36,10,ent.pos.h,e.channelTimeMax*1000)\n        local row=specterRow(ent.pos.z)\n        -- The helper's native cast confirms its row and remaining lifetime.\n        N.spectral[\"cast_\"..tostring(e.entityID)]={z=row,untilAt=Now()+e.channelTimeMax*1000+700}\n        M.circleGuide()\n    elseif id==44600 and ent then\n        N.remember(danger:addTimedDonutOnEnt(e.channelTimeMax*1000,ent.id,3,50,0,false,true),e.channelTimeMax*1000)\n        N.circleCasts[e.entityID]={x=ent.pos.x,z=ent.pos.z,untilAt=Now()+e.channelTimeMax*1000}\n        M.circleGuide()\n    end\nend\nfunction M.onCast(e)\n    local id=e.spellID\n    if id==44818 then\n        -- Resolve only this observed helper. A later hand can already be\n        -- predicted in the same row, so clearing the whole row is unsafe.\n        N.spectral[\"cast_\"..tostring(e.entityID)]=nil\n        pruneSpectral()\n        M.circleGuide()\n    elseif id==44600 then\n        -- Only this caster resolved; the next orb may already be casting.\n        N.circleCasts[e.entityID]=nil\n        M.circleGuideKey=nil\n        N.clearArrow(\"circle\")\n        M.circleGuide()\n    end\nend\nfunction M.onTether(e)\n    if e.newTetherID~=102 then return end\n    N.defer(\"specter\"..e.sourceEntityID,350,function()\n        local ent=TensorCore.mGetEntity(e.sourceEntityID);if not ent then return end\n        local row=specterRow(ent.pos.z)\n        N.spectral[e.sourceEntityID]={z=row,untilAt=Now()+11750}\n        M.circleGuide()\n        if not N.p2Opening then return end\n        local blocked={};for _,v in pairs(N.spectral) do if Now()<v.untilAt then blocked[v.z]=true end end\n        local count=0;for _ in pairs(blocked) do count=count+1 end\n        if count~=2 then return end\n        local safe\n        for _,z in ipairs({90,100,110}) do if not blocked[z] then safe=z end end\n        local slot=N.slot();local rowName,index\n        if slot then rowName,index=N.strategy.handAssignment(slot) end\n        if not safe or not rowName then return end\n        local x=({85,95,105,115})[index]\n        local z=safe+(rowName==\"north\" and -3.2 or 3.2)\n        N.oldHands[slot]={x=x,z=z}\n        N.arrow(x,z,11000,\"embrace\")\n    end)\nend\n\nfunction M.clear() N.spectral={};N.circleCasts={};M.circleGuideKey=nil;N.phase2Seen=nil;N.p2Opening=nil end\n\nself.used=true",
							name = "[Setup] Specter and orb positions",
							uuid = "2443b931-87fe-4fae-acf2-2ad4ef334792",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Hector helpers",
				mechanicTime = 321,
				name = "[Setup] Specter and orb positions",
				timeRange = true,
				timelineIndex = 56,
				timerEndOffset = 579,
				timerStartOffset = -341,
				uuid = "7c4e4b63-60cf-eb06-8b63-5ccf61c16181",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector draws",
				uuid = "8987d9c3-cb6b-98c3-be7b-cd2015c391bb",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.specter then return end\nN.specter.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"d087b10a-9955-4168-8cb3-4e49db86a86b",
									true,
								},
							},
							name = "[Draw] Specter 1 hand lanes",
							uuid = "39678221-7a13-a388-9426-39a5401cc7b9",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44606,
								44818,
							},
							uuid = "d087b10a-9955-4168-8cb3-4e49db86a86b",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 321,
				name = "[Draw] Specter 1 hand lanes",
				timeRange = true,
				timelineIndex = 56,
				timerEndOffset = 21,
				timerStartOffset = -23,
				uuid = "4b3efbe1-6351-1e1c-aee1-152abab8de79",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.specter then return end\nN.specter.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"4f88ddc6-c46a-79cb-8b3b-0bc409fd13ab",
									true,
								},
							},
							name = "[Draw] Specter 1 update safe row",
							uuid = "52fd30b8-da3d-77f8-933f-6c39fd01246e",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44818,
							},
							uuid = "4f88ddc6-c46a-79cb-8b3b-0bc409fd13ab",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 321,
				name = "[Draw] Specter 1 update safe row",
				timeRange = true,
				timelineIndex = 56,
				timerEndOffset = 21,
				timerStartOffset = -23,
				uuid = "dc505d03-9667-7f60-a8fa-8f36e1e89fa1",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.specter then return end\nN.specter.onTether(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"41e7e6a4-44dc-4eeb-857f-32f8ca6aaca1",
									true,
								},
							},
							name = "[Draw] Specter 1 assigned safe row",
							uuid = "b85cabd8-283a-f6bc-9167-d0870252c828",
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
							comparator = 3,
							dequeueIfLuaFalse = true,
							eventArgType = 5,
							eventIntValue = 102,
							name = "Specter tether 102",
							uuid = "41e7e6a4-44dc-4eeb-857f-32f8ca6aaca1",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 15,
				loop = true,
				mechanicTime = 321,
				name = "[Draw] Specter 1 assigned safe row",
				timeRange = true,
				timelineIndex = 56,
				timerEndOffset = 21,
				timerStartOffset = -23,
				uuid = "f4c708d6-ba28-37a1-b69d-4ba4632368d6",
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
				name = "Hector draws",
				uuid = "9c5fb853-4090-26eb-86f0-f7f7681b6fa9",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.hands then return end\nN.hands.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"84f7898c-5135-bc9c-9012-ca555b8445e0",
									true,
								},
							},
							name = "[Draw] Embrace 2 LJ hand bait",
							uuid = "866721ab-fde2-fe0d-837b-b75b1c6b97a4",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44567,
								44597,
							},
							uuid = "84f7898c-5135-bc9c-9012-ca555b8445e0",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 329.1,
				name = "[Draw] Embrace 2 LJ hand bait",
				timeRange = true,
				timelineIndex = 57,
				timerEndOffset = 12.9,
				timerStartOffset = -15.1,
				uuid = "a6945e38-df80-8b24-ad95-7c4f5ca72158",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.hands then return end\nN.hands.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"fb735198-3653-2f95-8a9e-48dff182704a",
									true,
								},
							},
							name = "[Draw] Embrace 2 post-drop bait",
							uuid = "72a2920f-159c-a85d-860c-4e05e6a0b595",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44598,
							},
							uuid = "fb735198-3653-2f95-8a9e-48dff182704a",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 329.1,
				name = "[Draw] Embrace 2 post-drop bait",
				timeRange = true,
				timelineIndex = 57,
				timerEndOffset = 12.9,
				timerStartOffset = -15.1,
				uuid = "2d708c02-28fa-1fe6-92e3-b106378d4217",
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
							actionLua = "local N=data.kaptinNecron\nif not N then return end\nif eventArgs.entityID==TensorCore.mGetPlayer().id then\n    local slot=N.slot();local hand=slot and N.oldHands[slot]\n    if hand then N.arrow(hand.x,hand.z,4100,\"embrace\") end\nend\nself.used=true",
							conditions = 
							{
								
								{
									"6b4e98cf-cc76-d4d1-a22d-fc8a1a7cf83c",
									true,
								},
							},
							name = "[Draw] Embrace 2 marked drop",
							uuid = "972d6614-8ce7-2761-aa69-7e9a184c1d4b",
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
							eventArgType = 3,
							markerIDList = 
							{
								614,
							},
							name = "Mechanic markers",
							uuid = "6b4e98cf-cc76-d4d1-a22d-fc8a1a7cf83c",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 4,
				loop = true,
				mechanicTime = 329.1,
				name = "[Draw] Embrace 2 marked drop",
				timeRange = true,
				timelineIndex = 57,
				timerEndOffset = 12.9,
				timerStartOffset = -15.1,
				uuid = "849a214f-318c-9c98-bf9d-2e5a89cbd278",
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
				name = "Hector draws",
				uuid = "05814c21-506b-2b15-ba3f-7aeb69cfb254",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.cold then return end\nN.cold.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"8bd3ded0-d5ad-881b-80a2-7d5c2595d919",
									true,
								},
							},
							name = "[Draw] Cold Grip 2 seam and lines",
							uuid = "785dff3b-46fe-8acf-a415-93b76a375b01",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44553,
								44554,
								44555,
								44567,
								44612,
							},
							uuid = "8bd3ded0-d5ad-881b-80a2-7d5c2595d919",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 337.1,
				name = "[Draw] Cold Grip 2 seam and lines",
				timeRange = true,
				timelineIndex = 59,
				timerEndOffset = 4.9,
				timerStartOffset = -9.1,
				uuid = "ecf3fd79-8ccd-889d-b7bb-6400e2d09a0a",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.cold then return end\nN.cold.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"d2e2c72e-6e6a-7783-90be-5613113e7f2f",
									true,
								},
							},
							name = "[Draw] Cold Grip 2 LJ final side",
							uuid = "9190c922-b113-f8a5-9eb6-7fdbfedcd42a",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44555,
								44612,
							},
							uuid = "d2e2c72e-6e6a-7783-90be-5613113e7f2f",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 337.1,
				name = "[Draw] Cold Grip 2 LJ final side",
				timeRange = true,
				timelineIndex = 59,
				timerEndOffset = 4.9,
				timerStartOffset = -9.1,
				uuid = "f736cc87-e324-3d9a-a8ed-fe36361ec498",
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
				name = "Hector draws",
				uuid = "784e48d1-738a-7208-b4a2-26605a9c35e4",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"8ae65cfa-73fc-05fe-90e9-e018a5fbcb1c",
									true,
								},
							},
							name = "[Setup] Relentless 1 stored shapes",
							uuid = "8c1d1538-6aa2-d11e-9651-7257dcede5ca",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44564,
							},
							uuid = "8ae65cfa-73fc-05fe-90e9-e018a5fbcb1c",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 360.5,
				name = "[Setup] Relentless 1 stored shapes",
				timeRange = true,
				timelineIndex = 61,
				timerEndOffset = 2.5,
				timerStartOffset = -18.5,
				uuid = "b788e14a-958f-e966-bc17-ab12c391bf79",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onMarker(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"2d432f6f-3fa5-096c-910e-5f0754221896",
									true,
								},
							},
							name = "[Setup] Relentless 1 shape markers",
							uuid = "809ae530-3463-c45a-a2d3-6ef062928a6c",
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
							eventArgType = 3,
							markerIDList = 
							{
								604,
								605,
								606,
								607,
							},
							name = "Mechanic markers",
							uuid = "2d432f6f-3fa5-096c-910e-5f0754221896",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 4,
				loop = true,
				mechanicTime = 360.5,
				name = "[Setup] Relentless 1 shape markers",
				timeRange = true,
				timelineIndex = 61,
				timerEndOffset = 2.5,
				timerStartOffset = -18.5,
				uuid = "e66112c8-6939-bc59-89e0-2ecc500e6c41",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onTether(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"cfc88cf3-9d38-0721-9b22-cab00442229c",
									true,
								},
								
								{
									"b232b9b1-50c2-441e-8e0e-3c7b44a845c0",
									true,
								},
							},
							name = "[Setup] Relentless 1 rotation actors",
							uuid = "3f03a845-0e1a-05e1-b755-041fd7967139",
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
							eventArgType = 5,
							eventIntValue = 347,
							name = "Tether minimum",
							uuid = "cfc88cf3-9d38-0721-9b22-cab00442229c",
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
							eventIntValue = 350,
							name = "Tether maximum",
							uuid = "b232b9b1-50c2-441e-8e0e-3c7b44a845c0",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 15,
				loop = true,
				mechanicTime = 360.5,
				name = "[Setup] Relentless 1 rotation actors",
				timeRange = true,
				timelineIndex = 61,
				timerEndOffset = 18,
				timerStartOffset = -20,
				uuid = "a86fab2b-e6f1-994b-92a7-3caefb87cf5d",
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
				name = "Hector draws",
				uuid = "1b4d3a90-0d58-73ac-860a-b8f9d5739379",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"5dc1ee3e-d0ea-48e8-a700-737853bb1249",
									true,
								},
							},
							name = "[Draw] Relentless 1 in-out and pairs-stack",
							uuid = "d367efc5-2948-0828-bfc7-31d18e1c1a56",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44608,
								45167,
								45168,
								45183,
								45184,
								45185,
							},
							uuid = "5dc1ee3e-d0ea-48e8-a700-737853bb1249",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 377.7,
				name = "[Draw] Relentless 1 in-out and pairs-stack",
				timeRange = true,
				timelineIndex = 63,
				timerEndOffset = 15.3,
				timerStartOffset = -10.7,
				uuid = "c9aaa459-9c26-cf37-b671-13904036224d",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"9d2d59de-04c9-d1bc-b245-8d1b33885c08",
									true,
								},
							},
							name = "[Draw] Relentless 1 next shape and cleanup",
							uuid = "8577843a-297c-2335-a757-d621436cbdd4",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44559,
								44560,
								44608,
								45183,
								45184,
								45185,
							},
							uuid = "9d2d59de-04c9-d1bc-b245-8d1b33885c08",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 377.7,
				name = "[Draw] Relentless 1 next shape and cleanup",
				timeRange = true,
				timelineIndex = 63,
				timerEndOffset = 15.3,
				timerStartOffset = -10.7,
				uuid = "72af263d-fdd0-a77a-b2a9-b23a9af1d25a",
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
				name = "Hector draws",
				uuid = "261b4555-07c5-5be9-8530-e2108e7fb370",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.specter then return end\nN.specter.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"c61ed7ea-cd58-2f5d-9dc6-60f08fc3c8d0",
									true,
								},
							},
							name = "[Draw] Circles 1 donut and LJ safe orb",
							uuid = "297da835-5b71-d7dd-a668-d2d6c12c9c2d",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44600,
							},
							uuid = "c61ed7ea-cd58-2f5d-9dc6-60f08fc3c8d0",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 398.5,
				name = "[Draw] Circles 1 donut and LJ safe orb",
				timeRange = true,
				timelineIndex = 69,
				timerEndOffset = 40.5,
				timerStartOffset = -8.5,
				uuid = "0f68eb87-91f9-d77c-bdd7-c0cfa20a008d",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.specter then return end\nN.specter.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"f1ac6f18-9ec5-5e04-b445-dbd8d5ea16a2",
									true,
								},
							},
							name = "[Draw] Circles 1 next unresolved orb",
							uuid = "d49f9772-6ee4-873c-b2f1-1ba3b38083cf",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44600,
							},
							uuid = "f1ac6f18-9ec5-5e04-b445-dbd8d5ea16a2",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 398.5,
				name = "[Draw] Circles 1 next unresolved orb",
				timeRange = true,
				timelineIndex = 69,
				timerEndOffset = 40.5,
				timerStartOffset = -8.5,
				uuid = "bce14b97-f675-17c4-9c20-4d1cc1dbf7af",
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
				name = "Hector draws",
				uuid = "102cc15c-1d36-5777-b194-ea7fcf943174",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.specter then return end\nN.specter.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"863d03a8-16d5-7044-9f88-69333f1bcd78",
									true,
								},
							},
							name = "[Draw] Specter 2 hand lanes",
							uuid = "cb6937c7-3fc1-7fa3-a882-7392d2bfa894",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44606,
								44818,
							},
							uuid = "863d03a8-16d5-7044-9f88-69333f1bcd78",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 409.2,
				name = "[Draw] Specter 2 hand lanes",
				timeRange = true,
				timelineIndex = 71,
				timerEndOffset = 29.8,
				timerStartOffset = -19.2,
				uuid = "1cf0b290-16c2-9f13-94df-75af7793e8ad",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.specter then return end\nN.specter.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"7c40b273-6c8f-712a-9901-47b87c106bed",
									true,
								},
							},
							name = "[Draw] Specter 2 update safe row",
							uuid = "fec97f47-52ee-0821-a165-9dbe66942282",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44818,
							},
							uuid = "7c40b273-6c8f-712a-9901-47b87c106bed",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 409.2,
				name = "[Draw] Specter 2 update safe row",
				timeRange = true,
				timelineIndex = 71,
				timerEndOffset = 29.8,
				timerStartOffset = -19.2,
				uuid = "ac422125-1b8b-df4d-9048-bed98115b16f",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.specter then return end\nN.specter.onTether(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"7f27cc96-bdb5-307b-9934-d171a696a59d",
									true,
								},
							},
							name = "[Draw] Specter 2 assigned safe row",
							uuid = "0d1b2202-c179-498e-a3d0-2858884729d1",
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
							comparator = 3,
							dequeueIfLuaFalse = true,
							eventArgType = 5,
							eventIntValue = 102,
							name = "Specter tether 102",
							uuid = "7f27cc96-bdb5-307b-9934-d171a696a59d",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 15,
				loop = true,
				mechanicTime = 409.2,
				name = "[Draw] Specter 2 assigned safe row",
				timeRange = true,
				timelineIndex = 71,
				timerEndOffset = 29.8,
				timerStartOffset = -19.2,
				uuid = "5d6f5b9c-4996-76c9-8924-97f924190da2",
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
				name = "Hector draws",
				uuid = "794ea593-01f4-e5a0-94df-3823da753e11",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"e151e539-4afa-0f25-a027-e782c909f3b5",
									true,
								},
							},
							name = "[Setup] Soul P2 stored shapes",
							uuid = "87f365e3-0543-2905-a02a-aeb89a873213",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44556,
							},
							uuid = "e151e539-4afa-0f25-a027-e782c909f3b5",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 419.8,
				name = "[Setup] Soul P2 stored shapes",
				timeRange = true,
				timelineIndex = 74,
				timerEndOffset = 4.2,
				timerStartOffset = -7.8,
				uuid = "77cbf111-4d93-94fd-84c0-2d53039422ea",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onMarker(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"2927ca13-1109-5c3f-b4e1-6a464f0ffd41",
									true,
								},
							},
							name = "[Setup] Soul P2 shape markers",
							uuid = "a437b446-317a-c459-b331-a8013c571fd9",
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
							eventArgType = 3,
							markerIDList = 
							{
								604,
								605,
								606,
								607,
							},
							name = "Mechanic markers",
							uuid = "2927ca13-1109-5c3f-b4e1-6a464f0ffd41",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 4,
				loop = true,
				mechanicTime = 419.8,
				name = "[Setup] Soul P2 shape markers",
				timeRange = true,
				timelineIndex = 74,
				timerEndOffset = 4.2,
				timerStartOffset = -7.8,
				uuid = "86d3addb-39e0-ffa7-b910-0ed4f2b783f0",
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
				name = "Hector draws",
				uuid = "faa7b2df-15c2-70dc-b39f-36e2ce8828ac",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"a08dd01e-49b9-5349-a835-58c170e7b87f",
									true,
								},
							},
							name = "[Draw] Soul P2 in-out and pairs-stack",
							uuid = "31be8d96-7178-eb30-949a-23191fee0d03",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44557,
								44558,
								44608,
								45183,
								45184,
								45185,
							},
							uuid = "a08dd01e-49b9-5349-a835-58c170e7b87f",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 434,
				name = "[Draw] Soul P2 in-out and pairs-stack",
				timeRange = true,
				timelineIndex = 77,
				timerEndOffset = 6,
				timerStartOffset = -8,
				uuid = "8e6df61a-8026-6dce-992b-73aabc270e35",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"ae420eb8-c264-6653-a7e4-6b0d0eafa982",
									true,
								},
							},
							name = "[Draw] Soul P2 next shape and cleanup",
							uuid = "1a67032c-0cab-cac1-8690-26535b5a86b1",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44559,
								44560,
								44608,
								45183,
								45184,
								45185,
							},
							uuid = "ae420eb8-c264-6653-a7e4-6b0d0eafa982",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 434,
				name = "[Draw] Soul P2 next shape and cleanup",
				timeRange = true,
				timelineIndex = 77,
				timerEndOffset = 6,
				timerStartOffset = -8,
				uuid = "4938f941-ad29-a168-af69-b8dc962da1cd",
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
				name = "Hector helpers",
				uuid = "0ce4b2e7-b7f1-0917-a813-ee33315a5d6c",
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
							actionLua = "local base=data.kaptinNecron\nif not base then return end\nif base.mass then self.used=true return end\n-- Focused module for the Necron Hector drawing profile.\n-- Initialized once per pull by its own setup reaction.\nlocal N=data.kaptinNecron\nlocal M={}\nN.mass=M\nlocal position,wasHit=N.position,N.wasHit\n\nlocal portals={\n    four_n={x=100,z=94},four_s={x=100,z=106},\n    two_wn={x=85,z=97},two_en={x=115,z=97},two_ws={x=85,z=103},two_es={x=115,z=103},\n    three_nw={x=91,z=88},three_ne={x=109,z=88},three_sw={x=91,z=112},three_se={x=109,z=112},\n    corner_nw={x=83,z=86},corner_ne={x=117,z=86}\n}\nlocal highlighted,highlightKey,highlightUntil\nlocal function clearHighlight()\n    if highlighted then Argus.deleteTimedShape(highlighted);N.shapes[highlighted]=nil end\n    highlighted,highlightKey,highlightUntil=nil,nil,nil\nend\nlocal function showTower(key)\n    local t=key and portals[key]\n    if not t or key:sub(1,7)==\"corner_\" then clearHighlight();return end\n    if highlightKey==key and highlighted and Now()<highlightUntil then return end\n    clearHighlight()\n    highlighted=N.circle(t.x,t.z,3,30000,true)\n    highlightKey,highlightUntil=key,Now()+30000\nend\nlocal function handDestination(slot)\n    local state=N.mm\n    if not state or state.handsResolved or not state.handRows or state.handCount~=5 then return nil end\n    local route=N.strategy.massRoute(slot)\n    if not route then return nil end\n    -- Early actor collection is only a forecast. Finish the two-player tower\n    -- first unless the real hand cast has already begun.\n    if not state.completed[route[2]] and not state.handsCasting then return nil end\n    local two=portals[route[2]]\n    local side=two.x<100 and \"west\" or \"east\"\n    local rows=state.handRows[side]\n    if state.handGoalSlot==slot then return state.handGoalX,state.handGoalZ end\n    local bestX,bestZ,score\n    local xMin,xMax=side==\"west\" and 85.5 or 107.5,side==\"west\" and 92.5 or 114.5\n    -- Stay outside the12-wide middle line, every3y tower, and all observed\n    -- hand rectangles. Missing edge lanes can contain a3-player tower;\n    -- never use a fixedx that would send a vulnerable player into it.\n    for x=xMin,xMax,0.5 do\n        for z=85.6,114.4,0.2 do\n            local safe=true\n            for _,row in ipairs(rows) do if math.abs(z-row)<3.4 then safe=false;break end end\n            if safe then\n                for portalKey,portal in pairs(portals) do\n                    if portalKey:sub(1,7)~=\"corner_\" and (x-portal.x)^2+(z-portal.z)^2<3.4^2 then\n                        safe=false;break\n                    end\n                end\n            end\n            if safe then\n                local distance=(x-two.x)^2+(z-two.z)^2\n                if not score or distance<score then bestX,bestZ,score=x,z,distance end\n            end\n        end\n    end\n    state.handGoalSlot,state.handGoalX,state.handGoalZ=slot,bestX,bestZ\n    return bestX,bestZ\nend\nfunction M.guide()\n    if not N.mm or not N.mm.active then return end\n    local slot=N.slot()\n    local p=TensorCore.mGetPlayer()\n    if not slot or not p or not p.alive then\n        N.mm.lastKey=nil;N.clearArrow(\"mass\");clearHighlight();return\n    end\n    local vuln=TensorCore.getBuff(p.id,2941)\n    local canSoak=vuln==nil\n    if N.mm.awaitVulnUntil then\n        if Now()>=N.mm.awaitVulnUntil and vuln==nil then N.mm.awaitVulnUntil=nil\n        else canSoak=false end\n    end\n    local key,_,stage=N.strategy.massTarget(slot,N.mm,canSoak)\n    local route=N.strategy.massRoute(slot)\n    local waiting=key and key:sub(1,5)==\"hold_\"\n    local towerKey=waiting and key:sub(6) or key\n    -- Preserve the next tower independently of the movement arrow. While\n    -- dodging hands, non-tanks can already see their following 3-person tower.\n    if stage==\"hands\" then towerKey=route[3] end\n    local hx,hz=handDestination(slot)\n    local x,z\n    if hx then\n        x,z=hx,hz\n        key=\"hands_\"..tostring(hx)..\":\"..string.format(\"%.1f\",hz)\n        stage=\"hands\"\n    elseif key and portals[towerKey] then\n        local t=portals[towerKey]\n        x,z=t.x,t.z\n        if waiting then\n            -- Towers are 3y circles. The 3.8y offset leaves the waiting\n            -- destination and its 0.6y marker outside the tower footprint.\n            if towerKey:sub(1,4)==\"two_\" then x=x+(x<100 and 3.8 or -3.8)\n            else z=z+(z<100 and 3.8 or -3.8) end\n        elseif towerKey==\"three_se\" then x=x-1.25 end\n        if stage==\"hands\" then x,z=nil,nil end\n    end\n    showTower(towerKey)\n    if key==N.mm.lastKey and ((x and N.arrows.mass) or not x) then return end\n    N.mm.lastKey=key\n    N.clearArrow(\"mass\")\n    if not x then return end\n    N.arrow(x,z,stage==\"hands\" and 6000 or 15000,\"mass\")\n    if waiting and stage~=\"hands\" then\n        TensorCore.addAlertText(4000,\"WAIT OUTSIDE - enter highlighted tower when vulnerability ends\",1,2,false)\n    end\nend\n\nlocal function recordHand(e,casting)\n    local state=N.mm\n    if not state or not state.active or state.handsResolved then return end\n    local ent=TensorCore.mGetEntity(e.entityID)\n    if not ent then return end\n    local tx,_,tz=TensorCore.getPosInDirection(ent.pos,ent.pos.h,24,true)\n    if math.abs(tx-ent.pos.x)<20 or math.abs(tz-ent.pos.z)>2 then return end\n    local side=tx<ent.pos.x and \"west\" or \"east\"\n    local old=state.handSeen[e.entityID]\n    local changed=not old or old.side~=side or old.z~=ent.pos.z\n    if changed then\n        if not old then old={};state.handSeen[e.entityID]=old;state.handCount=state.handCount+1 end\n        old.side,old.z=side,ent.pos.z\n        for k in pairs(state.handRows.west) do state.handRows.west[k]=nil end\n        for k in pairs(state.handRows.east) do state.handRows.east[k]=nil end\n        for _,hand in pairs(state.handSeen) do\n            local rows=state.handRows[hand.side];rows[#rows+1]=hand.z\n        end\n        state.handGoalSlot=nil;state.handGoalX=nil;state.handGoalZ=nil\n    end\n    if casting then state.handsCasting=true end\n    if state.handCount==5 and (changed or casting) then state.lastKey=nil;M.guide() end\nend\nfunction M.onHandAdd(e)\n    if Argus.getEntityModel(e.entityID)==18700 then recordHand(e,false) end\nend\n\nfunction M.onHandChannel(e)\n    recordHand(e,true)\nend\n\nfunction M.onChannel(e)\n    local id=e.spellID\n    local ent=TensorCore.mGetEntity(e.entityID)\n    if id==44595 then\n        clearHighlight();N.clearArrow(\"mass\")\n        N.mm=N.strategy.newMassState();N.mm.started=Now()\n        N.mm.handRows={west={},east={}};N.mm.handSeen={};N.mm.handCount=0\n        N.mm.personalHits={}\n        M.guide()\n    end\nend\nfunction M.onCast(e)\n    local id=e.spellID\n    if id==44567 then\n        -- Smite follows the hand snapshot by about one second. Keep the\n        -- assigned spread position visible through the Smite damage event.\n        if N.mm and N.mm.active then\n            N.defer(\"mass_hands\",250,function()\n                N.strategy.massEvent(N.mm,\"memento_hands_resolved\");N.mm.lastKey=nil;M.guide()\n            end)\n        end\n    elseif id==44819 and N.mm and N.mm.active then\n        local pos=position(e);local player=TensorCore.mGetPlayer()\n        if pos then\n            for key,p in pairs(portals) do\n                if key:sub(1,7)~=\"corner_\" and (p.x-pos.x)^2+(p.z-pos.z)^2<1 then\n                    -- A tower is consumed for everyone, regardless of whether\n                    -- the local player appears in this packet's target list.\n                    local fresh=not N.mm.completed[key]\n                    local personal=player and wasHit(e,player.id) and not N.mm.personalHits[key]\n                    if fresh then N.strategy.massEvent(N.mm,\"portal_resolved\",key) end\n                    if personal then N.mm.personalHits[key]=true end\n                    local assigned=false\n                    local route=N.strategy.massRoute(N.slot())\n                    if route then\n                        for _,portalKey in ipairs(route) do\n                            if portalKey==key then assigned=true;break end\n                        end\n                    end\n                    if personal or (fresh and assigned) then\n                        -- Observed status packets arrived up to 0.78s after the\n                        -- hit. Give them 1s to arrive, then gate on the live buff.\n                        N.mm.awaitVulnUntil=Now()+1000\n                    end\n                    if fresh or personal then\n                        N.mm.lastKey=nil\n                        N.clearArrow(\"mass\");M.guide()\n                    end\n                    break\n                end\n            end\n        end\n    elseif id==44593 and N.mm and N.mm.active then\n        if not N.mm.lastBuster or Now()-N.mm.lastBuster>1000 then\n            N.mm.lastBuster=Now()\n            local event=N.mm.firstBuster and \"second_buster_resolved\" or \"first_buster_resolved\"\n            N.strategy.massEvent(N.mm,event);N.mm.lastKey=nil\n            if N.mm.secondBuster then N.defer(\"mass_end\",20000,function()N.mm.active=false;N.clearArrow(\"mass\");clearHighlight()end) end\n        end\n    elseif id==44596 and N.mm then N.mm.active=false;N.clearArrow(\"mass\");clearHighlight()\n    end\nend\n\nfunction M.clear() N.mm=nil;N.clearArrow(\"mass\");clearHighlight() end\n\nself.used=true",
							name = "[Setup] Mass Macabre tower route",
							uuid = "5938a886-2a1a-4c9d-aa48-dc1dc47c9d28",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Hector helpers",
				mechanicTime = 447.1,
				name = "[Setup] Mass Macabre tower route",
				timeRange = true,
				timelineIndex = 80,
				timerEndOffset = 452.9,
				timerStartOffset = -467.1,
				uuid = "fd8071bc-58a5-e7c3-862f-3f743eaeaf62",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector draws",
				uuid = "6371be3c-c1e7-3cb5-ae82-68e7665bebac",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.mass then return end\nN.mass.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"9afce4c5-66d5-f449-977d-54497e5a15c6",
									true,
								},
							},
							name = "[Draw] Mass Macabre LJ first tower",
							uuid = "19f2c1da-2f4f-7b22-b218-9cba87a2de66",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44595,
							},
							uuid = "9afce4c5-66d5-f449-977d-54497e5a15c6",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 447.1,
				name = "[Draw] Mass Macabre LJ first tower",
				timeRange = true,
				timelineIndex = 80,
				timerEndOffset = 43.9,
				timerStartOffset = -9.1,
				uuid = "72bd120a-20de-6b68-b6d5-4f8aa6f32486",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.mass then return end\nN.mass.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"b82ad34a-f4f8-362a-a85e-576832307ba3",
									true,
								},
							},
							name = "[Draw] Mass Macabre next safe tower",
							uuid = "c17086f5-1d31-9895-90ea-3dc1efabc6f3",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44596,
								44819,
							},
							uuid = "b82ad34a-f4f8-362a-a85e-576832307ba3",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 447.1,
				name = "[Draw] Mass Macabre next safe tower",
				timeRange = true,
				timelineIndex = 80,
				timerEndOffset = 43.9,
				timerStartOffset = -9.1,
				uuid = "fcb5555b-3325-4773-abad-6d5aebb80a36",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.mass then return end\nN.mass.onHandAdd(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"4bc25633-59a0-a920-ada1-f5fe01b4fa6d",
									true,
								},
							},
							name = "Record Macabre hands at spawn",
							uuid = "7682d62a-8a33-a21c-a635-652fa24096a4",
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
							eventEntityContentID = 14094,
							name = "Icy Hands",
							uuid = "4bc25633-59a0-a920-ada1-f5fe01b4fa6d",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 5,
				loop = true,
				mechanicTime = 447.1,
				name = "[Setup] Mass Macabre early hand positions",
				timeRange = true,
				timelineIndex = 80,
				timerEndOffset = 12.9,
				timerStartOffset = 0.9,
				uuid = "c0e7a1c1-af1b-aec5-975a-12ecc5425427",
				version = 2,
			},
		},
	},
	[81] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector draws",
				uuid = "74024346-a3bf-588b-b213-4347d55cbe5a",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.hands then return end\nN.hands.onChannel(eventArgs)\nif N.mass then N.mass.onHandChannel(eventArgs) end\nself.used=true",
							conditions = 
							{
								
								{
									"ad67c8c9-26d8-bcb6-9a82-590df90e701f",
									true,
								},
							},
							name = "[Draw] Mass Macabre hand cleaves",
							uuid = "498fe547-5585-453d-ba22-03f398aecfe0",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44567,
							},
							uuid = "ad67c8c9-26d8-bcb6-9a82-590df90e701f",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 454.2,
				name = "[Draw] Mass Macabre hand cleaves",
				timeRange = true,
				timelineIndex = 81,
				timerEndOffset = 11.8,
				timerStartOffset = -10.2,
				uuid = "3f437afc-7b1b-6ee9-b257-0ec3d1bb8087",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.mass then return end\nN.mass.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"7143af2b-8cf3-8ae1-9627-6f01c1dd598a",
									true,
								},
							},
							name = "[Draw] Mass Macabre after hands",
							uuid = "e3483111-f301-262e-9801-fedde9f4aac0",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44567,
							},
							uuid = "7143af2b-8cf3-8ae1-9627-6f01c1dd598a",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 454.2,
				name = "[Draw] Mass Macabre after hands",
				timeRange = true,
				timelineIndex = 81,
				timerEndOffset = 11.8,
				timerStartOffset = -10.2,
				uuid = "599960a8-144a-6263-893f-876724000727",
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
				name = "Hector draws",
				uuid = "425ffd3e-eb69-fb07-9754-74b382d9d3cb",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.mass then return end\nN.mass.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"1b5c275a-4500-1e5d-bcb5-b233e4af762c",
									true,
								},
							},
							name = "[Draw] Mass Macabre buster and last towers",
							uuid = "ece7ec2f-6c1a-d182-9b44-55f81e0c3086",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44593,
							},
							uuid = "1b5c275a-4500-1e5d-bcb5-b233e4af762c",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 465.8,
				name = "[Draw] Mass Macabre buster and last towers",
				timeRange = true,
				timelineIndex = 83,
				timerEndOffset = 9.2,
				timerStartOffset = -5.8,
				uuid = "f330a477-07dd-7d7c-bc81-a62c5058a3ea",
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
				name = "Hector draws",
				uuid = "0d9deeee-1550-f2c0-a02d-332ccedac73f",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.cold then return end\nN.cold.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"aa4f2b38-1536-1051-8bd6-fb5e65513d38",
									true,
								},
							},
							name = "[Draw] Cold Grip 3 seam and lines",
							uuid = "e6e339bd-7695-5b5f-befa-7f76016d1e75",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44553,
								44554,
								44555,
								44612,
							},
							uuid = "aa4f2b38-1536-1051-8bd6-fb5e65513d38",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 477,
				name = "[Draw] Cold Grip 3 seam and lines",
				timeRange = true,
				timelineIndex = 85,
				timerEndOffset = 5,
				timerStartOffset = -9,
				uuid = "3150b865-429a-319b-ad69-3882b610da1e",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.cold then return end\nN.cold.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"17545678-7831-1cdf-bdcb-b1b1c32ab8ef",
									true,
								},
							},
							name = "[Draw] Cold Grip 3 LJ final side",
							uuid = "6778a179-d6c3-b6a8-822b-b37ce0a22605",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44555,
								44612,
							},
							uuid = "17545678-7831-1cdf-bdcb-b1b1c32ab8ef",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 477,
				name = "[Draw] Cold Grip 3 LJ final side",
				timeRange = true,
				timelineIndex = 85,
				timerEndOffset = 5,
				timerStartOffset = -9,
				uuid = "882e2966-d9ad-9da1-85b1-301f32aa1b4a",
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
				name = "Hector draws",
				uuid = "382477e4-0f0f-17f5-b45f-024067035e47",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"41c75375-6f83-fa99-a993-d51b6d0d7743",
									true,
								},
							},
							name = "[Setup] Relentless 2 stored shapes",
							uuid = "66f54bff-9312-9c17-bd76-bc893e396c26",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44564,
							},
							uuid = "41c75375-6f83-fa99-a993-d51b6d0d7743",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 499.3,
				name = "[Setup] Relentless 2 stored shapes",
				timeRange = true,
				timelineIndex = 87,
				timerEndOffset = 2.7,
				timerStartOffset = -18.3,
				uuid = "78bc5a74-9e14-414d-ae8a-3062ca3d9703",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onMarker(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"c1881709-c805-f062-9595-5172515f7208",
									true,
								},
							},
							name = "[Setup] Relentless 2 shape markers",
							uuid = "4acfa1da-3efe-df4c-855e-9be8a56513d8",
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
							eventArgType = 3,
							markerIDList = 
							{
								604,
								605,
								606,
								607,
							},
							name = "Mechanic markers",
							uuid = "c1881709-c805-f062-9595-5172515f7208",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 4,
				loop = true,
				mechanicTime = 499.3,
				name = "[Setup] Relentless 2 shape markers",
				timeRange = true,
				timelineIndex = 87,
				timerEndOffset = 2.7,
				timerStartOffset = -18.3,
				uuid = "be3aeae6-29f9-cc61-8516-2b46c2bd5b5c",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onTether(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"4e8a0012-9dc1-dc16-92cf-e92b5ee68718",
									true,
								},
								
								{
									"2c280299-f580-df69-bf23-56b0010c31bf",
									true,
								},
							},
							name = "[Setup] Relentless 2 rotation actors",
							uuid = "a0d34201-b3f2-ea0f-a691-ece83a1e467a",
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
							eventArgType = 5,
							eventIntValue = 347,
							name = "Tether minimum",
							uuid = "4e8a0012-9dc1-dc16-92cf-e92b5ee68718",
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
							eventIntValue = 350,
							name = "Tether maximum",
							uuid = "2c280299-f580-df69-bf23-56b0010c31bf",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 15,
				loop = true,
				mechanicTime = 499.3,
				name = "[Setup] Relentless 2 rotation actors",
				timeRange = true,
				timelineIndex = 87,
				timerEndOffset = 18,
				timerStartOffset = -20,
				uuid = "8f268984-882f-d9a6-aff6-04d2aaccce2e",
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
				name = "Hector draws",
				uuid = "4548efd6-ba59-7654-b7f9-e12933ba9551",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"45a9e555-3e5e-455c-8d7f-32dfe9fa7fdd",
									true,
								},
							},
							name = "[Draw] Relentless 2 in-out and pairs-stack",
							uuid = "397fc36e-6d55-65c1-872a-21f0c1a3bed8",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44608,
								45167,
								45168,
								45183,
								45184,
								45185,
							},
							uuid = "45a9e555-3e5e-455c-8d7f-32dfe9fa7fdd",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 516.5,
				name = "[Draw] Relentless 2 in-out and pairs-stack",
				timeRange = true,
				timelineIndex = 89,
				timerEndOffset = 15.5,
				timerStartOffset = -10.5,
				uuid = "b2eabb3d-1d33-be74-9de7-e404938c2b8b",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.reaping then return end\nN.reaping.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"3c9d547b-151f-72a6-928b-a19544a57df1",
									true,
								},
							},
							name = "[Draw] Relentless 2 next shape and cleanup",
							uuid = "c5f8951f-55d5-6ae8-8882-9b2e81f63f8d",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44559,
								44560,
								44608,
								45183,
								45184,
								45185,
							},
							uuid = "3c9d547b-151f-72a6-928b-a19544a57df1",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 516.5,
				name = "[Draw] Relentless 2 next shape and cleanup",
				timeRange = true,
				timelineIndex = 89,
				timerEndOffset = 15.5,
				timerStartOffset = -10.5,
				uuid = "d20413d8-178d-b87f-bdf2-c35c9a6c541a",
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
				name = "Hector draws",
				uuid = "769e3aa2-dc16-8178-b767-82852e600ca4",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.hands then return end\nN.hands.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"eb1e2210-2043-2843-872a-a99a3d2d5b20",
									true,
								},
							},
							name = "[Setup] Fear 3 collect this wave",
							uuid = "dad33c77-bbb6-4da2-a309-d9570584a95d",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44550,
							},
							uuid = "eb1e2210-2043-2843-872a-a99a3d2d5b20",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 533.2,
				name = "[Setup] Fear 3 collect this wave",
				timeRange = true,
				timelineIndex = 95,
				timerEndOffset = 8.8,
				timerStartOffset = -9.2,
				uuid = "c20bae33-1717-87d3-9c7b-8dcb0d670b94",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.hands then return end\nN.hands.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"537ea34a-0d6b-0977-aae5-1b4d6cb3dd7f",
									true,
								},
							},
							name = "[Draw] Fear 3 LJ assigned hand",
							uuid = "dced3d09-b24f-0bb4-b4a7-f7802b5c5ed2",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44551,
								44552,
							},
							uuid = "537ea34a-0d6b-0977-aae5-1b4d6cb3dd7f",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 533.2,
				name = "[Draw] Fear 3 LJ assigned hand",
				timeRange = true,
				timelineIndex = 95,
				timerEndOffset = 8.8,
				timerStartOffset = -9.2,
				uuid = "acbd1a18-e96d-52cb-86c1-495626dd738d",
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
				name = "Hector draws",
				uuid = "2aa3ce6c-22da-eb88-9d4e-198dd65d40cd",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.specter then return end\nN.specter.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"44a9bac0-a464-c9f7-bf9d-777b925d6053",
									true,
								},
							},
							name = "[Draw] Circles 2 donut and LJ safe orb",
							uuid = "56f7e04f-f0b9-8985-b337-c0d68b68ef6b",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44600,
							},
							uuid = "44a9bac0-a464-c9f7-bf9d-777b925d6053",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 544.2,
				name = "[Draw] Circles 2 donut and LJ safe orb",
				timeRange = true,
				timelineIndex = 98,
				timerEndOffset = 29.8,
				timerStartOffset = -8.2,
				uuid = "c7dd52e3-2157-c333-a5ef-8def4ade0978",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.specter then return end\nN.specter.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"829f7cdd-b770-72ea-a909-e04ab3dea803",
									true,
								},
							},
							name = "[Draw] Circles 2 next unresolved orb",
							uuid = "e4defade-331a-4d3d-a10c-06b23786b15f",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44600,
							},
							uuid = "829f7cdd-b770-72ea-a909-e04ab3dea803",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 544.2,
				name = "[Draw] Circles 2 next unresolved orb",
				timeRange = true,
				timelineIndex = 98,
				timerEndOffset = 29.8,
				timerStartOffset = -8.2,
				uuid = "bae43835-5971-716e-aa3b-74b048aa48ef",
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
				name = "Hector draws",
				uuid = "fadf897f-2ac0-d0ae-8c1c-09b10c3a8953",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.specter then return end\nN.specter.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"674009fa-d35a-1a6e-924c-4b401dbe5a44",
									true,
								},
							},
							name = "[Draw] Specter 3 hand lanes",
							uuid = "4994e3e7-3750-99dd-823f-e9ea211d87d7",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44606,
								44818,
							},
							uuid = "674009fa-d35a-1a6e-924c-4b401dbe5a44",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 552.3,
				name = "[Draw] Specter 3 hand lanes",
				timeRange = true,
				timelineIndex = 99,
				timerEndOffset = 21.7,
				timerStartOffset = -16.3,
				uuid = "ff299491-69ac-b124-b90e-f03d4e11eac7",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.specter then return end\nN.specter.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"5710683a-b173-6e49-8cb2-e96ab7432c95",
									true,
								},
							},
							name = "[Draw] Specter 3 update safe row",
							uuid = "8200dd91-70f9-d8c5-90f7-1fef21f1fa4f",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44818,
							},
							uuid = "5710683a-b173-6e49-8cb2-e96ab7432c95",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 552.3,
				name = "[Draw] Specter 3 update safe row",
				timeRange = true,
				timelineIndex = 99,
				timerEndOffset = 21.7,
				timerStartOffset = -16.3,
				uuid = "d4cff413-5f4a-e33e-82b9-94c2ba2aadc5",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.specter then return end\nN.specter.onTether(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"054cc447-81d9-1788-a008-b04fe16a32ba",
									true,
								},
							},
							name = "[Draw] Specter 3 assigned safe row",
							uuid = "e728ec4f-0332-bac3-8121-9391248d5e57",
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
							comparator = 3,
							dequeueIfLuaFalse = true,
							eventArgType = 5,
							eventIntValue = 102,
							name = "Specter tether 102",
							uuid = "054cc447-81d9-1788-a008-b04fe16a32ba",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 15,
				loop = true,
				mechanicTime = 552.3,
				name = "[Draw] Specter 3 assigned safe row",
				timeRange = true,
				timelineIndex = 99,
				timerEndOffset = 21.7,
				timerStartOffset = -16.3,
				uuid = "09a6415e-bd20-683c-920a-df3a1069fbbc",
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
				name = "Hector draws",
				uuid = "57148a8c-d21a-da1e-9dee-ca84c6f5a115",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.mementoDraw then return end\nN.mementoDraw.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"a2cc045a-baa1-cdd7-a27a-d7a17658877f",
									true,
								},
							},
							name = "[Draw] Memento 2 LJ side and spread",
							uuid = "eae0841a-55c2-4c91-87a0-496f44d3a008",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44565,
								44566,
								44567,
								44602,
							},
							uuid = "a2cc045a-baa1-cdd7-a27a-d7a17658877f",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 576.6,
				name = "[Draw] Memento 2 LJ side and spread",
				timeRange = true,
				timelineIndex = 105,
				timerEndOffset = 11.4,
				timerStartOffset = -10.6,
				uuid = "035b34dc-5c98-0ee8-8581-af572e774f23",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.mementoDraw then return end\nN.mementoDraw.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"3401c568-2d84-6e23-a151-10af728453a5",
									true,
								},
							},
							name = "[Cleanup] Memento 2 after Smite",
							uuid = "fe255821-e819-6d7d-82cf-9a392fe916c8",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44602,
							},
							uuid = "3401c568-2d84-6e23-a151-10af728453a5",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 576.6,
				name = "[Cleanup] Memento 2 after Smite",
				timeRange = true,
				timelineIndex = 105,
				timerEndOffset = 11.4,
				timerStartOffset = -10.6,
				uuid = "9bb1221f-8c7b-819c-b7d8-7df003bcfc5a",
				version = 2,
			},
		},
	},
	[106] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector draws",
				uuid = "69bdc311-ebe2-fd96-a6e8-1d73c6f2a51d",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.hands then return end\nN.hands.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"ee336366-3eeb-4282-ab21-6c0ef634c213",
									true,
								},
							},
							name = "[Draw] Memento 2 hand cleaves",
							uuid = "102c0f59-c225-50f6-9469-a0e9724d79ad",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44567,
							},
							uuid = "ee336366-3eeb-4282-ab21-6c0ef634c213",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 582.8,
				name = "[Draw] Memento 2 hand cleaves",
				timeRange = true,
				timelineIndex = 106,
				timerEndOffset = 5.2,
				timerStartOffset = -16.8,
				uuid = "590b9700-f210-6b32-97ef-b8e596b65211",
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
				name = "Hector draws",
				uuid = "326501e4-20ec-9782-abae-aee280afd20c",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.cold then return end\nN.cold.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"f59d71cd-e21a-e26b-a560-66f7c1880cd4",
									true,
								},
							},
							name = "[Draw] Cold Grip 4 seam and lines",
							uuid = "d927aa3c-4d1b-b3b5-b8c2-fbb153bd013c",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44553,
								44554,
								44555,
								44612,
							},
							uuid = "f59d71cd-e21a-e26b-a560-66f7c1880cd4",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 591.8,
				name = "[Draw] Cold Grip 4 seam and lines",
				timeRange = true,
				timelineIndex = 108,
				timerEndOffset = 5.2,
				timerStartOffset = -8.8,
				uuid = "6e256f55-2543-fe20-965d-f77d73f77992",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.cold then return end\nN.cold.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"fb41541e-2574-1928-b422-0a1c86273ed5",
									true,
								},
							},
							name = "[Draw] Cold Grip 4 LJ final side",
							uuid = "9ea0da8d-7a99-1271-a67c-c1669c386f2a",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44555,
								44612,
							},
							uuid = "fb41541e-2574-1928-b422-0a1c86273ed5",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 591.8,
				name = "[Draw] Cold Grip 4 LJ final side",
				timeRange = true,
				timelineIndex = 108,
				timerEndOffset = 5.2,
				timerStartOffset = -8.8,
				uuid = "c8ac7ca6-d4b7-416d-bd9d-a49c7b509876",
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
				name = "Hector draws",
				uuid = "b7b58216-02cd-4753-9673-d72f3d89908a",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"c9192f59-0e31-cf3b-be1a-1fda4373d145",
									true,
								},
							},
							name = "[Draw] GC2 LJ center stack",
							uuid = "31b1e05b-7bba-b424-87c5-34b04f55ea0f",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44568,
								44604,
							},
							uuid = "c9192f59-0e31-cf3b-be1a-1fda4373d145",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 605.2,
				name = "[Draw] GC2 LJ center stack",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 50.8,
				timerStartOffset = -10.2,
				uuid = "1e90dcab-e078-cee5-9e46-3a3f4d3cc3db",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"150920ca-ea06-d3e4-a088-4f0e0b09917a",
									true,
								},
							},
							name = "[Cleanup] GC2 arena reset",
							uuid = "6c18119f-99c3-3669-aaed-ee2f01d9de51",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44568,
								44574,
								44576,
							},
							uuid = "150920ca-ea06-d3e4-a088-4f0e0b09917a",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 605.2,
				name = "[Cleanup] GC2 arena reset",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 50.8,
				timerStartOffset = -10.2,
				uuid = "a44c7484-48eb-9bb5-8617-29bd7d9d9cfe",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onTether(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"e33ce75e-1fb0-24cf-8cb0-9b5fd12309b4",
									true,
								},
								
								{
									"4186e267-6652-ca39-aea0-62c846c5c502",
									true,
								},
							},
							name = "[Draw] GC 2 red beam forecast",
							uuid = "ef4699f6-7a2e-763e-ae0e-74ecedcf4395",
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
							eventArgType = 5,
							eventIntValue = 343,
							name = "Tether minimum",
							uuid = "e33ce75e-1fb0-24cf-8cb0-9b5fd12309b4",
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
							eventIntValue = 344,
							name = "Tether maximum",
							uuid = "4186e267-6652-ca39-aea0-62c846c5c502",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 15,
				loop = true,
				mechanicTime = 605.2,
				name = "[Draw] GC 2 red beam forecast",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 55,
				timerStartOffset = -10,
				uuid = "527f6a7c-d980-a935-8775-bd5ea1373b19",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onBeamChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"3c58c47f-c6d7-16cd-bf37-cf9e782a8213",
									true,
								},
							},
							name = "[Draw] GC 2 locked red beam",
							uuid = "3400baf6-c2c1-0540-80d6-1e225dc4403c",
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
							eventSpellID = 44569,
							name = "Laser cast",
							uuid = "3c58c47f-c6d7-16cd-bf37-cf9e782a8213",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 605.2,
				name = "[Draw] GC 2 locked red beam",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 55,
				timerStartOffset = -10,
				uuid = "5524072a-2a70-5763-99de-6e82eb2e5be1",
				version = 2,
			},
		},
	},
	[111] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Hector draws",
				uuid = "6d2a2098-aaa6-acdb-8155-2bdf83058b4d",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"9bd939db-a5fc-736e-b1b3-912db54f8b66",
									true,
								},
							},
							name = "[Draw] GC2 LJ puddle drops",
							uuid = "ad8ec967-4077-bf08-811c-805e6e0079ea",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44571,
							},
							uuid = "9bd939db-a5fc-736e-b1b3-912db54f8b66",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 613.3,
				name = "[Draw] GC2 LJ puddle drops",
				timeRange = true,
				timelineIndex = 111,
				timerEndOffset = 42.7,
				timerStartOffset = -18.3,
				uuid = "674de29a-97df-e876-9c2d-12f84360b1b0",
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
				name = "Hector draws",
				uuid = "58ac2e05-c102-4501-87fa-04e566d60dd9",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"e34fc6d4-abdc-43a5-86e2-c535e226f02f",
									true,
								},
							},
							name = "[Draw] GC2 safe stack after lasers",
							uuid = "a8b489fd-6f33-aa42-bb88-729a524e6b74",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44569,
								44570,
							},
							uuid = "e34fc6d4-abdc-43a5-86e2-c535e226f02f",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 615.7,
				name = "[Draw] GC2 safe stack after lasers",
				timeRange = true,
				timelineIndex = 113,
				timerEndOffset = 40.3,
				timerStartOffset = -20.7,
				uuid = "8658e553-34ea-d610-ba9c-43484450c963",
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
				name = "Hector draws",
				uuid = "1e7ba5f0-92c5-3ef5-8597-fd076366d2d8",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onChannel(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"a4db04cd-6200-281d-ab38-cfef161aaad2",
									true,
								},
							},
							name = "[Draw] GC2 assigned tower or spread",
							uuid = "150ba75c-e4ad-a860-b9f9-384fa6ea323c",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44573,
							},
							uuid = "a4db04cd-6200-281d-ab38-cfef161aaad2",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 619.3,
				name = "[Draw] GC2 assigned tower or spread",
				timeRange = true,
				timelineIndex = 115,
				timerEndOffset = 36.7,
				timerStartOffset = -24.3,
				uuid = "ae2effda-bccd-29e8-aee6-dc805496a8eb",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onMarker(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"dae45cf0-893e-d18e-b3b2-fdc289a7549c",
									true,
								},
							},
							name = "[Draw] GC2 mark tower or spread",
							uuid = "64433060-3517-2f0a-b137-3172b2437397",
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
							eventArgType = 3,
							markerIDList = 
							{
								611,
							},
							name = "Mechanic markers",
							uuid = "dae45cf0-893e-d18e-b3b2-fdc289a7549c",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 4,
				loop = true,
				mechanicTime = 619.3,
				name = "[Draw] GC2 mark tower or spread",
				timeRange = true,
				timelineIndex = 115,
				timerEndOffset = 36.7,
				timerStartOffset = -24.3,
				uuid = "927ab21e-7acd-38a9-9e47-cfb52550877e",
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
							actionLua = "local N=data.kaptinNecron\nif not N or not N.gc then return end\nN.gc.onCast(eventArgs)\nself.used=true",
							conditions = 
							{
								
								{
									"af513ceb-f175-f092-abcc-7f203b6973f5",
									true,
								},
							},
							name = "[Draw] GC2 next tower wave",
							uuid = "d133c4c2-8a4f-cdc5-b930-da82623148e0",
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
							name = "Mechanic cast IDs",
							spellIDList = 
							{
								44573,
							},
							uuid = "af513ceb-f175-f092-abcc-7f203b6973f5",
							version = 3,
						},
					},
				},
				displayPath = "Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 619.3,
				name = "[Draw] GC2 next tower wave",
				timeRange = true,
				timelineIndex = 115,
				timerEndOffset = 36.7,
				timerStartOffset = -24.3,
				uuid = "499990e0-fdc5-1cfd-80db-bab223983cb7",
				version = 2,
			},
		},
	},
	inheritedProfiles = 
	{
	},
	timelineName = "necron-ex",
	version = "1.0.1",
}



return tbl