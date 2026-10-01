local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin Settings",
				uuid = "1dd4d688-1e39-e42b-9bb2-ff105b0d0ea7",
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
				displayPath = "Kaptin Settings",
				eventType = 13,
				execute = "if KaptinZeleniaConfig == nil then KaptinZeleniaConfig={role=nil,index=1} end\nif KaptinPartyRoster == nil or KaptinPartyRoster.version < 2 then\n    local fresh = KaptinPartyRoster == nil\n    local r = KaptinPartyRoster or {\n        members={},rows={},byID={},byRole={},empty={},nextRefresh=0,revision=0,count=0,unassigned=0,\n        options={\"Unassigned\",\"MT\",\"OT\",\"H1\",\"H2\",\"M1\",\"M2\",\"R1\",\"R2\"},\n        roleIndex={MT=2,OT=3,H1=4,H2=5,M1=6,M2=7,R1=8,R2=9},\n        groupSlots={tanks={\"MT\",\"OT\"},healers={\"H1\",\"H2\"},meleeDPS={\"M1\",\"M2\"},physicalRangedDPS={\"R1\"},magicalRangedDPS={\"R2\"}},\n        roleGroup={MT=\"tanks\",OT=\"tanks\",H1=\"healers\",H2=\"healers\",M1=\"meleeDPS\",M2=\"meleeDPS\",R1=\"physicalRangedDPS\",R2=\"magicalRangedDPS\"},\n        groupOrder={tanks=1,healers=2,meleeDPS=3,physicalRangedDPS=4,magicalRangedDPS=5}\n    }\n    KaptinPartyRoster=r\n    r.version=2\n    r.confirmed,r.locked,r.dragRole,r.dragKey,r.dragged=false,false,nil,nil,false\n    r.nextRefresh=0\n    r.roleRows={\n        {role=\"MT\",popup=\"KaptinPickMT\"},{role=\"OT\",popup=\"KaptinPickOT\"},\n        {role=\"H1\",popup=\"KaptinPickH1\"},{role=\"H2\",popup=\"KaptinPickH2\"},\n        {role=\"M1\",popup=\"KaptinPickM1\"},{role=\"M2\",popup=\"KaptinPickM2\"},\n        {role=\"R1\",popup=\"KaptinPickR1\"},{role=\"R2\",popup=\"KaptinPickR2\"}\n    }\n    if fresh then\n        local p=TensorCore.mGetPlayer()\n        if p and r.roleIndex[KaptinZeleniaConfig.role] then r.seedID,r.seedRole=p.id,KaptinZeleniaConfig.role end\n    end\n    function r.compare(a,b)\n        if a.order~=b.order then return a.order<b.order end\n        if a.name~=b.name then return a.name<b.name end\n        return a.key<b.key\n    end\n    function r:syncOwn()\n        local m=self.byID[self.ownID]\n        self.ownRole=m and m.role or nil\n        KaptinZeleniaConfig.role=self.ownRole\n        KaptinZeleniaConfig.index=self.roleIndex[self.ownRole] or 1\n        KaptinZeleniaConfig.options=self.options\n    end\n    function r:getRole(id)\n        local m=self.byID[id]\n        return m and m.role or nil\n    end\n    function r:updateStatus()\n        local state=self.locked and \"Locked in\" or (self.confirmed and \"Confirmed\" or \"Editing\")\n        self.status=state..\"  |  Your position: \"..(self.ownRole or \"Unassigned\")..\"  |  Players: \"..#self.rows\n        self.lockLabel=self.locked and \"Unlock\" or \"Lock In\"\n    end\n    function r:invalidate(message)\n        self.confirmed,self.locked=false,false\n        self.message=message\n        self:updateStatus()\n    end\n    function r:rebuild()\n        for role in pairs(self.byRole) do self.byRole[role]=nil end\n        for pass=1,2 do\n            for i=1,#self.rows do\n                local m=self.rows[i]\n                if (pass==1 and m.manual) or (pass==2 and not m.manual) then\n                    local role=m.role\n                    if role and self.roleIndex[role] and not self.byRole[role] and (m.manual or self.roleGroup[role]==m.group) then\n                        self.byRole[role]=m\n                    else m.role=nil end\n                end\n            end\n        end\n        self.unassigned=0\n        for i=1,#self.rows do\n            local m=self.rows[i]\n            if not m.role and not m.manual then\n                local slots=self.groupSlots[m.group]\n                if slots then\n                    for j=1,#slots do\n                        local role=slots[j]\n                        if not self.byRole[role] then m.role,self.byRole[role]=role,m;break end\n                    end\n                end\n            end\n            m.index=self.roleIndex[m.role] or 1\n            m.pickLabel=m.name..\" [\"..m.jobName..\"]##KaptinPick\"..m.key\n            if not m.role then self.unassigned=self.unassigned+1 end\n        end\n        self:syncOwn()\n        for i=1,8 do\n            local slot=self.roleRows[i]\n            local m=self.byRole[slot.role]\n            slot.label=(m and (m.name..\" [\"..m.jobName..\"]\"..(m.id==self.ownID and \" (you)\" or \"\")) or \"Empty\")..\"##KaptinRole\"..slot.role\n            slot.dragLabel=\"Move \"..slot.role..\" to another row to swap\"\n        end\n        self.revision=self.revision+1\n        self:updateStatus()\n    end\n    function r:setMemberRole(m,role)\n        if self.locked or not m or self.members[m.key]~=m or (role and not self.roleIndex[role]) then return false end\n        if m.role==role then return true end\n        local oldRole,other=m.role,role and self.byRole[role] or nil\n        m.role,m.manual=role,true\n        if other and other~=m then other.role,other.manual=oldRole,true end\n        self:invalidate(nil)\n        self:rebuild()\n        return true\n    end\n    function r:setRole(id,role)\n        return self:setMemberRole(self.byID[id],role)\n    end\n    function r:swapRoles(fromRole,toRole,expectedKey)\n        local m=self.byRole[fromRole]\n        if not m or (expectedKey and m.key~=expectedKey) then return false end\n        return self:setMemberRole(m,toRole)\n    end\n    function r:autoAssign()\n        if self.locked then return false end\n        for i=1,#self.rows do self.rows[i].manual,self.rows[i].role=false,nil end\n        self:invalidate(nil)\n        self:rebuild()\n        return true\n    end\n    function r:confirm()\n        if #self.rows~=8 or self.unassigned~=0 then\n            self.message=\"Fill all eight positions before confirming.\"\n            return false\n        end\n        self.confirmed,self.message=true,nil\n        self:updateStatus()\n        return true\n    end\n    function r:toggleLock()\n        if self.locked then\n            self.locked=false\n        elseif self.confirmed then\n            self.locked=true\n            self.dragRole,self.dragKey,self.dragged=nil,nil,false\n        else\n            self.message=\"Confirm the roster before locking it.\"\n            return false\n        end\n        self.message=nil\n        self:updateStatus()\n        return true\n    end\n    function r:remember(id,guid,name,job)\n        if not id or not name then return end\n        if guid==0 or guid==\"\" then guid=nil end\n        local prior=self.byID[id]\n        local key\n        if prior and prior.name==name and (not guid or prior.guid==guid) then key=prior.key\n        else key=guid and (\"g:\"..tostring(guid)) or (\"e:\"..tostring(id)) end\n        local m=self.members[key]\n        if not m and prior and prior.name==name and (not prior.guid or not guid or prior.guid==guid) then\n            m=prior\n            self.members[m.key]=nil\n            m.key=key\n            self.members[key]=m\n            self.changed=true\n        end\n        if (not m or not m.seen) and self.count>=8 then return end\n        if not m then\n            m={key=key,manual=false}\n            self.members[key]=m\n            self.changed,self.compositionChanged=true,true\n        end\n        if not m.seen then self.count=self.count+1 end\n        m.seen=true\n        if m.job~=job or m.jobName==nil then\n            local group=job and TensorCore.getJobGroup(job) or nil\n            if m.job~=nil and m.group~=group then\n                m.manual,m.role=false,nil\n                self.compositionChanged=true\n            end\n            m.group,m.job,m.order=group,job,self.groupOrder[group] or 6\n            m.jobName=job and TensorCore.getJobNameByID(job) or \"UNK\"\n            self.changed=true\n        end\n        if m.id~=id or m.name~=name then self.changed=true end\n        m.id,m.name,m.guid=id,name,guid or m.guid\n        if id>0 then self.byID[id]=m end\n    end\n    function r:update(party,p)\n        if not p then return end\n        self.changed,self.compositionChanged=self.ownID~=p.id,false\n        self.ownID,self.count=p.id,0\n        for _,m in pairs(self.members) do m.seen=false end\n        local visited=0\n        for _,e in pairs(party or self.empty) do\n            visited=visited+1\n            if visited>8 then break end\n            self:remember(e.id,e.guid,e.name,e.job)\n        end\n        local own=self.byID[p.id]\n        if not own or not own.seen then self:remember(p.id,nil,p.name,p.job) end\n        for key,m in pairs(self.members) do\n            if not m.seen then self.members[key]=nil;self.changed,self.compositionChanged=true,true end\n        end\n        if not self.changed and not self.seedRole then self:syncOwn();return end\n        for id in pairs(self.byID) do self.byID[id]=nil end\n        for i=#self.rows,1,-1 do self.rows[i]=nil end\n        for _,m in pairs(self.members) do\n            self.rows[#self.rows+1]=m\n            if m.id>0 then self.byID[m.id]=m end\n        end\n        table.sort(self.rows,self.compare)\n        if self.seedRole then\n            local m=self.byID[self.seedID]\n            if m then m.role,m.manual=self.seedRole,true end\n            self.seedID,self.seedRole=nil,nil\n        end\n        if self.compositionChanged then\n            self:invalidate(\"Party changed. Check positions, then confirm again.\")\n            self.dragRole,self.dragKey,self.dragged=nil,nil,false\n        end\n        self:rebuild()\n    end\n    function r:refresh(now,force)\n        if not force and now<self.nextRefresh then return end\n        self.nextRefresh=now+1000\n        self:update(EntityList.myparty,TensorCore.mGetPlayer())\n    end\n    r:rebuild()\nend\n\nlocal roster=KaptinPartyRoster\nroster:refresh(Now())\nGUI:SetNextWindowSize(500,405,GUI.SetCond_FirstUseEver)\nlocal visible,open=GUI:Begin(\"Kaptin party roster\",true)\nif not open then GUI:SetWindowCollapsed(true,GUI.SetCond_Always) end\nif visible and open then\n    GUI:Text(roster.status)\n    GUI:Text(\"Left drag to swap. Right-click a row to pick a player.\")\n    GUI:Separator()\n    local released=GUI:IsMouseReleased(0)\n    if roster.dragRole and GUI:IsMouseDragging(0,5) then roster.dragged=true end\n    local dropRole\n    for i=1,8 do\n        local slot=roster.roleRows[i]\n        if i<=2 then GUI:TextColored(0.4,0.7,1,1,slot.role)\n        elseif i<=4 then GUI:TextColored(0.35,0.9,0.4,1,slot.role)\n        else GUI:TextColored(1,0.45,0.45,1,slot.role) end\n        GUI:SameLine(52)\n        GUI:Selectable(slot.label,roster.dragRole==i,0,0,23)\n        if not roster.locked then\n            if GUI:IsItemClicked(0) then\n                local m=roster.byRole[slot.role]\n                roster.dragRole,roster.dragKey,roster.dragged=m and i or nil,m and m.key or nil,false\n            end\n            if roster.dragRole and GUI:IsItemHovered(GUI.HoveredFlags_AllowWhenBlockedByActiveItem) then dropRole=slot.role end\n            if GUI:BeginPopupContextItem(slot.popup,1) then\n                roster.dragRole,roster.dragKey,roster.dragged=nil,nil,false\n                for j=1,#roster.rows do\n                    local m=roster.rows[j]\n                    if GUI:MenuItem(m.pickLabel,nil,roster.byRole[slot.role]==m,true) then roster:setMemberRole(m,slot.role) end\n                end\n                GUI:EndPopup()\n            end\n        end\n    end\n    if released then\n        if roster.dragRole and roster.dragged and dropRole then\n            roster:swapRoles(roster.roleRows[roster.dragRole].role,dropRole,roster.dragKey)\n        end\n        roster.dragRole,roster.dragKey,roster.dragged=nil,nil,false\n    elseif roster.dragRole and roster.dragged then\n        GUI:SetTooltip(roster.roleRows[roster.dragRole].dragLabel)\n    end\n    GUI:Separator()\n    if GUI:Button(\"Default Order\") then roster:autoAssign() end\n    GUI:SameLine()\n    if GUI:Button(\"Confirm\") then roster:confirm() end\n    GUI:SameLine()\n    if GUI:Button(roster.lockLabel) then roster:toggleLock() end\n    GUI:SameLine()\n    if GUI:Button(\"Force Refresh\") then roster:refresh(Now(),true) end\n    if roster.message then GUI:Text(roster.message) end\n    GUI:Text(\"Extra or unknown jobs: right-click an empty role to assign.\")\n    GUI:Text(\"Choices survive wipes. Lua reload resets the roster.\")\nelse\n    roster.dragRole,roster.dragKey,roster.dragged=nil,nil,false\nend\nGUI:End()\nself.used=true",
				executeType = 2,
				mechanicTime = 11.4,
				name = "Kaptin - Party roster",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -12,
				uuid = "c9511284-b902-9cd6-b03b-8e998b5d8efa",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin Draws",
				uuid = "ac074228-1cf9-bd67-9286-3230d10fd35c",
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
							actionLua = "data.kaptinZeleniaTimedDraws = data.kaptinZeleniaTimedDraws or {}\nlocal draws = data.kaptinZeleniaTimedDraws\nlocal role = KaptinZeleniaConfig and KaptinZeleniaConfig.role\nlocal west = role == \"MT\" or role == \"OT\" or role == \"H1\" or role == \"H2\"\nlocal east = role == \"M1\" or role == \"M2\" or role == \"R1\" or role == \"R2\"\nif west or east then\n    local p = TensorCore.mGetPlayer()\n    local x = west and 87 or 113\n    local heading = west and -math.pi/2 or math.pi/2\n    local drawer = TensorCore.getStaticDrawer(0xFF50FF50)\n    draws[#draws+1] = drawer:addTimedArrow(9000, 100, p.pos.y, 100, heading, 10, 0.35, 1.2, 1.2)\n    draws[#draws+1] = drawer:addTimedCircle(9000, x, p.pos.y, 100, 0.45, 0, false, true)\nend\nself.used = true",
							conditions = 
							{
								
								{
									"d9ceeca3-3fef-bf7b-9349-d3a45de94a17",
									true,
								},
							},
							name = "Add side arrow",
							uuid = "3c56267c-3f6e-c34c-8b1a-865f8937f873",
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
							name = "43189",
							spellIDList = 
							{
								43189,
							},
							uuid = "d9ceeca3-3fef-bf7b-9349-d3a45de94a17",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 3,
				loop = true,
				mechanicTime = 11.4,
				name = "Adds - Supports W / DPS E",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.59997558594,
				timerStartOffset = -11.39999961853,
				uuid = "0b0c14e4-fa99-8604-b858-b705cef68bbc",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local id = eventArgs.sourceEntityID\nlocal draws = data.kaptinZeleniaTethers\nlocal states = data.kaptinZeleniaSpecterAim\nlocal s = states and states[id]\nlocal lockAt = data.kaptinZeleniaSpecterLockAt\nlocal now = Now()\nif s and lockAt and now >= lockAt - 200 then\n    s.frozen = true\n    s.expires = now + 1500\n    local boss = TensorCore.mGetEntity(s.bossID)\n    local target = TensorCore.mGetEntity(id)\n    if boss and target then\n        local p, q = boss.pos, target.pos\n        local h = math.atan2(q.x - p.x, q.z - p.z)\n        local drawer = TensorCore.getMoogleDrawer()\n        -- Snapshot starts a new lifetime; timed updates retain the old start time.\n        if draws[id] then Argus.deleteTimedShape(draws[id]); draws[id] = nil end\n        draws[id] = drawer:addTimedConeOnEnt(1500, s.bossID, 48, math.pi / 3, nil, 0, nil, true, h, true)\n    end\nelse\n    if draws and draws[id] then Argus.deleteTimedShape(draws[id]); draws[id] = nil end\n    if states then states[id] = nil end\nend\nself.used = true",
							conditions = 
							{
								
								{
									"541d6335-c759-83d3-906d-6a8fcaadb1c4",
									true,
								},
							},
							name = "Remove transferred tether",
							uuid = "736e9977-21b5-ace8-bf20-03cdfd8cba96",
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "data.kaptinZeleniaTethers = data.kaptinZeleniaTethers or {}\ndata.kaptinZeleniaSpecterAim = data.kaptinZeleniaSpecterAim or {}\nlocal id = eventArgs.sourceEntityID\nlocal draws = data.kaptinZeleniaTethers\nif draws[id] then Argus.deleteTimedShape(draws[id]); draws[id] = nil end\ndata.kaptinZeleniaSpecterAim[id] = { bossID = eventArgs.newTargetID, expires = Now() + 10000 }\nlocal boss = TensorCore.mGetEntity(eventArgs.newTargetID)\nlocal target = TensorCore.mGetEntity(id)\nif boss and target then\n    local p, q = boss.pos, target.pos\n    local h = math.atan2(q.x - p.x, q.z - p.z)\n    draws[id] = TensorCore.getMoogleDrawer():addTimedConeOnEnt(10000, eventArgs.newTargetID, 48, math.pi / 3, nil, 0, nil, true, h, true)\nend\nself.used = true",
							conditions = 
							{
								
								{
									"6ecfb4fe-2a6f-d196-946f-eb1301417545",
									true,
								},
							},
							name = "Draw tether cone",
							uuid = "7ef5be82-e261-a09c-a5fc-b41ddf3b6eff",
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
							eventArgType = 2,
							eventIntValue = 89,
							name = "old89",
							uuid = "541d6335-c759-83d3-906d-6a8fcaadb1c4",
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
							eventIntValue = 89,
							name = "new89",
							uuid = "6ecfb4fe-2a6f-d196-946f-eb1301417545",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 15,
				loop = true,
				mechanicTime = 11.4,
				name = "Specter - Tether cones",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "4dcb1694-e2bb-2be0-974f-194f8fe93469",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local id = eventArgs.targetID\nlocal t = data.kaptinZeleniaTethers\nif t and t[id] then\n    Argus.deleteTimedShape(t[id])\n    t[id] = nil\nend\nlocal states = data.kaptinZeleniaSpecterAim\nif states then states[id] = nil end\nself.used = true",
							conditions = 
							{
								
								{
									"04ac538b-eb71-3e04-89aa-6f75b7946b48",
									true,
								},
							},
							name = "Clear resolved tether",
							uuid = "6665adca-9b13-7455-b0f2-1f492af0d16d",
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
							name = "43168",
							spellIDList = 
							{
								43168,
							},
							uuid = "04ac538b-eb71-3e04-89aa-6f75b7946b48",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 2,
				loop = true,
				mechanicTime = 11.4,
				name = "Specter - Clear resolved cone",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "a68b736a-ac55-9638-8598-8b8845c59da0",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "data.kaptinZeleniaRadial = { firstEnd = nil }\nself.used = true",
							conditions = 
							{
								
								{
									"4d004201-b00a-7318-b962-4ba110730a99",
									true,
								},
							},
							name = "Reset in-out timing",
							uuid = "751be42b-ddd4-c908-b640-5c81f9a4117f",
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
							name = "43448/43449",
							spellIDList = 
							{
								43448,
								43449,
							},
							uuid = "4d004201-b00a-7318-b962-4ba110730a99",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 3,
				loop = true,
				mechanicTime = 11.4,
				name = "Thunder Slash - Sequence",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "77099b71-ed46-187f-a0ac-b1f556c65090",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "data.kaptinZeleniaTimedDraws = data.kaptinZeleniaTimedDraws or {}\nlocal draws = data.kaptinZeleniaTimedDraws\ndata.kaptinZeleniaRadial = data.kaptinZeleniaRadial or {}\nlocal s = data.kaptinZeleniaRadial\nlocal now = Now()\nlocal duration = eventArgs.channelTimeMax * 1000\nlocal delay = 0\nif not s.firstEnd then\n    s.firstEnd = now + duration\nelse\n    delay = math.max(0, s.firstEnd - now)\nend\nif duration > delay then\n    draws[#draws+1] = TensorCore.getMoogleDrawer():addTimedCircleOnEnt(duration - delay, eventArgs.entityID, 8, delay)\nend\nself.used = true",
							conditions = 
							{
								
								{
									"da673058-ad62-2cbb-94fe-98b55f41c724",
									true,
								},
							},
							name = "Draw circle",
							uuid = "c0357f60-cc9b-d42f-9951-c6a5a1cf2a5a",
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
							name = "43450",
							spellIDList = 
							{
								43450,
							},
							uuid = "da673058-ad62-2cbb-94fe-98b55f41c724",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 3,
				loop = true,
				mechanicTime = 11.4,
				name = "Thunder Slash - Out telegraph",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "4cd7ee90-7e32-4a33-944a-d85619c80ab7",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "data.kaptinZeleniaTimedDraws = data.kaptinZeleniaTimedDraws or {}\nlocal draws = data.kaptinZeleniaTimedDraws\ndata.kaptinZeleniaRadial = data.kaptinZeleniaRadial or {}\nlocal s = data.kaptinZeleniaRadial\nlocal now = Now()\nlocal duration = eventArgs.channelTimeMax * 1000\nlocal delay = 0\nif not s.firstEnd then\n    s.firstEnd = now + duration\nelse\n    delay = math.max(0, s.firstEnd - now)\nend\nif duration > delay then\n    draws[#draws+1] = TensorCore.getMoogleDrawer():addTimedDonutOnEnt(duration - delay, eventArgs.entityID, 8, 24, delay)\nend\nself.used = true",
							conditions = 
							{
								
								{
									"d4415988-2cfa-16f2-8eb2-fa6eb18b094a",
									true,
								},
							},
							name = "Draw donut",
							uuid = "0ce5a14b-012d-5681-b9ac-87803b193355",
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
							name = "43451",
							spellIDList = 
							{
								43451,
							},
							uuid = "d4415988-2cfa-16f2-8eb2-fa6eb18b094a",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 3,
				loop = true,
				mechanicTime = 11.4,
				name = "Thunder Slash - In telegraph",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "a38fe4c5-bf2e-e1f5-824f-bcd5a8afbfe3",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "data.kaptinZeleniaTimedDraws = data.kaptinZeleniaTimedDraws or {}\nlocal draws = data.kaptinZeleniaTimedDraws\nlocal duration = eventArgs.channelTimeMax * 1000\nlocal visible = math.min(1500, duration)\ndraws[#draws+1] = TensorCore.getMoogleDrawer():addTimedConeOnEnt(visible, eventArgs.entityID, 24, math.pi/3, nil, math.max(0, duration-visible))\nself.used = true",
							conditions = 
							{
								
								{
									"894ad98a-2b42-65c2-8447-0bc6e3eb90ba",
									true,
								},
							},
							name = "Draw cleave cone",
							uuid = "312587bc-96d7-8312-be2c-27e6b5744479",
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
							name = "43216",
							spellIDList = 
							{
								43216,
							},
							uuid = "894ad98a-2b42-65c2-8447-0bc6e3eb90ba",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 3,
				loop = true,
				mechanicTime = 11.4,
				name = "Thunder Slash - Cleave cones",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "dd1620e6-0384-3ca2-944e-fbd96e29ba95",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinZeleniaBaits\nif not s then\n    s = { orders = {}, players = {}, draws = {}, selected = {} }\n    function s.sortDistance(a, b)\n        if a.distance == b.distance then return a.id < b.id end\n        return a.distance < b.distance\n    end\n    data.kaptinZeleniaBaits = s\nend\ns.selected = s.selected or {}\ns.nearDrawer = s.nearDrawer or TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1, 0.15, 0.15, 0.35))\ns.farDrawer = s.farDrawer or TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.1, 0.45, 1, 0.35))\nfor key, uuid in pairs(s.draws) do Argus.deleteTimedShape(uuid); s.draws[key] = nil end\nfor i = #s.orders, 1, -1 do s.orders[i] = nil end\nfor i = #s.players, 1, -1 do s.players[i] = nil end\nfor _, entity in pairs(TensorCore.getEntityGroupList(\"Party\", { noAliveCheck = true }) or {}) do\n    s.players[#s.players + 1] = { id = entity.id, distance = 0 }\nend\ns.boss = eventArgs.entityID\ns.wave = 1\ns.hits = 0\ns.active = true\ns.showAt = Now() + eventArgs.channelTimeMax * 1000 - 3500\ns.endAt = Now() + eventArgs.channelTimeMax * 1000 + 11200\nself.used = true",
							conditions = 
							{
								
								{
									"09da23e2-8609-24eb-a375-0570268119b9",
									true,
								},
							},
							name = "Initialize four bait waves",
							uuid = "36eaa7b4-2a12-ded7-ac09-703f91d6fe60",
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
							name = "43181",
							spellIDList = 
							{
								43181,
							},
							uuid = "09da23e2-8609-24eb-a375-0570268119b9",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 3,
				loop = true,
				mechanicTime = 11.4,
				name = "Escelons - Prepare baits",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "a18ae983-0cc1-76e3-ae79-cdc6f0c3e5f3",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinZeleniaBaits\nif s and s.active and #s.orders < 4 and s.boss == eventArgs.primaryEntityID then\n    s.orders[#s.orders + 1] = true\nend\nself.used = true",
							conditions = 
							{
								
								{
									"89b3a29d-d76f-832e-ac3e-623bd312cd16",
									true,
								},
							},
							name = "Record bait order",
							uuid = "2e2898c9-e2a5-3d71-a28b-fcdcde062ad5",
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
							eventIntValue = 2127,
							name = "Near flash",
							uuid = "89b3a29d-d76f-832e-ac3e-623bd312cd16",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 27,
				loop = true,
				mechanicTime = 11.4,
				name = "Escelons - Record Near",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "89c61780-56c5-01b2-a9c4-18482e0be077",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinZeleniaBaits\nif s and s.active and #s.orders < 4 and s.boss == eventArgs.primaryEntityID then\n    s.orders[#s.orders + 1] = false\nend\nself.used = true",
							conditions = 
							{
								
								{
									"590d2425-74a1-e3aa-8373-dd6c14d52d22",
									true,
								},
							},
							name = "Record bait order",
							uuid = "8013b96f-8d4c-2616-905b-f6c8125011c6",
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
							eventIntValue = 2128,
							name = "Far flash",
							uuid = "590d2425-74a1-e3aa-8373-dd6c14d52d22",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 27,
				loop = true,
				mechanicTime = 11.4,
				name = "Escelons - Record Far",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "1546b71b-1866-7a7e-81ed-7dde3ef37bed",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinZeleniaBaits\nif s and s.active then\n    s.hits = s.hits + 1\n    if s.hits % 4 == 0 then\n        s.wave = s.wave + 1\n        for id, uuid in pairs(s.draws) do Argus.deleteTimedShape(uuid); s.draws[id] = nil end\n        if s.wave > 4 then s.active = false end\n    end\nend\nself.used = true",
							conditions = 
							{
								
								{
									"75d336ef-4091-28c2-8887-ecfe7e1e5772",
									true,
								},
							},
							name = "Advance after four cones",
							uuid = "e2fc0690-9c16-33f8-a0b3-29f74cc05841",
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
							name = "43183",
							spellIDList = 
							{
								43183,
							},
							uuid = "75d336ef-4091-28c2-8887-ecfe7e1e5772",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 2,
				loop = true,
				mechanicTime = 11.4,
				name = "Escelons - Advance wave",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "f667a1e8-7639-1041-ac87-1a5f361e998b",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "data.kaptinZeleniaFloor = data.kaptinZeleniaFloor or { red = {}, ready = false, version = 0 }\nlocal f = data.kaptinZeleniaFloor\nf.known = f.known or {}\nf.eventKnown = f.eventKnown or {}\nfor i = 0, 15 do\n    f.red[i] = false\n    f.known[i] = false\n    f.eventKnown[i] = false\nend\nf.ready = false\nf.knownCount = 0\nf.readAfter = nil\nf.readUntil = Now() + 30000\nf.settleUntil = nil\nf.initialClosed = false\nf.resourceReadStatus = \"waiting_activation\"\nf.resourceSamples = 0\nf.version = f.version + 1\nlocal s = data.kaptinZeleniaRoses\nif not s then\n    s = { markers = {}, towers = {}, ground = {}, pair = { MT = 1, R1 = 1, H2 = 2, R2 = 2, OT = 3, M2 = 3, H1 = 4, M1 = 4 } }\n    function s.tilePosition(tile, radius)\n        local h = (157.5 - 45 * (tile % 8)) * math.pi / 180\n        return 100 + radius * math.sin(h), 100 + radius * math.cos(h)\n    end\n    function s.anchor(floor)\n        local anchor\n        for i = 0, 7 do\n            if not floor.red[i] and floor.red[(i+7)%8] and floor.red[(i+1)%8] then\n                if anchor ~= nil then return nil end\n                anchor = i\n            end\n        end\n        return anchor\n    end\n    function s.clearGuide(state)\n        if state.dot then Argus.deleteTimedShape(state.dot); state.dot = nil end\n        if state.arrow then Argus.deleteTimedShape(state.arrow); state.arrow = nil end\n        state.lastKey = nil\n    end\n    function s.guide(state, key, x, z, duration, arrow)\n        if state.lastKey == key then return end\n        state.clearGuide(state)\n        local p = TensorCore.mGetPlayer()\n        local drawer = TensorCore.getStaticDrawer(0xFF50FF50)\n        state.dot = drawer:addTimedCircle(duration, x, p.pos.y, z, 0.45, 0, false, true)\n        if arrow then\n            state.destination = state.destination or {x=0,y=0,z=0}\n            state.destination.x, state.destination.y, state.destination.z = x, p.pos.y, z\n            local heading = TensorCore.getHeadingToTarget(p.pos, state.destination)\n            local length = TensorCore.getDistance2d(p.pos, state.destination)\n            if length > 1 then state.arrow = drawer:addTimedArrow(duration, p.pos.x, p.pos.y, p.pos.z, heading, math.max(0.1,length-1), 0.25, 1, 1) end\n        end\n        state.lastKey = key\n    end\n    data.kaptinZeleniaRoses = s\nend\ns.clearGuide(s)\nfor k in pairs(s.markers) do s.markers[k] = nil end\nfor k in pairs(s.towers) do s.towers[k] = nil end\nfor k in pairs(s.ground) do s.ground[k] = nil end\ns.stage = eventArgs.spellID == 43193 and 1 or eventArgs.spellID - 43538\ns.markerReadyAt = nil\ns.roseDropped = false\ns.anchorTile = nil\ns.thornsActive = false\ns.thornsMove = false\ns.groundSouth = nil\nself.used = true",
							conditions = 
							{
								
								{
									"5c0fe8f1-05ca-2051-a4ea-e9db49b84811",
									true,
								},
							},
							name = "Initialize floor and assignments",
							uuid = "e6f6a270-97ab-e56d-a700-9ac32614508f",
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
							name = "43193/43540/43541/43542/43543/43544",
							spellIDList = 
							{
								43193,
								43540,
								43541,
								43542,
								43543,
								43544,
							},
							uuid = "5c0fe8f1-05ca-2051-a4ea-e9db49b84811",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 3,
				loop = true,
				mechanicTime = 11.4,
				name = "Roseblood - Reset floor state",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "6348335a-e08e-0f3f-8c77-6b37a6165e73",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local f = data.kaptinZeleniaFloor\nif not f or not f.known then self.used = true; return end\nlocal now = Now()\n-- The floor activation packet is present even when setup tile packets are absent.\nif eventArgs.a1 == 1 then\n    if not f.initialClosed and f.readUntil and now < f.readUntil then\n        f.readAfter = now + 300\n        f.resourceReadStatus = \"waiting_settle\"\n    end\n    self.used = true\n    return\nend\nlocal tile = eventArgs.a1 - 4\nlocal red = not (eventArgs.a2 == 32 and eventArgs.a3 == 4)\n-- A post-drop change cannot establish the unknown initial floor.\nif eventArgs.a2 == 64 and eventArgs.a3 == 128 then\n    f.initialClosed = true\n    if not f.ready then f.resourceReadStatus = \"initial_floor_unresolved\" end\nend\nif not f.known[tile] then\n    f.known[tile] = true\n    f.knownCount = f.knownCount + 1\nend\nf.red[tile] = red\nf.eventKnown[tile] = true\nf.version = f.version + 1\nif not f.ready then f.settleUntil = now + 300 end\nself.used = true",
							conditions = 
							{
								
								{
									"f827f608-4b74-c930-bbc8-56f9535fa817",
									true,
								},
								
								{
									"40379391-7a46-3b2d-8abf-3e059119a348",
									true,
								},
								
								{
									"fdfc1726-fafb-b399-8e01-2d7c5691496a",
									true,
								},
							},
							name = "Record red floor",
							uuid = "ba3655e6-a20f-ab3e-9f43-d1db267d04d7",
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
							eventIntValue = 1,
							name = "Floor index >=1",
							uuid = "f827f608-4b74-c930-bbc8-56f9535fa817",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							comparator = 2,
							dequeueIfLuaFalse = true,
							eventIntValue = 19,
							name = "Tile index <=19",
							uuid = "40379391-7a46-3b2d-8abf-3e059119a348",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return (eventArgs.a1 == 1 and eventArgs.a2 == 1 and eventArgs.a3 == 2) or (eventArgs.a1 >= 4 and ((eventArgs.a2 == 64 and eventArgs.a3 == 128) or (eventArgs.a2 == 256 and eventArgs.a3 == 64) or (eventArgs.a2 == 32 and eventArgs.a3 == 4)))",
							dequeueIfLuaFalse = true,
							name = "Tile change / activation",
							uuid = "fdfc1726-fafb-b399-8e01-2d7c5691496a",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 14,
				loop = true,
				mechanicTime = 11.4,
				name = "Roseblood - Track red tiles",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "fa2055d3-ed31-3336-b657-964a55a8f870",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinZeleniaRoses\nif s then\n    s.markers[eventArgs.entityID] = eventArgs.markerID\n    s.markerReadyAt = Now() + 300\nend\nself.used = true",
							conditions = 
							{
								
								{
									"d54b4820-cb36-a437-b1b5-1f9c7a9b3e0b",
									true,
								},
							},
							name = "Record rose and spread targets",
							uuid = "655f6bd2-94c9-fe85-b5b5-3c7450a8b481",
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
								592,
								596,
							},
							name = "Rose / Pointblank",
							uuid = "d54b4820-cb36-a437-b1b5-1f9c7a9b3e0b",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 4,
				loop = true,
				mechanicTime = 11.4,
				name = "Roseblood - Track assignments",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "e43ad8b9-4d87-ef8f-8763-1b08cd44284d",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinZeleniaRoses\nlocal e = TensorCore.mGetEntity(eventArgs.entityID)\nif s and s.stage == 3 and e then\n    local best, bestDistance\n    for tile = 0, 7 do\n        local x, z = s.tilePosition(tile, 12)\n        local dx, dz = x - e.pos.x, z - e.pos.z\n        local distance = dx*dx + dz*dz\n        if bestDistance == nil or distance < bestDistance then best, bestDistance = tile, distance end\n    end\n    if bestDistance < 1 then\n        s.towers[best] = { x=e.pos.x, z=e.pos.z, endAt=Now()+eventArgs.channelTimeMax*1000 }\n    end\nend\nself.used = true",
							conditions = 
							{
								
								{
									"ba523b45-226d-ee61-97af-86afb0c28268",
									true,
								},
							},
							name = "Record tower positions",
							uuid = "df0f210d-2ecd-46cd-a315-e293fc130eca",
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
							name = "43201",
							spellIDList = 
							{
								43201,
							},
							uuid = "ba523b45-226d-ee61-97af-86afb0c28268",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 3,
				loop = true,
				mechanicTime = 11.4,
				name = "Roseblood 3 - Record towers",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "9da3af7b-d8fa-629a-aa3b-f1cb617bf8ac",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinZeleniaRoses\nif s and eventArgs.targetID == TensorCore.mGetPlayer().id then\n    s.roseDropped = true\n    s.clearGuide(s)\nend\nself.used = true",
							conditions = 
							{
								
								{
									"1b4b623e-cde6-072b-9c0c-097cda139446",
									true,
								},
							},
							name = "Stop rose placement guidance",
							uuid = "04efecc4-d980-7103-8c3b-b7fcb7503aeb",
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
							name = "43040",
							spellIDList = 
							{
								43040,
							},
							uuid = "1b4b623e-cde6-072b-9c0c-097cda139446",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 2,
				loop = true,
				mechanicTime = 11.4,
				name = "Roseblood - Clear dropped rose",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "ec945d03-ffe9-ff68-864c-a36d3728147a",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinZeleniaRoses\nlocal e = TensorCore.mGetEntity(eventArgs.entityID)\nif s and s.stage == 4 and e then\n    s.ground[eventArgs.entityID] = { x=e.pos.x, z=e.pos.z, endAt=Now()+eventArgs.channelTimeMax*1000 }\n    local sumZ,count = 0,0\n    for _,ground in pairs(s.ground) do\n        sumZ,count = sumZ+ground.z-100,count+1\n    end\n    if count==2 and math.abs(sumZ)>=4 then s.groundSouth=sumZ>0 end\nend\nself.used = true",
							conditions = 
							{
								
								{
									"b262c55f-2005-0740-948a-7bba94ec0af6",
									true,
								},
							},
							name = "Record ground circle side",
							uuid = "2c016039-6124-04b7-8ecc-8ba4dc7e9383",
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
							name = "43238",
							spellIDList = 
							{
								43238,
							},
							uuid = "b262c55f-2005-0740-948a-7bba94ec0af6",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 3,
				loop = true,
				mechanicTime = 11.4,
				name = "Roseblood 4 - Ground circles",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "a86b1054-37ee-84ea-ae3e-4a84573192a3",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinZeleniaRoses\nif s and s.stage == 4 and eventArgs.targetID == TensorCore.mGetPlayer().id then s.clearGuide(s) end\nself.used = true",
							conditions = 
							{
								
								{
									"04149d12-165e-2024-ac0f-0020761768b6",
									true,
								},
							},
							name = "Clear resolved placement",
							uuid = "9253fea5-c874-1efc-9d74-1d983a6669b4",
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
							name = "43236",
							spellIDList = 
							{
								43236,
							},
							uuid = "04149d12-165e-2024-ac0f-0020761768b6",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 2,
				loop = true,
				mechanicTime = 11.4,
				name = "Roseblood 4 - Clear spread",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "0dc7c172-ec5c-9197-8940-a9a432b3e996",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinZeleniaRoses\nif s and s.stage == 4 then\n    s.thornsActive = true\n    s.thornsMove = false\n    s.clearGuide(s)\nend\nself.used = true",
							conditions = 
							{
								
								{
									"e6bcedb2-56d9-7b63-b4a6-98ce3077d0b1",
									true,
								},
							},
							name = "Prepare chain guidance",
							uuid = "731ba229-10a3-add1-b43c-ddc9ce9171e1",
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
							name = "43203",
							spellIDList = 
							{
								43203,
							},
							uuid = "e6bcedb2-56d9-7b63-b4a6-98ce3077d0b1",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 3,
				loop = true,
				mechanicTime = 11.4,
				name = "Encircling Thorns - Start",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "d39e8780-59c5-17f5-a11c-54e67240f478",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinZeleniaRoses\nif s and s.stage == 4 and s.thornsActive and not s.thornsMove then\n    s.thornsMove = true\n    s.clearGuide(s)\n    local role = KaptinZeleniaConfig and KaptinZeleniaConfig.role\n    local west = role == \"MT\" or role == \"OT\" or role == \"H1\" or role == \"H2\"\n    local east = role == \"M1\" or role == \"M2\" or role == \"R1\" or role == \"R2\"\n    if west or east then\n        local p = TensorCore.mGetPlayer()\n        local heading = west and -math.pi/2 or math.pi/2\n        s.arrow = TensorCore.getStaticDrawer(0xFF50FF50):addTimedArrow(6000, p.pos.x, p.pos.y, p.pos.z, heading, 10, 0.35, 1.2, 1.2)\n    end\nend\nself.used = true",
							conditions = 
							{
								
								{
									"a374ee23-cdd7-d4d3-87b3-f74bf38e1202",
									true,
								},
							},
							name = "Switch to chain-break direction",
							uuid = "025da68e-815d-ad3e-bb18-35f1c0e9b195",
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
							eventIntValue = 18,
							name = "Chain tether",
							uuid = "a374ee23-cdd7-d4d3-87b3-f74bf38e1202",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 15,
				loop = true,
				mechanicTime = 11.4,
				name = "Encircling Thorns - Chains",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "a09160e4-ec58-c1ed-8591-213cb60c11b5",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinZeleniaRoses\nif s and s.thornsActive then s.thornsActive = false; s.clearGuide(s) end\nself.used = true",
							conditions = 
							{
								
								{
									"7ad0c3ab-595c-24db-a40f-b89734550ae5",
									true,
								},
							},
							name = "Clear resolved chains",
							uuid = "ebb209c1-cbcf-13ca-aeb5-73e0fe8fc7c0",
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
							name = "43241",
							spellIDList = 
							{
								43241,
							},
							uuid = "7ad0c3ab-595c-24db-a40f-b89734550ae5",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 2,
				loop = true,
				mechanicTime = 11.4,
				name = "Encircling Thorns - Clear",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "2a252d15-7b00-8d07-9d5b-6a52095467cb",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local old = eventArgs.oldData\nif old then\n    local timed = old.kaptinZeleniaTimedDraws\n    if timed then\n        for _, id in pairs(timed) do if id then Argus.deleteTimedShape(id) end end\n    end\n    local tethers = old.kaptinZeleniaTethers\n    if tethers then\n        for _, id in pairs(tethers) do if id then Argus.deleteTimedShape(id) end end\n    end\n    local baits = old.kaptinZeleniaBaits\n    if baits and baits.draws then\n        for _, id in pairs(baits.draws) do if id then Argus.deleteTimedShape(id) end end\n    end\n    local roses = old.kaptinZeleniaRoses\n    if roses then\n        if roses.dot then Argus.deleteTimedShape(roses.dot) end\n        if roses.arrow then Argus.deleteTimedShape(roses.arrow) end\n    end\nend\nself.used = true",
							name = "Delete owned draw handles",
							uuid = "a6d694a0-a776-30d6-82a3-8388e356c53d",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Kaptin Draws",
				eventType = 9,
				loop = true,
				mechanicTime = 11.4,
				name = "Kaptin - Clear draws on wipe",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -12,
				uuid = "12697b18-c5db-744a-bb50-335e4dc1fdb5",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local now = Now()\nif eventArgs.spellID == 43167 then\n    data.kaptinZeleniaSpecterLockAt = now + eventArgs.channelTimeMax * 1000\nelse\n    data.kaptinZeleniaTethers = data.kaptinZeleniaTethers or {}\n    data.kaptinZeleniaSpecterAim = data.kaptinZeleniaSpecterAim or {}\n    local id = eventArgs.targetID\n    local old = data.kaptinZeleniaTethers[id]\n    if old then Argus.deleteTimedShape(old) end\n    local duration = eventArgs.channelTimeMax * 1000 + 600\n    data.kaptinZeleniaTethers[id] = TensorCore.getMoogleDrawer():addTimedConeOnEnt(duration, eventArgs.entityID, 48, math.pi / 3, nil, 0, nil, true)\n    data.kaptinZeleniaSpecterAim[id] = { bossID = eventArgs.entityID, expires = now + duration, helper = true }\nend\nself.used = true",
							conditions = 
							{
								
								{
									"18e605d4-3dc8-aae2-b276-df9b26df3b0e",
									true,
								},
							},
							name = "Track Specter snapshot and helper",
							uuid = "ea7fede2-036e-2b7e-a66c-2d7b36dc053d",
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
							name = "43167/43168",
							spellIDList = 
							{
								43167,
								43168,
							},
							uuid = "18e605d4-3dc8-aae2-b276-df9b26df3b0e",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 3,
				loop = true,
				mechanicTime = 11.4,
				name = "Specter - Lock and impact cones",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "8eba2541-9c83-cfd4-8f0c-cd457cb63977",
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
				displayPath = "Kaptin Draws",
				eventType = 12,
				execute = "local states = data.kaptinZeleniaSpecterAim\nlocal draws = data.kaptinZeleniaTethers\nif not states or next(states) == nil then self.used = true; return end\nlocal now = Now()\nif now < (data.kaptinZeleniaSpecterNextUpdate or 0) then self.used = true; return end\ndata.kaptinZeleniaSpecterNextUpdate = now + 100\nlocal drawer = TensorCore.getMoogleDrawer()\nfor id, s in pairs(states) do\n    if now >= s.expires then\n        if draws[id] then Argus.deleteTimedShape(draws[id]); draws[id] = nil end\n        states[id] = nil\n    elseif not s.helper and not s.frozen then\n        local boss = TensorCore.mGetEntity(s.bossID)\n        local target = TensorCore.mGetEntity(id)\n        if boss and target then\n            local p, q = boss.pos, target.pos\n            local h = math.atan2(q.x - p.x, q.z - p.z)\n            local remaining = math.ceil(s.expires - now)\n            if not draws[id] or not drawer:updateTimedConeOnEnt(draws[id], nil, s.bossID, 48, math.pi / 3, nil, 0, nil, true, h, true) then\n                draws[id] = drawer:addTimedConeOnEnt(remaining, s.bossID, 48, math.pi / 3, nil, 0, nil, true, h, true)\n            end\n        end\n    end\nend\nself.used = true",
				executeType = 2,
				loop = true,
				mechanicTime = 11.4,
				name = "Specter - Follow full length cones",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 248.6,
				timerStartOffset = 13.6,
				uuid = "6c386c90-ea62-5e18-ac7b-ef01ae0c375c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local states = data.kaptinZeleniaShades\nlocal s = states and states[eventArgs.sourceEntityID]\nif s then\n    s.frozen = true\n    if s.dot then Argus.deleteTimedShape(s.dot); s.dot = nil end\nend\nself.used = true",
							conditions = 
							{
								
								{
									"03977843-84d7-9375-bcec-764f390b798d",
									true,
								},
								
								{
									"1ccb0b3a-392b-bebc-8935-0eaa3569c26b",
									true,
								},
							},
							name = "Freeze detached bait",
							uuid = "4571d5c0-c6fd-3361-9e3d-cbae04acd58e",
							version = 2.1,
						},
					},
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "data.kaptinZeleniaShades = data.kaptinZeleniaShades or {}\nlocal states = data.kaptinZeleniaShades\nlocal id = eventArgs.sourceEntityID\nlocal s = states[id]\nif s then\n    if s.draw then Argus.deleteTimedShape(s.draw) end\n    if s.dot then Argus.deleteTimedShape(s.dot) end\nend\nstates[id] = { targetID = eventArgs.newTargetID, expires = Now() + 9000 }\nself.used = true",
							conditions = 
							{
								
								{
									"03977843-84d7-9375-bcec-764f390b798d",
									true,
								},
								
								{
									"39169bb8-0346-87cc-a2d1-f1b159466ae1",
									true,
								},
							},
							name = "Record clone tether",
							uuid = "d105778a-4505-346a-af79-a42bb165e31c",
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
							eventEntityContentID = 13864,
							name = "Zelenia shade",
							uuid = "03977843-84d7-9375-bcec-764f390b798d",
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
							eventIntValue = 17,
							name = "New 17",
							uuid = "39169bb8-0346-87cc-a2d1-f1b159466ae1",
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
							eventIntValue = 17,
							name = "Old 17",
							uuid = "1ccb0b3a-392b-bebc-8935-0eaa3569c26b",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 15,
				loop = true,
				mechanicTime = 11.4,
				name = "Adds - Shade tether targets",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 153.6,
				timerStartOffset = 68.6,
				uuid = "075052fe-4020-edc5-9826-3b3680a684a4",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local states = data.kaptinZeleniaShades\nlocal s = states and states[eventArgs.entityID]\nif s then s.side = eventArgs.newAnimID == 3216 and -1 or 1 end\nself.used = true",
							conditions = 
							{
								
								{
									"dab6b491-750a-fb0d-bb9b-9d9099edce7b",
									true,
								},
								
								{
									"bf5527c2-39c9-d578-ae91-bc07e49c8fd9",
									true,
								},
							},
							name = "Read glowing hand",
							uuid = "1f0371c9-c826-a221-a1d9-6011a38359fa",
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
							eventEntityContentID = 13864,
							name = "Zelenia shade",
							uuid = "dab6b491-750a-fb0d-bb9b-9d9099edce7b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return eventArgs.index == 1 and (eventArgs.newAnimID == 3216 or eventArgs.newAnimID == 3217)",
							dequeueIfLuaFalse = true,
							name = "Right or left windup",
							uuid = "bf5527c2-39c9-d578-ae91-bc07e49c8fd9",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 23,
				loop = true,
				mechanicTime = 11.4,
				name = "Adds - Shade hand tell",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 153.6,
				timerStartOffset = 68.6,
				uuid = "d6eaab2b-0ca3-7a8e-9a7c-768bd1202f80",
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
				displayPath = "Kaptin Draws",
				eventType = 12,
				execute = "local states = data.kaptinZeleniaShades\nif not states or next(states) == nil then self.used = true; return end\nlocal now = Now()\nif now < (data.kaptinZeleniaShadeNextUpdate or 0) then self.used = true; return end\ndata.kaptinZeleniaShadeNextUpdate = now + 100\nlocal playerID = TensorCore.mGetPlayer().id\nlocal drawer = TensorCore.getMoogleDrawer()\nfor id, s in pairs(states) do\n    if now >= s.expires then\n        if s.draw then Argus.deleteTimedShape(s.draw) end\n        if s.dot then Argus.deleteTimedShape(s.dot) end\n        states[id] = nil\n    elseif s.side and not s.frozen then\n        local source = TensorCore.mGetEntity(id)\n        local target = TensorCore.mGetEntity(s.targetID)\n        if source and target then\n            local p, q = source.pos, target.pos\n            local h = math.atan2(q.x - p.x, q.z - p.z) + s.side * math.pi / 2\n            local x, z = p.x - math.sin(h), p.z - math.cos(h)\n            local remaining = math.ceil(s.expires - now)\n            if not s.draw or not drawer:updateTimedRect(s.draw, nil, x, p.y, z, 34, 74, h, 0, nil, true) then\n                s.draw = drawer:addTimedRect(remaining, x, p.y, z, 34, 74, h, 0, nil, true)\n            end\n            if s.targetID == playerID and not s.dot then\n                local outward = p.x < 100 and -1 or 1\n                local baitZ = p.z + 7 * outward * s.side\n                s.dot = TensorCore.getStaticDrawer(0xFF00FF00):addTimedCircle(remaining, p.x, p.y, baitZ, 0.65, 0, nil, true)\n            end\n        end\n    end\nend\nself.used = true",
				executeType = 2,
				loop = true,
				mechanicTime = 11.4,
				name = "Adds - Personal bait and cleave preview",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 153.6,
				timerStartOffset = 68.6,
				uuid = "e2fc5a1c-f809-828e-9693-0b03000c76f3",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "data.kaptinZeleniaShades = data.kaptinZeleniaShades or {}\nlocal states = data.kaptinZeleniaShades\nlocal id = eventArgs.entityID\nlocal s = states[id] or {}\nif s.draw then Argus.deleteTimedShape(s.draw); s.draw = nil end\nif s.dot then Argus.deleteTimedShape(s.dot); s.dot = nil end\nlocal source = TensorCore.mGetEntity(id)\nlocal duration = eventArgs.channelTimeMax * 1000 + 500\ns.frozen = true\ns.expires = Now() + duration\nstates[id] = s\nif source then\n    local p = source.pos\n    local side = s.side or (eventArgs.spellID == 43187 and -1 or 1)\n    local h = p.h + side * math.pi / 2\n    s.draw = TensorCore.getMoogleDrawer():addTimedRect(duration, p.x - math.sin(h), p.y, p.z - math.cos(h), 34, 74, h, 0, nil, true)\nend\nself.used = true",
							conditions = 
							{
								
								{
									"c215a94f-7191-ab77-ac3b-d502c6338cce",
									true,
								},
							},
							name = "Freeze cleave and clear bait point",
							uuid = "b43a4dc6-f177-0ffe-9c49-a4f10145b03b",
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
							name = "43187/43188",
							spellIDList = 
							{
								43187,
								43188,
							},
							uuid = "c215a94f-7191-ab77-ac3b-d502c6338cce",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 3,
				loop = true,
				mechanicTime = 11.4,
				name = "Adds - Locked clone cleave",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 153.6,
				timerStartOffset = 68.6,
				uuid = "5eeee7a6-bd6f-ead4-b439-6e9794ff8160",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local states = data.kaptinZeleniaShades\nlocal s = states and states[eventArgs.entityID]\nif s then\n    if s.draw then Argus.deleteTimedShape(s.draw) end\n    if s.dot then Argus.deleteTimedShape(s.dot) end\n    states[eventArgs.entityID] = nil\nend\nself.used = true",
							conditions = 
							{
								
								{
									"628bad92-96cd-05e1-a496-c7b060f61d9f",
									true,
								},
							},
							name = "Remove resolved clone shapes",
							uuid = "142ca5e7-9e7b-c44e-8f16-3a65298efc86",
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
							name = "43187/43188",
							spellIDList = 
							{
								43187,
								43188,
							},
							uuid = "628bad92-96cd-05e1-a496-c7b060f61d9f",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				eventType = 2,
				loop = true,
				mechanicTime = 11.4,
				name = "Adds - Clear resolved clone cleave",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 153.6,
				timerStartOffset = 68.6,
				uuid = "664361f4-7672-b22f-92bc-b62edc099d5d",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local states = eventArgs.oldData and eventArgs.oldData.kaptinZeleniaShades\nif states then\n    for _, s in pairs(states) do\n        if s.draw then Argus.deleteTimedShape(s.draw) end\n        if s.dot then Argus.deleteTimedShape(s.dot) end\n    end\nend\nself.used = true",
							name = "Clear old clone shapes",
							uuid = "4214056d-d67c-aed9-a344-679402a07385",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Kaptin Draws",
				eventType = 9,
				loop = true,
				mechanicTime = 11.4,
				name = "Adds - Clear clone shapes on wipe",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -12,
				uuid = "04ab3e14-37fd-810a-8e5b-94d15b5bcdc3",
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
				displayPath = "Kaptin Draws",
				execute = "self.used = true\nlocal f = data.kaptinZeleniaFloor\nlocal s = data.kaptinZeleniaRoses\nif not f or not f.known or not s or f.ready or f.initialClosed then return end\nlocal now = Now()\nif not f.readAfter or now < f.readAfter then return end\nif not f.readUntil or now > f.readUntil then f.resourceReadStatus = \"expired\"; return end\nif f.knownCount == 16 then\n    if not f.settleUntil or now >= f.settleUntil then\n        f.ready = true\n        f.resourceReadStatus = \"complete\"\n        if s.stage == 3 and not s.anchorTile then s.anchorTile = s.anchor(f) end\n    end\n    return\nend\nif not Argus or not Argus.getNumCurrentMapEffects or not Argus.getMapEffectResource\n    or not Argus.getEffectResourceInfo or not Argus.getNumEffectResourceScripts\n    or not Argus.getEffectResourceScriptInfo then\n    f.resourceReadStatus = \"api_unavailable\"\n    return\nend\nif Argus.getNumCurrentMapEffects() < 20 then\n    f.resourceReadStatus = \"resources_unavailable\"\n    return\nend\nf.resourceSamples = f.resourceSamples + 1\nf.resourceReadStatus = \"incomplete\"\nfor tile = 0, 15 do\n    -- Exact packets take precedence over a later resource observation.\n    if not f.eventKnown[tile] then\n        local resource = Argus.getMapEffectResource(tile + 4)\n        if resource then\n            local resourceID, path, resourceType, active = Argus.getEffectResourceInfo(resource)\n            if resourceType == 6 and active == true then\n                local scriptCount = Argus.getNumEffectResourceScripts(resource)\n                -- Verified flag/index mapping: clear4->2, red64->6, red128->7.\n                local gray, red = false, false\n                if scriptCount > 2 then\n                    local name, count, script, running = Argus.getEffectResourceScriptInfo(resource, 2)\n                    gray = name ~= nil and running == true\n                end\n                if scriptCount > 6 then\n                    local name, count, script, running = Argus.getEffectResourceScriptInfo(resource, 6)\n                    red = name ~= nil and running == true\n                end\n                if scriptCount > 7 then\n                    local name, count, script, running = Argus.getEffectResourceScriptInfo(resource, 7)\n                    red = red or (name ~= nil and running == true)\n                end\n                -- Inactive, missing and conflicting scripts are unknown, never implicit gray.\n                if gray ~= red then\n                    if not f.known[tile] then\n                        f.known[tile] = true\n                        f.knownCount = f.knownCount + 1\n                        f.settleUntil = now + 300\n                        f.version = f.version + 1\n                    elseif f.red[tile] ~= red then\n                        f.settleUntil = now + 300\n                        f.version = f.version + 1\n                    end\n                    f.red[tile] = red\n                end\n            end\n        end\n    end\nend",
				executeType = 2,
				loop = true,
				mechanicTime = 11.4,
				name = "Roseblood - Read current floor resources",
				throttleTime = 1000,
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "0dc6071c-2c36-4552-9f98-729fc0c4604c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin",
				uuid = "d8611a44-0e55-ddc1-95e9-6530835e805a",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "Kaptin",
				name = "Hector Thunder",
				uuid = "9495f10a-f85e-1f39-9153-27534818761c",
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
							actionLua = "-- Hector Thunder guidance. Geometry from public Ex4Zelenia encounter definitions.\ndata.kaptinZeleniaThunder = data.kaptinZeleniaThunder or {}\nlocal s = data.kaptinZeleniaThunder\nif not s.initialized or s.laneVersion~=2 then\n if s.dot then Argus.deleteTimedShape(s.dot); s.dot=nil end\n if s.initialized then s.rotation=nil end\n s.initialized,s.laneVersion = true,2\n s.mode,s.expires,s.lastGoal,s.lastAt = nil,nil,nil,nil\n s.casts, s.rotators, s.nodes, s.tiles = {}, {}, {}, {}\n s.rotatorAliases,s.rotatorAliasCount = {},0\n s.pending, s.frames, s.costs = {}, {}, {}\n s.drawer = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.15,1,0.2,0.9))\n function s.clearDot(st)\n  if st.dot then Argus.deleteTimedShape(st.dot); st.dot = nil end\n end\n function s.clearRotators(st)\n  for k in pairs(st.rotators) do st.rotators[k]=nil end\n  for k in pairs(st.rotatorAliases) do st.rotatorAliases[k]=nil end\n  st.rotatorAliasCount=0\n end\n function s.registerRotator(st,entityID,p,at)\n  local c=st.rotatorAliases[entityID]\n  if c then\n   if c.hits~=0 then return false end\n  else\n   if #st.rotators>=3 then return false end\n   c={}\n   st.rotators[#st.rotators+1]=c\n   st.rotatorAliases[entityID]=c\n   st.rotatorAliasCount=st.rotatorAliasCount+1\n  end\n  c.x,c.z,c.y,c.a,c.at,c.hits=p.x,p.z,p.y,p.h,at,0\n  return true\n end\n function s.laneMatches(st,c,id,a,now)\n  if not c or c.hits>=15 or math.abs(now-c.at)>500 then return false end\n  if (id==43199 and c.hits~=0) or (id==43064 and c.hits==0) then return false end\n  if c.hits>0 and not st.rotation then return false end\n  local expected=c.a+(c.hits>0 and st.rotation or 0)\n  local delta=(a-expected+math.pi)%(2*math.pi)-math.pi\n  return math.abs(delta)<=math.pi/180\n end\n function s.recordRotator(st,entityID,id,a,now)\n  if st.mode~=\"rotate\" then return false end\n  local c=st.rotatorAliases[entityID]\n  if not st.laneMatches(st,c,id,a,now) then\n   c=nil\n   for _,candidate in ipairs(st.rotators) do\n    if st.laneMatches(st,candidate,id,a,now) then\n     if c then return false end\n     c=candidate\n    end\n   end\n  end\n  if not c then return false end\n  if not st.rotatorAliases[entityID] then\n   if st.rotatorAliasCount>=6 then return false end\n   st.rotatorAliasCount=st.rotatorAliasCount+1\n  end\n  st.rotatorAliases[entityID]=c\n  c.a,c.hits,c.at=a,c.hits+1,now+1000\n  st.dirty=true\n  return true\n end\n function s.reset(st, bloom)\n  st.clearDot(st)\n  for k in pairs(st.casts) do st.casts[k] = nil end\n  st.clearRotators(st)\n  st.mode, st.expires, st.rotation, st.lastGoal, st.stageAt = nil, nil, nil, nil, nil\n  st.bloom, st.hadImpact, st.firstRadial = bloom, false, nil\n  st.dirty, st.floorVersion = true, nil\n end\n function s.shape(h, x, z, a, lo, hi, half, kind)\n  h.x,h.z,h.lo,h.hi,h.kind = x,z,lo,hi,kind\n  h.sx,h.sz,h.cs = math.sin(a),math.cos(a),math.cos(half)\n  h.ex1,h.ez1 = math.sin(a-half),math.cos(a-half)\n  h.ex2,h.ez2 = math.sin(a+half),math.cos(a+half)\n end\n function s.distance2(x,z,h)\n  x,z = x-h.x,z-h.z\n  local f = x*h.sx+z*h.sz\n  if h.kind == \"rect\" then\n   local side = math.max(math.abs(x*h.sz-z*h.sx)-4,0)\n   local along = math.max(-f,f-40,0)\n   return side*side+along*along\n  end\n  local r = math.sqrt(x*x+z*z)\n  if f >= r*h.cs-0.000000001 then\n   local d = math.max(h.lo-r,r-h.hi,0)\n   return d*d\n  end\n  local t1 = math.max(h.lo,math.min(h.hi,x*h.ex1+z*h.ez1))\n  local t2 = math.max(h.lo,math.min(h.hi,x*h.ex2+z*h.ez2))\n  local x1,z1 = x-t1*h.ex1,z-t1*h.ez1\n  local x2,z2 = x-t2*h.ex2,z-t2*h.ez2\n  return math.min(x1*x1+z1*z1,x2*x2+z2*z2)\n end\n for tile=0,15 do\n  local h = {}\n  s.shape(h,100,100,math.rad(157.5-45*(tile%8)),tile<8 and 0 or 8,tile<8 and 8 or 16,math.pi/8)\n  s.tiles[tile] = h\n  local radius = tile<8 and 6.7 or 9.3\n  for offset=-15,15,5 do\n   local a = math.rad(157.5-45*(tile%8)+offset)\n   s.nodes[#s.nodes+1] = {x=100+radius*math.sin(a),z=100+radius*math.cos(a),tile=tile,edges={}}\n  end\n end\n for stage=1,15 do\n  s.frames[stage] = {count=0,hazards={}}\n  s.costs[stage] = {}\n  for h=1,12 do s.frames[stage].hazards[h] = {} end\n end\n function s.floorClear(st,floor,x,z,margin)\n  local dx,dz = x-100,z-100\n  local radius = math.sqrt(dx*dx+dz*dz)\n  if radius<2+margin or radius>16-margin then return false end\n  local m2=margin*margin\n  for tile=0,15 do\n   if floor.red[tile] and st.distance2(x,z,st.tiles[tile])<m2 then return false end\n  end\n  return true\n end\n function s.edgeClear(st,floor,a,b)\n  local dx,dz = b.x-a.x,b.z-a.z\n  local count=math.max(1,math.ceil(math.sqrt(dx*dx+dz*dz)/0.5))\n  for k=0,count do\n   local t=k/count\n   if not st.floorClear(st,floor,a.x+t*dx,a.z+t*dz,0.4) then return false end\n  end\n  return true\n end\n function s.rebuildFloor(st,floor)\n  for _,n in ipairs(st.nodes) do\n   n.allowed = not floor.red[n.tile] and st.floorClear(st,floor,n.x,n.z,0.6)\n   for k=#n.edges,1,-1 do n.edges[k]=nil end\n  end\n  for i,a in ipairs(st.nodes) do\n   if a.allowed then\n    for j,b in ipairs(st.nodes) do\n     if b.allowed then\n      local dx,dz=b.x-a.x,b.z-a.z\n      local d2=dx*dx+dz*dz\n      if d2<=36 and st.edgeClear(st,floor,a,b) then\n       a.edges[#a.edges+1]={index=j,d2=d2}\n      end\n     end\n    end\n   end\n  end\n  st.floorVersion=floor.version\n end\n function s.pendingLess(a,b) return a.at<b.at end\n function s.buildFrames(st,now)\n  for i=1,15 do st.frames[i].count=0 end\n  if st.mode==\"rotate\" then\n   if not st.rotation then return 0 end\n   local n,hits,first=0,nil,math.huge\n   local last=0\n   for _,c in ipairs(st.rotators) do\n    n=n+1\n    if hits and hits~=c.hits then return 0 end\n    hits=c.hits\n    first=math.min(first,c.at); last=math.max(last,c.at)\n   end\n   if n~=3 or not hits or hits>=15 or last-first>250 or now>first+250 then return 0 end\n   for stage=1,15-hits do\n    local frame=st.frames[stage]\n    frame.at=first+(stage-1)*1000\n    for _,c in ipairs(st.rotators) do\n     frame.count=frame.count+1\n     st.shape(frame.hazards[frame.count],c.x,c.z,c.a+st.rotation*(stage-1+(hits>0 and 1 or 0)),0,24,math.pi/8)\n    end\n   end\n   return 15-hits\n  end\n  for k=#st.pending,1,-1 do st.pending[k]=nil end\n  local slash=0\n  for _,c in pairs(st.casts) do\n   if not c.done then\n    if now>c.at+250 then return 0 end\n    st.pending[#st.pending+1]=c\n    if c.id==43216 then slash=slash+1 end\n   end\n  end\n  if slash==0 or not st.firstRadial or #st.pending>12 then return 0 end\n  table.sort(st.pending,st.pendingLess)\n  local count=0\n  for _,c in ipairs(st.pending) do\n   if count==0 or c.at-st.frames[count].at>250 then\n    count=count+1\n    st.frames[count].at=c.at\n   end\n   local f=st.frames[count]\n   f.count=f.count+1\n   st.shape(f.hazards[f.count],c.x,c.z,c.a,c.id==43451 and 8 or 0,c.id==43450 and 8 or 24,c.id==43216 and math.pi/6 or math.pi,c.id==43210 and \"rect\" or nil)\n  end\n  return count\n end\n function s.stageSafe(st,node,frame)\n  if not node.allowed then return false end\n  for h=1,frame.count do\n   if st.distance2(node.x,node.z,frame.hazards[h])<0.36 then return false end\n  end\n  return true\n end\n function s.solve(st,floor,count,player)\n  if st.floorVersion~=floor.version then st.rebuildFloor(st,floor) end\n  -- Backward feasibility prevents the rotating cones trapping guidance in a short safe pocket.\n  for stage=count,1,-1 do\n   local frame,cost=st.frames[stage],st.costs[stage]\n   local budget=stage<count and math.min(6,math.max(0,(st.frames[stage+1].at-frame.at)/1000*4)) or 0\n   for i,node in ipairs(st.nodes) do\n    local best=math.huge\n    if st.stageSafe(st,node,frame) then\n     if stage==count then best=0\n     else\n      for _,edge in ipairs(node.edges) do\n       if edge.d2<=budget*budget then\n        local candidate=st.costs[stage+1][edge.index]+edge.d2\n        if candidate<best then best=candidate end\n       end\n      end\n     end\n    end\n    cost[i]=best\n   end\n  end\n  local targetTile,anchorX,anchorZ\n  if st.mode==\"slash\" and st.bloom==43540 and not st.hadImpact then\n   local offset=st.firstRadial==43450 and 8 or 0\n   for j=0,7 do\n    if (j==1 or j==2 or j==5 or j==6) and not floor.red[j+offset] then\n     local previous=(j+7)%8\n     local following=(j+1)%8\n     local prevSafe=(previous==1 or previous==2 or previous==5 or previous==6) and not floor.red[previous+offset]\n     local nextSafe=(following==1 or following==2 or following==5 or following==6) and not floor.red[following+offset]\n     if not prevSafe and not nextSafe then\n      if targetTile then return nil end\n      targetTile=j+offset\n     end\n    end\n   end\n   if not targetTile then return nil end\n   local j=targetTile%8\n   local a=math.rad(157.5-45*j+(j<4 and 15 or -15))\n   local r=targetTile<8 and 6.7 or 9.3\n   anchorX,anchorZ=100+r*math.sin(a),100+r*math.cos(a)\n  elseif st.lastGoal then\n   anchorX,anchorZ=st.lastGoal.x,st.lastGoal.z\n  else\n   anchorX,anchorZ=player.x,player.z\n  end\n  local winner,best=nil,math.huge\n  for i,n in ipairs(st.nodes) do\n   local reachable=true\n   if st.lastGoal and st.lastAt and st.frames[1].at>st.lastAt+250 then\n    local move=math.min(6,4*(st.frames[1].at-st.lastAt)/1000)\n    local mx,mz=n.x-st.lastGoal.x,n.z-st.lastGoal.z\n    reachable=mx*mx+mz*mz<=move*move and st.edgeClear(st,floor,st.lastGoal,n)\n   end\n   if reachable and st.costs[1][i]<math.huge and (not targetTile or n.tile==targetTile) then\n    local dx,dz=n.x-anchorX,n.z-anchorZ\n    local px,pz=n.x-player.x,n.z-player.z\n    local value=dx*dx+dz*dz+0.03*(px*px+pz*pz)+0.08*st.costs[1][i]\n    if value<best then best,winner=value,n end\n   end\n  end\n  return winner\n end\nend\n\n-- Hector's two Thunder II patterns each have a three-tile inner corridor.\n-- These are conservative allowed regions, not inferred complete floor masks.\nif not s.knownFloors then\n s.knownFloors={cw={red={},ready=true,version=-101,conservative=true},ccw={red={},ready=true,version=-102,conservative=true}}\n for tile=0,15 do\n  s.knownFloors.cw.red[tile]=not (tile>=2 and tile<=4)\n  s.knownFloors.ccw.red[tile]=not (tile>=5 and tile<=7)\n end\n function s.knownFloor(st,observed)\n  local floor\n  if st.mode==\"rotate\" and st.bloom==43193 and #st.rotators==3 and st.rotation then\n   local clockwise=st.rotation<0\n   local base=math.rad(clockwise and 37.5 or -7.5)\n   local mask=0\n   for _,c in ipairs(st.rotators) do\n    local initial=c.a-st.rotation*math.max(0,c.hits-1)\n    local index\n    for lane=0,2 do\n     local delta=(initial-base-lane*2*math.pi/3+math.pi)%(2*math.pi)-math.pi\n     if math.abs(delta)<=math.pi/180 then index=lane end\n    end\n    if index==nil then return nil end\n    local bit=2^index\n    if math.floor(mask/bit)%2==1 then return nil end\n    mask=mask+bit\n   end\n   if mask~=7 then return nil end\n   floor=clockwise and st.knownFloors.cw or st.knownFloors.ccw\n\n  end\n  if floor and observed then\n   for tile=0,15 do\n    if not floor.red[tile] and observed.red[tile] then return nil end\n   end\n  end\n  return floor\n end\nend\n\nlocal id,now = eventArgs.spellID,Now()\nif id==43193 or id==43540 or id==43541 or id==43542 or id==43543 or id==43544 then\n s.reset(s,id)\n if id==43540 then\n  -- Stage only if observed floor data confirms WNW; Slash reveals its radial order later.\n  s.mode,s.stageAt,s.expires=\"slashStage\",now+eventArgs.channelTimeMax*1000+1300,now+10000\n end\nelseif id==43235 then\n s.clearDot(s); s.mode=nil\nelseif id==43198 then\n s.clearDot(s)\n s.clearRotators(s)\n s.mode,s.expires,s.lastGoal,s.lastAt=\"rotate\",now+26000,nil,nil\n s.dirty=true\nelseif id==43448 or id==43449 then\n s.clearDot(s)\n for k,c in pairs(s.casts) do if c.id~=43210 or c.done then s.casts[k]=nil end end\n s.mode,s.expires,s.lastGoal,s.lastAt=\"slash\",now+18000,nil,nil\n s.firstRadial,s.hadImpact=nil,false\n s.dirty=true\nelseif id==43199 or id==43216 or id==43450 or id==43451 or id==43210 then\n local entity=TensorCore.mGetEntity(eventArgs.entityID)\n if entity and entity.pos and eventArgs.channelTimeMax>0 then\n  local p=entity.pos\n  if id==43199 and s.mode==\"rotate\" then\n   s.registerRotator(s,eventArgs.entityID,p,now+eventArgs.channelTimeMax*1000)\n  elseif id~=43199 then\n   s.casts[eventArgs.entityID]={id=id,x=p.x,z=p.z,y=p.y,a=p.h,at=now+eventArgs.channelTimeMax*1000,done=false}\n   if id==43450 or id==43451 then s.firstRadial=s.firstRadial or id end\n  end\n  s.dirty=true\n end\nend\ns.lastEvent=now\nself.used=true",
							conditions = 
							{
								
								{
									"914a655e-3c9b-c6fc-9f29-f5a8ecb92b11",
									true,
								},
							},
							name = "Thunder guidance - casts",
							uuid = "755f17f4-ae70-761c-8a51-9c4f1dd720b1",
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
							name = "Thunder events",
							spellIDList = 
							{
								43193,
								43540,
								43541,
								43542,
								43543,
								43544,
								43235,
								43198,
								43448,
								43449,
								43199,
								43216,
								43450,
								43451,
								43210,
							},
							uuid = "914a655e-3c9b-c6fc-9f29-f5a8ecb92b11",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin/Hector Thunder",
				eventType = 3,
				loop = true,
				mechanicTime = 11.4,
				name = "Thunder guidance - casts",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "b995c5f8-1fc4-2b47-9a5c-13d34968df95",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "data.kaptinZeleniaThunder=data.kaptinZeleniaThunder or {}\nlocal s=data.kaptinZeleniaThunder\ns.rotation=eventArgs.markerID==167 and -math.pi/18 or math.pi/18\ns.dirty=true\ns.lastEvent=Now()\nself.used=true",
							conditions = 
							{
								
								{
									"a83fe4b6-73ed-156d-a5a1-6a5e7ab46f9a",
									true,
								},
							},
							name = "Thunder II - rotation",
							uuid = "c8a24b07-4972-c9b3-b3a4-8d4a9bea1e53",
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
								167,
								168,
							},
							name = "Thunder events",
							uuid = "a83fe4b6-73ed-156d-a5a1-6a5e7ab46f9a",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin/Hector Thunder",
				eventType = 4,
				loop = true,
				mechanicTime = 11.4,
				name = "Thunder II - rotation",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "ea55647f-99d5-24a9-a77c-aecf798322fd",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s=data.kaptinZeleniaThunder\nif s and s.initialized and s.laneVersion==2 then\n local id,now=eventArgs.spellID,Now()\n if id==43199 or id==43064 then\n  s.recordRotator(s,eventArgs.entityID,id,eventArgs.heading,now)\n else\n  local c=s.casts[eventArgs.entityID]\n  if c and c.id==id then\n   c.done=true\n   s.dirty=true\n   if id==43216 or id==43450 or id==43451 then s.hadImpact=true end\n  end\n end\n s.lastEvent=now\nend\nself.used=true",
							conditions = 
							{
								
								{
									"a3237fa4-a76a-9c51-932f-abfb33ff4253",
									true,
								},
							},
							name = "Thunder guidance - impacts",
							uuid = "6bab0774-5aa2-516f-a699-a96b8f9e5f53",
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
							name = "Thunder events",
							spellIDList = 
							{
								43199,
								43064,
								43216,
								43450,
								43451,
								43210,
							},
							uuid = "a3237fa4-a76a-9c51-932f-abfb33ff4253",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin/Hector Thunder",
				eventType = 2,
				loop = true,
				mechanicTime = 11.4,
				name = "Thunder guidance - impacts",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -11.4,
				uuid = "472621ad-16c8-6aea-b64c-4043b74d4c14",
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
				displayPath = "Kaptin/Hector Thunder",
				eventType = 9,
				execute = "local old=eventArgs.oldData and eventArgs.oldData.kaptinZeleniaThunder\nif old and old.dot then Argus.deleteTimedShape(old.dot) end\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 11.4,
				name = "Thunder guidance - wipe cleanup",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 638.6,
				timerStartOffset = -12,
				uuid = "e91f9aa6-cafb-96ef-bb7d-5195a291c786",
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
				name = "Kaptin Draws",
				uuid = "d0aabda7-2924-ed3d-b077-71f7a8c189ab",
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
				displayPath = "Kaptin Draws",
				eventType = 12,
				execute = "local s = data.kaptinZeleniaBaits\nif not s or not s.active or s.wave > #s.orders or not s.showAt then self.used = true; return end\nlocal now = Now()\nif now < s.showAt or now < (s.nextUpdate or 0) then self.used = true; return end\ns.nextUpdate = now + 100\nlocal boss = TensorCore.mGetEntity(s.boss)\nif not boss or now > s.endAt then\n    for id, uuid in pairs(s.draws) do Argus.deleteTimedShape(uuid); s.draws[id] = nil end\n    s.active = false\n    self.used = true\n    return\nend\nlocal alive = 0\nfor i = 1, #s.players do\n    local entry = s.players[i]\n    local entity = TensorCore.mGetEntity(entry.id)\n    if entity and entity.alive then\n        local dx, dz = entity.pos.x - boss.pos.x, entity.pos.z - boss.pos.z\n        entry.distance = dx * dx + dz * dz\n        alive = alive + 1\n    else entry.distance = math.huge end\nend\ntable.sort(s.players, s.sortDistance)\nfor id in pairs(s.selected) do s.selected[id] = nil end\nlocal near = s.orders[s.wave]\nlocal drawer = near and s.nearDrawer or s.farDrawer\nlocal duration = s.endAt - now\nfor i = 1, math.min(4, alive) do\n    local entry = s.players[near and i or alive - i + 1]\n    local entity = TensorCore.mGetEntity(entry.id)\n    if entity then\n        s.selected[entry.id] = true\n        local heading = TensorCore.getHeadingToTarget(boss.pos, entity.pos)\n        local uuid = s.draws[entry.id]\n        local updated = uuid and drawer:updateTimedConeOnEnt(uuid, nil, s.boss, 24, math.pi/4, nil, 0, false, false, heading, true)\n        if not updated then\n            s.draws[entry.id] = drawer:addTimedConeOnEnt(duration, s.boss, 24, math.pi/4, nil, 0, false, false, heading, true)\n        end\n    end\nend\nfor id, uuid in pairs(s.draws) do\n    if not s.selected[id] then Argus.deleteTimedShape(uuid); s.draws[id] = nil end\nend\nself.used = true",
				executeType = 2,
				loop = true,
				mechanicTime = 65.1,
				name = "Escelons 1 - Live bait cones",
				timeRange = true,
				timelineIndex = 9,
				timerEndOffset = 12,
				timerStartOffset = -5,
				uuid = "d2f26481-3a69-2d36-a0a9-4f3c72de443a",
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
				name = "Kaptin",
				uuid = "3f1f17ff-dabf-012d-8572-fa01741f2dc0",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "Kaptin",
				name = "Hector Thunder",
				uuid = "501665f5-ddd0-bcd3-becf-4410885c9ef6",
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
				displayPath = "Kaptin/Hector Thunder",
				eventType = 12,
				execute = "local s=data.kaptinZeleniaThunder\nif not s or not s.initialized or not s.mode then self.used=true; return end\nlocal now=Now()\n-- Bypass the queued updater; retain a 100 ms cap inside the narrow mechanic window.\nif s.dotUpdateAt and now>=s.dotUpdateAt and now-s.dotUpdateAt<100 then self.used=true; return end\ns.dotUpdateAt=now\nlocal floor=data.kaptinZeleniaFloor\n-- Thunder Slash requires the observed floor; a fixed mask can point into rose runes.\nif (not floor or not floor.ready) and s.mode==\"rotate\" and s.knownFloor then floor=s.knownFloor(s,floor) end\nif not s.expires or now>s.expires or not floor or not floor.ready then\n s.clearDot(s)\n self.used=true\n return\nend\nif s.lastEvent and now-s.lastEvent<120 then self.used=true; return end\n-- Rebuild only after a mechanic event or changed floor. A stale cast never advances itself.\nif not s.dirty and s.floorVersion==floor.version then\n if s.nextImpact and now>s.nextImpact+250 then s.clearDot(s) end\n self.used=true\n return\nend\nlocal count=s.buildFrames(s,now)\nif count==0 then s.clearDot(s); self.used=true; return end\nlocal player=TensorCore.mGetPlayer()\nif not player or not player.pos then s.clearDot(s); self.used=true; return end\nlocal goal=s.solve(s,floor,count,player.pos)\ns.guidanceLimited=false\ns.dirty=false\ns.nextImpact=s.frames[1].at\nif not goal then s.clearDot(s); self.used=true; return end\nif s.dot then\n local ok=s.drawer:updateTimedCircle(s.dot,nil,goal.x,player.pos.y,goal.z,0.35,0,false,true)\n if not ok then s.dot=nil end\nend\nif not s.dot then\n s.dot=s.drawer:addTimedCircle(math.max(1,math.floor(s.expires-now)),goal.x,player.pos.y,goal.z,0.35,0,false,true)\nend\ns.lastGoal,s.lastAt=goal,s.frames[1].at\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 179.1,
				name = "Thunder II - green dot",
				timeRange = true,
				timelineIndex = 27,
				timerEndOffset = 20,
				timerStartOffset = -10,
				uuid = "c18d0716-a62e-bab0-ae40-60c95797303f",
				version = 2,
			},
		},
	},
	[34] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin",
				uuid = "586df106-03bf-dcc9-977a-1e87c33c9c5c",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "Kaptin",
				name = "Hector Thunder",
				uuid = "68bb3302-77cb-9573-8a2f-80422c64429a",
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
				displayPath = "Kaptin/Hector Thunder",
				eventType = 12,
				execute = "local s=data.kaptinZeleniaThunder\nif not s or not s.initialized or not s.mode then self.used=true; return end\nlocal now=Now()\n-- Bypass the queued updater; retain a 100 ms cap inside the narrow mechanic window.\nif s.dotUpdateAt and now>=s.dotUpdateAt and now-s.dotUpdateAt<100 then self.used=true; return end\ns.dotUpdateAt=now\nlocal floor=data.kaptinZeleniaFloor\n-- Thunder Slash requires the observed floor; a fixed mask can point into rose runes.\nif (not floor or not floor.ready) and s.mode==\"rotate\" and s.knownFloor then floor=s.knownFloor(s,floor) end\nif not s.expires or now>s.expires or not floor or not floor.ready then\n s.clearDot(s)\n self.used=true\n return\nend\nif s.mode==\"slashStage\" then\n if not s.stageAt or now<s.stageAt then self.used=true; return end\n local a=math.rad(-112.5)\n local x,z=100+6.7*math.sin(a),100+6.7*math.cos(a)\n if not s.floorClear(s,floor,x,z,0.6) then s.clearDot(s); self.used=true; return end\n if not s.dot then\n  local player=TensorCore.mGetPlayer()\n  if player and player.pos then\n   s.dot=s.drawer:addTimedCircle(math.max(1,math.floor(s.expires-now)),x,player.pos.y,z,0.35,0,false,true)\n  end\n end\n self.used=true\n return\nend\nif s.lastEvent and now-s.lastEvent<120 then self.used=true; return end\n-- Rebuild only after a mechanic event or changed floor. A stale cast never advances itself.\nif not s.dirty and s.floorVersion==floor.version then\n if s.nextImpact and now>s.nextImpact+250 then s.clearDot(s) end\n self.used=true\n return\nend\nlocal count=s.buildFrames(s,now)\nif count==0 then s.clearDot(s); self.used=true; return end\nlocal player=TensorCore.mGetPlayer()\nif not player or not player.pos then s.clearDot(s); self.used=true; return end\nlocal goal=s.solve(s,floor,count,player.pos)\ns.guidanceLimited=false\ns.dirty=false\ns.nextImpact=s.frames[1].at\nif not goal then s.clearDot(s); self.used=true; return end\nif s.dot then\n local ok=s.drawer:updateTimedCircle(s.dot,nil,goal.x,player.pos.y,goal.z,0.35,0,false,true)\n if not ok then s.dot=nil end\nend\nif not s.dot then\n s.dot=s.drawer:addTimedCircle(math.max(1,math.floor(s.expires-now)),goal.x,player.pos.y,goal.z,0.35,0,false,true)\nend\ns.lastGoal,s.lastAt=goal,s.frames[1].at\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 227.2,
				name = "Thunder Slash - green dot",
				timeRange = true,
				timelineIndex = 34,
				timerEndOffset = 10,
				timerStartOffset = -10,
				uuid = "405a5f84-2812-9798-8150-8da9d5958287",
				version = 2,
			},
		},
	},
	[44] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin Draws",
				uuid = "4fe5f418-323f-342f-b3c6-32483ad6eb79",
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
							actionLua = "local s = data.kaptinZeleniaRoses\nlocal f = data.kaptinZeleniaFloor\nlocal role = KaptinZeleniaConfig.role\nlocal pair = s.pair[role]\nif not pair then self.used=true; return end\ns.anchorTile = s.anchorTile or s.anchor(f)\nif s.anchorTile == nil then s.clearGuide(s); self.used=true; return end\nlocal p = TensorCore.mGetPlayer()\nif s.markers[p.id] == 592 then\n    if not s.roseDropped then\n        local offset = pair == 1 and 0 or pair == 2 and 3 or pair == 3 and 4 or 5\n        local tile = (s.anchorTile + offset) % 8\n        if not f.red[tile] then\n            local x,z = s.tilePosition(tile,5.5)\n            s.guide(s,\"rose3:\"..role..\":\"..tile,x,z,7000,false)\n        else s.clearGuide(s) end\n    end\nelse\n    local tile = (s.anchorTile + 2*(pair-1)) % 8\n    local tower = s.towers[tile]\n    if tower and f.red[tile+8] then\n        local duration = tower.endAt - Now()\n        if duration > 0 then s.guide(s,\"tower3:\"..role..\":\"..tile,tower.x,tower.z,duration,false)\n        else s.clearGuide(s) end\n    end\nend\nself.used = true",
							conditions = 
							{
								
								{
									"f156b28b-bccc-5152-87c0-cc74f33170e8",
									true,
								},
							},
							name = "Show assigned rose or tower",
							uuid = "cf713254-e968-cbe2-9d31-840d4cf22bcc",
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
							conditionLua = "local s,f = data.kaptinZeleniaRoses,data.kaptinZeleniaFloor\nreturn s ~= nil and s.stage == 3 and f ~= nil and f.ready == true and s.markerReadyAt ~= nil and Now() >= s.markerReadyAt and KaptinZeleniaConfig ~= nil and KaptinZeleniaConfig.role ~= nil",
							name = "Floor + assignment ready",
							uuid = "f156b28b-bccc-5152-87c0-cc74f33170e8",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				loop = true,
				mechanicTime = 251.6,
				name = "Roseblood 3 - My rose / tower",
				throttleTime = 200,
				timeRange = true,
				timelineIndex = 44,
				timerEndOffset = 29,
				timerStartOffset = 12.5,
				uuid = "3e70986a-1768-27b8-9865-bdc742bcc626",
				version = 2,
			},
		},
	},
	[58] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin Draws",
				uuid = "48f2b058-399e-1e6c-808b-c1ae3fe55c3f",
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
				displayPath = "Kaptin Draws",
				eventType = 12,
				execute = "local s = data.kaptinZeleniaBaits\nif not s or not s.active or s.wave > #s.orders or not s.showAt then self.used = true; return end\nlocal now = Now()\nif now < s.showAt or now < (s.nextUpdate or 0) then self.used = true; return end\ns.nextUpdate = now + 100\nlocal boss = TensorCore.mGetEntity(s.boss)\nif not boss or now > s.endAt then\n    for id, uuid in pairs(s.draws) do Argus.deleteTimedShape(uuid); s.draws[id] = nil end\n    s.active = false\n    self.used = true\n    return\nend\nlocal alive = 0\nfor i = 1, #s.players do\n    local entry = s.players[i]\n    local entity = TensorCore.mGetEntity(entry.id)\n    if entity and entity.alive then\n        local dx, dz = entity.pos.x - boss.pos.x, entity.pos.z - boss.pos.z\n        entry.distance = dx * dx + dz * dz\n        alive = alive + 1\n    else entry.distance = math.huge end\nend\ntable.sort(s.players, s.sortDistance)\nfor id in pairs(s.selected) do s.selected[id] = nil end\nlocal near = s.orders[s.wave]\nlocal drawer = near and s.nearDrawer or s.farDrawer\nlocal duration = s.endAt - now\nfor i = 1, math.min(4, alive) do\n    local entry = s.players[near and i or alive - i + 1]\n    local entity = TensorCore.mGetEntity(entry.id)\n    if entity then\n        s.selected[entry.id] = true\n        local heading = TensorCore.getHeadingToTarget(boss.pos, entity.pos)\n        local uuid = s.draws[entry.id]\n        local updated = uuid and drawer:updateTimedConeOnEnt(uuid, nil, s.boss, 24, math.pi/4, nil, 0, false, false, heading, true)\n        if not updated then\n            s.draws[entry.id] = drawer:addTimedConeOnEnt(duration, s.boss, 24, math.pi/4, nil, 0, false, false, heading, true)\n        end\n    end\nend\nfor id, uuid in pairs(s.draws) do\n    if not s.selected[id] then Argus.deleteTimedShape(uuid); s.draws[id] = nil end\nend\nself.used = true",
				executeType = 2,
				loop = true,
				mechanicTime = 320.7,
				name = "Escelons 2 - Live bait cones",
				timeRange = true,
				timelineIndex = 58,
				timerEndOffset = 12,
				timerStartOffset = -5,
				uuid = "79b673f0-201b-b428-8a5c-a0afbd7e7c66",
				version = 2,
			},
		},
	},
	[64] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin Draws",
				uuid = "6002d0e5-d9ad-7c2c-9116-c0971ea1eb49",
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
							actionLua = "local s,f = data.kaptinZeleniaRoses,data.kaptinZeleniaFloor\nif s.thornsActive then self.used=true; return end\nlocal p = TensorCore.mGetPlayer()\nlocal role = KaptinZeleniaConfig.role\nlocal marker = s.markers[p.id]\nlocal west = role == \"MT\" or role == \"H1\" or role == \"M1\" or role == \"R1\"\nlocal inner = role == \"MT\" or role == \"OT\" or role == \"M1\" or role == \"M2\"\nlocal sumZ,count,endAt = 0,0,math.huge\nfor _,ground in pairs(s.ground) do\n    sumZ,count = sumZ + ground.z - 100,count + 1\n    endAt = math.min(endAt,ground.endAt)\nend\nif count ~= 2 or math.abs(sumZ) < 4 or endAt <= Now() then\n    s.clearGuide(s); self.used=true; return\nend\nlocal groundSouth = sumZ > 0\ns.groundSouth = groundSouth\nlocal x,z,key\nif marker == 592 and not s.roseDropped then\n    local tile = groundSouth and (west and 7 or 0) or (west and 4 or 3)\n    if not inner then tile = tile + 8 end\n    if not f or not f.ready or not f.red[tile] then\n        x,z = s.tilePosition(tile,inner and 5.5 or 12)\n        key = \"rose4:\"..role..\":\"..tile\n    end\nelseif marker == 596 then\n    -- Spread on the ground-circle side, away from all four rose-drop tiles.\n    local sign = groundSouth and 1 or -1\n    x = 100 + (west and -1 or 1) * (inner and 2.5 or 10.5)\n    z = 100 + sign * (inner and 8.7 or 6.5)\n    local clear = true\n    for _,ground in pairs(s.ground) do\n        local dx,dz = x-ground.x,z-ground.z\n        if dx*dx+dz*dz < 20.25 then clear=false end\n    end\n    if clear then key = \"spread4:\"..role..\":\"..sign else x,z=nil,nil end\nend\nif key then s.guide(s,key,x,z,endAt-Now(),false) else s.clearGuide(s) end\nself.used = true",
							conditions = 
							{
								
								{
									"48ae7e5e-88b2-837a-b998-5882ae90fa7f",
									true,
								},
							},
							name = "Show rose or pointblank placement",
							uuid = "d951d491-0718-fa0b-94e2-27b1b31e2fb8",
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
							conditionLua = "local s,f = data.kaptinZeleniaRoses,data.kaptinZeleniaFloor\nreturn s ~= nil and s.stage == 4 and s.markerReadyAt ~= nil and Now() >= s.markerReadyAt and KaptinZeleniaConfig ~= nil and KaptinZeleniaConfig.role ~= nil",
							name = "Assignments ready",
							uuid = "48ae7e5e-88b2-837a-b998-5882ae90fa7f",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				loop = true,
				mechanicTime = 351.1,
				name = "Roseblood 4 - My placement",
				throttleTime = 200,
				timeRange = true,
				timelineIndex = 64,
				timerEndOffset = 16,
				timerStartOffset = 7,
				uuid = "6b867649-a26e-6485-83db-f98382438f3a",
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
				name = "Kaptin Draws",
				uuid = "83dda0df-9deb-e9b1-85d7-b66e44bc7b7b",
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
							actionLua = "local s = data.kaptinZeleniaRoses\nif s.thornsMove then self.used=true; return end\nif s.groundSouth == nil then s.clearGuide(s); self.used=true; return end\ns.guide(s,\"thorns:stack\",100,100+(s.groundSouth and 4.5 or -4.5),9000,true)\nself.used = true",
							conditions = 
							{
								
								{
									"a2db0da3-181e-cdab-ad40-c830d648960e",
									true,
								},
							},
							name = "Stack then supports W / DPS E",
							uuid = "6c663d65-4785-26d7-a1e1-cbbbad9a1638",
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
							conditionLua = "local s = data.kaptinZeleniaRoses\nreturn s ~= nil and s.thornsActive == true and s.stage == 4 and KaptinZeleniaConfig ~= nil and KaptinZeleniaConfig.role ~= nil",
							name = "Chain phase + assigned role",
							uuid = "a2db0da3-181e-cdab-ad40-c830d648960e",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin Draws",
				loop = true,
				mechanicTime = 369.8,
				name = "Encircling Thorns - Stack position",
				throttleTime = 200,
				timeRange = true,
				timelineIndex = 69,
				timerEndOffset = 10,
				timerStartOffset = -3.7,
				uuid = "0d0367c6-9062-3277-a2ff-f5e257559360",
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
				name = "Kaptin Draws",
				uuid = "61c44522-1f1b-489a-9e87-1d9f5c9cd322",
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
				displayPath = "Kaptin Draws",
				eventType = 12,
				execute = "local s = data.kaptinZeleniaBaits\nif not s or not s.active or s.wave > #s.orders or not s.showAt then self.used = true; return end\nlocal now = Now()\nif now < s.showAt or now < (s.nextUpdate or 0) then self.used = true; return end\ns.nextUpdate = now + 100\nlocal boss = TensorCore.mGetEntity(s.boss)\nif not boss or now > s.endAt then\n    for id, uuid in pairs(s.draws) do Argus.deleteTimedShape(uuid); s.draws[id] = nil end\n    s.active = false\n    self.used = true\n    return\nend\nlocal alive = 0\nfor i = 1, #s.players do\n    local entry = s.players[i]\n    local entity = TensorCore.mGetEntity(entry.id)\n    if entity and entity.alive then\n        local dx, dz = entity.pos.x - boss.pos.x, entity.pos.z - boss.pos.z\n        entry.distance = dx * dx + dz * dz\n        alive = alive + 1\n    else entry.distance = math.huge end\nend\ntable.sort(s.players, s.sortDistance)\nfor id in pairs(s.selected) do s.selected[id] = nil end\nlocal near = s.orders[s.wave]\nlocal drawer = near and s.nearDrawer or s.farDrawer\nlocal duration = s.endAt - now\nfor i = 1, math.min(4, alive) do\n    local entry = s.players[near and i or alive - i + 1]\n    local entity = TensorCore.mGetEntity(entry.id)\n    if entity then\n        s.selected[entry.id] = true\n        local heading = TensorCore.getHeadingToTarget(boss.pos, entity.pos)\n        local uuid = s.draws[entry.id]\n        local updated = uuid and drawer:updateTimedConeOnEnt(uuid, nil, s.boss, 24, math.pi/4, nil, 0, false, false, heading, true)\n        if not updated then\n            s.draws[entry.id] = drawer:addTimedConeOnEnt(duration, s.boss, 24, math.pi/4, nil, 0, false, false, heading, true)\n        end\n    end\nend\nfor id, uuid in pairs(s.draws) do\n    if not s.selected[id] then Argus.deleteTimedShape(uuid); s.draws[id] = nil end\nend\nself.used = true",
				executeType = 2,
				loop = true,
				mechanicTime = 418.4,
				name = "Escelons 3 - Live bait cones",
				timeRange = true,
				timelineIndex = 77,
				timerEndOffset = 12,
				timerStartOffset = -5,
				uuid = "1bb16f4c-5687-7cea-9b78-fc80af19175f",
				version = 2,
			},
		},
	},
	[88] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin",
				uuid = "02f40762-79f7-d0b7-851e-95b4f63a71ad",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "Kaptin",
				name = "Hector Thunder",
				uuid = "5b389a67-9613-fbc6-9cbd-7fcba3daf114",
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
				displayPath = "Kaptin/Hector Thunder",
				eventType = 12,
				execute = "local s=data.kaptinZeleniaThunder\nif not s or not s.initialized or not s.mode then self.used=true; return end\nlocal now=Now()\n-- Bypass the queued updater; retain a 100 ms cap inside the narrow mechanic window.\nif s.dotUpdateAt and now>=s.dotUpdateAt and now-s.dotUpdateAt<100 then self.used=true; return end\ns.dotUpdateAt=now\nlocal floor=data.kaptinZeleniaFloor\n-- Thunder Slash requires the observed floor; a fixed mask can point into rose runes.\nif (not floor or not floor.ready) and s.mode==\"rotate\" and s.knownFloor then floor=s.knownFloor(s,floor) end\nif not s.expires or now>s.expires or not floor or not floor.ready then\n s.clearDot(s)\n self.used=true\n return\nend\nif s.lastEvent and now-s.lastEvent<120 then self.used=true; return end\n-- Rebuild only after a mechanic event or changed floor. A stale cast never advances itself.\nif not s.dirty and s.floorVersion==floor.version then\n if s.nextImpact and now>s.nextImpact+250 then s.clearDot(s) end\n self.used=true\n return\nend\nlocal count=s.buildFrames(s,now)\nif count==0 then s.clearDot(s); self.used=true; return end\nlocal player=TensorCore.mGetPlayer()\nif not player or not player.pos then s.clearDot(s); self.used=true; return end\nlocal goal=s.solve(s,floor,count,player.pos)\ns.guidanceLimited=false\ns.dirty=false\ns.nextImpact=s.frames[1].at\nif not goal then s.clearDot(s); self.used=true; return end\nif s.dot then\n local ok=s.drawer:updateTimedCircle(s.dot,nil,goal.x,player.pos.y,goal.z,0.35,0,false,true)\n if not ok then s.dot=nil end\nend\nif not s.dot then\n s.dot=s.drawer:addTimedCircle(math.max(1,math.floor(s.expires-now)),goal.x,player.pos.y,goal.z,0.35,0,false,true)\nend\ns.lastGoal,s.lastAt=goal,s.frames[1].at\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 469.2,
				name = "Thunder Slash 2 - green dot",
				timeRange = true,
				timelineIndex = 88,
				timerEndOffset = 10,
				timerStartOffset = -10,
				uuid = "54260b23-3d4d-cd70-9228-59e1ce1ce057",
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
				name = "Kaptin",
				uuid = "fe74d450-9e89-1f1e-bae8-c4a4396bed7d",
			},
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "Kaptin",
				name = "Hector Thunder",
				uuid = "36745417-449c-2041-b895-2d8c74f9411e",
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
				displayPath = "Kaptin/Hector Thunder",
				eventType = 12,
				execute = "local s=data.kaptinZeleniaThunder\nif not s or not s.initialized or not s.mode then self.used=true; return end\nlocal now=Now()\n-- Bypass the queued updater; retain a 100 ms cap inside the narrow mechanic window.\nif s.dotUpdateAt and now>=s.dotUpdateAt and now-s.dotUpdateAt<100 then self.used=true; return end\ns.dotUpdateAt=now\nlocal floor=data.kaptinZeleniaFloor\n-- Thunder Slash requires the observed floor; a fixed mask can point into rose runes.\nif (not floor or not floor.ready) and s.mode==\"rotate\" and s.knownFloor then floor=s.knownFloor(s,floor) end\nif not s.expires or now>s.expires or not floor or not floor.ready then\n s.clearDot(s)\n self.used=true\n return\nend\nif s.lastEvent and now-s.lastEvent<120 then self.used=true; return end\n-- Rebuild only after a mechanic event or changed floor. A stale cast never advances itself.\nif not s.dirty and s.floorVersion==floor.version then\n if s.nextImpact and now>s.nextImpact+250 then s.clearDot(s) end\n self.used=true\n return\nend\nlocal count=s.buildFrames(s,now)\nif count==0 then s.clearDot(s); self.used=true; return end\nlocal player=TensorCore.mGetPlayer()\nif not player or not player.pos then s.clearDot(s); self.used=true; return end\nlocal goal=s.solve(s,floor,count,player.pos)\ns.guidanceLimited=false\ns.dirty=false\ns.nextImpact=s.frames[1].at\nif not goal then s.clearDot(s); self.used=true; return end\nif s.dot then\n local ok=s.drawer:updateTimedCircle(s.dot,nil,goal.x,player.pos.y,goal.z,0.35,0,false,true)\n if not ok then s.dot=nil end\nend\nif not s.dot then\n s.dot=s.drawer:addTimedCircle(math.max(1,math.floor(s.expires-now)),goal.x,player.pos.y,goal.z,0.35,0,false,true)\nend\ns.lastGoal,s.lastAt=goal,s.frames[1].at\nself.used=true",
				executeType = 2,
				loop = true,
				mechanicTime = 542,
				name = "Thunder II repeat - green dot",
				timeRange = true,
				timelineIndex = 112,
				timerEndOffset = 20,
				timerStartOffset = -10,
				uuid = "e316d16e-7aea-467f-a836-97cbd084e124",
				version = 2,
			},
		},
	},
	inheritedProfiles = 
	{
	},
	timelineName = "zelenia-ex",
	version = "1.0.1",
}



return tbl