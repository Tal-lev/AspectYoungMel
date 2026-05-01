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

-- Utility functions
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

local function RemoveWeaponPropertyFromGodTraits(weaponName, weaponProperty)
    for traitName, trait in pairs(TraitData) do
        
        -- 1. Identify if the trait is a God Boon
        -- Boons typically have a 'LootName' or 'God' key tied to them.
        local isGodBoon = (trait.LootName ~= nil) or (trait.God ~= nil)
        
        -- 2. Explicitly safeguard against modifying Aspects
        -- Aspects usually use this flag, or have "Aspect" in their internal name.
        local isAspect = trait.IsWeaponEnchantment or string.find(traitName, "Aspect") ~= nil
        
        -- 3. Proceed only if it's a boon and definitely not an aspect
        if isGodBoon and not isAspect and trait.PropertyChanges then
            for i = #trait.PropertyChanges, 1, -1 do
                local change = trait.PropertyChanges[i]
                if change.WeaponName == weaponName and change.WeaponProperty == weaponProperty then
                    table.remove(trait.PropertyChanges, i)
                end
            end
        end
    end
end

function mod.LoadAspectPackage()
	local packageName = _PLUGIN.guid .. ""
	print("AuthorName-ModName - Loading package: " .. packageName)
	LoadPackages({ Name = packageName })
end

--Function for StaffAspectYoungMel
function mod.CheckStaffSelfHit( triggerArgs, args )
	if not IsEmpty( GetInProjectilesBlast({ Id = CurrentRun.Hero.ObjectId, DestinationName = args.ProjectileName })) then
		if (CurrentRun.Hero.Health / CurrentRun.Hero.MaxHealth) <= args.Threshold then
			Heal( CurrentRun.Hero, {HealAmount = args.HealAmount, SourceName = "Aspect" })
		end
	end
end

--Importing Axe Textures
local weapon_axe_hash = rom.data.get_hash_guid_from_string("WeaponAxe")
local custom_axe_hash = rom.data.get_hash_guid_from_string("AxeTest-WeaponAxe")

local current_axe_overrides = rom.data.load_package_overrides_get(weapon_axe_hash)

table.insert(current_axe_overrides, 1, custom_axe_hash)
table.insert(current_axe_overrides, weapon_axe_hash)

rom.data.load_package_overrides_set(weapon_axe_hash, current_axe_overrides)

--Importing Staff Textures
local weapon_staff_hash = rom.data.get_hash_guid_from_string("WeaponStaffSwing")
local custom_staff_hash = rom.data.get_hash_guid_from_string("AxeTest-WeaponStaff")

local current_staff_overrides = rom.data.load_package_overrides_get(weapon_staff_hash)

table.insert(current_staff_overrides, 1, custom_staff_hash)
table.insert(current_staff_overrides, weapon_staff_hash)

rom.data.load_package_overrides_set(weapon_staff_hash, current_staff_overrides)

--Importing Dagger Textures
local weapon_dagger_hash = rom.data.get_hash_guid_from_string("WeaponDagger")
local custom_dagger_hash = rom.data.get_hash_guid_from_string("AxeTest-WeaponDagger")

local current_dagger_overrides = rom.data.load_package_overrides_get(weapon_dagger_hash)

table.insert(current_dagger_overrides, 1, custom_dagger_hash)
table.insert(current_dagger_overrides, weapon_dagger_hash)

rom.data.load_package_overrides_set(weapon_dagger_hash, current_dagger_overrides)

-- Loading packages
modutil.mod.Path.Wrap("DeathAreaRoomTransition", function(base, source, args)
	if game.CurrentHubRoom ~= '' and game.CurrentHubRoom ~= nil then  
		if game.CurrentHubRoom.Name == "Hub_PreRun" then
			mod.LoadAspectPackage()
		end
	end
	return base(source, args)
end)

modutil.mod.Path.Wrap("HubPostBountyLoad", function(base, source, args)
	if game.CurrentHubRoom ~= '' and game.CurrentHubRoom ~= nil then  
		if game.CurrentHubRoom.Name == "Hub_PreRun" then
			mod.LoadAspectPackage()
		end
	end
	return base(source, args)
end)

modutil.mod.Path.Wrap("HubPostDreamLoad", function(base, source, args)
	if game.CurrentHubRoom ~= '' and game.CurrentHubRoom ~= nil then  
		if game.CurrentHubRoom.Name == "Hub_PreRun" then
			mod.LoadAspectPackage()
		end
	end
	return base(source, args)
end)

modutil.mod.Path.Wrap("StartRoom", function(base, source, args)
        -- Check for specific Aspect traits
        if HeroHasTrait("AxeRecoveryAspect") or HeroHasTrait("BaseStaffAspect") then  
            mod.LoadAspectPackage()
        end
	return base(source, args)
end)
 

-- Steps to create new Aspects
	-- 1.Adding projectile data
	-- 2.Adding Effects to default attack with active=false
	-- 3.Loading Packge with new icon/texture/model
	-- 4.Adding new aspect
		--a.Icon
		--b.Mesh / Texture
		--c.Sounds
		--d.Trait
		--e.Modify attacks
	-- 5.Adding text of new Aspect
	-- 6.Adding god effects to FireFX / ProjectileFX
	-- 7.Modifying Hammers
	-- 8.Overwrite an existing aspect with the new one.

-- AxeAspectYoungMel - 1,2,3,4(a,b,c,d,e),5,6,7,8
-- StaffAspectYoungMel - 1,3,4(a,b,d,e),5,6,8

-- Changes to special

-- -- Failed Attempt to change the Aspect trait to give damage buff after Block.
--TraitData.AxeBlockDamageBuff = {
--    Name = "AxeBlockDamageBuff",
--    InheritFrom = { "DefaultTrait" },
--    IsHidden = true,
--    -- This must be a list of tables
--    AddOutgoingDamageModifiers = {
--        {
--            ValidWeaponMultiplier = 1.30, 
--        }
--    }
--}
--
--function mod.ApplyAxeAspectBlockBuff()
--		-- If the buff is already active, just refresh the duration (optional)
--		if HeroHasTrait("AxeBlockDamageBuff") then
--			return 
--		end
--		-- Apply the +30% damage buff
--		AddTraitToHero({ TraitName = "AxeBlockDamageBuff" })
--
--		-- Add the Frenzy Icon above the player
--		-- "FrenzyStatusIcon" is the standard internal name for the UI effect
--		local frenzyIconId = CreateAnimationToAttached({ 
--			Name = "FrenzyStatusIcon", 
--			DestinationId = CurrentRun.Hero.ObjectId, 
--			OffsetY = -150 
--		})
--		
--		-- Wait 3 seconds
--		wait(3.0, RoomThreadName)
--		
--		-- Remove the buff
--		RemoveTrait(CurrentRun.Hero, "AxeBlockDamageBuff")
--  
--		-- Remove the icon
--		StopAnimation({ Name = "FrenzyStatusIcon", DestinationId = CurrentRun.Hero.ObjectId })
--		Destroy({ Id = frenzyIconId })
--	end
--
--ModUtil.Path.Wrap("CheckWeaponBlock", function(baseFunc, victim, attacker, triggerArgs)
--    -- Execute the original block logic first
--    local successfullyBlocked = baseFunc(victim, attacker, triggerArgs)
--    
--    -- If the block was successful by the player using your Aspect, trigger the buff
--    if successfullyBlocked and victim == CurrentRun.Hero and HeroHasTrait("AxeRecoveryAspect") then
--        thread(_PLUGIN.guid .. "." .. "ApplyAxeAspectBlockBuff")
--    end
    
--    -- Return the original block result back to the game engine
--    return successfullyBlocked
--end)

modutil.once_loaded.game(function()

	--Inserts text
	local TextOrder = {
    "Id",
    "InheritFrom",
    "DisplayName",
    "Description",
	}
	
	local file = rom.path.combine(rom.paths.Content, 'Game/Text/en/TraitText.en.sjson')
	sjson.hook(file, function(data)
	
		table.insert(data.Texts, sjson.to_object(
		{
			Id = "HealthThresholdStatDisplay",
			InheritFrom = "BaseStatLine",
			DisplayName = "{!Icons.Bullet}{#PropertyFormat}Health Threshold:",
			Description = "{#UpgradeFormat}{$TooltipData.ExtractData.HealthThreshold}%{!Icons.Health}"

		},
		TextOrder)
	)
	table.insert(data.Texts, sjson.to_object(
		{
			Id = "AxeShieldDeflectTrait",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Mirror Shield",
			Description = "Your {$Keywords.Special} can {$Keywords.Deflect}"

		},
		TextOrder)
	)

	for key, text in pairs(data.Texts) do
		--Axe Aspect Young Mel
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
		--Staff Aspect Young Mel
		if text.Id == 'BaseStaffAspect' then
			text.DisplayName = "Aspect of young Melinoë."
			text.Description = "While you have no more than {#UpgradeFormat}{$TooltipData.ExtractData.HealthThreshold}%{!Icons.Health}{#Prev}, absorb your {$Keywords.SpecialEX} blast to restore {#BoldFormatGraft}{$TooltipData.ExtractData.HealAmount}{!Icons.Health}{#Prev}."
		end
		if text.Id == 'BaseStaffAspect_Shop' then
			text.DisplayName = "Witch's Staff, Aspect of Young Melinoë:"
		end
		if text.Id == 'BaseStaffAspect_Upgrade' then
			text.DisplayName = "Aspect of young Melinoë {#AltUpgradeFormat}{$TooltipData.AspectRarityText}"
		end
		if text.Id == 'BaseStaffAspect_FlavorText' then
			text.DisplayName = "A waxing crescent moon; the promise of power, if one could get it out of her mouth."
		end
		--Dagger Aspect Young Mel
		if text.Id == 'DaggerBackstabAspect' then
			text.DisplayName = "Aspect of young Melinoë."
			text.Description = "..."
		end
		if text.Id == 'DaggerBackstabAspect_Shop' then
			text.DisplayName = "Lim and Oros, Aspect of Young Melinoë:"
		end
		if text.Id == 'DaggerBackstabAspect_Upgrade' then
			text.DisplayName = "Aspect of young Melinoë {#AltUpgradeFormat}{$TooltipData.AspectRarityText}"
		end
		if text.Id == 'DaggerBackstabAspect_FlavorText' then
			text.DisplayName = "Precision has to be learned and wood is a kinder teacher than steel."
		end
	end

	return data
	end)

	local file = rom.path.combine(rom.paths.Content, 'Game/Weapons/PlayerWeapons.sjson')
	sjson.hook(file, function(data)
	for key, weapon in pairs(data.Weapons) do
		if weapon.Name == 'WeaponAxeSpecial' then
			weapon.Effects =
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
			}
	
		--elseif weapon.Name == 'WeaponStaffBall' then 
		--	weapon.Effects =
		end
	end
	return data
	end)


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

	-- Adding Axe Aspect of Young Mel
	AxeAspectofYoungMelinoe = {
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
		Icon = "JarlUlsfark-AspectYoungMel\\AxeAspectYoungMelIcon",
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
		WeaponDataOverride =
		{
			WeaponAxeSpecial =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/SFX/Player Sounds/ZagreusFistWhoosh" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/Player Sounds/ShieldObstacleHit",
						Brick = "/SFX/Player Sounds/ShieldObstacleHit",
						Stone = "/SFX/Player Sounds/ShieldObstacleHit",
						Organic = "/SFX/Player Sounds/ShieldObstacleHit",
						StoneObstacle = "/SFX/SwordWallHitClankSmall",
						BrickObstacle = "/SFX/SwordWallHitClankSmall",
						MetalObstacle = "/SFX/SwordWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
						Shell = "/SFX/ShellImpact",
					},
				},
			},
		},
		-- Changing special to Block
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

	-- Adding Staff Aspect of Young Mel
	StaffAspectofYoungMelinoe = 
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		Icon = "JarlUlsfark-AspectYoungMel\\StaffAspectYoungMelIcon",
		RequiredWeapon = "WeaponStaffSwing",
		-- 'I have a good idea for a prank for this Asclepius character' ~Momus
		WeaponKitGrannyModel = "WeaponStaff_Mesh",
		ReplacementGrannyModels = 
		{
			WeaponStaff_Mesh = "WeaponStaff_Mesh"
		},
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 1.333,
			},
			Epic =
			{
				Multiplier = 1.666,
			},
			Heroic =
			{
				Multiplier = 2,
			},
			Legendary =
			{
				Multiplier = 2.333,
			},
			Perfect =
			{
				Multiplier = 2.666,
			},
		},
		OnProjectileDeathFunction = 
		{
			Name = _PLUGIN.guid .. "." .. "CheckStaffSelfHit",
			ValidProjectiles = {"ProjectileStaffBallCharged"},
			Args = 
			{
				ProjectileName = "ProjectileStaffBallCharged",
				Threshold = { BaseValue = 0.3 },
				HealAmount = 5,
				ReportValues = 
				{ 
					ReportedThreshold = "Threshold" ,
					ReportedHeal = "HealAmount" 
				},
			}
		},
		ExtractValues =
		{
			{
				Key = "ReportedThreshold",
				ExtractAs = "HealthThreshold",
				Format = "Percent",
				SkipAutoExtract = true
			},
			{
				Key = "ReportedHeal",
				ExtractAs = "HealAmount",
				SkipAutoExtract = true
			},
		},
		StatLines =
		{
			"HealthThresholdStatDisplay"
		},
		PropertyChanges =
		{
			{
				WeaponName = "WeaponStaffBall",
				WeaponProperty = "Projectile",
				ChangeValue = "ProjectileStaffBoltEA",
			},
			{
				WeaponName = "WeaponStaffBall",
				WeaponProperty = "InitialCooldown",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "WeaponStaffBall",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.4,
				ChangeType = "Absolute",
			},
		},
		AddOutgoingDamageModifiers =
		{

		},
		FlavorText = "BaseStaffAspect_FlavorText",
	}


	-- Adding Dagger Aspect of Young Mel
	DaggerAspectofYoungMelinoe = 
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		Icon = "JarlUlsfark-AspectYoungMel\\DaggerAspectYoungMelIcon",
		RequiredWeapon = "WeaponDagger",
		WeaponKitGrannyModel = "WeaponDagger_Mesh",
		ReplacementGrannyModels = 
		{
			WeaponDaggerA_Mesh = "WeaponDaggerA_Mesh",
			WeaponDaggerB_Mesh = "WeaponDaggerB_Mesh"
		},
		WeaponDataOverride =
		{
			WeaponDaggerThrow = {
				ChargeWeaponStages =
					{
						{ ManaCost = 12, WeaponProperties = { Projectile = "ProjectileDaggerThrowEA", FireGraphic = "Melinoe_Dagger_SpecialEx_Fire", NumProjectiles = 3, AdditionalProjectileWaveChance = 0, ProjectileInterval = 0.08}, ApplyEffects = { "WeaponDaggerThrowEXDisable", "WeaponDaggerThrowEXDisableCancellable", "WeaponDaggerThrowEXDisableMoveHold" }, Wait = 0.32, HideStageReachedFx = true, ChannelSlowEventOnEnter = true },
						{ ManaCost = 16, WeaponProperties = { NumProjectiles = 4, AdditionalProjectileWaveChance = 0}, ApplyEffects = { "WeaponDaggerThrowEXDisable", "WeaponDaggerThrowEXDisableCancellable", "WeaponDaggerThrowEXDisableMoveHold" }, Wait = 0.14, HideStageReachedFx = true, },
						{ ManaCost = 20, WeaponProperties = { NumProjectiles = 5, AdditionalProjectileWaveChance = 0}, ApplyEffects = { "WeaponDaggerThrowEXDisable", "WeaponDaggerThrowEXDisableCancellable", "WeaponDaggerThrowEXDisableMoveHold" }, Wait = 0.14, HideStageReachedFx = true, },
						{ ManaCost = 24, WeaponProperties = { NumProjectiles = 6, AdditionalProjectileWaveChance = 0}, ApplyEffects = { "WeaponDaggerThrowEXDisable", "WeaponDaggerThrowEXDisableCancellable", "WeaponDaggerThrowEXDisableMoveHold" }, Wait = 0.14, },
					},
				Sounds = 
					{
						ImpactSounds = {
							Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
							Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
							Bone = "/SFX/DaggerImpactWoodHard",
							Brick = "/SFX/DaggerImpactWoodSoft",
							Stone = "/SFX/DaggerImpactWoodSoft",
							Robot = "/SFX/MetalStoneClangShort",
							Organic = "/SFX/DaggerImpactOrganic",
							StoneObstacle = "/SFX/SwordWallHitClankSmall",
							BrickObstacle = "/SFX/SwordWallHitClankSmall",
							MetalObstacle = "/SFX/SwordWallHitClankSmall",
							BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
							Shell = "/SFX/ShellImpact",
						}
					},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "WeaponDagger2",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "WeaponDagger",
			},
			{
				WeaponName = "WeaponDagger",
				ProjectileName ="ProjectileDaggerSliceLeft",
				ProjectileProperty = "Damage",
				ChangeValue = 40,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "WeaponDagger",
				WeaponProperty = "FireFx",
				ChangeValue = "DaggerSwipeFastBrown",
			},
			{
				WeaponName = "WeaponDagger2",
				ProjectileName ="ProjectileDaggerSliceRight",
				ProjectileProperty = "Damage",
				ChangeValue = 40,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "WeaponDagger2",
				WeaponProperty = "FireFx",
				ChangeValue = "DaggerSwipeFastFlipBrown",
			},
			{
				WeaponName = "WeaponDaggerThrow",
				WeaponProperty = "Projectile",
				ChangeValue = "ProjectileDaggerThrowEA",
			},
			{
				WeaponName = "WeaponDaggerThrow",
				ProjectileName = "ProjectileDaggerThrowEA",
				ProjectileProperty = "Damage",
				ChangeValue = 50,
				ChangeType = "Absolute"
			},
		},
		FlavorText = "DaggerBackstabAspect_FlavorText",
	}


	--RemoveWeaponPropertyFromTraits("WeaponAxeSpecial", "FireFx")
	-- At TraitData_God.lua
	AddGodTraitProperty({
		TraitSuffix = "SpecialBoon",
		PropertyChanges = {

			-- Default spin (no aspect overrides)
			{
				FalseTraitNames = { "AxeBlockEmpowerTrait", "AxeRallyAspect", "AxeRecoveryAspect" },
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "FireFx",
				ValuePrefix = "AxeSpinDouble_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Rally aspect
			{
				TraitName =  "AxeRallyAspect",
				FalseTraitNames = { "AxeBlockEmpowerTrait", "AxeRecoveryAspect" },
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "FireFx",
				ValuePrefix = "AxeSwipeUpper_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Block aspect (no FX)
			{
				TraitName = "AxeBlockEmpowerTrait",
				FalseTraitNames = { "AxeRecoveryAspect", "AxeRallyAspect" },
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "FireFx",
				ValuePrefix = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Recovery aspect (no FX)
			{
				TraitName = "AxeRecoveryAspect" ,
				FalseTraitNames = { "AxeBlockEmpowerTrait", "AxeRallyAspect" },
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "FireFx",
				ValuePrefix = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				ProjectileName = "ProjectileAxeBlockSpin",
				ProjectileProperty = "DetonateFx",
				ValuePrefix = "AxeDeflect_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				ProjectileName = "ProjectileAxeBlockSpinDeflect",
				ProjectileProperty = "DetonateFx",
				ValuePrefix = "AxeDeflect_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponStaffBall",
				ProjectileName = "ProjectileStaffBoltEA",
				ProjectileProperty = "Graphic",
				ValuePrefix = "StaffBallProjectileIn_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponDaggerThrow",
				ProjectileName = "ProjectileDaggerThrowEA",
				ProjectileProperty = "Graphic",
				ValuePrefix = "DaggerProjectile_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponDaggerThrow",
				ProjectileName = "ProjectileDaggerThrowEA",
				ProjectileProperty = "Graphic",
				ValuePrefix = "DaggerProjectile_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			
		}
	})
	

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

	OverwriteTableKeys( TraitSetData.Aspects.AxeRecoveryAspect, AxeAspectofYoungMelinoe)
	OverwriteTableKeys( TraitSetData.Aspects.BaseStaffAspect, StaffAspectofYoungMelinoe)
	OverwriteTableKeys( TraitSetData.Aspects.DaggerBackstabAspect, DaggerAspectofYoungMelinoe)
	

end)
