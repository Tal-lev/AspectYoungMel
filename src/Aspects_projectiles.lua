import "Aspects_VFX.lua"

local file = rom.path.combine(rom.paths.Content, 'Game/Projectiles/PlayerProjectiles.sjson')
	sjson.hook(file, function(data)
	-- Axe Aspect of Young Mel special 
    table.insert(data.Projectiles,
	{
		Name = "ProjectileAxeBlockSpin",
		InheritFrom = "1_BaseDamagingProjectile",
		DetonateFx = "AxeDeflectBase",
		Type = "STRAIGHT",
		TotalFuse = 0.4,
		Fuse = 0.2,
		FuseStart = 0,
		ImmunityDuration = 0.3,
		MultiDetonate = true,
		AffectsEnemies = true,
		AffectsFriends = false,
		Speed = 160,
		Range = 650.0,
		DamageRadius = 100,
		DamageRadiusScaleY = 0.62,
		RequireHitCenter = false,
		AttachToOwner = false,
		NumPenetrations = 9999,
		AffectsSelf = false,
		CheckUnitImpact = false,
		CheckObstacleImpact = true,
		UnlimitedUnitPenetration = true,
		Damage = 20,
		ImpactVelocity = 0,
		UseArmor = false,
		UseVulnerability = false,
		UseDetonationForProjectileDefense = true,
		UseRadialImpact = true,
		Thing =
		{
			Graphic = "AxeDeflectBase",
			OffsetZ = 70,
			Grip = 999999,
		},
		Effects =
		{
			{
				Name = "OnHitStun",
				Duration = 0.7,
				DisableMove = true,
				DisableRotate = true,
				DisableAttack = true,
				Active = true,
				CanAffectInvulnerable = false,
				FrontFx = "null",
			},
		},
	})
    -- Axe Aspect of Young Mel special with "Mirror Shield Hammer"
	table.insert(data.Projectiles,
	{
		Name = "ProjectileAxeBlockSpinDeflect",
		InheritFrom = "1_BaseDamagingProjectile",
		DetonateFx = "AxeDeflectBase",
		Type = "STRAIGHT",
		TotalFuse = 0.4,
		Fuse = 0.2,
		FuseStart = 0,
		ImmunityDuration = 0.3,
		MultiDetonate = true,
		AffectsEnemies = true,
		AffectsFriends = false,
		Speed = 160,
		Range = 650.0,
		DamageRadius = 100,
		DamageRadiusScaleY = 0.62,
		RequireHitCenter = false,
		AttachToOwner = false,
		NumPenetrations = 9999,
		AffectsSelf = false,
		CheckUnitImpact = false,
		CheckObstacleImpact = true,
		UnlimitedUnitPenetration = true,
		Damage = 20,
		ImpactVelocity = 0,
		UseArmor = false,
		UseVulnerability = false,
		UseDetonationForProjectileDefense = true,
		UseRadialImpact = true,
		ProjectileDefenseRadius = 100,
		DeflectProjectiles = true,
		SilentImpactOnInvulnerable = true,
		ImpactFx = "AthenaProjectileImpact",
		Thing =
		{
			Graphic = "AxeDeflectBase",
			OffsetZ = 70,
			Grip = 999999,
		},
		Effects =
		{
			{
				Name = "OnHitStun",
				Duration = 0.7,
				DisableMove = true,
				DisableRotate = true,
				DisableAttack = true,
				Active = true,
				CanAffectInvulnerable = false,
				FrontFx = "null",
			},
		},
	})
    -- Staff Aspect of Young Mel special
	table.insert(data.Projectiles,
	{
		Name = "ProjectileStaffBoltEA",
		InheritFrom = "1_BaseDamagingProjectile",
		Type = "HOMING",
		HomingAllegiance = "ENEMIES",
		AdjustRateAcceleration = 3000,
		MaxAdjustRate = 100,
		SpinRate = 0,
		Speed = 0,
		Acceleration = 2000,
		Range = 880.0,
		Damage = 20,
		DetonateFx = "QuickFlashEnemy",
		CheckObstacleImpact = true,
		CheckUnitImpact = true,
		UnlimitedUnitPenetration = false,
		DetonateAtVictimLocation = true,
		Thing =
		{
			Graphic = "StaffBallProjectile",
			AttachedAnim = "StaffProjectileShadow",
			OffsetZ = 112,
			Grip = 999999,
			RotateGeometry = true,
			Tallness = 20,
			Points =
			{
				{
					X = 76,
					Y = 20,
				},
				{
					X = 76,
					Y = -20,
				},
				{
					X = -32,
					Y = -20,
				},
				{
					X = -32,
					Y = 20,
				},
			},
		},
	})
    -- Dagger Aspect of Young Mel special
	table.insert(data.Projectiles,
	{
		Name = "ProjectileDaggerThrowEA",
		InheritFrom = "1_BaseDamagingProjectile",
		DetonateFx = "null",
		Type = "HOMING",
		AffectsEnemies = true,
		AffectsFriends = false,
		AffectsSelf = false,
		CheckUnitImpact = true,
		CheckObstacleImpact = true,
		UnlimitedUnitPenetration = false,
		NumPenetrations = 0,
		AttachToOwner = false,
		StartDelay = 0.04,
		Damage = 25,
		Speed = 6000,
		Range = 830,
		UseRadialImpact = false,
		UseArmor = true,
		UseVulnerability = true,
		DissipateFx = "null",
		GroupName = "Standing",
		ClearOnAttackEffects = true,
		ImpactFx = "DaggerProjectileImpactFx",
		DeathFx = "DaggerProjectileFxFade",
		ProjectileDefenseRadius = 45,
		Thing =
		{
			Graphic = "DaggerProjectileFxBrown",
			OffsetZ = 70,
			RotateGeometry = true,
			Grip = 999999,
			Points =
			{
				{
					X = 35,
					Y = 25,
				},
				{
					X = 35,
					Y = -25,
				},
				{
					X = -5,
					Y = -25,
				},
				{
					X = -5,
					Y = 25,
				},
			},
		},
		Effects =
		{
			 {
				Name = "OnHitStunHeavy",
				Duration = 1.1,
				DisableMove = true,
				DisableRotate = true,
				DisableAttack = true,
				Active = true,
				CanAffectInvulnerable = false,
				FrontFx = "null",
			},
		},
	})

	return data
	end)