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
	    AxeShieldDeflectTrait = 
		{
			InheritFrom = { "WeaponTrait", "AxeHammerTrait" },
			Icon = "JarlUlsfark-AspectYoungMel\\ShieldBlockIcon",
			GameStateRequirements =
			{
				{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponAxe", },
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
        DaggerDashAttackTripleTraitYoung =
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
		LobExtendComboTrait = 
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
		LobComboScalingTrait = 
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
		TorchExSpecialCountTraitYM = 
	{
		InheritFrom = { "WeaponTrait", "TorchHammerTrait" },
		Icon = "Hammer_Torch_30",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponTorch", },
			},
			{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponTorch", },
				IsAny = { "TorchAspectofYoungMelinoe" }
			},
		},
		TorchSpecialCountIncrease = 1,
		ChargeStageModifiers = 
		{
			ValidWeapons = { "WeaponTorchSpecial" },
			IncreaseNumProjectiles =
			{
				NumProjectiles = 1,
				ReportValues = { ReportedCount = "NumProjectiles" }
			},
			AddWeaponProperties = 
			{
				ProjectileAngleOffset = math.rad(360/3),
			},
		},
		PropertyChanges = 
		{
			{
				WeaponName = "WeaponTorchSpecial",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 1,
				ChangeType = "Add",
			},
			{
				WeaponName = "WeaponTorchSpecial",
				WeaponProperty = "ActiveProjectileCap",
				ChangeValue = 1,
				ChangeType = "Add",
			},
			{
				WeaponName = "WeaponCastYM",
				WeaponProperty = "ActiveProjectileCap",
				ChangeValue = 1,
				ChangeType = "Add",
			},
			{
				WeaponName = "WeaponTorchSpecial",
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = math.rad(-360/2),
				ChangeType = "Absolute",
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedCount",
				ExtractAs = "Count",
			},
		},
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
	
	--Adding Hammers to pool
	table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "AxeShieldDeflectTrait")
    table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "DaggerDashAttackTripleTraitYoung")
	table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "LobExtendComboTrait")
	table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "LobComboScalingTrait")
	table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "TorchExSpecialCountTraitYM")
	
	