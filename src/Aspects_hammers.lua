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
				IsAny = {"AxeRecoveryAspect", }
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
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponDagger", },
				IsAny = {"DaggerBackstabAspect", }
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
	})

-- Removing incompatible Hammers
	OverwriteTableKeys(TraitData.AxeBlockEmpowerTrait.GameStateRequirements, {
			{
				Path = { "CurrentRun", "Hero", "Weapons", },
				HasAll = { "WeaponAxe", },
			},
			{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponAxe", },
				IsNone = {"AxeRecoveryAspect", }
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
				IsNone = {"DaggerBackstabAspect", }
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
				IsNone = { "DaggerTripleAspect", "DaggerBackstabAspect", }
			},
		}
	)


	--Adding Hammers to pool
	table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "AxeShieldDeflectTrait")
    table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "DaggerDashAttackTripleTraitYoung")