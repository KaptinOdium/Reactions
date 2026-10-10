local tbl = 
{
	[2] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Setup",
				uuid = "82256571-6d8a-1743-9ffa-bfb30bc19dfc",
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
							actionLua = "-- Enuo Hector visual guidance. Public geometry: awgil/ffxiv_bossmod Ex8Enuo.\n-- This state is pull-scoped. No game actions, movement, or ACR settings change.\nif data.kaptinEnuo then self.used = true return end\nlocal s = {draws={}, points={}, labels={}, hazards={}, markerLines={}, rosterSlots={\"T1\",\"T2\",\"H1\",\"H2\",\"M1\",\"M2\",\"R1\",\"R2\"}}\ndata.kaptinEnuo = s\ns.moogle = TensorCore.getMoogleDrawer()\ns.green = TensorCore.getStaticDrawer(0xFF60FF60, 2)\ns.blue = TensorCore.getStaticDrawer(0xFFFFC040, 2)\ns.red = TensorCore.getStaticDrawer(0xFF4040FF, 2)\n-- Same geometry, white outline, gradient and overlay as source-available\n-- Lj/umad/draws_lpdu [Lj Draw] Draw Positions. Entity attachment keeps it live.\ns.lj = TensorCore.getCachedDrawer(0xFF00FFFF,0xFF0088FF,0xFF0000FF,0xFFFFFFFF,2)\ns.redArrow = TensorCore.getCachedDrawer(0xFF0000FF,0xFF0000FF,0xFF0000FF,0xFFFFFFFF,2)\ns.overlay = Argus2.RenderFlags.FLAG_RENDER_OVERLAY\ns.now = Now\nfunction s.roster()\n    return AnyoneCore and AnyoneCore.Roster and AnyoneCore.Roster.current() and AnyoneCore.Roster or nil\nend\nfunction s.slot()\n    local r = s.roster()\n    return r and r.mySlot() or nil\nend\nfunction s.add(key, uuid)\n    if not uuid then return end\n    local list = s.draws[key]\n    if not list then list = {}; s.draws[key] = list end\n    list[#list+1] = uuid\n    return #list\nend\nfunction s.clear(key)\n    local label=s.labels[key]\n    if label and label.uuid then AnyoneCore.removeTimedWorldText(label.uuid) end\n    s.labels[key]=nil\n    local list = s.draws[key]\n    if list then\n        for i=1,#list do if list[i] then Argus.deleteTimedShape(list[i]) end end\n    end\n    s.draws[key], s.points[key] = nil, nil\nend\nfunction s.clearAll()\n    if s.gazeConeClear then s.gazeConeClear() end\n    if s.interClear then s.interClear() end\n    if s.gauntletClear then s.gauntletClear() end\n    for key in pairs(s.draws) do s.clear(key) end\n    for key in pairs(s.points) do s.clear(key) end\n    for key in pairs(s.labels) do s.clear(key) end\n    s.hazards, s.markerLines = {}, {}\n    s.dimensionState,s.dimensionPending,s.dimensionID=nil,nil,nil\n    s.gaze,s.hunts,s.meltdown,s.interState,s.emptinessState=nil,nil,nil,nil,nil\n    s.solveAt,s.bossID=nil,nil\nend\nfunction s.arrowEntity(key, targetID, ms, drawer)\n    s.clear(key)\n    local player = TensorCore.mGetPlayer()\n    if not player or not TensorCore.mGetEntity(targetID) or ms <= 0 then return end\n    drawer=drawer or s.lj\n    local uuid=drawer:addTimedArrowOnEnt(ms, player.id, 4, 1, 3, 3, targetID, 0, false, 0, false, s.overlay)\n    s.add(key,uuid)\n    return uuid\nend\n-- Arena-fixed LJ arrow: its tip ends on the destination, independent of the player.\nfunction s.arenaArrow(key,x,y,z,ms,drawer)\n    s.clear(key)\n    if ms<=0 then return end\n    local dx,dz=x-100,z-100\n    local radius=math.sqrt(dx*dx+dz*dz)\n    if radius<0.1 then return end\n    local origin={x=x-7*dx/radius,y=y,z=z-7*dz/radius}\n    local heading=TensorCore.getHeadingToTarget(origin,{x=x,y=y,z=z})\n    drawer=drawer or s.lj\n    local uuid=drawer:addTimedArrow(ms,origin.x,y,origin.z,heading,4,1,3,3,0,false,s.overlay)\n    s.add(key,uuid)\n    return uuid\nend\nfunction s.arrowPoint(key,x,y,z,ms)\n    s.clear(key)\n    local p = TensorCore.mGetPlayer()\n    if not p or not p.pos or ms <= 0 then return end\n    local destination = {x=x,y=y,z=z}\n    local distance = math.sqrt((x-p.pos.x)^2+(z-p.pos.z)^2)\n    local heading = TensorCore.getHeadingToTarget(p.pos,destination)\n    local point={pos=destination,ends=s.now()+ms}\n    s.points[key]=point\n    if distance>=0.6 then\n        -- Keep LJ's 1-yalm shaft and 3x3 head; shorten only inside the head length.\n        local tip=math.min(3,distance)\n        point.uuid=s.lj:addTimedArrowOnEnt(ms,p.id,math.max(0,distance-tip),1,tip,3,nil,0,false,heading,true,s.overlay)\n        point.drawIndex=s.add(key,point.uuid)\n    end\nend\nfunction s.pointUpdate()\n    local now,p = s.now(),TensorCore.mGetPlayer()\n    for key,point in pairs(s.points) do\n        if now>=point.ends or not p or not p.pos then\n            s.clear(key)\n        else\n            local distance = math.sqrt((point.pos.x-p.pos.x)^2+(point.pos.z-p.pos.z)^2)\n            if distance<0.6 then\n                -- Retain destination ring, but remove the direction arrow on arrival.\n                if point.uuid then\n                    Argus.deleteTimedShape(point.uuid)\n                    point.uuid=nil\n                    local list=s.draws[key]\n                    if list and point.drawIndex then list[point.drawIndex]=false end\n                end\n            else\n                local heading=TensorCore.getHeadingToTarget(p.pos,point.pos)\n                local tip=math.min(3,distance)\n                local updated=point.uuid and s.lj:updateTimedArrowOnEnt(point.uuid,nil,p.id,math.max(0,distance-tip),1,tip,3,nil,0,false,heading,true,s.overlay)\n                if not updated then\n                    point.uuid=s.lj:addTimedArrowOnEnt(point.ends-now,p.id,math.max(0,distance-tip),1,tip,3,nil,0,false,heading,true,s.overlay)\n                    local list=s.draws[key]\n                    if list and point.drawIndex then list[point.drawIndex]=point.uuid or false\n                    else point.drawIndex=s.add(key,point.uuid) end\n                end\n            end\n        end\n    end\n    s.textUpdate()\nend\nfunction s.textEntity(key,entityID,text,ms)\n    local prior=s.labels[key]\n    if prior and prior.uuid then AnyoneCore.removeTimedWorldText(prior.uuid) end\n    s.labels[key]=nil\n    if ms<=0 then return end\n    s.labels[key]={entityID=entityID,text=text,ends=s.now()+ms,pos={x=0,y=0,z=0}}\n    s.textUpdate()\nend\nfunction s.textUpdate()\n    local now=s.now()\n    for key,label in pairs(s.labels) do\n        local ent=TensorCore.mGetEntity(label.entityID)\n        if now>=label.ends then\n            if label.uuid then AnyoneCore.removeTimedWorldText(label.uuid) end\n            s.labels[key]=nil\n        elseif not ent or not ent.pos then\n            if label.uuid then AnyoneCore.removeTimedWorldText(label.uuid);label.uuid=nil end\n        else\n            local pos=label.pos\n            local y=ent.pos.y+1.5\n            if not label.uuid or math.abs(ent.pos.x-pos.x)>0.05 or\n                math.abs(ent.pos.z-pos.z)>0.05 or math.abs(y-pos.y)>0.05 then\n                if label.uuid then AnyoneCore.removeTimedWorldText(label.uuid) end\n                pos.x,pos.y,pos.z=ent.pos.x,y,ent.pos.z\n                label.uuid=AnyoneCore.addTimedWorldText(label.ends-now,label.text,pos,AnyoneCore.COLOR_WHITE,true,1)\n            end\n        end\n    end\nend\nfunction s.markerPlayer(e)\n    local r=s.roster()\n    if not r then return nil end\n    if e.entityID and r.slotOf(e.entityID) then return e.entityID end\n    if e.entityID2 and r.slotOf(e.entityID2) then return e.entityID2 end\nend\nfunction s.duration(e,extra)\n    return math.max(100, (e.channelTimeMax or 0)*1000 + (extra or 200))\nend\nfunction s.rememberBoss(e) s.bossID=e.entityID end\n\n-- Most geometry follows channel casters. Portal beams instead use OnAOECreate's\n-- world origin: the paired beams are offset +/-16y from the caster. Channel events\n-- only reserve an unresolved hazard until that geometry arrives.\nlocal defs = {\n    [49977]={kind=\"circle\",outer=40,solve=true},\n    [49978]={kind=\"donut\",inner=40,outer=60,solve=true},\n    [49979]={kind=\"circle\",outer=12,solve=true},\n    [49980]={kind=\"donut\",inner=6,outer=40,solve=true},\n    [49985]={kind=\"rect\",length=80,width=16,solve=true,portal=true},\n    [49986]={kind=\"rect\",length=80,width=16,solve=true,portal=true},\n    [49987]={kind=\"rect\",length=80,width=16,solve=true,portal=true},\n    [50005]={kind=\"cone\",outer=40,angle=math.pi/4},\n    [49998]={kind=\"sector\",inner=17,outer=19,angle=math.pi/9},\n    [49999]={kind=\"sector\",inner=17,outer=19,angle=2*math.pi/9},\n    [50000]={kind=\"sector\",inner=17,outer=19,angle=math.pi/3},\n    -- AnyoneCore's inherited Predraw Vacuum supplies this visual. Keep its\n    -- actual geometry here so personal destinations still avoid the circles.\n    [50001]={kind=\"circle\",outer=7,externalDraw=true},\n    [49369]={kind=\"circle\",outer=8},\n    [50017]={kind=\"rect\",length=100,width=4},\n    [50021]={kind=\"rect\",length=100,width=8,target=true},\n    [48475]={kind=\"circle\",outer=6},\n}\nlocal function renderHazard(key,h)\n    if h.def.portal then\n        -- Never substitute caster.pos: this would fill the paired beam's safe lane.\n        if not h.world then h.unresolved=true;return end\n        local p=h.world\n        local ms=h.ends-s.now()\n        if ms<=0 then return end\n        h.uuid=s.moogle:addTimedRect(ms,p.x,p.y,p.z,h.def.length,h.def.width,p.h,0,false,true)\n        s.add(key,h.uuid)\n        h.unresolved=nil\n        return\n    end\n    if h.world then return end -- Other world effects are drawn by their event handler.\n    if h.def.externalDraw then h.suppressed=true;return end\n    local d=h.def\n    local actor=TensorCore.mGetEntity(h.id)\n    local target=h.target and TensorCore.mGetEntity(h.target)\n    if not actor or not actor.pos or (d.target and (not target or not target.pos)) then\n        h.unresolved=true\n        return\n    end\n    local ms=h.ends-s.now()\n    if ms<=0 then return end\n    local uuid\n    if d.kind==\"circle\" then uuid=s.moogle:addTimedCircleOnEnt(ms,h.id,d.outer,0,false,true)\n    elseif d.kind==\"donut\" then uuid=s.moogle:addTimedDonutOnEnt(ms,h.id,d.inner,d.outer,0,false,true)\n    elseif d.kind==\"rect\" then uuid=s.moogle:addTimedRectOnEnt(ms,h.id,d.length,d.width,h.target,0,true,false,true)\n    elseif d.kind==\"cone\" then uuid=s.moogle:addTimedConeOnEnt(ms,h.id,d.outer,d.angle,nil,0,false,true)\n    elseif d.kind==\"sector\" then uuid=s.moogle:addTimedDonutConeOnEnt(ms,h.id,d.inner,d.outer,d.angle,nil,0,false,true)\n    end\n    s.add(key,uuid)\n    h.uuid=uuid\n    if h.unresolved then\n        h.unresolved=nil\n        s.solveAt=s.now()+100\n    end\nend\nfunction s.hazardStart(e)\n    local d=defs[e.spellID]\n    if not d then return end\n    -- Portal impacts arrive about 0.25-0.32s after the channel duration.\n    -- Keep them through impact; the actual hit clears them first.\n    local ms=s.duration(e,d.portal and 500 or nil)\n    local key=\"aoe:\"..e.entityID..\":\"..e.spellID\n    local prior=s.hazards[key]\n    -- Channel/AOE notifications belong to one packet batch. Preserve a world\n    -- snapshot that arrived first; the next real cast is several seconds later.\n    if d.portal and prior and prior.world and s.now()-prior.started<1000 then return end\n    if e.spellID==50001 then\n        local advanceKey=\"vacuumAdvance:\"..e.entityID\n        s.clear(advanceKey);s.hazards[advanceKey]=nil\n    end\n    s.clear(key)\n    local h={id=e.entityID,spell=e.spellID,def=d,started=s.now(),ends=s.now()+ms,target=d.target and e.targetID or nil}\n    s.hazards[key]=h\n    -- Even a non-portal AOE can invalidate the previous destination immediately.\n    s.clear(\"portalGuide\")\n    s.solveAt=s.now()+1500\n    renderHazard(key,h)\nend\nfunction s.portalHazard(e)\n    local d=defs[e.aoeID]\n    if not d or not d.portal then return end\n    if type(e.entityID)~=\"number\" or type(e.x)~=\"number\" or type(e.y)~=\"number\" or\n        type(e.z)~=\"number\" or type(e.heading)~=\"number\" or\n        type(e.duration)~=\"number\" or e.duration<=0 then return end\n    local now=s.now()\n    local key=\"aoe:\"..e.entityID..\":\"..e.aoeID\n    local prior=s.hazards[key]\n    local ends=now+e.duration*1000+500\n    local started=now\n    if prior and now-prior.started<1000 then\n        if prior.world then return end -- Duplicate notification must not extend the draw.\n        ends=math.min(ends,prior.ends)\n        started=prior.started\n    end\n    s.clear(key)\n    local h={id=e.entityID,spell=e.aoeID,def=d,started=started,ends=ends,\n        world={x=e.x,y=e.y,z=e.z,h=e.heading}}\n    s.hazards[key]=h\n    s.clear(\"portalGuide\");s.solveAt=now+1500\n    renderHazard(key,h)\nend\nfunction s.hazardEnd(e)\n    local key=\"aoe:\"..e.entityID..\":\"..e.spellID\n    local hazard=s.hazards[key]\n    if hazard and s.now()>=hazard.ends-1200 then\n        s.clear(key); s.hazards[key]=nil\n        s.clear(\"portalGuide\"); s.solveAt=s.now()+100\n    end\nend\nlocal sample={x=0,y=0,z=0}\nfunction s.isSafe(x,z,margin)\n    margin=margin or 0.8\n    if (x-100)^2+(z-100)^2>(19-margin)^2 then return false end\n    sample.x,sample.z=x,z\n    local now=s.now()\n    for _,h in pairs(s.hazards) do\n        if h.ends>now then\n            if h.def.portal and not h.world then return false end\n            local a=not h.world and TensorCore.mGetEntity(h.id)\n            local position=h.world or (a and a.pos)\n            if not position then return false end\n            local d=h.def\n            local dx,dz=x-position.x,z-position.z\n            local distance=math.sqrt(dx*dx+dz*dz)\n            if d.kind==\"circle\" then\n                if distance<d.outer+margin then return false end\n            elseif d.kind==\"donut\" then\n                if distance>d.inner-margin and distance<d.outer+margin then return false end\n            else\n                local heading=position.h\n                if d.target then\n                    local t=h.target and TensorCore.mGetEntity(h.target)\n                    if not t or not t.pos then return false end\n                    heading=TensorCore.getHeadingToTarget(position,t.pos)\n                end\n                if type(heading)~=\"number\" then return false end\n                if d.kind==\"cone\" and distance<=margin then return false end\n                local angle=TensorCore.getHeadingToTarget(position,sample)-heading\n                local forward,lateral=distance*math.cos(angle),math.abs(distance*math.sin(angle))\n                if d.kind==\"rect\" then\n                    if forward>-margin and forward<d.length+margin and lateral<d.width/2+margin then return false end\n                elseif distance<(d.outer+margin) and (not d.inner or distance>d.inner-margin) then\n                    local half=d.angle/2+math.asin(math.min(1,margin/math.max(0.01,distance)))\n                    if math.cos(angle)>math.cos(half) then return false end\n                end\n            end\n        end\n    end\n    return true\nend\nfunction s.hazardUpdate()\n    local now=s.now()\n    local unresolved=false\n    for key,h in pairs(s.hazards) do\n        if now>=h.ends then\n            s.clear(key);s.hazards[key]=nil\n            s.clear(\"portalGuide\");s.solveAt=now+100\n        else\n            if not h.uuid and not h.suppressed then renderHazard(key,h) end\n            if not h.world then\n                local actor=TensorCore.mGetEntity(h.id)\n                local target=h.target and TensorCore.mGetEntity(h.target)\n                if h.def.portal or not actor or not actor.pos or\n                    (h.def.target and (not target or not target.pos)) then unresolved=true end\n            end\n        end\n    end\n    -- Naught Wakes beams describe the whole pattern; the player chooses any\n    -- safe area. Keep the exact world rectangles, without a suggested position.\n    for _,h in pairs(s.hazards) do\n        if h.def.portal then\n            s.clear(\"portalGuide\");s.solveAt=now+100;return\n        end\n    end\n    -- Return stacks follow the actual healer, not an arbitrary solved point.\n    -- The colored healer lines/circles remain live while this arrow is hidden.\n    for _,marker in pairs(s.markerLines) do\n        if marker.ends>now then\n            s.clear(\"portalGuide\");s.solveAt=now+100;return\n        end\n    end\n    local guide=s.points.portalGuide\n    if guide and not s.isSafe(guide.pos.x,guide.pos.z,1) then\n        s.clear(\"portalGuide\");s.solveAt=now+100\n    end\n    if not s.solveAt or now<s.solveAt then return end\n    if unresolved then s.clear(\"portalGuide\");s.solveAt=now+100;return end\n    s.solveAt=nil\n    local expires,count=nil,0\n    for _,h in pairs(s.hazards) do\n        if h.def.solve then count=count+1;expires=math.min(expires or h.ends,h.ends) end\n    end\n    if count==0 or expires-now<350 then return end\n    local player=TensorCore.mGetPlayer()\n    if not player or not player.pos then return end\n    -- Closest safe interior grid point, avoiding sub-yalm slivers at AOE edges.\n    local bx,bz,best\n    for x=82,118 do for z=82,118 do\n        if s.isSafe(x,z,1) then\n            local score=(x-player.pos.x)^2+(z-player.pos.z)^2\n            if not best or score<best then bx,bz,best=x,z,score end\n        end\n    end end\n    if bx then\n        s.arrowPoint(\"portalGuide\",bx,player.pos.y,bz,expires-now)\n        s.add(\"portalGuide\",s.green:addTimedCircle(expires-now,bx,player.pos.y,bz,0.6,0,false,true))\n    end\nend\n\nlocal west={T1=true,H1=true,M1=true,R1=true}\nlocal pairConeTargets={\"T1\",\"T2\",\"H1\",\"H2\"}\n-- Hector role pairs: NW T1/R1, SE T2/M2, SW H1/M1, NE H2/R2.\nlocal pairConeOf={T1=\"T1\",R1=\"T1\",T2=\"T2\",M2=\"T2\",H1=\"H1\",M1=\"H1\",H2=\"H2\",R2=\"H2\"}\nlocal stackConeTargets={\"H1\",\"H2\"}\nlocal pairPoint={T1={95,95},H2={105,95},H1={95,105},T2={105,105}}\nfunction s.emptinessEnd()\n    s.clear(\"emptiness\")\n    for i=1,#pairConeTargets do s.clear(\"emptiness:\"..pairConeTargets[i]) end\n    s.emptinessState=nil\nend\nfunction s.emptinessUpdate()\n    local e=s.emptinessState\n    if not e then return end\n    local now=s.now()\n    if now>=e.ends then s.emptinessEnd();return end\n    local r=s.roster()\n    local boss=TensorCore.mGetEntity(e.bossID)\n    if not r or not boss or not boss.pos then\n        s.clear(\"emptiness\");e.guideSlot=nil\n        for i=1,#pairConeTargets do s.clear(\"emptiness:\"..pairConeTargets[i]) end\n        e.drawn={};e.ownCone=nil;return\n    end\n    local slot=s.slot()\n    local pairOwner=slot and pairConeOf[slot]\n    local ownCone=pairOwner and (e.pairs and pairOwner or (west[slot] and \"H1\" or \"H2\"))\n    -- Hector positions are roster-based. The arrow stays on the arena and an\n    -- edited or late roster updates its destination until the mechanic resolves.\n    if not pairOwner then\n        s.clear(\"emptiness\");e.guideSlot=nil\n    elseif e.guideSlot~=slot then\n        local point=e.pairs and pairPoint[ownCone] or nil\n        if not e.pairs or point then\n            local x,z\n            if point then x,z=point[1],point[2]\n            else x,z=west[slot] and 93 or 107,100 end\n            if s.arenaArrow(\"emptiness\",x,boss.pos.y,z,e.ends-now) then\n                e.guideSlot=slot\n            end\n        end\n    end\n    local targets=e.pairs and pairConeTargets or stackConeTargets\n    if e.ownCone~=ownCone then\n        -- A late or edited roster assignment must update colors on existing cones.\n        for i=1,#pairConeTargets do s.clear(\"emptiness:\"..pairConeTargets[i]) end\n        e.drawn={};e.ownCone=ownCone\n    end\n    for i=1,#targets do\n        local slot=targets[i]\n        local ent=r.entOf(slot)\n        local key=\"emptiness:\"..slot\n        if not ent or not ent.alive then\n            s.clear(key);e.drawn[slot]=nil\n        elseif e.drawn[slot]~=ent.id then\n            s.clear(key)\n            -- BossMod documents 60y, full 60 degrees for pairs, 100 for stacks.\n            -- Without an assigned own slot, keep neutral geometry until resolved.\n            local drawer=ownCone and (slot==ownCone and s.green or s.red) or s.moogle\n            local uuid=drawer:addTimedConeOnEnt(e.ends-now,e.bossID,60,\n                e.pairs and math.pi/3 or 5*math.pi/9,ent.id,0,false,true)\n            s.add(key,uuid)\n            if uuid then e.drawn[slot]=ent.id end\n        end\n    end\nend\nfunction s.emptiness(e)\n    s.rememberBoss(e)\n    s.emptinessEnd()\n    -- Observed resolve is about five seconds after channel start, including\n    -- the channel packet's 3.7s remaining cast and the delayed cone hit.\n    local ms=s.duration(e,1400)\n    s.emptinessState={bossID=e.entityID,pairs=e.spellID==50032,ends=s.now()+ms,drawn={}}\n    s.emptinessUpdate()\nend\nfunction s.freeze(e)\n    s.rememberBoss(e)\n    s.clear(\"freeze\")\n    local p,slot=TensorCore.mGetPlayer(),s.slot()\n    if not p or not p.pos or (slot~=\"T1\" and slot~=\"T2\") then return end\n    local x=slot==\"T1\" and 88 or 112\n    s.arenaArrow(\"freeze\",x,p.pos.y,88,s.duration(e,750),s.redArrow)\nend\nfunction s.holy(e)\n    local target=TensorCore.mGetEntity(e.targetID)\n    if not target then return end\n    local key=\"holy:\"..e.entityID\n    s.clear(key)\n    local r,slot=s.roster(),s.slot()\n    local targetSlot=r and r.slotOf(target.id)\n    local drawer=s.blue\n    -- Color the actual stack target by AnyoneCore light party, never proximity.\n    if pairConeOf[slot] and pairConeOf[targetSlot] then\n        drawer=west[slot]==west[targetSlot] and s.green or s.red\n    end\n    s.add(key,drawer:addTimedCircleOnEnt(s.duration(e),target.id,6,0,false,true))\nend\nfunction s.dimensionMarker(e)\n    local id=s.markerPlayer(e)\n    if not id then return end\n    local now=s.now()\n    if s.dimensionState and now>=s.dimensionState.ends then s.dimensionEnd() end\n    s.dimensionPending={id=id,seenAt=now}\n    s.dimensionID=id\n    local d=s.dimensionState\n    if d and now<d.ends then d.targetID=id end\n    s.dimensionUpdate()\nend\nfunction s.dimension(e)\n    s.rememberBoss(e)\n    local now=s.now()\n    local previous=s.dimensionState\n    if previous and previous.casterID==e.entityID and now-previous.startedAt<1000 then return end\n    s.clear(\"dimension\")\n    s.dimensionCount=(s.dimensionCount or 0)+1\n    local pending=s.dimensionPending\n    local id=pending and now-pending.seenAt<=7000 and pending.id or nil\n    s.dimensionID=id\n    s.dimensionState={casterID=e.entityID,startedAt=now,targetID=id,hits=0,\n        expectedHits=s.dimensionCount==1 and 3 or 4,\n        firstHitAt=now+math.max(0,e.channelTimeMax*1000-1000),ends=now+s.duration(e,5000)}\n    s.dimensionUpdate()\nend\nfunction s.dimensionUpdate()\n    local d=s.dimensionState\n    if not d then return end\n    local now=s.now()\n    if now>=d.ends then s.dimensionEnd();return end\n    if not d.targetID or not TensorCore.mGetEntity(d.targetID)\n        or not TensorCore.mGetEntity(d.casterID) then\n        if d.drawnID then s.clear(\"dimension\");d.drawnID=nil end\n        return\n    end\n    if d.drawnID~=d.targetID then\n        s.clear(\"dimension\")\n        -- Attached bottom-center rectangle follows the actual caster and target.\n        local uuid=s.blue:addTimedRectOnEnt(d.ends-now,d.casterID,60,8,d.targetID,0,true,false,true)\n        s.add(\"dimension\",uuid)\n        if uuid then d.drawnID=d.targetID end\n    end\nend\nfunction s.dimensionEnd()\n    s.clear(\"dimension\")\n    s.dimensionState,s.dimensionPending,s.dimensionID=nil,nil,nil\nend\nfunction s.dimensionResolve(e)\n    local d=s.dimensionState\n    local now=s.now()\n    if not d or e.entityID~=d.casterID or now<d.firstHitAt\n        or (d.lastHitAt and now-d.lastHitAt<500) then return end\n    d.lastHitAt=now\n    d.hits=d.hits+1\n    if d.hits>=d.expectedHits then s.dimensionEnd() end\nend\nlocal function returnFriendly(id,big)\n    if big then return true end\n    local r,slot=s.roster(),s.slot()\n    if not r or not slot then return nil end\n    local healer=r.idOf(west[slot] and \"H1\" or \"H2\")\n    if not healer then return nil end\n    return healer==id\nend\nfunction s.returnMarker(e)\n    local id=s.markerPlayer(e)\n    if not id then return end\n    s.clear(\"return:\"..id)\n    s.clear(\"return-healer:\"..id)\n    s.markerLines[id]={id=id,big=e.markerID==702,ends=s.now()+9600,pos={x=0,y=0,z=0}}\n    s.clear(\"portalGuide\");s.solveAt=s.now()+100\nend\nfunction s.returnUpdate()\n    local now=s.now()\n    local boss=s.bossID and TensorCore.mGetEntity(s.bossID)\n    for id,l in pairs(s.markerLines) do\n        local target=TensorCore.mGetEntity(id)\n        local key=\"return:\"..id\n        local healerKey=\"return-healer:\"..id\n        if now>=l.ends then\n            s.clear(key);s.clear(healerKey);s.markerLines[id]=nil\n        elseif not boss or not boss.pos or not target or not target.pos or not target.alive then\n            s.clear(key);s.clear(healerKey);l.uuid=nil;l.drawIndex=nil;l.friendly=nil;l.styleInitialized=nil\n        else\n            local friendly=returnFriendly(id,l.big)\n            local drawer=friendly==true and s.green or (friendly==false and s.red or s.blue)\n            if l.friendly~=friendly or not l.styleInitialized then\n                s.clear(key);s.clear(healerKey);l.uuid=nil;l.drawIndex=nil\n                l.friendly=friendly\n                -- Charge rectangles show group ownership without healer dots.\n                l.styleInitialized=true\n            end\n            local dx,dz=target.pos.x-boss.pos.x,target.pos.z-boss.pos.z\n            local len=math.sqrt(dx*dx+dz*dz)\n            if len>0.1 then\n                local ox,oz=target.pos.x+7*dx/len,target.pos.z+7*dz/len\n                local pos=l.pos\n                pos.x,pos.y,pos.z=ox,target.pos.y,oz\n                local heading=TensorCore.getHeadingToTarget(pos,boss.pos)\n                -- addTimedRect anchors its BOTTOM CENTER at the outer source.\n                local updated=l.uuid and drawer:updateTimedRect(l.uuid,nil,ox,pos.y,oz,len+7,6,heading,0,false,true)\n                if not updated then\n                    l.uuid=drawer:addTimedRect(l.ends-now,ox,pos.y,oz,len+7,6,heading,0,false,true)\n                    local list=s.draws[key]\n                    if list and l.drawIndex then list[l.drawIndex]=l.uuid or false\n                    else l.drawIndex=s.add(key,l.uuid) end\n                end\n            else\n                s.clear(key);l.uuid=nil;l.drawIndex=nil\n            end\n        end\n    end\nend\nfunction s.returnEnd()\n    for id in pairs(s.markerLines) do s.clear(\"return:\"..id);s.clear(\"return-healer:\"..id) end\n    s.markerLines={}\nend\n\n-- Appended once to the pull-scoped setup action after its common helpers.\n-- Event IDs belong in native Event conditions, not in these action callbacks.\nlocal s = data.kaptinEnuo\nlocal gazeRank = {T1=1, T2=1, H1=2, H2=2, M1=3, M2=3, R1=4, R2=4}\nlocal twoPi = 2 * math.pi\n\nlocal function gazeClose()\n    s.clear(\"gaze\") -- Remove any previous-version arrow.\n    s.clear(\"gaze:yellow\")\n    s.clear(\"gaze:purple\")\n    s.gaze = nil\nend\n\nlocal function gazeAngleLess(a, b)\n    return a.delta < b.delta\nend\n\n-- Resolve only the eight actors received through clock-tether events. There is\n-- no world entity scan. Missing actors are retried while this mechanic is live.\nlocal function gazeResolve(g)\n    if g.ordered or g.count ~= 8 then return end\n    local yellow, purple = g.groups[407], g.groups[406]\n    if #yellow ~= 4 or #purple ~= 4 then return end\n    for _, color in ipairs(g.colorOrder) do\n        local group = g.groups[color]\n        local big, bigCount = nil, 0\n        for i = 1, 4 do\n            local orb = group[i]\n            if not orb.angle then\n                local entity = TensorCore.mGetEntity(orb.id)\n                if not entity or not entity.pos then return end\n                -- Actual clock-orb models verified in both Gaze sequences of\n                -- the 20261010-1534-1362-1 clear. Avoid hitbox-size guesses.\n                local model=Argus.getEntityModel(orb.id)\n                if model==19910 then orb.big=true\n                elseif model==19909 then orb.big=false\n                else return end\n                local dx, dz = entity.pos.x - 100, entity.pos.z - 100\n                if dx * dx + dz * dz < 0.01 then return end\n                -- N=0, E=pi/2: increasing angles are clockwise in X/Z.\n                orb.angle = math.atan2(dx, -dz) % twoPi\n            end\n            if orb.big then big, bigCount = orb, bigCount + 1 end\n        end\n        if bigCount ~= 1 then return end\n        for i = 1, 4 do\n            local orb = group[i]\n            orb.delta = (orb.angle - big.angle) % twoPi\n        end\n        table.sort(group, gazeAngleLess)\n        for i = 2, 4 do\n            if group[i].delta - group[i - 1].delta < 0.01 then return end\n        end\n    end\n    g.ordered = true\nend\n\nfunction s.gazeStart(e)\n    gazeClose()\n    s.gaze = {\n        expires = s.now() + 45000, -- Lifecycle ceiling, not a detonation prediction.\n        groups = {[406]={}, [407]={}},\n        colorOrder = {407, 406},\n        orbs = {},\n        count = 0,\n        ordered = false,\n    }\nend\n\nfunction s.gazeUpdate()\n    local g=s.gaze\n    if not g then return end\n    local now=s.now()\n    if now>=g.expires then gazeClose();return end\n    gazeResolve(g)\n    local rank=gazeRank[s.slot()]\n    if not g.ordered or not rank then\n        s.clear(\"gaze:yellow\");s.clear(\"gaze:purple\")\n        g.shownRank=nil\n        return\n    end\n    local yellow,purple=g.groups[407][rank],g.groups[406][rank]\n    g.yellowID,g.purpleID=yellow.id,purple.id\n    if g.shownRank~=rank then\n        s.clear(\"gaze:yellow\");s.clear(\"gaze:purple\")\n        g.shownRank=rank\n        g.yellowShown,g.purpleShown=nil,nil\n        g.display={{key=\"gaze:yellow\",orb=yellow,number=\"1\",shown=\"yellowShown\"},\n                   {key=\"gaze:purple\",orb=purple,number=\"2\",shown=\"purpleShown\"}}\n    end\n    -- Numbers are the personal soak order, not a movement arrow. Keep both\n    -- assigned orbs visible so the player can plan yellow then purple.\n    -- The existing magic-vulnerability requirement still applies between them.\n    for _,entry in ipairs(g.display) do\n        local entity=TensorCore.mGetEntity(entry.orb.id)\n        if entry.orb.burst or not entity then\n            s.clear(entry.key);g[entry.shown]=nil\n        elseif not g[entry.shown] then\n            local remaining=g.expires-now\n            s.add(entry.key,s.green:addTimedCircleOnEnt(\n                remaining,entry.orb.id,entry.orb.big and 6 or 5,0,false,true))\n            s.textEntity(entry.key,entry.orb.id,entry.number,remaining)\n            g[entry.shown]=entry.orb.id\n        end\n    end\n    if yellow.burst and purple.burst then gazeClose() end\nend\n\nfunction s.gazeTether(e)\n    local g = s.gaze\n    if not g or s.now() >= g.expires then\n        if g then gazeClose() end\n        return\n    end\n    local group = g.groups[e.newTetherID]\n    if not group or g.orbs[e.sourceEntityID] then return end\n    -- A ninth clock source or fifth same-color orb makes this set ambiguous.\n    if g.count == 8 or #group == 4 then gazeClose(); return end\n    local orb = {id=e.sourceEntityID}\n    g.orbs[orb.id] = orb\n    group[#group + 1] = orb\n    g.count = g.count + 1\n    s.gazeUpdate()\nend\n\nfunction s.gazeBurst(e)\n    local g = s.gaze\n    if not g then return end\n    local orb = g.orbs[e.entityID]\n    if not orb then return end\n    -- Duplicate packets never postpone the second soak.\n    if not orb.burst then orb.burst = s.now() end\n    s.gazeUpdate()\nend\n\n-- Append to the pull-scoped initialization action. Event identity is gated in GUI.\n-- Original Hector tower priority, using actual tower and Looming Shadow positions.\nlocal s = data.kaptinEnuo\nlocal interKey, gauntletKey = \"intermissionGuide\", \"gauntletGuide\"\nlocal assignments = {\n    T1={west=true,north=true,pair=\"R1\"}, R1={west=true,north=true,pair=\"T1\"},\n    H1={west=true,north=false,pair=\"M1\"}, M1={west=true,north=false,pair=\"H1\"},\n    H2={west=false,north=true,pair=\"R2\"}, R2={west=false,north=true,pair=\"H2\"},\n    T2={west=false,north=false,pair=\"M2\"}, M2={west=false,north=false,pair=\"T2\"}\n}\n-- Insert immediately after the existing intermission assignments table.\n-- Pair waymark preview is fixed on the arena; a resolved tower/bait has priority.\nlocal partnerKey = \"intermissionPartner\"\nlocal pairWaymarks={T1=5,R1=5,H2=6,R2=6,T2=7,M2=7,H1=8,M1=8}\n\nlocal function hidePartner(P)\n    if P and P.drawnMarker then\n        s.clear(partnerKey)\n        P.drawnMarker,P.x,P.y,P.z=nil,nil,nil,nil\n    end\nend\n\nfunction s.interPartnerClear()\n    s.clear(partnerKey)\n    s.interPartnerState=nil\nend\n\nfunction s.interPartnerHide()\n    hidePartner(s.interPartnerState)\nend\n\nfunction s.interPartnerUpdate()\n    local P=s.interPartnerState\n    if not P then return end\n    local now=s.now()\n    if now>=P.untilAt then s.interPartnerClear();return end\n    if P.nextAt and now<P.nextAt then return end\n    P.nextAt=now+100\n    local boss=TensorCore.mGetEntity(P.bossID)\n    if not boss then hidePartner(P);return end\n    if not boss.alive then s.interPartnerClear();return end\n    if boss.targetable then\n        P.seenTargetable=true\n    elseif P.seenTargetable then\n        s.interPartnerClear();return\n    end\n    local I=s.interState\n    if I and I.active and I.guideSignature then hidePartner(P);return end\n    local roster=s.roster()\n    local slot=roster and roster.mySlot()\n    local markerID=slot and pairWaymarks[slot]\n    if not markerID then hidePartner(P);return end\n    local x,y,z,active=Argus.getWaymarkInfo(markerID)\n    if not active then hidePartner(P);return end\n    if P.drawnMarker~=markerID or P.x~=x or P.y~=y or P.z~=z then\n        hidePartner(P)\n        local remaining=P.untilAt-now\n        if s.arenaArrow(partnerKey,x,y,z,remaining) then\n            P.drawnMarker,P.x,P.y,P.z=markerID,x,y,z\n        end\n    end\nend\n\nfunction s.interPartnerStart(e)\n    local now=s.now()\n    local previous=s.interPartnerState\n    if previous and previous.bossID==e.entityID\n        and now-previous.startedAt<1000 then return end\n    s.interPartnerClear()\n    s.interPartnerState={bossID=e.entityID,startedAt=now,untilAt=now+120000}\n    s.interPartnerUpdate()\nend\n\nlocal pendingMarkers, pendingTowers = {}, {}\n\nlocal function wipeGuide(I)\n    s.clear(interKey)\n    if I then I.guideSignature=nil end\nend\n\nfunction s.interClear()\n    s.interPartnerClear()\n    local I=s.interState\n    if I then I.active=false end\n    wipeGuide(I)\n    s.interState=nil\n    for key in pairs(pendingMarkers) do pendingMarkers[key]=nil end\n    for key in pairs(pendingTowers) do pendingTowers[key]=nil end\nend\n\nlocal function markerRecipient(record)\n    local roster=AnyoneCore and AnyoneCore.Roster\n    if not roster or not roster.current() then return nil end\n    local role=roster.slotOf(record.primary)\n    if role and assignments[role] then return record.primary,role end\n    role=roster.slotOf(record.secondary)\n    if role and assignments[role] then return record.secondary,role end\nend\n\nlocal function snapshotTower(tower)\n    if tower.x then return true end\n    local entity=TensorCore.mGetEntity(tower.id)\n    if not entity then return false end\n    tower.x,tower.y,tower.z=entity.pos.x,entity.pos.y,entity.pos.z\n    return true\nend\n\nfunction s.interStart(e)\n    local now=s.now()\n    local previous=s.interState\n    if previous and previous.active and previous.bossID==e.entityID\n        and now-previous.startedAt<1000 then return end\n    wipeGuide(previous)\n    s.clear(gauntletKey)\n    if s.gauntletState then s.gauntletState.drawnID=nil end\n    local I={active=true,bossID=e.entityID,startedAt=now,untilAt=now+10000,\n        towers={},markers={},marked={},markedIDs={},west={},east={},gapsWest={},gapsEast={}}\n    s.interState=I\n    -- Queued event reactions have no guaranteed order. Keep only adjacent packets.\n    for key,record in pairs(pendingMarkers) do\n        if now-record.seenAt<=1500 then I.markers[key]=record end\n        pendingMarkers[key]=nil\n    end\n    for id,tower in pairs(pendingTowers) do\n        if now-tower.seenAt<=1500 and tower.untilAt>now then I.towers[id]=tower end\n        pendingTowers[id]=nil\n    end\n    s.interUpdate()\nend\n\nfunction s.interMarker(e)\n    local now=s.now()\n    local record={primary=e.entityID,secondary=e.entityID2,seenAt=now}\n    local key=tostring(e.entityID)..\":\"..tostring(e.entityID2)\n    local I=s.interState\n    if I and I.active and now<I.untilAt then\n        I.markers[key]=record\n        I.dirty=true\n        s.interUpdate()\n    else\n        pendingMarkers[key]=record\n    end\nend\n\nfunction s.interTower(e)\n    local now=s.now()\n    local duration=e.channelTimeMax*1000\n    if duration<=0 then return end\n    local I=s.interState\n    if I and I.active and I.towers[e.entityID] then return end\n    local tower={id=e.entityID,seenAt=now,untilAt=now+duration}\n    snapshotTower(tower)\n    if I and I.active and now<I.untilAt then\n        I.towers[e.entityID]=tower\n        I.dirty=true\n        s.interUpdate()\n    else\n        pendingTowers[e.entityID]=tower\n    end\nend\n\nfunction s.interResolve(e)\n    local I=s.interState\n    if not I or not I.active then return end\n    local tower=I.towers[e.entityID]\n    local now=s.now()\n    -- A previous round's delayed resolve cannot end a newly started tower cast.\n    if not tower or now<tower.untilAt-1200 then return end\n    I.active=false\n    wipeGuide(I)\n    s.interPartnerUpdate()\n    s.gauntletUpdate()\nend\n\nlocal function northFirst(a,b)\n    if a.z==b.z then return a.x<b.x end\n    return a.z<b.z\nend\n\n-- The guide's eight fixed slots are between waymarks. Infer the regular ring\n-- from the actual first tower, then require every tower to fit that ring.\n-- Do not bisect occupied towers: an occupied-to-occupied gap can skip 2 slots.\nlocal function gapPoints(I,boss)\n    local step=math.pi/4\n    local base=TensorCore.getHeadingToTarget(boss.pos,I.west[1])\n    if not I.ring then\n        I.ring={}\n        for index=1,8 do I.ring[index]={index=index} end\n    end\n    for index=1,8 do I.ring[index].occupied=false end\n    local totalRadius,minRadius,maxRadius=0,math.huge,0\n    for _,tower in pairs(I.towers) do\n        local heading=TensorCore.getHeadingToTarget(boss.pos,tower)\n        local rel=(heading-base)%(2*math.pi)\n        local nearest=math.floor(rel/step+0.5)\n        local error=math.abs(rel-nearest*step)\n        if error>math.pi/90 then return false end -- strict 2-degree fit\n        local index=nearest%8+1\n        if I.ring[index].occupied then return false end\n        I.ring[index].occupied=true\n        local dx,dz=tower.x-boss.pos.x,tower.z-boss.pos.z\n        local radius=math.sqrt(dx*dx+dz*dz)\n        totalRadius=totalRadius+radius\n        minRadius,maxRadius=math.min(minRadius,radius),math.max(maxRadius,radius)\n    end\n    if minRadius<=0 or maxRadius-minRadius>1 then return false end\n    local radius=totalRadius/4\n    for n=#I.gapsWest,1,-1 do I.gapsWest[n]=nil end\n    for n=#I.gapsEast,1,-1 do I.gapsEast[n]=nil end\n    for index=1,8 do\n        local point=I.ring[index]\n        if not point.occupied then\n            local heading=base+(index-1)*step\n            point.x=boss.pos.x+radius*math.sin(heading)\n            point.y=boss.pos.y\n            point.z=boss.pos.z+radius*math.cos(heading)\n            if math.abs(point.x-boss.pos.x)<0.1 then return false end\n            local side=point.x<boss.pos.x and I.gapsWest or I.gapsEast\n            side[#side+1]=point\n        end\n    end\n    if #I.gapsWest~=2 or #I.gapsEast~=2 then return false end\n    table.sort(I.gapsWest,northFirst)\n    table.sort(I.gapsEast,northFirst)\n    return true\nend\n\nfunction s.interUpdate()\n    s.interPartnerUpdate()\n    local I=s.interState\n    if not I or not I.active then return end\n    local now=s.now()\n    if now>=I.untilAt then I.active=false;wipeGuide(I);return end\n    if I.nextAt and now<I.nextAt then return end\n    I.nextAt=now+100\n    local boss=TensorCore.mGetEntity(I.bossID)\n    local role=s.slot()\n    local assignment=role and assignments[role]\n    if not boss or not assignment then wipeGuide(I);return end\n    for key in pairs(I.marked) do I.marked[key]=nil end\n    for key in pairs(I.markedIDs) do I.markedIDs[key]=nil end\n    local markerCount=0\n    for _,record in pairs(I.markers) do\n        local id,slot=markerRecipient(record)\n        if slot and not I.marked[slot] then\n            I.marked[slot]=true\n            I.markedIDs[id]=true\n            markerCount=markerCount+1\n        end\n    end\n    -- Never infer an unmarked player until the complete marker batch is known.\n    if markerCount~=4 then wipeGuide(I);return end\n    -- A missing/dead player or unexpected marker on the other half must not\n    -- erase a valid local assignment. Resolve only this player's fixed Hector\n    -- side; ambiguous pairs on that same half still receive no guessed guide.\n    for slot,a in pairs(assignments) do\n        if a.west==assignment.west and I.marked[slot]==I.marked[a.pair] then\n            wipeGuide(I);return\n        end\n    end\n    for n=#I.west,1,-1 do I.west[n]=nil end\n    for n=#I.east,1,-1 do I.east[n]=nil end\n    local count,untilAt=0,I.untilAt\n    for _,tower in pairs(I.towers) do\n        if not snapshotTower(tower) then wipeGuide(I);return end\n        if math.abs(tower.x-boss.pos.x)<0.1 then wipeGuide(I);return end\n        local side=tower.x<boss.pos.x and I.west or I.east\n        side[#side+1]=tower\n        count=count+1\n        untilAt=math.min(untilAt,tower.untilAt+250)\n    end\n    if count~=4 or #I.west~=2 or #I.east~=2 then wipeGuide(I);return end\n    if now>=untilAt then I.active=false;wipeGuide(I);return end\n    table.sort(I.west,northFirst)\n    table.sort(I.east,northFirst)\n    local index=assignment.north and 1 or 2\n    local point,signature\n    if I.marked[role] then\n        if not gapPoints(I,boss) then wipeGuide(I);return end\n        point=(assignment.west and I.gapsWest or I.gapsEast)[index]\n        signature=\"bait:\"..role..\":\"..point.index\n    else\n        point=(assignment.west and I.west or I.east)[index]\n        signature=\"tower:\"..point.id\n    end\n    if I.guideSignature~=signature then\n        s.interPartnerHide()\n        wipeGuide(I)\n        s.arenaArrow(interKey,point.x,point.y,point.z,untilAt-now)\n        -- Keep the destination visible after the arrow hides on arrival.\n        -- Empty Shadow towers have a sourced 6-yalm soak radius.\n        s.add(interKey,s.green:addTimedCircle(untilAt-now,point.x,point.y,point.z,\n            I.marked[role] and 0.8 or 6,0,false,true))\n        I.guideSignature=signature\n    end\nend\n\n-- Numbered Gauntlet pairs are event-derived, never assigned from party role.\nlocal G={adds={}}\ns.gauntletState=G\nlocal function clearGauntlet()\n    s.clear(gauntletKey)\n    G.drawnID=nil\nend\n\nfunction s.gauntletClear()\n    clearGauntlet()\n    G.order,G.buffID,G.untilAt,G.seenAt=nil,nil,nil,nil\n    for order in pairs(G.adds) do G.adds[order]=nil end\nend\n\nfunction s.gauntletPlayer(e)\n    -- Bind this effect behind the native Event recipient-Self condition.\n    clearGauntlet()\n    local duration=e.buffDuration*1000\n    if duration<=0 then G.order=nil;return end\n    G.order=e.buffID-5357\n    G.buffID=e.buffID\n    G.untilAt=s.now()+math.min(duration,120000)\n    G.seenAt=s.now()\n    s.gauntletUpdate()\nend\n\nfunction s.gauntletAdd(e)\n    local duration=e.buffDuration*1000\n    if duration<=0 then return end\n    G.adds[e.buffID-5365]={id=e.entityID,buffID=e.buffID,\n        untilAt=s.now()+math.min(duration,120000)}\n    s.gauntletUpdate()\nend\n\nfunction s.gauntletUpdate()\n    if G.order==nil then return end\n    local now=s.now()\n    if now>=G.untilAt then clearGauntlet();G.order=nil;return end\n    if s.interState and s.interState.active then clearGauntlet();return end\n    local player=TensorCore.mGetPlayer()\n    if not TensorCore.hasBuff(player.id,G.buffID) then\n        clearGauntlet()\n        if now-G.seenAt>1500 then G.order=nil end\n        return\n    end\n    local add=G.adds[G.order]\n    local entity=add and TensorCore.mGetEntity(add.id)\n    if not entity or not entity.alive or now>=add.untilAt\n        or not TensorCore.hasBuff(add.id,add.buffID) then clearGauntlet();return end\n    if G.drawnID~=add.id then\n        clearGauntlet()\n        s.arrowEntity(gauntletKey,add.id,math.min(G.untilAt,add.untilAt)-now)\n        G.drawnID=add.id\n    end\nend\n\n-- Hector CW -> CW: direction cue plus observed player-to-player handoff.\n-- No destination circle and no guessed safe waypoint or predicted AOE position.\n-- Append once after the shared pull-scoped helpers; gate event IDs natively.\nlocal s = data.kaptinEnuo\n\nlocal function huntsClearDirection(g)\n    if g.directionUUID then s.clear(\"hunts-direction\") end\n    g.directionUUID, g.directionPlayer, g.directionHeading = nil, nil, nil\nend\n\nlocal function huntsClearHandoff(g)\n    if g.handoffSource then s.clear(\"hunts-handoff\") end\n    g.handoffSource = nil\nend\n\nlocal function huntsClearOrb(g)\n    s.clear(\"hunts-orb\")\n    g.orbGuideID=nil\nend\n\nlocal function huntsClose()\n    local g = s.hunts\n    if g then huntsClearDirection(g); huntsClearHandoff(g); huntsClearOrb(g) end\n    s.hunts = nil\nend\n\nfunction s.huntsStart(e)\n    huntsClose()\n    s.hunts = {\n        expires = s.now() + 45000, -- Bounded lifecycle; not predicted resolution.\n        chasers = {},\n        ordered = {},\n        passes = {},\n        passageDone = false,\n        directionPoint = {x=0, y=0, z=0},\n    }\nend\n\nfunction s.huntsUpdate()\n    local g = s.hunts\n    if not g then return end\n    local now = s.now()\n    if now >= g.expires then huntsClose(); return end\n    local player = TensorCore.mGetPlayer()\n    if not player or not player.alive then\n        huntsClearDirection(g); huntsClearHandoff(g); huntsClearOrb(g)\n        return\n    end\n    local current, handoff, active, conflictingHandoff = false, nil, 0, false\n    local myOrb\n    for i = 1, #g.ordered do\n        local chaser = g.ordered[i]\n        if not chaser.done then\n            active = active + 1\n            if chaser.owner == player.id then current = true; myOrb=chaser.id end\n            if chaser.owner == chaser.firstOwner then\n                local nextOwner = g.passes[chaser.firstOwner]\n                if nextOwner == player.id then\n                    if handoff and handoff ~= chaser.firstOwner then\n                        conflictingHandoff = true\n                    end\n                    handoff = chaser.firstOwner\n                end\n            end\n        end\n    end\n    if #g.ordered == 2 and active == 0 then huntsClose(); return end\n    -- Red LJ pointer identifies the dangerous orb currently tethered to self.\n    -- It is an identity cue; movement remains the separate clockwise arrow.\n    local orb=myOrb and TensorCore.mGetEntity(myOrb)\n    if not orb then myOrb=nil end\n    if g.orbGuideID~=myOrb then\n        huntsClearOrb(g)\n        if myOrb and s.arrowEntity(\"hunts-orb\",myOrb,g.expires-now,s.redArrow) then\n            g.orbGuideID=myOrb\n        end\n    end\n    if not g.passageDone then\n        huntsClearDirection(g); huntsClearHandoff(g)\n        return\n    end\n\n    -- The pending baiter follows the actual current baiter until ownership moves.\n    -- This is an entity destination, not a prediction of where the orb will land.\n    if current or conflictingHandoff then handoff = nil end\n    if handoff then\n        local target = TensorCore.mGetEntity(handoff)\n        if not target or not target.alive then handoff = nil end\n    end\n    if handoff ~= g.handoffSource then\n        huntsClearHandoff(g)\n        if handoff then\n            s.arrowEntity(\"hunts-handoff\", handoff, g.expires - now)\n            g.handoffSource = handoff\n        end\n    end\n\n    if not current then huntsClearDirection(g); return end\n    local pos = player.pos\n    if not pos then huntsClearDirection(g); return end\n    local dx, dz = pos.x - 100, pos.z - 100\n    if dx * dx + dz * dz < 1 then\n        -- There is no unique clockwise tangent at the arena center.\n        huntsClearDirection(g)\n        return\n    end\n    -- Clockwise tangent (-dz, dx); the public helper supplies game heading.\n    local directionPoint = g.directionPoint\n    directionPoint.x, directionPoint.y, directionPoint.z = pos.x - dz, pos.y, pos.z + dx\n    local heading = TensorCore.getHeadingToTarget(pos, directionPoint)\n    local remaining = g.expires - now\n    if not g.directionUUID then\n        g.directionUUID = s.lj:addTimedArrowOnEnt(\n            remaining, player.id, 3, 1, 3, 3, nil, 0, false, heading, true, s.overlay)\n        s.add(\"hunts-direction\", g.directionUUID)\n        g.directionPlayer, g.directionHeading = player.id, heading\n    elseif g.directionPlayer ~= player.id or\n        math.abs(math.sin((heading - g.directionHeading) / 2)) > 0.005 then\n        local updated = s.lj:updateTimedArrowOnEnt(\n            g.directionUUID, remaining, player.id, 3, 1, 3, 3,\n            nil, 0, false, heading, true, s.overlay)\n        if updated then\n            g.directionPlayer, g.directionHeading = player.id, heading\n        else\n            huntsClearDirection(g)\n        end\n    end\nend\n\nfunction s.huntsPassage(e)\n    local g = s.hunts\n    if not g then return end\n    g.passageDone = true\n    s.huntsUpdate()\nend\n\nfunction s.huntsTether(e)\n    local g = s.hunts\n    if not g or s.now() >= g.expires then\n        if g then huntsClose() end\n        return\n    end\n    if e.newTetherID == 404 then\n        local chaser = g.chasers[e.sourceEntityID]\n        if chaser then\n            -- An observed orb retarget overrides the count-derived owner.\n            chaser.owner = e.newTargetID\n        else\n            if #g.ordered == 2 then huntsClose(); return end\n            chaser = {\n                id = e.sourceEntityID,\n                firstOwner = e.newTargetID,\n                owner = e.newTargetID,\n                hits = 0,\n            }\n            g.chasers[chaser.id] = chaser\n            g.ordered[#g.ordered + 1] = chaser\n        end\n    else\n        -- Native Event condition permits only 404 or 405; 405 links baiters.\n        g.passes[e.sourceEntityID] = e.newTargetID\n        for i = 1, #g.ordered do\n            local chaser = g.ordered[i]\n            if not chaser.done and chaser.firstOwner == e.sourceEntityID and\n                chaser.hits >= 13 and\n                (chaser.owner == chaser.firstOwner or not chaser.owner) then\n                chaser.owner = e.newTargetID\n            end\n        end\n    end\n    s.huntsUpdate()\nend\n\nfunction s.huntsHit(e)\n    local g = s.hunts\n    if not g then return end\n    local chaser = g.chasers[e.entityID]\n    if not chaser or chaser.done then return end\n    if e.spellID == 48475 then\n        if chaser.started then return end\n        chaser.started, chaser.hits = true, 1\n    else\n        -- Without the initial cast, the ordinal is unknown: never infer a pass.\n        if not chaser.started then return end\n        chaser.hits = chaser.hits + 1\n    end\n    -- Public BossMod: 13 first-baiter hits, then 12 second-baiter hits.\n    -- Only the actual tracked orb's casts advance this counter.\n    if chaser.hits == 13 and chaser.owner == chaser.firstOwner then\n        chaser.owner = g.passes[chaser.firstOwner]\n    elseif chaser.hits >= 25 then\n        chaser.done, chaser.owner = true, nil\n    end\n    s.huntsUpdate()\nend\n\n-- Append once after data.kaptinEnuo common helpers. Native Event conditions\n-- own all action/status ID gates. This module provides visual guidance only.\n-- Public channel events do not expose ground targets: never substitute the\n-- helper actor position for a 50041 puddle's ground-target position.\nlocal s = data.kaptinEnuo\nlocal meltGuide = \"meltdownGuide\"\nlocal clockDirections = {\n    T1={0,-1}, T2={0,1}, H1={-1,0}, H2={1,0},\n    M1={-math.sqrt(0.5),math.sqrt(0.5)},\n    M2={math.sqrt(0.5),math.sqrt(0.5)},\n    R1={-math.sqrt(0.5),-math.sqrt(0.5)},\n    R2={math.sqrt(0.5),-math.sqrt(0.5)}\n}\n\nlocal function meltHide(m)\n    s.clear(meltGuide)\n    if m then m.shownX,m.shownZ,m.shownStage=nil,nil,nil end\nend\n\nlocal function meltClose()\n    local m=s.meltdown\n    meltHide(m)\n    if m then\n        for id in pairs(m.spreads) do s.clear(\"meltdownSpread:\"..id) end\n    end\n    s.meltdown=nil\nend\n\nlocal function meltShow(m,x,y,z,stage,untilAt)\n    local now=s.now()\n    if untilAt<=now then meltHide(m);return end\n    if m.shownX==x and m.shownZ==z and m.shownStage==stage then return end\n    if stage==\"bait\" then\n        s.clear(meltGuide)\n        -- Fixed LJ arrow from south into arena center, even when already there.\n        local uuid=s.lj:addTimedArrow(untilAt-now,100,y,107,math.pi,4,1,3,3,0,false,s.overlay)\n        if not uuid then return end\n        s.add(meltGuide,uuid)\n    else\n        s.arrowPoint(meltGuide,x,y,z,untilAt-now)\n        s.add(meltGuide,s.green:addTimedCircle(untilAt-now,x,y,z,0.65,0,false,true))\n    end\n    m.shownX,m.shownZ,m.shownStage=x,z,stage\nend\n\n-- Only exact cast ground coordinates are accepted as puddle evidence.\nlocal function meltGround(e)\n    local x,y,z=e.castPosX,e.castPosY,e.castPosZ\n    if type(x)~=\"number\" or type(y)~=\"number\" or type(z)~=\"number\" then return end\n    if x~=x or y~=y or z~=z then return end\n    local dx,dz=x-100,z-100\n    if dx*dx+dz*dz>22*22 then return end\n    return x,y,z\nend\n\nfunction s.meltdownStart(e)\n    local now=s.now()\n    local old=s.meltdown\n    if old and old.bossID==e.entityID and now-old.startedAt<1000 then return end\n    meltClose()\n    local duration=e.channelTimeMax*1000\n    if duration<=0 then return end\n    s.meltdown={bossID=e.entityID,startedAt=now,castUntil=now+duration,\n        -- Puddle channels follow the main cast; allow a bounded packet gap.\n        baitUntil=now+duration+2000,baitDone=false,\n        untilAt=now+20000,stage=\"bait\",sawBuff=false,holdUntil=0,\n        puddles={},puddleChannels={},spreads={}}\n    s.meltdownUpdate()\nend\n\n-- OnNewBuffEntry 4562 with native Event Entity = Self.\nfunction s.meltdownBuff(e)\n    local m=s.meltdown\n    if not m or s.now()>=m.untilAt then return end\n    m.sawBuff=true\n    m.stage=\"hold\"\n    -- Close the status-packet gap as well as observing the actual status.\n    if e.buffDuration>0 then\n        m.holdUntil=math.max(m.holdUntil,s.now()+e.buffDuration*1000)\n    end\n    meltHide(m)\nend\n\n-- OnEntityChannel 50041. The native game telegraph supplies the pre-explosion\n-- location; keep its exact deadline but draw no guessed custom ground circle.\nfunction s.meltdownPuddle(e)\n    local m=s.meltdown\n    if not m or s.now()>=m.untilAt then return end\n    if m.puddleChannels[e.entityID] then return end\n    local duration=e.channelTimeMax*1000\n    if duration>0 then\n        m.puddleChannels[e.entityID]=s.now()+duration\n        m.baitDone=true\n        if m.shownStage==\"bait\" then meltHide(m) end\n    end\nend\n\n-- OnEntityCast 50041. Cast coordinates arrive when this one-shot AoE resolves.\n-- Preserve them for diagnostics; they MUST NOT remain forbidden after resolve.\nfunction s.meltdownPuddleResolve(e)\n    local m=s.meltdown\n    if not m then return end\n    local due=m.puddleChannels[e.entityID]\n    if not due or s.now()<due-1000 then return end\n    local x,y,z=meltGround(e)\n    if x then m.puddles[e.entityID]={x=x,y=y,z=z,resolvedAt=s.now()} end\n    m.puddleChannels[e.entityID]=nil\n    s.meltdownUpdate()\nend\n\n-- OnEntityChannel 50042. Radius 5 is established by encounter action evidence.\n-- Entity attachment follows each actual cast target; no roster guess is used.\nfunction s.meltdownSpread(e)\n    local m=s.meltdown\n    if not m or s.now()>=m.untilAt or m.spreads[e.entityID] then return end\n    local duration=e.channelTimeMax*1000\n    local target=TensorCore.mGetEntity(e.targetID)\n    if duration<=0 or not target then return end\n    local untilAt=s.now()+duration\n    m.spreads[e.entityID]={targetID=e.targetID,untilAt=untilAt}\n    m.spreadUntil=math.max(m.spreadUntil or 0,untilAt)\n    s.add(\"meltdownSpread:\"..e.entityID,\n        s.moogle:addTimedCircleOnEnt(duration,target.id,5,0,false,true))\nend\n\n-- Narrow 100ms mechanic update. It never moves the player or disables attacks.\nfunction s.meltdownUpdate()\n    local m=s.meltdown\n    if not m then return end\n    local now=s.now()\n    if now>=m.untilAt then meltClose();return end\n    local player=TensorCore.mGetPlayer()\n    if not player or not player.alive then meltHide(m);return end\n    local hasNoMove=TensorCore.hasBuff(player,4562)\n    if hasNoMove then\n        m.sawBuff=true\n        m.stage=\"hold\"\n        meltHide(m)\n        return\n    end\n    if m.sawBuff then\n        if now<m.holdUntil then meltHide(m);return end\n        m.stage=\"spread\"\n    end\n\n    if m.stage==\"bait\" then\n        -- Center is not a valid Vacuum solution. Keep its native hazards clear.\n        if m.baitDone or now>=m.baitUntil or (s.vacuumActiveUntil and now<s.vacuumActiveUntil)\n            or not s.isSafe(100,100,0.7) then meltHide(m);return end\n        meltShow(m,100,player.pos.y,100,\"bait\",m.baitUntil)\n        return\n    end\n    if m.stage~=\"spread\" then meltHide(m);return end\n    local untilAt=m.spreadUntil\n    local direction=clockDirections[s.slot()]\n    if not untilAt or untilAt<=now or not direction then meltHide(m);return end\n    -- Guide clock directions, with conservative radius 12 inside the r20 arena.\n    -- When actual registered hazards block this clock point, extend along the\n    -- same clock only if the shared geometry solver proves the new point clear.\n    local radius=12\n    local x,z=100+direction[1]*radius,100+direction[2]*radius\n    if not s.isSafe(x,z,0.7) then\n        local safe=false\n        for candidate=13,18 do\n            local px,pz=100+direction[1]*candidate,100+direction[2]*candidate\n            if s.isSafe(px,pz,0.7) then x,z,safe=px,pz,true;break end\n        end\n        if not safe then meltHide(m);return end\n    end\n    meltShow(m,x,player.pos.y,z,\"spread\",untilAt)\nend\n\n-- OnEntityCast 50042. Ignore unmatched/stale helper events from previous cycles.\nfunction s.meltdownEnd(e)\n    local m=s.meltdown\n    if not m then return end\n    local spread=m.spreads[e.entityID]\n    if not spread or s.now()<spread.untilAt-1000 then return end\n    meltClose()\nend\n\nlocal s=data.kaptinEnuo\nfunction s.vacuumAppear(e)\n    if type(e.castPosX)~=\"number\" or type(e.castPosY)~=\"number\" or type(e.castPosZ)~=\"number\" then return end\n    local key=\"vacuumAdvance:\"..e.entityID\n    s.clear(key)\n    local world={x=e.castPosX,y=e.castPosY,z=e.castPosZ,h=0}\n    -- Visual is supplied by inherited AnyoneCore Predraw Vacuum; this is the\n    -- same confirmed ground geometry for our personal safe-point checks.\n    s.hazards[key]={id=e.entityID,world=world,def={kind=\"circle\",outer=7},ends=s.now()+2800}\n    s.clear(\"portalGuide\");s.solveAt=s.now()+100\nend\n\n\n-- Rotating Gaze cones only. The later numbered-orb soak keeps its own s.gaze state.\nlocal coneKey=\"gazeConeGuide\"\nlocal coneStep,coneRadius=math.pi/4,4\nlocal function angleDistance(a,b)\n    return math.abs((a-b+math.pi)%(2*math.pi)-math.pi)\nend\nlocal function coneDueBefore(a,b)\n    return a.due<b.due\nend\n\nfunction s.gazeConeClear()\n    s.clear(coneKey)\n    s.gazeCone=nil\nend\n\nlocal function coneInvalid(C)\n    C.invalid=true\n    s.clear(coneKey)\nend\n\nlocal function coneGuide(C,index,deadline)\n    local entry=C.entries[index]\n    local now=s.now()\n    if deadline<=now then s.clear(coneKey);return end\n    s.arenaArrow(coneKey,entry.x+coneRadius*math.sin(entry.h),entry.y,\n        entry.z+coneRadius*math.cos(entry.h),deadline-now)\nend\n\nlocal function coneValidate(C)\n    if #C.entries~=10 then return end\n    table.sort(C.entries,coneDueBefore)\n    local first,second=C.entries[1],C.entries[2]\n    local delta=(second.h-first.h+math.pi)%(2*math.pi)-math.pi\n    if math.abs(math.abs(delta)-coneStep)>0.03 then coneInvalid(C);return end\n    local direction=delta>0 and 1 or -1\n    for i,entry in ipairs(C.entries) do\n        local dx,dz=entry.x-first.x,entry.z-first.z\n        if dx*dx+dz*dz>0.04 or math.abs(entry.y-first.y)>0.2\n            or angleDistance(entry.h,first.h+(i-1)*direction*coneStep)>0.03 then\n            coneInvalid(C);return\n        end\n        entry.order=i\n    end\n    -- First eight headings are distinct, then headings one and two repeat.\n    C.ordered=true\n    coneGuide(C,8,C.entries[8].due-150)\nend\n\nfunction s.gazeConeChannel(e)\n    local now=s.now()\n    local C=s.gazeCone\n    if not C or now>=C.expires then\n        s.gazeConeClear()\n        C={entries={},byID={},lastHit=0,expires=now+15000}\n        s.gazeCone=C\n    end\n    if C.invalid or C.byID[e.entityID] then return end\n    if #C.entries==10 then coneInvalid(C);return end\n    local entity=TensorCore.mGetEntity(e.entityID)\n    if not entity or not entity.pos or e.channelTimeMax<=0 then coneInvalid(C);return end\n    local p=entity.pos\n    local entry={id=e.entityID,x=p.x,y=p.y,z=p.z,h=p.h,\n        due=now+e.channelTimeMax*1000}\n    C.entries[#C.entries+1]=entry\n    C.byID[entry.id]=entry\n    coneValidate(C)\nend\n\nfunction s.gazeConeHit(e)\n    local C=s.gazeCone\n    if not C or C.invalid then return end\n    if not C.ordered then coneInvalid(C);return end\n    local entry=C.byID[e.entityID]\n    if not entry then coneInvalid(C);return end\n    if entry.hit then return end\n    if entry.order~=C.lastHit+1 or angleDistance(e.heading,entry.h)>0.03 then\n        coneInvalid(C);return\n    end\n    entry.hit=true\n    C.lastHit=entry.order\n    if C.lastHit==1 then\n        coneGuide(C,1,C.entries[9].due-150)\n    elseif C.lastHit==3 then\n        coneGuide(C,3,C.entries[10].due+900)\n    elseif C.lastHit==10 then\n        s.gazeConeClear()\n    end\nend\n\nfunction s.gazeConeUpdate()\n    local C=s.gazeCone\n    if not C then return end\n    local now=s.now()\n    if now>=C.expires then s.gazeConeClear();return end\n    if C.invalid or not C.ordered then return end\n    local nextEntry=C.entries[C.lastHit+1]\n    -- Missing resolution packets must not leave a guide in a sector that repeats.\n    if nextEntry and now>nextEntry.due+900 then coneInvalid(C) end\nend\n\nself.used=true",
							name = "[Core] Initialize Hector draws",
							uuid = "2a77d601-02ac-f81b-8993-3c1101b45367",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Setup",
				mechanicTime = 14.2,
				name = "[Core] Initialize Hector draws",
				throttleTime = 100,
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 1785.8,
				timerStartOffset = -44.2,
				uuid = "e3d12290-8f6e-250c-9f12-303b1d7d72ad",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardUpdate()\ns.pointUpdate()\ns.returnUpdate()\ns.emptinessUpdate()\ns.dimensionUpdate()\nif s.gaze then s.gazeUpdate() end\ns.gazeConeUpdate()\ns.interUpdate()\ns.gauntletUpdate()\nif s.hunts then s.huntsUpdate() end\ns.meltdownUpdate()\nend\nself.used=true",
							name = "[Core] Refresh active guidance",
							uuid = "20db13e2-1b07-5317-8425-f47ea6c0489a",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Setup",
				loop = true,
				mechanicTime = 14.2,
				name = "[Core] Refresh active guidance",
				throttleTime = 100,
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 1785.8000488281,
				timerStartOffset = -44.200000762939,
				uuid = "dbd6523f-0973-89cb-bc75-c58e46a3ade5",
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
							actionLua = "local old=eventArgs.oldData and eventArgs.oldData.kaptinEnuo\nif old then old.clearAll() end\nself.used=true",
							name = "[Core] Remove own draws on wipe",
							uuid = "4542de9e-751a-b132-ac01-1dec49420315",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Setup",
				eventType = 9,
				loop = true,
				mechanicTime = 14.2,
				name = "[Core] Remove own draws on wipe",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 1785.8,
				timerStartOffset = -44.2,
				uuid = "3f9799a3-4dcd-1d23-be5d-437526019a77",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.clearAll()\nend\nself.used=true",
							name = "[Core] Remove own draws on map change",
							uuid = "5ddaae46-db97-f8b1-841a-e2ca4b524664",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Setup",
				eventType = 11,
				loop = true,
				mechanicTime = 14.2,
				name = "[Core] Remove own draws on map change",
				timeRange = true,
				timelineIndex = 2,
				timerEndOffset = 1785.8,
				timerStartOffset = -44.2,
				uuid = "9ba51e10-bab4-f9e0-8b64-55e36547cd4a",
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
				name = "Setup",
				uuid = "6a9b90a5-e812-b817-9f93-bf4a9e6f3a72",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.rememberBoss(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"99022880-0630-62f4-ad4a-fc51c3363009",
									true,
								},
							},
							name = "[Core] Track Enuo caster",
							uuid = "7290513c-4552-d42a-a6f9-b34a68d4ee82",
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
							name = "49975,49976,49973,49994,50040,50002,50043,50047,49992,50032,50033,50045",
							spellIDList = 
							{
								49975,
								49976,
								49973,
								49994,
								50040,
								50002,
								50043,
								50047,
								49992,
								50032,
								50033,
								50045,
							},
							uuid = "99022880-0630-62f4-ad4a-fc51c3363009",
							version = 3,
						},
					},
				},
				displayPath = "Setup",
				eventType = 3,
				loop = true,
				mechanicTime = 29.7,
				name = "[Core] Track Enuo caster",
				timeRange = true,
				timelineIndex = 4,
				timerEndOffset = 1770.3,
				timerStartOffset = -59.7,
				uuid = "08739718-ecd3-9b0c-a32d-48c3cdf37bad",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"789d7bdb-0828-de6b-a6a1-c9d591a903c8",
									true,
								},
							},
							name = "[Draw] Naught Grows - portal circle OUT",
							uuid = "234b87a9-dbbd-7b3f-b249-4a64e4354fb6",
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
							eventSpellID = 49977,
							name = "49977",
							uuid = "789d7bdb-0828-de6b-a6a1-c9d591a903c8",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 29.7,
				name = "[Draw] Naught Grows - portal circle OUT",
				timeRange = true,
				timelineIndex = 4,
				timerEndOffset = 1770.3,
				timerStartOffset = -59.7,
				uuid = "d5be364a-c06c-b54c-8450-d3da0787c22d",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"5f5fbcd2-44c7-a20b-9287-43990258ea7b",
									true,
								},
							},
							name = "[Draw] Naught Grows - portal donut IN",
							uuid = "485e8b66-ac95-1771-8078-3fe5a8fbea48",
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
							eventSpellID = 49978,
							name = "49978",
							uuid = "5f5fbcd2-44c7-a20b-9287-43990258ea7b",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 29.7,
				name = "[Draw] Naught Grows - portal donut IN",
				timeRange = true,
				timelineIndex = 4,
				timerEndOffset = 1770.3,
				timerStartOffset = -59.7,
				uuid = "c4fe2514-6c7a-fd76-ac20-553b8a0ca81f",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"08c1020f-a41f-ee99-b0a5-ac4ec98b02c4",
									true,
								},
							},
							name = "[Draw] Naught Grows - boss circle OUT",
							uuid = "009d01b5-8949-e38b-a872-f8971ac783ea",
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
							eventSpellID = 49979,
							name = "49979",
							uuid = "08c1020f-a41f-ee99-b0a5-ac4ec98b02c4",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 29.7,
				name = "[Draw] Naught Grows - boss circle OUT",
				timeRange = true,
				timelineIndex = 4,
				timerEndOffset = 1770.3,
				timerStartOffset = -59.7,
				uuid = "84c97663-814e-1ccd-b182-2ddd0cf1216d",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"5d5cc787-4d9d-63a6-a633-65d286380964",
									true,
								},
							},
							name = "[Draw] Naught Grows - boss donut IN",
							uuid = "c8ac4d1c-9d13-998e-9a5a-09a898445fe8",
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
							eventSpellID = 49980,
							name = "49980",
							uuid = "5d5cc787-4d9d-63a6-a633-65d286380964",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 29.7,
				name = "[Draw] Naught Grows - boss donut IN",
				timeRange = true,
				timelineIndex = 4,
				timerEndOffset = 1770.3,
				timerStartOffset = -59.7,
				uuid = "a6e34620-540f-fa74-8898-da771cf45991",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Cleanup",
				uuid = "62680bca-04bb-3386-8f95-67ae8e3a2bfa",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardEnd(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"91abd3a0-3655-a211-848a-103ced1afe9a",
									true,
								},
							},
							name = "[Clear] Resolved AOEs",
							uuid = "0d54d2ca-76f9-6484-84b8-62164f3cb033",
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
							name = "49977,49978,49979,49980,50005,49998,49999,50000,50001,49369,50017,50021,48475,49985,49986,49987",
							spellIDList = 
							{
								49977,
								49978,
								49979,
								49980,
								50005,
								49998,
								49999,
								50000,
								50001,
								49369,
								50017,
								50021,
								48475,
								49985,
								49986,
								49987,
							},
							uuid = "91abd3a0-3655-a211-848a-103ced1afe9a",
							version = 3,
						},
					},
				},
				displayPath = "Cleanup",
				eventType = 2,
				loop = true,
				mechanicTime = 29.7,
				name = "[Clear] Resolved AOEs",
				timeRange = true,
				timelineIndex = 4,
				timerEndOffset = 1770.3,
				timerStartOffset = -59.7,
				uuid = "d0443087-edb1-7cf9-b2ae-c25754f38cd7",
				version = 2,
			},
		},
	},
	[5] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.returnMarker(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"34a45353-75bb-1629-bdab-859d72547e5a",
									true,
								},
							},
							name = "[Draw] Return to Nothing - light-party lines",
							uuid = "51844631-89d6-cf39-b09c-e1fce3925e72",
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
							eventMarkerID = 701,
							name = "701",
							uuid = "34a45353-75bb-1629-bdab-859d72547e5a",
							version = 3,
						},
					},
				},
				eventType = 4,
				loop = true,
				mechanicTime = 30.4,
				name = "[Draw] Return to Nothing - light-party lines",
				timeRange = true,
				timelineIndex = 5,
				timerEndOffset = 1769.6,
				timerStartOffset = -60.4,
				uuid = "13121b27-a060-769b-b5b9-9c5a8f585da4",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.returnMarker(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"e085a4b4-217a-4d89-8167-d4d740be11c0",
									true,
								},
							},
							name = "[Draw] Great Return - party line",
							uuid = "ddddeaa7-841c-fc88-985a-174940a34168",
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
							eventMarkerID = 702,
							name = "702",
							uuid = "e085a4b4-217a-4d89-8167-d4d740be11c0",
							version = 3,
						},
					},
				},
				eventType = 4,
				loop = true,
				mechanicTime = 30.4,
				name = "[Draw] Great Return - party line",
				timeRange = true,
				timelineIndex = 5,
				timerEndOffset = 1769.6,
				timerStartOffset = -60.4,
				uuid = "8399c6d4-ef77-29da-be5f-1fdb8d863004",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Cleanup",
				uuid = "15757aa6-ddab-c389-9add-6312ca2797bc",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.returnEnd()\nend\nself.used=true",
							conditions = 
							{
								
								{
									"3dd7294d-e777-bb0f-b77e-03675f63892a",
									true,
								},
							},
							name = "[Clear] Return to Nothing",
							uuid = "fa10fe7d-371c-4d70-8413-8926cec64b33",
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
							name = "49983,49984",
							spellIDList = 
							{
								49983,
								49984,
							},
							uuid = "3dd7294d-e777-bb0f-b77e-03675f63892a",
							version = 3,
						},
					},
				},
				displayPath = "Cleanup",
				eventType = 2,
				loop = true,
				mechanicTime = 30.4,
				name = "[Clear] Return to Nothing",
				timeRange = true,
				timelineIndex = 5,
				timerEndOffset = 1769.6,
				timerStartOffset = -60.4,
				uuid = "d5a4ff59-5bcf-7116-9ffd-c9dd0ae21b48",
				version = 2,
			},
		},
	},
	[6] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.meltdownStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"2ca59241-a3da-ed64-abeb-5ec526cf8caf",
									true,
								},
							},
							name = "[Draw] Meltdown - bait then clock spread",
							uuid = "9ce93f03-f875-5e41-bd54-ed8a2843194d",
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
							eventSpellID = 50040,
							name = "50040",
							uuid = "2ca59241-a3da-ed64-abeb-5ec526cf8caf",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 43.8,
				name = "[Draw] Meltdown - bait then clock spread",
				timeRange = true,
				timelineIndex = 6,
				timerEndOffset = 1756.2,
				timerStartOffset = -73.8,
				uuid = "eb41bad1-a384-5776-ae61-cde21df42788",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.meltdownBuff(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"9d7bb21d-ceef-6f3a-b8c5-635bd9eb8b76",
									true,
								},
								
								{
									"87676648-fc92-2076-875f-d47cb75829a8",
									true,
								},
							},
							name = "[Draw] Meltdown - stop during Chains",
							uuid = "0c913a48-b45e-1a2c-b3d4-6b516c37ec3f",
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							aType = "Alert",
							alertDuration = 1200,
							alertPriority = 2,
							alertText = "STOP until Chains ends",
							conditions = 
							{
								
								{
									"9d7bb21d-ceef-6f3a-b8c5-635bd9eb8b76",
									true,
								},
								
								{
									"87676648-fc92-2076-875f-d47cb75829a8",
									true,
								},
							},
							name = "STOP until Chains ends",
							uuid = "3a9d9eb9-8394-c18e-b769-268bcbddf2b9",
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
							eventBuffID = 4562,
							name = "4562",
							uuid = "9d7bb21d-ceef-6f3a-b8c5-635bd9eb8b76",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							dequeueIfLuaFalse = true,
							name = "Event recipient is self",
							partyTargetType = "Event Entity",
							uuid = "87676648-fc92-2076-875f-d47cb75829a8",
							version = 3,
						},
					},
				},
				eventType = 8,
				loop = true,
				mechanicTime = 43.8,
				name = "[Draw] Meltdown - stop during Chains",
				timeRange = true,
				timelineIndex = 6,
				timerEndOffset = 1756.1999511719,
				timerStartOffset = -73.800003051758,
				uuid = "89f53961-3568-8fd9-8c27-9957ab8df9ef",
				version = 2,
			},
		},
	},
	[7] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.meltdownPuddle(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"2550a03d-da69-4616-b5f3-74ad11ced584",
									true,
								},
							},
							name = "[Core] Meltdown - puddle timing",
							uuid = "f94ad26a-77f0-7f74-9833-f83c9d503474",
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
							eventSpellID = 50041,
							name = "50041",
							uuid = "2550a03d-da69-4616-b5f3-74ad11ced584",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 49.4,
				name = "[Core] Meltdown - puddle timing",
				timeRange = true,
				timelineIndex = 7,
				timerEndOffset = 1750.6,
				timerStartOffset = -79.4,
				uuid = "94ba067c-32e9-d524-9428-462848c31853",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.meltdownPuddleResolve(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"95d81606-bd61-3aa1-a3f4-94dd2f27af4f",
									true,
								},
							},
							name = "[Core] Meltdown - record actual puddles",
							uuid = "7bd701ce-a6f4-a1a7-8aa8-ed4b9c3fe201",
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
							eventSpellID = 50041,
							name = "50041",
							uuid = "95d81606-bd61-3aa1-a3f4-94dd2f27af4f",
							version = 3,
						},
					},
				},
				eventType = 2,
				loop = true,
				mechanicTime = 49.4,
				name = "[Core] Meltdown - record actual puddles",
				timeRange = true,
				timelineIndex = 7,
				timerEndOffset = 1750.6,
				timerStartOffset = -79.4,
				uuid = "66ac01c8-3758-f0df-ac81-fcada6a39674",
				version = 2,
			},
		},
	},
	[9] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.meltdownSpread(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"93dcbe2e-256f-ed44-9af7-177e18b726f8",
									true,
								},
							},
							name = "[Draw] Meltdown - actual spread targets",
							uuid = "78bcc502-739e-b381-ac83-6c468d66b25b",
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
							eventSpellID = 50042,
							name = "50042",
							uuid = "93dcbe2e-256f-ed44-9af7-177e18b726f8",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 50.5,
				name = "[Draw] Meltdown - actual spread targets",
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = 1749.5,
				timerStartOffset = -80.5,
				uuid = "1140c56b-86eb-1bdc-87ae-941d00c54d8a",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Cleanup",
				uuid = "140cb584-71fb-9630-9d50-14d37bc9ce7f",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.meltdownEnd(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"5a877062-3cf7-f4f8-ab03-6a9f1231ede6",
									true,
								},
							},
							name = "[Clear] Meltdown resolved",
							uuid = "df263875-db82-c395-b75b-a86708bb292f",
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
							eventSpellID = 50042,
							name = "50042",
							uuid = "5a877062-3cf7-f4f8-ab03-6a9f1231ede6",
							version = 3,
						},
					},
				},
				displayPath = "Cleanup",
				eventType = 2,
				loop = true,
				mechanicTime = 50.5,
				name = "[Clear] Meltdown resolved",
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = 1749.5,
				timerStartOffset = -80.5,
				uuid = "51c18078-3b1c-53f0-b03b-739e39d27636",
				version = 2,
			},
		},
	},
	[10] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.emptiness(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"36dacd66-bd0e-9dfe-bfc6-1388a8745884",
									true,
								},
							},
							name = "[Draw] Airy Emptiness - pair cones",
							uuid = "8dda712b-7a8f-eaf9-ac88-8f08999cf547",
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
							eventSpellID = 50032,
							name = "50032",
							uuid = "36dacd66-bd0e-9dfe-bfc6-1388a8745884",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 57.4,
				name = "[Draw] Airy Emptiness - pair cones",
				timeRange = true,
				timelineIndex = 10,
				timerEndOffset = 1742.6,
				timerStartOffset = -87.4,
				uuid = "d5ef7f85-2726-69f7-93d0-e4fbc4a4a52f",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.emptiness(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"4192ce4b-7aa3-cdee-b02a-7b0d75503c47",
									true,
								},
							},
							name = "[Draw] Dense Emptiness - stack cones",
							uuid = "bbe20c13-97de-5a4a-9cbb-2c0afec3291a",
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
							eventSpellID = 50033,
							name = "50033",
							uuid = "4192ce4b-7aa3-cdee-b02a-7b0d75503c47",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 57.4,
				name = "[Draw] Dense Emptiness - stack cones",
				timeRange = true,
				timelineIndex = 10,
				timerEndOffset = 1742.6,
				timerStartOffset = -87.4,
				uuid = "6db7925c-2e04-13a1-8ca4-38e93ac58327",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Cleanup",
				uuid = "9f3b6364-32b0-e774-8e61-bf08b7ce48d5",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.emptinessEnd()\nend\nself.used=true",
							conditions = 
							{
								
								{
									"46309c4a-d177-0169-90c6-f5facb17ab0b",
									true,
								},
							},
							name = "[Clear] Emptiness pairs / stacks",
							uuid = "dd87480c-2504-fd63-b83a-b8802de27e97",
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
							name = "50034,50035",
							spellIDList = 
							{
								50034,
								50035,
							},
							uuid = "46309c4a-d177-0169-90c6-f5facb17ab0b",
							version = 3,
						},
					},
				},
				displayPath = "Cleanup",
				eventType = 2,
				loop = true,
				mechanicTime = 57.4,
				name = "[Clear] Emptiness pairs / stacks",
				timeRange = true,
				timelineIndex = 10,
				timerEndOffset = 1742.6,
				timerStartOffset = -87.4,
				uuid = "239a4e9e-074f-fede-ae70-0fabfa29cc13",
				version = 2,
			},
		},
	},
	[14] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\ns.gazeConeChannel(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"e8a5d6bf-9249-ce48-8e06-a1e200c7e660",
									true,
								},
							},
							name = "[Draw] Gaze - rotating cone",
							uuid = "3131bcb8-ab8d-6179-867c-4ccdef2c0e6e",
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
							eventSpellID = 50005,
							name = "50005",
							uuid = "e8a5d6bf-9249-ce48-8e06-a1e200c7e660",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 84.2,
				name = "[Draw] Gaze - rotating cone",
				timeRange = true,
				timelineIndex = 14,
				timerEndOffset = 1715.8,
				timerStartOffset = -114.2,
				uuid = "bc17d3dc-926b-107a-9fbd-b1623f2bd4e5",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gazeStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"bb16feb7-b2a0-61cf-94c3-124d9c1eaadb",
									true,
								},
							},
							name = "[Draw] Gaze - prepare personal clock order",
							uuid = "dc1a237f-ef27-59d0-b58c-b0e82a8aa8af",
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
							eventSpellID = 50002,
							name = "50002",
							uuid = "bb16feb7-b2a0-61cf-94c3-124d9c1eaadb",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 84.2,
				name = "[Draw] Gaze - prepare personal clock order",
				timeRange = true,
				timelineIndex = 14,
				timerEndOffset = 1715.8,
				timerStartOffset = -114.2,
				uuid = "1d4145b1-cf29-84ca-8e9b-c261d0043043",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gazeTether(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"9ad401cd-7487-c780-bee0-ff7e7e2e6262",
									true,
								},
							},
							name = "[Draw] Gaze - yellow orb 1",
							uuid = "f40ec123-4cff-1f13-8bf7-e6fd510ea749",
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
							eventIntValue = 407,
							name = "407",
							uuid = "9ad401cd-7487-c780-bee0-ff7e7e2e6262",
							version = 3,
						},
					},
				},
				eventType = 15,
				loop = true,
				mechanicTime = 84.2,
				name = "[Draw] Gaze - yellow orb 1",
				timeRange = true,
				timelineIndex = 14,
				timerEndOffset = 1715.8,
				timerStartOffset = -114.2,
				uuid = "51903976-6d87-68c8-9df7-4a902784edbe",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gazeTether(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"d776d2cf-c68c-678b-97ae-10cd263fe694",
									true,
								},
							},
							name = "[Draw] Gaze - purple orb 2",
							uuid = "1b11e0c9-7314-f5ef-9887-5d008daf8474",
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
							eventIntValue = 406,
							name = "406",
							uuid = "d776d2cf-c68c-678b-97ae-10cd263fe694",
							version = 3,
						},
					},
				},
				eventType = 15,
				loop = true,
				mechanicTime = 84.2,
				name = "[Draw] Gaze - purple orb 2",
				timeRange = true,
				timelineIndex = 14,
				timerEndOffset = 1715.8,
				timerStartOffset = -114.2,
				uuid = "16069c75-5a6a-63a2-9d6f-5111569b330d",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gazeBurst(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"9def7b1f-b8ef-40d1-b634-679cf8cda6df",
									true,
								},
							},
							name = "[Draw] Gaze - advance after vulnerability",
							uuid = "654e756c-51bb-0e0c-8832-7fa63daf4197",
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
							name = "50006,50007",
							spellIDList = 
							{
								50006,
								50007,
							},
							uuid = "9def7b1f-b8ef-40d1-b634-679cf8cda6df",
							version = 3,
						},
					},
				},
				eventType = 2,
				loop = true,
				mechanicTime = 84.2,
				name = "[Draw] Gaze - advance after vulnerability",
				timeRange = true,
				timelineIndex = 14,
				timerEndOffset = 1715.8,
				timerStartOffset = -114.2,
				uuid = "e10b9b31-e4ec-8a67-8ae2-07189c6dccfc",
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
							actionLua = "local s=data.kaptinEnuo\nif s then s.gazeConeHit(eventArgs) end\nself.used=true",
							conditions = 
							{
								
								{
									"e283f1ac-38a8-06cf-a9e3-ec1a59f55cb1",
									true,
								},
							},
							name = "Advance after actual cone hit",
							uuid = "aff53583-708e-d7b9-90e3-82fa7470ecf6",
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
							eventSpellID = 50005,
							name = "Gaze cone resolved",
							uuid = "e283f1ac-38a8-06cf-a9e3-ec1a59f55cb1",
							version = 3,
						},
					},
				},
				eventType = 2,
				loop = true,
				mechanicTime = 84.2,
				name = "[Draw] Gaze - advance floor arrow",
				timeRange = true,
				timelineIndex = 14,
				timerEndOffset = 1715.8,
				timerStartOffset = -114.2,
				uuid = "815d74ab-4518-54b6-b892-07de50b35e70",
				version = 2,
			},
		},
	},
	[15] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"8e6da0d2-7511-a6c5-a249-54e03526c77f",
									true,
								},
							},
							name = "[Draw] Silent Torrent - short sector",
							uuid = "eb440ffd-c5a2-e4b3-aec7-972ef6f91a8b",
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
							eventSpellID = 49998,
							name = "49998",
							uuid = "8e6da0d2-7511-a6c5-a249-54e03526c77f",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 115.3,
				name = "[Draw] Silent Torrent - short sector",
				timeRange = true,
				timelineIndex = 15,
				timerEndOffset = 1684.7,
				timerStartOffset = -145.3,
				uuid = "06828ee6-07e0-c5ec-880f-1c28781fa306",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"05408ad1-e1d0-ab9c-9bc2-27fdcbd0ccf3",
									true,
								},
							},
							name = "[Draw] Silent Torrent - medium sector",
							uuid = "19b39731-fcc0-bef6-b0eb-2c32b83022de",
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
							eventSpellID = 49999,
							name = "49999",
							uuid = "05408ad1-e1d0-ab9c-9bc2-27fdcbd0ccf3",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 115.3,
				name = "[Draw] Silent Torrent - medium sector",
				timeRange = true,
				timelineIndex = 15,
				timerEndOffset = 1684.7,
				timerStartOffset = -145.3,
				uuid = "2cd8ff45-5339-3e16-896f-7d4125b511b5",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"0a18d7ec-c485-1415-bf50-eb3fe9e0b59f",
									true,
								},
							},
							name = "[Draw] Silent Torrent - long sector",
							uuid = "5c605453-64e1-0d04-b7f0-398addf558eb",
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
							eventSpellID = 50000,
							name = "50000",
							uuid = "0a18d7ec-c485-1415-bf50-eb3fe9e0b59f",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 115.3,
				name = "[Draw] Silent Torrent - long sector",
				timeRange = true,
				timelineIndex = 15,
				timerEndOffset = 1684.7,
				timerStartOffset = -145.3,
				uuid = "735b2a07-6779-7ae2-a296-8c2ab4bb33b3",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.vacuumActiveUntil=s.now()+15000\nend\nself.used=true",
							conditions = 
							{
								
								{
									"2d989c7b-8376-8e6b-95dc-2fd4d9b3681d",
									true,
								},
							},
							name = "[Core] Vacuum - combo gate",
							uuid = "d2f62679-95db-91fc-814e-db9688d52755",
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
							eventSpellID = 49994,
							name = "49994",
							uuid = "2d989c7b-8376-8e6b-95dc-2fd4d9b3681d",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 115.3,
				name = "[Core] Vacuum - combo gate",
				timeRange = true,
				timelineIndex = 15,
				timerEndOffset = 1684.7,
				timerStartOffset = -145.3,
				uuid = "5481d66a-3662-d72c-bb01-ff6dce7fb7f8",
				version = 2,
			},
		},
	},
	[16] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"d8f4faca-9c1d-6596-b4ad-b88f99909b6c",
									true,
								},
							},
							name = "[Draw] Vacuum - geometry for personal arrows",
							uuid = "2e941c66-e741-94e5-ade6-fd732951bf8a",
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
							eventSpellID = 50001,
							name = "50001",
							uuid = "d8f4faca-9c1d-6596-b4ad-b88f99909b6c",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 115.7,
				name = "[Draw] Vacuum - geometry for personal arrows",
				timeRange = true,
				timelineIndex = 16,
				timerEndOffset = 1684.3,
				timerStartOffset = -145.7,
				uuid = "e9c1b1d8-17e2-0ae1-86a9-5ad5ec4c0a96",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.vacuumAppear(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"8d22822f-3dbe-1980-9179-e7b691e73413",
									true,
								},
							},
							name = "[Draw] Vacuum - revealed explosion positions",
							uuid = "1f953288-e61c-26e9-b654-4c8f7fe64f87",
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
							name = "49995,49996,49997",
							spellIDList = 
							{
								49995,
								49996,
								49997,
							},
							uuid = "8d22822f-3dbe-1980-9179-e7b691e73413",
							version = 3,
						},
					},
				},
				eventType = 2,
				loop = true,
				mechanicTime = 115.7,
				name = "[Draw] Vacuum - revealed explosion positions",
				timeRange = true,
				timelineIndex = 16,
				timerEndOffset = 1684.3,
				timerStartOffset = -145.7,
				uuid = "1926b9a9-f36f-a3dd-b9dd-6b822b0b1054",
				version = 2,
			},
		},
	},
	[19] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.freeze(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"3065c2ce-65f1-543a-a814-75392c9cde2c",
									true,
								},
							},
							name = "[Draw] Deep Freeze - tanks NW / NE",
							uuid = "18b02003-58a8-fb46-b8db-ad37e3e71acc",
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
							eventSpellID = 50043,
							name = "50043",
							uuid = "3065c2ce-65f1-543a-a814-75392c9cde2c",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 134.1,
				name = "[Draw] Deep Freeze - tanks NW / NE",
				timeRange = true,
				timelineIndex = 19,
				timerEndOffset = 1665.9,
				timerStartOffset = -164.1,
				uuid = "c6935721-f77e-25fd-aed2-00730509c183",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Cleanup",
				uuid = "9b082416-782e-f904-bc85-306a555a2c0f",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.clear(\"freeze\")\nend\nself.used=true",
							conditions = 
							{
								
								{
									"adc9dc31-f669-94d2-88f2-ea5f483929e6",
									true,
								},
							},
							name = "[Clear] Deep Freeze positions",
							uuid = "38e50190-a528-24a5-a4e8-3281922b3ca1",
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
							eventSpellID = 50043,
							name = "50043",
							uuid = "adc9dc31-f669-94d2-88f2-ea5f483929e6",
							version = 3,
						},
					},
				},
				displayPath = "Cleanup",
				eventType = 2,
				loop = true,
				mechanicTime = 134.1,
				name = "[Clear] Deep Freeze positions",
				timeRange = true,
				timelineIndex = 19,
				timerEndOffset = 1665.9,
				timerStartOffset = -164.1,
				uuid = "b672921e-82c0-325c-90f6-e94d7140ec0d",
				version = 2,
			},
		},
	},
	[22] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Setup",
				uuid = "ed06b858-6271-33b9-afe5-1f0eb6d6b3ed",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.clearAll()\nend\nself.used=true",
							conditions = 
							{
								
								{
									"39f7ba85-d7b6-9234-9d1a-7b796f48258b",
									true,
								},
							},
							name = "[Core] Clear at intermission / return",
							uuid = "2864a526-a16b-628b-9f14-656f65a8f58d",
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
							name = "50010,50029",
							spellIDList = 
							{
								50010,
								50029,
							},
							uuid = "39f7ba85-d7b6-9234-9d1a-7b796f48258b",
							version = 3,
						},
					},
				},
				displayPath = "Setup",
				eventType = 3,
				loop = true,
				mechanicTime = 154.8,
				name = "[Core] Clear at intermission / return",
				timeRange = true,
				timelineIndex = 22,
				timerEndOffset = 1645.2,
				timerStartOffset = -184.8,
				uuid = "162290ed-cd55-6185-b3e5-5108a633f682",
				version = 2,
			},
		},
	},
	[24] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"6677c91e-9767-8a88-b5c5-6d8a2ea0c319",
									true,
								},
							},
							name = "[Draw] Looming Emptiness - circle",
							uuid = "e3ce78d3-2d2f-0810-8440-aec7e3c22660",
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
							eventSpellID = 49369,
							name = "49369",
							uuid = "6677c91e-9767-8a88-b5c5-6d8a2ea0c319",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 174.9,
				name = "[Draw] Looming Emptiness - circle",
				timeRange = true,
				timelineIndex = 24,
				timerEndOffset = 1625.1,
				timerStartOffset = -204.9,
				uuid = "4b228313-bdea-e866-b42e-1824a684dbb9",
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
							actionLua = "local s=data.kaptinEnuo\nif s then s.interPartnerStart(eventArgs) end\nself.used=true",
							conditions = 
							{
								
								{
									"97673067-5515-6cfb-ab54-956683636e10",
									true,
								},
								
								{
									"6a77e0ad-7fbb-f69e-851a-e9664aa1541c",
									true,
								},
							},
							name = "Show pair waymark",
							uuid = "04c7c01c-cbe4-3135-b9bd-9ea4536629ad",
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
							eventSpellID = 50011,
							name = "Looming Emptiness",
							uuid = "97673067-5515-6cfb-ab54-956683636e10",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 14752,
							name = "Looming Shadow",
							uuid = "6a77e0ad-7fbb-f69e-851a-e9664aa1541c",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 174.9,
				name = "[Draw] Adds - pair waymark",
				timeRange = true,
				timelineIndex = 24,
				timerEndOffset = 1625.1,
				timerStartOffset = -204.9,
				uuid = "1ecaa3df-2c90-8439-958a-b84af8d2b27f",
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
							actionLua = "local s=data.kaptinEnuo\nif s then s.interPartnerClear() end\nself.used=true",
							conditions = 
							{
								
								{
									"bb597420-2172-4d53-91d1-cd7cbff27375",
									true,
								},
								
								{
									"b9ba338d-6c23-3634-8113-2660f7969626",
									true,
								},
							},
							name = "Clear completed pair waymark",
							uuid = "c2f327e2-e4b4-dfa7-94ca-1c612677f055",
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
							eventSpellID = 49982,
							name = "Looming knockback resolved",
							uuid = "bb597420-2172-4d53-91d1-cd7cbff27375",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgOptionType = 2,
							eventEntityContentID = 14752,
							name = "Looming Shadow",
							uuid = "b9ba338d-6c23-3634-8113-2660f7969626",
							version = 3,
						},
					},
				},
				eventType = 2,
				loop = true,
				mechanicTime = 174.9,
				name = "[Clear] Adds waymark after knockback",
				timeRange = true,
				timelineIndex = 24,
				timerEndOffset = 1625.1,
				timerStartOffset = -204.9,
				uuid = "11bab1ae-7e48-a316-999f-e6d1024c8eda",
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
							aType = "Lua",
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.interTower(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"e78736b9-c1d7-8781-ad5c-92ee94d509e3",
									true,
								},
							},
							name = "[Draw] Empty Shadow - personal tower or bait",
							uuid = "5dac6ff4-233e-baff-8ac3-dd58ae3082c9",
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
							eventSpellID = 50013,
							name = "50013",
							uuid = "e78736b9-c1d7-8781-ad5c-92ee94d509e3",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 183.9,
				name = "[Draw] Empty Shadow - personal tower or bait",
				timeRange = true,
				timelineIndex = 27,
				timerEndOffset = 1616.1,
				timerStartOffset = -213.9,
				uuid = "c7f48fe3-e02b-0f84-8556-ccaf980de403",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Cleanup",
				uuid = "fa30f3be-c1b0-1311-a28e-9343839f7698",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.interResolve(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"53493951-90dd-f900-8585-304f66eec799",
									true,
								},
							},
							name = "[Clear] Empty Shadow - resolved tower round",
							uuid = "9e137a74-32ac-1e69-b55d-d3f37fb195e1",
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
							eventSpellID = 50013,
							name = "50013",
							uuid = "53493951-90dd-f900-8585-304f66eec799",
							version = 3,
						},
					},
				},
				displayPath = "Cleanup",
				eventType = 2,
				loop = true,
				mechanicTime = 183.9,
				name = "[Clear] Empty Shadow - resolved tower round",
				timeRange = true,
				timelineIndex = 27,
				timerEndOffset = 1616.1,
				timerStartOffset = -213.9,
				uuid = "5119c856-1e62-5f9b-be78-d45264069611",
				version = 2,
			},
		},
	},
	[28] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.interStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"7174d353-53c8-738b-ba41-bbafb750d804",
									true,
								},
							},
							name = "[Draw] Voidal Turbulence - prepare assignments",
							uuid = "db3a3cd8-207b-e10f-abcb-5e27b58d5833",
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
							eventSpellID = 50036,
							name = "50036",
							uuid = "7174d353-53c8-738b-ba41-bbafb750d804",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 184.2,
				name = "[Draw] Voidal Turbulence - prepare assignments",
				timeRange = true,
				timelineIndex = 28,
				timerEndOffset = 1615.8,
				timerStartOffset = -214.2,
				uuid = "0d392208-e566-56f4-9795-5db281df0ca8",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.interMarker(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"015b76f1-2410-70e3-a091-488421559d81",
									true,
								},
							},
							name = "[Draw] Voidal Turbulence - actual bait markers",
							uuid = "8b0d18bb-9bd6-fc6c-b9a4-6e317127761c",
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
							eventMarkerID = 721,
							name = "721",
							uuid = "015b76f1-2410-70e3-a091-488421559d81",
							version = 3,
						},
					},
				},
				eventType = 4,
				loop = true,
				mechanicTime = 184.2,
				name = "[Draw] Voidal Turbulence - actual bait markers",
				timeRange = true,
				timelineIndex = 28,
				timerEndOffset = 1615.8,
				timerStartOffset = -214.2,
				uuid = "172bdaaf-00c0-01ea-a43b-835c32b30e01",
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
				name = "Gauntlet",
				uuid = "727d11b6-1b6a-8108-8c11-d99a7d9e249e",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletPlayer(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"5457ceff-744f-7d06-9b20-effc3d667340",
									true,
								},
								
								{
									"cd9711a1-9e68-b8b9-8962-07fcdf935575",
									true,
								},
							},
							name = "[Draw] Gauntlet 1 - personal add",
							uuid = "cbf25c52-41e0-3aee-af18-c3c9ad5b8f7d",
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
							eventBuffID = 5357,
							name = "5357",
							uuid = "5457ceff-744f-7d06-9b20-effc3d667340",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							dequeueIfLuaFalse = true,
							name = "Event recipient is self",
							partyTargetType = "Event Entity",
							uuid = "cd9711a1-9e68-b8b9-8962-07fcdf935575",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Draw] Gauntlet 1 - personal add",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "213dbf60-475f-4940-82c2-f2e92df6083f",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletAdd(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"b0e8e6fa-bd3f-41ea-8a6f-ea6b6c10b9ec",
									true,
								},
							},
							name = "[Core] Gauntlet 1 - matching add marker",
							uuid = "72d07633-ab91-2bdf-9166-389585b48754",
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
							eventBuffID = 5365,
							name = "5365",
							uuid = "b0e8e6fa-bd3f-41ea-8a6f-ea6b6c10b9ec",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Core] Gauntlet 1 - matching add marker",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "46b1f3e4-f4f5-5cb8-b174-2aa3d16c2aae",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletPlayer(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"fa2bce0b-6505-b1c9-a0a5-9d4ae2d63860",
									true,
								},
								
								{
									"7b01bbcd-2930-9d1f-9f0e-2c4893272c15",
									true,
								},
							},
							name = "[Draw] Gauntlet 2 - personal add",
							uuid = "731fa504-3026-8582-a7ce-7eeb3cc1eb58",
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
							eventBuffID = 5358,
							name = "5358",
							uuid = "fa2bce0b-6505-b1c9-a0a5-9d4ae2d63860",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							dequeueIfLuaFalse = true,
							name = "Event recipient is self",
							partyTargetType = "Event Entity",
							uuid = "7b01bbcd-2930-9d1f-9f0e-2c4893272c15",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Draw] Gauntlet 2 - personal add",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "11d33d85-0098-a6d9-824d-23ed6b66dded",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletAdd(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"4cba01ba-6551-a679-9936-574eba65ae2e",
									true,
								},
							},
							name = "[Core] Gauntlet 2 - matching add marker",
							uuid = "be3ed3f5-32c4-afa7-b259-9fa00e9604bc",
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
							eventBuffID = 5366,
							name = "5366",
							uuid = "4cba01ba-6551-a679-9936-574eba65ae2e",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Core] Gauntlet 2 - matching add marker",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "f79bf80b-8051-96b8-815e-16293b7a4809",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletPlayer(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"35e079d2-821f-5b5b-9883-dc05b75361b5",
									true,
								},
								
								{
									"949cc768-0ef4-6448-b52e-42fa97f15364",
									true,
								},
							},
							name = "[Draw] Gauntlet 3 - personal add",
							uuid = "a707fc53-6109-1e71-bed2-b0dfdad0796c",
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
							eventBuffID = 5359,
							name = "5359",
							uuid = "35e079d2-821f-5b5b-9883-dc05b75361b5",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							dequeueIfLuaFalse = true,
							name = "Event recipient is self",
							partyTargetType = "Event Entity",
							uuid = "949cc768-0ef4-6448-b52e-42fa97f15364",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Draw] Gauntlet 3 - personal add",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "7b66287e-23a1-8cfb-898f-6a3cb96c2337",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletAdd(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"4e6cd315-c587-f7c5-adbd-3317240bfe87",
									true,
								},
							},
							name = "[Core] Gauntlet 3 - matching add marker",
							uuid = "c6e80f12-c92d-115a-9b02-be394b0007b4",
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
							eventBuffID = 5367,
							name = "5367",
							uuid = "4e6cd315-c587-f7c5-adbd-3317240bfe87",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Core] Gauntlet 3 - matching add marker",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "59319135-5d53-fda2-860d-c3b7223c033b",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletPlayer(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"ea1e8bca-40ff-42d1-855b-781b98992132",
									true,
								},
								
								{
									"b673723b-8b19-0609-bee4-53191238b9a4",
									true,
								},
							},
							name = "[Draw] Gauntlet 4 - personal add",
							uuid = "249601ad-626a-bd8c-94ea-22091a890b09",
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
							eventBuffID = 5360,
							name = "5360",
							uuid = "ea1e8bca-40ff-42d1-855b-781b98992132",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							dequeueIfLuaFalse = true,
							name = "Event recipient is self",
							partyTargetType = "Event Entity",
							uuid = "b673723b-8b19-0609-bee4-53191238b9a4",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Draw] Gauntlet 4 - personal add",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "1bd8672a-5d10-0f3e-953f-45a735e438e3",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletAdd(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"f3c16a34-b754-843e-b833-14b6e00c2aa1",
									true,
								},
							},
							name = "[Core] Gauntlet 4 - matching add marker",
							uuid = "8be8ed7a-5dcf-0b23-ad84-df80bf4e2315",
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
							eventBuffID = 5368,
							name = "5368",
							uuid = "f3c16a34-b754-843e-b833-14b6e00c2aa1",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Core] Gauntlet 4 - matching add marker",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "69e406c9-9724-dafd-ab7a-387a3ffd67d6",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletPlayer(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"981a20e6-3ef8-81a6-8aec-0388c9f2e453",
									true,
								},
								
								{
									"995546bd-f94f-191c-bfae-837c8d5aae30",
									true,
								},
							},
							name = "[Draw] Gauntlet 5 - personal add",
							uuid = "f41797a9-d002-f5b8-b4d0-7d37bec60e2b",
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
							eventBuffID = 5361,
							name = "5361",
							uuid = "981a20e6-3ef8-81a6-8aec-0388c9f2e453",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							dequeueIfLuaFalse = true,
							name = "Event recipient is self",
							partyTargetType = "Event Entity",
							uuid = "995546bd-f94f-191c-bfae-837c8d5aae30",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Draw] Gauntlet 5 - personal add",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "1838279e-e6ea-fb15-aa66-2395ade1c152",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletAdd(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"c16de799-b9a3-af83-9c99-80845d9c674e",
									true,
								},
							},
							name = "[Core] Gauntlet 5 - matching add marker",
							uuid = "67583411-5915-db81-81e7-5aba12ae8317",
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
							eventBuffID = 5369,
							name = "5369",
							uuid = "c16de799-b9a3-af83-9c99-80845d9c674e",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Core] Gauntlet 5 - matching add marker",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "0f3e4f7a-f271-ca0d-adcd-a297bfc569ed",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletPlayer(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"379c6a9d-58cf-953d-9d06-0bc54246cfd3",
									true,
								},
								
								{
									"b1587154-69ac-a793-a278-1bb8bb33be76",
									true,
								},
							},
							name = "[Draw] Gauntlet 6 - personal add",
							uuid = "a9c3ecf9-5c9e-a5cf-944e-7734e1062164",
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
							eventBuffID = 5362,
							name = "5362",
							uuid = "379c6a9d-58cf-953d-9d06-0bc54246cfd3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							dequeueIfLuaFalse = true,
							name = "Event recipient is self",
							partyTargetType = "Event Entity",
							uuid = "b1587154-69ac-a793-a278-1bb8bb33be76",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Draw] Gauntlet 6 - personal add",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "8ff9dfa8-d710-ffcb-a0b1-49785978bd6c",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletAdd(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"a632045b-29db-942b-9b22-809edba60a05",
									true,
								},
							},
							name = "[Core] Gauntlet 6 - matching add marker",
							uuid = "f1561837-3a1e-af88-ba70-27c22ab95d2e",
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
							eventBuffID = 5370,
							name = "5370",
							uuid = "a632045b-29db-942b-9b22-809edba60a05",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Core] Gauntlet 6 - matching add marker",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "418d2768-19e0-65c0-8763-01ed7052cdf0",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletPlayer(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"d5081d85-682e-986b-a97d-0f39ff00e64e",
									true,
								},
								
								{
									"332f202c-2cd6-0e16-bf73-b4c5b696e70d",
									true,
								},
							},
							name = "[Draw] Gauntlet 7 - personal add",
							uuid = "ae29e494-b47a-65e8-986c-908f0b0dab22",
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
							eventBuffID = 5363,
							name = "5363",
							uuid = "d5081d85-682e-986b-a97d-0f39ff00e64e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							dequeueIfLuaFalse = true,
							name = "Event recipient is self",
							partyTargetType = "Event Entity",
							uuid = "332f202c-2cd6-0e16-bf73-b4c5b696e70d",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Draw] Gauntlet 7 - personal add",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "91747b20-88cf-f677-acfc-ca924a98ea98",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletAdd(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"ee27629a-dd0f-7706-8f9c-26958dbce23d",
									true,
								},
							},
							name = "[Core] Gauntlet 7 - matching add marker",
							uuid = "ec217472-aa9c-5c8c-9331-5768f9f3a611",
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
							eventBuffID = 5371,
							name = "5371",
							uuid = "ee27629a-dd0f-7706-8f9c-26958dbce23d",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Core] Gauntlet 7 - matching add marker",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "1e1c24f3-ac2e-c082-8be8-3eed7a3c5126",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletPlayer(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"9685843a-564e-910f-9db6-b7c2daa1cbec",
									true,
								},
								
								{
									"4b62f7fa-5bf5-b788-819f-94b8f2d13221",
									true,
								},
							},
							name = "[Draw] Gauntlet 8 - personal add",
							uuid = "fc055284-ec00-bc29-9c2c-76d079c2e2ef",
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
							eventBuffID = 5364,
							name = "5364",
							uuid = "9685843a-564e-910f-9db6-b7c2daa1cbec",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							dequeueIfLuaFalse = true,
							name = "Event recipient is self",
							partyTargetType = "Event Entity",
							uuid = "4b62f7fa-5bf5-b788-819f-94b8f2d13221",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Draw] Gauntlet 8 - personal add",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "12165ffc-8ca4-48e5-9ad5-f35a24c1af9f",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.gauntletAdd(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"2c5e74d3-de56-370a-a283-bbdb927395b7",
									true,
								},
							},
							name = "[Core] Gauntlet 8 - matching add marker",
							uuid = "a31cb0ea-dd11-42d3-b805-d9205ac0d2e9",
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
							eventBuffID = 5372,
							name = "5372",
							uuid = "2c5e74d3-de56-370a-a283-bbdb927395b7",
							version = 3,
						},
					},
				},
				displayPath = "Gauntlet",
				eventType = 8,
				loop = true,
				mechanicTime = 185.4,
				name = "[Core] Gauntlet 8 - matching add marker",
				timeRange = true,
				timelineIndex = 29,
				timerEndOffset = 1614.6,
				timerStartOffset = -215.4,
				uuid = "980e5cb6-51bb-d154-8ccc-b84cfe37e038",
				version = 2,
			},
		},
	},
	[31] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Alert",
							alertDuration = 4000,
							alertPriority = 2,
							alertText = "LOOK AWAY - Demon Eye",
							conditions = 
							{
								
								{
									"e54a15e6-84d7-20fc-aa5f-0ef5a99bdf3a",
									true,
								},
							},
							name = "LOOK AWAY - Demon Eye",
							uuid = "64804d73-ad76-077b-b58b-a89ed7d42c90",
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
							eventSpellID = 50023,
							name = "50023",
							uuid = "e54a15e6-84d7-20fc-aa5f-0ef5a99bdf3a",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 191.1,
				name = "[Alert] Demon Eye - look away",
				timeRange = true,
				timelineIndex = 31,
				timerEndOffset = 1608.9,
				timerStartOffset = -221.1,
				uuid = "83166c95-dcb6-ab2a-943e-8ca9e1aab7be",
				version = 2,
			},
		},
	},
	[32] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"21d72408-cb45-8a2e-9846-0025f0912afa",
									true,
								},
							},
							name = "[Draw] Weight of Nothing - tank line",
							uuid = "b2f4d0a8-35e4-c6e2-a942-3d4a0fb882d3",
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
							eventSpellID = 50021,
							name = "50021",
							uuid = "21d72408-cb45-8a2e-9846-0025f0912afa",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 198.3,
				name = "[Draw] Weight of Nothing - tank line",
				timeRange = true,
				timelineIndex = 32,
				timerEndOffset = 1601.7,
				timerStartOffset = -228.3,
				uuid = "6f1bcb7a-1f45-2bc6-b773-fdc2fb104e9d",
				version = 2,
			},
		},
	},
	[35] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"cea7d9ed-631e-8810-880f-5b4b75c1748d",
									true,
								},
							},
							name = "[Draw] Nothingness - line",
							uuid = "3e14b218-1cea-5fdc-ba09-51220b957bfd",
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
							eventSpellID = 50017,
							name = "50017",
							uuid = "cea7d9ed-631e-8810-880f-5b4b75c1748d",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 302.5,
				name = "[Draw] Nothingness - line",
				timeRange = true,
				timelineIndex = 35,
				timerEndOffset = 1497.5,
				timerStartOffset = -332.5,
				uuid = "7cf0d4db-84bc-a63c-97c8-49c60ed7e793",
				version = 2,
			},
		},
	},
	[49] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"ef80fb7e-5d2b-e96d-8b37-595b47b17083",
									true,
								},
							},
							name = "[Draw] Passage of Naught - portal beams 1",
							uuid = "90cf8fc4-7abb-8cbe-8ad3-81e0f5f41c12",
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
							eventSpellID = 49985,
							name = "49985",
							uuid = "ef80fb7e-5d2b-e96d-8b37-595b47b17083",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 549.6,
				name = "[Draw] Passage of Naught - portal beams 1",
				timeRange = true,
				timelineIndex = 49,
				timerEndOffset = 1250.4,
				timerStartOffset = -579.6,
				uuid = "f7cd57a6-4445-3164-b88f-36488e72ce97",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"930de10a-7622-96fa-be50-f91474c9e56b",
									true,
								},
							},
							name = "[Draw] Passage of Naught - portal beams 2",
							uuid = "0d762903-fe26-f807-b626-5ab323fb91bc",
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
							eventSpellID = 49986,
							name = "49986",
							uuid = "930de10a-7622-96fa-be50-f91474c9e56b",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 549.6,
				name = "[Draw] Passage of Naught - portal beams 2",
				timeRange = true,
				timelineIndex = 49,
				timerEndOffset = 1250.4,
				timerStartOffset = -579.6,
				uuid = "7825fd2c-3ec7-e578-9158-a22a38898ad8",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"236efa9a-b53a-dabe-afc2-5121fd470c6b",
									true,
								},
							},
							name = "[Draw] Passage of Naught - portal beams 3",
							uuid = "1fdbbc0a-5dd0-8afd-8e5b-e31729e80274",
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
							eventSpellID = 49987,
							name = "49987",
							uuid = "236efa9a-b53a-dabe-afc2-5121fd470c6b",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 549.6,
				name = "[Draw] Passage of Naught - portal beams 3",
				timeRange = true,
				timelineIndex = 49,
				timerEndOffset = 1250.4,
				timerStartOffset = -579.6,
				uuid = "b09c142f-17e1-59b0-b507-0680428d3a75",
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
							actionLua = "local s=data.kaptinEnuo\nif s then s.portalHazard(eventArgs) end\nself.used=true",
							conditions = 
							{
								
								{
									"d08fd6ce-06b3-bf12-9c09-ff9ff8864976",
									true,
								},
							},
							name = "Draw actual beam positions",
							uuid = "febb8da4-3551-4c40-a107-0b48cd4a311e",
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
							conditionLua = "return eventArgs.aoeID==49985 or eventArgs.aoeID==49986 or eventArgs.aoeID==49987",
							dequeueIfLuaFalse = true,
							name = "Passage of Naught AOEs",
							uuid = "d08fd6ce-06b3-bf12-9c09-ff9ff8864976",
							version = 3,
						},
					},
				},
				eventType = 18,
				loop = true,
				mechanicTime = 549.6,
				name = "[Draw] Naught Wakes - actual beam positions",
				timeRange = true,
				timelineIndex = 49,
				timerEndOffset = 1250.4,
				timerStartOffset = -579.6,
				uuid = "02c985d4-ba43-9b56-ab6a-328ad313b9fe",
				version = 2,
			},
		},
	},
	[51] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.holy(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"835b14ff-b2a0-2aaf-ab83-25f0577e0546",
									true,
								},
							},
							name = "[Draw] Shrouded Holy - actual stacks",
							uuid = "8dcd9ba2-23d1-8638-ad0a-972b8fd5ea35",
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
							eventSpellID = 50046,
							name = "50046",
							uuid = "835b14ff-b2a0-2aaf-ab83-25f0577e0546",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 566.9,
				name = "[Draw] Shrouded Holy - actual stacks",
				timeRange = true,
				timelineIndex = 51,
				timerEndOffset = 1233.1,
				timerStartOffset = -596.9,
				uuid = "fb688155-d5cf-ffe7-b8ec-91e9c06e7aa3",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Cleanup",
				uuid = "f81d6d3c-bae3-05be-83ea-942d81f9eb17",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.clear(\"holy:\"..eventArgs.entityID)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"9088e95b-7d38-1679-9769-f95520cee99e",
									true,
								},
							},
							name = "[Clear] Shrouded Holy",
							uuid = "9fcaeab2-ecf7-d066-bc11-7170278af3b6",
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
							eventSpellID = 50046,
							name = "50046",
							uuid = "9088e95b-7d38-1679-9769-f95520cee99e",
							version = 3,
						},
					},
				},
				displayPath = "Cleanup",
				eventType = 2,
				loop = true,
				mechanicTime = 566.9,
				name = "[Clear] Shrouded Holy",
				timeRange = true,
				timelineIndex = 51,
				timerEndOffset = 1233.1,
				timerStartOffset = -596.9,
				uuid = "a997d7ab-c842-9998-b6af-218f62ac8c1f",
				version = 2,
			},
		},
	},
	[55] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.dimensionMarker(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"c862979a-816d-8d3b-84c1-127c2ba083d1",
									true,
								},
							},
							name = "[Draw] Dimension Zero - marked line target",
							uuid = "928d7380-e781-f813-beb5-f8b7400af89d",
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
							eventMarkerID = 719,
							name = "719",
							uuid = "c862979a-816d-8d3b-84c1-127c2ba083d1",
							version = 3,
						},
					},
				},
				eventType = 4,
				loop = true,
				mechanicTime = 593.6,
				name = "[Draw] Dimension Zero - marked line target",
				timeRange = true,
				timelineIndex = 55,
				timerEndOffset = 1206.4,
				timerStartOffset = -623.6,
				uuid = "d88c2f51-bc0a-a8ff-8780-3021884388f9",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.dimension(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"3aed0ee8-4726-7d6c-8508-4de294bc0d65",
									true,
								},
							},
							name = "[Draw] Dimension Zero - multi-hit stack line",
							uuid = "0a2577f3-3fa4-d61a-adfe-8143348d62b3",
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
							eventSpellID = 50047,
							name = "50047",
							uuid = "3aed0ee8-4726-7d6c-8508-4de294bc0d65",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 593.6,
				name = "[Draw] Dimension Zero - multi-hit stack line",
				timeRange = true,
				timelineIndex = 55,
				timerEndOffset = 1206.4,
				timerStartOffset = -623.6,
				uuid = "5cc47ee1-0486-b4a4-a1ad-c90286e90a8f",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Cleanup",
				uuid = "80053039-2f7c-2e97-b01f-a6ea81b785f8",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.dimensionResolve(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"27408327-6b60-f7e9-b232-757cb30c7a28",
									true,
								},
							},
							name = "[Clear] Dimension Zero - final hit",
							uuid = "734fb304-5239-baea-9a93-01d059f203a1",
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
							eventSpellID = 50048,
							name = "50048",
							uuid = "27408327-6b60-f7e9-b232-757cb30c7a28",
							version = 3,
						},
					},
				},
				displayPath = "Cleanup",
				eventType = 2,
				loop = true,
				mechanicTime = 593.6,
				name = "[Clear] Dimension Zero - final hit",
				timeRange = true,
				timelineIndex = 55,
				timerEndOffset = 1206.4,
				timerStartOffset = -623.6,
				uuid = "966401ed-e06f-e541-8abe-d7316d7e820b",
				version = 2,
			},
		},
	},
	[66] = 
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.hazardStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"08f0fee4-e3f9-2d0d-af7d-7d2abaa3033e",
									true,
								},
							},
							name = "[Draw] Endless Chase - first explosion",
							uuid = "fdbc76e2-d245-2d56-9997-b317f27aa9d2",
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
							eventSpellID = 48475,
							name = "48475",
							uuid = "08f0fee4-e3f9-2d0d-af7d-7d2abaa3033e",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 682.9,
				name = "[Draw] Endless Chase - first explosion",
				timeRange = true,
				timelineIndex = 66,
				timerEndOffset = 1117.1,
				timerStartOffset = -712.9,
				uuid = "f39e58e7-7ebb-52e0-af1d-78bbe7beddf2",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.huntsStart(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"689bf32c-84ff-a56c-8e3e-d860e5c11f31",
									true,
								},
							},
							name = "[Draw] Naught Hunts - prepare CW then CW",
							uuid = "66e24172-4976-e47c-aaea-d63324ede45a",
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
							eventSpellID = 49992,
							name = "49992",
							uuid = "689bf32c-84ff-a56c-8e3e-d860e5c11f31",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 682.9,
				name = "[Draw] Naught Hunts - prepare CW then CW",
				timeRange = true,
				timelineIndex = 66,
				timerEndOffset = 1117.1,
				timerStartOffset = -712.9,
				uuid = "b360002e-bd96-04cf-ac9d-9f1f0b87ec75",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.huntsTether(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"40b75a88-3f88-c7ba-ad36-955b491c096b",
									true,
								},
							},
							name = "[Draw] Naught Hunts - red orb / CW bait",
							uuid = "b497b1b9-2a2f-48fd-8e2d-d9a81eca2861",
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
							eventIntValue = 404,
							name = "404",
							uuid = "40b75a88-3f88-c7ba-ad36-955b491c096b",
							version = 3,
						},
					},
				},
				eventType = 15,
				loop = true,
				mechanicTime = 682.9,
				name = "[Draw] Naught Hunts - red orb / CW bait",
				timeRange = true,
				timelineIndex = 66,
				timerEndOffset = 1117.1,
				timerStartOffset = -712.9,
				uuid = "c43d7d45-8504-1ad8-85f4-7ec80df46441",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.huntsTether(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"1c95ec8f-6cf4-d810-82da-a0addcbba133",
									true,
								},
							},
							name = "[Draw] Naught Hunts - handoff tether",
							uuid = "80d5258e-a42f-459d-b90c-4ea3a155655f",
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
							eventIntValue = 405,
							name = "405",
							uuid = "1c95ec8f-6cf4-d810-82da-a0addcbba133",
							version = 3,
						},
					},
				},
				eventType = 15,
				loop = true,
				mechanicTime = 682.9,
				name = "[Draw] Naught Hunts - handoff tether",
				timeRange = true,
				timelineIndex = 66,
				timerEndOffset = 1117.1,
				timerStartOffset = -712.9,
				uuid = "aef7a031-84c9-1b97-8167-2db8e3a6cccd",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.huntsPassage(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"000d0d4a-b1ec-31a4-9c70-8cdfbcafb37c",
									true,
								},
							},
							name = "[Draw] Naught Hunts - leave after portal beams",
							uuid = "fca1eb59-475b-91b0-b5c3-6ba254632b67",
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
							name = "49985,49986,49987",
							spellIDList = 
							{
								49985,
								49986,
								49987,
							},
							uuid = "000d0d4a-b1ec-31a4-9c70-8cdfbcafb37c",
							version = 3,
						},
					},
				},
				eventType = 2,
				loop = true,
				mechanicTime = 682.9,
				name = "[Draw] Naught Hunts - leave after portal beams",
				timeRange = true,
				timelineIndex = 66,
				timerEndOffset = 1117.1,
				timerStartOffset = -712.9,
				uuid = "cf435fb2-e99c-09e3-9cf2-790b793a461e",
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
							actionLua = "local s=data.kaptinEnuo\nif s then\ns.huntsHit(eventArgs)\nend\nself.used=true",
							conditions = 
							{
								
								{
									"aba091c8-315b-0332-99f9-e0b15e7ac1db",
									true,
								},
							},
							name = "[Draw] Naught Hunts - actual chase / handoff",
							uuid = "4ecd2a7d-dc3b-f202-bd92-bb43f32843a5",
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
							name = "48475,49993",
							spellIDList = 
							{
								48475,
								49993,
							},
							uuid = "aba091c8-315b-0332-99f9-e0b15e7ac1db",
							version = 3,
						},
					},
				},
				eventType = 2,
				loop = true,
				mechanicTime = 682.9,
				name = "[Draw] Naught Hunts - actual chase / handoff",
				timeRange = true,
				timelineIndex = 66,
				timerEndOffset = 1117.1,
				timerStartOffset = -712.9,
				uuid = "a22f74e0-d722-3fbf-b1ed-6cad17bc19a2",
				version = 2,
			},
		},
	},
	inheritedProfiles = 
	{
	},
	timelineName = "enuo-ex",
	version = "1.0.1",
}



return tbl