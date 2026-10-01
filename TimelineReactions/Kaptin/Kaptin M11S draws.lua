local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "dd9b6d09-c214-6f45-dc2f-afbb12ecb759",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "913aaca2-4a04-c8ee-9ccb-4c00a7407772",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	}, 
	[4] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "675e1020-6ad6-c1d4-0822-f882cf7b2970",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[5] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "6a799725-e46b-5429-b55e-0bafcf8024b5",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[8] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "486264bc-8358-9e08-af7d-32f6cc3ede4c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[12] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "34b5c90b-4650-9d6f-a48d-92a59de70d5b",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[13] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "b1c705fe-4546-b942-a172-0ba015f0624e",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[14] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "b19e4df9-1d54-5045-4dbd-a44f25ca8009",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[18] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "ee636ffd-5732-8551-2621-4b03a32bd24d",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[25] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "e651840d-fa47-39f9-18da-c8d7862347dd",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[26] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "2fb9bb56-7abe-9d92-ffb2-947c3ce903e6",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[30] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "d67b50e7-7e16-691b-edb9-a9e94cf88d37",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[39] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "1f9d81b2-7862-a756-86c9-0c9ca7e8ffc2",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin M11S",
				uuid = "38342d90-b35e-d5f3-8b15-2dbf7932d5f4",
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
							actionLua = "\nlocal root=data.kaptinM11SDraws or {}\ndata.kaptinM11SDraws=root\nlocal now=Now()\nlocal st=root.dance\nif type(st)~=\"table\" or now>(tonumber(st.expiresAt) or 0) then\n st={seen={},handles={},expiresAt=now+7000}\n root.dance=st\nend\nlocal ent=TensorCore.mGetEntity(eventArgs.entityID)\nif ent==nil or ent.pos==nil then self.used=true return end\nlocal dx=ent.pos.x-100\nlocal dz=ent.pos.z-100\nif math.max(math.abs(dx),math.abs(dz))>10 then\n local dir\n if math.abs(dx)>math.abs(dz) then dir=dx>0 and \"E\" or \"W\"\n else dir=dz>0 and \"S\" or \"N\" end\n st.seen[dir]=true\nend\nif st.drawn then self.used=true return end\nlocal missing={}\nfor _,d in ipairs({\"N\",\"E\",\"S\",\"W\"}) do\n if st.seen[d]~=true then missing[#missing+1]=d end\nend\nif #missing~=1 then self.used=true return end\nlocal p=TensorCore.mGetPlayer()\nif p==nil or p.pos==nil then self.used=true return end\n\nlocal function getSelfSlot(p)\n local defs={\n  {\"MT\",\"Tank\",\"Topmost Partylist\"},{\"OT\",\"Tank\",\"Bottom-most Partylist\"},\n  {\"H1\",\"Healer\",\"Topmost Partylist\"},{\"H2\",\"Healer\",\"Bottom-most Partylist\"},\n  {\"M1\",\"Melee DPS\",\"Topmost Partylist\"},{\"M2\",\"Melee DPS\",\"Bottom-most Partylist\"},\n  {\"R1\",\"Ranged DPS\",\"Topmost Partylist\"},{\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\"},\n }\n local used={}\n local slot=nil\n for _,d in ipairs(defs) do\n  local e=TensorCore.getEntityByGroup(d[2],d[3],true)\n  if e==nil or e.id==nil or used[e.id] then return nil end\n  used[e.id]=true\n  if e.id==p.id then slot=d[1] end\n end\n return slot\nend\n\nlocal slot=getSelfSlot(p)\nif slot==nil then self.used=true return end\nlocal spots={\n N={MT={91.22712,99.96533},M1={91.22712,99.96533},OT={108.77124,100.00672},M2={108.77124,100.00672},H1={93.92909,114.813614},R1={93.92909,114.813614},H2={106.190475,114.97614},R2={106.190475,114.97614}},\n S={MT={108.77124,100.00672},M1={108.77124,100.00672},OT={91.22712,99.96533},M2={91.22712,99.96533},H1={106.07091,85.186386},R1={106.07091,85.186386},H2={93.80954,85.02384},R2={93.80954,85.02384}},\n E={MT={100.03467,91.22712},M1={100.03467,91.22712},OT={99.99328,108.77124},M2={99.99328,108.77124},H1={85.186386,93.92909},R1={85.186386,93.92909},H2={85.02386,106.190475},R2={85.02386,106.190475}},\n W={MT={99.96533,108.77288},M1={99.96533,108.77288},OT={100.00672,91.22876},M2={100.00672,91.22876},H1={114.813614,106.07091},R1={114.813614,106.07091},H2={114.97614,93.809525},R2={114.97614,93.809525}},\n}\nlocal opposite={N=\"S\",S=\"N\",E=\"W\",W=\"E\"}\nlocal safeKey=opposite[missing[1]]\nlocal pos=safeKey and spots[safeKey] and spots[safeKey][slot]\nif pos==nil then self.used=true return end\nlocal life=math.max(1000,math.floor((tonumber(eventArgs.channelTimeMax) or 5.2)*1000+250))\n\nlocal function greenDrawer()\n local fill=GUI:ColorConvertFloat4ToU32(0.10,1.00,0.25,0.90)\n local outline=GUI:ColorConvertFloat4ToU32(0.01,0.20,0.03,1.00)\n return TensorCore.getCachedFlatDrawer(fill,nil,fill,outline,1.5,0,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nend\nlocal function drawArrowAndDot(drawer,handles,p,x,z,life,radius)\n local dx=x-p.pos.x\n local dz=z-p.pos.z\n local dist=math.sqrt(dx*dx+dz*dz)\n if dist>0.2 then\n  local h=math.atan2(dx,dz)\n  local u=drawer:addTimedArrow(life,p.pos.x,p.pos.y+0.04,p.pos.z,h,math.max(0.25,dist-0.8),0.18,0.8,0.65,0,false,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\n  if u then handles[#handles+1]=u end\n end\n local u=drawer:addTimedCircle(life,x,p.pos.y+0.04,z,radius or 0.48,0,false,true,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\n if u then handles[#handles+1]=u end\nend\n\ndrawArrowAndDot(greenDrawer(),st.handles,p,pos[1],pos[2],life,0.48)\nst.drawn=true\nself.used=true",
							conditions = 
							{
								
								{
									"7e133a01-169c-b2b2-8f4a-bcc3daa435a0",
									true,
								},
							},
							name = "Draw my roster pair spot",
							uuid = "ed9d7b38-bb31-0a55-8999-2c0c3be537a6",
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
							conditionLua = "return eventArgs.spellID == 47036",
							dequeueIfLuaFalse = true,
							name = "Exact mechanic event",
							uuid = "7e133a01-169c-b2b2-8f4a-bcc3daa435a0",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M11S",
				eventType = 3,
				loop = true,
				mechanicTime = 144.7,
				name = "[Kaptin] Dance relative-north pair arrow",
				timeRange = true,
				timelineIndex = 39,
				timerEndOffset = 6,
				uuid = "4134f0f7-fdd9-cb9f-8af8-1d94f74f8ebb",
				version = 2,
			},
		},
	},
	[40] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "6c7e63f6-7035-a862-915f-f3dc1bf9fb86",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[41] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "d21ee363-8611-d08f-879b-3f51e63a80f3",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[43] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "e545362d-e416-53c9-1abf-00b799aea27d",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[44] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "17d6d6aa-72c0-4f0e-0f01-390858fe08fa",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[45] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "e6e087f7-59f7-f41b-3aeb-c3edb1550247",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[48] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "7fb4462e-5a9f-370a-f67f-5cd45d12387e",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[49] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "9930e0bb-c453-99d7-7013-ef29e000fb8b",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[61] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "7b634eb5-bd84-6c91-299f-2f4fa15bad85",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin M11S",
				uuid = "a8fe5c3a-f927-bb69-b0a8-9d83dde6b083",
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
							actionLua = "\nlocal p=TensorCore.mGetPlayer()\nlocal ent=TensorCore.mGetEntity(eventArgs.entityID)\nif p==nil or p.pos==nil or ent==nil or ent.pos==nil then self.used=true return end\nlocal root=data.kaptinM11SDraws or {}\ndata.kaptinM11SDraws=root\nlocal st=root.wind\nif type(st)~=\"table\" then st={handles={},seen={},actors={}} root.wind=st end\nif st.seen[eventArgs.entityID] then self.used=true return end\nst.seen[eventArgs.entityID]=true\nst.actors[#st.actors+1]=eventArgs.entityID\nif #st.actors<4 or st.drawn then self.used=true return end\n\nlocal function getSelfSlot(p)\n local defs={\n  {\"MT\",\"Tank\",\"Topmost Partylist\"},{\"OT\",\"Tank\",\"Bottom-most Partylist\"},\n  {\"H1\",\"Healer\",\"Topmost Partylist\"},{\"H2\",\"Healer\",\"Bottom-most Partylist\"},\n  {\"M1\",\"Melee DPS\",\"Topmost Partylist\"},{\"M2\",\"Melee DPS\",\"Bottom-most Partylist\"},\n  {\"R1\",\"Ranged DPS\",\"Topmost Partylist\"},{\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\"},\n }\n local used={}\n local slot=nil\n for _,d in ipairs(defs) do\n  local e=TensorCore.getEntityByGroup(d[2],d[3])\n  if e==nil or e.id==nil or used[e.id] then return nil end\n  used[e.id]=true\n  if e.id==p.id then slot=d[1] end\n end\n return slot\nend\n\nlocal slot=getSelfSlot(p)\nif slot==nil then self.used=true return end\nlocal slotQ={MT=\"N\",R1=\"N\",H1=\"W\",M1=\"W\",R2=\"E\",H2=\"E\",OT=\"S\",M2=\"S\"}\nlocal signs={N={MT=-1,R1=1},W={H1=-1,M1=1},E={R2=1,H2=-1},S={OT=-1,M2=1}}\nlocal wanted=slotQ[slot]\nlocal chosen=nil\nfor _,id in ipairs(st.actors) do\n local a=TensorCore.mGetEntity(id)\n if a~=nil and a.pos~=nil then\n  local dx=a.pos.x-100\n  local dz=a.pos.z-100\n  local q\n  if math.abs(dx)>math.abs(dz) then q=dx>0 and \"E\" or \"W\"\n  else q=dz>0 and \"S\" or \"N\" end\n  if q==wanted then chosen=a break end\n end\nend\nlocal sign=wanted and signs[wanted] and signs[wanted][slot]\nif chosen==nil or sign==nil then self.used=true return end\nlocal dx=chosen.pos.x-100\nlocal dz=chosen.pos.z-100\nlocal mag=math.sqrt(dx*dx+dz*dz)\nif mag<1 then self.used=true return end\nlocal ux=dx/mag\nlocal uz=dz/mag\nlocal tx=uz\nlocal tz=-ux\nlocal x=chosen.pos.x+ux*6+tx*sign*4\nlocal z=chosen.pos.z+uz*6+tz*sign*4\nlocal life=7000\n\nlocal greenFill=GUI:ColorConvertFloat4ToU32(0.10,1.00,0.25,0.90)\nlocal greenOutline=GUI:ColorConvertFloat4ToU32(0.01,0.20,0.03,1.00)\nlocal green=TensorCore.getCachedFlatDrawer(greenFill,nil,greenFill,greenOutline,1.5,0,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nlocal ax=x-p.pos.x\nlocal az=z-p.pos.z\nlocal dist=math.sqrt(ax*ax+az*az)\nif dist>0.2 then\n local h=math.atan2(ax,az)\n local u=green:addTimedArrow(life,p.pos.x,p.pos.y+0.04,p.pos.z,h,math.max(0.25,dist-0.8),0.18,0.8,0.65,0,false,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\n if u then st.handles[#st.handles+1]=u end\nend\nlocal u=green:addTimedCircle(life,x,p.pos.y+0.04,z,0.42,0,false,true,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nif u then st.handles[#st.handles+1]=u end\n\nlocal purpleFill=GUI:ColorConvertFloat4ToU32(0.70,0.22,1.00,0.92)\nlocal purpleOutline=GUI:ColorConvertFloat4ToU32(0.18,0.02,0.32,1.00)\nlocal purple=TensorCore.getCachedFlatDrawer(purpleFill,nil,purpleFill,purpleOutline,1.2,0,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nlocal h=math.atan2(ux,uz)\nu=purple:addTimedArrow(life,x,p.pos.y+0.05,z,h,3.0,0.16,0.9,0.58,0,false,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nif u then st.handles[#st.handles+1]=u end\nst.drawn=true\nself.used=true",
							conditions = 
							{
								
								{
									"f24fc3c9-91c7-6c2d-aff4-dc5be071a812",
									true,
								},
							},
							name = "Draw assigned wind bait after fourth Maelstrom",
							uuid = "f3272697-8149-d540-9dd4-9d19fe19fef6",
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
							conditionLua = "return eventArgs.entityContentID == 14307",
							dequeueIfLuaFalse = true,
							name = "Exact mechanic event",
							uuid = "f24fc3c9-91c7-6c2d-aff4-dc5be071a812",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M11S",
				eventType = 5,
				loop = true,
				mechanicTime = 225.152,
				name = "[Kaptin] Ultimate Trophy wind bait",
				timeRange = true,
				timelineIndex = 61,
				timerEndOffset = 0.5,
				timerStartOffset = -24,
				uuid = "583b6cac-edd8-13ea-8fce-15e9587ef48b",
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
							actionLua = "\nlocal root=data.kaptinM11SDraws\nlocal st=root and root.wind\nif type(st)==\"table\" then\n for _,u in ipairs(st.handles or {}) do if u then Argus.deleteTimedShape(u) end end\n root.wind=nil\nend\nself.used=true",
							conditions = 
							{
								
								{
									"140adab6-5d8b-9de8-95e8-fe497b06208c",
									true,
								},
							},
							name = "Remove wind guidance on hit",
							uuid = "12db3db9-6843-8e99-b8aa-e225c35f20da",
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
							conditionLua = "return eventArgs.spellID == 46119",
							dequeueIfLuaFalse = true,
							name = "Exact mechanic event",
							uuid = "140adab6-5d8b-9de8-95e8-fe497b06208c",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M11S",
				eventType = 2,
				loop = true,
				mechanicTime = 225.152,
				name = "[Kaptin] Ultimate Trophy wind cleanup",
				timeRange = true,
				timelineIndex = 61,
				timerEndOffset = 1.5,
				timerStartOffset = -0.5,
				uuid = "0d3394c5-35b6-4103-926b-512bff950985",
				version = 2,
			},
		},
	},
	[62] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "bf22a45e-3c61-4daa-f367-6c34661e3a2e",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[64] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "03184944-9249-1f48-e3b6-d5ce89f34114",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[72] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "f8c9d945-0cb6-68a1-e602-666b8c3c0095",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[79] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "ff4e8bb6-6910-f7d2-3c1a-8ff85b006146",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin M11S",
				uuid = "9224524d-8021-e8f4-ad02-239b39a86e67",
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
							actionLua = "\nlocal p=TensorCore.mGetPlayer()\nif p==nil or p.pos==nil or eventArgs.entityID~=p.id then self.used=true return end\n\nlocal function getSelfSlot(p)\n local defs={\n  {\"MT\",\"Tank\",\"Topmost Partylist\"},{\"OT\",\"Tank\",\"Bottom-most Partylist\"},\n  {\"H1\",\"Healer\",\"Topmost Partylist\"},{\"H2\",\"Healer\",\"Bottom-most Partylist\"},\n  {\"M1\",\"Melee DPS\",\"Topmost Partylist\"},{\"M2\",\"Melee DPS\",\"Bottom-most Partylist\"},\n  {\"R1\",\"Ranged DPS\",\"Topmost Partylist\"},{\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\"},\n }\n local used={}\n local slot=nil\n for _,d in ipairs(defs) do\n  local e=TensorCore.getEntityByGroup(d[2],d[3])\n  if e==nil or e.id==nil or used[e.id] then return nil end\n  used[e.id]=true\n  if e.id==p.id then slot=d[1] end\n end\n return slot\nend\n\nlocal slot=getSelfSlot(p)\nlocal spots={\n M1={105.65685,94.34315},M2={94.34315,105.65685},\n H1={94.34315,94.34315},H2={90.10051,109.89949},\n R2={105.65685,94.34315},R1={85.85786,114.14214},\n}\nlocal pos=slot and spots[slot]\nif pos==nil then self.used=true return end\nlocal root=data.kaptinM11SDraws or {}\ndata.kaptinM11SDraws=root\nroot.meteor=root.meteor or {handles={}}\nlocal st=root.meteor\nfor _,u in ipairs(st.handles or {}) do if u then Argus.deleteTimedShape(u) end end\nst.handles={}\n\nlocal function greenDrawer()\n local fill=GUI:ColorConvertFloat4ToU32(0.10,1.00,0.25,0.90)\n local outline=GUI:ColorConvertFloat4ToU32(0.01,0.20,0.03,1.00)\n return TensorCore.getCachedFlatDrawer(fill,nil,fill,outline,1.5,0,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nend\nlocal function drawArrowAndDot(drawer,handles,p,x,z,life,radius)\n local dx=x-p.pos.x\n local dz=z-p.pos.z\n local dist=math.sqrt(dx*dx+dz*dz)\n if dist>0.2 then\n  local h=math.atan2(dx,dz)\n  local u=drawer:addTimedArrow(life,p.pos.x,p.pos.y+0.04,p.pos.z,h,math.max(0.25,dist-0.8),0.18,0.8,0.65,0,false,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\n  if u then handles[#handles+1]=u end\n end\n local u=drawer:addTimedCircle(life,x,p.pos.y+0.04,z,radius or 0.48,0,false,true,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\n if u then handles[#handles+1]=u end\nend\n\ndrawArrowAndDot(greenDrawer(),st.handles,p,pos[1],pos[2],8400,0.52)\nself.used=true",
							conditions = 
							{
								
								{
									"5c6a91e8-e308-dad6-86e5-4029f3154562",
									true,
								},
							},
							name = "Draw my assigned meteor drop",
							uuid = "12548c63-ac28-83f4-a215-36011535d2b5",
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
							conditionLua = "return eventArgs.markerID == 244",
							dequeueIfLuaFalse = true,
							name = "Exact mechanic event",
							uuid = "5c6a91e8-e308-dad6-86e5-4029f3154562",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M11S",
				eventType = 4,
				loop = true,
				mechanicTime = 291.105,
				name = "[Kaptin] Meteorain M-H-R drop arrow",
				timeRange = true,
				timelineIndex = 79,
				timerEndOffset = 32,
				uuid = "26a4dc9b-f521-8041-9b74-dcb39d88851a",
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
							actionLua = "\nlocal p=TensorCore.mGetPlayer()\nlocal target=TensorCore.mGetEntity(eventArgs.newTargetID)\nlocal source=TensorCore.mGetEntity(eventArgs.sourceEntityID)\nif p==nil or p.pos==nil or target==nil or target.pos==nil or source==nil or source.pos==nil then self.used=true return end\n\nlocal function getSelfSlot(p)\n local defs={\n  {\"MT\",\"Tank\",\"Topmost Partylist\"},{\"OT\",\"Tank\",\"Bottom-most Partylist\"},\n  {\"H1\",\"Healer\",\"Topmost Partylist\"},{\"H2\",\"Healer\",\"Bottom-most Partylist\"},\n  {\"M1\",\"Melee DPS\",\"Topmost Partylist\"},{\"M2\",\"Melee DPS\",\"Bottom-most Partylist\"},\n  {\"R1\",\"Ranged DPS\",\"Topmost Partylist\"},{\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\"},\n }\n local used={}\n local slot=nil\n for _,d in ipairs(defs) do\n  local e=TensorCore.getEntityByGroup(d[2],d[3])\n  if e==nil or e.id==nil or used[e.id] then return nil end\n  used[e.id]=true\n  if e.id==p.id then slot=d[1] end\n end\n return slot\nend\n\nlocal slot=getSelfSlot(p)\nlocal assigned=false\nif slot==\"MT\" then assigned=target.pos.z<100\nelseif slot==\"OT\" then assigned=target.pos.x<100 and target.pos.z>=100 end\nif not assigned then self.used=true return end\nlocal root=data.kaptinM11SDraws or {}\ndata.kaptinM11SDraws=root\nroot.meteor=root.meteor or {handles={}}\nlocal st=root.meteor\nlocal life=4800\nlocal fill=GUI:ColorConvertFloat4ToU32(0.10,1.00,0.25,0.92)\nlocal outline=GUI:ColorConvertFloat4ToU32(0.01,0.20,0.03,1.00)\nlocal drawer=TensorCore.getCachedFlatDrawer(fill,nil,fill,outline,1.4,0,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nlocal u=drawer:addTimedRectOnEnt(life,eventArgs.sourceEntityID,1,0.45,eventArgs.newTargetID,0,false,false,true,0,false,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nif u then st.handles[#st.handles+1]=u end\nlocal mx=(source.pos.x+target.pos.x)*0.5\nlocal mz=(source.pos.z+target.pos.z)*0.5\nlocal dx=mx-p.pos.x\nlocal dz=mz-p.pos.z\nlocal dist=math.sqrt(dx*dx+dz*dz)\nif dist>0.2 then\n local h=math.atan2(dx,dz)\n u=drawer:addTimedArrow(life,p.pos.x,p.pos.y+0.04,p.pos.z,h,math.max(0.25,dist-0.8),0.18,0.8,0.65,0,false,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\n if u then st.handles[#st.handles+1]=u end\nend\nu=drawer:addTimedCircle(life,mx,p.pos.y+0.04,mz,0.42,0,false,true,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nif u then st.handles[#st.handles+1]=u end\nself.used=true",
							conditions = 
							{
								
								{
									"649abede-b832-2c23-ab51-64e052ca9a4d",
									true,
								},
							},
							name = "Highlight my tank tether",
							uuid = "e4c42cf9-c82d-170a-8d29-eb54e1ce7ba8",
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
							conditionLua = "return eventArgs.newTetherID == 356 and eventArgs.newTargetContentID == 14306",
							dequeueIfLuaFalse = true,
							name = "Exact mechanic event",
							uuid = "649abede-b832-2c23-ab51-64e052ca9a4d",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M11S",
				eventType = 15,
				loop = true,
				mechanicTime = 291.105,
				name = "[Kaptin] Meteorain tank tether priority",
				timeRange = true,
				timelineIndex = 79,
				timerEndOffset = 35,
				uuid = "4ce38793-4082-77e8-8346-38ed086e2777",
				version = 2,
			},
		},
	},
	[82] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "69a565ec-88a2-66c0-aeda-8416b4afecbc",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[86] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "b6490d98-ea35-17d4-7cdd-2fca58d6efe8",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[95] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "aabf637c-fef1-f998-f472-dd5a236d3acc",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[100] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "875da0b9-685d-65f5-ba7a-62fb40b8ab89",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[101] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "157d0024-1e21-edb0-6e2f-1d6e408f2434",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[102] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "6d456bbf-78a5-c5ab-e63e-c3c576c6e74f",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[103] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "d30d2052-2c48-869e-2d6e-6540f457eb22",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[104] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "3458ac15-30cf-9999-0f3b-10efcd96d5a5",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[105] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "34959e50-5d20-1784-0e31-2cc2ca7b4ea0",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[109] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "ef15a6ac-7565-fc38-ecc3-7636ab7fa33c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[110] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "469fa8a6-15c4-db62-68d3-3df00e994cf6",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[111] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "1bf96e93-2ba1-038f-68d8-39357439cc63",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[114] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "9e78ad9a-184f-820e-f08d-33c4b9f1bfaa",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[115] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "29e32ee7-ff87-271b-ac44-cbd988fb70f7",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[121] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "128a825e-dbb6-edba-8be9-25b422d51bee",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[127] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "56802744-0b10-92d8-7c38-8f4e43a714d4",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[137] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "2813dc4f-9c38-8d63-866e-e0114e8b89df",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[145] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "d0d594d4-0a13-24c0-e0ac-b526da2f1864",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Kaptin M11S",
				uuid = "f0ef899a-1cb0-d9dc-a3c3-03b290a460d3",
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
							actionLua = "\nlocal root=data.kaptinM11SDraws or {}\ndata.kaptinM11SDraws=root\nlocal old=root.ecliptic\nif type(old)==\"table\" then\n for _,u in ipairs(old.handles or {}) do if u then Argus.deleteTimedShape(u) end end\nend\nroot.ecliptic={markers={},markerOrder={},proximity={},tethers={},handles={}}\nself.used=true",
							conditions = 
							{
								
								{
									"2e97dc40-4f9f-9387-b8d0-5b52928e5527",
									true,
								},
							},
							name = "Reset fixed Stampede state",
							uuid = "5449bf26-ae2b-3950-8566-7e73bba21a5b",
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
							conditionLua = "return eventArgs.spellID == 46162",
							dequeueIfLuaFalse = true,
							name = "Exact mechanic event",
							uuid = "2e97dc40-4f9f-9387-b8d0-5b52928e5527",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M11S",
				eventType = 3,
				loop = true,
				mechanicTime = 534.339,
				name = "[Kaptin] Fixed Stampede reset",
				timeRange = true,
				timelineIndex = 145,
				timerEndOffset = 1,
				timerStartOffset = -6,
				uuid = "5e52ce23-ca0a-875d-8f41-14998fcbd24b",
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
							actionLua = "\nlocal root=data.kaptinM11SDraws or {}\ndata.kaptinM11SDraws=root\nlocal st=root.ecliptic\nif type(st)~=\"table\" then st={markers={},markerOrder={},proximity={},tethers={},handles={}} root.ecliptic=st end\n\nlocal function getRoster()\n local defs={\n  {\"MT\",\"Tank\",\"Topmost Partylist\"},{\"OT\",\"Tank\",\"Bottom-most Partylist\"},\n  {\"H1\",\"Healer\",\"Topmost Partylist\"},{\"H2\",\"Healer\",\"Bottom-most Partylist\"},\n  {\"M1\",\"Melee DPS\",\"Topmost Partylist\"},{\"M2\",\"Melee DPS\",\"Bottom-most Partylist\"},\n  {\"R1\",\"Ranged DPS\",\"Topmost Partylist\"},{\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\"},\n }\n local byID={}\n local used={}\n for _,d in ipairs(defs) do\n  local e=TensorCore.getEntityByGroup(d[2],d[3])\n  if e==nil or e.id==nil or used[e.id] then return nil end\n  used[e.id]=true\n  byID[e.id]=d[1]\n end\n return byID\nend\n\nlocal roster=getRoster()\nif roster==nil then self.used=true return end\nlocal slot=roster[eventArgs.entityID]\nif slot~=\"H1\" and slot~=\"H2\" and slot~=\"R1\" and slot~=\"R2\" then self.used=true return end\nif st.markers[eventArgs.entityID]==nil then\n local e=TensorCore.mGetEntity(eventArgs.entityID)\n st.markers[eventArgs.entityID]={slot=slot,x=e and e.pos and e.pos.x or nil,z=e and e.pos and e.pos.z or nil}\n st.markerOrder[#st.markerOrder+1]=eventArgs.entityID\nend\nself.used=true",
							conditions = 
							{
								
								{
									"0fc6e2be-500f-973e-afc5-503ec51ef9bf",
									true,
								},
							},
							name = "Record marked H-R players",
							uuid = "9b73eff9-4b77-1c78-98dc-02e68b4dd8fb",
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
							conditionLua = "return eventArgs.markerID == 30",
							dequeueIfLuaFalse = true,
							name = "Exact mechanic event",
							uuid = "0fc6e2be-500f-973e-afc5-503ec51ef9bf",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M11S",
				eventType = 4,
				loop = true,
				mechanicTime = 534.339,
				name = "[Kaptin] Fixed Stampede record marked ranged",
				timeRange = true,
				timelineIndex = 145,
				timerEndOffset = 4,
				uuid = "b848924c-c5b1-a6be-a768-3b6ec44dd35b",
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
							actionLua = "\nlocal root=data.kaptinM11SDraws or {}\ndata.kaptinM11SDraws=root\nlocal st=root.ecliptic\nif type(st)~=\"table\" then self.used=true return end\nlocal e=TensorCore.mGetEntity(eventArgs.entityID)\nif e==nil or e.pos==nil then self.used=true return end\nlocal q=(e.pos.x>=100 and e.pos.z<100) and \"NE\" or ((e.pos.x<100 and e.pos.z>=100) and \"SW\" or nil)\nif q then st.proximity[q]={x=e.pos.x,z=e.pos.z} end\nif st.markerSolved or st.proximity.NE==nil or st.proximity.SW==nil or #(st.markerOrder or {})~=2 then self.used=true return end\nlocal priority={R1=1,R2=2,H1=3,H2=4}\nlocal a=st.markerOrder[1]\nlocal b=st.markerOrder[2]\nlocal ma=st.markers[a]\nlocal mb=st.markers[b]\nif ma==nil or mb==nil or priority[ma.slot]==nil or priority[mb.slot]==nil then self.used=true return end\nif priority[ma.slot]<priority[mb.slot] then st.markerSide={[a]=\"NW\",[b]=\"SE\"}\nelse st.markerSide={[b]=\"NW\",[a]=\"SE\"} end\nst.markerSolved=true\nlocal p=TensorCore.mGetPlayer()\nif p==nil or p.pos==nil or st.markerSide[p.id]==nil then self.used=true return end\nlocal pos=st.markerSide[p.id]==\"NW\" and {92,82} or {108,118}\n\nlocal function greenDrawer()\n local fill=GUI:ColorConvertFloat4ToU32(0.10,1.00,0.25,0.90)\n local outline=GUI:ColorConvertFloat4ToU32(0.01,0.20,0.03,1.00)\n return TensorCore.getCachedFlatDrawer(fill,nil,fill,outline,1.5,0,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nend\nlocal function drawArrowAndDot(drawer,handles,p,x,z,life,radius)\n local dx=x-p.pos.x\n local dz=z-p.pos.z\n local dist=math.sqrt(dx*dx+dz*dz)\n if dist>0.2 then\n  local h=math.atan2(dx,dz)\n  local u=drawer:addTimedArrow(life,p.pos.x,p.pos.y+0.04,p.pos.z,h,math.max(0.25,dist-0.8),0.18,0.8,0.65,0,false,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\n  if u then handles[#handles+1]=u end\n end\n local u=drawer:addTimedCircle(life,x,p.pos.y+0.04,z,radius or 0.48,0,false,true,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\n if u then handles[#handles+1]=u end\nend\n\ndrawArrowAndDot(greenDrawer(),st.handles,p,pos[1],pos[2],6100,0.45)\nself.used=true",
							conditions = 
							{
								
								{
									"c263e282-d4c4-d8bf-b722-b14fc1ff7f85",
									true,
								},
							},
							name = "Draw marked player's safe corner",
							uuid = "47c645a9-15b8-fc19-8d9b-fd043923c9d4",
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
							conditionLua = "return eventArgs.spellID == 46163",
							dequeueIfLuaFalse = true,
							name = "Exact mechanic event",
							uuid = "c263e282-d4c4-d8bf-b722-b14fc1ff7f85",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M11S",
				eventType = 3,
				loop = true,
				mechanicTime = 534.339,
				name = "[Kaptin] Fixed Stampede marked bait corner",
				timeRange = true,
				timelineIndex = 145,
				timerEndOffset = 8,
				uuid = "d371a8c8-8c3b-6c5b-9022-9a61f69d61ec",
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
							actionLua = "\nlocal root=data.kaptinM11SDraws or {}\ndata.kaptinM11SDraws=root\nlocal st=root.ecliptic\nif type(st)~=\"table\" then self.used=true return end\nlocal source=TensorCore.mGetEntity(eventArgs.sourceEntityID)\nif source==nil or source.pos==nil then self.used=true return end\nlocal dx=source.pos.x-100\nlocal dz=source.pos.z-100\nlocal portal\nif math.abs(dz)>=math.abs(dx) then portal=dz<0 and \"N\" or \"S\"\nelse portal=dx<0 and \"W\" or \"E\" end\nlocal destination={N=\"SW\",E=\"NW\",S=\"NE\",W=\"SE\"}\nlocal q=destination[portal]\nif q~=nil then\n st.tethers[eventArgs.newTargetID]={destination=q,portal=portal,sourceID=eventArgs.sourceEntityID}\nend\nself.used=true",
							conditions = 
							{
								
								{
									"3321c95d-79d5-5708-8c04-276e13627213",
									true,
								},
							},
							name = "Record tether portal and far corner",
							uuid = "3cbe307e-5bef-5609-8f94-b33c85f3a77e",
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
							conditionLua = "return (eventArgs.newTetherID == 57 or eventArgs.newTetherID == 249) and eventArgs.newTargetID ~= nil and eventArgs.newTargetID > 0",
							dequeueIfLuaFalse = true,
							name = "Exact mechanic event",
							uuid = "3321c95d-79d5-5708-8c04-276e13627213",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M11S",
				eventType = 15,
				loop = true,
				mechanicTime = 534.339,
				name = "[Kaptin] Fixed Stampede record tethers",
				timeRange = true,
				timelineIndex = 145,
				timerEndOffset = 35,
				timerStartOffset = 16,
				uuid = "13fc5af3-4a9f-9866-9a88-ac73c1e3fda7",
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
							actionLua = "\nlocal root=data.kaptinM11SDraws or {}\ndata.kaptinM11SDraws=root\nlocal st=root.ecliptic\nif type(st)~=\"table\" then self.used=true return end\nst.mode=eventArgs.spellID==46170 and \"four\" or \"two\"\nlocal p=TensorCore.mGetPlayer()\nif p==nil or p.pos==nil then self.used=true return end\n\nlocal function getSelfSlot(p)\n local defs={\n  {\"MT\",\"Tank\",\"Topmost Partylist\"},{\"OT\",\"Tank\",\"Bottom-most Partylist\"},\n  {\"H1\",\"Healer\",\"Topmost Partylist\"},{\"H2\",\"Healer\",\"Bottom-most Partylist\"},\n  {\"M1\",\"Melee DPS\",\"Topmost Partylist\"},{\"M2\",\"Melee DPS\",\"Bottom-most Partylist\"},\n  {\"R1\",\"Ranged DPS\",\"Topmost Partylist\"},{\"R2\",\"Ranged DPS\",\"Bottom-most Partylist\"},\n }\n local used={}\n local slot=nil\n for _,d in ipairs(defs) do\n  local e=TensorCore.getEntityByGroup(d[2],d[3])\n  if e==nil or e.id==nil or used[e.id] then return nil end\n  used[e.id]=true\n  if e.id==p.id then slot=d[1] end\n end\n return slot\nend\n\nlocal slot=getSelfSlot(p)\nif slot==nil then self.used=true return end\nlocal pos=nil\nlocal tether=st.tethers[p.id]\nif tether~=nil then\n local far={NW={82,82},NE={118,82},SW={82,118},SE={118,118}}\n pos=far[tether.destination]\nelse\n local side=st.markerSide and st.markerSide[p.id]\n if st.mode==\"four\" then\n  if side==\"NW\" then pos={97.5,97.5}\n  elseif side==\"SE\" then pos={102.5,97.5}\n  elseif slot==\"M1\" then pos={97.5,102.5}\n  elseif slot==\"M2\" then pos={102.5,102.5} end\n else\n  if side==\"NW\" then pos={92,100}\n  elseif side==\"SE\" then pos={108,100}\n  elseif slot==\"M1\" then pos={96,100}\n  elseif slot==\"M2\" then pos={104,100} end\n end\nend\nif pos==nil then self.used=true return end\n\nfor _,u in ipairs(st.handles or {}) do if u then Argus.deleteTimedShape(u) end end\nst.handles={}\nlocal fill=GUI:ColorConvertFloat4ToU32(0.10,1.00,0.25,0.90)\nlocal outline=GUI:ColorConvertFloat4ToU32(0.01,0.20,0.03,1.00)\nlocal drawer=TensorCore.getCachedFlatDrawer(fill,nil,fill,outline,1.5,0,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nlocal dx=pos[1]-p.pos.x\nlocal dz=pos[2]-p.pos.z\nlocal dist=math.sqrt(dx*dx+dz*dz)\nlocal life=math.floor((tonumber(eventArgs.channelTimeMax) or 5.7)*1000+900)\nif dist>0.2 then\n local h=math.atan2(dx,dz)\n local u=drawer:addTimedArrow(life,p.pos.x,p.pos.y+0.04,p.pos.z,h,math.max(0.25,dist-0.8),0.18,0.8,0.65,0,false,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\n if u then st.handles[#st.handles+1]=u end\nend\nlocal u=drawer:addTimedCircle(life,pos[1],p.pos.y+0.04,pos[2],0.46,0,false,true,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nif u then st.handles[#st.handles+1]=u end\nself.used=true",
							conditions = 
							{
								
								{
									"c9b77e54-8760-34fa-b5e8-38bcce6b38d6",
									true,
								},
							},
							name = "Draw fixed fireball or tether position",
							uuid = "68b91f82-ebc4-d943-a9fd-ae95c95924a2",
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
							conditionLua = "return eventArgs.spellID == 46170 or eventArgs.spellID == 47037",
							dequeueIfLuaFalse = true,
							name = "Exact mechanic event",
							uuid = "c9b77e54-8760-34fa-b5e8-38bcce6b38d6",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M11S",
				eventType = 3,
				loop = true,
				mechanicTime = 534.339,
				name = "[Kaptin] Fixed Stampede two-four-way arrow",
				timeRange = true,
				timelineIndex = 145,
				timerEndOffset = 38,
				timerStartOffset = 25,
				uuid = "e125620c-7afb-8d8b-9061-8401727c438b",
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
							actionLua = "\nlocal root=data.kaptinM11SDraws\nlocal st=root and root.ecliptic\nlocal p=TensorCore.mGetPlayer()\nif type(st)~=\"table\" or p==nil or p.pos==nil or st.mode==nil or st.tethers[p.id]==nil or st.afterTetherDrawn then self.used=true return end\nlocal hit=false\nfor _,id in ipairs(eventArgs.hitTargets or {}) do if id==p.id then hit=true break end end\nif not hit then self.used=true return end\nlocal tether=st.tethers[p.id]\nlocal q=tether.destination\nlocal pos=nil\nif st.mode==\"four\" then\n local outer={NW={95,95},NE={105,95},SW={95,105},SE={105,105}}\n pos=outer[q]\nelse\n if q==\"NW\" or q==\"SW\" then pos={92,100}\n elseif q==\"NE\" or q==\"SE\" then pos={108,100} end\nend\nif pos==nil then self.used=true return end\nfor _,u in ipairs(st.handles or {}) do if u then Argus.deleteTimedShape(u) end end\nst.handles={}\nlocal fill=GUI:ColorConvertFloat4ToU32(0.10,1.00,0.25,0.90)\nlocal outline=GUI:ColorConvertFloat4ToU32(0.01,0.20,0.03,1.00)\nlocal drawer=TensorCore.getCachedFlatDrawer(fill,nil,fill,outline,1.5,0,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nlocal dx=pos[1]-p.pos.x\nlocal dz=pos[2]-p.pos.z\nlocal dist=math.sqrt(dx*dx+dz*dz)\nif dist>0.2 then\n local h=math.atan2(dx,dz)\n local u=drawer:addTimedArrow(5000,p.pos.x,p.pos.y+0.04,p.pos.z,h,math.max(0.25,dist-0.8),0.18,0.8,0.65,0,false,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\n if u then st.handles[#st.handles+1]=u end\nend\nlocal u=drawer:addTimedCircle(5000,pos[1],p.pos.y+0.04,pos[2],0.46,0,false,true,Argus2.RenderFlags.FLAG_RENDER_OVERLAY)\nif u then st.handles[#st.handles+1]=u end\nst.afterTetherDrawn=true\nself.used=true",
							conditions = 
							{
								
								{
									"9105bb7c-5c7b-389a-ae1e-66de9577dac9",
									true,
								},
							},
							name = "Draw post-tether collapse position",
							uuid = "f0c56f3d-4d9c-7a65-bfbe-d46db60e6aa3",
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
							conditionLua = "return eventArgs.spellID == 46169",
							dequeueIfLuaFalse = true,
							name = "Exact mechanic event",
							uuid = "9105bb7c-5c7b-389a-ae1e-66de9577dac9",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M11S",
				eventType = 2,
				loop = true,
				mechanicTime = 534.339,
				name = "[Kaptin] Fixed Stampede post-tether share arrow",
				timeRange = true,
				timelineIndex = 145,
				timerEndOffset = 39,
				timerStartOffset = 28,
				uuid = "a4f6d40e-8924-964e-9a70-284fcf6e81ef",
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
							actionLua = "\nlocal root=data.kaptinM11SDraws\nlocal st=root and root.ecliptic\nif type(st)==\"table\" then\n for _,u in ipairs(st.handles or {}) do if u then Argus.deleteTimedShape(u) end end\n root.ecliptic=nil\nend\nself.used=true",
							conditions = 
							{
								
								{
									"2ea66eaf-2edb-e79d-913d-5314d0f45ede",
									true,
								},
							},
							name = "Remove fixed Stampede guidance",
							uuid = "45c99f58-37b1-8087-9bb3-225212dced5a",
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
							conditionLua = "return eventArgs.spellID == 46171 or eventArgs.spellID == 47038",
							dequeueIfLuaFalse = true,
							name = "Exact mechanic event",
							uuid = "2ea66eaf-2edb-e79d-913d-5314d0f45ede",
							version = 3,
						},
					},
				},
				displayPath = "Kaptin M11S",
				eventType = 2,
				loop = true,
				mechanicTime = 534.339,
				name = "[Kaptin] Fixed Stampede cleanup",
				timeRange = true,
				timelineIndex = 145,
				timerEndOffset = 40,
				timerStartOffset = 32,
				uuid = "c275c958-e76b-c58f-bf99-cca1024f89d1",
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
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "dbba09df-3c0a-8d83-fc58-07f19fc29a6f",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[156] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "aaa7bc70-985f-a2bc-1d2e-a5d6bdf5eec0",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[158] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "868c2b5a-1dbe-8d4e-cca1-6df41b2e316a",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[159] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "67bdd6a7-a5b5-385b-ad00-c74943c843b7",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[160] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "f33100d7-23a5-9c1b-70c4-bad5789639e7",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[174] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "e5927698-264c-4e64-4a10-a86ee70bbfa8",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[181] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "80eb0d3c-5bf6-c748-a660-9d863e5b664c",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	[182] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\savage6\\m11s\\main",
				uuid = "aafa9897-c057-0263-2415-447dfeadcba7",
			},
			inheritanceRoot = "store\\anyone\\savage6\\m11s\\main",
			objectType = "folder",
		},
	},
	inheritedProfiles = 
	{
		"store\\anyone\\savage6\\m11s\\main",
	},
	timelineName = "r11s",
	version = "1.5.0",
}



return tbl