WeaponCastYM =
	{
		UpgradeChoiceText = "UpgradeChoiceMenu_Ranged",
		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.05, FalloffSpeed = 3000 },

		FireRumbleParameters =
		{
			{ ScreenPreWait = 0.06, Fraction = 0.21, Duration = 0.21 },
		},
		OnFiredFunctionNames = { _PLUGIN.guid .. "." .. "WeaponCastFiredYM", },
		OnFiredFunctionArgs = 
		{ 
			ProjectileNames = { },
		},
		OnChargeFunctionNames = { "CheckChargeCastBuffs", },

		OnHitFunctionNames = { _PLUGIN.guid .. "." .. "RefreshImpactSlowYM",	"CheckOnArmedHitEffect", },

		CauseImpactReaction = true,
		ImpactReactionHitsOverride = 10,

		SkipManaIndicatorIfZeroManaCost = true,
		
		UnarmedCastCompleteGraphic = "Melinoe_Cast_Fire_Quick",
		
		SpeedPropertyChanges = 
		{
			{
				EffectName = "WeaponCastAttackDisable",
				EffectProperty = "Duration",
			},
			{
				EffectName = "WeaponCastSelfSlow",
				EffectProperty = "Duration",
			},
		},
		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/MelinoeEmotes/EmoteCastingAlt" },
				{ Name = "/Leftovers/SFX/WyrmCastAttack" },
			},

			ImpactSounds =
			{
				Invulnerable = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
				Bone = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				Brick = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				Stone = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				Organic = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				StoneObstacle = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				BrickObstacle = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				MetalObstacle = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				BushObstacle = "/SFX/Player Sounds/ZagreusBloodshotImpact",
			},
		},

		OnArmedHitEffect = 
		{
			EffectName = "OnHitStun",
			DataProperties = 
			{
				Duration = 0.7,
				DisableMove = true,
				DisableRotate = true,
				DisableAttack = true,
				CanAffectInvulnerable = false,
			}
		},

		ArmedParameters = 
		{
			Sounds =
			{
				ImpactSounds =
				{
					Invulnerable = "/SFX/Player Sounds/ZagreusBloodshotImpact",
					Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
					Bone = "/SFX/Player Sounds/ZagreusBloodshotImpact",
					Brick = "/SFX/Player Sounds/ZagreusBloodshotImpact",
					Stone = "/SFX/Player Sounds/ZagreusBloodshotImpact",
					Organic = "/SFX/Player Sounds/ZagreusBloodshotImpact",
					StoneObstacle = "/SFX/Player Sounds/ZagreusBloodshotImpact",
					BrickObstacle = "/SFX/Player Sounds/ZagreusBloodshotImpact",
					MetalObstacle = "/SFX/Player Sounds/ZagreusBloodshotImpact",
					BushObstacle = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				},
			},
			HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.05, FalloffSpeed = 3000 },
			HitSimSlowParameters =
			{
				{ ScreenPreWait = 0.07, Fraction = 0.15, LerpTime = 0 },
				{ ScreenPreWait = 0.25, Fraction = 1.0, LerpTime = 0.10 },
			},
			
			SimSlowDistanceThreshold = 180,
			HitRumbleParameters =
			{
				{ ScreenPreWait = 0.06, Fraction = 0.21, Duration = 0.21 },
			},
		},
		SelfMultiplier = 0,
		Using = { EffectNames = { "ImpactSlowYM", "ImpactGripYM" }, WeaponName = "WeaponCastProjectileHades" },
	}

WeaponData.WeaponCastYM = WeaponCastYM