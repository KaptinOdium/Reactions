local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "4bc77a58-8fbd-4fd4-d9b8-b442651bcbc8",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "fe6aefed-b23c-78b9-ccb3-81eb91db5c5d",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	}, 
	[8] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "54f7129f-4f3a-bd3b-4ea6-f3a9e983c5cf",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[9] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "0cf1e8b0-1a61-be4c-dcbb-674a4806e820",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[15] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "2888eb49-ed83-2115-3ab2-a73f5a7cbff9",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[20] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "a187a219-fe4b-c0bd-c2e4-5423b44c8549",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[23] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "8121eb34-b84d-f6a8-9bc4-237ade67d664",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[37] = 
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
							actionLua = "-- CCW Coronation: https://ffxivstrats.io/strategy/730\n-- Snapshot the triangle's original wall before it slides.\nlocal triangle = TensorCore.mGetEntity(eventArgs.newTargetID)\nif not triangle then return end\nlocal pos = triangle.pos\nlocal dx, dz = pos.x - 100, pos.z - 100\nlocal nx, nz = 0, 0\nif math.abs(dx) > math.abs(dz) then\n    nx = dx > 0 and 1 or -1\nelse\n    nz = dz > 0 and 1 or -1\nend\n\n-- 270: right endpoint, CCW corner. 271: left endpoint, own cardinal.\n-- Keep each destination one yalm inside the arena.\nlocal x, z = 100 + 19 * nx, 100 + 19 * nz\nif eventArgs.newTetherID == 270 then\n    x, z = x + 19 * nz, z - 19 * nx\nend\n\nlocal color = GUI:ColorConvertFloat4ToU32(0.15, 1, 0.35, 0.8)\nlocal drawer = TensorCore.getStaticDrawer(color)\n-- Show the final spot through the beam and Atomic Ray spread.\n-- This guidance circle must not count as a damaging AOE.\ndrawer:addTimedCircle(12000, x, pos.y, z, 0.75, 0, false, true)\nself.used = true",
							conditions = 
							{
								
								{
									"b5be7117-d8c8-cc33-a24a-a24e5ba615de",
									true,
								},
								
								{
									"aa3fc237-9955-28d1-8590-687dc48c95fe",
									true,
								},
								
								{
									"125fadd8-dd1a-dbde-94bb-f21e4b973dee",
									true,
								},
								
								{
									"e3aa8678-f8d7-6104-a8e7-b97a25ac3320",
									true,
								},
							},
							name = "Draw CCW destination",
							uuid = "07ecfb11-f549-ef0c-a64a-c1cb73021344",
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
							name = "Initial tether",
							uuid = "b5be7117-d8c8-cc33-a24a-a24e5ba615de",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgType = 5,
							eventIntValue = 270,
							name = "Tether >=270",
							uuid = "aa3fc237-9955-28d1-8590-687dc48c95fe",
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
							eventIntValue = 271,
							name = "Tether <=271",
							uuid = "125fadd8-dd1a-dbde-94bb-f21e4b973dee",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return eventArgs.sourceEntityID == TensorCore.mGetPlayer().id",
							dequeueIfLuaFalse = true,
							name = "My tether",
							uuid = "e3aa8678-f8d7-6104-a8e7-b97a25ac3320",
							version = 3,
						},
					},
				},
				eventType = 15,
				mechanicTime = 263.2,
				name = "Coronation - CCW position",
				timeRange = true,
				timelineIndex = 37,
				timerEndOffset = 5,
				timerStartOffset = -1,
				uuid = "a0ad58d5-689a-0e28-889f-2bcf460c74d4",
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
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "ad8944ef-a873-ef53-6155-95a5c38f0fdf",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[46] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "f7cd3c75-2178-4649-4300-205fe1e48525",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[47] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "78096426-d8be-da6a-f5bf-e770aa23a356",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[49] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "783a7dd4-92b8-d250-7865-088ad883f504",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[51] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "d5331741-b57d-7cdd-3d2c-8e27da9802f1",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[54] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "2fb77f76-bdd4-60ba-0d58-a12403ccfe26",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[55] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "71f02745-9a76-fd19-2d47-cf138390d675",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[69] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "dc0ec296-c907-ec02-ffd6-fff8ea9e73c6",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[74] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "bf5e9ba8-fbce-474c-0306-b172412bd3d8",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[76] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "1cc5b66e-6c08-7992-b50a-432c86dc7f9e",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	[94] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "1bdfd7f2-39c2-e26e-a685-752868fac8e2",
			},
			inheritanceRoot = "store\\anyone\\extremes\\sphene-ex",
			objectType = "folder",
		},
	},
	inheritedProfiles = 
	{
		"store\\anyone\\extremes\\sphene-ex",
	},
	timelineName = "queen-eternal-ex",
	version = "1.0.1",
}



return tbl