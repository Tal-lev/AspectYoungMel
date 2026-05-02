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
function mod.LoadAspectPackage()
	local packageName = _PLUGIN.guid .. ""
	print("AuthorName-ModName - Loading package: " .. packageName)
	LoadPackages({ Name = packageName })
end

--Function for StaffAspectYoungMel trait
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
        if HeroHasTrait("AxeRecoveryAspect") or HeroHasTrait("BaseStaffAspect") or HeroHasTrait("DaggerBackstabAspect") then  
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
-- DaggerAspectYoungMel - 1,3,4(a,b,c,e),~5,6,8


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
	-- Changing Aspect text
	import "Aspects_text.lua"
	-- Changing the weapon effects, adding all possible aspects and switching new effects to inactive
	import "Aspects_weapon_effects.lua"

	-- import "Aspect_VFX.lua"	-- Adds new VFX for attacks, Inside Aspects_projectiles.lua
	-- Adds new projectiles
	import "Aspects_projectiles.lua"

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
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.15384,
			},
			Epic =
			{
				Multiplier = 1.2962,
			},
			Heroic =
			{
				Multiplier = 1.425000,
			},
			Legendary =
			{
				Multiplier = 1.54,
			},
			Perfect =
			{
				Multiplier = 1.673,
			},
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
				WeaponNames = WeaponSets.HeroBlinkWeapons,
				WeaponProperty = "ClipRegenInterval",
				BaseValue = 0.8,
				SourceIsMultiplier = true,
				DecimalPlaces = 3,
				ChangeType = "Multiply",
				ReportValues = { ReportedReduction = "ChangeValue"},
			},
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
		StatLines =
		{
			"AspectDashRechargeStatDisplay",
		},
		ExtractValues =
		{
			{
				Key = "ReportedReduction",
				ExtractAs = "TooltipMultiplier",
				Format = "PercentReciprocalDelta",
			},
		},
		FlavorText = "DaggerBackstabAspect_FlavorText",
	}


	--Adds god specific VFX
	import "Aspects_god_effects.lua"
	
	--Adds/removes Aspect specific hammers
	import "Aspects_hammers.lua"

	OverwriteTableKeys( TraitSetData.Aspects.AxeRecoveryAspect, AxeAspectofYoungMelinoe)
	OverwriteTableKeys( TraitSetData.Aspects.BaseStaffAspect, StaffAspectofYoungMelinoe)
	--OverwriteTableKeys( TraitSetData.Aspects.DaggerBackstabAspect, DaggerAspectofYoungMelinoe)

	TraitData.DaggerAspectofYoungMelinoe = DaggerAspectofYoungMelinoe
	
	OverwriteTableKeys(WeaponShopItemData, { 
		DaggerAspectofYoungMelinoe = {
	
			WeaponName = "WeaponDagger",
			HideAfterPurchased = true,
			IconScale = 0.8,
			UnlockTextId = "WeaponShopAspectUnlock",
			Cost =
			{
				OreHGlassrock = 1,
				OreFSilver = 15,
			},
			GameStateRequirements =
			{
				{
					PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeWeaponUpgradeSystem" },
				},
			},
			PreRevealVoiceLines =
			{
				TriggerCooldowns = { "MelinoeMiscWeaponEquipSpeech" },
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,

					{ Cue = "/VO/Melinoe_2449", Text = "Grant me the Aspect of Artemis!" },
				},
				{
					BreakIfPlayed = true,
					PreLineWait = 0.65,
					ObjectType = "NPC_Skelly_01",
					TriggerCooldowns = { "SkellyAnyQuipSpeech" },

					{ Cue = "/VO/Skelly_0196", Text = "She knows her blades!" },
				},
			},
		}
	})
	table.insert( ScreenData.WeaponShop.ItemCategories[3], 
			"DaggerAspectofYoungMelinoe"
			) 
	OverwriteTableKeys( ScreenData.WeaponUpgradeScreen.DisplayOrder, {
		WeaponDagger ={
			"DaggerBackstabAspect",
			"DaggerAspectofYoungMelinoe",
			"DaggerBlockAspect",
			"DaggerHomingThrowAspect",
			"DaggerTripleAspect",
		}
	})


end)
