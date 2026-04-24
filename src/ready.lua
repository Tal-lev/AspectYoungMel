---@meta _
-- globals we define are private to our plugin!
---@diagnostic disable: lowercase-global

-- here is where your mod sets up all the things it will do.
-- this file will not be reloaded if it changes during gameplay
-- 	so you will most likely want to have it reference
--	values and functions later defined in `reload.lua`.

-- Config
local enabled = true

if not enabled then return end

-- Depends
sjson = rom.mods['SGG_Modding-SJSON']
modutil = rom.mods['SGG_Modding-ModUtil']
rom.mods['SGG_Modding-ENVY'].auto()

game = rom.game
import_as_fallback(game)

-- Utility function
local CoreGods = { "Aphrodite", "Apollo", "Ares", "Demeter", "Hephaestus", "Hera", "Hestia", "Poseidon", "Zeus" }

local function AddGodTraitProperty( args )
	if args.PropertyChanges == nil or (args.TraitPrefix == nil and args.TraitSuffix == nil) then
		return
	end
	for _, god in pairs(CoreGods) do
		local traitName = (args.TraitPrefix or "") .. god .. (args.TraitSuffix or "")
		local properties = DeepCopyTable(args.PropertyChanges)
		if TraitData[traitName] ~= nil and TraitData[traitName].PropertyChanges ~= nil then
			for _, property in pairs(properties) do
				if property.Value ~= nil then
					property.ChangeValue = property.Value
					property.Value = nil
				elseif property.ValuePrefix ~= nil or property.ValueSuffix ~= nil then
					property.ChangeValue = (property.ValuePrefix or "") .. god .. (property.ValueSuffix or "")
					property.ValuePrefix = nil
					property.ValueSuffix = nil
				end
				table.insert( TraitData[traitName].PropertyChanges, property )
			end
		end
	end
end

-- Changes to special
modutil.once_loaded.game(function()

	local file = rom.path.combine(rom.paths.Content, 'Game/Weapons/PlayerWeapons.sjson')
	sjson.hook(file, function(data)
	for key, weapon in pairs(data.Weapons) do
		if weapon.Name == 'WeaponAxeSpecial' then
			data.Weapons[key] =
	{
		Name = "WeaponAxeSpecial",
		InheritFrom = "1_BaseDamagingWeapon",
		Control = "Attack3",
		Type = "GUN",
		Projectile = "ProjectileAxeSpecial",
		ClipSize = 1,
		ChargeSoundFadeTime = 0.25,
		FullyAutomatic = false,
		ChargeCancelMovement = true,
		CancelMovement = true,
		BlockMoveInput = true,
		AutoLock = false,
		ChargeStartFx = "null",
		ProjectileOffsetStart = "LEFT",
		FireGraphic = "Melinoe_Axe_Special1_Fire",
		FireFx = "AxeSpinDouble",
		FireOnRelease = false,
		ChargeTime = 0.08,
		ChargeStartAnimation = "Melinoe_Axe_Special1_Start",
		LockTrigger = true,
		ForceReleaseOnSwap = true,
		ChargeCancelGraphic = "Melinoe_Axe_Special1_End",
		CancelChargeOnRelease = true,
		BarrelLength = 60,
		AcceptTriggerLockRequests = true,
		AllowExternalForceRelease = false,
		AllowExternalForceReleaseIfAnyCharged = true,
		CanCancelDisables = true,
		CanCancelOwnDisables = false,
		Cooldown = 0.75,
		SetCompleteAngleOnCharge = true,
		AddOnFire = "WeaponAxeSpecialSwing",

		Effects =
		{
			{
				Name = "AxeSpecialBlockSelfTriggerLock",
				Duration = 0.30,
				Active = true,
			},
			{
				Name = "AxeSpecialDisable",
				Duration = 0.31,
				DisableAttack = true,
				DisableMove = true,
				DisableRotate = true,
				RequestTriggerLock = true,
				Cancelable = false,
				Active = true,
			},
			{
				Name = "AxeSpecialDisableCancelable",
				Duration = 0.37,
				DisableAttack = true,
				DisableMove = true,
				DisableRotate = true,
				RequestTriggerLock = true,
				Cancelable = true,
				Active = true,
			},
			{
				Name = "AxeSpecialDisableMovementCancelable",
				Duration = 0.38,
				DisableAttack = false,
				DisableMove = true,
				DisableRotate = true,
				RequestTriggerLock = true,
				Cancelable = true,
				Active = true,
			},
			{
				Trigger = "Charging",
				Name = "AspectSlowCharge",
				Type = "SPEED",
				DurationFrames = 30,
				Modifier = 0.5,
				Cancelable = true,
				Active = false,
				CanAffectInvulnerable = true,
			},
			{
				Trigger = "Charging",
				Name = "AspectSlowFire",
				Type = "SPEED",
				DurationFrames = 60,
				Modifier = 0.5,
				Cancelable = true,
				Active = false,
				CanAffectInvulnerable = true,
			},
			{
				Trigger = "Charging",
				Name = "ShieldSelfSpeed",
				Type = "SPEED",
				HaltOnStart = true,
				Duration = 0.02,
				Modifier = 0.2,
				Active = false,
				CanAffectInvulnerable = true,
				
			},
			{
				Trigger = "Charging",
				Name = "ShieldSelfInvulnerableRush",
				Type = "INVULNERABLE",
				Duration = 0.1,
				Modifier = 1.0,
				Active = false,
				CanAffectInvulnerable = true,
				ClearOnAttack = true,
			},
			{
				Trigger = "Fire",
				Name = "ShieldSelfInvulnerableRush2",
				Type = "INVULNERABLE",
				DurationFrames = 34,
				Modifier = 1.0,
				Active = false,
				AngleCoverage = 220,
				CanAffectInvulnerable = true,
				Cancelable = true,
			},
			{
				Name = "ShieldFireDisableAttack",
				DurationFrames = 13,
				DisableAttack = true,
				RequestTriggerLock = true,
				Cancelable = false,
				Active = false,
			},
			{
				Trigger = "Charging",
				Name = "ShieldChargeDisableMove",
				DurationFrames = 19,
				DisableMove = true,
				DisableRotate = true,
				Cancelable = true,
				TimeModifierFraction = 0,
				ClearOnAttack = true,
				Active = false,
			},
			{
				Trigger = "Fire",
				Name = "ShieldFireDisableMove2",
				DurationFrames = 34,
				DisableMove = true,
				DisableRotate = true,
				Cancelable = true,
				TimeModifierFraction = 0,
				Active = false,
			},
		},
	}

		end
	end
	return data
	end)

	local file = rom.path.combine(rom.paths.Content, 'Game/Projectiles/PlayerProjectiles.sjson')
	sjson.hook(file, function(data)
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
	return data
	end)

	local file = rom.path.combine(rom.paths.Content, 'Game/Text/en/TraitText.en.sjson')
	sjson.hook(file, function(data)
	for key, text in pairs(data.Texts) do
		if text.Id == 'AxeRecoveryAspect' then
			text.DisplayName = "Aspect of young Melinoë"
			text.Description = "Replaces your {$Keywords.Special} with a Block."
		end
		if text.Id == 'AxeDamageHealthStatDisplay' then
			text.DisplayName = "{!Icons.Bullet}{#PropertyFormat}Omega Special Damage:"
			text.Description = "{#UpgradeFormat}{$TooltipData.StatDisplay1}"
		end
		if text.Id == 'AxeRecoveryAspect_Shop' then
			text.DisplayName = "Moonstone Axe, Aspect of Young Melinoë:"
		end
		if text.Id == 'AxeRecoveryAspect_Upgrade' then
			text.DisplayName = "Aspect of young Melinoë {#AltUpgradeFormat}{$TooltipData.AspectRarityText}"
		end
		if text.Id == 'AxeRecoveryAspect_FlavorText' then
			text.DisplayName = "One day its blade could even split the light of the Moon, once its wielder is tall enough to lift it."
		end
	end
	return data
	end)

	AspectofYoungMelinoe = {
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2,
			},
			Heroic =
			{
				Multiplier = 2.5,
			},
			Legendary =
			{
				Multiplier = 3,
			},
			Perfect =
			{
				Multiplier = 4.5,
			},
		},
		Icon = "iconaxe",
		RequiredWeapon = "WeaponAxe",
		WeaponKitGrannyModel = "Melinoe_Axe_Mesh1",
		ReplacementGrannyModels = 
		{
			Melinoe_Axe_Mesh1 = "Melinoe_Axe_Mesh1",
		},
		AddOutgoingDamageModifiers =
		{
			ExMultiplier =
			{
				BaseValue = 1.3,
				SourceIsMultiplier = true,
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ReportValues = { ReportedWeaponMultiplier = "ExMultiplier"},
		},
		PropertyChanges =
		{
			{
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "Projectile",
				ChangeValue = "ProjectileAxeBlockSpin",
			},
			{
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "ExpireProjectilesOnFire",
				ChangeVlaue = "ProjectileAxeSpin",
			},
			{
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "DoProjectileBlockPresentation",
				ChangeVlaue = true,
				ChangeType = "Absolute",
			},
			{	
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "DefaultKnockbackForce",
				ChangeVlaue = 480,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "DefaultKnockbackScale",
				ChangeVlaue = 0.6,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "ActiveProjectileCap",
				ChangeValue = 1,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "FizzleOldSpawns",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "BlockedByAllOtherFireRequest",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "RootOwnerWhileFiring",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
			},
			{
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.4,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "AddOnFire",
				ChangeValue = "WeaponAxeSpecialSwing",

			},
			{
				WeaponName = "WeaponAxeSpecialSwing",
				WeaponProperty = "Projectile",
				ChangeValue = "ProjectileAxeBlock2",
			},
			{
				WeaponName = "WeaponAxeSpecial",
				EffectName = "AxeSpecialBlockSelfTriggerLock",
    			EffectProperty = "Active",
    			ChangeValue = false,
    			ChangeType = "Absolute",
    			ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				EffectName = "AxeSpecialDisable",
    			EffectProperty = "Active",
    			ChangeValue = false,
    			ChangeType = "Absolute",
    			ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				EffectName = "AxeSpecialDisable",
    			EffectProperty = "Active",
    			ChangeValue = false,
    			ChangeType = "Absolute",
    			ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				EffectName = "AxeSpecialDisableCancelable",
    			EffectProperty = "Active",
    			ChangeValue = false,
    			ChangeType = "Absolute",
    			ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				EffectName = "AxeSpecialDisableMovementCancelable",
    			EffectProperty = "Active",
    			ChangeValue = false,
    			ChangeType = "Absolute",
    			ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				EffectName = "ShieldSelfSpeed",
    			EffectProperty = "Active",
    			ChangeValue = true,
    			ChangeType = "Absolute",
    			ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				EffectName = "ShieldSelfInvulnerableRush",
    			EffectProperty = "Active",
    			ChangeValue = true,
    			ChangeType = "Absolute",
    			ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				EffectName = "ShieldSelfInvulnerableRush2",
    			EffectProperty = "Active",
    			ChangeValue = true,
    			ChangeType = "Absolute",
    			ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				EffectName = "ShieldFireDisableAttack",
    			EffectProperty = "Active",
    			ChangeValue = true,
    			ChangeType = "Absolute",
    			ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				EffectName = "ShieldChargeDisableMove",
    			EffectProperty = "Active",
    			ChangeValue = true,
    			ChangeType = "Absolute",
    			ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				EffectName = "ShieldFireDisableMove2",
    			EffectProperty = "Active",
    			ChangeValue = true,
    			ChangeType = "Absolute",
    			ExcludeLinked = true,
			},
		},
			-- At TraitData_God.lua
		AddGodTraitProperty = {
			TraitSuffix = "SpecialBoon",
			PropertyChanges =
			{
				{
					WeaponName = "WeaponAxeSpecial",
					WeaponProperty = "FireFx",
					ChangeValue = "null",
					ChangeType = "Absolute",
					ExcludeLinked = true
				},
				{
					WeaponName = "WeaponAxeSpecial",
					ProjectileName = "ProjectileAxeBlockSpin",
					ProectileProperty = "DetonateFx",
					ValuePrefix = "AxeDeflect_",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				}
			},
		},
		StatLines =
		{
			"AxeDamageHealthStatDisplay",
		},
		ExtractValues =
		{
			{
				Key = "ReportedWeaponMultiplier",
				ExtractAs = "Damage",
				Format = "PercentDelta",
			},
		},
		FlavorText = "AxeRecoveryAspect_FlavorText",
	}
	OverwriteTableKeys( TraitSetData.Aspects.AxeRecoveryAspect, AspectofYoungMelinoe)
	OverwriteTableKeys( TraitData.Aspects.AxeRecoveryAspect, AspectofYoungMelinoe )
end)
