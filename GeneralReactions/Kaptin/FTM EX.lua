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
			eventType = 2,
			name = "[FTM] ===v412===",
			uuid = "1a2b3c4d-00ff-4b2b-9cff-b2c1c105a0ff",
			version = 2,
		},
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\nlocal id = a.spellID\nif id ~= 49660 and id ~= 50360 and id ~= 49661 and id ~= 49687 then return end\nif data.b2LlSwords == nil then return end\n\nif id == 49687 then\n    -- Swordpointe re-anchors the full knockback schedule.\n    local kb1 = Now() + 2100\n    for _, r in pairs(data.b2LlSwords) do\n        if r.beatIdx ~= nil then\n            r.hitAt = kb1 + r.beatIdx * 2500 + (r.kind == \"AOE\" and 2500 or 0)\n        end\n    end\n    data.b2LlAnchored = true\n    self.used = true\n    return\nend\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil then return end\n\nlocal key, rec\nfor k, r in pairs(data.b2LlSwords) do\n    local dx, dz = r.x - ent.pos.x, r.z - ent.pos.z\n    if dx * dx + dz * dz < 2.25 then\n        key, rec = k, r\n        break\n    end\nend\nif rec == nil then return end\nif rec.done and id ~= 49661 then return end\n\nfor i = 1, #rec.uuids do Argus.deleteTimedShape(rec.uuids[i]) end\nrec.uuids = {}\nif AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n    for i = 1, #rec.texts do AnyoneCore.removeTimedWorldText(rec.texts[i]) end\nend\nrec.texts = {}\n\nif id == 49661 then\n    -- The same sword knocks back one beat after its circle.\n    local blue = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.3, 0.6, 1.0, 0.55), 2)\n    rec.uuids[#rec.uuids + 1] = blue:addTimedCircle(2600, ent.pos.x, ent.pos.y, ent.pos.z, 2)\n    if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n        rec.texts[#rec.texts + 1] = AnyoneCore.addTimedWorldText(2600, \"KB\", { x = ent.pos.x, y = ent.pos.y + 2.0, z = ent.pos.z }, GUI:ColorConvertFloat4ToU32(0.4, 0.7, 1.0, 1.0), true, 1.3)\n    end\n    rec.kind = \"KB\"\n    rec.hitAt = Now() + 2500\nelse\n    rec.done = true\n    -- Re-anchor the next pending knockback.\n    local best\n    for _, r in pairs(data.b2LlSwords) do\n        if not r.done and (best == nil or r.hitAt < best.hitAt) then best = r end\n    end\n    if best ~= nil and best.hitAt < Now() + 1500 then\n        best.hitAt = Now() + 2500\n    end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"8d2e3bc1-5f22-4ea3-ab4c-662cf1d8e202",
								true,
							},
						},
						name = "SD - Cleanup + Followup KB",
						uuid = "6d64a4d4-f153-478d-a6f7-41459f24f083",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil or a.spellID == nil then return end\nlocal id = a.spellID\n\nif id == 47489 then\n    if data.npHeads == nil then return end\n    local element = data.npHeads[a.entityID]\n    if element == nil then return end\n    local x, y, z = a.castPosX, a.castPosY, a.castPosZ\n    if x == nil or y == nil or z == nil then return end\n    data.npDraws = data.npDraws or {}\n    data.npOrder = data.npOrder or {}\n    data.npSpots = data.npSpots or {}\n    data.npDone = data.npDone or {}\n    data.npSpots[a.entityID] = { x = x, y = y, z = z, element = element }\n    data.npOrder[#data.npOrder + 1] = a.entityID\n\n    if data.npDrawFull == nil then\n        local function fillColor(elem, alpha)\n            if elem == \"ice\" then return GUI:ColorConvertFloat4ToU32(0.35, 0.75, 1.0, alpha) end\n            if elem == \"thunder\" then return GUI:ColorConvertFloat4ToU32(1.0, 0.9, 0.2, alpha) end\n            return GUI:ColorConvertFloat4ToU32(1.0, 0.35, 0.15, alpha)\n        end\n        local function label(elem)\n            if elem == \"ice\" then return \"ICE +\" end\n            if elem == \"thunder\" then return \"LTG X\" end\n            return \"FIRE O\"\n        end\n        local function wipe(rec)\n            if rec == nil then return end\n            for i = 1, #rec.shapes do Argus.deleteTimedShape(rec.shapes[i]) end\n            if rec.text ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n                AnyoneCore.removeTimedWorldText(rec.text)\n            end\n        end\n        data.npWipe = wipe\n        data.npDrawFull = function(entID)\n            local s = data.npSpots[entID]\n            if s == nil or data.npDone[entID] then return end\n            local rec = data.npDraws[entID]\n            if rec ~= nil and rec.mode == \"full\" then return end\n            wipe(rec)\n            local d = TensorCore.getStaticDrawer(fillColor(s.element, 0.45), 1)\n            local shapes = {}\n            local dur = 40000\n            if s.element == \"ice\" then\n                shapes[#shapes + 1] = d:addTimedCenteredRect(dur, s.x, s.y, s.z, 90, 15, 0)\n                shapes[#shapes + 1] = d:addTimedCenteredRect(dur, s.x, s.y, s.z, 90, 15, math.pi / 2)\n            elseif s.element == \"thunder\" then\n                -- Thunder uses four diagonal cones.\n                local rad45 = math.rad(45)\n                shapes[#shapes + 1] = d:addTimedCone(dur, s.x, s.y, s.z, 60, rad45, math.pi / 4)\n                shapes[#shapes + 1] = d:addTimedCone(dur, s.x, s.y, s.z, 60, rad45, 3 * math.pi / 4)\n                shapes[#shapes + 1] = d:addTimedCone(dur, s.x, s.y, s.z, 60, rad45, -math.pi / 4)\n                shapes[#shapes + 1] = d:addTimedCone(dur, s.x, s.y, s.z, 60, rad45, -3 * math.pi / 4)\n            else\n                shapes[#shapes + 1] = d:addTimedCircle(dur, s.x, s.y, s.z, 18)\n            end\n            local text\n            if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n                text = AnyoneCore.addTimedWorldText(dur, label(s.element), { x = s.x, y = s.y + 2.0, z = s.z }, GUI:ColorConvertFloat4ToU32(1, 1, 1, 1), true, 1.2)\n            end\n            data.npDraws[entID] = { mode = \"full\", shapes = shapes, text = text }\n        end\n        data.npDrawMarker = function(entID)\n            local s = data.npSpots[entID]\n            if s == nil or data.npDone[entID] or data.npDraws[entID] ~= nil then return end\n            local d = TensorCore.getStaticDrawer(fillColor(s.element, 0.8), 2)\n            local shapes = { d:addTimedCircle(40000, s.x, s.y, s.z, 1.5) }\n            local text\n            if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n                text = AnyoneCore.addTimedWorldText(40000, label(s.element), { x = s.x, y = s.y + 2.0, z = s.z }, fillColor(s.element, 1.0), true, 0.9)\n            end\n            data.npDraws[entID] = { mode = \"marker\", shapes = shapes, text = text }\n        end\n        -- Safe spots derive from landings alone; order arrives late.\n        local center = { x = 100.0, y = -724.0, z = 800.0 }\n        local function elemShort(elem)\n            if elem == \"ice\" then return \"ICE\" end\n            if elem == \"thunder\" then return \"LTG\" end\n            return \"FIRE\"\n        end\n        -- speech via data.lib; raw names if it is missing\n        local function speakName(name)\n            if data.lib ~= nil then return data.lib.speakName(name) end\n            return name or \"unknown\"\n        end\n        local function movePhrase(p)\n            if data.lib ~= nil then return data.lib.movePhrase(p) end\n            return p\n        end\n        local function elemSources(elem)\n            local sources = {}\n            for eid, s in pairs(data.npSpots) do\n                if s.element == elem then\n                    sources[#sources + 1] = { x = s.x, z = s.z }\n                end\n            end\n            -- sets 2+ = Dark Current: no boss element copy\n            local inDC = (data.npSetN ~= nil and data.npSetN >= 2)\n                or (data.npDarkCurrentUntil ~= nil and Now() < data.npDarkCurrentUntil)\n            if not inDC then\n                sources[#sources + 1] = { x = center.x, z = center.z }\n            end\n            return sources\n        end\n        local function elemMargin(elem, sources, px, pz)\n            local margin = 28.5 - math.sqrt((px - center.x) ^ 2 + (pz - center.z) ^ 2)\n            for i = 1, #sources do\n                local dx = px - sources[i].x\n                local dz = pz - sources[i].z\n                local m\n                if elem == \"fire\" then\n                    -- AOE sizes + 0.5 pad (fire r18, ice cross 15x90).\n                    m = math.sqrt(dx * dx + dz * dz) - 18.5\n                elseif elem == \"ice\" then\n                    local ax = math.abs(dx)\n                    local az = math.abs(dz)\n                    local armA = math.max(ax - 8.0, az - 45.5)\n                    local armB = math.max(az - 8.0, ax - 45.5)\n                    m = math.min(armA, armB)\n                else\n                    local dist = math.sqrt(dx * dx + dz * dz)\n                    if dist >= 61 then\n                        m = dist - 61\n                    else\n                        local ang = math.atan2(dx, dz)\n                        local best = 10\n                        local diag = { math.pi / 4, 3 * math.pi / 4, -math.pi / 4, -3 * math.pi / 4 }\n                        for j = 1, 4 do\n                            local dd = math.abs(ang - diag[j])\n                            if dd > math.pi then dd = 2 * math.pi - dd end\n                            if dd < best then best = dd end\n                        end\n                        -- 45-degree full cone: 22.5 half-angle + 0.5 pad.\n                        m = (best - math.rad(23)) * math.max(dist, 1)\n                    end\n                end\n                if m < margin then margin = m end\n            end\n            return margin\n        end\n        local MARKS = { [0] = \"A\", [60] = \"1\", [90] = \"B\", [120] = \"2\", [180] = \"C\", [240] = \"3\", [270] = \"D\", [300] = \"4\" }\n        local function snap45(angDeg)\n            return (math.floor((angDeg + 22.5) / 45) * 45) % 360\n        end\n        -- names may come from live marks; positions never do\n        local function liveName(angDeg)\n            if data.lib == nil then return nil end\n            local a = math.rad(angDeg)\n            return data.lib.markNearDir(center.x, center.z, math.sin(a), -math.cos(a), math.rad(35), 35)\n        end\n        local function baseName(angDeg)\n            return liveName(angDeg) or MARKS[angDeg]\n        end\n        -- \"in\" = r14: closer to center sits inside the 45-degree head fans\n        local function markPos(angDeg, intent)\n            local useAng = angDeg\n            if intent == \"out\" then\n                -- heads sit on a 60-degree hexagon, OUT stands on 45-degree corners\n                useAng = (math.floor((angDeg + 22.5) / 45) * 45) % 360\n            end\n            local a = math.rad(useAng)\n            local rt = 17\n            if intent == \"in\" then rt = 14 elseif intent == \"out\" then rt = 22 end\n            return center.x + rt * math.sin(a), center.z - rt * math.cos(a)\n        end\n        local function angOf(x, z)\n            local a = math.deg(math.atan2(x - center.x, -(z - center.z))) % 360\n            return (math.floor((a + 30) / 60) % 6) * 60\n        end\n        data.npSolveSafe = function(elem)\n            local sources = elemSources(elem)\n            if #sources == 0 then return nil end\n            -- rule spots are margin-checked; unsafe ones fall through\n            local rc = data.npRuleCandidates(elem)\n            if rc ~= nil and #rc > 0 then\n                local best, bm = nil, nil\n                for i = 1, #rc do\n                    local m = elemMargin(elem, sources, rc[i].x, rc[i].z)\n                    if m >= 0.4 and (bm == nil or m > bm) then best, bm = rc[i], m end\n                end\n                if best ~= nil then return best.x, best.z, best.name end\n                d(\"[NP SafeDots] kanatan rule spot unsafe for \" .. elem .. \" - geometric fallback\")\n            end\n            local cands = {}\n            -- head spots double as candidates (ice stands under a head)\n            for eid, s in pairs(data.npSpots) do\n                local mn = baseName(angOf(s.x, s.z))\n                cands[#cands + 1] = { x = s.x, z = s.z, name = mn or data.npMarkName(s.x, s.z), bonus = 0.75 }\n            end\n            local compass = { \"N\", \"NE\", \"E\", \"SE\", \"S\", \"SW\", \"W\", \"NW\" }\n            for i = 0, 7 do\n                local ang = i * math.pi / 4\n                -- World north is -z; +x is east.\n                cands[#cands + 1] = { x = center.x + 20 * math.sin(ang), z = center.z - 20 * math.cos(ang), name = compass[i + 1], bonus = 0 }\n                cands[#cands + 1] = { x = center.x + 10 * math.sin(ang), z = center.z - 10 * math.cos(ang), name = compass[i + 1] .. \"-IN\", bonus = 0 }\n            end\n            cands[#cands + 1] = { x = center.x, z = center.z, name = \"MID\", bonus = 0.25 }\n            local best, bestScore = nil, nil\n            for i = 1, #cands do\n                local c = cands[i]\n                local m = elemMargin(elem, sources, c.x, c.z)\n                if m >= 0.4 then\n                    local score = m + c.bonus\n                    if bestScore == nil or score > bestScore then best, bestScore = c, score end\n                end\n            end\n            if best ~= nil then return best.x, best.z, best.name end\n            d(\"[NP SafeDots] no waymark/compass pocket for \" .. elem .. \" - grid fallback\")\n            local bx, bz, bm = nil, nil, 0.5\n            local radii = { 0, 5, 10, 15, 20, 24 }\n            for ri = 1, #radii do\n                local r = radii[ri]\n                local steps = r == 0 and 1 or 16\n                for si = 0, steps - 1 do\n                    local ang = si * (2 * math.pi / 16)\n                    local px = center.x + r * math.sin(ang)\n                    local pz = center.z + r * math.cos(ang)\n                    local m = elemMargin(elem, sources, px, pz)\n                    if m > bm then bx, bz, bm = px, pz, m end\n                end\n            end\n            if bx == nil then return nil end\n            return bx, bz, data.npMarkName(bx, bz)\n        end\n        data.npMarkName = function(px, pz)\n            if Argus ~= nil and Argus.getWaymarkInfo ~= nil then\n                -- id->name mapping assumed; compass fallback below\n                local names = { \"A\", \"B\", \"C\", \"D\", \"1\", \"2\", \"3\", \"4\" }\n                local bestName, bestD = nil, 6\n                for wid = 1, 8 do\n                    local mx, my, mz, active = Argus.getWaymarkInfo(wid)\n                    if active == true and mx ~= nil then\n                        local dd = math.sqrt((mx - px) ^ 2 + (mz - pz) ^ 2)\n                        if dd < bestD then bestName, bestD = names[wid], dd end\n                    end\n                end\n                if bestName ~= nil then return bestName end\n            end\n            local compass = { \"N\", \"NE\", \"E\", \"SE\", \"S\", \"SW\", \"W\", \"NW\" }\n            local ang = math.deg(math.atan2(px - center.x, -(pz - center.z))) % 360\n            return compass[math.floor((ang + 22.5) / 45) % 8 + 1]\n        end\n        -- assumed marker layout: A=N C=S, 1-4 on the number spots, B=E D=W\n        data.npRuleCandidates = function(elem)\n            local a = {}\n            local spotByAng = {}\n            for eid, s in pairs(data.npSpots) do\n                local ad = angOf(s.x, s.z)\n                spotByAng[ad] = s\n                if s.element == elem then a[#a + 1] = ad end\n            end\n            if #a ~= 2 then return nil end\n            local diff = math.abs(a[1] - a[2])\n            if diff > 180 then diff = 360 - diff end\n            local diagonal = diff == 180\n            local function isNum(ad) return ad ~= 0 and ad ~= 180 end\n            local out = {}\n            if elem == \"ice\" then\n                local num\n                if isNum(a[1]) and not isNum(a[2]) then num = a[1]\n                elseif isNum(a[2]) and not isNum(a[1]) then num = a[2] end\n                if num == nil then return nil end\n                local inDC = (data.npSetN ~= nil and data.npSetN >= 2)\n                    or (data.npDarkCurrentUntil ~= nil and Now() < data.npDarkCurrentUntil)\n                if inDC then\n                    local ang = math.sin(math.rad(num)) > 0 and 270 or 90\n                    local x, z = markPos(ang, \"at\")\n                    out[1] = { x = x, z = z, name = baseName(ang) }\n                else\n                    local opp = (num + 180) % 360\n                    local s = spotByAng[opp]\n                    local x, z\n                    if s ~= nil then x, z = s.x, s.z else x, z = markPos(opp, \"at\") end\n                    out[1] = { x = x, z = z, name = baseName(opp) }\n                end\n            elseif elem == \"thunder\" then\n                if diagonal then\n                    local bx, bz = markPos(90, \"in\")\n                    local dx2, dz2 = markPos(270, \"in\")\n                    out[1] = { x = bx, z = bz, name = baseName(90) .. \"-IN\" }\n                    out[2] = { x = dx2, z = dz2, name = baseName(270) .. \"-IN\" }\n                else\n                    local card\n                    if not isNum(a[1]) then card = a[1] elseif not isNum(a[2]) then card = a[2] end\n                    if card == nil then return nil end\n                    local opp = (card + 180) % 360\n                    local x, z = markPos(opp, \"in\")\n                    out[1] = { x = x, z = z, name = baseName(opp) .. \"-IN\" }\n                end\n            else -- fire\n                local nums = { [60] = true, [120] = true, [240] = true, [300] = true }\n                if diagonal and isNum(a[1]) and isNum(a[2]) then\n                    nums[a[1]] = nil\n                    nums[a[2]] = nil\n                    for ang in pairs(nums) do\n                        local x, z = markPos(ang, \"out\")\n                        out[#out + 1] = { x = x, z = z, name = (liveName(snap45(ang)) or MARKS[ang]) .. \"-OUT\" }\n                    end\n                elseif not diagonal then\n                    local card, num\n                    if isNum(a[1]) then num = a[1] else card = a[1] end\n                    if isNum(a[2]) then num = a[2] else card = a[2] end\n                    if card == nil or num == nil then return nil end\n                    local opp = (card + 180) % 360\n                    local adj = { (opp + 60) % 360, (opp - 60) % 360 }\n                    for i = 1, 2 do\n                        if adj[i] ~= num then\n                            local x, z = markPos(adj[i], \"out\")\n                            out[#out + 1] = { x = x, z = z, name = (liveName(snap45(adj[i])) or MARKS[adj[i]]) .. \"-OUT\" }\n                        end\n                    end\n                else\n                    return nil\n                end\n            end\n            return out\n        end\n        data.npWipeDot = function(elem)\n            local rec = data.npSafeDots ~= nil and data.npSafeDots[elem] or nil\n            if rec == nil then return end\n            for i = 1, #rec.shapes do Argus.deleteTimedShape(rec.shapes[i]) end\n            if rec.text ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n                AnyoneCore.removeTimedWorldText(rec.text)\n            end\n            data.npSafeDots[elem] = nil\n        end\n        data.npSafeDotDraw = function(elem)\n            data.npSafeDots = data.npSafeDots or {}\n            -- never move an announced dot\n            local nSpots = 0\n            for eid in pairs(data.npSpots) do nSpots = nSpots + 1 end\n            local old = data.npSafeDots[elem]\n            local sx, sz, name\n            if old ~= nil and old.pinned then\n                sx, sz, name = old.x, old.z, old.name\n            else\n                sx, sz, name = data.npSolveSafe(elem)\n            end\n            if sx == nil then\n                d(\"[NP SafeDots] no safe pocket for \" .. elem)\n                return\n            end\n            local pinned = (old ~= nil and old.pinned) or nSpots >= 6\n            data.npWipeDot(elem)\n            local n0 = data.npDotOrder ~= nil and data.npDotOrder[elem] or nil\n            local rr = (n0 == nil or n0 == 1) and 1.8 or 1.2\n            local dr = TensorCore.getStaticDrawer(fillColor(elem, 0.8), 2)\n            local shapes = { dr:addTimedCircle(40000, sx, center.y, sz, rr) }\n            local n = data.npDotOrder ~= nil and data.npDotOrder[elem] or nil\n            local txt = (n ~= nil and (n .. \". \") or \"\") .. elemShort(elem)\n            local text\n            if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n                text = AnyoneCore.addTimedWorldText(40000, txt, { x = sx, y = center.y + 2.2, z = sz }, fillColor(elem, 1.0), true, 2.0)\n            end\n            data.npSafeDots[elem] = { shapes = shapes, text = text, name = name, x = sx, z = sz, pinned = pinned }\n            -- names outlive wiped dots (route call may come later)\n            data.npDotNames = data.npDotNames or {}\n            data.npDotNames[elem] = name\n        end\n        data.npRedrawDots = function()\n            if data.npSafeDots == nil then return end\n            local elems = {}\n            for elem in pairs(data.npSafeDots) do elems[#elems + 1] = elem end\n            for i = 1, #elems do data.npSafeDotDraw(elems[i]) end\n        end\n        data.npStampDot = function(elem, n)\n            data.npDotOrder = data.npDotOrder or {}\n            if data.npDotOrder[elem] ~= nil then return end\n            data.npDotOrder[elem] = n\n            if data.npSafeDots ~= nil and data.npSafeDots[elem] ~= nil then\n                data.npSafeDotDraw(elem)\n            end\n            if n == 1 and data.npDotNames ~= nil and data.npDotNames[elem] ~= nil then\n                if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n                    AnyoneCore.Shotcall(\"Start \" .. speakName(data.npDotNames[elem]), true, 6)\n                end\n            end\n            -- two known = third forced\n            local elems = { \"fire\", \"ice\", \"thunder\" }\n            local stamped, lastElem = 0, nil\n            for i = 1, 3 do\n                if data.npDotOrder[elems[i]] ~= nil then\n                    stamped = stamped + 1\n                else\n                    lastElem = elems[i]\n                end\n            end\n            if stamped == 2 and lastElem ~= nil then\n                data.npDotOrder[lastElem] = 3\n                if data.npSafeDots ~= nil and data.npSafeDots[lastElem] ~= nil then\n                    data.npSafeDotDraw(lastElem)\n                end\n                stamped = 3\n            end\n            if stamped == 3 and not data.npRouteCalled and data.npDotNames ~= nil then\n                local byN = {}\n                for i = 1, 3 do\n                    local e = elems[i]\n                    if data.npDotNames[e] ~= nil and data.npDotOrder[e] ~= nil then\n                        byN[data.npDotOrder[e]] = data.npDotNames[e]\n                    end\n                end\n                if byN[1] ~= nil and byN[2] ~= nil and byN[3] ~= nil then\n                    data.npRouteCalled = true\n                    local wave1Done = false\n                    if data.npDone ~= nil then\n                        for eid, dn in pairs(data.npDone) do\n                            if dn then wave1Done = true break end\n                        end\n                    end\n                    local s2, s3 = speakName(byN[2]), speakName(byN[3])\n                    local msg\n                    if wave1Done then\n                        msg = \"Move \" .. movePhrase(s2) .. \", then \" .. s3\n                    else\n                        msg = \"Then \" .. s2 .. \", then \" .. s3\n                    end\n                    data.npRouteAt = Now()\n                    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n                        AnyoneCore.Shotcall(msg, true, 8)\n                    end\n                end\n            end\n        end\n        data.npPromote = function(elem)\n            local sources = {}\n            for i = 1, #data.npOrder do\n                local eid = data.npOrder[i]\n                local s = data.npSpots[eid]\n                if s ~= nil and s.element == elem then\n                    data.npDrawFull(eid)\n                    if not data.npDone[eid] then\n                        sources[#sources + 1] = { x = s.x, z = s.z }\n                    end\n                end\n            end\n            -- Include the boss copy only when present in this set.\n            local inDC = data.npDarkCurrentUntil ~= nil and Now() < data.npDarkCurrentUntil\n            if data.npBossPos ~= nil and not inDC then\n                sources[#sources + 1] = { x = data.npBossPos.x, z = data.npBossPos.z }\n            end\n            -- Cut exact danger geometry from the flat safe overlay.\n            if #sources > 0 and data.npBossPos ~= nil\n                and ArgusDrawsPlus ~= nil and ArgusDrawsPlus.getEnabled() == true\n                and Argus2 ~= nil and Argus2.getNextUnusedChannel ~= nil\n                and TensorCore.getStaticFlatDrawer ~= nil then\n                if data.npSafeShapes ~= nil then\n                    for i = 1, #data.npSafeShapes do Argus.deleteTimedShape(data.npSafeShapes[i]) end\n                end\n                data.npSafeShapes = {}\n                local channel = data.npSafeChannel\n                if channel == nil then\n                    channel = Argus2.getNextUnusedChannel(true)\n                    if channel == nil then channel = 1 end\n                    data.npSafeChannel = channel\n                end\n                local green = 1493237504\n                local occ = Argus2.RenderFlags.FLAG_OCCLUDE\n                local hy = (data.npBossPos.y or 0) + 0.05\n                local dur = 15000\n                local ss = data.npSafeShapes\n                local base = TensorCore.getStaticFlatDrawer(green, nil, channel)\n                -- Use the true arena radius and exact AOE sizes.\n                ss[#ss + 1] = base:addTimedCircle(dur, data.npBossPos.x, hy, data.npBossPos.z, 29.5, 0, false, true, 0)\n                local cut = TensorCore.getStaticFlatDrawer(green, nil, channel)\n                for i = 1, #sources do\n                    local sx, sz = sources[i].x, sources[i].z\n                    if elem == \"fire\" then\n                        ss[#ss + 1] = cut:addTimedCircle(dur, sx, hy, sz, 18, 0, false, false, occ)\n                    elseif elem == \"ice\" then\n                        ss[#ss + 1] = cut:addTimedCenteredRect(dur, sx, hy, sz, 90, 15, 0, 0, false, false, occ)\n                        ss[#ss + 1] = cut:addTimedCenteredRect(dur, sx, hy, sz, 90, 15, math.pi / 2, 0, false, false, occ)\n                    else\n                        local diag = { math.pi / 4, 3 * math.pi / 4, -math.pi / 4, -3 * math.pi / 4 }\n                        for j = 1, 4 do\n                            ss[#ss + 1] = cut:addTimedCone(dur, sx, hy, sz, 60, math.rad(45), diag[j], 0, false, false, occ)\n                        end\n                    end\n                end\n                -- Reapply active Dark Current cuts after rebuilding.\n                if data.npExaCuts ~= nil then\n                    local nowT = Now()\n                    local keep = {}\n                    for i = 1, #data.npExaCuts do\n                        local c = data.npExaCuts[i]\n                        if c.til > nowT then\n                            keep[#keep + 1] = c\n                            local cdelay = c.showAt - nowT\n                            if cdelay < 0 then cdelay = 0 end\n                            local cdur = (c.til - nowT) - cdelay\n                            if cdur > 0 then\n                                ss[#ss + 1] = cut:addTimedCenteredRect(cdur, c.x, hy, c.z, c.l, c.w, c.h, cdelay, false, false, occ)\n                            end\n                        end\n                    end\n                    data.npExaCuts = keep\n                end\n                -- Repaint danger shapes above the cutout overlay.\n                local ch2 = data.npDangerChannel\n                if ch2 == nil then\n                    ch2 = Argus2.getNextUnusedChannel(true)\n                    if ch2 == nil then ch2 = channel + 1 end\n                    data.npDangerChannel = ch2\n                end\n                local redF = TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, 0.32), nil, ch2)\n                for i = 1, #sources do\n                    local sx, sz = sources[i].x, sources[i].z\n                    if elem == \"fire\" then\n                        ss[#ss + 1] = redF:addTimedCircle(dur, sx, hy, sz, 18, 0, false, true, 0)\n                    elseif elem == \"ice\" then\n                        ss[#ss + 1] = redF:addTimedCenteredRect(dur, sx, hy, sz, 90, 15, 0, 0, false, true, 0)\n                        ss[#ss + 1] = redF:addTimedCenteredRect(dur, sx, hy, sz, 90, 15, math.pi / 2, 0, false, true, 0)\n                    else\n                        local diag = { math.pi / 4, 3 * math.pi / 4, -math.pi / 4, -3 * math.pi / 4 }\n                        for j = 1, 4 do\n                            ss[#ss + 1] = redF:addTimedCone(dur, sx, hy, sz, 60, math.rad(45), diag[j], 0, false, true, 0)\n                        end\n                    end\n                end\n            end\n            if #sources > 0 then\n                data.npActiveElement = elem\n                data.npMoveUntil = Now() + 15000\n                data.npMoveCalled = data.npMoveCalled or {}\n                local n = data.npDotOrder ~= nil and data.npDotOrder[elem] or nil\n                -- skip the same-tick duplicate after the route call\n                local routeFresh = data.npRouteAt ~= nil and (Now() - data.npRouteAt) < 3000\n                if n ~= nil and n >= 2 and not data.npMoveCalled[elem]\n                    and data.npDotNames ~= nil and data.npDotNames[elem] ~= nil then\n                    data.npMoveCalled[elem] = true\n                    if not (n == 2 and routeFresh)\n                        and AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n                        AnyoneCore.Shotcall(\"Move \" .. movePhrase(speakName(data.npDotNames[elem])), true, 6)\n                    end\n                end\n                data.npIsSafe = function(px, pz)\n                    for i = 1, #sources do\n                        local dx = px - sources[i].x\n                        local dz = pz - sources[i].z\n                        if elem == \"fire\" then\n                            if dx * dx + dz * dz < 19 * 19 then return false end\n                        elseif elem == \"ice\" then\n                            local ax = math.abs(dx)\n                            local az = math.abs(dz)\n                            if (ax < 8.5 and az < 46) or (ax < 46 and az < 8.5) then return false end\n                        else\n                            if dx * dx + dz * dz < 61 * 61 then\n                                local ang = math.atan2(dx, dz)\n                                local best = 10\n                                local diag = { math.pi / 4, 3 * math.pi / 4, -math.pi / 4, -3 * math.pi / 4 }\n                                for j = 1, 4 do\n                                    local dd = math.abs(ang - diag[j])\n                                    if dd > math.pi then dd = 2 * math.pi - dd end\n                                    if dd < best then best = dd end\n                                end\n                                if best < math.rad(24) then return false end\n                            end\n                        end\n                    end\n                    return true\n                end\n            end\n        end\n    end\n\n    -- Resolve channels determine order; flight order does not.\n    data.npDrawMarker(a.entityID)\n    local pair, total = 0, 0\n    for eid, s in pairs(data.npSpots) do\n        total = total + 1\n        if s.element == element then pair = pair + 1 end\n    end\n    if pair >= 2 then data.npSafeDotDraw(element) end\n    -- all six down: re-solve early guesses, then pin\n    if total >= 6 then data.npRedrawDots() end\n    self.used = true\n\nelseif id == 47494 or id == 47495 or id == 47496\n    or id == 47510 or id == 47511 or id == 47512 then\n    if data.npDraws == nil then return end\n    local rec = data.npDraws[a.entityID]\n    if rec == nil then return end\n    data.npWipe(rec)\n    data.npDraws[a.entityID] = nil\n    data.npDone[a.entityID] = true\n    data.npHeads[a.entityID] = nil\n    -- Stop guidance until the next element is promoted.\n    if data.npSpots ~= nil then\n        local elem = data.npSpots[a.entityID] and data.npSpots[a.entityID].element\n        if elem ~= nil then\n            local remaining = false\n            for eid, s in pairs(data.npSpots) do\n                if s.element == elem and not data.npDone[eid] then\n                    remaining = true\n                    break\n                end\n            end\n            if not remaining then\n                if data.npWipeDot ~= nil then data.npWipeDot(elem) end\n                if data.npActiveElement == elem then\n                    data.npIsSafe = nil\n                    data.npActiveElement = nil\n                    if data.npSafeShapes ~= nil then\n                        for i = 1, #data.npSafeShapes do Argus.deleteTimedShape(data.npSafeShapes[i]) end\n                        data.npSafeShapes = nil\n                    end\n                end\n            end\n        end\n    end\n    -- Promote the next unresolved element when aura order is known.\n    if data.npAnnounceOrder ~= nil and data.npPromote ~= nil then\n        for i = 1, #data.npAnnounceOrder do\n            local e = data.npAnnounceOrder[i]\n            local unresolved = false\n            for eid, s in pairs(data.npSpots) do\n                if s.element == e and not data.npDone[eid] then\n                    unresolved = true\n                    break\n                end\n            end\n            if unresolved then\n                data.npPromote(e)\n                break\n            end\n        end\n    end\n    self.used = true\nend\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"af405de3-7144-40c5-8d6e-884e03f0a404",
								true,
							},
						},
						name = "NP - Markers + Cleanup",
						uuid = "4c7eefad-9ae8-4663-b103-34c03e91baeb",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil or a.spellID == nil then return end\nlocal id = a.spellID\nlocal SPIN = { [49648] = true, [49649] = true, [49650] = true,\n               [49651] = true, [49652] = true, [49653] = true }\nlocal FLIP = { [50431] = true, [50432] = true, [50433] = true,\n               [50434] = true, [50435] = true, [50436] = true }\nif not SPIN[id] and not FLIP[id] then return end\n-- Stamp Spin casts before any guard: the order recorder uses this to\n-- reject post-set resting poses (which land ~1s after a ring's Spin).\nif SPIN[id] then\n    data.b2SpinAt = data.b2SpinAt or {}\n    data.b2SpinAt[a.entityID] = Now()\nend\nif data.b2Rings == nil then return end\nlocal rec = data.b2Rings[a.entityID]\nif rec == nil or rec.stage == \"done\" then return end\n\nif FLIP[id] then\n    rec.stage = 2\n    data.b2RingDraw(rec, rec.second, 6000)\n    data.b2RingOverlay()\n    if data.b2RingNext ~= nil then data.b2RingNext() end\n    self.used = true\n    return\nend\n\n-- The first hit corrects an inaccurate pose record.\nlocal DONUT_IDS = { [49648] = true, [49649] = true, [49650] = true }\nif rec.hits == nil then rec.hits = 0 end\nrec.hits = rec.hits + 1\nif rec.hits == 1 then\n    local actualFirst = DONUT_IDS[id] and \"donut\" or \"chariot\"\n    if rec.first ~= actualFirst then\n        if rec.first ~= nil and not rec.assumed then\n            AnyoneCore.log(\"[B2 Cyclo] Pose order mismatch; using first-hit order.\", 5)\n        elseif rec.assumed then\n            AnyoneCore.log(\"[B2 Cyclo] Default pose mismatch; using first-hit order.\", 5)\n        end\n        rec.first = actualFirst\n    end\n    rec.assumed = nil\n    rec.second = actualFirst == \"donut\" and \"chariot\" or \"donut\"\nend\nif rec.hits >= 2 then\n    data.b2RingWipe(rec)\n    rec.stage = \"done\"\n    -- Remove the overlay after the final ring; while others remain\n    -- live (CS3 cascade), rebuild so the retired ring's danger is\n    -- dropped immediately instead of at the next flip.\n    local anyLive = false\n    for _, r in pairs(data.b2Rings) do\n        if r.stage == 1 or r.stage == 2 then anyLive = true break end\n    end\n    if not anyLive then\n        if data.b2SafeShapes ~= nil then\n            for i = 1, #data.b2SafeShapes do Argus.deleteTimedShape(data.b2SafeShapes[i]) end\n            data.b2SafeShapes = nil\n        end\n        if data.b2NextShapes ~= nil then\n            for i = 1, #data.b2NextShapes do Argus.deleteTimedShape(data.b2NextShapes[i]) end\n            data.b2NextShapes = nil\n        end\n        if data.b2NextText ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n            AnyoneCore.removeTimedWorldText(data.b2NextText)\n            data.b2NextText = nil\n        end\n    else\n        data.b2RingOverlay()\n        if data.b2RingNext ~= nil then data.b2RingNext() end\n    end\nelse\n    -- First hit resolved: advance to stage 2 NOW (the flip cast\n    -- ~1.45s later redraws idempotently) so the ring's danger and\n    -- the overlay pocket roll flush with the hit - in the CS3\n    -- cascade the next beat's pocket must be correct immediately.\n    rec.stage = 2\n    data.b2RingDraw(rec, rec.second, 6000)\n    data.b2RingOverlay()\n    if data.b2RingNext ~= nil then data.b2RingNext() end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0002-4b2b-9c02-b2c1c105a002",
								true,
							},
						},
						name = "B2 - Cycloswords Flip",
						uuid = "1a2b3c4d-0005-4b2b-9c05-b2c1c105a005",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID == nil or a.entityID == nil then return end\nlocal id = a.spellID\nif id ~= 47714 and id ~= 47715 then return end\nlocal bd = data.b1Duet\nif bd == nil or bd.wm == nil then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil then return end\n\n-- Group paired waves by arrival time.\nif bd.waveBeat == nil or TimeSince(bd.waveAt or 0) > 1800 then\n    bd.waveBeat = (bd.waveBeat or 0) + 1\n    bd.cur = {}\n    -- No circle prediction here: guides are mid-walk at wave-cast\n    -- time, so a single poll reads the quad being left. The spot is\n    -- not knowable before the 47651/47652 create; the truth spec\n    -- draws it at ~1.5s lead.\nend\nbd.waveAt = Now()\n-- The caster's edge determines the lane axis.\nif math.abs(ent.pos.z - bd.cz) > math.abs(ent.pos.x - bd.cx) then\n    bd.cur.col = ent.pos.x\nelse\n    bd.cur.row = ent.pos.z\nend\nif bd.cur.row == nil or bd.cur.col == nil then\n    self.used = true\n    return\nend\nlocal safeX = bd.cur.col < bd.cx and bd.cx + 10 or bd.cx - 10\nlocal safeZ = bd.cur.row < bd.cz and bd.cz + 10 or bd.cz - 10\nlocal q = bd.quadOf(safeX, safeZ)\nbd.beats[bd.waveBeat] = q\n\nif bd.waveBeat == 1 then\n    if bd.safe1q ~= nil and q ~= bd.safe1q then\n        AnyoneCore.log(\"[Breathy Duet] Marker and wave positions differ; using wave position.\", 5)\n    end\nelseif bd.waveBeat == 2 and bd.committed == nil and bd.beats[1] ~= nil then\n    bd.committed = true\n    if bd.chain ~= nil then\n        -- Validate the route that was committed from quad ticks.\n        if bd.chain[2] ~= q then\n            AnyoneCore.log(\"[Breathy Duet] Route changed; rebuilding from wave positions.\", 5)\n            bd.chain = nil -- Rebuild from the observed waves.\n        else\n            self.used = true\n            return\n        end\n    end\n    -- Quadrants are numbered clockwise from NW.\n    local step = (q - bd.beats[1]) % 4\n    local dir = step == 1 and 1 or -1\n    local chain = { bd.beats[1], q }\n    for k = 3, 4 do\n        chain[k] = ((chain[k - 1] - 1 + dir) % 4) + 1\n    end\n    local y = bd.y or ent.pos.y\n    -- The committed route was wrong: the scheduled danger lanes are too.\n    if bd.laneUuids ~= nil and Argus ~= nil and Argus.deleteTimedShape ~= nil then\n        for _, uid in ipairs(bd.laneUuids) do Argus.deleteTimedShape(uid) end\n    end\n    bd.laneUuids = {}\n    -- Redraw beats 3-4 directly with delayed timed draws (beat 2 is\n    -- firing right now - too late to draw). No pump.\n    local red = TensorCore.getMoogleDrawer()\n    for k = 3, 4 do\n        local q2 = chain[k]\n        local sxs = (q2 == 1 or q2 == 4) and -1 or 1\n        local szs = (q2 == 1 or q2 == 2) and -1 or 1\n        -- Wave 2's cast event IS beat 2's hit; beat k hits (k-2)\n        -- beats later. Flush window ending exactly at the hit.\n        local hitK = Now() + (k - 2) * 3650\n        local at = hitK - 3650\n        if at < Now() then at = Now() end\n        local dur = hitK - at\n        local delay = at - Now()\n        bd.laneUuids[#bd.laneUuids + 1] = red:addTimedCone(dur, bd.cx + sxs * 20, y, bd.cz - szs * 10, 45, math.rad(53), (sxs == 1) and -1.5708 or 1.5708, delay)\n        bd.laneUuids[#bd.laneUuids + 1] = red:addTimedCone(dur, bd.cx - sxs * 10, y, bd.cz - szs * 20, 45, math.rad(53), (szs == 1) and 0.0 or 3.1416, delay)\n        -- Chasing circles come from the 47651/47652 creates, not here.\n    end\n    local green = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.1, 1.0, 0.25, 0.7), 2)\n    for k = 2, 4 do\n        local p = bd.wm[chain[k]]\n        local dur = 1500 + (k - 2) * 3650 + 2000\n        green:addTimedCircle(dur, p.x, y, p.z, 2)\n        if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n            -- Labels show visit order.\n            AnyoneCore.addTimedWorldText(dur, tostring(k), { x = p.x, y = y + 1.5, z = p.z }, GUI:ColorConvertFloat4ToU32(0.3, 1.0, 0.4, 1.0), true, 1.4)\n        end\n    end\n    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n        AnyoneCore.Shotcall(dir == 1 and \"Rotate clockwise\" or \"Rotate counterclockwise\", true, 6)\n    end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-001e-4b2b-9c1e-b2c1c105a01e",
								true,
							},
						},
						name = "B1 - Breathy Duet Waves",
						uuid = "1a2b3c4d-001f-4b2b-9c1f-b2c1c105a01f",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID == nil then return end\n-- Advance the NEXT markers when a weapon resolves.\nlocal RES = { [48912] = true, [48913] = true, [48914] = true, [48915] = true }\nif RES[a.spellID] then\n    local st = data.idxQuad\n    if st ~= nil and st.order ~= nil and data.idxWeaponStage ~= nil then\n        if data.idxFireAt == nil or TimeSince(data.idxFireAt) > 1500 then\n            data.idxFireAt = Now()\n            st.fireN = (st.fireN or 0) + 1\n            data.idxWeaponStage(st.order[st.fireN + 1], 3600)\n        end\n    end\n    self.used = true\n    return\nend\nlocal M = {\n    [50363] = \"Between platforms now\",\n    [50364] = \"On platforms now\",\n    [48911] = \"Get in now\",\n    [48910] = \"Out of middle now\",\n    -- The standalone harp draw is handled by the phase announcer.\n    [48384] = \"Out of middle now\",\n}\nlocal msg = M[a.spellID]\nif msg == nil then return end\nif data.idxWindCalled ~= nil and TimeSince(data.idxWindCalled) < 1500 then return end\ndata.idxWindCalled = Now()\nif AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n    AnyoneCore.Shotcall(msg, true, 4)\nend\n-- Redraw Quadrilogy danger shapes at the windup.\nlocal WD = { [50363] = \"SWORD\", [50364] = \"BELL\", [48911] = \"BOW\", [48910] = \"HARP\" }\nlocal wpn = WD[a.spellID]\nif wpn ~= nil and data.idxWeaponDraw ~= nil then\n    data.idxWeaponDraw(wpn, 2600)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0012-4b2b-9c12-b2c1c105a012",
								true,
							},
						},
						name = "B4 - Weapon Windups",
						uuid = "1a2b3c4d-0026-4b2b-9c26-b2c1c105a026",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or (a.spellID ~= 48404 and a.spellID ~= 48405) then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil then return end\n\n-- Anchor once because the channel event repeats every frame.\nif a.spellID == 48405 then\n    if a.channelTimeMax ~= nil and data.idxKbUntil ~= nil and Now() < data.idxKbUntil\n        and (data.idxKbLanceAt == nil or TimeSince(data.idxKbLanceAt) > 10000) then\n        data.idxKbLanceAt = Now()\n        local hitAt = Now() + math.floor(a.channelTimeMax * 1000) + 250\n        data.idxKbAt = hitAt\n        data.idxKbUntil = hitAt + 1200\n    end\n    self.used = true\n    return\nend\n\nif data.idxKbUntil == nil or Now() > data.idxKbUntil then\n    data.idxKbSrcs = {}\n    data.idxKbAt = Now() + 6100\n    data.idxKbUntil = Now() + 8500\nend\nlocal s = data.idxKbSrcs\ns[#s + 1] = { x = ent.pos.x, y = ent.pos.y, z = ent.pos.z }\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0024-4b2b-9c24-b2c1c105a024",
								true,
							},
						},
						name = "B4 - Propulsive KB",
						uuid = "1a2b3c4d-0027-4b2b-9c27-b2c1c105a027",
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
						localmapid = 1346,
						name = "North Horn",
						uuid = "d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
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
						eventSpellID = 49660,
						name = "Steelsbreath/Steelsforge",
						spellIDList = 
						{
							49660,
							50360,
							49661,
							49687,
						},
						uuid = "8d2e3bc1-5f22-4ea3-ab4c-662cf1d8e202",
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
						eventSpellID = 47489,
						name = "Flight/Resolve Casts",
						spellIDList = 
						{
							47489,
							47494,
							47495,
							47496,
							47510,
							47511,
							47512,
						},
						uuid = "af405de3-7144-40c5-8d6e-884e03f0a404",
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
						eventSpellID = 49648,
						name = "Cycloswords Spin/Flip",
						spellIDList = 
						{
							49648,
							49649,
							49650,
							49651,
							49652,
							49653,
							50431,
							50432,
							50433,
							50434,
							50435,
							50436,
						},
						uuid = "1a2b3c4d-0002-4b2b-9c02-b2c1c105a002",
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
						eventSpellID = 47714,
						name = "Duet Waves",
						spellIDList = 
						{
							47714,
							47715,
						},
						uuid = "1a2b3c4d-001e-4b2b-9c1e-b2c1c105a01e",
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
						eventSpellID = 48910,
						name = "Index Weapon Windup Casts",
						spellIDList = 
						{
							48910,
							48911,
							50363,
							50364,
							48384,
							48386,
							48912,
							48913,
							48914,
							48915,
						},
						uuid = "1a2b3c4d-0012-4b2b-9c12-b2c1c105a012",
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
						eventSpellID = 48404,
						name = "Index Clone Jumps",
						spellIDList = 
						{
							48404,
						},
						uuid = "1a2b3c4d-0024-4b2b-9c24-b2c1c105a024",
						version = 3,
					},
				},
			},
			eventType = 2,
			loop = true,
			name = "[FTM] Casts",
			uuid = "ab122f2b-31f1-4577-be22-495fc181d860",
			version = 2,
		},
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil or a.spellID == nil then return end\nlocal id = a.spellID\nif id == 47507 then\n    -- Severed Dark Current has no boss-centered element copy.\n    data.npDarkCurrentUntil = Now() + 45000\n    -- Safe dots solved at dive time included the boss copy; re-solve.\n    if data.npRedrawDots ~= nil then data.npRedrawDots() end\n    self.used = true\n    return\nend\nif data.npPromote == nil then return end\n\nlocal element\nif id == 47490 then\n    element = \"fire\"\nelseif id == 47491 then\n    element = \"ice\"\nelseif id == 47492 or id == 50358 then\n    element = \"thunder\"\nelseif id == 47494 or id == 47495 or id == 47496\n    or id == 47510 or id == 47511 or id == 47512 then\n    if data.npHeads ~= nil then element = data.npHeads[a.entityID] end\nend\nif element == nil then return end\n-- Stamp fallback: aura events can be lossy; the resolve channel is truth.\nif data.npStampDot ~= nil then\n    local n = 1\n    if data.npDotOrder ~= nil then\n        for _, v in pairs(data.npDotOrder) do\n            if v ~= nil then n = n + 1 end\n        end\n    end\n    if n <= 3 then data.npStampDot(element, n) end\nend\ndata.npPromote(element)\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"b0516ef4-8255-4bd6-9e7f-995fa4a1b505",
								true,
							},
						},
						name = "NP - Promote On Severed/Ancient",
						uuid = "c1e40c22-8a75-4b7c-9f02-6b3d9f5e8a12",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID ~= 47507 or a.channelTimeMax == nil then return end\n-- Anchor once because the channel event repeats every frame.\nif data.npDCPredrawAt ~= nil and TimeSince(data.npDCPredrawAt) < 60000 then return end\ndata.npDCPredrawAt = Now()\nlocal boss = TensorCore.mGetEntity(a.entityID)\nlocal y = (boss ~= nil and boss.pos ~= nil and boss.pos.y) or -724.0\nlocal cx, cz = 100.0, 800.0\nlocal thin = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.75, 0.3, 1.0, 0.30), 2)\nlocal danger = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.75, 0.3, 1.0, 0.45), 1)\n-- Persist cuts so safe-overlay rebuilds retain Dark Current lanes.\nif data.npExaCarve == nil then\n    data.npExaCarve = function(cx2, cz2, len, wid, hh, delayMs, durMs)\n        data.npExaCuts = data.npExaCuts or {}\n        data.npExaCuts[#data.npExaCuts + 1] = { x = cx2, z = cz2, l = len, w = wid, h = hh,\n            showAt = Now() + delayMs, til = Now() + delayMs + durMs }\n        if data.npSafeShapes ~= nil and data.npSafeChannel ~= nil\n            and Argus2 ~= nil and Argus2.RenderFlags ~= nil\n            and TensorCore.getStaticFlatDrawer ~= nil then\n            local cut = TensorCore.getStaticFlatDrawer(1493237504, nil, data.npSafeChannel)\n            local hy2 = (data.npBossPos ~= nil and data.npBossPos.y or -724.0) + 0.05\n            data.npSafeShapes[#data.npSafeShapes + 1] = cut:addTimedCenteredRect(durMs, cx2, hy2, cz2, len, wid, hh, delayMs, false, false, Argus2.RenderFlags.FLAG_OCCLUDE)\n        end\n    end\nend\nfor k = 0, 2 do\n    local h = math.pi - k * (2 * math.pi / 3)\n    local impact = 10600 + k * 6600\n    thin:addTimedCenteredRect(2500, cx, y, cz, 60, 10, h, impact - 4500)\n    danger:addTimedCenteredRect(2000, cx, y, cz, 60, 10, h, impact - 2000)\n    data.npExaCarve(cx, cz, 60, 10, h, impact - 4500, 4500)\n    if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n        local lp = TensorCore.getPosInDirection({ x = cx, y = y, z = cz }, h, 25)\n        if lp ~= nil then\n            AnyoneCore.addTimedWorldText(impact, tostring(k + 1), { x = lp.x, y = y + 1.5, z = lp.z }, GUI:ColorConvertFloat4ToU32(0.85, 0.5, 1.0, 1.0), true, 1.5)\n        end\n    end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0035-4b2b-9c35-b2c1c105a035",
								true,
							},
						},
						name = "NP - DC Aim Armer (set open)",
						uuid = "1a2b3c4d-0036-4b2b-9c36-b2c1c105a036",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID ~= 47514 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil or ent.contentid ~= 14503 then return end\ndata.npFgActive = Now()\ndata.npFgCenter = { x = ent.pos.x, y = ent.pos.y, z = ent.pos.z }\ndata.npFgVolleys = nil\ndata.npFgFirstAura = nil\ndata.npFgLastAura = nil\ndata.npFgVolleyList = nil\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"d1f83b62-4a09-4c75-8e2b-06b5c9d47a18",
								true,
							},
						},
						name = "NP - FG Start",
						uuid = "7a05e8d1-93c4-4f62-b8a7-2e51d0c96f33",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID == nil then return end\nlocal id = a.spellID\n-- Later-boss triggers support mid-run reloads.\nif id ~= 49726 and id ~= 47632 and id ~= 50717 and id ~= 49619 and id ~= 49646 and id ~= 47507 and id ~= 48407 and id ~= 48403 then return end\nif data.b1MoogleInit == true then\n    self.used = true\n    return\nend\nif MoogleTelegraphs == nil or MoogleTelegraphs.Settings == nil then\n    AnyoneCore.log(\"[Aevis Overrides] MoogleTelegraphs unavailable\", 5)\n    self.used = true\n    return\nend\ndata.b1MoogleInit = true\nlocal S = MoogleTelegraphs.Settings\nlocal src = \"FTM B1 - Occult Reactions\"\nif S.aoeIDUserSetDonuts ~= nil then\n    S.aoeIDUserSetDonuts[47640] = { name = \"Fulgurous Fugue\", radius = 18, source = src } -- inner radius\n    S.aoeIDUserSetDonuts[47686] = { name = \"Blazeloop\", radius = 5, source = src }\n    -- Cycloswords uses the paired chariot radius.\n    S.aoeIDUserSetDonuts[49648] = { name = \"Cyclo Spin donut (small ring)\", radius = 10, source = src }\n    S.aoeIDUserSetDonuts[49649] = { name = \"Cyclo Spin donut (mid ring)\", radius = 15, source = src }\n    S.aoeIDUserSetDonuts[49650] = { name = \"Cyclo Spin donut (large ring)\", radius = 20, source = src }\nend\n-- Replace the Storm's Breath wash with the landing guide.\nS.aoeIDUserBlacklist[47638] = \"Storm's Breath KB (Aevis) - \" .. src\n-- 48245 is the full-arena knockback circle.\nS.aoeIDUserBlacklist[48245] = \"Storm's Breath arena wash (Aevis) - \" .. src\n-- Redraw AR2 shapes sequentially.\nS.aoeIDUserBlacklist[50728] = \"Freezing Fugue AR2 (Aevis) - \" .. src\nS.aoeIDUserBlacklist[47629] = \"Fulgurous Fugue AR2 (Aevis) - \" .. src\n-- Mirror configuration uses the same shapes in reverse order.\nS.aoeIDUserBlacklist[47630] = \"Freezing Fugue AR2 cfgY (Aevis) - \" .. src\nS.aoeIDUserBlacklist[50727] = \"Fulgurous Fugue AR2 cfgY (Aevis) - \" .. src\n-- Dark Current is fully custom-drawn.\nS.aoeIDUserBlacklist[47500] = \"Dark Current initial (Necrophobia) - \" .. src\nS.aoeIDUserBlacklist[47501] = \"Dark Current slab (Necrophobia) - \" .. src\nS.aoeIDUserBlacklist[47509] = \"Severed Dark Current line (Necrophobia) - \" .. src\n-- Suppress duplicate Propulsive Shockwave circles.\nS.aoeIDUserBlacklist[48447] = \"Propulsive Shockwave circles (Index) - \" .. src\n-- Breathy Duet cluster circles are custom-drawn from the marker spots.\nS.aoeIDUserBlacklist[47649] = \"Duet Lightning Cluster tick (Aevis) - \" .. src\nS.aoeIDUserBlacklist[47650] = \"Duet Ice Cluster tick (Aevis) - \" .. src\nS.aoeIDUserBlacklist[50699] = \"Duet Lightning Cluster marker (Aevis) - \" .. src\nS.aoeIDUserBlacklist[50700] = \"Duet Ice Cluster marker (Aevis) - \" .. src\nS.aoeIDUserBlacklist[50701] = \"Duet Lightning Cluster resolve (Aevis) - \" .. src\nS.aoeIDUserBlacklist[50702] = \"Duet Ice Cluster resolve (Aevis) - \" .. src\nif S.aoeIDUserSetCircles ~= nil then\n    S.aoeIDUserSetCircles[47639] = { name = \"Poison Breath\", radius = 18, source = src } -- payload aoeLength=18\n    S.aoeIDUserSetCircles[47641] = { name = \"Freezing Fugue\", radius = 20, source = src } -- payload aoeLength=20\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"a7d20f36-4b18-4c95-8e63-17f5b0d29a44",
								true,
							},
						},
						name = "B1 - Aevis Moogle Overrides",
						uuid = "6c39e1a8-72d5-4f04-b9c6-08a4e5d31f77",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID == nil or a.entityID == nil then return end\nlocal id = a.spellID\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil then return end\nlocal cid = ent.contentid\nif cid ~= 14490 and cid ~= 14491 then return end\n\n-- Filter before updating the set clock.\nlocal ORDERS = {\n    [47671] = { \"plus\", \"plus\" },  -- \"Crossblaze and Repeat\"\n    [47675] = { \"plus\", \"plus\" },  -- \"Crossblaze and Repeat\"\n    [47672] = { \"ring\", \"ring\" },  -- \"Blazeloop and Repeat\"\n    [47676] = { \"ring\", \"ring\" },  -- \"Blazeloop and Repeat\"\n    [47673] = { \"plus\", \"ring\" },  -- \"Crossblaze, Blazeloop\"\n    [47677] = { \"plus\", \"ring\" },  -- \"Crossblaze, Blazeloop\"\n    [47674] = { \"ring\", \"plus\" },  -- \"Blazeloop, Crossblaze\"\n    [47678] = { \"ring\", \"plus\" },  -- \"Blazeloop, Crossblaze\"\n}\nlocal isAnnounce = ORDERS[id] ~= nil\nlocal isHeadTick = (id == 47683 or id == 47684)\nlocal isHelper = (id == 50706 or id == 50707 or id == 50708)\nlocal STEP_SHAPE = { [47685] = \"plus\", [47687] = \"plus\", [47686] = \"ring\", [47688] = \"ring\" }\nlocal isStep = STEP_SHAPE[id] ~= nil\nif not isAnnounce and not isHeadTick and not isHelper and not isStep then return end\n\n-- Step channels replace pending labels and may repeat on head copies.\nif isStep then\n    local st = data.b1Blaze and data.b1Blaze[cid]\n    if st ~= nil and st.pend ~= nil then\n        st.lastStep = st.lastStep or {}\n        if st.lastStep[id] ~= nil and TimeSince(st.lastStep[id]) < 1500 then\n            self.used = true\n            return\n        end\n        st.lastStep[id] = Now()\n        for k = 1, 2 do\n            local p = st.pend[k]\n            if p ~= nil and p.unknown then\n                if p.uuid ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n                    AnyoneCore.removeTimedWorldText(p.uuid)\n                end\n                local ms = ((a.channelTimeMax or 2) + 1) * 1000\n                local label = tostring(p.seq) .. (STEP_SHAPE[id] == \"ring\" and \" IN\" or \" OUT\")\n                if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n                    AnyoneCore.addTimedWorldText(ms, label, { x = p.x, y = p.y + 2.0, z = p.z }, GUI:ColorConvertFloat4ToU32(1, 1, 1, 1), true, 1.4)\n                end\n                p.unknown = false\n                break\n            end\n        end\n    end\n    self.used = true\n    return\nend\n\n-- Head IDs persist between sets but change between pulls.\nlocal newSet = data.b1BlazeSetAt == nil or TimeSince(data.b1BlazeSetAt) > 60000\nif newSet then\n    data.b1BlazeEids = data.b1BlazeEids or {}\n    local samePull\n    if isHelper then\n        samePull = data.b1BlazeSetAt ~= nil and TimeSince(data.b1BlazeSetAt) < 240000\n    else\n        samePull = data.b1BlazeEids[a.entityID] == true\n    end\n    if samePull then\n        data.b1BlazeSetN = (data.b1BlazeSetN or 0) + 1\n    else\n        data.b1BlazeSetN = 1\n        data.b1BlazeEids = {}\n    end\n    data.b1BlazeSeq = 0\n    data.b1BlazeHits = {}\n    data.b1Blaze = {}\nend\ndata.b1BlazeSetAt = Now()\nif not isHelper then\n    data.b1BlazeEids = data.b1BlazeEids or {}\n    data.b1BlazeEids[a.entityID] = true\nend\ndata.b1Blaze = data.b1Blaze or {}\nif isHeadTick then\n    self.used = true\n    return\nend\n\nif isAnnounce then\n    local order = ORDERS[id]\n    local st = data.b1Blaze[cid]\n    if st ~= nil and st.step > 0 then\n        -- Preserve a step already consumed by a same-batch helper.\n        st.order = order\n    else\n        data.b1Blaze[cid] = { order = order, step = 0 }\n    end\n    -- Noise buffs are polled during this window.\n    data.b1NoiseUntil = Now() + 45000\n    self.used = true\n    return\nend\n\nlocal st = data.b1Blaze[cid]\nif st == nil then\n    -- Step channels replace unknown announce patterns.\n    st = { order = nil, step = 0 }\n    data.b1Blaze[cid] = st\n    AnyoneCore.log(\"[Aevis Blaze] Announce order unavailable; awaiting step channels.\", 5)\n    data.b1NoiseUntil = Now() + 45000\nend\nst.step = st.step + 1\nif st.step > 2 then\n    self.used = true\n    return\nend\nlocal shape = st.order ~= nil and st.order[st.step] or nil\nlocal ms = (a.channelTimeMax or 5) * 1000\nlocal p = ent.pos\n\n-- Record the hit schedule (predicted time + global blaze number) for\n-- the Noise knockback timer and its \"after N\" call.\ndata.b1BlazeSeq = (data.b1BlazeSeq or 0) + 1\ndata.b1BlazeHits = data.b1BlazeHits or {}\ndata.b1BlazeHits[cid] = data.b1BlazeHits[cid] or {}\nlocal hl = data.b1BlazeHits[cid]\nhl[#hl + 1] = { t = Now() + ms, seq = data.b1BlazeSeq }\nlocal label\nif shape ~= nil then\n    label = tostring(data.b1BlazeSeq) .. (shape == \"ring\" and \" IN\" or \" OUT\")\nelse\n    label = tostring(data.b1BlazeSeq) .. \" ?\"\nend\nlocal uuid\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n    uuid = AnyoneCore.addTimedWorldText(ms, label, { x = p.x, y = p.y + 2.0, z = p.z }, GUI:ColorConvertFloat4ToU32(1, 1, 1, 1), true, 1.4)\nend\nst.pend = st.pend or {}\nst.pend[st.step] = { uuid = uuid, x = p.x, y = p.y, z = p.z,\n                     seq = data.b1BlazeSeq, unknown = shape == nil }\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"b8e41c27-5d09-4a86-9f72-28c6d1e40b55",
								true,
							},
						},
						name = "B1 - Blaze Sequence",
						uuid = "4f82d0b3-6e17-4c58-a29d-73b5f4e08c66",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID ~= 47631 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.contentid ~= 14490 then return end\ndata.b1StormUntil = Now() + (a.channelTimeMax or 8.7) * 1000\ndata.b1StormOrigin = { x = -900, z = 700 }\nif AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n    AnyoneCore.Shotcall(\"Knockback\", true, 5)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"c9f52d38-6e10-4b97-a083-39d7e2f51c66",
								true,
							},
						},
						name = "B1 - Storm Breath Start",
						uuid = "5a94f1c2-8027-4d69-b2a5-51f9e4b73e88",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID ~= 47702 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil then return end\nlocal glow = ent.contentid\nif glow ~= 14490 and glow ~= 14491 then return end\nlocal fontCid = glow == 14490 and 14497 or 14498\nlocal fonts = data.b1Fonts and data.b1Fonts[fontCid]\nif fonts == nil or #fonts == 0 then\n    AnyoneCore.log(\"[Aevis Terrors] Font positions unavailable for \" .. tostring(fontCid) .. \".\", 5)\n    self.used = true\n    return\nend\nlocal ms = (a.channelTimeMax or 6.7) * 1000\nlocal danger = TensorCore.getMoogleDrawer()\nfor i = 1, #fonts do\n    local f = fonts[i]\n    danger:addTimedCenteredRect(ms, f.x, f.y, f.z, 60, 5, f.h)\nend\nif AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n    AnyoneCore.Shotcall(glow == 14490 and \"Green glowing\" or \"Blue glowing\", true, 6)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"f2c85a61-9143-4ec0-d3b6-62a0b5c84f99",
								true,
							},
						},
						name = "B1 - Two Terrors",
						uuid = "03d96b72-a254-4fd1-84c7-73b1c6d95a00",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID ~= 47646 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or (ent.contentid ~= 14490 and ent.contentid ~= 14491) then return end\n-- The solver can also initialize from Cluster AOEs.\nif data.b1Duet == nil or (data.b1Duet.t0 ~= nil and TimeSince(data.b1Duet.t0) > 30000) then\n    data.b1Duet = { t0 = Now(), hits = {}, beats = 1, solved = false }\nend\nif not data.b1Duet.solved then\n    data.b1Duet.hit1 = Now() + (a.channelTimeMax or 16.7) * 1000\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"36ac9da5-d587-4c24-b7fa-a6e4f90c8d33",
								true,
							},
						},
						name = "B1 - Breathy Duet Start",
						uuid = "58ce1fc7-f709-4e46-d91c-c806b12e0f55",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID == nil or a.entityID == nil then return end\nlocal id = a.spellID\nif id ~= 50699 and id ~= 50700 and id ~= 47653 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil then return end\n\nif data.b1Duet == nil or (data.b1Duet.t0 ~= nil and TimeSince(data.b1Duet.t0) > 40000) then\n    data.b1Duet = { t0 = Now(), beats = {}, waveN = 0, ticks = {}, tickN = 0 }\nend\nlocal bd = data.b1Duet\n\n-- Quad ticks disambiguate the mirrored route.\nif id == 47653 then\n    -- Channel events re-deliver every frame for a tick's full 2.7s;\n    -- batches sit 4.1s apart, so the silent gap is only ~1.4s. The\n    -- batch threshold must sit between the frame interval and that gap.\n    if TimeSince(bd.tickAt or 0) > 700 then\n        bd.tickN = bd.tickN + 1\n        bd.ticks[bd.tickN] = {}\n    end\n    bd.tickAt = Now()\n    -- The waves spec polls these guides' live positions; the last\n    -- batch's spots are where the chasing cluster circles land.\n    bd.guideIds = bd.guideIds or {}\n    bd.guideIds[a.entityID] = true\n    bd.tickPos = bd.tickPos or {}\n    bd.tickPos[bd.tickN] = bd.tickPos[bd.tickN] or {}\n    local tp = bd.tickPos[bd.tickN]\n    local dup = false\n    for i = 1, #tp do\n        if math.abs(tp[i].x - ent.pos.x) < 1 and math.abs(tp[i].z - ent.pos.z) < 1 then dup = true end\n    end\n    if not dup then tp[#tp + 1] = { x = ent.pos.x, z = ent.pos.z } end\n    -- Chasing volleys track the guides' live positions and vary per\n    -- instance; exact circles come from the 47651/47652 creates\n    -- (aevis-duet-cluster-truth spec, ~1.5s lead).\n    local cx, cz = -900.0, 700.0\n    local q\n    if ent.pos.x < cx then q = ent.pos.z < cz and 1 or 4\n    else q = ent.pos.z < cz and 2 or 3 end\n    bd.ticks[bd.tickN][q] = true\n    -- Guide walk: start quad + one consistent rotation direction fully\n    -- determine every later step; chasing circle volley j fires at\n    -- each guide's step-(j+1) quad.\n    bd.guideWalk = bd.guideWalk or {}\n    local g = bd.guideWalk[a.entityID]\n    if g == nil then\n        bd.guideWalk[a.entityID] = { start = q, last = q }\n    elseif g.last ~= q then\n        local delta = (q - g.last) % 4\n        if delta == 1 then g.dir = 1 elseif delta == 3 then g.dir = -1 end\n        g.last = q\n    end\n\n    if bd.chain == nil and bd.safe1q ~= nil and bd.tickN >= 3 then\n        local valid = {}\n        for _, dir in ipairs({ 1, -1 }) do\n            local c = { bd.safe1q }\n            local ok = true\n            for k = 2, 4 do c[k] = ((c[k - 1] - 1 + dir) % 4) + 1 end\n            for k = 1, math.min(4, bd.tickN) do\n                if bd.ticks[k] ~= nil and bd.ticks[k][c[k]] then ok = false break end\n            end\n            if ok then valid[#valid + 1] = { chain = c, dir = dir } end\n        end\n        if #valid == 1 then\n            bd.chain = valid[1].chain\n            local y = bd.y or ent.pos.y\n            -- The wave cast event IS the hit; circle volley j pops\n            -- with cone beat j+1.\n            local hit1 = (bd.markerAt or Now()) + 17450\n            local green = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.1, 1.0, 0.25, 0.7), 2)\n            for k = 2, 4 do\n                local p = bd.wm[bd.chain[k]]\n                local dur = hit1 + (k - 1) * 3650 + 1200 - Now()\n                if dur > 0 then\n                    green:addTimedCircle(dur, p.x, y, p.z, 2)\n                    if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n                        -- Labels show visit order, not waymark numbers.\n                        AnyoneCore.addTimedWorldText(dur, tostring(k), { x = p.x, y = y + 1.5, z = p.z }, GUI:ColorConvertFloat4ToU32(0.3, 1.0, 0.4, 1.0), true, 1.4)\n                    end\n                end\n            end\n            if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n                AnyoneCore.Shotcall(valid[1].dir == 1 and \"Rotate clockwise\" or \"Rotate counterclockwise\", true, 6)\n            end\n            -- Wave casts are instant with no AOE payload - these cones\n            -- are the only telegraph. Column shooter fires from the\n            -- double-kill corner (diagonal to safe), row shooter from\n            -- the safe quad's x side. Beats 2-4 queue as direct timed\n            -- draws one beat ahead (no OnFrame pump); beats 2-3 also\n            -- get the chasing cluster circles at the guides' parked\n            -- spots.\n            local LEAD = 3650\n            bd.hit1 = hit1\n            local red = TensorCore.getMoogleDrawer()\n            for k = 2, 4 do\n                local q2 = bd.chain[k]\n                local sxs = (q2 == 1 or q2 == 4) and -1 or 1\n                local szs = (q2 == 1 or q2 == 2) and -1 or 1\n                local hitK = hit1 + (k - 1) * 3650\n                local at = hitK - LEAD\n                if at < Now() then at = Now() end\n                -- End exactly at the hit - no linger.\n                local dur = hitK - at\n                local delay = at - Now()\n                if dur > 1000 then\n                    bd.laneUuids[#bd.laneUuids + 1] = red:addTimedCone(dur, bd.cx + sxs * 20, y, bd.cz - szs * 10, 45, math.rad(53), (sxs == 1) and -1.5708 or 1.5708, delay)\n                    bd.laneUuids[#bd.laneUuids + 1] = red:addTimedCone(dur, bd.cx - sxs * 10, y, bd.cz - szs * 20, 45, math.rad(53), (szs == 1) and 0.0 or 3.1416, delay)\n                    -- Chasing circle volleys are scheduled below from\n                    -- the guide-walk rule, not per beat here.\n                end\n            end\n            -- Chasing circles: volley j (pops with beat j+1) fires at\n            -- each guide's step-(j+1) quad = start rotated dir*j. The\n            -- create-truth spec audits and corrects with a loud log.\n            local QX = { [1] = -10, [2] = 10, [3] = 10, [4] = -10 }\n            local QZ = { [1] = -10, [2] = -10, [3] = 10, [4] = 10 }\n            bd.predC = {}\n            for gid, g in pairs(bd.guideWalk or {}) do\n                if g.dir == nil then\n                    AnyoneCore.log(\"[Breathy Duet] Guide direction unknown - circle prediction skipped for one guide.\", 5)\n                else\n                    for j = 1, 3 do\n                        local qv = ((g.start - 1 + g.dir * j) % 4) + 1\n                        local vat = hit1 + (j - 1) * 3650\n                        local vdelay = vat - Now()\n                        if vdelay < 0 then vdelay = 0 end\n                        local vx, vz = bd.cx + QX[qv], bd.cz + QZ[qv]\n                        -- Die at the visible pop (~1.25s before beat j+1's hit).\n                        local uid = red:addTimedCircle(2400, vx, y, vz, 15, vdelay)\n                        bd.laneUuids[#bd.laneUuids + 1] = uid\n                        bd.predC[j] = bd.predC[j] or {}\n                        local pj = bd.predC[j]\n                        pj[#pj + 1] = { x = vx, z = vz, uuid = uid }\n                    end\n                end\n            end\n        end\n    end\n    self.used = true\n    return\nend\n-- Markers sit around the fixed arena center (-900, 700).\nbd.cx, bd.cz = -900.0, 700.0\n-- Fall back to ice=row if shooter spawns were missed.\nlocal iceAxis\nif data.b1DuetAxis ~= nil and TimeSince(data.b1DuetAxis.at or 0) < 40000 then\n    iceAxis = data.b1DuetAxis.ice\nend\nif iceAxis == nil then\n    if AnyoneCore ~= nil and AnyoneCore.log ~= nil then\n        AnyoneCore.log(\"[Breathy Duet] Shooter axes unavailable; using fallback orientation.\", 5)\n    end\n    iceAxis = \"row\"\nend\n-- Ground-targeted channel: the marked spot is in the payload, NOT the\n-- caster head's position (heads park north-center - live mGetEntity\n-- would misclassify south-row instances).\nlocal gx = a.castPosX or ent.pos.x\nlocal gz = a.castPosZ or ent.pos.z\nbd.mkSpots = bd.mkSpots or {}\nbd.mkSpots[#bd.mkSpots + 1] = { x = gx, z = gz }\nif id == 50700 then\n    if iceAxis == \"col\" then bd.laneCol = gx else bd.laneRow = gz end\nelse\n    if iceAxis == \"col\" then bd.laneRow = gz else bd.laneCol = gx end\nend\nif bd.called == nil and bd.laneRow ~= nil and bd.laneCol ~= nil then\n    bd.called = true\n    bd.markerAt = Now()\n    -- The safe quadrant is diagonal to the two active lanes.\n    local safeX = bd.laneCol < bd.cx and bd.cx + 10 or bd.cx - 10\n    local safeZ = bd.laneRow < bd.cz and bd.cz + 10 or bd.cz - 10\n    bd.safe1 = { x = safeX, z = safeZ }\n    -- Group waymarks: 1=NW, 2=NE, 3=SE, 4=SW. Spots clear the ~26.5\n    -- deg cone edge by ~1.3y.\n    bd.wm = {\n        [1] = { x = bd.cx - 5, z = bd.cz - 6.7 },\n        [2] = { x = bd.cx + 5, z = bd.cz - 6.7 },\n        [3] = { x = bd.cx + 5, z = bd.cz + 6.7 },\n        [4] = { x = bd.cx - 5, z = bd.cz + 6.7 },\n    }\n    local function quadOf(x, z)\n        if x < bd.cx then return z < bd.cz and 1 or 4 end\n        return z < bd.cz and 2 or 3\n    end\n    bd.quadOf = quadOf\n    bd.safe1q = quadOf(safeX, safeZ)\n    local y = ent.pos.y\n    bd.y = y\n    local green = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.1, 1.0, 0.25, 0.7), 2)\n    local p = bd.wm[bd.safe1q]\n    green:addTimedCircle(21000, p.x, y, p.z, 2)\n    if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n        AnyoneCore.addTimedWorldText(21000, \"1 START\", { x = p.x, y = y + 1.5, z = p.z }, GUI:ColorConvertFloat4ToU32(0.3, 1.0, 0.4, 1.0), true, 1.4)\n    end\n    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n        AnyoneCore.Shotcall(\"Duet, start \" .. tostring(bd.safe1q), true, 8)\n    end\n    -- Beat 1: cones draw IMMEDIATELY (start is known right here) and\n    -- end exactly at the hit (markerAt + 17450) - no linger. The\n    -- first circle volley fires with BEAT 2's cones and is queued at\n    -- route commit. Natives are blacklisted in moogle-overrides.\n    local q1 = bd.safe1q\n    local sxs = (q1 == 1 or q1 == 4) and -1 or 1\n    local szs = (q1 == 1 or q1 == 2) and -1 or 1\n    local red = TensorCore.getMoogleDrawer()\n    bd.laneUuids = bd.laneUuids or {}\n    bd.laneUuids[#bd.laneUuids + 1] = red:addTimedCone(17450, bd.cx + sxs * 20, y, bd.cz - szs * 10, 45, math.rad(53), (sxs == 1) and -1.5708 or 1.5708, 0)\n    bd.laneUuids[#bd.laneUuids + 1] = red:addTimedCone(17450, bd.cx - sxs * 10, y, bd.cz - szs * 20, 45, math.rad(53), (szs == 1) and 0.0 or 3.1416, 0)\n    -- Marker circles too: their damage pops with beat 2, but the spots\n    -- are known now - show them alongside the beat-1 cones (window-2\n    -- entries continue them seamlessly through the actual pop).\n    for i = 1, #bd.mkSpots do\n        bd.laneUuids[#bd.laneUuids + 1] = red:addTimedCircle(17450, bd.mkSpots[i].x, y, bd.mkSpots[i].z, 15, 0)\n    end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"47bd0eb6-e698-4d35-c80b-b7f5a01d9e44",
								true,
							},
						},
						name = "B1 - Breathy Duet Solver",
						uuid = "69df20d8-081a-4f57-ea2d-d917c23f1a66",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID == nil then return end\nlocal id = a.spellID\nlocal BODY = { [50725] = \"FULG\", [50726] = \"FREZ\" }\nlocal FULG = { [47619] = true, [47629] = true, [50723] = true, [50727] = true }\nlocal FREZ = { [50724] = true, [50728] = true, [47620] = true, [47630] = true }\nlocal lead = BODY[id]\nlocal color = lead or (FULG[id] and \"FULG\") or (FREZ[id] and \"FREZ\")\nif not color then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or (ent.contentid ~= 14489 and ent.contentid ~= 14490 and ent.contentid ~= 14491) then return end\n\nlocal FONT = { FULG = 14497, FREZ = 14498 }\nlocal CALL = { FULG = \"In, between blue\", FREZ = \"Out, between green\" }\nlocal ms = (a.channelTimeMax or 10) * 1000\n\nlocal function drawFonts(col, delay, dur)\n    local fonts = data.b1Fonts and data.b1Fonts[FONT[col]]\n    if fonts == nil or #fonts == 0 then\n        AnyoneCore.log(\"[Aevis AR2] Font positions unavailable for \" .. tostring(FONT[col]) .. \".\", 5)\n        return\n    end\n    local danger = TensorCore.getMoogleDrawer()\n    for i = 1, #fonts do\n        local f = fonts[i]\n        danger:addTimedCenteredRect(dur, f.x, f.y, f.z, 60, 5, f.h, delay)\n    end\nend\n\nlocal set = data.b1ARSet\nif lead then\n    if set ~= nil and TimeSince(set.at) < 30000 then return end\n    -- Body reports 9.9s; the lead head channels run ~10.7s to the hit.\n    data.b1ARSet = { at = Now(), lead = lead, hit1 = Now() + ms + 800, p2 = false }\n    drawFonts(lead, 0, ms + 800 + 1000)\n    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n        AnyoneCore.Shotcall(CALL[lead], true, 8)\n    end\n    self.used = true\n    return\nend\n\nif set == nil or TimeSince(set.at) > 30000 then\n    AnyoneCore.log(\"[Aevis AR2] Head fugue \" .. tostring(id) .. \" with no body anchor - ignored.\", 5)\n    return\nend\nif color == set.lead then\n    -- Same-frame lead head line carries the exact hit-1 channel time.\n    if TimeSince(set.at) < 1000 and Now() + ms > set.hit1 then set.hit1 = Now() + ms end\n    return\nend\nif set.p2 then return end\nset.p2 = true\nlocal promoteIn = set.hit1 - Now() - 300\nif promoteIn < 0 then promoteIn = 0 end\nlocal dur = (Now() + ms + 1500) - Now() - promoteIn\nif dur < 1500 then dur = 1500 end\ndrawFonts(color, promoteIn, dur)\n-- Callout rides the promoted draw via the deferred-call spec.\ndata.b1AR2Call = CALL[color]\ndata.b1AR2CallTime = Now() + promoteIn\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"58ce2fd8-f810-4f57-d02d-d918c34f2a77",
								true,
							},
						},
						name = "B1 - AR2 Fugues",
						uuid = "7a0f31e9-192b-4068-fb3e-ea28d34a2b77",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID == nil then return end\nlocal id = a.spellID\nif id ~= 49667 and id ~= 49668 and id ~= 49672 then return end\n\nif id == 49667 then\n    -- Exclude the boss from the clone solver.\n    data.b2BossEid = a.entityID\n    self.used = true\n    return\nend\n\nif id == 49668 then\n    -- Announce once per instance.\n    if data.b2DanceArmed == nil or TimeSince(data.b2DanceArmed) > 25000 then\n        data.b2DanceArmed = Now()\n        data.b2DanceN = 0\n        data.b2DanceSolved = nil\n        data.b2DanceSample = nil\n        data.b2DanceTimeoutLog = nil\n        data.b2DanceCloneN = nil\n    end\n    self.used = true\n    return\nend\n\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil then return end\nif data.b2DanceN == nil or (data.b2DanceLast ~= nil and TimeSince(data.b2DanceLast) > 20000) then\n    data.b2DanceN = 0\nend\ndata.b2DanceN = data.b2DanceN + 1\ndata.b2DanceLast = Now()\nlocal n = data.b2DanceN\nlocal cx, cz = 600.0, 703.975\nlocal y = ent.pos.y\nlocal h = ent.pos.h or 0\n\nlocal red = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, 0.45), 1)\nred:addTimedCenteredRect(1300, cx, y, cz, 60, 20, h)\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n    local lx = cx + 12 * math.sin(h)\n    local lz = cz + 12 * math.cos(h)\n    AnyoneCore.addTimedWorldText(1300, tostring(n), { x = lx, y = y + 1.5, z = lz }, GUI:ColorConvertFloat4ToU32(1, 0.5, 0.4, 1), true, 1.6)\nend\nif n == 1 then\n    -- Replace the solver predraws when lane one begins.\n    if data.b2DancePre ~= nil and Argus ~= nil and Argus.deleteTimedShape ~= nil then\n        for i = 1, #data.b2DancePre do\n            Argus.deleteTimedShape(data.b2DancePre[i])\n        end\n    end\n    data.b2DancePre = nil\n    if data.b2DancePreTexts ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n        for i = 1, #data.b2DancePreTexts do\n            AnyoneCore.removeTimedWorldText(data.b2DancePreTexts[i])\n        end\n    end\n    data.b2DancePreTexts = nil\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0003-4b2b-9c03-b2c1c105a003",
								true,
							},
						},
						name = "B2 - Sword Dance",
						uuid = "1a2b3c4d-0006-4b2b-9c06-b2c1c105a006",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or (a.spellID ~= 48404 and a.spellID ~= 48405) then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil then return end\n\n-- Anchor once because the channel event repeats every frame.\nif a.spellID == 48405 then\n    if a.channelTimeMax ~= nil and data.idxKbUntil ~= nil and Now() < data.idxKbUntil\n        and (data.idxKbLanceAt == nil or TimeSince(data.idxKbLanceAt) > 10000) then\n        data.idxKbLanceAt = Now()\n        local hitAt = Now() + math.floor(a.channelTimeMax * 1000) + 250\n        data.idxKbAt = hitAt\n        data.idxKbUntil = hitAt + 1200\n    end\n    self.used = true\n    return\nend\n\nif data.idxKbUntil == nil or Now() > data.idxKbUntil then\n    data.idxKbSrcs = {}\n    data.idxKbAt = Now() + 6100\n    data.idxKbUntil = Now() + 8500\nend\nlocal s = data.idxKbSrcs\ns[#s + 1] = { x = ent.pos.x, y = ent.pos.y, z = ent.pos.z }\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0037-4b2b-9c37-b2c1c105a037",
								true,
							},
						},
						name = "B4 - Propulsive KB Re-anchor",
						uuid = "1a2b3c4d-0038-4b2b-9c38-b2c1c105a038",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID ~= 48906 then return end\ndata.idxQuadSetUntil = Now() + 17000\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-003b-4b2b-9c3b-b2c1c105a03b",
								true,
							},
						},
						name = "B4 - Quad Mode Flag",
						uuid = "1a2b3c4d-003c-4b2b-9c3c-b2c1c105a03c",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.spellID == nil then return end\nlocal id = a.spellID\nlocal msg\nif id == 48408 then\n    msg = \"Adds, kill inner bombs first\"\nelseif id == 48384 then\n    -- The harp callout is handled by its windup cast.\n    if data.idxWeaponRed ~= nil then data.idxWeaponRed(\"HARP\", 6900) end\n    self.used = true\n    return\nelseif id == 48386 then\n    msg = \"Bow, in when clear\"\nelse\n    return\nend\nlocal key = \"idxAnn\" .. tostring(id)\nif data[key] ~= nil and TimeSince(data[key]) < 20000 then\n    self.used = true\n    return\nend\ndata[key] = Now()\nif AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n    AnyoneCore.Shotcall(msg, true, 6)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0013-4b2b-9c13-b2c1c105a013",
								true,
							},
						},
						name = "B4 - Phase Announces",
						uuid = "1a2b3c4d-0016-4b2b-9c16-b2c1c105a016",
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
						localmapid = 1346,
						name = "North Horn",
						uuid = "d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
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
						eventSpellID = 47490,
						name = "Severed/Ancient Channels",
						spellIDList = 
						{
							47490,
							47491,
							47492,
							50358,
							47494,
							47495,
							47496,
							47507,
							47510,
							47511,
							47512,
						},
						uuid = "b0516ef4-8255-4bd6-9e7f-995fa4a1b505",
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
						eventSpellID = 47507,
						name = "DC Set Channel",
						spellIDList = 
						{
							47507,
						},
						uuid = "1a2b3c4d-0035-4b2b-9c35-b2c1c105a035",
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
						eventSpellID = 47514,
						name = "Fertile Ground Channel",
						spellIDList = 
						{
							47514,
						},
						uuid = "d1f83b62-4a09-4c75-8e2b-06b5c9d47a18",
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
						eventSpellID = 49726,
						name = "Moogle Override Triggers",
						spellIDList = 
						{
							49726,
							47632,
							50717,
							49619,
							49646,
							47507,
							48407,
							48403,
						},
						uuid = "a7d20f36-4b18-4c95-8e63-17f5b0d29a44",
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
						eventSpellID = 47671,
						name = "Blaze Announce/Helpers",
						spellIDList = 
						{
							47671,
							47672,
							47673,
							47674,
							47675,
							47676,
							47677,
							47678,
							47683,
							47684,
							47685,
							47686,
							47687,
							47688,
							50706,
							50707,
							50708,
						},
						uuid = "b8e41c27-5d09-4a86-9f72-28c6d1e40b55",
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
						eventSpellID = 47631,
						name = "Storm's Breath Channel",
						spellIDList = 
						{
							47631,
						},
						uuid = "c9f52d38-6e10-4b97-a083-39d7e2f51c66",
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
						eventSpellID = 47702,
						name = "Two Terrors Wide Channel",
						spellIDList = 
						{
							47702,
						},
						uuid = "f2c85a61-9143-4ec0-d3b6-62a0b5c84f99",
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
						eventSpellID = 47646,
						name = "Breathy Duet Channel",
						spellIDList = 
						{
							47646,
						},
						uuid = "36ac9da5-d587-4c24-b7fa-a6e4f90c8d33",
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
						eventSpellID = 50699,
						name = "Duet Cluster Markers",
						spellIDList = 
						{
							50699,
							50700,
							47653,
						},
						uuid = "47bd0eb6-e698-4d35-c80b-b7f5a01d9e44",
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
						eventSpellID = 50724,
						name = "AR2 Fugue Channels",
						spellIDList = 
						{
							50724,
							47619,
							47629,
							50728,
							50723,
							50727,
							47620,
							47630,
							50725,
							50726,
						},
						uuid = "58ce2fd8-f810-4f57-d02d-d918c34f2a77",
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
						eventSpellID = 49667,
						name = "Sword Dance Channels",
						spellIDList = 
						{
							49667,
							49668,
							49672,
						},
						uuid = "1a2b3c4d-0003-4b2b-9c03-b2c1c105a003",
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
						eventSpellID = 48405,
						name = "Index Lance Shockwave Channel",
						spellIDList = 
						{
							48405,
						},
						uuid = "1a2b3c4d-0037-4b2b-9c37-b2c1c105a037",
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
						eventSpellID = 48906,
						name = "Index Quadrilogy Channel",
						spellIDList = 
						{
							48906,
						},
						uuid = "1a2b3c4d-003b-4b2b-9c3b-b2c1c105a03b",
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
						eventSpellID = 50472,
						name = "Index Phase Channels",
						spellIDList = 
						{
							50472,
							48434,
							48917,
							48408,
							48384,
							48386,
						},
						uuid = "1a2b3c4d-0013-4b2b-9c13-b2c1c105a013",
						version = 3,
					},
				},
			},
			eventType = 3,
			loop = true,
			name = "[FTM] Channels",
			uuid = "b7d51a09-63cd-4de5-9a41-2f8f1f6d7a01",
			version = 2,
		},
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil then return end\nlocal src = a.sourceEntityID or a.sourceID\nlocal tid = a.newTetherID\nif src == nil or tid == nil then return end\nlocal element\nif tid == 400 or tid == 144 then\n    element = \"fire\"\nelseif tid == 401 or tid == 145 then\n    element = \"ice\"\nelseif tid == 402 or tid == 146 then\n    element = \"thunder\"\nelse\n    return\nend\nlocal ent = TensorCore.mGetEntity(src)\nif ent == nil or ent.contentid ~= 14504 then return end\n\n-- Start a new set after the previous records expire.\nif data.npHeads == nil or (data.npLastTether ~= nil and TimeSince(data.npLastTether) > 60000) then\n    if data.npSafeDots ~= nil and data.npWipeDot ~= nil then\n        for elem in pairs(data.npSafeDots) do data.npWipeDot(elem) end\n    end\n    data.npHeads = {}\n    data.npDraws = {}\n    data.npOrder = {}\n    data.npSpots = {}\n    data.npDone = {}\n    data.npAnnounceOrder = {}\n    data.npSafeDots = {}\n    data.npDotOrder = {}\n    data.npDotNames = {}\n    data.npRouteCalled = nil\n    data.npMoveCalled = {}\n    data.npRouteAt = nil\n    data.npSetN = (data.npSetN or 0) + 1\nend\ndata.npLastTether = Now()\ndata.npHeads[src] = element\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"9e3f4cd2-6033-4fb4-bc5d-773df2e9f303",
								true,
							},
						},
						name = "NP - Record Head Elements",
						uuid = "e623802a-d982-4f96-8fb7-08ba7844e227",
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
						localmapid = 1346,
						name = "North Horn",
						uuid = "d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.newTetherID == 400 or eventArgs.newTetherID == 401 or eventArgs.newTetherID == 402 or eventArgs.newTetherID == 144 or eventArgs.newTetherID == 145 or eventArgs.newTetherID == 146)",
						dequeueIfLuaFalse = true,
						name = "Element Tether IDs",
						uuid = "9e3f4cd2-6033-4fb4-bc5d-773df2e9f303",
						version = 3,
					},
				},
			},
			eventType = 15,
			loop = true,
			name = "[FTM] Tethers",
			uuid = "5c9fa8db-7ac4-4a07-a494-74e5d621146b",
			version = 2,
		},
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "if data.lib ~= nil then return end\nlocal L = {}\n\nL.MARK_NAMES = { \"A\", \"B\", \"C\", \"D\", \"1\", \"2\", \"3\", \"4\" }\nL.MARK_TTS = { \"A\", \"B\", \"C\", \"D\", \"One\", \"Two\", \"Three\", \"Four\" }\nL.SPEAK_NUM = { [\"1\"] = \"One\", [\"2\"] = \"Two\", [\"3\"] = \"Three\", [\"4\"] = \"Four\" }\nL.COMPASS = { \"N\", \"NE\", \"E\", \"SE\", \"S\", \"SW\", \"W\", \"NW\" }\nL.COMPASS_FULL = { N = \"north\", NE = \"northeast\", E = \"east\", SE = \"southeast\",\n                   S = \"south\", SW = \"southwest\", W = \"west\", NW = \"northwest\", MID = \"middle\" }\n\n-- Compass name for a world direction vector (north = -z, east = +x).\nfunction L.compassFromDir(dx, dz, short)\n    local ang = math.deg(math.atan2(dx, -dz)) % 360\n    local code = L.COMPASS[math.floor((ang + 22.5) / 45) % 8 + 1]\n    if short then return code end\n    return L.COMPASS_FULL[code]\nend\n\n-- Nearest placed waymark within tolRad of a direction from (cx, cz).\n-- id->name mapping assumed; returns name, mx, mz or nil.\nfunction L.markNearDir(cx, cz, dirx, dirz, tolRad, maxR, tts)\n    if Argus == nil or Argus.getWaymarkInfo == nil then return nil end\n    local dl = math.sqrt(dirx * dirx + dirz * dirz)\n    if dl < 0.001 then return nil end\n    local names = tts and L.MARK_TTS or L.MARK_NAMES\n    local bestN, bestX, bestZ, bestD\n    for wid = 1, 8 do\n        local mx, my, mz, active = Argus.getWaymarkInfo(wid)\n        if active == true and mx ~= nil then\n            local dx, dz = mx - cx, mz - cz\n            local wl = math.sqrt(dx * dx + dz * dz)\n            if wl > 5 and wl < (maxR or 60) then\n                local cosv = (dx * dirx + dz * dirz) / (wl * dl)\n                if cosv > 1 then cosv = 1 elseif cosv < -1 then cosv = -1 end\n                local dd = math.acos(cosv)\n                if dd < tolRad and (bestD == nil or dd < bestD) then\n                    bestN, bestX, bestZ, bestD = names[wid], mx, mz, dd\n                end\n            end\n        end\n    end\n    return bestN, bestX, bestZ\nend\n\n-- Marker-vocab name to TTS phrase (\"4-OUT\" -> \"outside Four\").\nfunction L.speakName(name)\n    if name == nil then return \"unknown\" end\n    local base, suff = string.match(name, \"^(.+)-(%u+)$\")\n    if suff == \"OUT\" then return \"outside \" .. (L.SPEAK_NUM[base] or L.COMPASS_FULL[base] or base) end\n    if suff == \"IN\" then return \"inside \" .. (L.SPEAK_NUM[base] or L.COMPASS_FULL[base] or base) end\n    if name == \"B\" or name == \"D\" then return \"at \" .. name end\n    if L.SPEAK_NUM[name] ~= nil then return \"under \" .. L.SPEAK_NUM[name] end\n    if name == \"A\" or name == \"C\" then return \"under \" .. name end\n    return L.COMPASS_FULL[name] or name\nend\n\nfunction L.movePhrase(p)\n    if string.sub(p, 1, 3) == \"at \" then return \"to \" .. string.sub(p, 4) end\n    return p\nend\n\n-- Standard KB guide frame: \"KB\" text on the player, shrinking ring\n-- (4s, red at 2.6s), flat arrow along heading. st = caller-owned\n-- table for text dedupe; hitAt may be nil (arrow only).\nfunction L.kbGuide(st, hitAt, heading, kbLen, noText)\n    local player = TensorCore.mGetPlayer()\n    if player == nil or player.pos == nil then return false end\n    local px, py, pz = player.pos.x, player.pos.y, player.pos.z\n    local rem = hitAt ~= nil and (hitAt - Now()) or nil\n    if rem ~= nil and rem > -200 then\n        if not noText and st.textFor ~= hitAt and rem > 0 and AnyoneCore ~= nil\n            and AnyoneCore.addTimedWorldTextOnEnt ~= nil then\n            st.textFor = hitAt\n            AnyoneCore.addTimedWorldTextOnEnt(rem + 300, \"KB\", player.id,\n                GUI:ColorConvertFloat4ToU32(1, 1, 1, 1), true, 1.5, 2.2)\n        end\n        if rem > 0 and rem <= 4000 then\n            local ring = TensorCore.getStaticFlatDrawer(rem <= 2600 and 2214592767 or 2214657792)\n            if ring ~= nil then\n                ring:addCircle(px, py + 0.05, pz, 0.5 + 3.5 * rem / 4000)\n            end\n        end\n    end\n    local imminent = rem ~= nil and rem <= 2600\n    local drawer = TensorCore.getStaticFlatDrawer(imminent and 2214592767 or 2214657792)\n    if drawer == nil then return false end\n    drawer:addArrow(px, py + 0.05, pz, heading, kbLen, 0.25, nil, nil, true, false, 0)\n    return true\nend\n\ndata.lib = L\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0051-4b2b-9c51-b2c1c105a051",
								true,
							},
						},
						name = "FTM - Lib",
						uuid = "1a2b3c4d-0052-4b2b-9c52-b2c1c105a052",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local list = data.npFgVolleyList\nif list == nil or data.npFgCenter == nil then return end\nlocal player = TensorCore.mGetPlayer()\nif player == nil or player.pos == nil then return end\nlocal now = Now()\nfor i = 1, #list do\n    local v = list[i]\n    if v ~= nil and not v.done then\n        if now > v.fireAt + 600 then\n            v.done = true\n        else\n            if not v.drawn and v.fireAt - now <= 4500 then\n                v.drawn = true\n                local dur = (v.fireAt - now) + 600\n                local c = data.npFgCenter\n                local py = player.pos.y\n\n                -- Mark the firing head separately from the destination.\n                local orange = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.6, 0.1, 0.8), 2)\n                orange:addTimedCircle(dur, v.x, py, v.z, 2.5)\n                if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n                    AnyoneCore.addTimedWorldText(dur, \"FIRING\", { x = v.x, y = py + 2.0, z = v.z }, GUI:ColorConvertFloat4ToU32(1.0, 0.7, 0.2, 1.0), true, 1.6)\n                end\n\n                -- Place the destination near arena center.\n                local hasBlue = TensorCore.hasBuff(player.id, 5136)\n                local hasPink = TensorCore.hasBuff(player.id, 5137)\n                local safeH, call\n                if hasPink and not hasBlue then\n                    safeH, call = v.blueH, \"Blue side\"\n                elseif hasBlue and not hasPink then\n                    safeH, call = v.pinkH, \"Pink side\"\n                end\n                if safeH ~= nil then\n                    local gp = TensorCore.getPosInDirection({ x = c.x, y = py, z = c.z }, safeH, 8)\n                    if gp ~= nil then\n                        local green = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.1, 1.0, 0.25, 0.7), 2)\n                        green:addTimedCircle(dur, gp.x, gp.y, gp.z, 2.5)\n                        if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n                            AnyoneCore.addTimedWorldText(dur, \"SAFE\", { x = gp.x, y = gp.y + 1.5, z = gp.z }, GUI:ColorConvertFloat4ToU32(0.3, 1.0, 0.4, 1.0), true, 1.5)\n                        end\n                    end\n                    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n                        AnyoneCore.Shotcall(call, true, 5)\n                    end\n                else\n                    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n                        AnyoneCore.Shotcall(\"Any side\", true, 5)\n                    end\n                end\n            end\n            break\n        end\n    end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"f6b03d18-29e5-4a71-b5c2-83d94f0a6e77",
								true,
							},
						},
						name = "NP - FG Guide",
						uuid = "0b74e5c9-2a86-4d13-9fe0-51a2c8d67b90",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local u = data.b1StormUntil\nif u == nil or Now() > u then return end\nlocal o = data.b1StormOrigin\nif o == nil then return end\nlocal player = TensorCore.mGetPlayer()\nif player == nil or player.pos == nil then return end\nlocal px, pz = player.pos.x, player.pos.z\nlocal dx, dz = px - o.x, pz - o.z\nlocal d = math.sqrt(dx * dx + dz * dz)\nif d < 0.5 then dx, dz, d = 0, 1, 1 end\nlocal KB = 13\nlocal lx = px + dx / d * KB\nlocal lz = pz + dz / d * KB\nlocal ex, ez = lx - o.x, lz - o.z\nlocal unsafe = (ex * ex + ez * ez) > 31 * 31\nlocal col = unsafe and 2214592767 or 2214657792\nlocal drawer = TensorCore.getStaticFlatDrawer(col)\nif drawer == nil then return end\nlocal h = math.atan2(lx - px, lz - pz)\ndrawer:addArrow(px, player.pos.y + 0.05, pz, h, KB, 0.25, nil, nil, true, false, 0)\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"d0a63e49-7f21-4ca8-b194-40e8f3a62d77",
								true,
							},
						},
						name = "B1 - Storm Breath Landing",
						uuid = "6b05a2d3-9138-4e70-c3b6-62a0f5c84f99",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local u = data.b1NoiseUntil\nif u == nil or Now() > u then return end\nlocal player = TensorCore.mGetPlayer()\nif player == nil or player.pos == nil then return end\nlocal buffs = {\n    -- Wind names indicate their source direction.\n    { id = 5054, call = \"Blue noise, knocked West\", dx = -1 },\n    { id = 5055, call = \"Blue noise, knocked East\", dx = 1 },\n    { id = 5052, call = \"Green noise, knocked West\", dx = -1 },\n    { id = 5053, call = \"Green noise, knocked East\", dx = 1 },\n}\nlocal active\nfor i = 1, 4 do\n    if TensorCore.hasBuff(player.id, buffs[i].id) then\n        active = buffs[i]\n        break\n    end\nend\nif active == nil then\n    data.b1NoiseCalled = nil\n    data.b1NoiseBuffAt = nil\n    return\nend\nif data.b1NoiseCalled ~= active.id then\n    data.b1NoiseCalled = active.id\n    data.b1NoiseBuffAt = Now()\nend\nlocal KB = 10\n-- Each Noise resolves after its matching head attack. Hit times are\n-- PREDICTED from the helper channels (~10s lead) with their global\n-- blaze numbers attached.\nlocal headCid = (active.id == 5054 or active.id == 5055) and 14491 or 14490\nlocal kbAt, kbSeq\nlocal hl = data.b1BlazeHits and data.b1BlazeHits[headCid]\nif hl ~= nil then\n    for i = 1, #hl do\n        local e = hl[i]\n        local et = type(e) == \"table\" and e.t or e\n        local k = et + 1100\n        if k > Now() - 300 and (kbAt == nil or k < kbAt) then\n            kbAt = k\n            kbSeq = type(e) == \"table\" and e.seq or nil\n        end\n    end\nend\n-- Single early call: direction + hit parity. Your color's head owns\n-- either global hits 1/3 or 2/4, so both KB waves share parity -\n-- derivable from the first matching hit's number (~10s ahead).\nif kbSeq ~= nil and data.b1NoiseSchedCalled ~= active.id then\n    data.b1NoiseSchedCalled = active.id\n    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n        local par = (kbSeq % 2 == 1) and \"1 and 3\" or \"2 and 4\"\n        AnyoneCore.Shotcall(\"Knockback \" .. (active.dx > 0 and \"east\" or \"west\") .. \" during \" .. par, true, 8)\n    end\nelseif kbSeq == nil and data.b1NoiseSchedCalled ~= active.id\n    and data.b1NoiseBuffAt ~= nil and TimeSince(data.b1NoiseBuffAt) > 3000 then\n    -- Schedule unknown: fall back to direction only.\n    data.b1NoiseSchedCalled = active.id\n    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n        AnyoneCore.Shotcall(active.call, true, 8)\n    end\nend\n-- No execution TTS: the shrinking ring, red arrow flash, and KB\n-- text carry the timing.\nif data.lib == nil then return end\ndata.b1NoiseGuideSt = data.b1NoiseGuideSt or {}\nlocal h = active.dx > 0 and (math.pi / 2) or (-math.pi / 2)\nif data.lib.kbGuide(data.b1NoiseGuideSt, kbAt, h, KB) then\n    self.used = true\nend\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"8b1a42fa-2a3c-4179-ac4f-fb39e45b3c88",
								true,
							},
						},
						name = "B1 - Noise Guide",
						uuid = "9c2b53ab-3b4d-4280-bd50-0c4af56c4d99",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "if data.b1AR2Call == nil then return end\nif Now() < (data.b1AR2CallTime or 0) then return end\nif AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n    AnyoneCore.Shotcall(data.b1AR2Call, true, 6)\nend\ndata.b1AR2Call = nil\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"7a2f53ac-4c5e-4291-be61-1d5ba67d5e00",
								true,
							},
						},
						name = "B1 - AR2 Deferred Call",
						uuid = "8b3a64bd-5d6f-43a2-cf72-2e6cb78e6f11",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "if data.b2LlSwords == nil then return end\nlocal player = TensorCore.mGetPlayer()\nif player == nil or player.pos == nil then return end\n\n-- Find the next unresolved knockback.\nlocal active\nfor _, r in pairs(data.b2LlSwords) do\n    if not r.done and r.hitAt ~= nil and r.hitAt > Now() - 400 then\n        if active == nil or r.hitAt < active.hitAt then active = r end\n    end\nend\nif active == nil then\n    if data.b2LlKbTextUuid ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n        AnyoneCore.removeTimedWorldText(data.b2LlKbTextUuid)\n        data.b2LlKbTextUuid = nil\n        data.b2LlKbTextFor = nil\n    end\n    return\nend\nlocal rem = active.hitAt - Now()\nif rem > 9000 then return end\n\nif data.lib == nil then return end\nlocal dx, dz = player.pos.x - active.x, player.pos.z - active.z\nif dx * dx + dz * dz < 0.04 then dz = -1 end\ndata.b2LlGuideSt = data.b2LlGuideSt or {}\nif data.lib.kbGuide(data.b2LlGuideSt, active.hitAt, math.atan2(dx, dz), 25) then\n    self.used = true\nend\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0004-4b2b-9c04-b2c1c105a004",
								true,
							},
						},
						name = "B2 - Leaping Lift Guide",
						uuid = "1a2b3c4d-0007-4b2b-9c07-b2c1c105a007",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "if data.idxKbUntil == nil or Now() > data.idxKbUntil then return end\nif data.idxKbSrcs == nil or #data.idxKbSrcs == 0 or data.idxKbAt == nil then return end\nlocal player = TensorCore.mGetPlayer()\nif player == nil or player.pos == nil then return end\nlocal px, py, pz = player.pos.x, player.pos.y, player.pos.z\nlocal best, bd\nfor i = 1, #data.idxKbSrcs do\n    local s = data.idxKbSrcs[i]\n    local d = (px - s.x) ^ 2 + (pz - s.z) ^ 2\n    if bd == nil or d < bd then best, bd = s, d end\nend\nlocal rem = data.idxKbAt - Now()\nif rem < -300 then return end\nif rem <= 2600 and data.idxKbCalled ~= data.idxKbAt then\n    data.idxKbCalled = data.idxKbAt\n    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n        AnyoneCore.Shotcall(\"Knockback now\", true, 3)\n    end\nend\nif data.lib == nil then return end\nlocal dx, dz = px - best.x, pz - best.z\nif dx * dx + dz * dz < 0.04 then dz = -1 end\ndata.idxKbGuideSt = data.idxKbGuideSt or {}\nif data.lib.kbGuide(data.idxKbGuideSt, data.idxKbAt, math.atan2(dx, dz), 10, true) then\n    self.used = true\nend\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0025-4b2b-9c25-b2c1c105a025",
								true,
							},
						},
						name = "B4 - Propulsive KB Guide",
						uuid = "1a2b3c4d-0029-4b2b-9c29-b2c1c105a029",
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
						localmapid = 1346,
						name = "North Horn",
						uuid = "d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.lib == nil",
						dequeueIfLuaFalse = true,
						name = "Lib Missing",
						uuid = "1a2b3c4d-0051-4b2b-9c51-b2c1c105a051",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local list = data.npFgVolleyList\nif list == nil then return false end\nlocal now = Now()\nfor i = 1, #list do\n    local v = list[i]\n    if v ~= nil and not v.done and v.fireAt ~= nil and v.fireAt >= now - 600 then\n        return true\n    end\nend\nreturn false",
						dequeueIfLuaFalse = true,
						name = "FG unresolved volley pending",
						uuid = "f6b03d18-29e5-4a71-b5c2-83d94f0a6e77",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.b1StormUntil ~= nil and Now() < data.b1StormUntil",
						dequeueIfLuaFalse = true,
						name = "Storm KB Window",
						uuid = "d0a63e49-7f21-4ca8-b194-40e8f3a62d77",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.b1NoiseUntil ~= nil and Now() < data.b1NoiseUntil",
						dequeueIfLuaFalse = true,
						name = "Noise Window",
						uuid = "8b1a42fa-2a3c-4179-ac4f-fb39e45b3c88",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.b1AR2Call ~= nil",
						dequeueIfLuaFalse = true,
						name = "AR2 Deferred Call Pending",
						uuid = "7a2f53ac-4c5e-4291-be61-1d5ba67d5e00",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local list = data.b2LlSwords\nif list == nil then return false end\nlocal now = Now()\nfor _, r in pairs(list) do\n    if r ~= nil and not r.done and r.hitAt ~= nil and r.hitAt > now - 400 then\n        return true\n    end\nend\nreturn false",
						dequeueIfLuaFalse = true,
						name = "Leaping Lift unresolved KB pending",
						uuid = "1a2b3c4d-0004-4b2b-9c04-b2c1c105a004",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return data.idxKbUntil ~= nil and Now() <= data.idxKbUntil",
						dequeueIfLuaFalse = true,
						name = "Index KB Window Active",
						uuid = "1a2b3c4d-0025-4b2b-9c25-b2c1c105a025",
						version = 3,
					},
				},
			},
			eventType = 12,
			loop = true,
			name = "[FTM] Frame",
			uuid = "c7e2f940-1b56-4a08-92dd-4f6a8e01c355",
			version = 2,
		},
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\nlocal cid = a.contentID or a.entityContentID\nif cid ~= 14497 and cid ~= 14498 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil then return end\n-- A gap between spawn batches starts a new layout.\nif data.b1Fonts == nil or (data.b1FontsAt ~= nil and TimeSince(data.b1FontsAt) > 5000) then\n    data.b1Fonts = { [14497] = {}, [14498] = {} }\nend\ndata.b1FontsAt = Now()\nlocal list = data.b1Fonts[cid]\nlist[#list + 1] = { x = ent.pos.x, y = ent.pos.y, z = ent.pos.z, h = ent.pos.h }\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"e1b74f50-8032-4db9-c2a5-51f9a4b73e88",
								true,
							},
						},
						name = "B1 - Font Recorder",
						uuid = "25fb8d94-c476-4b13-a6e9-95d3e8fb7c22",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil then return end\nlocal cid = a.contentID or a.entityContentID\n-- 14494: Lightning; 14495: Ice.\nif cid ~= 14494 and cid ~= 14495 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil then return end\nif data.b1DuetAxis == nil or TimeSince(data.b1DuetAxis.at or 0) > 40000 then\n    data.b1DuetAxis = {}\nend\nlocal ax = data.b1DuetAxis\n-- Arena center: (-900, 700).\nlocal axis = math.abs(ent.pos.z - 700.0) > math.abs(ent.pos.x + 900.0) and \"col\" or \"row\"\nif cid == 14495 then ax.ice = axis else ax.levin = axis end\nax.at = Now()\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-002f-4b2b-9c2f-b2c1c105a02f",
								true,
							},
						},
						name = "B1 - Duet Axis Recorder",
						uuid = "1a2b3c4d-0030-4b2b-9c30-b2c1c105a030",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\nlocal cid = a.entityContentID\nif cid == nil then\n    local e = TensorCore.mGetEntity(a.entityID)\n    cid = e ~= nil and e.contentid or nil\nend\nif cid ~= 14723 and cid ~= 14724 and cid ~= 14725 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil then return end\nlocal dx, dz = ent.pos.x - 0.0, ent.pos.z + 628.0\nlocal r = math.sqrt(dx * dx + dz * dz)\nif r < 17 or r > 22 then return end\nlocal k = math.atan2(dx, dz) / (math.pi / 3)\nlocal snapped = math.floor(k + 0.5)\nif math.abs(k - snapped) > 0.15 then return end\nif data.idxChemAt ~= nil and TimeSince(data.idxChemAt) < 35000 then return end\ndata.idxChemAt = Now()\n-- Platform axes are even multiples of 60 degrees.\nlocal msg = (snapped % 2 == 0) and \"Chemistry, start home\" or \"Chemistry, start clockwise\"\nif AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n    AnyoneCore.Shotcall(msg, true, 7)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0049-4b2b-9c49-b2c1c105a049",
								true,
							},
						},
						name = "B4 - Chemistry Start",
						uuid = "1a2b3c4d-0048-4b2b-9c48-b2c1c105a048",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\nlocal cid = a.entityContentID\nif cid == nil then\n    local e = TensorCore.mGetEntity(a.entityID)\n    cid = e ~= nil and e.contentid or nil\nend\nlocal ELEM = { [14723] = \"ICE\", [14724] = \"FIRE\", [14725] = \"LIGHTNING\" }\nlocal elem = ELEM[cid]\nif elem == nil then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil then return end\nlocal dx, dz = ent.pos.x - 0.0, ent.pos.z + 628.0\nlocal r = math.sqrt(dx * dx + dz * dz)\nif r < 18 or r > 23 then return end\nlocal ang = math.atan2(dx, dz)\nlocal k = ang / (math.pi / 3)\nif math.abs(k - math.floor(k + 0.5)) < 0.15 then return end\nif data.idxOmni2 == nil or TimeSince(data.idxOmni2.at) > 15000 then\n    data.idxOmni2 = { at = Now(), orbs = {} }\nend\nlocal st2 = data.idxOmni2\nst2.at = Now()\nst2.orbs[#st2.orbs + 1] = { elem = elem, ang = ang }\nif #st2.orbs < 6 or st2.riders ~= nil then\n    self.used = true\n    return\nend\n-- Shortest clockwise travel to an element axis determines order.\nlocal dirs = data.idxOmni ~= nil and data.idxOmni.dirs or nil\nif dirs == nil then\n    AnyoneCore.log(\"[IDX Omni] Pointer axes unavailable for paired volleys.\", 5)\n    self.used = true\n    return\nend\nlocal best = {}\nfor i = 1, #st2.orbs do\n    local o = st2.orbs[i]\n    local h = dirs[o.elem]\n    if h ~= nil then\n        for _, e in ipairs({ h, h + math.pi }) do\n            local d = (o.ang - e) % (2 * math.pi)\n            if best[o.elem] == nil or d < best[o.elem] then best[o.elem] = d end\n        end\n    end\nend\nlocal order = {}\nfor e, d in pairs(best) do order[#order + 1] = { e = e, d = d } end\ntable.sort(order, function(x, y) return x.d < y.d end)\nst2.riders = {}\nfor i = 1, #order do\n    st2.riders[i] = order[i].e\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0049-4b2b-9c49-b2c1c105a049",
								true,
							},
						},
						name = "B4 - Omni2 Pinwheels",
						uuid = "1a2b3c4d-004e-4b2b-9c4e-b2c1c105a04e",
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
						localmapid = 1346,
						name = "North Horn",
						uuid = "d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.contentID == 14497 or eventArgs.contentID == 14498 or eventArgs.entityContentID == 14497 or eventArgs.entityContentID == 14498)",
						dequeueIfLuaFalse = true,
						name = "Arcane Font Add",
						uuid = "e1b74f50-8032-4db9-c2a5-51f9a4b73e88",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.contentID == 14494 or eventArgs.contentID == 14495 or eventArgs.entityContentID == 14494 or eventArgs.entityContentID == 14495)",
						dequeueIfLuaFalse = true,
						name = "Duet Charmed Shooter Add",
						uuid = "1a2b3c4d-002f-4b2b-9c2f-b2c1c105a02f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local c = eventArgs ~= nil and eventArgs.entityContentID or nil if c == nil and eventArgs ~= nil and eventArgs.entityID ~= nil then local e = TensorCore.mGetEntity(eventArgs.entityID) c = e ~= nil and e.contentid or nil end return c == 14723 or c == 14724 or c == 14725",
						dequeueIfLuaFalse = true,
						name = "Chemistry Crystal Adds",
						uuid = "1a2b3c4d-0049-4b2b-9c49-b2c1c105a049",
						version = 3,
					},
				},
			},
			eventType = 5,
			loop = true,
			name = "[FTM] Adds",
			uuid = "14ea7c83-b365-4a02-95d8-84c2d7ea6b11",
			version = 2,
		},
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.aoeID == nil then return end\nlocal id = a.aoeID\nif id ~= 47500 and id ~= 47509 and id ~= 47501 then return end\nlocal x, y, z, h = a.x, a.y, a.z, a.heading\nif x == nil or y == nil or z == nil or h == nil then return end\n\n-- Exact slab creates also update the durable safe-overlay cuts.\nif data.npExaCarve == nil then\n    data.npExaCarve = function(cx2, cz2, len, wid, hh, delayMs, durMs)\n        data.npExaCuts = data.npExaCuts or {}\n        data.npExaCuts[#data.npExaCuts + 1] = { x = cx2, z = cz2, l = len, w = wid, h = hh,\n            showAt = Now() + delayMs, til = Now() + delayMs + durMs }\n        if data.npSafeShapes ~= nil and data.npSafeChannel ~= nil\n            and Argus2 ~= nil and Argus2.RenderFlags ~= nil\n            and TensorCore.getStaticFlatDrawer ~= nil then\n            local cut = TensorCore.getStaticFlatDrawer(1493237504, nil, data.npSafeChannel)\n            local hy2 = (data.npBossPos ~= nil and data.npBossPos.y or -724.0) + 0.05\n            data.npSafeShapes[#data.npSafeShapes + 1] = cut:addTimedCenteredRect(durMs, cx2, hy2, cz2, len, wid, hh, delayMs, false, false, Argus2.RenderFlags.FLAG_OCCLUDE)\n        end\n    end\nend\n\nif id == 47501 then\n    local c = TensorCore.getPosInDirection({ x = x, y = y, z = z }, h, 5)\n    if c ~= nil then\n        local dms = math.floor((a.duration or 0.7) * 1000)\n        local danger = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.75, 0.3, 1.0, 0.45), 1)\n        danger:addTimedCenteredRect(dms, c.x, c.y, c.z, 10, 60, h)\n        data.npExaCarve(c.x, c.z, 10, 60, h, 0, dms)\n    end\n    self.used = true\n    return\nend\n\nlocal firstPair, initialImpact\nif id == 47509 then\n    firstPair, initialImpact = 3300, 1200\nelse\n    firstPair, initialImpact = 5750, 3700\nend\nlocal CADENCE = 2100\nlocal LEAD = 2000\nlocal PAIRS = 3\n\nlocal origin = { x = x, y = y, z = z }\nlocal center = TensorCore.getPosInDirection(origin, h, 30)\nif center == nil then return end\n\n-- Keep the direction band visually subordinate to active slabs.\nlocal band = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.75, 0.3, 1.0, 0.12), 1)\nlocal bandDur = firstPair + (PAIRS - 1) * CADENCE\nband:addTimedCenteredRect(bandDur, center.x, center.y, center.z, 60, 60, h)\n\n-- Draw the initial line through impact.\nlocal danger = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.75, 0.3, 1.0, 0.45), 1)\ndanger:addTimedCenteredRect(initialImpact, center.x, center.y, center.z, 60, 10, h)\n\n-- Show each slab pair only during its lead window.\nlocal perp1 = h + math.pi / 2\nlocal perp2 = h - math.pi / 2\nfor k = 1, PAIRS do\n    -- Slab positions are inner-edge anchors.\n    local off = 10 * k\n    local impact = firstPair + (k - 1) * CADENCE\n    local delay = impact - LEAD\n    if delay < 0 then delay = 0 end\n    local dur = impact - delay\n    local p1 = TensorCore.getPosInDirection(center, perp1, off)\n    local p2 = TensorCore.getPosInDirection(center, perp2, off)\n    if p1 ~= nil then\n        danger:addTimedCenteredRect(dur, p1.x, p1.y, p1.z, 60, 10, h, delay)\n    end\n    if p2 ~= nil then\n        danger:addTimedCenteredRect(dur, p2.x, p2.y, p2.z, 60, 10, h, delay)\n    end\nend\n\n-- Persist matching cuts for later safe-overlay rebuilds.\ndata.npExaCarve(center.x, center.z, 60, 10, h, 0, initialImpact)\nfor k = 1, PAIRS do\n    local off = 10 * k\n    local impact = firstPair + (k - 1) * CADENCE\n    local delay = impact - LEAD\n    if delay < 0 then delay = 0 end\n    local dur = impact - delay\n    local p1 = TensorCore.getPosInDirection(center, perp1, off)\n    local p2 = TensorCore.getPosInDirection(center, perp2, off)\n    if p1 ~= nil then data.npExaCarve(p1.x, p1.z, 60, 10, h, delay, dur) end\n    if p2 ~= nil then data.npExaCarve(p2.x, p2.z, 60, 10, h, delay, dur) end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"e8b94d17-52c0-4a6f-9d31-7f80c2a5be07",
								true,
							},
						},
						name = "NP - Dark Current Exas",
						uuid = "3d60e9a2-84f5-4c17-b028-95a1e6d74c33",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.aoeID == nil then return end\nlocal id = a.aoeID\nlocal FULG_DONUT = { [47629] = true, [50727] = true }\nlocal FREZ_CIRCLE = { [50728] = true, [47630] = true }\nif not FULG_DONUT[id] and not FREZ_CIRCLE[id] then return end\nif a.x == nil or a.y == nil or a.z == nil then return end\nlocal ms = (a.duration or 10.7) * 1000\nlocal delay = 0\nif data.b1AR2ShapeEnd ~= nil and data.b1AR2ShapeEnd > Now() then\n    delay = data.b1AR2ShapeEnd - Now() + 200\nend\nlocal dur = ms - delay\nif dur < 1500 then dur = 1500 end\ndata.b1AR2ShapeEnd = Now() + delay + dur\nlocal danger = TensorCore.getMoogleDrawer()\nif FREZ_CIRCLE[id] then\n    danger:addTimedCircle(dur, a.x, a.y, a.z, 20, delay)\nelse\n    danger:addTimedDonut(dur, a.x, a.y, a.z, 18, 60, delay)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"69df31ea-2a3b-4068-fc4f-fb29e45b3c88",
								true,
							},
						},
						name = "B1 - AR2 Boss Shapes",
						uuid = "7a1e42fb-3b4c-4179-0d50-0c3af56c4d99",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.aoeID == nil then return end\nif a.aoeID ~= 47651 and a.aoeID ~= 47652 then return end\nif a.x == nil or a.z == nil then return end\n-- Audit the guide-walk prediction: a matching predicted circle stays;\n-- a mismatch deletes that volley's unconfirmed circles and draws\n-- truth. The paired damage AOE (50701/50702) pops at create +0.3s\n-- with 1.0s duration; truth draws cover through the pop.\nlocal bd = data.b1Duet\nif bd ~= nil then\n    -- Creates arrive as a pair per volley; group by time.\n    if TimeSince(bd.truthAt or 0) > 1500 then bd.truthVolley = (bd.truthVolley or 0) + 1 end\n    bd.truthAt = Now()\n    local pj = bd.predC ~= nil and bd.predC[bd.truthVolley] or nil\n    if pj ~= nil then\n        for i = 1, #pj do\n            local p = pj[i]\n            if p ~= nil and math.abs(p.x - a.x) < 2 and math.abs(p.z - a.z) < 2 then\n                p.ok = true\n                self.used = true\n                return\n            end\n        end\n        for i = 1, #pj do\n            local p = pj[i]\n            if p ~= nil and p.ok ~= true and p.uuid ~= nil and Argus ~= nil and Argus.deleteTimedShape ~= nil then\n                Argus.deleteTimedShape(p.uuid)\n                p.uuid = nil\n            end\n        end\n        AnyoneCore.log(\"[Duet] Predicted circle mismatched the create - corrected to truth.\", 5)\n    end\nend\nlocal red = TensorCore.getMoogleDrawer()\nred:addTimedCircle(1500, a.x, a.y or -980.0, a.z, 15, 0)\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"6a9d87ef-8092-4d35-f195-5b9fea1b9244",
								true,
							},
						},
						name = "B1 - Duet Cluster Truth",
						uuid = "7b0e98f0-9103-4e46-0206-6c0ffb2c0355",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.aoeCastType ~= 10 then return end\n-- Other cast-type 10 AOEs must not match this handler.\nlocal t = a.aoeType\nif t == nil or t < 750 or t > 755 then return end\nlocal L = a.aoeLength\nif L == nil or L <= 0 then return end\nlocal x, y, z = a.x, a.y, a.z\nlocal h = a.heading or 0\n-- Trim the payload duration to the sweep cadence.\nlocal hitMs = math.floor(((a.delay or 0) + (a.duration or 3.2)) * 1000) - 1200\n\n-- Draw an annular sector rather than a full pie.\nlocal inner = L - 5\nlocal red = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, 0.45), 1)\nred:addTimedDonutCone(hitMs, x, y, z, inner, L, math.rad(90), h, 0)\n\n-- Preview the next quarter with an outline. 754/755 = the off-grid\n-- terminal turnabout arc; nothing follows it.\n-- 751 rotates a per-instance direction - learn the step from the\n-- chain itself; 750/752 table values are arc-1 priors only.\nlocal STEP = { [750] = -math.pi / 2, [752] = math.pi / 2 }\nlocal TERMINAL = { [754] = true, [755] = true }\nlocal t10 = a.aoeType or -1\nif STEP[t10] ~= nil or t10 == 751 then\n    data.b2SweepLast = data.b2SweepLast or {}\n    local prev = data.b2SweepLast[a.entityID or -1]\n    local step\n    -- Negative TimeSince = replay scrubbed backwards; distrust it.\n    if prev ~= nil and prev.type == t10 and TimeSince(prev.at) >= 0 and TimeSince(prev.at) < 6000 then\n        step = (h - prev.h + math.pi) % (2 * math.pi) - math.pi\n        local tbl = STEP[t10]\n        if tbl ~= nil and (step - tbl > 0.2 or step - tbl < -0.2) then\n            AnyoneCore.log(\"[B2 Sweeps] Type \" .. tostring(t10) .. \" observed step contradicts table; using observed.\", 5)\n        end\n    else\n        step = STEP[t10]\n    end\n    if step ~= nil then\n        local thin = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.6, 0.2, 0.30), 2)\n        thin:addTimedDonutCone(4400, x, y, z, inner, L, math.rad(90), h + step, 0)\n    end\n    data.b2SweepLast[a.entityID or -1] = { h = h, at = Now(), type = t10 }\nelseif not TERMINAL[t10] and AnyoneCore ~= nil and AnyoneCore.log ~= nil then\n    data.b2SweepWarned = data.b2SweepWarned or {}\n    if not data.b2SweepWarned[a.aoeType or -1] then\n        data.b2SweepWarned[a.aoeType or -1] = true\n        AnyoneCore.log(\"[B2 Sweeps] Unsupported sweep type \" .. tostring(a.aoeType) .. \"; drawing current arc only.\", 5)\n    end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0033-4b2b-9c33-b2c1c105a033",
								true,
							},
						},
						name = "B2 - Throwing Sword Sweeps",
						uuid = "1a2b3c4d-0034-4b2b-9c34-b2c1c105a034",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.aoeID == nil then return end\nlocal id = a.aoeID\nif id ~= 48455 and id ~= 48445 then return end\nif a.x == nil or a.z == nil then return end\n\n-- Reset before the next mechanic can reuse the counter.\nif data.idxBlitz == nil or (data.idxBlitzAt ~= nil and TimeSince(data.idxBlitzAt) > 12000) then\n    data.idxBlitz = { n = 0, lastSet = nil }\nend\nlocal st = data.idxBlitz\nif st.lastSet == nil or TimeSince(st.lastSet) > 800 then\n    st.n = st.n + 1\n    st.lastSet = Now()\nend\ndata.idxBlitzAt = Now()\n\nlocal ms = (a.duration or 8) * 1000\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n    -- A rectangle payload starts at its near edge.\n    local h = a.heading or 0\n    local half = (a.aoeLength or 15) / 2\n    local lx = a.x + half * math.sin(h)\n    local lz = a.z + half * math.cos(h)\n    AnyoneCore.addTimedWorldText(ms, tostring(st.n), { x = lx, y = (a.y or -684) + 1.5, z = lz }, GUI:ColorConvertFloat4ToU32(1.0, 0.7, 0.3, 1.0), true, 1.5)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0014-4b2b-9c14-b2c1c105a014",
								true,
							},
						},
						name = "B4 - Bladeblitz Order",
						uuid = "1a2b3c4d-0017-4b2b-9c17-b2c1c105a017",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.aoeID ~= 48445 then return end\nif a.x == nil or a.z == nil then return end\nlocal cx, cz, cy = 0.0, -628.0, -684.0\nlocal dx, dz = a.x - cx, a.z - cz\nlocal r = math.sqrt(dx * dx + dz * dz)\nif r < 24 then return end\nlocal ang = math.atan2(dx, dz)\n-- The lateral offset determines rotation direction.\nlocal third = 2.0944\nlocal A = math.floor(ang / third + 0.5) * third\nlocal rel = (ang - A + math.pi) % (2 * math.pi) - math.pi\nlocal s = rel >= 0 and 1 or -1\n-- Canonical path, mirrored and rotated for each entry.\nlocal PATH = {\n    { 3.25, 21.0 }, { 3.25, 15.0 }, { 3.25, 9.0 }, { 7.79, 4.5 },\n    { 9.42, -1.68 }, { 14.62, -4.68 }, { 19.81, -7.68 }, { 25.01, -10.68 },\n}\nlocal danger = TensorCore.getMoogleDrawer()\nlocal cosA, sinA = math.cos(A), math.sin(A)\nfor k = 1, 8 do\n    local px, pz = PATH[k][1] * s, PATH[k][2]\n    local wx = px * cosA + pz * sinA + cx\n    local wz = pz * cosA - px * sinA + cz\n    local hitIn = 7100 + 2000 * (k - 1)\n    local delay = hitIn - 4000\n    if delay < 0 then delay = 0 end\n    danger:addTimedCircle(hitIn - delay + 300, wx, cy, wz, 6, delay)\nend\nif data.idxExaCallAt == nil or TimeSince(data.idxExaCallAt) > 20000 then\n    data.idxExaCallAt = Now()\n    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n        AnyoneCore.Shotcall(s == 1 and \"Exaflares, rotating counterclockwise\" or \"Exaflares, rotating clockwise\", true, 6)\n    end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-004a-4b2b-9c4a-b2c1c105a04a",
								true,
							},
						},
						name = "B4 - Exaflares",
						uuid = "1a2b3c4d-004c-4b2b-9c4c-b2c1c105a04c",
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
						localmapid = 1346,
						name = "North Horn",
						uuid = "d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.aoeID == 47500 or eventArgs.aoeID == 47501 or eventArgs.aoeID == 47509)",
						dequeueIfLuaFalse = true,
						name = "Dark Current Lines",
						uuid = "e8b94d17-52c0-4a6f-9d31-7f80c2a5be07",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.aoeID == 50728 or eventArgs.aoeID == 47629 or eventArgs.aoeID == 50727 or eventArgs.aoeID == 47630)",
						dequeueIfLuaFalse = true,
						name = "AR2 Boss Shape AOEs",
						uuid = "69df31ea-2a3b-4068-fc4f-fb29e45b3c88",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.aoeID == 47651 or eventArgs.aoeID == 47652)",
						dequeueIfLuaFalse = true,
						name = "Duet Cluster Creates",
						uuid = "6a9d87ef-8092-4d35-f195-5b9fea1b9244",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and eventArgs.aoeCastType == 10 and eventArgs.aoeType ~= nil and eventArgs.aoeType >= 750 and eventArgs.aoeType <= 755",
						dequeueIfLuaFalse = true,
						name = "Throwing Sword Ring Sweeps",
						uuid = "1a2b3c4d-0033-4b2b-9c33-b2c1c105a033",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.aoeID == 48455 or eventArgs.aoeID == 48445)",
						dequeueIfLuaFalse = true,
						name = "Index Bladeblitz AOEs",
						uuid = "1a2b3c4d-0014-4b2b-9c14-b2c1c105a014",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and eventArgs.aoeID == 48445",
						dequeueIfLuaFalse = true,
						name = "Exa Entry AOEs",
						uuid = "1a2b3c4d-004a-4b2b-9c4a-b2c1c105a04a",
						version = 3,
					},
				},
			},
			eventType = 18,
			loop = true,
			name = "[FTM] AOEs",
			uuid = "f2a71c58-9e04-4b3d-a6e2-1c85d09f3b44",
			version = 2,
		},
	},
	
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
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"7c1f2ab0-4e11-4d92-9a3b-551be0c7d101",
								true,
							},
						},
						name = "SD - Predraw KB/AOE Swords",
						uuid = "18ba4446-e82c-4b93-b438-f39b659d22b9",
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
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0001-4b2b-9c01-b2c1c105a001",
								true,
							},
						},
						name = "B2 - Cycloswords Rings",
						uuid = "1a2b3c4d-0008-4b2b-9c08-b2c1c105a008",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\nlocal element\nif a.newActiveAura1 == 2908 then\n    element = \"fire\"\nelseif a.newActiveAura1 == 2909 then\n    element = \"ice\"\nelseif a.newActiveAura1 == 2910 then\n    element = \"thunder\"\nelse\n    return\nend\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.contentid ~= 14503 then return end\nif ent.pos ~= nil then\n    data.npBossPos = { x = ent.pos.x, y = ent.pos.y, z = ent.pos.z }\nend\nif data.npSpots == nil or data.npPromote == nil then return end\n\ndata.npAnnounceOrder = data.npAnnounceOrder or {}\nlocal known = false\nfor i = 1, #data.npAnnounceOrder do\n    if data.npAnnounceOrder[i] == element then known = true end\nend\nif not known then\n    data.npAnnounceOrder[#data.npAnnounceOrder + 1] = element\n    local n = #data.npAnnounceOrder\n    if data.npStampDot ~= nil then data.npStampDot(element, n) end\n    if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil\n        and AnyoneCore.removeTimedWorldText ~= nil then\n        local label\n        if element == \"ice\" then\n            label = n .. \". ICE +\"\n        elseif element == \"thunder\" then\n            label = n .. \". LTG X\"\n        else\n            label = n .. \". FIRE O\"\n        end\n        for eid, s in pairs(data.npSpots) do\n            local rec = data.npDraws and data.npDraws[eid]\n            if s.element == element and rec ~= nil and rec.mode == \"marker\" then\n                if rec.text ~= nil then AnyoneCore.removeTimedWorldText(rec.text) end\n                rec.text = AnyoneCore.addTimedWorldText(40000, label, { x = s.x, y = s.y + 2.0, z = s.z }, GUI:ColorConvertFloat4ToU32(1, 1, 1, 1), true, 1.1)\n            end\n        end\n    end\nend\n\n-- Promote only the first unresolved element.\nfor i = 1, #data.npAnnounceOrder do\n    local e = data.npAnnounceOrder[i]\n    local unresolved = false\n    for eid, s in pairs(data.npSpots) do\n        if s.element == e and not (data.npDone and data.npDone[eid]) then\n            unresolved = true\n            break\n        end\n    end\n    if unresolved then\n        if e == element then data.npPromote(element) end\n        break\n    end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"c1627001-9366-4ce7-af80-aa6005b2c606",
								true,
							},
						},
						name = "NP - Orb Announce Order",
						uuid = "0a5d8c33-7e46-4f92-b1c8-de62f4a97b05",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\nlocal variant = a.newActiveAura1\nif variant ~= 2911 and variant ~= 2912 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil or ent.contentid ~= 14504 then return end\nif data.npFgCenter == nil then\n    AnyoneCore.log(\"[Fertile Ground] Arena center unavailable; volley ignored.\", 5)\n    self.used = true\n    return\nend\nif data.npFgVolleys == nil or (data.npFgLastAura ~= nil and TimeSince(data.npFgLastAura) > 30000) then\n    data.npFgVolleys = {}\n    data.npFgFirstAura = nil\nend\ndata.npFgLastAura = Now()\nif data.npFgVolleys[a.entityID] ~= nil then return end\nif data.npFgFirstAura == nil then data.npFgFirstAura = Now() end\nlocal idx = 0\nfor _ in pairs(data.npFgVolleys) do idx = idx + 1 end\nidx = idx + 1\ndata.npFgVolleys[a.entityID] = idx\n\nlocal FIRST_FIRE = 13200\nlocal CADENCE = 6000\nlocal fireIn = (data.npFgFirstAura + FIRST_FIRE + (idx - 1) * CADENCE) - Now()\nif fireIn < 0 then fireIn = 0 end\n\nlocal px, py, pz = ent.pos.x, ent.pos.y, ent.pos.z\nlocal hc = math.atan2(data.npFgCenter.x - px, data.npFgCenter.z - pz)\n-- Aura variant determines the half-color orientation.\nlocal blueH = hc + math.pi / 2\nlocal pinkH = hc - math.pi / 2\nif variant == 2912 then blueH, pinkH = pinkH, blueH end\n\nlocal showLead = 4500\nlocal delay = fireIn - showLead\nif delay < 0 then delay = 0 end\nlocal dur = fireIn - delay + 600\n\n-- Anchor halves at arena center so both sides cover evenly.\nlocal c = data.npFgCenter\nlocal blue = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.2, 0.9, 1.0, 0.18), 1)\nlocal pink = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.4, 0.8, 0.16), 1)\nblue:addTimedCone(dur, c.x, c.y, c.z, 30, math.pi, blueH, delay)\npink:addTimedCone(dur, c.x, c.y, c.z, 30, math.pi, pinkH, delay)\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n    AnyoneCore.addTimedWorldText(fireIn + 600, tostring(idx), { x = px, y = py + 2.0, z = pz }, GUI:ColorConvertFloat4ToU32(1, 1, 1, 1), true, 1.4)\nend\n-- The frame guide resolves personal safety shortly before each volley.\ndata.npFgVolleyList = data.npFgVolleyList or {}\ndata.npFgVolleyList[idx] = { x = px, z = pz, fireAt = Now() + fireIn, blueH = blueH, pinkH = pinkH }\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"e4a92c07-58d1-4b36-9f74-1a2d80c5e629",
								true,
							},
						},
						name = "NP - FG Volleys",
						uuid = "8c17f4a6-05be-4d29-a3e8-79b0d2c15e44",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\nlocal elem\nif a.newActiveAura1 == 2908 then\n    elem = \"fire\"\nelseif a.newActiveAura1 == 2909 then\n    elem = \"ice\"\nelseif a.newActiveAura1 == 2910 then\n    elem = \"thunder\"\nelse\n    return\nend\nif data.npFgActive == nil or TimeSince(data.npFgActive) > 120000 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil or ent.contentid ~= 14503 then return end\nlocal x, y, z = ent.pos.x, ent.pos.y, ent.pos.z\nlocal dur = 5000\nif elem == \"fire\" then\n    local red = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.35, 0.15, 0.45), 1)\n    red:addTimedCircle(dur, x, y, z, 18)\nelseif elem == \"ice\" then\n    local blue = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(0.35, 0.75, 1.0, 0.4), 1)\n    blue:addTimedCenteredRect(dur, x, y, z, 90, 15, 0)\n    blue:addTimedCenteredRect(dur, x, y, z, 90, 15, math.pi / 2)\nelse\n    local yellow = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.9, 0.2, 0.45), 1)\n    local rad45 = math.rad(45)\n    yellow:addTimedCone(dur, x, y, z, 60, rad45, math.pi / 4)\n    yellow:addTimedCone(dur, x, y, z, 60, rad45, 3 * math.pi / 4)\n    yellow:addTimedCone(dur, x, y, z, 60, rad45, -math.pi / 4)\n    yellow:addTimedCone(dur, x, y, z, 60, rad45, -3 * math.pi / 4)\nend\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n    local label = elem == \"fire\" and \"FIRE O\" or (elem == \"ice\" and \"ICE +\" or \"LTG X\")\n    AnyoneCore.addTimedWorldText(dur, label, { x = x, y = y + 2.5, z = z }, GUI:ColorConvertFloat4ToU32(1, 1, 1, 1), true, 1.3)\nend\n\n-- Carve the element from the pending volley's safe half.\nif data.npFgVolleyList ~= nil\n    and ArgusDrawsPlus ~= nil and ArgusDrawsPlus.getEnabled() == true\n    and Argus2 ~= nil and Argus2.getNextUnusedChannel ~= nil\n    and TensorCore.getStaticFlatDrawer ~= nil then\n    local player = TensorCore.mGetPlayer()\n    if player ~= nil and player.pos ~= nil then\n        local now = Now()\n        local v\n        for i = 1, #data.npFgVolleyList do\n            local cand = data.npFgVolleyList[i]\n            if cand ~= nil and not cand.done and cand.fireAt - now <= 6000 and cand.fireAt - now > -600 then\n                v = cand\n                break\n            end\n        end\n        local hasBlue = TensorCore.hasBuff(player.id, 5136)\n        local hasPink = TensorCore.hasBuff(player.id, 5137)\n        local safeH\n        if v ~= nil then\n            if hasPink and not hasBlue then\n                safeH = v.blueH\n            elseif hasBlue and not hasPink then\n                safeH = v.pinkH\n            end\n        end\n        if safeH ~= nil then\n            local channel = data.npFgSafeChannel\n            if channel == nil then\n                channel = Argus2.getNextUnusedChannel(true)\n                if channel == nil then channel = 2 end\n                data.npFgSafeChannel = channel\n            end\n            local green = 1493237504\n            local occ = Argus2.RenderFlags.FLAG_OCCLUDE\n            local hy = y + 0.05\n            local dur2 = (v.fireAt - now) + 600\n            local base = TensorCore.getStaticFlatDrawer(green, nil, channel)\n            base:addTimedCone(dur2, x, hy, z, 29.5, math.pi, safeH, 0, false, true, 0)\n            local cut = TensorCore.getStaticFlatDrawer(green, nil, channel)\n            if elem == \"fire\" then\n                cut:addTimedCircle(dur2, x, hy, z, 18, 0, false, false, occ)\n            elseif elem == \"ice\" then\n                cut:addTimedCenteredRect(dur2, x, hy, z, 90, 15, 0, 0, false, false, occ)\n                cut:addTimedCenteredRect(dur2, x, hy, z, 90, 15, math.pi / 2, 0, false, false, occ)\n            else\n                local rad45 = math.rad(45)\n                cut:addTimedCone(dur2, x, hy, z, 60, rad45, math.pi / 4, 0, false, false, occ)\n                cut:addTimedCone(dur2, x, hy, z, 60, rad45, 3 * math.pi / 4, 0, false, false, occ)\n                cut:addTimedCone(dur2, x, hy, z, 60, rad45, -math.pi / 4, 0, false, false, occ)\n                cut:addTimedCone(dur2, x, hy, z, 60, rad45, -3 * math.pi / 4, 0, false, false, occ)\n            end\n        end\n    end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"c1627001-9366-4ce7-af80-aa6005b2c606",
								true,
							},
						},
						name = "NP - FG Elements",
						uuid = "9e2a06b8-17cf-4e35-8d19-40c7f3a28b55",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\nlocal aura = a.newActiveAura1\nif aura ~= 2890 and aura ~= 2891 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.pos == nil or ent.contentid ~= 14722 then return end\n\nlocal cx, cz, cy = 0.0, -628.0, -684.0\ndata.idxPredict = data.idxPredict or {}\nif data.idxPredict[a.entityID] ~= nil then return end\n\nlocal spawnAng = math.atan2(ent.pos.x - cx, ent.pos.z - cz)\nlocal finAng = spawnAng - 1.0472\nlocal R = 15.55\nlocal fx = cx + R * math.sin(finAng)\nlocal fz = cz + R * math.cos(finAng)\ndata.idxPredict[a.entityID] = { x = fx, z = fz, aura = aura }\n\nlocal dur = 10400\nlocal red = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.35, 0.2, 0.45), 1)\nif aura == 2891 then\n    red:addTimedCircle(dur, fx, cy, fz, 10)\nelse\n    red:addTimedDonut(dur, fx, cy, fz, 3, 15)\nend\nif AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n    AnyoneCore.addTimedWorldText(dur, aura == 2891 and \"AWAY\" or \"UNDER\",\n        { x = fx, y = cy + 2.0, z = fz }, GUI:ColorConvertFloat4ToU32(1, 1, 1, 1), true, 1.3)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0011-4b2b-9c11-b2c1c105a011",
								true,
							},
						},
						name = "B4 - Predict Orbs",
						uuid = "1a2b3c4d-0018-4b2b-9c18-b2c1c105a018",
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
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0023-4b2b-9c23-b2c1c105a023",
								true,
							},
						},
						name = "B4 - Quadrilogy Glows",
						uuid = "1a2b3c4d-0028-4b2b-9c28-b2c1c105a028",
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
						localmapid = 1346,
						name = "North Horn",
						uuid = "d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
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
						uuid = "7c1f2ab0-4e11-4d92-9a3b-551be0c7d101",
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
						uuid = "1a2b3c4d-0001-4b2b-9c01-b2c1c105a001",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.newActiveAura1 == 2908 or eventArgs.newActiveAura1 == 2909 or eventArgs.newActiveAura1 == 2910)",
						dequeueIfLuaFalse = true,
						name = "Element Orb Aura",
						uuid = "c1627001-9366-4ce7-af80-aa6005b2c606",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.newActiveAura1 == 2911 or eventArgs.newActiveAura1 == 2912)",
						dequeueIfLuaFalse = true,
						name = "Head Volley Aura",
						uuid = "e4a92c07-58d1-4b36-9f74-1a2d80c5e629",
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
						uuid = "1a2b3c4d-0011-4b2b-9c11-b2c1c105a011",
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
						uuid = "1a2b3c4d-0023-4b2b-9c23-b2c1c105a023",
						version = 3,
					},
				},
			},
			eventType = 25,
			loop = true,
			name = "[FTM] Auras",
			uuid = "64597427-86ef-4286-ae28-d56b4951df36",
			version = 2,
		},
	},
	
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
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0022-4b2b-9c22-b2c1c105a022",
								true,
							},
						},
						name = "B2 - Sword Dance Marks",
						uuid = "1a2b3c4d-0021-4b2b-9c21-b2c1c105a021",
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
						localmapid = 1346,
						name = "North Horn",
						uuid = "d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
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
						uuid = "1a2b3c4d-0022-4b2b-9c22-b2c1c105a022",
						version = 3,
					},
				},
			},
			eventType = 19,
			loop = true,
			name = "[FTM] Objects",
			uuid = "1a2b3c4d-0019-4b2b-9c19-b2c1c105a019",
			version = 2,
		},
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil then return end\n-- Resolve content ID from the entity when absent from the payload.\nlocal cid = a.entityContentID\nif cid == nil then\n    local e = TensorCore.mGetEntity(a.entityID)\n    cid = e ~= nil and e.contentid or nil\nend\nif cid == nil then return end\nlocal POINTER = { [2015240] = \"FIRE\", [2015241] = \"ICE\", [2015242] = \"LIGHTNING\" }\nlocal RING = { [2015243] = \"FIRE\", [2015244] = \"ICE\", [2015245] = \"LIGHTNING\" }\nif POINTER[cid] == nil and RING[cid] == nil then return end\nlocal cx, cz, cy = 0.0, -628.0, -684.0\n\nif data.idxOmni == nil or (data.idxOmniAt ~= nil and TimeSince(data.idxOmniAt) > 45000) then\n    data.idxOmni = { dirs = {}, ringN = 0, seen = {} }\nend\ndata.idxOmniAt = Now()\nlocal st = data.idxOmni\n\nlocal COLOR = {\n    FIRE = { 1.0, 0.35, 0.15 },\n    ICE = { 0.35, 0.75, 1.0 },\n    LIGHTNING = { 1.0, 0.9, 0.2 },\n}\n\nif POINTER[cid] ~= nil then\n    if a.a2 ~= nil and a.a2 ~= 1 then return end\n    local ent = TensorCore.mGetEntity(a.entityID)\n    local h = ent ~= nil and ent.pos ~= nil and ent.pos.h or nil\n    if h == nil then return end\n    local elem = POINTER[cid]\n    st.dirs[elem] = h\n    -- Label both ends of each element axis.\n    if AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n        local c = COLOR[elem]\n        for _, sgn in ipairs({ 1, -1 }) do\n            AnyoneCore.addTimedWorldText(24000, elem,\n                { x = cx + sgn * 10 * math.sin(h), y = cy + 2.0, z = cz + sgn * 10 * math.cos(h) },\n                GUI:ColorConvertFloat4ToU32(c[1], c[2], c[3], 1), true, 1.5)\n        end\n    end\n    self.used = true\n    return\nend\n\n-- The second-ring gap distinguishes sequential and paired patterns.\nlocal elem = RING[cid]\nif data.idxOmniGuide == nil then\n    -- Replace the previous danger pair at the requested opacity.\n    data.idxOmniPair = function(rec2, alpha)\n        if rec2 == nil or rec2.h == nil then return end\n        if rec2.shapes ~= nil and Argus ~= nil and Argus.deleteTimedShape ~= nil then\n            for i = 1, #rec2.shapes do Argus.deleteTimedShape(rec2.shapes[i]) end\n        end\n        rec2.shapes = {}\n        -- Show order only for the imminent and next pairs.\n        if rec2.texts ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n            for i = 1, #rec2.texts do AnyoneCore.removeTimedWorldText(rec2.texts[i]) end\n        end\n        rec2.texts = {}\n        if rec2.n ~= nil and rec2.c ~= nil and AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n            for _, sgn in ipairs({ 1, -1 }) do\n                rec2.texts[#rec2.texts + 1] = AnyoneCore.addTimedWorldText(7500, tostring(rec2.n),\n                    { x = cx + sgn * 10 * math.sin(rec2.h), y = cy + 3.6, z = cz + sgn * 10 * math.cos(rec2.h) },\n                    GUI:ColorConvertFloat4ToU32(rec2.c[1], rec2.c[2], rec2.c[3], 1), true, 1.8)\n            end\n        end\n        if ArgusDrawsPlus ~= nil and ArgusDrawsPlus.getEnabled() == true\n            and TensorCore.getStaticFlatDrawer ~= nil\n            and Argus2 ~= nil and Argus2.getNextUnusedChannel ~= nil then\n            local ch2 = data.idxDangerChannel\n            if ch2 == nil then\n                ch2 = Argus2.getNextUnusedChannel(true)\n                if ch2 == nil then ch2 = 1 end\n                data.idxDangerChannel = ch2\n            end\n            local dr = TensorCore.getStaticFlatDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, alpha), 0, ch2)\n            rec2.shapes[#rec2.shapes + 1] = dr:addTimedCone(7500, cx, cy + 0.05, cz, 32, math.rad(60), rec2.h, 0, false, true, 0)\n            rec2.shapes[#rec2.shapes + 1] = dr:addTimedCone(7500, cx, cy + 0.05, cz, 32, math.rad(60), rec2.h + math.pi, 0, false, true, 0)\n        else\n            local d = TensorCore.getStaticDrawer(GUI:ColorConvertFloat4ToU32(1.0, 0.3, 0.15, alpha + 0.13), 1)\n            rec2.shapes[#rec2.shapes + 1] = d:addTimedCone(7500, cx, cy, cz, 32, math.rad(60), rec2.h)\n            rec2.shapes[#rec2.shapes + 1] = d:addTimedCone(7500, cx, cy, cz, 32, math.rad(60), rec2.h + math.pi)\n        end\n    end\n    -- Mark both axis ends unless the route selects one.\n    data.idxOmniGuide = function(st2, targetElem, label, endAng)\n        if st2.guideTexts ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n            for i = 1, #st2.guideTexts do AnyoneCore.removeTimedWorldText(st2.guideTexts[i]) end\n        end\n        st2.guideTexts = {}\n        if AnyoneCore == nil or AnyoneCore.addTimedWorldText == nil then return end\n        local angs\n        if endAng ~= nil then\n            angs = { endAng }\n        else\n            local h = st2.dirs[targetElem]\n            if h == nil then return end\n            angs = { h, h + math.pi }\n        end\n        for _, ang in ipairs(angs) do\n            st2.guideTexts[#st2.guideTexts + 1] = AnyoneCore.addTimedWorldText(14000, label,\n                { x = cx + 13 * math.sin(ang), y = cy + 1.6, z = cz + 13 * math.cos(ang) },\n                GUI:ColorConvertFloat4ToU32(0.3, 1.0, 0.4, 1.0), true, 1.5)\n        end\n    end\nend\nif a.a2 == 3 then\n    -- Clean the resolved pair and advance the route.\n    local rec = st.seen[a.entityID]\n    if rec ~= nil then\n        if rec.texts ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n            for i = 1, #rec.texts do AnyoneCore.removeTimedWorldText(rec.texts[i]) end\n            rec.texts = nil\n        end\n        if rec.shapes ~= nil and Argus ~= nil and Argus.deleteTimedShape ~= nil then\n            for i = 1, #rec.shapes do Argus.deleteTimedShape(rec.shapes[i]) end\n            rec.shapes = nil\n        end\n    end\n    local cl = st.cluster\n    if cl ~= nil then\n        cl.boomN = (cl.boomN or 0) + 1\n        -- Promote only the next two sequential pairs.\n        if cl.v2 ~= true and cl.recs ~= nil and data.idxOmniPair ~= nil then\n            data.idxOmniPair(cl.recs[cl.boomN + 1], 0.32)\n            data.idxOmniPair(cl.recs[cl.boomN + 2], 0.14)\n        end\n        -- Announce the next paired volley's safe element.\n        if cl.riders ~= nil and cl.boomN < 3 and AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n            local nr, ng = cl.riders[cl.boomN + 1], cl.seq[cl.boomN + 1]\n            if nr ~= nil and ng ~= nil then\n                local safe\n                for _, e in ipairs({ \"FIRE\", \"ICE\", \"LIGHTNING\" }) do\n                    if e ~= nr and e ~= ng then safe = e end\n                end\n                if safe ~= nil then\n                    AnyoneCore.Shotcall(\"Move counterclockwise, \" .. safe, true, 7)\n                    data.idxOmniSafeCall = { e = safe, at = Now() }\n                    data.idxOmniGuide(st, safe, \"GO \" .. safe)\n                end\n            end\n        end\n        if cl.plan ~= nil then\n            -- Move when the destination clears.\n            for i = 1, #cl.plan do\n                local hop = cl.plan[i]\n                if hop.moveSlot == cl.boomN then\n                    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n                        AnyoneCore.Shotcall(\"Move \" .. hop.to .. \" now\", true, 7)\n                    end\n                    data.idxOmniSafeCall = { e = hop.to, at = Now() }\n                    data.idxOmniGuide(st, hop.to, \"GO \" .. hop.to, hop.endAng)\n                    -- Preview the following hop.\n                    local nxt = cl.plan[i + 1]\n                    if nxt ~= nil and nxt.endAng ~= nil and AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n                        st.guideTexts[#st.guideTexts + 1] = AnyoneCore.addTimedWorldText(14000, \"THEN \" .. nxt.to,\n                            { x = cx + 13 * math.sin(nxt.endAng), y = cy + 1.6, z = cz + 13 * math.cos(nxt.endAng) },\n                            GUI:ColorConvertFloat4ToU32(0.3, 1.0, 0.4, 1.0), true, 1.5)\n                    end\n                end\n            end\n        end\n        -- Flush a deferred Predict personal call (TTS + GO texts)\n        -- once no route moves remain - it then lands right after\n        -- the final move call.\n        if data.idxRingDefer ~= nil and data.idxRingGo ~= nil then\n            local rem = false\n            if cl.plan ~= nil then\n                for i = 1, #cl.plan do\n                    if (cl.plan[i].moveSlot or 0) > cl.boomN then rem = true end\n                end\n            end\n            if not rem then\n                data.idxRingGo(data.idxRingDefer)\n                data.idxRingDefer = nil\n            end\n        end\n    end\n    self.used = true\n    return\nend\nif a.a2 ~= nil and a.a2 ~= 1 then return end\nif st.seen[a.entityID] ~= nil then return end\n-- Separate clusters by ring-spawn gaps.\nif st.cluster == nil or (st.lastRing ~= nil and TimeSince(st.lastRing) > 10000) then\n    st.cluster = { seq = {}, boomN = 0 }\n    if st.guideTexts ~= nil and AnyoneCore ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n        for i = 1, #st.guideTexts do AnyoneCore.removeTimedWorldText(st.guideTexts[i]) end\n        st.guideTexts = nil\n    end\nend\nlocal cl = st.cluster\n-- Ignore repeated events and rings beyond the six-slot pattern.\ncl.lastElemAt = cl.lastElemAt or {}\nif cl.lastElemAt[elem] ~= nil and TimeSince(cl.lastElemAt[elem]) < 2000 then return end\ncl.lastElemAt[elem] = Now()\nlocal prevRing = st.lastRing\nst.lastRing = Now()\nlocal n\nif cl.filled6 == true and #cl.seq == 6 then\n    -- Reconcile the physical sixth ring with the inferred slot.\n    cl.filled6 = nil\n    n = 6\n    if cl.seq[6] ~= elem then\n        AnyoneCore.log(\"[IDX Omni] Final ring prediction changed; correcting order.\", 5)\n        cl.seq[6] = elem\n    end\nelseif #cl.seq >= 6 then\n    AnyoneCore.log(\"[IDX Omni] Extra ring event ignored.\", 5)\n    return\nelse\n    cl.seq[#cl.seq + 1] = elem\n    n = #cl.seq\nend\nif n == 2 and prevRing ~= nil then\n    -- Short gaps are sequential; long gaps are paired.\n    cl.v2 = TimeSince(prevRing) > 3000\nend\nlocal rec = { shapes = {} }\nst.seen[a.entityID] = rec\n\nlocal h = st.dirs[elem]\nif h ~= nil then\n    local c = COLOR[elem]\n    rec.texts = {}\n    rec.n = n\n    rec.c = c\n    -- Sequential patterns show only the imminent and next pairs.\n    rec.h = h\n    cl.recs = cl.recs or {}\n    cl.recs[n] = rec\n    if data.idxOmniPair ~= nil then\n        if cl.v2 == true or n == 1 then\n            data.idxOmniPair(rec, 0.32)\n        elseif n == 2 then\n            data.idxOmniPair(rec, 0.14)\n        end\n    end\nelse\n    AnyoneCore.log(\"[IDX Omni] Pointer direction unavailable for \" .. elem .. \".\", 5)\nend\n\n-- Pair each ring with the matching pinwheel rider.\nlocal o2 = data.idxOmni2\nif o2 ~= nil and o2.riders ~= nil and TimeSince(o2.at) < 30000 then\n    cl.v2 = true\n    cl.riders = o2.riders\nend\nif cl.riders ~= nil and AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n    local safe\n    for _, e in ipairs({ \"FIRE\", \"ICE\", \"LIGHTNING\" }) do\n        if e ~= cl.riders[n] and e ~= elem then safe = e end\n    end\n    if n == 1 and safe ~= nil then\n        AnyoneCore.Shotcall(\"Start \" .. safe, true, 7)\n        data.idxOmniSafeCall = { e = safe, at = Now() }\n        data.idxOmniGuide(st, safe, \"START\")\n    end\n\nend\n\n-- Build the sequential movement route.\nif cl.v2 ~= true then\n    if n == 3 then\n        -- Start on the element whose first explosion is latest.\n        local seen3 = {}\n        for i = 1, 3 do seen3[cl.seq[i]] = true end\n        local startE = elem\n        for _, e in ipairs({ \"FIRE\", \"ICE\", \"LIGHTNING\" }) do\n            if not seen3[e] then startE = e end\n        end\n        cl.startElem = startE\n        if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n            AnyoneCore.Shotcall(\"Start \" .. startE, true, 7)\n        end\n        data.idxOmniSafeCall = { e = startE, at = Now() }\n        data.idxOmniGuide(st, startE, \"START\")\n    elseif n == 5 then\n        -- Infer the sixth ring from the two-per-element invariant.\n        local count = { FIRE = 0, ICE = 0, LIGHTNING = 0 }\n        for i = 1, 5 do count[cl.seq[i]] = count[cl.seq[i]] + 1 end\n        for _, e in ipairs({ \"FIRE\", \"ICE\", \"LIGHTNING\" }) do\n            if count[e] < 2 then cl.seq[6] = e cl.filled6 = true end\n        end\n        if cl.seq[6] == nil then\n            AnyoneCore.log(\"[IDX Omni] Invalid element distribution.\", 5)\n        else\n            local seq = cl.seq\n            local function nextBoom(e, after)\n                for k = after + 1, 6 do if seq[k] == e then return k end end\n                return 99\n            end\n            local plan = {}\n            local cur = cl.startElem or seq[3]\n            local hopAt = nextBoom(cur, 0)\n            while hopAt <= 6 do\n                local best, bestNext\n                for _, e in ipairs({ \"FIRE\", \"ICE\", \"LIGHTNING\" }) do\n                    if e ~= seq[hopAt] and e ~= cur then\n                        local nb = nextBoom(e, hopAt)\n                        if bestNext == nil or nb > bestNext then best, bestNext = e, nb end\n                    end\n                end\n                if best == nil then break end\n                plan[#plan + 1] = { slot = hopAt, to = best }\n                cur = best\n                hopAt = nextBoom(best, hopAt)\n            end\n            cl.plan = plan\n            -- Chain adjacent endpoints and move as each destination clears.\n            local me = TensorCore.mGetPlayer()\n            local prevAng\n            if me ~= nil and me.pos ~= nil then\n                prevAng = math.atan2(me.pos.x - cx, me.pos.z - cz)\n            end\n            local function nearestEnd(e2, ref)\n                local hh = st.dirs[e2]\n                if hh == nil then return nil end\n                if ref == nil then return hh end\n                local function ad(x)\n                    return math.abs((x - ref + math.pi) % (2 * math.pi) - math.pi)\n                end\n                if ad(hh) <= ad(hh + math.pi) then return hh end\n                return hh + math.pi\n            end\n            local words = {}\n            for i = 1, #plan do\n                local hop = plan[i]\n                local legal\n                for k = 1, hop.slot - 1 do\n                    if seq[k] == hop.to then legal = k end\n                end\n                hop.moveSlot = legal or (hop.slot - 1)\n                hop.endAng = nearestEnd(hop.to, prevAng)\n                prevAng = hop.endAng or prevAng\n                words[#words + 1] = hop.to\n            end\n            -- Bias adjacent stands toward their shared boundary.\n            if plan[2] ~= nil and plan[1].endAng ~= nil and plan[2].endAng ~= nil then\n                local dd = (plan[2].endAng - plan[1].endAng + math.pi) % (2 * math.pi) - math.pi\n                local sgn = dd >= 0 and 1 or -1\n                plan[1].endAng = plan[1].endAng + sgn * 0.31\n                plan[2].endAng = plan[2].endAng - sgn * 0.31\n            end\n            if #words > 0 and AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n                AnyoneCore.Shotcall(\"Then \" .. table.concat(words, \", then \"), true, 6)\n            end\n            if plan[1] ~= nil then\n                data.idxOmniGuide(st, plan[1].to, \"THEN \" .. plan[1].to, plan[1].endAng)\n            end\n        end\n    end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0010-4b2b-9c10-b2c1c105a010",
								true,
							},
						},
						name = "B4 - Omni Elements 2",
						uuid = "1a2b3c4d-0042-4b2b-9c42-b2c1c105a042",
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
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0022-4b2b-9c22-b2c1c105a022",
								true,
							},
						},
						name = "B2 - Sword Dance Marks 2",
						uuid = "1a2b3c4d-0043-4b2b-9c43-b2c1c105a043",
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
						localmapid = 1346,
						name = "North Horn",
						uuid = "d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
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
						uuid = "1a2b3c4d-0010-4b2b-9c10-b2c1c105a010",
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
						uuid = "1a2b3c4d-0022-4b2b-9c22-b2c1c105a022",
						version = 3,
					},
				},
			},
			eventType = 20,
			loop = true,
			name = "[FTM] Objects2",
			uuid = "1a2b3c4d-0040-4b2b-9c40-b2c1c105a040",
			version = 2,
		},
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.entityID == nil or a.newAnimID == nil then return end\nif a.index ~= nil and a.index ~= 1 then return end\nlocal CIRCLE_FIRST = { [3604] = true, [5896] = true, [6847] = true }\nlocal DONUT_FIRST = { [210] = true, [211] = true, [209] = true }\nlocal anim = a.newAnimID\nlocal idle34 = anim == 34\nif not CIRCLE_FIRST[anim] and not DONUT_FIRST[anim] and not idle34 then return end\nlocal ent = TensorCore.mGetEntity(a.entityID)\nif ent == nil or ent.contentid ~= 14825 then return end\n-- Post-set resting pose, not a setup tell.\nlocal spun = data.b2SpinAt ~= nil and data.b2SpinAt[a.entityID] or nil\nif spun ~= nil and TimeSince(spun) < 10000 then return end\ndata.b2RingOrder = data.b2RingOrder or {}\nlocal first\nif idle34 then\n    -- Setup-batch wipe to battle/idle = donut-first r10 (no pose ID\n    -- exists for it). A fresh real pose always wins over the wipe.\n    local prev = data.b2RingOrder[a.entityID]\n    if prev ~= nil and prev.tell ~= \"idle34\" and prev.at ~= nil and TimeSince(prev.at) < 15000 then return end\n    first = \"donut\"\nelse\n    first = CIRCLE_FIRST[anim] and \"chariot\" or \"donut\"\nend\ndata.b2RingOrder[a.entityID] = { first = first, at = Now(), tell = idle34 and \"idle34\" or \"pose\" }\n-- Update an existing unknown ring when its tell arrives late. The\n-- idle-34 tell only applies to r10 rings - on bigger rings a bare 34\n-- means the real pose event was lost, not donut-first.\nlocal rec = data.b2Rings ~= nil and data.b2Rings[a.entityID] or nil\nif rec ~= nil and rec.stage == 1 and (rec.first == nil or rec.assumed)\n    and not (idle34 and rec.r ~= 10) then\n    rec.first = first\n    rec.second = first == \"donut\" and \"chariot\" or \"donut\"\n    rec.assumed = nil\n    if data.b2RingDraw ~= nil then data.b2RingDraw(rec, rec.first, 12000) end\n    if data.b2RingOverlay ~= nil then data.b2RingOverlay() end\n    if data.b2RingNext ~= nil then data.b2RingNext() end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-004f-4b2b-9c4f-b2c1c105a04f",
								true,
							},
							
							{
								"1a2b3c4d-001b-4b2b-9c1b-b2c1c105a01b",
								true,
							},
						},
						name = "B2 - Cycloswords Order",
						uuid = "1a2b3c4d-001d-4b2b-9c1d-b2c1c105a01d",
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
						localmapid = 1346,
						name = "North Horn",
						uuid = "d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Event",
						dequeueIfLuaFalse = true,
						eventArgOptionType = 2,
						eventEntityContentID = 14825,
						name = "Cycloswords Ring Entity",
						uuid = "1a2b3c4d-004f-4b2b-9c4f-b2c1c105a04f",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "local a = eventArgs if a == nil or a.index ~= 1 then return false end local n = a.newAnimID if n == 209 or n == 210 or n == 211 or n == 3604 or n == 5896 or n == 6847 then return true end if n ~= 34 then return false end local e = a.entityID ~= nil and TensorCore.mGetEntity(a.entityID) or nil return e ~= nil and e.contentid == 14825",
						dequeueIfLuaFalse = true,
						name = "Cycloswords Idle Pose",
						uuid = "1a2b3c4d-001b-4b2b-9c1b-b2c1c105a01b",
						version = 3,
					},
				},
			},
			eventType = 23,
			loop = true,
			name = "[FTM] Anims",
			uuid = "1a2b3c4d-001c-4b2b-9c1c-b2c1c105a01c",
			version = 2,
		},
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.markerID == nil or a.entityID == nil then return end\nlocal ELEM = { [670] = \"LIGHTNING\", [671] = \"FIRE\", [672] = \"ICE\" }\nlocal elem = ELEM[a.markerID]\nif elem == nil then return end\n\nlocal me = TensorCore.mGetPlayer()\nif me == nil or me.id ~= a.entityID then\n    self.used = true\n    return\nend\n-- Personal call + GO texts as one unit so the defer path moves both.\nif data.idxRingGo == nil then\n    data.idxRingGo = function(elem2)\n        if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n            local say = elem2 == \"LIGHTNING\" and \"Lightning\" or (elem2 == \"FIRE\" and \"Fire\" or \"Ice\")\n            -- Echo guard: the omni safe call just named this element -\n            -- confirm instead of repeating.\n            local sc = data.idxOmniSafeCall\n            local verb = (sc ~= nil and sc.e == elem2 and TimeSince(sc.at) < 8000) and \"Stay \" or \"Go to \"\n            AnyoneCore.Shotcall(verb .. say, true, 8)\n        end\n        -- Mark both ends of the target element axis.\n        local st2 = data.idxOmni\n        local h = st2 ~= nil and st2.dirs ~= nil and st2.dirs[elem2] or nil\n        if h ~= nil and AnyoneCore ~= nil and AnyoneCore.addTimedWorldText ~= nil then\n            local cx, cz, cy = 0.0, -628.0, -684.0\n            if data.idxRingGoTexts ~= nil and AnyoneCore.removeTimedWorldText ~= nil then\n                for i = 1, #data.idxRingGoTexts do AnyoneCore.removeTimedWorldText(data.idxRingGoTexts[i]) end\n            end\n            data.idxRingGoTexts = {}\n            for _, s in ipairs({ 1, -1 }) do\n                data.idxRingGoTexts[#data.idxRingGoTexts + 1] = AnyoneCore.addTimedWorldText(12000, \"GO \" .. elem2,\n                    { x = cx + s * 13 * math.sin(h), y = cy + 1.6, z = cz + s * 13 * math.cos(h) },\n                    GUI:ColorConvertFloat4ToU32(0.3, 1.0, 0.4, 1.0), true, 1.6)\n            end\n        elseif h == nil and AnyoneCore ~= nil and AnyoneCore.log ~= nil then\n            AnyoneCore.log(\"[IDX Predict] Pointer axis unavailable; using callout only.\", 5)\n        end\n    end\nend\n-- Predict marker waves can interleave an omni v1 route (wave-3\n-- marks land ~1s before the cluster's last \"Move now\" call). While\n-- route moves are still pending, defer call AND texts - the omni\n-- boom handler flushes both right after its final move call.\nlocal defer = false\nlocal ocl = data.idxOmni ~= nil and data.idxOmni.cluster or nil\nif ocl ~= nil and ocl.plan ~= nil and data.idxOmniAt ~= nil and TimeSince(data.idxOmniAt) < 30000 then\n    for i = 1, #ocl.plan do\n        if (ocl.plan[i].moveSlot or 0) > (ocl.boomN or 0) then defer = true end\n    end\nend\nif defer then\n    data.idxRingDefer = elem\nelse\n    data.idxRingGo(elem)\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-002b-4b2b-9c2b-b2c1c105a02b",
								true,
							},
						},
						name = "B4 - Predict Rings",
						uuid = "1a2b3c4d-002e-4b2b-9c2e-b2c1c105a02e",
						version = 2.1,
					},
				},
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.markerID == nil or a.entityID == nil then return end\nlocal mk = a.markerID\nif mk ~= 344 and mk ~= 466 then return end\n-- Track the three marker waves independently.\nif data.idxFlamesSet == nil or TimeSince(data.idxFlamesSet.at) > 8000 then\n    data.idxFlamesSet = { at = Now(), batchAt = Now(), batchN = 1, me = false, called = false }\nend\nlocal fs = data.idxFlamesSet\nfs.at = Now()\nif TimeSince(fs.batchAt) > 600 then\n    fs.batchN = fs.batchN + 1\n    fs.batchAt = Now()\nend\nlocal me = TensorCore.mGetPlayer()\nif me ~= nil and me.id == a.entityID then\n    fs.me = true\n    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n        AnyoneCore.Shotcall(mk == 344 and \"Tankbuster on you\" or \"Spread on you\", true, 6)\n    end\nelseif fs.batchN >= 3 and not fs.me and not fs.called then\n    -- A same-tick personal marker can replace this unmarked call.\n    fs.called = true\n    if AnyoneCore ~= nil and AnyoneCore.Shotcall ~= nil then\n        AnyoneCore.Shotcall(\"Unmarked\", true, 6)\n    end\nend\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-0047-4b2b-9c47-b2c1c105a047",
								true,
							},
						},
						name = "B4 - Flames Spreads",
						uuid = "1a2b3c4d-0046-4b2b-9c46-b2c1c105a046",
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
						localmapid = 1346,
						name = "North Horn",
						uuid = "d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.markerID == 670 or eventArgs.markerID == 671 or eventArgs.markerID == 672)",
						dequeueIfLuaFalse = true,
						name = "Index Countdown Markers",
						uuid = "1a2b3c4d-002b-4b2b-9c2b-b2c1c105a02b",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and (eventArgs.markerID == 344 or eventArgs.markerID == 466)",
						dequeueIfLuaFalse = true,
						name = "Flames Spread Markers",
						uuid = "1a2b3c4d-0047-4b2b-9c47-b2c1c105a047",
						version = 3,
					},
				},
			},
			eventType = 4,
			loop = true,
			name = "[FTM] Markers",
			uuid = "1a2b3c4d-002d-4b2b-9c2d-b2c1c105a02d",
			version = 2,
		},
	},
	
	{
		data = 
		{
			actions = 
			{
				
				{
					data = 
					{
						aType = "Lua",
						actionLua = "local a = eventArgs\nif a == nil or a.a1 ~= 0 or a.a2 ~= 1 or a.a3 ~= 2 then return end\nif data.idxOmniFxAt ~= nil and TimeSince(data.idxOmniFxAt) < 20000 then return end\ndata.idxOmniFxAt = Now()\nself.used = true\n",
						conditions = 
						{
							
							{
								"d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
								true,
							},
							
							{
								"1a2b3c4d-003d-4b2b-9c3d-b2c1c105a03d",
								true,
							},
						},
						name = "B4 - Omni Set Start",
						uuid = "1a2b3c4d-003f-4b2b-9c3f-b2c1c105a03f",
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
						localmapid = 1346,
						name = "North Horn",
						uuid = "d4738a10-1f5c-4b6e-8a2d-30e1c5f7a900",
						version = 3,
					},
				},
				
				{
					data = 
					{
						category = "Lua",
						conditionLua = "return eventArgs ~= nil and eventArgs.a1 == 0 and eventArgs.a2 == 1 and eventArgs.a3 == 2",
						dequeueIfLuaFalse = true,
						name = "Omni Set Map Effect",
						uuid = "1a2b3c4d-003d-4b2b-9c3d-b2c1c105a03d",
						version = 3,
					},
				},
			},
			eventType = 14,
			loop = true,
			name = "[FTM] MapFX",
			uuid = "1a2b3c4d-003e-4b2b-9c3e-b2c1c105a03e",
			version = 2,
		},
	},
	
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
								"95c0fff9-a479-cd03-a82c-7990858f7c44",
								true,
							},
							
							{
								"8098bf97-6924-2747-932c-aac6980b4e62",
								true,
							},
						},
						name = "Mark Thief coffer",
						uuid = "4080defe-7f06-0919-8930-f538ceff97bd",
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
						uuid = "95c0fff9-a479-cd03-a82c-7990858f7c44",
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
						uuid = "8098bf97-6924-2747-932c-aac6980b4e62",
						version = 3,
					},
				},
			},
			eventType = 5,
			name = "[FTM][Thief] Track Hidden Coffer Spawn",
			uuid = "780cdc1c-9395-f0b9-b65b-ca997c31e70b",
			version = 2,
		},
	},
	
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
								"fa1fbf93-97ba-9ec8-a82a-a4d0b995645a",
								true,
							},
							
							{
								"d81cbb42-1346-5451-919d-4b644cc1bb89",
								true,
							},
						},
						name = "Mark Thief coffer",
						uuid = "0436301d-cbbd-5cb7-b064-81564bb22002",
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
						uuid = "fa1fbf93-97ba-9ec8-a82a-a4d0b995645a",
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
						uuid = "d81cbb42-1346-5451-919d-4b644cc1bb89",
						version = 3,
					},
				},
			},
			eventType = 22,
			name = "[FTM][Thief] Coffer Visibility Refresh",
			uuid = "64d10ab7-de76-a5dc-8680-17b98d5b2863",
			version = 2,
		},
	},
	
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
								"78a78408-46d1-9707-85aa-8a16fde18507",
								true,
							},
							
							{
								"c4cf38f9-ec77-d592-8838-c6307adff257",
								true,
							},
						},
						name = "Mark Thief coffer",
						uuid = "73b887cf-e38e-5649-ab34-79c711b0c4e3",
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
						uuid = "78a78408-46d1-9707-85aa-8a16fde18507",
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
						uuid = "c4cf38f9-ec77-d592-8838-c6307adff257",
						version = 3,
					},
				},
			},
			eventType = 26,
			name = "[FTM][Thief] Coffer Targetable Refresh",
			uuid = "b931fb98-93ee-1bdd-9105-2c774e8d9cad",
			version = 2,
		},
	},
	
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
								"66b2a5b6-e826-5504-95ff-602f4d74e837",
								true,
							},
							
							{
								"a5c4b9f8-f284-d2bb-8362-0387f503c592",
								true,
							},
						},
						name = "Clear Thief coffer marker",
						uuid = "cf567e3f-4051-7242-8374-2e786aa1f60f",
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
						uuid = "66b2a5b6-e826-5504-95ff-602f4d74e837",
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
						uuid = "a5c4b9f8-f284-d2bb-8362-0387f503c592",
						version = 3,
					},
				},
			},
			eventType = 6,
			name = "[FTM][Thief] Clear Removed Coffer",
			uuid = "233f2be2-1098-38bf-add3-ed04a71d2e5c",
			version = 2,
		},
	}, 
	inheritedProfiles = 
	{
	},
}



return tbl