local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "2241a455-b5e7-21b1-eb70-54630686b3c5",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Core",
				uuid = "21fabf85-398c-b476-8fa0-71ff84545063",
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
							actionLua = "-- Fixed arena arrows: one timed shape per stage, never attached to the player.\nif data.kaptinP8S then self.used = true return end\nlocal s = {draws = {}, version = \"20261011.1\"}\ndata.kaptinP8S = s\nfunction s.now() return Now() end\nfunction s.role()\n    local roster = AnyoneCore and AnyoneCore.Roster\n    if not roster or not roster.current() then return nil end\n    return roster.mySlot()\nend\nfunction s.clear(key)\n    local draw = s.draws[key]\n    if draw and draw.uuid then Argus.deleteTimedShape(draw.uuid) end\n    s.draws[key] = nil\nend\nfunction s.clearAll()\n    for key in pairs(s.draws) do s.clear(key) end\nend\nfunction s.arrow(key, x, z, ms)\n    local old = s.draws[key]\n    local now = s.now()\n    if old and old.x == x and old.z == z and old.untilTime > now then return end\n    s.clear(key)\n    local heading = math.atan2(x - 100, z - 100)\n    local drawer = TensorCore.getCachedDrawer(0xC000FF00, 0xC000FF00, 0xC000FF00, 0xFFFFFFFF, 2)\n    local uuid = drawer:addTimedArrow(ms, x - math.sin(heading) * 7, 0, z - math.cos(heading) * 7, heading, 4, 1, 3, 3)\n    if uuid then s.draws[key] = {uuid = uuid, x = x, z = z, untilTime = now + ms} end\nend\nfunction s.ring(key, entityID, radius, ms, isGreen)\n    local old = s.draws[key]\n    local now = s.now()\n    if old and old.entityID == entityID and old.isGreen == isGreen and old.untilTime > now then return end\n    s.clear(key)\n    local color = isGreen and 0x7000FF00 or 0x700000FF\n    local outline = isGreen and 0xFF00FF00 or 0xFF0000FF\n    local drawer = TensorCore.getCachedDrawer(color, color, color, outline, 2)\n    -- Small target identification ring, deliberately not a damage-radius preview.\n    local uuid = drawer:addTimedCircleOnEnt(ms, entityID, radius, nil, nil, true)\n    if uuid then s.draws[key] = {uuid = uuid, entityID = entityID, isGreen = isGreen, untilTime = now + ms} end\nend\n\n-- Event-only P8S Beast 1 guidance, using Kobe's demonstrated NW/centre bait.\n-- The owning GUI reactions filter the exact channel/cast IDs before calling\n-- these methods. Times come from s.now() in milliseconds, not timeline jumps.\nlocal s = data.kaptinP8S\nlocal centaurKey = \"centaur\"\nlocal spread = {\n    T1 = {100, 90}, T2 = {110, 100},\n    H1 = {90, 100}, H2 = {100, 110},\n    M1 = {93, 107}, M2 = {107, 107},\n    R1 = {93, 93}, R2 = {107, 93}\n}\n\nlocal function centaurPoint(c, x, z, duration)\n    if c.arrowX == x and c.arrowZ == z then return end\n    c.arrowX, c.arrowZ = x, z\n    s.arrow(centaurKey, x, z, duration)\nend\n\nlocal function centaurRoute(c)\n    local n = c.order[c.playerID]\n    local pair = n and c.waves[n]\n    -- A solo hit, third target, or missing local assignment is not enough\n    -- evidence to nominate a safe pair. Never fill gaps from roster priority.\n    if not pair or pair.count ~= 2 then\n        c.arrowX, c.arrowZ = nil, nil\n        s.clear(centaurKey)\n        return\n    end\n    local nextJump = c.hits + 1\n    if n == nextJump or n == nextJump + 1 then\n        if n % 2 == 1 then\n            centaurPoint(c, 90, 90, 18000)\n        else\n            centaurPoint(c, 100, 100, 18000)\n        end\n    else\n        centaurPoint(c, 100, 90, 18000)\n    end\nend\n\nfunction s.centaurClear()\n    s.clear(centaurKey)\n    s.centaur = nil\nend\n\nfunction s.centaurStart(e)\n    local now = s.now()\n    local previous = s.centaur\n    -- A duplicated channel notification must not erase collected assignments.\n    if previous and now - previous.started <= 1000 then return end\n    s.centaurClear()\n    local player = TensorCore.mGetPlayer()\n    if not player then return end\n    local c = {\n        started = now, playerID = player.id, phase = \"uplift\",\n        waves = {}, order = {}, wave = 0, hits = 0\n    }\n    s.centaur = c\n    local p = spread[s.role()]\n    if p then centaurPoint(c, p[1], p[2], 18000) end\nend\n\nfunction s.uplift(e)\n    local c = s.centaur\n    if not c or c.phase ~= \"uplift\" then return end\n    local now = s.now()\n    if now < c.started or now - c.started > 20000 then\n        s.centaurClear()\n        return\n    end\n    if not c.waveAt or now - c.waveAt > 1000 then\n        if c.wave == 4 then return end\n        c.wave = c.wave + 1\n        c.waveAt = now\n        c.waves[c.wave] = {ids = {}, count = 0}\n    end\n    -- Uplift is a targeted AoE. Main target identifies the intended player;\n    -- hitTargets can include an overlapping bystander, so do not assign all\n    -- victims to the same order. Repeated later hits keep the first order.\n    local id = e.targetID\n    if not id or id <= 0 or c.order[id] then return end\n    c.order[id] = c.wave\n    local pair = c.waves[c.wave]\n    pair.ids[id], pair.count = true, pair.count + 1\nend\n\nfunction s.stompStart(e)\n    local c = s.centaur\n    if not c or c.phase ~= \"uplift\" then return end\n    local now = s.now()\n    if now < c.started or now - c.started > 20000 then\n        s.centaurClear()\n        return\n    end\n    c.phase = \"stomps\"\n    -- A waiting position can equal the player's initial spread point. Retire\n    -- that older timed shape so the new stage receives its full lifetime.\n    s.clear(centaurKey)\n    c.arrowX, c.arrowZ = nil, nil\n    centaurRoute(c)\nend\n\nfunction s.stompHit(e)\n    local c = s.centaur\n    if not c or c.phase ~= \"stomps\" then return end\n    local now = s.now()\n    if now < c.started or now - c.started > 40000 then\n        s.centaurClear()\n        return\n    end\n    -- One jump may report multiple victims. Distinct jumps are about2seconds\n    -- apart; suppress duplicate notifications without changing pair order.\n    if c.lastHit and now - c.lastHit <= 1000 then return end\n    c.lastHit = now\n    c.hits = c.hits + 1\n    if c.hits >= 4 then\n        s.centaurClear()\n    else\n        centaurRoute(c)\n    end\nend\n\n-- NA1 unsynced cheese only. The owning GUI start reaction is gated to NA1.\n-- Methods consume exact, GUI-filtered native events; no ability is cast here.\n-- naClone(e, false) = channel, naClone(e, true) = cast resolution.\nlocal s = data.kaptinP8S\nlocal partyOptions = {noAliveCheck = true}\nlocal tankJobs = {[19] = true, [21] = true, [32] = true, [37] = true}\nlocal orders = {[1483] = {\"fire\", \"ice\"}, [1485] = {\"ice\", \"fire\"}}\nlocal nameIDs = {\n    m0798_circle_0t1 = 1572,\n    m0798_castbar_01t1 = 1483, m0798_castbar_03t1 = 1485,\n    m0798_castbar_05t1 = 1487, m0798_castbar_07t1 = 1489\n}\nlocal arrowKey = \"na1\"\n\nlocal function finite(v)\n    return type(v) == \"number\" and v == v and v > -math.huge and v < math.huge\nend\n\nlocal function live(ent)\n    return ent and finite(ent.id) and ent.id > 0 and ent.alive == true\n        and ent.hp and finite(ent.hp.current) and ent.hp.current > 0\n        and ent.pos and finite(ent.pos.x) and finite(ent.pos.z)\nend\n\nlocal function clearRings(n)\n    for id in pairs(n.rings) do s.clear(\"na1target\" .. id) end\n    n.rings = {}\nend\n\nlocal function hide(n)\n    s.clear(arrowKey)\n    n.arrowX, n.arrowZ = nil, nil\n    clearRings(n)\nend\n\nfunction s.naClear()\n    if s.na then hide(s.na) else s.clear(arrowKey) end\n    s.na = nil\nend\n\nlocal function state()\n    local n = s.na\n    if not n then return end\n    local age = s.now() - n.started\n    if age < 0 or age > 55000 then s.naClear(); return end\n    return n\nend\n\n-- NA positions depend on live jobs and purple markers, not roster seating.\n-- Party list keys are not entity IDs. Read entity values and validate IDs.\n-- Keep dead uninvolved members, but require both live tanks and purples.\nlocal function party(n)\n    if n.invalid or n.purpleCount ~= 2 then return end\n    local player = TensorCore.mGetPlayer()\n    if not live(player) then return end\n    local members = TensorCore.getEntityGroupList(\"Party\", partyOptions)\n    if not members then return end\n    local byID, list, tanks, purpleLive = {}, {}, {}, 0\n    for _, ent in pairs(members) do\n        if not ent or not finite(ent.id) or ent.id <= 0 or byID[ent.id]\n            or not finite(ent.job) or ent.job <= 0 then return end\n        byID[ent.id], list[#list + 1] = ent, ent\n        if tankJobs[ent.job] then\n            if not live(ent) or n.purple[ent.id] then return end\n            tanks[#tanks + 1] = ent.id\n        end\n        if n.purple[ent.id] then\n            if not live(ent) then return end\n            purpleLive = purpleLive + 1\n        end\n    end\n    if #list ~= 8 or #tanks ~= 2 or purpleLive ~= 2 or not byID[player.id] then return end\n    return list, byID, player, tankJobs[byID[player.id].job] == true\nend\n\nlocal function point(n, x, z, expires)\n    local duration = expires - s.now()\n    if duration <= 0 then hide(n); return end\n    if n.arrowX == x and n.arrowZ == z then return end\n    n.arrowX, n.arrowZ = x, z\n    s.arrow(arrowKey, x, z, duration)\nend\n\nlocal function route(n)\n    local list, byID, player, isTank = party(n)\n    if not list then hide(n); return end\n    if n.stage == \"bait\" then\n        if n.purple[player.id] then\n            point(n, 100, 82, n.started + 23000)\n        else\n            point(n, 100, 100, n.started + 23000)\n        end\n        return\n    end\n    if n.stage ~= \"elements\" then return end\n    -- Missing impact/new-wave packets must not leave the old row advertised.\n    local first = n.waves[1]\n    if n.routeIndex == 1 and ((first and first.hitCount == 3) or n.waves[2]) then\n        hide(n)\n        return\n    end\n    local wave = n.waves[n.routeIndex]\n    if not wave or not wave.safeZ then hide(n); return end\n    local element = n.order[n.routeIndex]\n    local x = n.purple[player.id] and 100 or (isTank and (element == \"ice\" and 107 or 113) or 90)\n    point(n, x, wave.safeZ, n.elementAt + 14500)\nend\n\nlocal function advance(n)\n    local first, second = n.waves[1], n.waves[2]\n    -- Element1 lands about0.56s BEFORE beam1. Never send players into the\n    -- other row on the elemental hit alone, or before all three beams land.\n    if n.routeIndex == 1 and n.landed >= 1 and first and first.hitCount == 3\n        and second and second.safeZ then\n        n.routeIndex = 2\n        clearRings(n)\n        route(n)\n    elseif n.routeIndex == 1 and first and first.hitCount == 3 then\n        route(n) -- Clears the obsolete row while waiting for missing packets.\n    end\n    if n.landed >= 2 and second and second.hitCount == 3 then s.naClear() end\nend\n\nfunction s.naStart(e)\n    local now = s.now()\n    if s.na and now - s.na.started >= 0 and now - s.na.started <= 1000 then return end\n    s.naClear()\n    s.na = {started = now, stage = \"bait\", purple = {}, purpleCount = 0,\n        rings = {}, waves = {}, cloneWave = {}, landed = 0, routeIndex = 1}\nend\n\nfunction s.naPurple(e)\n    local n = state()\n    if not n or not e then return end\n    if (e.vfxID or nameIDs[e.vfxName]) ~= 1572 then return end\n    local id = e.primaryEntityID\n    if not finite(id) or id <= 0 or n.purple[id] then return end\n    n.purple[id], n.purpleCount = true, n.purpleCount + 1\n    if n.purpleCount > 2 then n.invalid = true; hide(n); return end\n    if n.purpleCount == 2 then route(n) end\nend\n\nfunction s.naGauge(e)\n    local n = state()\n    if not n or not e then return end\n    local id = e.vfxID or nameIDs[e.vfxName]\n    if id == 1487 or id == 1489 then return end -- No guessed stack/spread routes.\n    local order = orders[id]\n    if not order or not n.purple[e.primaryEntityID] then return end\n    if n.elementAt then\n        if n.gaugeID ~= id or n.activePurple ~= e.primaryEntityID then\n            n.invalid = true; hide(n)\n        end\n        return -- Duplicate VFX must not postpone invulnerability or reset hits.\n    end\n    n.gaugeID, n.activePurple, n.order = id, e.primaryEntityID, order\n    n.elementAt, n.stage = s.now(), \"elements\"\n    n.invulnDue, n.invulnEnd = n.elementAt + 5400, n.elementAt + 5900\n    n.invulnUsed = false\n    hide(n) -- Wait for all three clone channels before nominating a row.\nend\n\nfunction s.naPuddle(e)\n    local n = state()\n    if not n or n.stage ~= \"bait\" then return end\n    n.stage = \"unrouted\"\n    hide(n)\nend\n\nfunction s.naCleave(e)\n    local n = state()\n    if not n or n.stage == \"elements\" then return end\n    n.stage = \"unrouted\"\n    hide(n)\nend\n\nfunction s.naClone(e, resolved)\n    local n = state()\n    if not n or n.stage ~= \"elements\" or not e or e.spellID ~= 31371 then return end\n    local id = e.entityID\n    if not finite(id) or id <= 0 then return end\n    if resolved then\n        local index = n.cloneWave[id]\n        local wave = index and n.waves[index]\n        if not wave or wave.hit[id] then return end\n        wave.hit[id], wave.hitCount = true, wave.hitCount + 1\n        advance(n)\n        return\n    end\n    if n.cloneWave[id] then return end\n    local ent = TensorCore.mGetEntity(id)\n    local p = ent and ent.pos\n    if not ent or ent.contentid ~= 11406 or not p or not finite(p.x)\n        or not finite(p.z) or not finite(p.h) then return end\n    local side = math.abs(p.x - 80) <= 1 and -1 or (math.abs(p.x - 120) <= 1 and 1 or nil)\n    if not side or math.abs(p.h + side * math.pi / 2) > 0.2 then return end\n    local row = 85 + 10 * math.floor((p.z - 85) / 10 + 0.5)\n    if (row ~= 85 and row ~= 95 and row ~= 105 and row ~= 115) or math.abs(p.z - row) > 1 then return end\n    local now = s.now()\n    local index = #n.waves\n    local wave = n.waves[index]\n    if not wave or now - wave.started > 1000 then\n        if index >= 2 then n.invalid = true; hide(n); return end\n        index = index + 1\n        wave = {started = now, rows = {}, count = 0, hit = {}, hitCount = 0, side = side}\n        n.waves[index] = wave\n    end\n    if wave.side ~= side or wave.rows[row] then n.invalid = true; hide(n); return end\n    n.cloneWave[id], wave.rows[row], wave.count = index, true, wave.count + 1\n    if wave.count == 3 then\n        if not wave.rows[85] and wave.rows[95] and wave.rows[105] and wave.rows[115] then\n            wave.safeZ = 88\n        elseif not wave.rows[95] and wave.rows[85] and wave.rows[105] and wave.rows[115] then\n            wave.safeZ = 92\n        else\n            n.invalid = true; hide(n); return\n        end\n        if index == 1 then route(n) end\n        advance(n)\n    end\nend\n\nfunction s.naElement(e)\n    local n = state()\n    if not n or n.stage ~= \"elements\" or not e then return end\n    local element = e.spellID == 31165 and \"fire\" or (e.spellID == 31166 and \"ice\" or nil)\n    if not element then return end\n    local now = s.now()\n    if n.lastElementHit and now - n.lastElementHit <= 1000 then return end\n    if n.landed >= 2 then return end\n    if element ~= n.order[n.landed + 1] then n.invalid = true; hide(n); return end\n    n.lastElementHit, n.landed = now, n.landed + 1\n    clearRings(n)\n    advance(n)\nend\n\nfunction s.naCanInvuln()\n    local n = state()\n    if not n or n.stage ~= \"elements\" or not n.invulnDue or n.invulnUsed\n        or n.landed ~= 0 or n.invalid then return false end\n    local now = s.now()\n    if now < n.invulnDue or now > n.invulnEnd then return false end\n    -- A dead co-tank or unresolved party slot must not prevent self-invuln.\n    -- The observed first elemental gauge and local role are sufficient.\n    local player = TensorCore.mGetPlayer()\n    return live(player) and tankJobs[player.job] == true\n        and not n.purple[player.id]\nend\n\nfunction s.naInvulnUsed()\n    local n = state()\n    if n then n.invulnUsed = true end\nend\n\nfunction s.naTick()\n    local n = state()\n    if not n then return end\n    local now = s.now()\n    if n.lastTick and now - n.lastTick < 100 then return end\n    n.lastTick = now\n    -- Marker delivery can precede the party cache resolving. Retry the bait\n    -- route during the same mechanic instead of losing it for the whole stage.\n    if n.stage == \"bait\" then route(n); return end\n    if n.stage ~= \"elements\" then return end\n    if now - n.elementAt > 14500 then s.naClear(); return end\n    local list, byID, player, isTank = party(n)\n    if not list then hide(n); return end\n    route(n)\n    if n.landed >= n.routeIndex then clearRings(n); return end\n    local wave = n.waves[n.routeIndex]\n    if not wave or not wave.safeZ then clearRings(n); return end\n    local source = byID[n.activePurple]\n    if not live(source) then hide(n); return end\n    local candidates = {}\n    for _, ent in ipairs(list) do\n        if not n.purple[ent.id] and live(ent) then\n            local dx, dz = ent.pos.x - source.pos.x, ent.pos.z - source.pos.z\n            candidates[#candidates + 1] = {id = ent.id, distance = dx * dx + dz * dz, tank = tankJobs[ent.job] == true}\n        end\n    end\n    local element = n.order[n.routeIndex]\n    local count = element == \"ice\" and 2 or 3\n    if #candidates < count then clearRings(n); return end\n    table.sort(candidates, function(a, b)\n        if a.distance == b.distance then return a.id < b.id end\n        if element == \"ice\" then return a.distance < b.distance end\n        return a.distance > b.distance\n    end)\n    local selected = {}\n    for i = 1, count do\n        local target = candidates[i]\n        -- Equal-distance tie-breaking is not known. Do not label an arbitrary\n        -- member of a tied cluster as the uniquely selected bait target.\n        local nextCandidate = candidates[count + 1]\n        if not nextCandidate or math.abs(target.distance - nextCandidate.distance) > 0.0001 then\n            local green = target.id == player.id or (not isTank and not n.purple[player.id] and not target.tank)\n            selected[target.id] = true\n            s.ring(\"na1target\" .. target.id, target.id, 0.8, math.max(1, n.elementAt + 14500 - now), green)\n        end\n    end\n    for id in pairs(n.rings) do if not selected[id] then s.clear(\"na1target\" .. id) end end\n    n.rings = selected\nend\n\nself.used = true\n",
							name = "Update mechanic guidance",
							uuid = "0057865a-37f0-8e37-9ea2-e1caf5143870",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Core",
				mechanicTime = 12,
				name = "[Core] Initialize P8S arena guidance",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 5588,
				timerStartOffset = -42,
				uuid = "9d53134f-3160-2381-93fc-cb0c1c6b7765",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local old = eventArgs.oldData\nlocal s = old and old.kaptinP8S\nif s then s.clearAll() end\nself.used = true",
							name = "Update mechanic guidance",
							uuid = "67770475-9646-0dea-aef2-baa059079319",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Core",
				eventType = 9,
				mechanicTime = 12,
				name = "[Clear] Remove P8S draws on wipe",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 5588,
				timerStartOffset = -42,
				uuid = "e4eb9789-41fd-897f-a32f-b2280731805f",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "e71e0fae-bab4-f15a-d846-c268836fbede",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	}, 
	[6] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "a604f022-9865-5c26-0f44-5a8c05ff9e12",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[9] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "7debee4d-60d2-5ab9-112f-440b8d52ccbd",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[10] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "faf8d89d-1f30-7f91-207f-5fc76efd3a4d",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[11] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "1008a218-d041-bcac-497b-88aa50238d88",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[12] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "96142353-57ed-08d7-ed5e-efc1ecd40483",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[14] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "565ed9a1-09b0-4dcd-d2fb-3cf3847d6c11",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[16] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "f36a27a7-8787-1803-02d5-11bdbd39f557",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[17] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "4a1d7b8a-1d38-0986-22fa-343871cb16ba",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[19] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "68a741c0-51f3-70d4-7b81-e312a4368170",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[20] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "01894580-cbef-e094-07dd-194ebe0bae30",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[21] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "328954e5-8466-26d9-a15a-3dcba17d3315",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[23] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "cde65ebb-4eff-535f-6785-3375a7e7256b",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[24] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "cadda364-58be-c1b0-456a-c842313ccd14",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[25] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "bfcb7029-3c30-4695-f476-c2bfe9b31359",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[26] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "98cab7b2-81a0-5dee-c6ae-2cf47009f5e2",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[27] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "a3b8266f-429a-38eb-5598-c5b9b44c3fdf",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[28] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "P1 - Kobe centaur",
				uuid = "06011aa8-19a7-8328-908f-788ab1b86b5f",
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
							actionLua = "local s = data.kaptinP8S\nif s then s.centaurStart(eventArgs) end\nself.used = true",
							conditions = 
							{
								
								{
									"500aeeab-481b-028d-8f8a-aa28fa6fa406",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "3649b77b-70b3-fcfa-ab12-1cdb2b8f8498",
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
							name = "Mechanic ID",
							spellIDList = 
							{
								31027,
							},
							uuid = "500aeeab-481b-028d-8f8a-aa28fa6fa406",
							version = 3,
						},
					},
				},
				displayPath = "P1 - Kobe centaur",
				eventType = 3,
				loop = true,
				mechanicTime = 206.9,
				name = "[Draw] Centaur - roster spread",
				timeRange = true,
				timelineIndex = 28,
				timerEndOffset = 593.1,
				timerStartOffset = -206.9,
				uuid = "534e86af-6746-ce11-8523-05a8714dcd69",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinP8S\nif s then s.uplift(eventArgs) end\nself.used = true",
							conditions = 
							{
								
								{
									"30da1a85-f34a-bc33-9335-6f5d11b08cd7",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "543210a9-1b25-2647-a67a-06485bcc2272",
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
							name = "Mechanic ID",
							spellIDList = 
							{
								31029,
							},
							uuid = "30da1a85-f34a-bc33-9335-6f5d11b08cd7",
							version = 3,
						},
					},
				},
				displayPath = "P1 - Kobe centaur",
				eventType = 2,
				loop = true,
				mechanicTime = 206.9,
				name = "[Core] Centaur - record Uplift pairs",
				timeRange = true,
				timelineIndex = 28,
				timerEndOffset = 593.1,
				timerStartOffset = -206.9,
				uuid = "383085ba-93cb-24f5-bfe4-68b3dd17304e",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinP8S\nif s then s.stompStart(eventArgs) end\nself.used = true",
							conditions = 
							{
								
								{
									"e15cef16-6c41-570d-b821-0625fd87f874",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "853aa125-cba8-4171-92d6-eff02f4839ad",
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
							name = "Mechanic ID",
							spellIDList = 
							{
								31030,
							},
							uuid = "e15cef16-6c41-570d-b821-0625fd87f874",
							version = 3,
						},
					},
				},
				displayPath = "P1 - Kobe centaur",
				eventType = 3,
				loop = true,
				mechanicTime = 206.9,
				name = "[Draw] Centaur - first bait and waiting stack",
				timeRange = true,
				timelineIndex = 28,
				timerEndOffset = 593.1,
				timerStartOffset = -206.9,
				uuid = "7904afdb-8ec2-a4c2-a261-e9dea5e22703",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinP8S\nif s then s.stompHit(eventArgs) end\nself.used = true",
							conditions = 
							{
								
								{
									"0d0ddfd7-2f44-b2eb-a5c5-299bfa70daec",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "a243343e-b1b5-c0ab-8a32-749caa3a7253",
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
							name = "Mechanic ID",
							spellIDList = 
							{
								31031,
							},
							uuid = "0d0ddfd7-2f44-b2eb-a5c5-299bfa70daec",
							version = 3,
						},
					},
				},
				displayPath = "P1 - Kobe centaur",
				eventType = 2,
				loop = true,
				mechanicTime = 206.9,
				name = "[Draw] Centaur - advance after each stomp",
				timeRange = true,
				timelineIndex = 28,
				timerEndOffset = 593.1,
				timerStartOffset = -206.9,
				uuid = "92c4e059-02b0-a23e-bc22-06f2b220e380",
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
				name = "store\\anyone\\savage2\\p8s",
				uuid = "b958456b-2226-a9f7-6bf2-6269dc984c1b",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[35] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "f85e6a6e-4ca8-05da-5b18-4aa4507f6c5e",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[36] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "b2ee5315-47da-3631-5cff-42afd3966145",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[37] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "cf7cce30-7725-7bcc-4b9f-b9f203d02ae0",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[38] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "f61b2417-3e86-e74b-e70e-229d780cc847",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[41] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "d9028b7f-be8d-c60b-bd27-dd99efd8636f",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[44] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "8e59d10e-44c7-0b82-a1bc-eb7022c53f7e",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[45] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "92dd2f8b-04b3-21ff-10d9-5a551a069bbb",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[47] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "7cbc6435-121a-43f9-3c1d-8aab7ea991e5",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[49] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "94641137-98ce-d663-8203-d61158d18967",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[51] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "286f0064-8acb-3900-5275-fd668ece2a14",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[53] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "f65c14b2-5fe6-f5fe-f0f6-2568cd9b52e2",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[55] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "5f1aa280-541f-96e4-512f-ca9a1b9d0b30",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[56] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "2b77bbbb-2cfa-19ef-764e-85f10578826b",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[58] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "cb316f61-a325-5cdd-29de-a70b475a23d1",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[61] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "95ee8c11-ac1e-f0cd-0144-20e7a8c05081",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[62] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "833c36ba-bfa6-ac86-3935-537cf9c5b76a",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[64] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "6194ad88-72b0-5fac-279f-f6162b8ea9f8",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[66] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "93f61606-aeec-cd3a-9164-675844a414b6",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[68] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "c8b17d54-e158-37f0-8d5d-8c32adbc5e84",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[69] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "d1129399-5074-a6d5-984a-faef9e4c2349",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[70] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "a8f5975b-c23e-1607-efcc-bb51816c0f8b",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[71] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "43be9e9e-36e7-6dea-3b2a-016c7ce8b10e",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[72] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "76295d85-e5e2-0701-eaad-f8976b4b4435",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[74] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "d4931d8f-5c86-0d33-6a4b-508dc7916b7f",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[75] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "2aa8f6d2-81c5-cb36-cc78-5fc807a55502",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[77] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "bf2d7e84-68b0-6078-fd39-9f4617147cb4",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[78] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "30d576b3-0043-b40f-efb7-07d95bad1fe3",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[79] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "561534b6-5659-8d52-3740-c194aa0365e6",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[80] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "9acd0d6e-8f5a-aca2-09d4-1f60f2ee0f5e",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[81] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "5bc6e86b-fa51-309f-d99a-55c57f06ef1b",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[82] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "71eb7130-af84-cdd4-5683-60dea63ecde0",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[83] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "555cf615-b7e5-e419-e29c-409b76050445",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[85] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "682c02df-36db-912b-dc6d-78890735344f",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[86] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "e51c9014-9c7a-f1f0-d913-401203016744",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[87] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "9d92d659-0b97-60d5-6aca-85cf78d82709",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[89] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "8e59da43-b57e-65d7-6066-6ebdccf74873",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[90] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "87762445-9690-93c9-5208-1fbf61813ef5",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[92] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "90780f1b-bb66-6e0f-b32a-22b99b56494b",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[94] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "8a494709-5cfc-ae05-feeb-9acb4f94d139",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[97] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "86ef0e92-2a91-ef1e-aa63-e7903f66d3c2",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[98] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "0e423d3d-a104-c101-e28b-5d77e5e31a6d",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[104] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "b3bf9519-0e43-362d-239d-a1870883eb09",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[105] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "ab5e7ed4-8285-a768-9846-f96a92ad2b44",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[108] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "631b5bcd-0efa-a6f9-3605-b95b8c7ce13d",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[110] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Core",
				uuid = "c6f00143-94f6-f45c-b9bd-fbb385beea07",
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
							actionLua = "local s = data.kaptinP8S\nif s then s.centaurClear() end\nself.used = true",
							name = "Update mechanic guidance",
							uuid = "3c5918ea-dcce-12d6-bf9f-251880929dc8",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "Core",
				mechanicTime = 5040.4,
				name = "[Clear] Centaur drawings at P2 start",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = -20.4,
				timerStartOffset = -40.4,
				uuid = "e6ac11a4-f0ea-ae2d-9c7b-89b8b497e4bf",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "P2 - NA cheese",
				uuid = "7495b408-1f7b-2981-bf04-00c56fd0974e",
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
							actionLua = "local s = data.kaptinP8S\nif s then s.naStart(eventArgs) end\nself.used = true",
							conditions = 
							{
								
								{
									"2d0c1b90-f42b-4587-8cf0-62100fd405e2",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "9f6cf141-d5ec-52ea-bfd8-6207edb0d929",
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
							name = "Mechanic ID",
							spellIDList = 
							{
								31163,
							},
							uuid = "2d0c1b90-f42b-4587-8cf0-62100fd405e2",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA cheese",
				eventType = 3,
				mechanicTime = 5040.4,
				name = "[Core] NA1 start and cheese state",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 69.6,
				timerStartOffset = -40.4,
				uuid = "619013f1-5365-b56a-b2b2-ab66fa19ebdf",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinP8S\nif s then s.naPurple(eventArgs) end\nself.used = true",
							conditions = 
							{
								
								{
									"ac75d0a3-ffce-7108-8e82-abbdeaf7c8fc",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "b276cdb9-7753-e392-92cf-d47ca74d462d",
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
							eventIntValue = 1572,
							name = "VFX ID",
							uuid = "ac75d0a3-ffce-7108-8e82-abbdeaf7c8fc",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA cheese",
				eventType = 27,
				loop = true,
				mechanicTime = 5040.4,
				name = "[Draw] NA1 purple and puddle bait positions",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 69.6,
				timerStartOffset = -40.4,
				uuid = "2f6002ef-8dad-19be-8b47-770de2c0a582",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinP8S\nif s then s.naGauge(eventArgs) end\nself.used = true",
							conditions = 
							{
								
								{
									"65dcad91-55de-57f9-9f27-d5a8828fc698",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "73da7c85-e237-dd91-82ee-2e958d7d49c2",
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
							eventIntValue = 1483,
							name = "VFX ID",
							uuid = "65dcad91-55de-57f9-9f27-d5a8828fc698",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA cheese",
				eventType = 27,
				mechanicTime = 5040.4,
				name = "[Core] NA1 fire then ice gauge",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 69.6,
				timerStartOffset = -40.4,
				uuid = "031c5c9b-9341-ad9d-b37e-81f0a58fa9d8",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinP8S\nif s then s.naGauge(eventArgs) end\nself.used = true",
							conditions = 
							{
								
								{
									"f9f29df5-9c7e-31bc-8f11-64a9e170cb9b",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "4df0688f-bc58-5395-b27f-4a2830fa3079",
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
							eventIntValue = 1485,
							name = "VFX ID",
							uuid = "f9f29df5-9c7e-31bc-8f11-64a9e170cb9b",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA cheese",
				eventType = 27,
				mechanicTime = 5040.4,
				name = "[Core] NA1 ice then fire gauge",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 69.6,
				timerStartOffset = -40.4,
				uuid = "e2daa439-ef61-2fb0-bf91-bb6d6f3783d4",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinP8S\nif s then s.naPuddle(eventArgs) end\nself.used = true",
							conditions = 
							{
								
								{
									"e58a1ac9-c4b7-2b55-88f2-ccf35dec4d14",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "ccd8a109-6fae-bce3-8c95-f314afbdead7",
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
							name = "Mechanic ID",
							spellIDList = 
							{
								31370,
							},
							uuid = "e58a1ac9-c4b7-2b55-88f2-ccf35dec4d14",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA cheese",
				eventType = 3,
				mechanicTime = 5040.4,
				name = "[Draw] NA1 clear bait on puddle appearance",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 69.6,
				timerStartOffset = -40.4,
				uuid = "a86c9666-b10a-e3b7-9a48-5cb7323287e4",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinP8S\nif s then s.naCleave(eventArgs) end\nself.used = true",
							conditions = 
							{
								
								{
									"346e80d4-95a8-a13b-8824-46c85158b5a0",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "53158a56-2311-97fd-9bfe-b6c3a6234f1b",
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
							name = "Mechanic ID",
							spellIDList = 
							{
								31191,
								31192,
							},
							uuid = "346e80d4-95a8-a13b-8824-46c85158b5a0",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA cheese",
				eventType = 3,
				mechanicTime = 5040.4,
				name = "[Draw] NA1 clear preliminary route on Ashing Blaze",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 69.6,
				timerStartOffset = -40.4,
				uuid = "29f98885-d4c9-43f2-b723-9b32a117b030",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinP8S\nif s then s.naClone(eventArgs, false) end\nself.used = true",
							conditions = 
							{
								
								{
									"4905b924-f0ab-1427-bc2a-57ec44e8e332",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "c258dbea-54ec-2252-ad79-59287774b0e5",
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
							name = "Mechanic ID",
							spellIDList = 
							{
								31371,
							},
							uuid = "4905b924-f0ab-1427-bc2a-57ec44e8e332",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA cheese",
				eventType = 3,
				loop = true,
				mechanicTime = 5040.4,
				name = "[Core] NA1 collect End of Days safe row",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 69.6,
				timerStartOffset = -40.4,
				uuid = "5f52a8f6-8975-c8ee-aaaa-de34bef62f58",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinP8S\nif s then s.naClone(eventArgs, true) end\nself.used = true",
							conditions = 
							{
								
								{
									"9818d06c-00e7-24b2-a601-da2087cfed1d",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "ac17aeb0-10cd-29fe-9052-fe68a8381675",
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
							name = "Mechanic ID",
							spellIDList = 
							{
								31371,
							},
							uuid = "9818d06c-00e7-24b2-a601-da2087cfed1d",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA cheese",
				eventType = 2,
				loop = true,
				mechanicTime = 5040.4,
				name = "[Draw] NA1 change row after End of Days hits",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 69.6,
				timerStartOffset = -40.4,
				uuid = "efa8da52-436c-a92d-ba4d-74ed61a66f3b",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinP8S\nif s then s.naElement(eventArgs) end\nself.used = true",
							conditions = 
							{
								
								{
									"9613e5c8-e418-1834-9f2a-b1669bf5132e",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "a9bf090a-12bd-08d8-b5b0-0cf2cfad66a0",
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
							name = "Mechanic ID",
							spellIDList = 
							{
								31165,
								31166,
							},
							uuid = "9613e5c8-e418-1834-9f2a-b1669bf5132e",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA cheese",
				eventType = 2,
				loop = true,
				mechanicTime = 5040.4,
				name = "[Core] NA1 track fire and ice resolution",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 69.6,
				timerStartOffset = -40.4,
				uuid = "95bbb0d9-20f1-6019-8538-db6db7789cf3",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local s = data.kaptinP8S\nif s then s.naClear(eventArgs) end\nself.used = true",
							conditions = 
							{
								
								{
									"eadd657f-2564-df67-b072-c829536adccf",
									true,
								},
							},
							name = "Update mechanic guidance",
							uuid = "631dc089-2cab-6fc9-a715-611af97cc5e1",
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
							name = "Mechanic ID",
							spellIDList = 
							{
								31199,
							},
							uuid = "eadd657f-2564-df67-b072-c829536adccf",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA cheese",
				eventType = 3,
				loop = true,
				mechanicTime = 5040.4,
				name = "[Draw] NA1 cleanup at Aioniopyr",
				timeRange = true,
				timelineIndex = 110,
				timerEndOffset = 69.6,
				timerStartOffset = -40.4,
				uuid = "50246699-8111-349e-be1e-3733298dc89a",
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
				name = "store\\anyone\\savage2\\p8s",
				uuid = "ee1a0b7b-bf1e-7907-6201-0ce9da018c6b",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[113] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "6e0649a5-e2c2-6a01-530d-ed2fd3979a15",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[115] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "5396fa2f-5966-7033-6d7d-3ca5e666a6df",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[116] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "51b00224-6590-c378-fd86-ec3e63573414",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[117] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "P2 - NA cheese",
				uuid = "b81ed8ee-2a1d-e554-9892-a88dc6bc4b49",
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
							actionLua = "local s = data.kaptinP8S\nif s then s.naTick() end\nself.used = true",
							name = "Update mechanic guidance",
							uuid = "c7f32ace-0329-2e39-ad07-596ad296ad84",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				displayPath = "P2 - NA cheese",
				loop = true,
				mechanicTime = 5076.4,
				name = "[Draw] NA - live fire and ice bait targets",
				throttleTime = 100,
				timeRange = true,
				timelineIndex = 117,
				timerEndOffset = 13.6,
				timerStartOffset = -41.4,
				uuid = "910d1a09-19cf-fb00-8239-b2a8881168b9",
				version = 2,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "P2 - NA invuln",
				uuid = "f2411ffa-6f2a-1b3d-97f7-31a4b47cea4b",
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
							actionID = 43,
							atomicPriority = true,
							conditions = 
							{
								
								{
									"b0adc527-51bc-cb2f-899a-f86fedf8a81a",
									true,
								},
								
								{
									"429b267e-7349-572b-8631-fbd9b6958323",
									true,
								},
								
								{
									"5fb03b7d-f0a6-a5c8-9372-86421ac07508",
									true,
								},
							},
							ignoreWeaveRules = true,
							name = "WAR Holmgang - NA cheese",
							uuid = "c015a451-4a48-0669-97a6-68711aea5578",
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
								21,
							},
							name = "WAR",
							uuid = "b0adc527-51bc-cb2f-899a-f86fedf8a81a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 43,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Invuln ready",
							uuid = "429b267e-7349-572b-8631-fbd9b6958323",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s = data.kaptinP8S\nreturn s ~= nil and s.naCanInvuln()",
							name = "First elemental gauge ~90%",
							uuid = "5fb03b7d-f0a6-a5c8-9372-86421ac07508",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA invuln",
				mechanicTime = 5076.4,
				name = "[Invuln] NA - WAR Holmgang at ~90%",
				timeRange = true,
				timelineIndex = 117,
				timerEndOffset = 6.5999999046326,
				timerStartOffset = -18.39999961853,
				uuid = "c27796dd-d62a-6e19-80aa-f8f7c00a4dcd",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							actionID = 30,
							atomicPriority = true,
							conditions = 
							{
								
								{
									"513f441b-fbec-b589-97fc-f80a54371bd0",
									true,
								},
								
								{
									"69bd8d23-7e7e-67ba-a5a6-1969ef12dd6c",
									true,
								},
								
								{
									"b341f737-b487-79fc-afd5-65030bc4a457",
									true,
								},
							},
							ignoreWeaveRules = true,
							name = "PLD Hallowed Ground - NA cheese",
							uuid = "77e784ce-a09e-b7ba-9f40-1b6c0c4356ef",
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
								19,
							},
							name = "PLD",
							uuid = "513f441b-fbec-b589-97fc-f80a54371bd0",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 30,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Invuln ready",
							uuid = "69bd8d23-7e7e-67ba-a5a6-1969ef12dd6c",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s = data.kaptinP8S\nreturn s ~= nil and s.naCanInvuln()",
							name = "First elemental gauge ~90%",
							uuid = "b341f737-b487-79fc-afd5-65030bc4a457",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA invuln",
				mechanicTime = 5076.4,
				name = "[Invuln] NA - PLD Hallowed Ground at ~90%",
				timeRange = true,
				timelineIndex = 117,
				timerEndOffset = 6.6,
				timerStartOffset = -18.4,
				uuid = "864b8f6c-06d8-491b-b874-2bf9a2037b06",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							actionID = 3638,
							atomicPriority = true,
							conditions = 
							{
								
								{
									"b74f0b47-4297-87f6-9707-41a0aed57e1a",
									true,
								},
								
								{
									"3f84a836-e459-635c-a779-01ad068cbd16",
									true,
								},
								
								{
									"a616848f-f3dc-19d8-9ba6-36c1e9b03152",
									true,
								},
							},
							ignoreWeaveRules = true,
							name = "DRK Living Dead - NA cheese",
							uuid = "ac21a550-52aa-ab3b-8253-93f6ebab9a84",
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
								32,
							},
							name = "DRK",
							uuid = "b74f0b47-4297-87f6-9707-41a0aed57e1a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 3638,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Invuln ready",
							uuid = "3f84a836-e459-635c-a779-01ad068cbd16",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s = data.kaptinP8S\nreturn s ~= nil and s.naCanInvuln()",
							name = "First elemental gauge ~90%",
							uuid = "a616848f-f3dc-19d8-9ba6-36c1e9b03152",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA invuln",
				mechanicTime = 5076.4,
				name = "[Invuln] NA - DRK Living Dead at ~90%",
				timeRange = true,
				timelineIndex = 117,
				timerEndOffset = 6.6,
				timerStartOffset = -18.4,
				uuid = "5fd10405-dfe4-c2f5-9e4c-3c4b08e64cb1",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							actionID = 16152,
							atomicPriority = true,
							conditions = 
							{
								
								{
									"a737b0ef-a654-02be-b847-a5413864f9ff",
									true,
								},
								
								{
									"6552e94d-75ec-7f04-8c4d-342042a53554",
									true,
								},
								
								{
									"cb80dc0e-2c76-ad63-b216-8e96d5cfcb94",
									true,
								},
							},
							ignoreWeaveRules = true,
							name = "GNB Superbolide - NA cheese",
							uuid = "018ca582-5e3a-173a-87e2-4572c760924b",
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
								37,
							},
							name = "GNB",
							uuid = "a737b0ef-a654-02be-b847-a5413864f9ff",
							version = 3,
						},
					},
					
					{
						data = 
						{
							actionID = 16152,
							category = "Self",
							comparator = 2,
							conditionType = 4,
							name = "Invuln ready",
							uuid = "6552e94d-75ec-7f04-8c4d-342042a53554",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "local s = data.kaptinP8S\nreturn s ~= nil and s.naCanInvuln()",
							name = "First elemental gauge ~90%",
							uuid = "cb80dc0e-2c76-ad63-b216-8e96d5cfcb94",
							version = 3,
						},
					},
				},
				displayPath = "P2 - NA invuln",
				mechanicTime = 5076.4,
				name = "[Invuln] NA - GNB Superbolide at ~90%",
				timeRange = true,
				timelineIndex = 117,
				timerEndOffset = 6.6,
				timerStartOffset = -18.4,
				uuid = "3d5bc0d4-6a0b-7ca4-96d4-798711795028",
				version = 2,
			},
		},
	},
	[119] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "78c124d3-fd24-170f-3882-ce210c947e43",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[120] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "7b91b7f7-26d6-1e03-5841-91612d5a9367",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[124] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "215ebaa3-f73c-0ed7-0484-e85d08dc0c13",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[126] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "e27ec66d-be7f-8591-d2d4-44133a8cb05d",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[128] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "eb0e7a3f-7899-3a2b-aa6c-ef29c4616d6f",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[130] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "1991ebb8-583d-aef4-473e-751a1d0c97e8",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[133] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "c992f473-8606-44bf-6c5d-3071303629e3",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[136] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "4013402a-996c-9b4e-e704-cfe87d463d1a",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[138] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "a2da79e0-6b88-544c-a626-97020cb8ab50",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[139] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "72a0b045-3c3d-0eb1-6612-ad7f3fd44e35",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[143] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "9da49d2a-8a81-85de-d3a7-4eecdad79a1a",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[148] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "d3053009-9464-93bd-52cd-81df0712f479",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[150] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "d63b547a-20ef-63ee-29e1-b4d82be01e6a",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[152] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "31c1b8ec-f80d-c7b0-c01d-439671da2e1c",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[154] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "f3d156c6-aa0c-0f62-d1b2-a0fc76be7bb6",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[155] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "d715c343-ee4e-595f-fab0-3461517ebdb3",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[156] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "c3101748-6b3e-e694-fc64-3e4a5da910f8",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[158] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "6ca5a1e2-3137-c446-8e99-67804b523dd2",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[159] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "b0e7ebdf-147c-30c3-bf99-76e5f53c648f",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[163] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "87fc1ed8-6d33-787c-fdeb-c3ce823df488",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[164] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "f7dbd867-10c3-be93-4ba7-7039ef545c57",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[165] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "5a7ea84a-5b9e-1b16-bcbc-d774a3e57dba",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[168] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "b910eabb-cc49-1fef-e1f5-b96d70b187ab",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[169] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "c1cf8e7e-c15b-b132-0e65-0aa80a49c2ae",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[170] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "a1da8004-24f4-4a68-ef00-ae5e5055fc74",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[173] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "b7401f0f-381d-dc63-7217-a3457e1e923f",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[175] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "58d65f05-aa4c-aaf1-0347-d34ff12d02f5",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[176] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "266ba01e-852d-ef9a-ff14-06449184e8ce",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[178] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "33dde89c-14a0-5dd0-22a2-b57663a0a1cc",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[180] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "d0dcc8ad-a37f-23a9-7d7e-ae8b79337c9d",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[183] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "a69f11e6-7c7e-6b32-3442-4050f73a48d6",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[186] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "7f8e9d37-b19a-123b-d10b-2c7971a4cba7",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[187] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "a558df1a-ba58-b5fe-1327-1bb4c8581f8a",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[189] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "34cb4d50-2856-327c-a616-04e6e6e1e5c0",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[190] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "413fc0b6-9f38-cb82-3bd2-661c1f512126",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[191] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "1c0002b3-5f24-e1ff-a4d2-ef81bcec5d23",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[193] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "e95bc47d-6c8c-03f9-812e-fe877e0c68ed",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[195] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "81b80b87-18ff-860b-e8d2-b77d171f5a77",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[196] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "3c5b731c-cfc3-17d0-40b6-b3b66c1e2c4c",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[198] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "2ee92a9e-4050-a99a-a9ce-fd849a02734e",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[200] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "962b60f6-49f9-e8c2-7abd-c2a0f18c0e66",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	[202] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage2\\p8s",
				uuid = "8c918a38-cb3d-4d74-215b-031e900c3668",
			},
			inheritanceRoot = "store\\anyone\\savage2\\p8s",
			objectType = "folder",
		},
	},
	inheritedProfiles = 
	{
		"store\\anyone\\savage2\\p8s",
	},
	timelineName = "p8s",
	version = "1.0.4",
}



return tbl