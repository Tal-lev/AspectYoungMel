--Function for Dagger Dash-special throw
function mod.FireDaggerSpecialYoung( weaponData, traitArgs, triggerArgs )
	local weaponName = "WeaponDaggerThrow"
	local projectileName = "ProjectileDaggerThrowEA" 
	local startAngle = GetAngle({ Id = CurrentRun.Hero.ObjectId })
	local derivedValues = GetDerivedPropertyChangeValues({
		ProjectileName = projectileName,
		WeaponName = weaponName,
		Type = "Projectile",
	})
	for i=1, traitArgs.Projectiles do
	local projectileId = CreateProjectileFromUnit({ WeaponName = weaponName, Name = projectileName, Id = CurrentRun.Hero.ObjectId,  
		Angle = startAngle - traitArgs.Spread/2 + (i - 1) * traitArgs.Spread/(traitArgs.Projectiles - 1 ) ,DataProperties = derivedValues.PropertyChanges, ThingProperties = derivedValues.ThingPropertyChanges })
	end
end

--Adding Hammers Traits
	OverwriteTableKeys( TraitData, {
	    StaffDoubleHealTraitYM = 
		{
			InheritFrom = { "WeaponTrait", "StaffHammerTrait" },
			Icon = "JarlUlsfark-AspectYoungMel\\TastyVigorIcon",
			GameStateRequirements =
			{
				{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponStaffBall", },
				},
				{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponStaffSwing", },
				IsAny = {"StaffAspectofYoungMelinoe", }
				},
			},
			-- Double heal effect is in the function in ready.lua
			ManaCostModifiers = 
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons ,
				ExWeapons = true,
				ManaCostAdd = 15,
				ReportValues = 
				{ 
					ReportedCost = "ManaCostAdd" 
				},
			},	
			ExtractValues =
			{
				{
				Key = "ReportedCost",
				ExtractAs = "ManaCostAdded",
				IncludeSigns = true
				},
			},
		},
		StaffSpecialHomingTraitYM = 
		{
			InheritFrom = { "WeaponTrait", "StaffHammerTrait" },
			Icon = "JarlUlsfark-AspectYoungMel\\HomingBoltIcon",
			GameStateRequirements =
			{
				{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponStaffBall", },
				},
				{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponStaffSwing", },
				IsAny = {"StaffAspectofYoungMelinoe", }
				},
			},
			PropertyChanges = 
			{
				{
					WeaponName = "WeaponStaffBall",
					ProjectileName = "ProjectileStaffBoltEA",
					ProjectileProperty = "Range",
					ChangeValue = 8800,
					ChangeType = "Absolute",
				},
			},
			{
				{
					WeaponName = "WeaponStaffBall",
					ProjectileName = "ProjectileStaffBoltEA",
					ProjectileProperty = "MaxAdjustRate",
					ChangeValue = 110,
					ChangeType = "Absolute",
				},
			},
		},
		AxeShieldDeflectTraitYM = 
		{
			InheritFrom = { "WeaponTrait", "AxeHammerTrait" },
			Icon = "JarlUlsfark-AspectYoungMel\\ShieldBlockIcon",
			GameStateRequirements =
			{
				{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponAxeSpecial", },
				},
				{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponAxe", },
				IsAny = {"AxeAspectofYoungMelinoe", }
				},
			},
			PropertyChanges = 
			{
				{
					WeaponName = "WeaponAxeSpecial",
					WeaponProperty = "Projectile",
					ChangeValue = "ProjectileAxeBlockSpinDeflect",
				},
				{
					WeaponName = "WeaponAxeSpecial",
					WeaponProperty = "DoProjectileBlockPresentation",
					ChangeVlaue = false,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					WeaponName = "WeaponAxeSpecial",
					WeaponProperty = "ExpireProjectilesOnFire",
					ChangeVlaue = "ProjectileAxeBlockSpinDeflect",
					ExcludeLinked = true,
				},
			}
		},
		AxeExtendedRetaliateTraitYM = 
		{
			InheritFrom = { "WeaponTrait", "AxeHammerTrait" },
			Icon = "JarlUlsfark-AspectYoungMel\\ColdVengenceIcon",
			GameStateRequirements =
			{
				{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponAxeSpecial", },
				},
				{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponAxe", },
				IsAny = {"AxeAspectofYoungMelinoe", }
				},
			},
			--Effect is in the function mod.BlockAxeBuff in ready.lua
		},
        DaggerDashAttackTripleTraitYM =
        {
		InheritFrom = { "WeaponTrait", "DaggerHammerTrait" },
		Icon = "Hammer_Daggers_41",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponDagger", },
			},
			{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponDagger", },
				IsAny = {"DaggerAspectofYoungMelinoe", }
			},
			{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponDagger", },
				IsNone = {"DaggerTripleAspect", }
			},
		},
		
		OnWeaponFiredFunctions = 
		{
			ValidWeapons = {"WeaponDaggerDash"},
			FunctionName = _PLUGIN.guid .. "." .."FireDaggerSpecialYoung",
			ExcludeLinked = true,
			FunctionArgs =
			{
				Projectiles = 3,
				Spread = 60,
				ReportValues = 
				{
					ReportedProjectiles = "Projectiles"
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "WeaponDaggerDash",
				WeaponProperty = "FireSound",
				ChangeValue = "/SFX/Player Sounds/MelDaggerKnifeThrowSwishGROUP",
				ChangeType = "Absolute",
			},
		},

		ExtractValues =
		{
			{
				Key = "ReportedProjectiles",
				ExtractAs = "Count",
			},
		}
	    },
		--Effect is in ready.lua mod.EscalateMagnetismYM()
		LobExtendComboTraitYM = 
		{
			InheritFrom = { "WeaponTrait", "LobHammerTrait" },
			Icon = "JarlUlsfark-AspectYoungMel\\GameOnIcon",
			GameStateRequirements =
			{
				{
					Path = { "CurrentRun", "Hero", "Weapons", },
					HasAll = { "WeaponLob", },
				},
				{
					Path = { "GameState", "LastWeaponUpgradeName", "WeaponLob", },
					IsAny = {"SkullAspectofYoungMelinoe", }
				},
			},
		},
		--Effect is in ready.lua mod.ComboDamageMod()
		LobComboScalingTraitYM = 
		{
			InheritFrom = { "WeaponTrait", "LobHammerTrait" },
			Icon = "JarlUlsfark-AspectYoungMel\\UltimateComboIcon",
			GameStateRequirements =
			{
				{
					Path = { "CurrentRun", "Hero", "Weapons", },
					HasAll = { "WeaponLob", },
				},
				{
					Path = { "GameState", "LastWeaponUpgradeName", "WeaponLob", },
					IsAny = {"SkullAspectofYoungMelinoe", }
				},
			},
		},
		ReflectiveCastTraitYM = 
	{
		InheritFrom = { "WeaponTrait", "TorchHammerTrait" },
		Icon = "JarlUlsfark-AspectYoungMel\\ReflectiveCastIcon",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponTorch", },
				IsAny = { "TorchAspectofYoungMelinoe" }
			},
		},
		OnWeaponFiredFunctions = {
			ValidWeapons = { "WeaponTorchSpecial" },
			FunctionName = _PLUGIN.guid .. "." .. "FireLobBackYM",
		},
		PropertyChanges = 
		{
			--{
			--	WeaponName = "WeaponTorchSpecial",
			--	WeaponProperty = "ActiveProjectileCap",
			--	ChangeValue = 1,
			--	ChangeType = "Add",
			--	ReportValues = { ReportedCount = "ChangeValue" },
			--},
			{
				WeaponName = "WeaponCastYM",
				WeaponProperty = "ActiveProjectileCap",
				ChangeValue = 2,
				ChangeType = "Absolute",
			},
			--{
			--	WeaponName = "WeaponTorchSpecial",
			--	WeaponProperty = "ProjectileAngleOffset",
			--	ChangeValue = math.rad(-360/2),
			--	ChangeType = "Absolute",
			--},
		},
		ExtractValues =
		{
			{
				Key = "ReportedCount",
				ExtractAs = "Count",
			},
		},
	},

	InsideCastBuffTraitYM = 
	{
		InheritFrom =  { "WeaponTrait", "TorchHammerTrait" },
		Icon = "JarlUlsfark-AspectYoungMel\\InsideCastBuffIcon",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorchSpecial", },
			},
			{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponTorch", },
				IsAny = { "TorchAspectofYoungMelinoe" }
			},
		},
		AddOutgoingDamageModifiers = 
		{
			ValidWeaponMultiplier = { BaseValue = 1.3, SourceIsMultiplier = true },
			ValidActiveEffects = {"ImpactSlowYM"},
			ReportValues = { ReportedModifier = "ValidWeaponMultiplier" }
		},
		ExtractValues =
		{
			{
				Key = "ReportedModifier",
				ExtractAs = "TooltipMultiplier",
				Format = "PercentDelta"
			},
		},

	},
	DummyComboDisplayBoonYM = 
	{
		Icon = "JarlUlsfark-AspectYoungMel\\SkullAspectYoungMelIcon",
		ShowInHUD = true,
		CustomLabel = 
		{
			DisplayType = "RoomValue",
			Key = "ComboStacks",
			Text = "UI_ComboStacks",
		},
		FlavorText = "DoubleBloodDropBoon_FlavorText",
	},
	})

-- Removing incompatible Hammers
table.insert(TraitData.AxeBlockEmpowerTrait.GameStateRequirements, {
			Path = {"CurrentRun", "Hero", "TraitDictionary"},
			HasNone = {"AxeAspectofYoungMelinoe", },
})

table.insert(TraitData.DaggerAttackFinisherTrait.GameStateRequirements, {
			Path = {"CurrentRun", "Hero", "TraitDictionary"},
			HasNone = {"DaggerAspectofYoungMelinoe", },
})

table.insert(TraitData.DaggerDashAttackTripleTrait.GameStateRequirements, {
			Path = {"CurrentRun", "Hero", "TraitDictionary"},
			HasNone = {"DaggerAspectofYoungMelinoe", },
})

table.insert(TraitData.LobAmmoMagnetismTrait.GameStateRequirements, {
			Path = {"CurrentRun", "Hero", "TraitDictionary"},
			HasNone = {"SkullAspectofYoungMelinoe", },
})	

table.insert(TraitData.LobAmmoMagnetismTrait.GameStateRequirements, {
			Path = {"CurrentRun", "Hero", "TraitDictionary"},
			HasNone = {"SkullAspectofYoungMelinoe", },
})	

table.insert(TraitData.LobPulseAmmoTrait.GameStateRequirements, {
			Path = {"CurrentRun", "Hero", "TraitDictionary"},
			HasNone = {"SkullAspectofYoungMelinoe", },
})	

--Torch
table.insert(TraitData.TorchExSpecialCountTrait.GameStateRequirements, {
			Path = {"CurrentRun", "Hero", "TraitDictionary"},
			HasNone = {"TorchAspectofYoungMelinoe", },
})	

table.insert(TraitData.TorchSpecialImpactTrait.GameStateRequirements, {
			Path = {"CurrentRun", "Hero", "TraitDictionary"},
			HasNone = {"TorchAspectofYoungMelinoe", },
})	
	
--Adding Hammers to pool
table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "StaffDoubleHealTraitYM")
table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "StaffSpecialHomingTraitYM")

table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "DaggerDashAttackTripleTraitYM")

table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "ReflectiveCastTraitYM")
table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "InsideCastBuffTraitYM")

table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "AxeShieldDeflectTraitYM")
table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "AxeExtendedRetaliateTraitYM")

table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "LobExtendComboTraitYM")
table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "LobComboScalingTraitYM")

	