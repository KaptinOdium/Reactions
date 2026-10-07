local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\extremes\\sphene-ex",
				uuid = "6a9cb0df-c84c-7ceb-339e-e83d8de05b0f",
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
				uuid = "51314456-d551-af42-eda1-1e28cc314046",
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
				uuid = "c6ba6d98-4424-5d44-f24a-f9e6c05bf208",
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
				uuid = "b531ca87-543f-02b3-d2bf-0e35cc5669f7",
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
				uuid = "f69c31dc-700d-5708-a5ef-529ed9da374c",
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
				uuid = "7df94578-ac53-0e9c-4fe0-88ce9659e6a8",
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
				uuid = "17880f0d-1eff-bf01-09d6-7077dc57b0bd",
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
				uuid = "53822c5e-14d9-d272-2849-5cb83fd0148e",
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
				uuid = "1d402298-c6dd-642c-1596-4bfe8ad7ad48",
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
				uuid = "0bb77f87-48d7-6a1b-64fc-734d8fdf1237",
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
				uuid = "df79f3a1-d995-ed5d-0a5f-c84b0532dad1",
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
				uuid = "0a78db34-b6d1-42d0-4c3e-38ae4dad5864",
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
				uuid = "1e2ce637-74c3-258b-d833-483929eb5767",
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
				uuid = "19258148-8845-3d9c-b9f3-9adaefab7178",
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
				uuid = "3cd4b113-9ca2-107f-706b-e019080eca03",
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
				uuid = "d82b58f1-7328-b6a5-da54-69bf512c1fa1",
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
				uuid = "c10edb3b-54d3-415f-9c70-92853b9badab",
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
				uuid = "4e40fc03-a683-3f6f-7360-c9b5bd54ab73",
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