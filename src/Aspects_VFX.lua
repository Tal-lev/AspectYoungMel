--Dagger VFX
	local file = rom.path.combine(rom.paths.Content, 'Game/Animations/Melinoe_Dagger_VFX.sjson')
	sjson.hook(file, function(data)
		table.insert(data.Animations,
			{
			Name = "DaggerSwipeFastBrown",
			FilePath = "Fx\\DaggerSwipeFast\\DaggerSwipeFast",
			GroupName = "FX_Standing_Add",
			AddColor = true,
			ColorFromOwner = "Ignore",
			StartRed = 0.58,
			StartGreen = 0.29,
			StartBlue = 0.0,
			EndRed = 0.39,
			EndGreen = 0.26,
			EndBlue = 0.12,
			EndFrame = 19,
			NumFrames = 19,
			PlaySpeed = 75.0,
			StartFrame = 1,
			OriginX = 80.0,
			OriginY = 160.0,
			LocationFromOwner = "Take",
			LocationZFromOwner = "Take",
			PostRotateScaleY = 0.6,
			FlipHorizontal = false,
			Scale = 1.6,
			OffsetZ = 60,
			EaseIn = 0,
			EaseOut = 1,
			OverlayVfx = true,
			CreateAnimations =
			{
				{ Name = "DaggerSwipeFastDarkBrown" },
				{ Name = "DaggerSwipeFastLightBrown" }
			}
		})

		table.insert(data.Animations,
		{
			Name = "DaggerSwipeFastFlipBrown",
			InheritFrom = "DaggerSwipeFastBrown",
			FlipVertical = true,
			ClearCreateAnimations = true,
			CreateAnimations =
			{
				{ Name = "DaggerSwipeFastDarkFlipBrown" },
				{ Name = "DaggerSwipeFastLightBrown" }
			}
		})

		table.insert(data.Animations,
		{
		Name = "DaggerProjectileFxBrown",
		ChainTo = "null",
		FilePath = "Fx\\DaggerProjectile\\DaggerProjectile",
		GroupName = "Standing",
		ScaleFromOwner = "Ignore",
		VisualFx = "DaggerProjectileFxTrailBrown",
		EndFrame = 15,
		NumFrames = 15,
		RandomStartFrame = true,
		ReRandomizeOnLoop = false,
		StartFrame = 1,
		OriginY = 30.0,
		Scale = 0.75,
		ScaleY = 2,
		Ambient = 0.0,
		VisualFxDistanceMax = 100.0,
		VisualFxDistanceMin = 100.0,
		VisualFxManagerCap = 400,
		VisualFxManagerFrameCap = 18,
		VisualFxFrameCap = 10,
		ColorFromOwner = "Ignore",
		StartRed = 0.58,
		StartGreen = 0.29,
		StartBlue = 0.0,
		EndRed = 0.39,
		EndGreen = 0.26,
		EndBlue = 0.12,
		})

		table.insert(data.Animations,
		{
			Name = "DaggerProjectileFxTrailBrown",
			InheritFrom = "DaggerProjectileFxBrown",
			ColorFromOwner = "Ignore",
			ChainTo = "null",
			Sound = "null",
			FilePath = "Particles\\particle_dagger_trail_color",
			GroupName = "FX_Standing_Add",
			AngleFromOwner = "Take",
			AddColor = true,
			Duration = 0.33,
			EaseIn = 0.9,
			EaseOut = 1.0,
			EndFrame = 1,
			NumFrames = 1,
			StartFrame = 1,
			OriginY = 80.0,
			OriginX = 300,
			RandomOffsetY = 1.0,
			LocationFromOwner = "Take",
			LocationZFromOwner = "Take",
			VelocityMax = 200.0,
			VelocityMin = 100.0,
			EndScaleY = 0.0,
			ScaleY = 0.5,
			StartScaleY = 0.5,
			StartRed = 0.58,
			StartGreen = 0.29,
			StartBlue = 0.0,
			EndRed = 0.39,
			EndGreen = 0.26,
			EndBlue = 0.12,
			VisualFx = "DaggerProjectileCurvedTrailSparkle",
			VisualFxIntervalMin = 0.01,
			VisualFxIntervalMax = 0.50,
			VisualFxCap = 1,
			CreateAnimations =
			{
				{ Name = "DaggerProjectileFxTrailDarkBrown" },
				{ Name = "DaggerProjectileFxTrailSpectralBrown" },
				{ Name = "DaggerProjectileFxTrailDisplacementBrown" },
			},
		})

	return data
	end)