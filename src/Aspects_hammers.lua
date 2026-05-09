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
	})

-- Removing incompatible Hammers
	OverwriteTableKeys(TraitData.AxeBlockEmpowerTrait.GameStateRequirements, {
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponAxe", },
			},
			{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponAxe", },
				IsNone = {"AxeAspectofYoungMelinoe", },
			},
		}
	)

	OverwriteTableKeys(TraitData.DaggerAttackFinisherTrait.GameStateRequirements, {
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponDagger", },
			},
			{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponDagger", },
				IsNone = {"DaggerAspectofYoungMelinoe", }
			},
		}
	)

    OverwriteTableKeys(TraitData.DaggerDashAttackTripleTrait.GameStateRequirements, {
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponDagger", },
			},
			{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponDagger", },
				IsNone = { "DaggerTripleAspect", "DaggerAspectofYoungMelinoe", }
			},
		}
	)

	OverwriteTableKeys(TraitData.LobAmmoMagnetismTrait.GameStateRequirements, {
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponLob", },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				HasNone = { "LobPulseAmmoTrait" },
			},
			{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponLob", },
				IsNone = {"LobGunAspect", "SkullAspectofYoungMelinoe",}
			}
		}
	)

	OverwriteTableKeys(TraitData.LobPulseAmmoTrait.GameStateRequirements, {
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponLob", },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				HasNone = { "LobAmmoMagnetismTrait" },
			},
			{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponLob", },
				IsNone = {"LobGunAspect", "SkullAspectofYoungMelinoe",}
			},
		}
	)
	

	--Adding Hammers to pool
	table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "AxeShieldDeflectTrait")
    table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "DaggerDashAttackTripleTraitYoung")
	table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "LobExtendComboTrait")
	table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "LobComboScalingTrait")
	