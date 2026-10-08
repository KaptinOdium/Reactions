local tbl = 
{
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
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "-- Hector Necron EX; AnyoneCore canonical roster. Local draw state only.\n-- Relentless rotation is confirmed by the first actual helper cast.\n-- No movement, game actions, callback registrations or ACR toggles.\nif data.kaptinNecron then data.kaptinNecron.clear() end\n-- Pull-scoped renderer and Hector encounter state. APIs are documented in\n-- root_tensorcore.lua, reaping_draw_* and root_draw_update.lua.\nlocal N = {arrows={}, shapes={}, pending={}, handDrops={}, oldHands={}, spectral={}, circleCasts={}, mm=nil}\ndata.kaptinNecron = N\nlocal arrows = TensorCore.getCachedDrawer(0xFF00FFFF,0xFF0088FF,0xFF0000FF,0xFFFFFFFF,2,7)\nlocal friendly = TensorCore.getStaticDrawer(0x7030FF30,1.5,7)\nlocal danger = TensorCore.getMoogleDrawer(6)\nlocal overlay = Argus2.RenderFlags.FLAG_RENDER_OVERLAY\n\nfunction N.slot()\n    if not AnyoneCore or not AnyoneCore.Roster or not AnyoneCore.Roster.current() then return nil end\n    local slot=AnyoneCore.Roster.mySlot()\n    return N.strategy.valid[slot] and slot or nil\nend\nfunction N.clearArrow(key)\n    local a=N.arrows[key]\n    if a then\n        if a.uuid then Argus.deleteTimedShape(a.uuid) end\n        if a.dot then Argus.deleteTimedShape(a.dot);N.shapes[a.dot]=nil end\n        N.arrows[key]=nil\n    end\nend\nfunction N.remember(uuid,ms)\n    if uuid then N.shapes[uuid]=Now()+ms end\n    return uuid\nend\nfunction N.circle(x,z,r,ms,safe)\n    local p=TensorCore.mGetPlayer()\n    return N.remember((safe and friendly or danger):addTimedCircle(ms,x,p.pos.y,z,r,0,false,true),ms)\nend\nfunction N.rect(x,z,length,width,heading,ms)\n    local p=TensorCore.mGetPlayer()\n    return N.remember(danger:addTimedRect(ms,x,p.pos.y,z,length,width,heading,0,false,true),ms)\nend\nfunction N.arrow(x,z,ms,key)\n    if type(x)~=\"number\" or type(z)~=\"number\" or ms<=0 then return end\n    N.clearArrow(key)\n    local a={x=x,z=z,untilAt=Now()+ms,dest={x=x,y=0,z=z}}\n    a.dot=N.circle(x,z,0.6,ms,true)\n    N.arrows[key]=a\n    N.renderArrow(a)\nend\nfunction N.renderArrow(a)\n    local p=TensorCore.mGetPlayer()\n    local dest=a.dest\n    dest.y=p.pos.y\n    local distance=TensorCore.getDistance2d(p.pos,dest)\n    if distance<0.8 then\n        if a.uuid then Argus.deleteTimedShape(a.uuid);a.uuid=nil end\n        return\n    end\n    local ms=a.untilAt-Now()\n    if ms<=0 then return end\n    local head=TensorCore.getHeadingToTarget(p.pos,dest)\n    local tip=math.min(3,distance)\n    local base=math.max(0,distance-tip)\n    if a.uuid and arrows:updateTimedArrow(a.uuid,ms,p.pos.x,p.pos.y,p.pos.z,head,base,1,tip,math.min(3,1+distance/3),0,false,overlay) then return end\n    a.uuid=arrows:addTimedArrow(ms,p.pos.x,p.pos.y,p.pos.z,head,base,1,tip,math.min(3,1+distance/3),0,false,overlay)\nend\nfunction N.defer(key,ms,fn) N.pending[key]={at=Now()+ms,fn=fn} end\nfunction N.update()\n    local now=Now()\n    if not N.nextShapePrune or now>=N.nextShapePrune then\n        N.nextShapePrune=now+1000\n        for uuid,untilAt in pairs(N.shapes) do if now>=untilAt then N.shapes[uuid]=nil end end\n    end\n    for key,a in pairs(N.arrows) do\n        if now>=a.untilAt then N.clearArrow(key) else N.renderArrow(a) end\n    end\n    for key,task in pairs(N.pending) do\n        if now>=task.at then N.pending[key]=nil;task.fn() end\n    end\n    if N.mm and N.mm.active then N.massGuide() end\n    if next(N.circleCasts) then N.circleGuide() end\nend\nfunction N.clear()\n    for key in pairs(N.arrows) do N.clearArrow(key) end\n    for uuid in pairs(N.shapes) do Argus.deleteTimedShape(uuid) end\n    N.shapes={};N.nextShapePrune=nil\n    N.pending={}\n    if N.reaping then N.reaping.clear() end\n    N.mm=nil;N.memento=nil;N.coldSide=nil;N.coldUntilAt=nil;N.coldPending=nil\n    N.handDrops={};N.oldHands={};N.spectral={}\n    N.circleCasts={};N.circleGuideKey=nil;N.phase2Seen=nil;N.p2Opening=nil\nend\n\nlocal portals={\n    four_n={x=100,z=94},four_s={x=100,z=106},\n    two_wn={x=85,z=97},two_en={x=115,z=97},two_ws={x=85,z=103},two_es={x=115,z=103},\n    three_nw={x=91,z=88},three_ne={x=109,z=88},three_sw={x=91,z=112},three_se={x=109,z=112},\n    corner_nw={x=83,z=86},corner_ne={x=117,z=86}\n}\nlocal function position(e)\n    if e.castPosX and e.castPosZ then return {x=e.castPosX,z=e.castPosZ} end\n    local ent=TensorCore.mGetEntity(e.entityID)\n    return ent and ent.pos or nil\nend\nN.position=position\nfunction N.coldGuide()\n    if not N.coldSide or not N.coldUntilAt or Now()>=N.coldUntilAt then return end\n    local p=TensorCore.mGetPlayer()\n    N.arrow(N.coldSide==\"west\" and 95 or 105,math.max(86,math.min(114,p.pos.z)),N.coldUntilAt-Now(),\"cold\")\nend\nlocal function specterRow(z)\n    return z<99 and 90 or (z>101 and 110 or 100)\nend\n\n-- Circle helpers have overlapping seven-second casts. Keep the current orb\n-- until its actual effect arrives; a later cast must never replace it early.\nlocal circleOffsets={0,-2.4,2.4}\nfunction N.circleGuide()\n    local first,firstID\n    for id,cast in pairs(N.circleCasts) do\n        if not first or cast.untilAt<first.untilAt then first,firstID=cast,id end\n    end\n    if not first or first.untilAt<=Now() then\n        N.circleGuideKey=nil;N.clearArrow(\"circle\");return\n    end\n    local p=TensorCore.mGetPlayer()\n    local targetZ\n    -- A 2.4y offset remains inside the verified 3y donut safe area. This\n    -- supports the partial-circle safe portion during later overlapping hands.\n    for _,offset in ipairs(circleOffsets) do\n        local z=first.z+offset\n        local safe=z>=85.6 and z<=114.4 and first.x>=82.6 and first.x<=117.4\n        if safe then\n            for _,row in pairs(N.spectral) do\n                if Now()<row.untilAt then\n                    if math.abs(z-row.z)<5.4 then safe=false;break end\n                    -- Do not point through a still-active full-width hand row.\n                    if (p.pos.z<row.z-5 and z>row.z+5)\n                        or (p.pos.z>row.z+5 and z<row.z-5) then safe=false;break end\n                end\n            end\n        end\n        if safe then targetZ=z;break end\n    end\n    if not targetZ then N.circleGuideKey=nil;N.clearArrow(\"circle\");return end\n    if N.circleGuideKey~=firstID or not N.arrows.circle or N.arrows.circle.z~=targetZ then\n        N.circleGuideKey=firstID\n        N.arrow(first.x,targetZ,first.untilAt-Now(),\"circle\")\n    end\nend\n\nlocal function wasHit(e,id)\n    for _,v in ipairs(e.hitTargets or {}) do if v==id then return true end end\n    return false\nend\n\nfunction N.massGuide()\n    local slot=N.slot(); if not slot then N.clearArrow(\"mass\");return end\n    local p=TensorCore.mGetPlayer()\n    local vuln=TensorCore.getBuff(p.id,2941)\n    if N.mm.awaitVulnUntil then\n        if vuln~=nil then N.mm.vulnObserved=true end\n        -- A temporarily absent packet is not proof that the post-soak debuff\n        -- expired. Observe that debuff before permitting the next portal.\n        if Now()<N.mm.awaitVulnUntil or not N.mm.vulnObserved then return end\n        if vuln==nil then N.mm.awaitVulnUntil=nil end\n    end\n    local key,_,stage=N.strategy.massTarget(slot,N.mm,vuln==nil)\n    if key==N.mm.lastKey and (N.arrows.mass or not portals[key]) then return end\n    N.mm.lastKey=key\n    N.clearArrow(\"mass\")\n    -- While vulnerable, suppress the movement arrow. A movement arrow into\n    -- a tower would tell the player to soak before their real debuff expires.\n    if not key or key:sub(1,5)==\"hold_\" or key:sub(1,6)==\"hands_\" then return end\n    local t=portals[key]\n    if t then\n        local x=t.x\n        if key==\"three_se\" then x=x-1.25 end -- inside/west edge avoids OT cone\n        N.arrow(x,t.z,15000,\"mass\")\n    end\nend\n\nlocal function collectDrop(e)\n    local pos=position(e);if not pos then return end\n    -- Ground-target puddle effects provide the actual eight positions.\n    local key=string.format(\"%.2f:%.2f\",pos.x,pos.z)\n    N.handDrops[key]={id=key,x=pos.x,z=pos.z}\n    local list={};for _,v in pairs(N.handDrops) do list[#list+1]=v end\n    if #list~=8 then return end\n    local slot=N.slot();if not slot then return end\n    local hand=N.strategy.handForSlot(slot,list,100)\n    if not hand then return end\n    N.oldHands[slot]=hand\n    local row=N.strategy.handAssignment(slot)\n    local z=math.max(85.6,math.min(114.4,hand.z+(row==\"north\" and -1.4 or 1.4)))\n    N.arrow(hand.x,z,2600,\"hand\")\nend\n\n-- For ordinary Memento, use the real fixed hand lanes, then validate all eight\n-- spread points. Never put anyone in a guessed lane while the pattern is partial.\nfunction N.solveMemento()\n    local m=N.memento\n    if not m or m.mass or not m.dark then return end\n    local darkRows,lightRows=m.rows[m.dark],m.rows[m.dark==\"west\" and \"east\" or \"west\"]\n    if #darkRows~=4 or #lightRows~=1 then return end\n    local function free(side,z)\n        for _,row in ipairs(m.rows[side]) do if math.abs(z-row)<3.35 then return false end end\n        return true\n    end\n    local layout={west={},east={}}\n    local function seats(side,z)\n        local left=side==\"west\" and 82.6 or 106.6\n        return {{x=left,z=z},{x=left+10.8,z=z}}\n    end\n    local best,bestScore\n    for z=85.6,114.4,0.2 do\n        if free(m.dark,z) then\n            local score=math.abs(z-100)\n            if not bestScore or score<bestScore then best,bestScore=z,score end\n        end\n    end\n    if not best then return end\n    layout[m.dark].tank_safe_lane=seats(m.dark,best)\n    local light=m.dark==\"west\" and \"east\" or \"west\"\n    local north,south\n    for z=85.6,114.4,0.2 do if free(light,z) then north=z;break end end\n    for z=114.4,85.6,-0.2 do if free(light,z) then south=z;break end end\n    if not north or not south then return end\n    best,bestScore=nil,nil\n    for z=north+10.2,south-10.2,0.2 do\n        if free(light,z) and (not bestScore or math.abs(z-100)<bestScore) then best,bestScore=z,math.abs(z-100) end\n    end\n    if not best then return end\n    layout[light].north=seats(light,north);layout[light].middle=seats(light,best);layout[light].south=seats(light,south)\n    local points={}\n    for _,slot in ipairs(N.strategy.slots) do points[#points+1]=N.strategy.mementoTarget(slot,m.dark,layout) end\n    for i=1,8 do for j=i+1,8 do\n        local a,b=points[i],points[j]\n        if not a or not b or (a.x-b.x)^2+(a.z-b.z)^2<10.1^2 then return end\n    end end\n    local target=N.strategy.mementoTarget(N.slot(),m.dark,layout)\n    if target then N.arrow(target.x,target.z,math.max(0,m.untilAt-Now()),\"memento\") end\nend\n\nfunction N.onChannel(e)\n    local id=e.spellID\n    local ent=TensorCore.mGetEntity(e.entityID)\n    if id==44550 then\n        N.handDrops={};N.clearArrow(\"hand\");N.clearArrow(\"embrace\")\n    elseif id==44595 then\n        N.mm=N.strategy.newMassState();N.mm.started=Now();N.massGuide()\n    elseif id==44565 or id==44566 then\n        local side=id==44566 and \"west\" or \"east\"\n        N.memento={dark=side,mass=N.mm and N.mm.active,rows={west={},east={}},casters={},untilAt=Now()+16000}\n        if not N.memento.mass then\n            local slot=N.slot();local targetSide=N.strategy.mementoSeat(slot,side)\n            if targetSide then\n                local p=TensorCore.mGetPlayer()\n                N.arrow(targetSide==\"west\" and 88 or 112,math.max(86,math.min(114,p.pos.z)),e.channelTimeMax*1000,\"memento\")\n            end\n        end\n    elseif id==44567 and ent then\n        N.rect(ent.pos.x,ent.pos.z,24,6,ent.pos.h,e.channelTimeMax*1000)\n        N.clearArrow(\"hand\");N.clearArrow(\"embrace\")\n        if N.p2Opening and N.coldPending then\n            -- The hand's cast start locks the bait. Only now move to Cold Grip's\n            -- central seam, preserving the deadline from its earlier cast.\n            N.coldPending=nil\n            N.coldGuide()\n        end\n        local m=N.memento\n        if m and Now()<m.untilAt then\n            local tx,_,tz=TensorCore.getPosInDirection(ent.pos,ent.pos.h,24,true)\n            if math.abs(tx-ent.pos.x)>20 and math.abs(tz-ent.pos.z)<2 and not m.casters[e.entityID] then\n                m.casters[e.entityID]=true\n                local side=tx<ent.pos.x and \"west\" or \"east\"\n                m.rows[side][#m.rows[side]+1]=ent.pos.z\n                N.clearArrow(\"memento\")\n                N.solveMemento()\n            end\n        end\n    elseif id==44597 then\n        local slot=N.slot();local hand=slot and N.oldHands[slot]\n        if hand then N.arrow(hand.x,hand.z,e.channelTimeMax*1000+500,\"embrace\") end\n    elseif id==44553 or id==44554 then\n        N.coldSide=id==44553 and \"west\" or \"east\"\n        N.coldUntilAt=Now()+e.channelTimeMax*1000+1300\n        if N.p2Opening then N.coldPending=true else N.coldGuide() end\n    elseif id==44612 and ent then\n        N.rect(ent.pos.x,ent.pos.z,100,12,ent.pos.h,e.channelTimeMax*1000)\n    elseif id==44555 and ent then\n        N.rect(ent.pos.x,ent.pos.z,100,24,ent.pos.h,e.channelTimeMax*1000)\n    elseif id==44602 then\n        local t=TensorCore.mGetEntity(e.targetID)\n        if t then N.remember(danger:addTimedCircleOnEnt(e.channelTimeMax*1000,t.id,10,0,false,true),e.channelTimeMax*1000) end\n    elseif id==44606 then\n        -- The first Specter cast is the P2 opening Embrace sequence. Later\n        -- Specters belong to Circle of Lives and must not issue hand-grid arrows.\n        N.p2Opening=not N.phase2Seen\n        N.phase2Seen=true\n        N.spectral={}\n        if N.p2Opening then N.oldHands={} end\n    elseif id==44818 and ent then\n        N.rect(ent.pos.x,ent.pos.z,36,10,ent.pos.h,e.channelTimeMax*1000)\n        local row=specterRow(ent.pos.z)\n        -- The helper's native cast confirms its row and remaining lifetime.\n        N.spectral[\"cast_\"..tostring(e.entityID)]={z=row,untilAt=Now()+e.channelTimeMax*1000+700}\n        N.circleGuide()\n    elseif id==44600 and ent then\n        N.remember(danger:addTimedDonutOnEnt(e.channelTimeMax*1000,ent.id,3,50,0,false,true),e.channelTimeMax*1000)\n        N.circleCasts[e.entityID]={x=ent.pos.x,z=ent.pos.z,untilAt=Now()+e.channelTimeMax*1000}\n        N.circleGuide()\n    end\nend\n\nfunction N.onCast(e)\n    local id=e.spellID\n    if id==44551 then collectDrop(e)\n    elseif id==44552 then N.clearArrow(\"hand\")\n    elseif id==44598 then\n        local p=TensorCore.mGetPlayer()\n        if wasHit(e,p.id) then\n            local slot=N.slot();local row=slot and N.strategy.handAssignment(slot)\n            if row then N.arrow(p.pos.x,math.max(85.6,math.min(114.4,p.pos.z+(row==\"north\" and -1.4 or 1.4))),3400,\"embrace\") end\n        end\n    elseif id==44567 then\n        -- Smite follows the hand snapshot by about one second. Keep the\n        -- assigned spread position visible through the Smite damage event.\n        if N.mm and N.mm.active then\n            N.defer(\"mass_hands\",250,function()\n                N.strategy.massEvent(N.mm,\"memento_hands_resolved\");N.mm.lastKey=nil;N.massGuide()\n            end)\n        end\n    elseif id==44819 and N.mm and N.mm.active then\n        local pos=position(e);local player=TensorCore.mGetPlayer()\n        if pos and wasHit(e,player.id) then\n            for key,p in pairs(portals) do\n                if (p.x-pos.x)^2+(p.z-pos.z)^2<1 then\n                    N.strategy.massEvent(N.mm,\"portal_resolved\",key);N.mm.lastKey=nil\n                    -- Allow the vulnerability packet to arrive before considering\n                    -- another portal. Actual buff still gates the following step.\n                    N.mm.awaitVulnUntil=Now()+700\n                    N.mm.vulnObserved=TensorCore.getBuff(player.id,2941)~=nil\n                    N.clearArrow(\"mass\")\n                    break\n                end\n            end\n        end\n    elseif id==44593 and N.mm and N.mm.active then\n        if not N.mm.lastBuster or Now()-N.mm.lastBuster>1000 then\n            N.mm.lastBuster=Now()\n            local event=N.mm.firstBuster and \"second_buster_resolved\" or \"first_buster_resolved\"\n            N.strategy.massEvent(N.mm,event);N.mm.lastKey=nil\n            if N.mm.secondBuster then N.defer(\"mass_end\",20000,function()N.mm.active=false;N.clearArrow(\"mass\")end) end\n        end\n    elseif id==44596 and N.mm then N.mm.active=false;N.clearArrow(\"mass\")\n    elseif id==44602 then\n        if N.memento and not N.memento.mass then\n            N.clearArrow(\"memento\");N.memento=nil\n        end\n    elseif id==44612 and N.coldSide then\n        local p=TensorCore.mGetPlayer()\n        N.arrow(N.coldSide==\"west\" and 90 or 110,math.max(86,math.min(114,p.pos.z)),1600,\"cold\")\n    elseif id==44555 then\n        N.clearArrow(\"cold\")\n        N.coldPending=nil;N.coldUntilAt=nil\n        if N.p2Opening then N.p2Opening=false;N.clearArrow(\"embrace\") end\n    elseif id==44818 then\n        local pos=position(e)\n        if pos then\n            local row=specterRow(pos.z)\n            for key,entry in pairs(N.spectral) do\n                if entry.z==row then N.spectral[key]=nil end\n            end\n        end\n        N.circleGuide()\n    elseif id==44600 then\n        -- Only this caster resolved; the next orb may already be casting.\n        N.circleCasts[e.entityID]=nil\n        N.circleGuideKey=nil\n        N.clearArrow(\"circle\")\n        N.circleGuide()\n    end\nend\n\nfunction N.onTether(e)\n    if e.newTetherID~=102 then return end\n    N.defer(\"specter\"..e.sourceEntityID,350,function()\n        local ent=TensorCore.mGetEntity(e.sourceEntityID);if not ent then return end\n        local row=specterRow(ent.pos.z)\n        N.spectral[e.sourceEntityID]={z=row,untilAt=Now()+11750}\n        N.circleGuide()\n        if not N.p2Opening then return end\n        local blocked={};for _,v in pairs(N.spectral) do if Now()<v.untilAt then blocked[v.z]=true end end\n        local count=0;for _ in pairs(blocked) do count=count+1 end\n        if count~=2 then return end\n        local safe\n        for _,z in ipairs({90,100,110}) do if not blocked[z] then safe=z end end\n        local slot=N.slot();local rowName,index\n        if slot then rowName,index=N.strategy.handAssignment(slot) end\n        if not safe or not rowName then return end\n        local x=({85,95,105,115})[index]\n        local z=safe+(rowName==\"north\" and -3.2 or 3.2)\n        N.oldHands[slot]={x=x,z=z}\n        N.arrow(x,z,11000,\"embrace\")\n    end)\nend\n\nN.strategy=(function()\n-- Pure strategy module. No TensorCore/Minion calls and no drawing side effects.\n-- API glue must feed verified event identities and world geometry.\n-- Load once into the encounter's pull-scoped data table, not a permanent global.\nlocal S = {}\nS.slots = {\"T1\", \"T2\", \"H1\", \"H2\", \"M1\", \"M2\", \"R1\", \"R2\"}\nS.valid = {T1=true,T2=true,H1=true,H2=true,M1=true,M2=true,R1=true,R2=true}\n\nlocal mm = {\n    T1 = {\"four_n\", \"two_wn\", \"corner_nw\"},\n    T2 = {\"four_n\", \"two_en\", \"corner_ne\"},\n    H1 = {\"four_s\", \"two_ws\", \"three_sw\", \"three_se\"},\n    H2 = {\"four_s\", \"two_es\", \"three_ne\", \"three_nw\"},\n    M1 = {\"four_n\", \"two_es\", \"three_ne\", \"three_nw\"},\n    M2 = {\"four_n\", \"two_en\", \"three_ne\", \"three_nw\"},\n    R1 = {\"four_s\", \"two_ws\", \"three_sw\", \"three_se\"},\n    R2 = {\"four_s\", \"two_wn\", \"three_sw\", \"three_se\"},\n}\nlocal portalKeys = {\n    four_n=true, four_s=true,\n    two_wn=true, two_en=true, two_ws=true, two_es=true,\n    three_nw=true, three_ne=true, three_sw=true, three_se=true,\n}\nlocal handIndex = {\n    T1={\"north\",1}, M1={\"north\",2}, M2={\"north\",3}, T2={\"north\",4},\n    R1={\"south\",1}, H1={\"south\",2}, H2={\"south\",3}, R2={\"south\",4},\n}\n\n-- Returns side, vertical band, horizontal seat (1 west, 2 east).\n-- Layout solver must provide actual safe lane and separate spread-safe points.\n-- No hardcoded y/z: hand rows vary, and light-side healers must flex.\nfunction S.mementoSeat(slot, darkSide)\n    if not S.valid[slot] or (darkSide ~= \"west\" and darkSide ~= \"east\") then return nil end\n    if slot == \"T1\" then return darkSide, \"tank_safe_lane\", 1 end\n    if slot == \"T2\" then return darkSide, \"tank_safe_lane\", 2 end\n    local lightSide = darkSide == \"west\" and \"east\" or \"west\"\n    local band = (slot == \"M1\" or slot == \"M2\") and \"north\"\n        or ((slot == \"H1\" or slot == \"H2\") and \"middle\" or \"south\")\n    local seat = (slot == \"M1\" or slot == \"H1\" or slot == \"R1\") and 1 or 2\n    return lightSide, band, seat\nend\n\n-- Custom layout shape: layout[side][band][seat] is a caller-verified safe point.\n-- Hand coverage, arena bounds and spread separation are the caller's contract.\nfunction S.mementoTarget(slot, darkSide, layout)\n    local side, band, seat = S.mementoSeat(slot, darkSide)\n    if not side or not layout or not layout[side] or not layout[side][band] then return nil end\n    return layout[side][band][seat]\nend\n\nfunction S.handAssignment(slot)\n    local a = handIndex[slot]\n    if not a then return nil end\n    return a[1], a[2]\nend\n\n-- Caller supplies exactly the eight confirmed Fear of Death hands of THIS wave.\n-- The caller's normalized records are {id=entityID,x=worldX,z=worldZ}.\n-- Returns the original hand record, never a guessed entity ID.\nfunction S.handForSlot(slot, hands, arenaZ)\n    local row, index = S.handAssignment(slot)\n    if not row or not hands or #hands ~= 8 or type(arenaZ) ~= \"number\" then return nil end\n    local north, south, ids = {}, {}, {}\n    for i=1,8 do\n        local h = hands[i]\n        if not h or h.id == nil or ids[h.id] or type(h.x) ~= \"number\" or type(h.z) ~= \"number\"\n            or h.z == arenaZ then return nil end\n        ids[h.id] = true\n        local dst = h.z < arenaZ and north or south\n        dst[#dst+1] = h\n    end\n    if #north ~= 4 or #south ~= 4 then return nil end\n    local function westFirst(a,b) return a.x < b.x end\n    table.sort(north, westFirst)\n    table.sort(south, westFirst)\n    for i=2,4 do\n        if north[i].x == north[i-1].x or south[i].x == south[i-1].x then return nil end\n    end\n    return (row == \"north\" and north or south)[index]\nend\n\n-- For P2 opening giant hands: identical row/seat assignment, translated into\n-- the verified remaining horizontal safe lane. Root supplies two rows of points.\nfunction S.p2SpreadTarget(slot, safeLaneLayout)\n    local row, index = S.handAssignment(slot)\n    if not row or not safeLaneLayout or not safeLaneLayout[row] then return nil end\n    return safeLaneLayout[row][index]\nend\n\nfunction S.massRoute(slot) return mm[slot] end\n\nfunction S.newMassState()\n    return {active=true, completed={}, handsResolved=false, firstBuster=false, secondBuster=false}\nend\n\n-- These event strings are PRIVATE module contracts, not game/MCP event names.\n-- Root translates only verified packet IDs and belongs-to-this-occurrence events.\n-- portalKey identifies the exact fixed portal; don't advance on a generic cast.\nfunction S.massEvent(state, event, portalKey)\n    if not state or not state.active then return false end\n    if event == \"portal_resolved\" then\n        if not portalKeys[portalKey] then return false end\n        state.completed[portalKey] = true\n    elseif event == \"memento_hands_resolved\" then\n        state.handsResolved = true\n    elseif event == \"first_buster_resolved\" then\n        state.firstBuster = true\n    elseif event == \"second_buster_resolved\" then\n        state.secondBuster = true\n    elseif event == \"end\" then\n        state.active = false\n    else return false end\n    return true\nend\n\n-- Returns semantic destination key, instruction, phase.\n-- Caller must supply safe staging geometry for \"hold_\" keys outside portals,\n-- and actual safe hand-lane geometry for \"hands_west\"/\"hands_east\".\n-- vulnGone must be explicitly true after checking the REAL buff (nil is unknown).\nfunction S.massTarget(slot, state, vulnGone)\n    local route = mm[slot]\n    if not route or not state or not state.active then return nil end\n    if not state.completed[route[1]] then\n        return route[1], \"SOAK 4\", \"four\"\n    end\n    if not state.completed[route[2]] then\n        if vulnGone ~= true then return \"hold_\"..route[2], \"WAIT FOR VULN\", \"two_wait\" end\n        return route[2], \"SOAK 2\", \"two\"\n    end\n    if not state.handsResolved then\n        local west = route[2] == \"two_wn\" or route[2] == \"two_ws\"\n        return west and \"hands_west\" or \"hands_east\", \"DODGE HANDS\", \"hands\"\n    end\n    if slot == \"T1\" or slot == \"T2\" then\n        if state.secondBuster then return nil end\n        return route[3], \"BAIT BUSTER\", \"buster\"\n    end\n    if not state.completed[route[3]] then\n        if vulnGone ~= true then return \"hold_\"..route[3], \"WAIT FOR VULN\", \"three_first_wait\" end\n        return route[3], \"SOAK 3\", \"three_first\"\n    end\n    if not state.firstBuster then return route[3], \"WAIT FOR FIRST BUSTER\", \"cross_wait\" end\n    if not state.completed[route[4]] then\n        if vulnGone ~= true then return \"hold_\"..route[4], \"WAIT FOR VULN\", \"three_second_wait\" end\n        -- For three_se the point must be its WEST/inside half, not center.\n        return route[4], \"SOAK 3\", \"three_second\"\n    end\n    return nil\nend\n\nreturn S\n\nend)()\n\ndo\n-- Draft initializer for root integration. No engine callback registration.\n-- Calls are made only from TensorReactions native event actions.\n-- Verified sources and exact IDs: necron_events.md; live get_actions:\n-- reaping_action_verify.json. Public API definitions: reaping_draw_*.lua.\n-- Each native event action should invoke the matching module function then\n-- set self.used=true. All state is private to this pull-scoped data table.\n\nlocal M = {}\ndata.kaptinNecronReaping = M\n\nlocal shapes = {[604] = \"out\", [605] = \"in\", [606] = \"middle\", [607] = \"sides\"}\nlocal hits = {[45183] = \"out\", [45184] = \"in\", [44608] = \"middle\", [45185] = \"sides\"}\nlocal releaseGroups = {[44557] = 2, [44558] = 4, [45167] = 2, [45168] = 4}\nlocal s = {order = {}, shapeDraws = {}, stackDraws = {}, count = 0}\nM.state = s\n\n-- Optional root-owned hooks, not game API calls:\n-- M.guide(shape, groups, durationMs, finalShape): draw a verified Hector\n-- role position using the shared LJ arrow helper. No assumed role layout here.\n-- M.clearGuide(): remove only this module's currently-owned arrow/marker.\n-- M.stackAnchorSlots(groups): canonical roster slots whose cone axes are the\n-- agreed party assignment. Defaults are Hector's two healer groups or the\n-- support anchors T1/M1, T2/M2, H1/R1, H2/R2. Friendly cones are guides, NOT a\n-- claim about which support/DPS the enemy randomly selected this time.\n-- M.rotation(offset): may only be invoked from separately verified rotation\n-- evidence; does NOT assume Minion aura fields map to BossMod modelState.\n\nlocal function removeDraws(list)\n    for i = 1, #list do\n        Argus.deleteTimedShape(list[i])\n    end\n    for i = #list, 1, -1 do list[i] = nil end\nend\n\nlocal function keep(list, uuid)\n    if uuid ~= nil then list[#list + 1] = uuid end\nend\n\nfunction M.clear()\n    removeDraws(s.shapeDraws)\n    removeDraws(s.stackDraws)\n    if M.clearGuide then M.clearGuide() end\n    s.active, s.rotated, s.collecting = false, false, false\n    s.order, s.activeOrder = {}, nil\n    s.groups, s.count, s.expected, s.bossID = nil, 0, nil, nil\n    s.lastHitAt, s.lastHitShape, s.lastChannelAt, s.lastChannelShape = nil, nil, nil, nil\nend\n\nlocal function drawShape(shape, duration)\n    removeDraws(s.shapeDraws)\n    local boss = s.bossID and TensorCore.mGetEntity(s.bossID)\n    if boss == nil or duration <= 0 then return end\n    local d = TensorCore.getMoogleDrawer(6)\n    if shape == \"out\" then\n        keep(s.shapeDraws, d:addTimedCircleOnEnt(duration, boss.id, 20, 0, false, true))\n    elseif shape == \"in\" then\n        keep(s.shapeDraws, d:addTimedDonutOnEnt(duration, boss.id, 16, 60, 0, false, true))\n    elseif shape == \"middle\" then\n        local heading = TensorCore.getHeadingToTarget({x=88,z=85}, {x=88,z=115})\n        keep(s.shapeDraws, d:addTimedRect(duration, 88, boss.pos.y, 85, 100, 12, heading, 0, false, true))\n        keep(s.shapeDraws, d:addTimedRect(duration, 112, boss.pos.y, 85, 100, 12, heading, 0, false, true))\n    elseif shape == \"sides\" then\n        local heading = TensorCore.getHeadingToTarget({x=100,z=85}, {x=100,z=115})\n        keep(s.shapeDraws, d:addTimedRect(duration, 100, boss.pos.y, 85, 100, 12, heading, 0, false, true))\n    end\n    if M.guide then M.guide(shape, s.groups, duration, s.count + 1 == s.expected) end\nend\n\nlocal function drawStacks(duration)\n    removeDraws(s.stackDraws)\n    if not (s.bossID and s.groups and AnyoneCore and AnyoneCore.Roster) then return end\n    local slots\n    if M.stackAnchorSlots then\n        slots = M.stackAnchorSlots(s.groups)\n    elseif s.groups == 2 then\n        slots = {\"H1\", \"H2\"}\n    elseif s.groups == 4 then\n        slots = {\"T1\", \"T2\", \"H1\", \"H2\"}\n    end\n    if slots == nil then return end\n    -- Green positioning cones, doNotDetect=true, never influence movement.\n    local d = TensorCore.getStaticDrawer(0x3030FF30, 1.5, 7)\n    for i = 1, #slots do\n        local id = AnyoneCore.Roster.idOf(slots[i])\n        if id ~= nil and TensorCore.mGetEntity(id) ~= nil then\n            keep(s.stackDraws, d:addTimedConeOnEnt(duration, s.bossID, 100,\n                math.rad(20), id, 0, false, true))\n        end\n    end\nend\n\nfunction M.rotation(offset)\n    if s.expected ~= 4 or s.count ~= 0 or #s.order ~= 4 then return false end\n    if offset ~= 0 and offset ~= 1 and offset ~= 2 and offset ~= 3 then return false end\n    s.activeOrder = {}\n    for i = 1, 4 do s.activeOrder[i] = s.order[((i + offset - 1) % 4) + 1] end\n    s.rotated = true\n    return true\nend\n\nfunction M.onMarker(e)\n    local shape = shapes[e.markerID]\n    if shape == nil or not s.collecting or e.entityID ~= s.bossID then return end\n    if #s.order >= s.expected then return end\n    s.order[#s.order + 1] = shape\nend\n\nfunction M.onChannel(e)\n    local id = e.spellID\n    if id == 44556 or id == 44564 then\n        M.clear()\n        s.bossID, s.expected, s.collecting = e.entityID, (id == 44564 and 4 or 1), true\n        return\n    end\n\n    local groups = releaseGroups[id]\n    if groups ~= nil then\n        if s.bossID ~= e.entityID then return end\n        s.collecting, s.active, s.groups, s.count = false, true, groups, 0\n        s.lastHitAt, s.lastHitShape, s.lastChannelAt, s.lastChannelShape = nil, nil, nil, nil\n        local duration = math.max(0, e.channelTimeMax) * 1000\n        if id == 44557 or id == 44558 then\n            s.expected = 1\n            if #s.order == 1 then\n                s.activeOrder = {s.order[1]}\n                drawShape(s.order[1], duration + 1350)\n            end\n            drawStacks(duration + 1450)\n        else\n            s.expected = 4\n            -- Without proven early rotation data, wait for first actual helper\n            -- cast. All four stored icons are still retained for later steps.\n            if s.rotated and s.activeOrder ~= nil then\n                drawShape(s.activeOrder[1], duration + 1350)\n            end\n        end\n        return\n    end\n\n    local shape = hits[id]\n    if shape == nil or not s.active then return end\n    local now = Now()\n    -- Two side-lane helpers are one shape. Repeated handler delivery is also\n    -- ignored; successive legitimate shapes are ~2.9s apart.\n    if s.lastChannelShape == shape and s.lastChannelAt and now - s.lastChannelAt < 800 then return end\n    s.lastChannelAt, s.lastChannelShape = now, shape\n\n    if s.expected == 4 and s.count == 0 and not s.rotated then\n        local match, matches = nil, 0\n        for i = 1, #s.order do\n            if s.order[i] == shape then match, matches = i, matches + 1 end\n        end\n        if #s.order == 4 and matches == 1 then M.rotation(match - 1) end\n    end\n    -- A mismatch invalidates future predictions; observed geometry still works.\n    if s.activeOrder and s.activeOrder[s.count + 1] ~= shape then\n        s.activeOrder, s.rotated = nil, false\n    end\n    drawShape(shape, math.max(0, e.channelTimeMax) * 1000 + 150)\n    if s.count + 1 == s.expected then drawStacks(math.max(0, e.channelTimeMax) * 1000 + 250) end\nend\n\nfunction M.onCast(e)\n    if e.spellID == 44559 or e.spellID == 44560 then\n        removeDraws(s.stackDraws)\n        if M.clearGuide then M.clearGuide() end\n        s.active = false\n        return\n    end\n    local shape = hits[e.spellID]\n    if shape == nil or not s.active then return end\n    local now = Now()\n    if s.lastHitShape == shape and s.lastHitAt and now - s.lastHitAt < 800 then return end\n    s.lastHitAt, s.lastHitShape = now, shape\n    removeDraws(s.shapeDraws)\n    s.count = s.count + 1\n    if s.count < s.expected and s.activeOrder ~= nil then\n        local nextShape = s.activeOrder[s.count + 1]\n        if nextShape ~= nil then\n            -- Expected interval only bounds a preview; the next channel resets\n            -- it to the real observed cast deadline.\n            drawShape(nextShape, 3000)\n            if s.count + 1 == s.expected then drawStacks(3100) end\n        end\n    end\nend\n\n-- Conservative Hector destination planner, evaluated once per stage/cue.\n-- Sources establish IN<16, OUT>20 and middle/sides at x94/106. One-yalm\n-- margins produce IN+middle intersection or OUT+sides intersection; thus the\n-- same agreed layout works regardless of which of those two shapes is stored.\n-- No actor location is assumed: use the live boss position supplied by caller.\n-- Pair axes are at least22deg apart for20deg full cones. Tanks/melees use the\n-- northern point on the outer axes, healers/ranged the southern inner axes.\nfunction M.rolePoints(bossPos, shape, groups)\n    local inside = shape == \"in\" or shape == \"middle\"\n    if not inside and shape ~= \"out\" and shape ~= \"sides\" then return nil end\n    if groups ~= 2 and groups ~= 4 then return nil end\n    local bx,bz = bossPos.x,bossPos.z\n    local function ray(angle, side, far)\n        local radians=math.rad(angle*side)\n        local dx,dz=math.sin(radians),math.cos(radians)\n        local xMin,xMax\n        if inside then xMin,xMax=95,105\n        elseif side<0 then xMin,xMax=83,93\n        else xMin,xMax=107,117 end\n        local lo,hi=0,math.huge\n        local function slab(origin,direction,low,high)\n            if math.abs(direction)<0.000001 then return origin>=low and origin<=high end\n            local a,b=(low-origin)/direction,(high-origin)/direction\n            if a>b then a,b=b,a end\n            lo,hi=math.max(lo,a),math.min(hi,b)\n            return lo<=hi\n        end\n        if not slab(bx,dx,xMin,xMax) or not slab(bz,dz,86,114) then return nil end\n        if inside then hi=math.min(hi,15) else lo=math.max(lo,21) end\n        if lo>hi or hi<=0 then return nil end\n        local r=far and hi or lo\n        return {x=bx+r*dx,z=bz+r*dz,radius=r,angle=angle*side}\n    end\n    local best,bestScore\n    if groups==2 then\n        for a=12,70 do\n            local left,right=ray(a,-1,false),ray(a,1,false)\n            if left and right then\n                local score=math.abs(a-(inside and 25 or 40))+(left.radius+right.radius)*0.2\n                if not bestScore or score<bestScore then\n                    bestScore=score\n                    best={T1=left,H1=left,M1=left,R1=left,T2=right,H2=right,M2=right,R2=right}\n                end\n            end\n        end\n    else\n        for h=11,40 do\n            local lh,rh=ray(h,-1,true),ray(h,1,true)\n            if lh and rh then\n                for t=h+22,80 do\n                    local lt,rt=ray(t,-1,false),ray(t,1,false)\n                    if lt and rt and lt.z+1<=lh.z and rt.z+1<=rh.z then\n                        local score=math.abs(h-15)+math.abs(t-(inside and 35 or 50))*0.25\n                            +(lt.radius+rt.radius)*0.8\n                        if not bestScore or score<bestScore then\n                            bestScore=score\n                            best={T1=lt,M1=lt,T2=rt,M2=rt,H1=lh,R1=lh,H2=rh,R2=rh}\n                        end\n                    end\n                end\n            end\n        end\n    end\n    -- If the actual boss position makes these conservative regions infeasible,\n    -- do not invent a destination. Enemy AoE draws still remain available.\n    return best\nend\n\nfunction M.rolePoint(bossPos, shape, groups, slot)\n    local all=M.rolePoints(bossPos,shape,groups)\n    return all and all[slot] or nil\nend\n\n-- Root wrapper calls M.clear() on OnWipe/countdown cancellation as appropriate.\n-- Do not save or claim early Relentless rotation prediction until the missing\n-- Minion aura/model-state correspondence has been established from evidence.\nself.used = true\n\nend\nN.reaping=data.kaptinNecronReaping\n\nN.gc=(function()\n-- Pure factory: root stores makeGrandCross(N) in its pull-scoped module table.\n-- Native GUI event-ID gates must precede onChannel/onCast/onMarker calls.\n-- Source: necron_hector.md + necron_events.md. No callbacks or polling.\n-- Contract: N.arrow(x,z,durationMs,key), N.clearArrow(key),\n-- N.circle(x,z,radius,durationMs,safe). All destinations stay within radius9.\nlocal function makeGrandCross(N)\n    local M = {}\n    local key = \"grandcross\"\n    local q = math.sqrt(0.5)\n    local directions = {\n        {x=0,z=-1,color=1,kind=\"card\"},\n        {x=q,z=-q,color=2,kind=\"inter\"},\n        {x=1,z=0,color=2,kind=\"card\"},\n        {x=q,z=q,color=3,kind=\"inter\"},\n        {x=0,z=1,color=3,kind=\"card\"},\n        {x=-q,z=q,color=4,kind=\"inter\"},\n        {x=-1,z=0,color=4,kind=\"card\"},\n        {x=-q,z=-q,color=1,kind=\"inter\"},\n    }\n    local colors = {\n        {slots={\"T1\",\"M1\"},card=directions[1],inter=directions[8]},\n        {slots={\"T2\",\"M2\"},card=directions[3],inter=directions[2]},\n        {slots={\"H2\",\"R2\"},card=directions[5],inter=directions[4]},\n        {slots={\"H1\",\"R1\"},card=directions[7],inter=directions[6]},\n    }\n    local colorOf = {T1=1,M1=1,T2=2,M2=2,H2=3,R2=3,H1=4,R1=4}\n    local s = {}\n\n    local function clearArrow()\n        N.clearArrow(key)\n    end\n\n    local function arrow(x,z,duration)\n        local dx,dz=x-100,z-100\n        if dx*dx+dz*dz > 81.0001 then clearArrow() return end\n        N.arrow(x,z,duration,key)\n    end\n\n    local function myColor()\n        local roster = AnyoneCore and AnyoneCore.Roster\n        if roster == nil or roster.current() == nil then return nil end\n        local slot = roster.mySlot()\n        return colorOf[slot],roster\n    end\n\n    local function clock(kind,radius,duration)\n        local color = myColor()\n        if color == nil then clearArrow() return end\n        local d = colors[color][kind]\n        arrow(100+d.x*radius,100+d.z*radius,duration)\n    end\n\n    local function resetWave()\n        s.markers,s.towers,s.channels,s.resolved = {},{},{},{}\n        s.markerCount,s.resolveCount = 0,0\n    end\n\n    function M.clear()\n        clearArrow()\n        s.active=false\n        s.wave,s.lasers,s.puddles=0,0,0\n        s.lastLaser,s.lastPuddle,s.started=nil,nil,nil\n        resetWave()\n    end\n\n    local function begin()\n        M.clear()\n        s.active,s.wave,s.started=true,1,Now()\n        -- Grand Cross raidwide and arena shrink: everyone in center first.\n        arrow(100,100,15000)\n    end\n\n    local function active()\n        if not s.active then return false end\n        if Now()-s.started > 65000 then M.clear() return false end\n        return true\n    end\n\n    local function position(e)\n        -- OnEntityCast ground coordinates are optional. Tower helpers stand\n        -- at the tower location; channel events only supply their entity ID.\n        if type(e.castPosX)==\"number\" and type(e.castPosZ)==\"number\" then\n            return e.castPosX,e.castPosZ\n        end\n        local ent=TensorCore.mGetEntity(e.entityID)\n        if ent == nil then return nil end\n        return ent.pos.x,ent.pos.z\n    end\n\n    local function towerPoint(x,z)\n        if x==nil or z==nil then return nil end\n        local dx,dz=x-100,z-100\n        local radius=math.sqrt(dx*dx+dz*dz)\n        if radius<1 or radius>9.001 then return nil end\n        local best,bestDot\n        for i=1,#directions do\n            local d=directions[i]\n            local dot=(dx*d.x+dz*d.z)/radius\n            if bestDot==nil or dot>bestDot then best,bestDot=d,dot end\n        end\n        -- Fail closed on a position far from a cardinal/intercardinal.\n        if bestDot<0.98 then return nil end\n        return {x=x,z=z,radius=radius,color=best.color,kind=best.kind}\n    end\n\n    local function coordinateKey(x,z)\n        return string.format(\"%.2f:%.2f\",x,z)\n    end\n\n    local function assignment()\n        if s.wave~=1 and s.wave~=2 then return end\n        local needed=s.wave==1 and 2 or 5\n        if s.lasers<needed then return end\n        local color,roster=myColor()\n        if color==nil or s.markerCount~=4 then clearArrow() return end\n        local c=colors[color]\n        local a,b=roster.idOf(c.slots[1]),roster.idOf(c.slots[2])\n        local player=TensorCore.mGetPlayer()\n        if a==nil or b==nil or player==nil then clearArrow() return end\n        -- Exactly one member of each color pair must have the spread.\n        if (s.markers[a]==true)==(s.markers[b]==true) then clearArrow() return end\n        local t=s.towers[color]\n        if type(t)~=\"table\" then clearArrow() return end\n        local duration=t.expiresAt-Now()\n        if duration<=0 then clearArrow() return end\n        local radius=math.min(t.radius,8.5)\n        if s.markers[player.id] then\n            local d=c[t.kind==\"card\" and \"inter\" or \"card\"]\n            arrow(100+d.x*radius,100+d.z*radius,duration)\n        elseif player.id==a or player.id==b then\n            -- Stand slightly in from an edge tower center while still inside\n            -- its3y circle; never point outside the shrunken arena.\n            local d=c[t.kind]\n            arrow(100+d.x*radius,100+d.z*radius,duration)\n            if not t.highlighted then\n                N.circle(t.x,t.z,3,duration,true)\n                t.highlighted=true\n            end\n        else\n            clearArrow()\n        end\n    end\n\n    function M.onChannel(e)\n        local id=e.spellID\n        if id==44568 then begin() return end\n        if not active() then return end\n        if id==44604 then\n            arrow(100,100,15000)\n        elseif id==44571 then\n            local now=Now()\n            -- Each puddle set has multiple helpers but the next set is2s later.\n            if s.lastPuddle and now-s.lastPuddle<1000 then return end\n            s.lastPuddle=now\n            s.puddles=s.puddles+1\n            if s.wave==1 and s.puddles<=2 then\n                -- Ground AOEs snapshot at cast start. Fan out in two steps.\n                clock(\"inter\",s.puddles==1 and 4 or 8,8000)\n            elseif s.wave==3 and s.puddles>=3 and s.puddles<=4 then\n                clock(\"inter\",s.puddles==3 and 4 or 8,8000)\n            else\n                clearArrow()\n            end\n        elseif id==44573 and (s.wave==1 or s.wave==2) then\n            if type(e.channelTimeMax)~=\"number\" or e.channelTimeMax<=0 then return end\n            local x,z=position(e)\n            local t=towerPoint(x,z)\n            if t==nil then return end\n            t.expiresAt=Now()+e.channelTimeMax*1000\n            local k=coordinateKey(x,z)\n            if s.channels[k] then return end\n            s.channels[k]=true\n            local old=s.towers[t.color]\n            if old==nil then\n                s.towers[t.color]=t\n            elseif type(old)~=\"table\" or math.abs(old.x-x)+math.abs(old.z-z)>0.1 then\n                s.towers[t.color]=false\n            end\n            assignment()\n        end\n    end\n\n    function M.onMarker(e)\n        if not active() or (s.wave~=1 and s.wave~=2) then return end\n        if e.markerID==611 and not s.markers[e.entityID] then\n            s.markers[e.entityID]=true\n            s.markerCount=s.markerCount+1\n            assignment()\n        end\n    end\n\n    function M.onCast(e)\n        local id=e.spellID\n        if id==44568 then\n            if not s.active then begin() end\n            return\n        end\n        if not active() then return end\n        if id==44569 then\n            local now=Now()\n            if s.lastLaser and now-s.lastLaser<1000 then return end\n            s.lastLaser=now\n            s.lasers=s.lasers+1\n            if s.lasers==2 or s.lasers==5 then assignment() end\n            if s.lasers>5 then clearArrow() end\n        elseif id==44573 and (s.wave==1 or s.wave==2) then\n            local x,z=position(e)\n            if x==nil then return end\n            local k=coordinateKey(x,z)\n            if not s.channels[k] or s.resolved[k] then return end\n            s.resolved[k]=true\n            s.resolveCount=s.resolveCount+1\n            if s.resolveCount==4 then\n                s.wave=s.wave+1\n                resetWave()\n                if s.wave==2 then\n                    -- After first towers the safe waiting clock is CARDINAL.\n                    clock(\"card\",8,12000)\n                else\n                    -- Rejoin center for the final two bait sets, then fan out.\n                    arrow(100,100,10000)\n                end\n            end\n        elseif id==44570 then\n            -- Proximity has resolved. No new destination until Neutron Ring.\n            clearArrow()\n        elseif id==44574 or id==44576 then\n            M.clear()\n        end\n    end\n\n    return M\nend\n\nreturn makeGrandCross\n\nend)()(N)\n\nN.reaping.clearGuide=function() N.clearArrow(\"reaping\") end\nN.reaping.guide=function(shape,groups,ms,finalShape)\n    local slot=N.slot()\n    local boss=N.reaping.state.bossID and TensorCore.mGetEntity(N.reaping.state.bossID)\n    if not slot or not boss then N.clearArrow(\"reaping\");return end\n    local p=N.reaping.rolePoint(boss.pos,shape,groups or 2,slot)\n    if p then N.arrow(p.x,p.z,ms,\"reaping\") else N.clearArrow(\"reaping\") end\nend\nlocal originalClear=N.clear\nN.clear=function()\n    originalClear()\n    N.gc.clear()\n    N.mm=nil\nend\nself.used=true\n",
							name = "[Core] Initialize Hector Necron draws",
							uuid = "7d486eab-4cd9-ebf5-9660-9efb3b07f852",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Kaptin - Hector draws",
				mechanicTime = 52.4,
				name = "[Core] Initialize Hector Necron draws",
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = 847.6,
				timerStartOffset = -82.4,
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
							actionLua = "local N=data.kaptinNecron\nif N then\n    N.onChannel(eventArgs)\n    N.reaping.onChannel(eventArgs)\n    N.gc.onChannel(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"b52e050e-6339-770b-bfd2-ff2ea044d6cb",
									true,
								},
							},
							name = "[Core] Necron onChannel",
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
							name = "Verified Necron action IDs",
							spellIDList = 
							{
								44550,
								44553,
								44554,
								44555,
								44556,
								44557,
								44558,
								44564,
								44565,
								44566,
								44567,
								44568,
								44571,
								44573,
								44595,
								44597,
								44599,
								44600,
								44602,
								44604,
								44606,
								44608,
								44612,
								44818,
								45167,
								45168,
								45183,
								45184,
								45185,
							},
							uuid = "b52e050e-6339-770b-bfd2-ff2ea044d6cb",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin - Hector draws",
				eventType = 3,
				loop = true,
				mechanicTime = 52.4,
				name = "[Core] Necron onChannel",
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = 847.6,
				timerStartOffset = -82.4,
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
							actionLua = "local N=data.kaptinNecron\nif N then\n    N.onCast(eventArgs)\n    N.reaping.onCast(eventArgs)\n    N.gc.onCast(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"a87af5b5-d908-bf75-b7cb-3893507c3332",
									true,
								},
							},
							name = "[Core] Necron onCast",
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
							name = "Verified Necron action IDs",
							spellIDList = 
							{
								44551,
								44552,
								44555,
								44559,
								44560,
								44565,
								44566,
								44567,
								44568,
								44569,
								44570,
								44573,
								44574,
								44576,
								44593,
								44596,
								44598,
								44600,
								44602,
								44608,
								44612,
								44818,
								44819,
								45183,
								45184,
								45185,
							},
							uuid = "a87af5b5-d908-bf75-b7cb-3893507c3332",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin - Hector draws",
				eventType = 2,
				loop = true,
				mechanicTime = 52.4,
				name = "[Core] Necron onCast",
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = 847.6,
				timerStartOffset = -82.4,
				uuid = "17dd6c9f-7f12-3bbb-a642-db5c693b49a0",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local N=data.kaptinNecron\nif N then\n    N.reaping.onMarker(eventArgs)\n    N.gc.onMarker(eventArgs)\n    if eventArgs.markerID==614 and eventArgs.entityID==TensorCore.mGetPlayer().id then\n        local slot=N.slot()\n        local hand=slot and N.oldHands[slot]\n        if hand then N.arrow(hand.x,hand.z,4100,\"embrace\") end\n    end\nend\nself.used=true",
							conditions = 
							{
								
								{
									"f0ef8e3b-4c31-ad25-8c8a-d4ec7562bfef",
									true,
								},
							},
							name = "[Core] Stored shapes, spread assignments and hand bait",
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
								611,
								614,
							},
							name = "Necron shape and spread markers",
							uuid = "f0ef8e3b-4c31-ad25-8c8a-d4ec7562bfef",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin - Hector draws",
				eventType = 4,
				loop = true,
				mechanicTime = 52.4,
				name = "[Core] Stored shapes, spread assignments and hand bait",
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = 847.6,
				timerStartOffset = -82.4,
				uuid = "7a8eb2ed-55b4-79bc-bc0f-5e9a8d9c4e5e",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local N=data.kaptinNecron\nif N then N.onTether(eventArgs) end\nself.used=true",
							conditions = 
							{
								
								{
									"41e7e6a4-44dc-4eeb-857f-32f8ca6aaca1",
									true,
								},
							},
							name = "[Core] Specter rows and Phase 2 hand placement",
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
				displayPath = "Kaptin - Hector draws",
				eventType = 15,
				loop = true,
				mechanicTime = 52.4,
				name = "[Core] Specter rows and Phase 2 hand placement",
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = 847.6,
				timerStartOffset = -82.4,
				uuid = "f4c708d6-ba28-37a1-b69d-4ba4632368d6",
				version = 2,
			},
		},
		
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
							name = "[Draw] Refresh active LJ arrows and portal debuff gate",
							uuid = "b9f94748-23e3-55d9-914f-5fc04df95e08",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Kaptin - Hector draws",
				loop = true,
				mechanicTime = 52.4,
				name = "[Draw] Refresh active LJ arrows and portal debuff gate",
				throttleTime = 100,
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = 847.6,
				timerStartOffset = -82.4,
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
							actionLua = "local old=eventArgs.oldData\nif old and old.kaptinNecron then\n    old.kaptinNecron.clear()\nelseif old and old.kaptinNecronReaping then\n    old.kaptinNecronReaping.clear()\nend\nself.used=true",
							name = "[Core] Clear Necron draws on wipe",
							uuid = "6536b025-0256-8d57-b760-12ce5082739b",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Kaptin - Hector draws",
				eventType = 9,
				loop = true,
				mechanicTime = 52.4,
				name = "[Core] Clear Necron draws on wipe",
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = 847.6,
				timerStartOffset = -82.4,
				uuid = "c177eb20-d0d2-e493-85cb-1cd2a3ab3e4e",
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