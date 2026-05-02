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
		}
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


	--Adding Hammers to pool
	table.insert( LootSetData.Loot.WeaponUpgrade.Traits, "AxeShieldDeflectTrait")