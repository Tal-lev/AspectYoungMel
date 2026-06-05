-- Torch cast effects
OverwriteTableKeys( EffectData,{
	ImpactSlowYM = 
	{
		Name = "ImpactSlowYM",
		Vfx = "GraspingHandsFxIn",
		StopVfxes = { "GraspingHandsFxLoop" },
		StopVfxesPreventChain = { "GraspingHandsFxIn" },
		DataProperties = 
		{
			IgnoreName = "_PlayerUnit",
			Type = "SPEED",
			Duration = 0.2,
			Modifier = 0.05,
			Active = true,
			CanAffectInvulnerable = false,
			HaltOnStart = true,
			TimeModifierFraction = 0,
		},
	},
	ImpactGripYM = 
	{
		Name = "ImpactGripYM",
		DataProperties = 
		{
			IgnoreName = "_PlayerUnit",
			Type = "GRIP",
			Duration = 0.2,
			Modifier = 10,
			CanAffectInvulnerable = false,
		},
	},
})

------ Adding GameStateRequirements for all
-- Zeus
TraitData.ZeusSpecialBoon.GameStateRequirements = TraitData.ZeusSpecialBoon.GameStateRequirements or {}
-- Hera
TraitData.HeraSpecialBoon.GameStateRequirements = TraitData.HeraSpecialBoon.GameStateRequirements or {}
-- Poseidon
TraitData.PoseidonSpecialBoon.GameStateRequirements = TraitData.PoseidonSpecialBoon.GameStateRequirements or {}
-- Demeter
TraitData.DemeterSpecialBoon.GameStateRequirements = TraitData.DemeterSpecialBoon.GameStateRequirements or {}
-- Apollo
TraitData.ApolloSpecialBoon.GameStateRequirements = TraitData.ApolloSpecialBoon.GameStateRequirements or {}
-- Aphrodite
TraitData.AphroditeSpecialBoon.GameStateRequirements = TraitData.AphroditeSpecialBoon.GameStateRequirements or {}
-- Hephaestus
TraitData.HephaestusSpecialBoon.GameStateRequirements = TraitData.HephaestusSpecialBoon.GameStateRequirements or {}
-- Hestia
TraitData.HestiaSpecialBoon.GameStateRequirements = TraitData.HestiaSpecialBoon.GameStateRequirements or {}
-- Ares
TraitData.AresSpecialBoon.GameStateRequirements = TraitData.AresSpecialBoon.GameStateRequirements or {}
-- Artemis
-- Dionaysus
-- Hades

------ Adding new special traits

OverwriteTableKeys( TraitData,{

    -- Zeus
    ZeusCastBoonYM = 
        {
            Icon = "Boon_Zeus_29",
            InheritFrom = { "BaseTrait", "AirBoon" },
            BoonInfoIgnoreRequirements = true,
            GameStateRequirements =
            {
                {
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
				},
				{
                    Path = {"CurrentRun", "Hero", "TraitDictionary"},
                    HasAll = {"TorchAspectofYoungMelinoe"}
                },
            },
            Slot = "Secondary",
            RarityLevels =
            {
                Common =
                {
                    Multiplier = 1.00,
                },
                Rare =
                {
                    Multiplier = 30/25,
                },
                Epic =
                {
                    Multiplier = 35/25,
                },
                Heroic =
                {
                    Multiplier = 40/25,
                },
            },
            PropertyChanges =
            {
                {
                    WeaponName = "WeaponCastYM",
                    WeaponProperty = "FireFx",
                    ChangeValue = "QuickFlashYellow",
                    ChangeType = "Absolute",
                },
				{
                    WeaponName = "WeaponCastHammerYM",
                    WeaponProperty = "FireFx",
                    ChangeValue = "QuickFlashYellow",
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "WeaponCastYM",
					ProjectileName = "ProjectileCastYM",
                    ProjectileProperties = 
                    {
                        Graphic = "CastCircleInZeus",
                        ArmedGraphic = "CastCircleArmedZeus",
                        DetonateFx = "CastCircleOutZeus",
                        HideGraphicOnDetonate = false,
                    },
                },
				{
                    WeaponName = "WeaponCastHammerYM",
					ProjectileName = "ProjectileCastHammerYM",
                    ProjectileProperties = 
                    {
                        Graphic = "CastCircleInZeus",
                        ArmedGraphic = "CastCircleArmedZeus",
                        DetonateFx = "CastCircleOutZeus",
                        HideGraphicOnDetonate = false,
                    },
                },
            },
            OnWeaponFiredFunctions =
            {
                ValidWeapons = { "WeaponCastYM", "WeaponCastHammerYM" },
                FunctionName = _PLUGIN.guid .. "." .. "OnZeusCastYM",
                FunctionArgs = 
                {
                    SourceName = "ProjectileCastYM",
                    ProjectileName = "ZeusCastStrike",
                    DamageMultiplier =
                    {
                        BaseValue = 1.0,
                        AbsoluteStackValues =
                        {
                            [1] = 0.2,
                        },
                    },
                    Range = 440,
                    StrikeInterval = 0.35,
                    ReportValues = 
                    { 
                        ReportedMultiplier = "DamageMultiplier",
                        ReportedStrikes = "StrikeCount",
                        ReportedInterval = "StrikeInterval",
                    },
                }
            },
            StatLines =
            {
                "BoltDamageStatDisplay2",
            },
            ExtractValues =
            {
                {
                    Key = "ReportedMultiplier",
                    ExtractAs = "Damage",
                    Format = "MultiplyByBase",
                    BaseType = "Projectile",
                    BaseName = "ZeusCastStrike",
                    BaseProperty = "Damage",
                },
                {
                    Key = "ReportedInterval",
                    ExtractAs = "Interval",
                    DecimalPlaces = 2,
                }
            }
    },
-- Hera
    HeraCastBoonYM = 
	{
		Icon = "Boon_Hera_29",
		InheritFrom = { "BaseTrait", "AirBoon" },
        BoonInfoIgnoreRequirements = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"TorchAspectofYoungMelinoe"}
			},
		},
		Slot = "Secondary",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			},
		},
		OnEffectApplyFunction = 
		{
			FunctionName = _PLUGIN.guid .. "." .. "CheckApplyDamageShareYM",
			FunctionArgs = 
			{
				EffectName = "DamageShareEffect",
			},
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "WeaponCastYM", "WeaponCastHammerYM" },
			FunctionName = _PLUGIN.guid .. "." .. "HeraCastCountBlastYM",
			FunctionArgs =
			{
				ProjectileName = "HeraCastDamageProjectile",
				Delay = 0.05,
				DamageMultiplier = 
				{ 
					BaseValue = 1.0,
					AbsoluteStackValues = 
					{
						[1] = 0.6,
						[2] = 0.4,
						[3] = 0.2,
					},
				},
				ReportValues = { ReportedMultiplier = "DamageMultiplier"},
			},
		},
		PropertyChanges =
		{	
			{
				WeaponName = "WeaponCastYM",
				ProjectileName = "ProjectileCastYM",
				ProjectileProperty = "Graphic",
				ChangeValue = "CastCircleInHera",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileName = "ProjectileCastHammerYM",
				ProjectileProperty = "Graphic",
				ChangeValue = "CastCircleInHera",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponCastYM",
				ProjectileName = "ProjectileCastYM",
				ProjectileProperty = "DetonateFx",
				ChangeValue = "CastCircleOutHera",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileName = "ProjectileCastHammerYM",
				ProjectileProperty = "DetonateFx",
				ChangeValue = "CastCircleOutHera",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		StatLines =
		{
			"CastMultipliedUnitDamageStatDisplay1",
		},
		ExtractValues = 
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Damage",
				Format = "MultiplyByBase",
				BaseType = "Projectile",
				BaseName = "HeraCastDamageProjectile",
				BaseProperty = "Damage",
			},
			{
				ExtractAs = "DamageShareDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "DamageShareEffect",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "DamageShareAmount",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "DamageShareEffect",
				BaseProperty = "Amount",
				Format = "Percent",
				HideSigns = true,
			},
		}
	},

	SpawnCastDamageBoonYM = 
	{
		Icon = "Boon_Hera_48",
		InheritFrom = { "BaseTrait", "AirBoon" },
		BoonInfoIgnoreRequirements = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"TorchAspectofYoungMelinoe"}
			},
		},
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 4/3,
			},
			Epic =
			{
				Multiplier = 5/3,
			},
			Heroic =
			{
				Multiplier = 6/3,
			},
		},
		OnEnemySpawnFunction =
		{
			FunctionName = _PLUGIN.guid .. "." .. "CheckCastSummonDamageYM",
			Args = 
			{
				ProjectileName = "HeraCastSummonProjectile",
				DamageMultiplier = 
				{ 
					BaseValue = 1,
					AbsoluteStackValues = 
					{
						[1] = 0.50,
						[2] = 0.25,
						[3] = 0.20,
						--[4] = 0.10,
					},
				},
				ReportValues = 
				{
					ReportedMultiplier = "DamageMultiplier",
				}
			},
		},
		PropertyChanges =
		{	
			{
				WeaponName = "WeaponCastYM",
				ProjectileProperties = 
				{
					Graphic = "CastCircleInHera",
				}
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileProperties = 
				{
					Graphic = "CastCircleInHera",
				}
			},
			{
				WeaponName = "WeaponCastYM",
				ProjectileName = "ProjectileCastYM",
				ProjectileProperties = 
				{
					DetonateFx = "CastCircleOutHera",
				}
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileName = "ProjectileCastHammerYM",
				ProjectileProperties = 
				{
					DetonateFx = "CastCircleOutHera",
				}
			},
		},
		StatLines = 
		{
			"CastSpawnDamageDisplay1",
		},
		ExtractValues = 
		{
			{
				Key = "ReportedMultiplier",
				Format = "MultiplyByBase",
				BaseType = "Projectile",
				BaseName = "HeraCastSummonProjectile",
				BaseProperty = "Damage",
				ExtractAs = "Damage",
			},
			{
				ExtractAs = "DamageShareDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "DamageShareEffect",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "DamageShareAmount",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "DamageShareEffect",
				BaseProperty = "Amount",
				Format = "Percent",
				HideSigns = true,
			},
		}
	},

-- Poseidon
    PoseidonCastBoonYM =
	{
		Icon = "Boon_Poseidon_29",
		InheritFrom = { "BaseTrait", "WaterBoon" },
        BoonInfoIgnoreRequirements = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"TorchAspectofYoungMelinoe"}
			},
		},
		Slot = "Secondary",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			},
		},
		
		PropertyChanges =
		{
			{
				WeaponName = "WeaponCastYM",
				WeaponProperty = "FireFx",
				ChangeValue = "QuickFlashYellow",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponCastHammerYM",
				WeaponProperty = "FireFx",
				ChangeValue = "QuickFlashYellow",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponCastYM",
				ProjectileProperties = 
				{
					Graphic = "CastCircleInPoseidon",
					ArmedGraphic = "CastCircleArmedPoseidon",
					DetonateFx = "CastCircleOutPoseidon",
					HideGraphicOnDetonate = false
				}
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileProperties = 
				{
					Graphic = "CastCircleInPoseidon",
					ArmedGraphic = "CastCircleArmedPoseidon",
					DetonateFx = "CastCircleOutPoseidon",
					HideGraphicOnDetonate = false
				}
			},
		},
		OnEffectApplyFunction = 
		{
			FunctionName = _PLUGIN.guid .. "." .. "CheckSlipApplyYM",
			FunctionArgs = 
			{
				EffectName = "AmplifyKnockbackEffect",
			},
		},

		OnWeaponFiredFunctions = 
		{
			ValidWeapons = { "WeaponCastYM", "WeaponCastHammerYM" },
			ExcludeLinked = true,
			FunctionName = "CheckPoseidonCastSplash",
			FunctionArgs = 
			{
				ProjectileName = "PoseidonCastSplashSplinter",
				DamageMultiplier = 
				{
					BaseValue = 1.0,
					AbsoluteStackValues =
					{
						[1] = 0.5,
						[2] = 0.25,
					},
				},
				ReportValues = 
				{ 
					ReportedMultiplier = "DamageMultiplier" 
				},
			},
		},
		StatLines = 
		{
			"SplashDamageStatDisplay1",
		},
		ExtractValues = 
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Damage",
				Format = "MultiplyByBase",
				BaseType = "Projectile",
				BaseName = "PoseidonCastSplashSplinter",
				BaseProperty = "Damage",
			},
			{
				ExtractAs = "KnockbackAmplifyDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "AmplifyKnockbackEffect",
				BaseProperty = "Duration",
				DecimalPlaces = 1,
			},
			{
				ExtractAs = "FontChance",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectLuaData",
				BaseName = "AmplifyKnockbackEffect",
				BaseProperty = "Chance",
				Format = "LuckModifiedPercent"
			},
			{
				External = true,
				ExtractAs = "FontDamage",
				BaseType = "ProjectileBase",
				BaseName = "PoseidonEffectFont",
				BaseProperty = "Damage",
			},
		}
	},
-- Demeter
DemeterCastBoonYM =
        {
		Icon = "Boon_Demeter_29",
		InheritFrom = { "BaseTrait", "WaterBoon" },
        BoonInfoIgnoreRequirements = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"TorchAspectofYoungMelinoe"}
			},
		},
		Slot = "Secondary",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			},
		},
		
		OnEnemyDamagedAction = 
		{
			ValidProjectiles = {"DemeterCastBlast"},
			FunctionName = "ApplyRoot",
			Args = 
			{
				EffectName = "ChillEffect",
			},	
		},
		WeaponDataOverride =
		{
			WeaponCastYM =
			{
				FireScreenshake = { Distance = 3, Speed = 200, Duration = 0.5, FalloffSpeed = 3000 },
				HitScreenshake = { Distance = 0, Speed = 0, Duration = 0.0, FalloffSpeed = 0 },
				HitSimSlowParameters = { },
			}
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "WeaponCastYM", "WeaponCastHammerYM" },
			ExcludeLinked = true,
			FunctionName = "ContinuousDemeterCast",
			FunctionArgs = 
			{
				ProjectileName = "DemeterCastBlast",
				Delay = 0.5,
				Fx = "DemeterIceRainExact",
				DamageMultiplier = 
				{
					BaseValue = 1,
					AbsoluteStackValues = 
					{
						[1] = 5/10,
						[2] = 3/10,
						[3] = 2/10,
					},
				},
				ReportValues = 
				{ 
					ReportedMultiplier = "DamageMultiplier",
					ReportedFuse = "Delay",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "WeaponCastYM",
				ProjectileProperties = 
				{
					Range = 600,
					Graphic = "CastCircleInDemeter",
					ImpactFx = "DemeterSlowImpact",
					ArmedImpactFx = "null",
					-- DeathFx = "CastCircleOut",
				}
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileProperties = 
				{
					Range = 600,
					Graphic = "CastCircleInDemeter",
					ImpactFx = "DemeterSlowImpact",
					ArmedImpactFx = "null",
					-- DeathFx = "CastCircleOut",
				}
			},
			{
				WeaponName = "WeaponCastYM",
				WeaponProperty = "FireFx2",
				ChangeValue = "OlympianAttackFx_Apollo",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponCastHammerYM",
				WeaponProperty = "FireFx2",
				ChangeValue = "OlympianAttackFx_Apollo",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponCastYM",
				ProjectileName = "ProjectileCastYM",
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileName = "ProjectileCastHammerYM",
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = false,
			},

		},
		StatLines =
		{
			"CastDamageOverTimeStatDisplay1",
		},
		ExtractValues =
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Damage",
				Format = "MultiplyByBase",
				BaseType = "Projectile",
				BaseName = "DemeterCastBlast",
				BaseProperty = "Damage",
			},
			{
				Key = "ReportedFuse",
				ExtractAs = "Fuse",
				DecimalPlaces = 1,
				SkipAutoExtract = true,
			},
			{
				ExtractAs = "ChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "ChillEffect",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "ChillActiveDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "ChillEffect",
				BaseProperty = "ActiveDuration",
			},
		},
	},

	CastNovaBoonYM =
	{
		InheritFrom = { "BaseTrait", "WaterBoon" },
		Icon = "Boon_Demeter_32",
		God = "Demeter",
		BoonInfoIgnoreRequirements = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"TorchAspectofYoungMelinoe"}
			},
		},
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 2,
			},
			Epic =
			{
				Multiplier = 3,
			},
			Heroic =
			{
				Multiplier = 4,
			},
		},		

		OnEnemyDamagedAction = 
		{
			ValidProjectiles = { "DemeterCastStorm" },
			EffectName = "LegacyChillEffect",
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "WeaponCastYM" },
			FunctionName = _PLUGIN.guid .. "." .. "DemeterCastBlastYM",
			FunctionArgs =
			{
				ProjectileNames = {"DemeterCastStorm"},
				MaxProjectiles = 1,
				StartDelay = 0.2,
				DamageMultiplier = 
				{ 
					BaseValue = 1.0,
					AbsoluteStackValues = 
					{
						[1] = 0.5,
						[2] = 0.5,
						[3] = 0.25,
					},
				},
				BlastRadiusMultiplier = 1,
				ReportValues = { ReportedMultiplier = "DamageMultiplier"},
			},
		},
		StatLines =
		{
			"StormDamageStatDisplay",
		},
		ExtractValues =
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Damage",
				Format = "MultiplyByBase",
				BaseType = "Projectile",
				BaseName = "DemeterCastStorm",
				BaseProperty = "Damage",
			},
			{
				ExtractAs = "Duration",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DemeterCastStorm",
				BaseProperty = "TotalFuse",
				DecimalPlaces = 2,
				SkipAutoExtract = true,
			},
			{
				ExtractAs = "ProjectileSlow",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DemeterSprintDefense",
				BaseProperty = "SpeedMultiplierOfEnemyProjectilesInside",
				Format = "NegativePercentDelta",
				SkipAutoExtract = true,
			},
			{
				ExtractAs = "Fuse",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DemeterCastStorm",
				BaseProperty = "Fuse",
				DecimalPlaces = 2,
				SkipAutoExtract = true,
			},
			{
				ExtractAs = "ChillAmount",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "LegacyChillEffect",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta",
			},
			{
				ExtractAs = "ChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "LegacyChillEffect",
				BaseProperty = "Duration",
			},
		}
	},
	

-- Apollo
    ApolloCastBoonYM =
	{
		Icon = "Boon_Apollo_29",
		InheritFrom = { "BaseTrait", "FireBoon" },
		BoonInfoIgnoreRequirements = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"TorchAspectofYoungMelinoe"}
			},
		},
		Slot = "Secondary",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			},
		},
		WeaponDataOverride =
		{
			WeaponCastYM =
			{
				HitScreenshake = {},
				HitSimSlowParameters =
				{
				},

				Sounds =
				{
					ChargeSounds =
					{
						{ Name = "/VO/MelinoeEmotes/EmoteCasting" },
						{ Name = "/SFX/Player Sounds/MelMagicalCharge",
							StoppedBy = { "ChargeCancel", "Fired" } },
					},
					FireSounds =
					{
						{ Name = "/VO/MelinoeEmotes/EmoteCasting" },
						{ Name = "/Leftovers/SFX/WyrmCastAttack" },
					},

					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ElectricZapSmall",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/Player Sounds/ElectricZapSmall",
						Brick = "/SFX/Player Sounds/ElectricZapSmall",
						Stone = "/SFX/Player Sounds/ElectricZapSmall",
						Organic = "/SFX/Player Sounds/ElectricZapSmall",
						StoneObstacle = "/SFX/Player Sounds/ElectricZapSmall",
						BrickObstacle = "/SFX/Player Sounds/ElectricZapSmall",
						MetalObstacle = "/SFX/Player Sounds/ElectricZapSmall",
						BushObstacle = "/SFX/Player Sounds/ElectricZapSmall",
					},
				},
			},
		},
		OnEffectApplyFunction = 
		{
			FunctionName = _PLUGIN.guid .. "." .. "CheckBlindApplyYM",
			FunctionArgs = 
			{
				EffectName = "BlindEffect",
			},
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "WeaponCastYM", "WeaponCastHammerYM" },
			FunctionName = "ApolloDelayedBlast",
			FunctionArgs =
			{
				ProjectileName = "ApolloSingleCastStrike",
				Delay = 2.85,
				DamageMultiplier = 
				{ 
					BaseValue = 1.0,
					AbsoluteStackValues = 
					{
						[1] = 0.5,
						[2] = 0.25,
					},
				},
				ReportValues = { ReportedMultiplier = "DamageMultiplier"},
			},
		},
		OnEarlyCastDetonation = 
		{
			FunctionName = "ApolloEarlyCastBlast",
			FunctionArgs = 
			{
				ProjectileName = "ApolloSingleCastStrike",
				DamageMultiplier = 
				{ 
					BaseValue = 1.0,
					AbsoluteStackValues = 
					{
						[1] = 0.500,
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "WeaponCastYM",
				WeaponProperty = "FireFx",
				ChangeValue = "QuickFlashYellow",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponCastHammerYM",
				WeaponProperty = "FireFx",
				ChangeValue = "QuickFlashYellow",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponCastYM",
				ProjectileProperties =
				{
					ImpactFx = "null",
					Graphic = "CastCircleInApollo",
					ArmedGraphic = "CastCircleArmedApollo",
					GroupName = "FX_Terrain_Add",
					DetonateFx = "CastCircleOutApollo",
					HideGraphicOnDetonate = false
				}
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileProperties =
				{
					ImpactFx = "null",
					Graphic = "CastCircleInApollo",
					ArmedGraphic = "CastCircleArmedApollo",
					GroupName = "FX_Terrain_Add",
					DetonateFx = "CastCircleOutApollo",
					HideGraphicOnDetonate = false
				}
			},
		},
		
		StatLines =
		{
			"CastDamageStatDisplay1",
		},
		ExtractValues =
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Damage",
				Format = "MultiplyByBase",
				BaseType = "Projectile",
				BaseName = "ApolloSingleCastStrike",
				BaseProperty = "Damage",
			},
			{
				ExtractAs = "BlindChance",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "BlindEffect",
				BaseProperty = "MissChance",
				Format = "Percent"
			},
			{
				ExtractAs = "BlindDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "BlindEffect",
				BaseProperty = "Duration",
			},
		}
	},

	--Apollo Mana boon
	ApolloManaBoonYM = 
	{
		InheritFrom = { "BaseTrait", "AirBoon" },
		Icon = "Boon_Apollo_35",
		Slot = "Mana",
		BoonInfoIgnoreRequirements = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"TorchAspectofYoungMelinoe"}
			},
		},
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			},
		},
		StatLines =
		{
			"ManaRestoreStatDisplay1",
		},
		
		OnProjectileDeathFunction = 
		{
			Name = _PLUGIN.guid .. "." .. "CheckApolloManaRestoreYM",
			Args = 
			{
				ManaRestore = 
				{
					BaseValue = 40,
					AbsoluteStackValues = 
					{
						[1] = 20,
						[2] = 15,
						[3] = 10,
					},
				},
				ManaRestoreFx = "ApolloManaRegenFxEmitter",
				ReportValues = { ReportedManaRestore = "ManaRestore" }
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedManaRestore",
				ExtractAs = "TooltipManaRecovery",
			},
		
		},
	},
-- Aphrodite
    AphroditeCastBoonYM =
	{
		Icon = "Boon_Aphrodite_29",
		InheritFrom = { "BaseTrait", "AirBoon" },
		BoonInfoIgnoreRequirements = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"TorchAspectofYoungMelinoe"}
			},
		},
		Slot = "Secondary",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "WeaponCastYM", "WeaponCastHammerYM" },
			FunctionName = _PLUGIN.guid .. "." .. "CheckProjectilePullYM",
			FunctionArgs = 
			{
				DeadZoneRadius = 100,
				DistanceMultiplier = 0.45,
				Interval = 0.85,
				PullVfx = "AphroditeCastPull",
				ProjectileName = "AphroditeCastProjectile",
				DamageMultiplier = { BaseValue = 1 },
				ReportValues = { ReportedMultiplier = "DamageMultiplier"},
			}
		},
		OnEffectApplyFunction = 
		{
			FunctionName = _PLUGIN.guid .. "." .. "CheckCastAphroditeVulnerabilityApplyYM",
			FunctionArgs = 
			{
				EffectName = "WeakEffect",
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "WeaponCastYM",
				WeaponProperty = "FireFx",
				ChangeValue = "QuickFlashPink",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponCastHammerYM",
				WeaponProperty = "FireFx",
				ChangeValue = "QuickFlashPink",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponCastYM",
				ProjectileProperties = 
				{
					Graphic = "CastCircleInAphrodite",
				}
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileProperties = 
				{
					Graphic = "CastCircleInAphrodite",
				}
			},
			{
				WeaponName = "WeaponCastYM",
				ProjectileName = "ProjectileCastYM",
				ProjectileProperties = 
				{
					DetonateFx = "CastCircleOutAphrodite",
				}
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileName = "ProjectileCastHammerYM",
				ProjectileProperties = 
				{
					DetonateFx = "CastCircleOutAphrodite",
				}
			},			
		},
		StatLines =
		{
			"AphroCastDamageStatDisplay1",
		},
		ExtractValues =
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Damage",
				Format = "MultiplyByBase",
				BaseType = "Projectile",
				BaseName = "AphroditeCastProjectile",
				BaseProperty = "Damage",
			},
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "WeakEffect",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakModifier",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "WeakEffect",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			},
		}
	},
-- Hephaestus
    HephaestusCastBoonYM =
	{
		Icon = "Boon_Hephaestus_29",
		InheritFrom = { "BaseTrait", "EarthBoon" },
		BoonInfoIgnoreRequirements = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"TorchAspectofYoungMelinoe"}
			},
		},
		Slot = "Secondary",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 70/60,
			},
			Epic =
			{
				Multiplier = 80/60,
			},
			Heroic =
			{
				Multiplier = 90/60,
			},
		},
		WeaponDataOverride =
		{
			WeaponCastYM =
			{
				FireScreenshake = { Distance = 3, Speed = 200, Duration = 0.5, FalloffSpeed = 3000 },
				HitScreenshake = { Distance = 0, Speed = 0, Duration = 0.0, FalloffSpeed = 0 },
				HitSimSlowParameters = { },
			}
		},
		PropertyChanges =
		{	
			{
				WeaponName = "WeaponCastYM",
				ProjectileProperties = 
				{
					ArmedImpactFx = "null",
					Graphic = "CastCircleInHephaestus",
					DetonateFx = "CastCircleOutHephaestus",
				}
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileProperties = 
				{
					ArmedImpactFx = "null",
					Graphic = "CastCircleInHephaestus",
					DetonateFx = "CastCircleOutHephaestus",
				}
			},
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "WeaponCastYM", "WeaponCastHammerYM" },
			ExcludeLinked = true,
			FunctionName = "IntermittentHephCastStrike",
			FunctionArgs = 
			{
				ProjectileName = "HephCastBlast",
				Count = 3,
				Delay = 1,
				DamageMultiplier = 
				{
					BaseValue = 1,
					DecimalPlaces = 3,
					AbsoluteStackValues = 
					{
						[1] = 20/60,
						[2] = 15/60,
						[3] = 10/60,
						[4] = 5/60,
					},
				},
				ReportValues = 
				{ 
					ReportedMultiplier = "DamageMultiplier",
					ReportedFuse = "Delay",
					ReportedDetonations = "Count",
				},
			}
		},
		StatLines =
		{
			"CastDamageOverTimeStatDisplay1",
		},
		ExtractValues =
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Damage",
				Format = "MultiplyByBase",
				BaseType = "Projectile",
				BaseName = "HephCastBlast",
				BaseProperty = "Damage",
			},
			{
				Key = "ReportedFuse",
				ExtractAs = "Fuse",
				DecimalPlaces = 1,
				SkipAutoExtract = true,
			},
			{
				Key = "ReportedDetonations",
				ExtractAs = "Detonations",
				SkipAutoExtract = true,
			},
		}
	},
-- Hestia
    HestiaCastBoonYM =
	{
		Icon = "Boon_Hestia_29",
		InheritFrom = { "BaseTrait", "FireBoon" },
		BoonInfoIgnoreRequirements = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"TorchAspectofYoungMelinoe"}
			},
		},
		Slot = "Secondary",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			},
		},
		WeaponDataOverride =
		{
			WeaponCastYM =
			{
				OnFiredFunctionArgs = 
				{
					ProjectileDataPropertiesMap = { TotalFuse = "FuseStart" },
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "WeaponCastYM",
				WeaponProperty = "FireFx",
				ChangeValue = "QuickFlashRed",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponCastHammerYM",
				WeaponProperty = "FireFx",
				ChangeValue = "QuickFlashRed",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponCastYM",
				ProjectileProperties = 
				{
					ImpactFx = "null",
					Graphic = "CastCircleInHestia",
					ArmedGraphic = "CastCircleArmedHestia",
					GroupName = "FX_Terrain_Add",
					DetonateFx = "null",
					DissipateFx = "CastCircleOutHestia",
					HideGraphicOnDetonate = false
				}
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileProperties = 
				{
					ImpactFx = "null",
					Graphic = "CastCircleInHestia",
					ArmedGraphic = "CastCircleArmedHestia",
					GroupName = "FX_Terrain_Add",
					DetonateFx = "null",
					DissipateFx = "CastCircleOutHestia",
					HideGraphicOnDetonate = false
				}
			},

		},
		OnCastEffectApplyFunction = 
		{
			FunctionName = _PLUGIN.guid .. "." .. "CheckCastBurnApplyYM",
			FunctionArgs = 
			{
				Cooldown = 1.0,
				EffectName = "BurnEffect",
				NumStacks = 
				{
					BaseValue = 40,
					MinValue = 1,
					AbsoluteStackValues =
					{
						[1] = 20,
						[2] = 15,
						[3] = 10,
					},
					AsInt = true,
				},
				ReportValues = 
				{
					ReportedDamage = "NumStacks",
					ReportedInterval = "Cooldown",
				}
			},
		},
		StatLines =
		{
			"BurnApplicationStatDisplay1",
		},
		ExtractValues =
		{
			{
				Key = "ReportedDamage",
				ExtractAs = "BurnDamage",
			},
			{
				Key = "ReportedInterval",
				ExtractAs = "ApplicationInterval",
				SkipAutoExtract = true,
				DecimalPlaces = 1,
			},
			{
				ExtractAs = "BurnRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectLuaData",
				BaseName = "BurnEffect",
				BaseProperty = "DamagePerSecond",
				DecimalPlaces = 1,
			},
		}
	},

	BurnSprintBoonYM = --Legendary
	{
		InheritFrom = { "LegendaryTrait", "FireBoon" },
		Icon = "Boon_Hestia_33",
		BoonInfoIgnoreRequirements = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"TorchAspectofYoungMelinoe"}
			},
		},
		OnBlockDamageFunction = 
		{
			Name = "HestiaBlockSpend",
			Args = 
			{
				ProjectileName = "HestiaSprintDefense",
				EffectArgs = 
				{
					EffectName = "BurnEffect",
					NumStacks = 400,
					ReportValues = {ReportedDamage = "NumStacks"},
				},		
				Vfx = "HestiaFlameParticleDefense",
				FireSound = "/SFX/BurnDamageSizzle",	
				Cooldown = 3,
				ReportValues = {ReportedCooldown = "Cooldown"},
			}
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons =  {"WeaponCastYM", "WeaponCastHammerYM"},
			FunctionName = "HestiaCastDefense",
			FunctionArgs = 
			{
				ProjectileName = "HestiaSprintDefense",
				StartDelay = 0.1,
				BuffVfx = "HestiaFlameBuff",
				ReportValues = { ReportedDamage = "StackCount"}
			},
		},
		OnProjectileDeathFunction = 
		{
			ValidProjectiles = { "ProjectileCastYM" },
			Name = "RemoveCastDefense",
		},
		StatLines =
		{
			"ProjectileBurnDamageStatDisplay1",
		},
		ExtractValues =
		{
			{
				Key = "ReportedDamage",
				ExtractAs = "TooltipDamage",
			},
			{
				Key = "ReportedCooldown",
				ExtractAs = "TooltipCooldown",
			},
			{
				ExtractAs = "BurnRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectLuaData",
				BaseName = "BurnEffect",
				BaseProperty = "DamagePerSecond",
				DecimalPlaces = 1,
			},
		},
		FlavorText = "BurnSprintBoon_FlavorText",
	},

-- Ares
    AresCastBoonYM =
	{
		Icon = "Boon_Ares_29",
		InheritFrom = { "BaseTrait", "EarthBoon" },
		BoonInfoIgnoreRequirements = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"TorchAspectofYoungMelinoe"}
			},
		},
		Slot = "Secondary",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 160/120,
			},
			Epic =
			{
				Multiplier = 200/120,
			},
			Heroic =
			{
				Multiplier = 240/120,
			},
		},
		OnEffectApplyFunction = 
		{
			FunctionName = _PLUGIN.guid .. "." .. "CheckAresCurseApplyYM",
			FunctionArgs = 
			{
				ProjectileName = "ProjectileAresSwordCast",
				DamageMultiplier =
				{
					BaseValue = 1,
					DecimalPlaces = 3,
					AbsoluteStackValues =
					{
						[1] = 40/120,
						[2] = 30/120,
						[3] = 20/120,
					},
				},
				ReportValues = { ReportedDamage = "DamageMultiplier" }
			},
		},
		
		StatLines =
		{
			"CurseDamageStatDisplay1",
		},
		PropertyChanges =
		{	
			{
				WeaponName = "WeaponCastYM",
				ProjectileProperties = 
				{
					Graphic = "CastCircleInAres",
				}
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileProperties = 
				{
					Graphic = "CastCircleInAres",
				}
			},
			{
				WeaponName = "WeaponCastYM",
				ProjectileName = "ProjectileCastYM",
				ProjectileProperties = 
				{
					DetonateFx = "CastCircleOutAres",
					ArmedGraphic = "CastCircleArmedAres",
				}
			},
			{
				WeaponName = "WeaponCastHammerYM",
				ProjectileName = "ProjectileCastYM",
				ProjectileProperties = 
				{
					DetonateFx = "CastCircleOutAres",
					ArmedGraphic = "CastCircleArmedAres",
				}
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedDamage",
				ExtractAs = "Damage",
				Format = "MultiplyByBase",
				BaseType = "Projectile",
				BaseName = "ProjectileAresSwordCast",
				BaseProperty = "Damage",
			},
		}
	},	
-- Athena
-- Artemis
-- Dionaysus
-- Hades
    
}
)

------ Inserting new special traits
-- Zeus
table.insert( LootData.ZeusUpgrade.WeaponUpgrades, "ZeusCastBoonYM" )
table.insert( LootData.ZeusUpgrade.PriorityUpgrades, 2, "ZeusCastBoonYM" )
-- Hera
table.insert( LootData.HeraUpgrade.WeaponUpgrades, "HeraCastBoonYM" )
table.insert( LootData.HeraUpgrade.PriorityUpgrades, 2, "HeraCastBoonYM" )
table.insert( LootData.HeraUpgrade.Traits, "SpawnCastDamageBoonYM" )
-- Poseidon
table.insert( LootData.PoseidonUpgrade.WeaponUpgrades, "PoseidonCastBoonYM" )
table.insert( LootData.PoseidonUpgrade.PriorityUpgrades, 2, "PoseidonCastBoonYM" )
-- Demeter
table.insert( LootData.DemeterUpgrade.WeaponUpgrades, "DemeterCastBoonYM" )
table.insert( LootData.DemeterUpgrade.PriorityUpgrades, 2, "DemeterCastBoonYM" )
table.insert( LootData.DemeterUpgrade.Traits, "CastNovaBoonYM" )
-- Apollo
table.insert( LootData.ApolloUpgrade.WeaponUpgrades, "ApolloCastBoonYM" )
table.insert( LootData.ApolloUpgrade.PriorityUpgrades, 2, "ApolloCastBoonYM" )
table.insert( LootData.ApolloUpgrade.Traits, "ApolloManaBoonYM" )
-- Aphrodite
table.insert( LootData.AphroditeUpgrade.WeaponUpgrades, "AphroditeCastBoonYM" )
table.insert( LootData.AphroditeUpgrade.PriorityUpgrades, 2, "AphroditeCastBoonYM" )
-- Hephaestus
table.insert( LootData.HephaestusUpgrade.WeaponUpgrades, "HephaestusCastBoonYM" )
table.insert( LootData.HephaestusUpgrade.PriorityUpgrades, 2, "HephaestusCastBoonYM" )
-- Hestia
table.insert( LootData.HestiaUpgrade.WeaponUpgrades, "HestiaCastBoonYM" )
table.insert( LootData.HestiaUpgrade.PriorityUpgrades, 2, "HestiaCastBoonYM" )
table.insert( LootData.HestiaUpgrade.Traits, "BurnSprintBoonYM" )
-- Ares
table.insert( LootData.AresUpgrade.WeaponUpgrades, "AresCastBoonYM" )
table.insert( LootData.AresUpgrade.PriorityUpgrades, 2, "AresCastBoonYM" )

-- Artemis
-- Dionaysus
-- Hades



------ Removing old special from pool
-- Zeus
table.insert(TraitData.ZeusSpecialBoon.GameStateRequirements, {
  Path = {"CurrentRun", "Hero", "TraitDictionary"},
  HasNone = {"TorchAspectofYoungMelinoe"}
})
-- Hera
table.insert(TraitData.HeraSpecialBoon.GameStateRequirements, {
  Path = {"CurrentRun", "Hero", "TraitDictionary"},
  HasNone = {"TorchAspectofYoungMelinoe"}
})
-- Poseidon
table.insert(TraitData.PoseidonSpecialBoon.GameStateRequirements, {
  Path = {"CurrentRun", "Hero", "TraitDictionary"},
  HasNone = {"TorchAspectofYoungMelinoe"}
})
-- Demeter
table.insert(TraitData.DemeterSpecialBoon.GameStateRequirements, {
  Path = {"CurrentRun", "Hero", "TraitDictionary"},
  HasNone = {"TorchAspectofYoungMelinoe"}
})
-- Apollo
table.insert(TraitData.ApolloSpecialBoon.GameStateRequirements, {
  Path = {"CurrentRun", "Hero", "TraitDictionary"},
  HasNone = {"TorchAspectofYoungMelinoe"}
})
-- Aphrodite
table.insert(TraitData.AphroditeSpecialBoon.GameStateRequirements, {
  Path = {"CurrentRun", "Hero", "TraitDictionary"},
  HasNone = {"TorchAspectofYoungMelinoe"}
})
-- Hephaestus
table.insert(TraitData.HephaestusSpecialBoon.GameStateRequirements, {
  Path = {"CurrentRun", "Hero", "TraitDictionary"},
  HasNone = {"TorchAspectofYoungMelinoe"}
})
-- Hestia
table.insert(TraitData.HestiaSpecialBoon.GameStateRequirements, {
  Path = {"CurrentRun", "Hero", "TraitDictionary"},
  HasNone = {"TorchAspectofYoungMelinoe"}
})
-- Ares
table.insert(TraitData.AresSpecialBoon.GameStateRequirements, {
  Path = {"CurrentRun", "Hero", "TraitDictionary"},
  HasNone = {"TorchAspectofYoungMelinoe"}
})

-- Artemis
-- Dionaysus
-- Hades

---Aspect of Icarus Suit Fixing Poseidon Weapon Boon
table.insert( TraitData.PoseidonWeaponBoon.OnEnemyDamagedAction.Args.MultihitProjectileWhitelist, "HarpyFlapFast_YM" )
table.insert( TraitData.PoseidonWeaponBoon.OnEnemyDamagedAction.Args.MultihitProjectileWhitelist, "HarpyFlapFast2_YM" )
table.insert( TraitData.PoseidonWeaponBoon.OnEnemyDamagedAction.Args.MultihitProjectileWhitelist, "HarpyFlapFast3_YM" )
table.insert( TraitData.PoseidonWeaponBoon.OnEnemyDamagedAction.Args.MultihitProjectileWhitelist, "HarpyFlapFastDash_YM" )
table.insert( TraitData.PoseidonWeaponBoon.OnEnemyDamagedAction.Args.MultihitProjectileWhitelist, "HarpyFlapFastCharge_YM" )


OverwriteTableKeys(TraitData.PoseidonWeaponBoon.OnEnemyDamagedAction.Args.MultihitProjectileConditions, {
	HarpyFlapFast_YM = { Count = 5, Window = 0.3 }, 
	HarpyFlapFast2_YM = { Count = 5, Window = 0.3 }, 
	HarpyFlapFast3_YM = { Count = 5, Window = 0.3 }, 
	HarpyFlapFastDash_YM = { Count = 5, Window = 0.3 }, 
	HarpyFlapFastCharge_YM = { Count = 5, Window = 0.3 },
})
---Axe aspect of youngmel Fixing Poseidon special Boon
table.insert( TraitData.PoseidonSpecialBoon.OnEnemyDamagedAction.Args.MultihitProjectileWhitelist, "ProjectileAxeBlockSpin" )
table.insert( TraitData.PoseidonSpecialBoon.OnEnemyDamagedAction.Args.MultihitProjectileWhitelist, "ProjectileAxeBlockSpinDeflect" )

OverwriteTableKeys(TraitData.PoseidonSpecialBoon.OnEnemyDamagedAction.Args.MultihitProjectileConditions, {
	ProjectileAxeBlockSpin = { Count = 2, Window = 0.2 }, 
	ProjectileAxeBlockSpinDeflect = { Count = 2, Window = 0.2 }, 
})
