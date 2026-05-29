---@module 'game'
game = rom.game

---@diagnostic disable-next-line: undefined-global
local mods = rom.mods

---@module "Siuhnexus-BountyAPI"
bountyAPI = mods["Siuhnexus-BountyAPI"]

bountyAPI.RegisterBounty({
    Id = _PLUGIN.guid .. "BountyYMStaff",
    Title = "Trial of Healing",
    Description = "Climb the cold mountain with limited health. Overcome the mountain and win your treat.",
    Difficulty = 4,
    IsStandardBounty = true,
    BiomeChar = "P",

    DataOverrides = function (RegisterValues)
        print("Overriding all the needed game tables for this challenge run...")
    end,
    SetupFunctions = function (BountyRunData, FromSave)
        if FromSave then
            print("Reacting to the data found in the persisted storage for this challenge run...")
        else
            print("Setting up the persisted data storage for this challenge run...")
        end
    end,
    RoomTransition = function (BountyRunData, RoomName)
        print("Room " .. RoomName .. " is being left. Choosing next room...")
    end,
    CanEnd = function (BountyRunData, RoomName)
        print("Determining whether this challenge run should end")
        return true
    end,
    EndFunctions = function (BountyRunData, Cleared)
        print("Challenge run is ending. Cleaning up...")
    end,

    BaseData = {
		InheritFrom = { "DefaultPackagedBounty", "BasePackageBountyBiomeP", },
        WeaponKitName = "WeaponStaffSwing",
		WeaponUpgradeName = "StaffAspectofYoungMelinoe",
		KeepsakeName = "LowHealthCritKeepsake",
		RemoveFamiliar = true,
		ForcedReward = "Mixer5CommonDrop",
		ForcedRewardRepeat = "MetaCurrencyDrop",
		
		RunOverrides =
		{
			MaxGodsPerRun = 4,
			LootTypeHistory =
			{
			HeraUpgrade = 2,
			DemeterUpgrade = 1,
			},
		},
		RewardStoreOverrides =
		{
			RunProgress =
			{
				{
					Name = "StackUpgradeTriple",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						NamedRequirements = { "StackUpgradeLegal", },
					},
				},
				{
					Name = "MaxManaDrop",
					AllowDuplicates = true,
				},
				{
					Name = "WeaponUpgrade",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						NamedRequirements = { "HammerLootRequirements" },
					}
				},
				{
					Name = "Boon",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						-- None
					},
				},
				{
					Name = "Boon",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						-- None
					},
				},
			},
		},
        StartingTraits =
		{
			{ Name = "HeraWeaponBoon", Rarity = "Heroic", },
			{ Name = "DemeterSpecialBoon", Rarity ="Heroic"},
			{ Name = "HeraManaBoon", Rarity = "Heroic", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
		},

		MetaUpgradeStateEquipped =
		{
			"LowHealthBonus", --4
			"LowManaDamageBonus",
			"BonusRarity",
			"EpicRarityBoost"
		},

        ShrineUpgradesActive = --15 Fear total
		{
			EnemyCountShrineUpgrade = 2,
			EnemyEliteShrineUpgrade = 2,
			BossDifficultyShrineUpgrade = 1,
		},

        UnlockGameStateRequirements =
		{
			-- Biome and Shrine unlocks
			NamedRequirements = { "PackageBountyBiomeP", "ShrineUnlocked", },
			-- Bounty progress
			{
				Path = { "GameState", "PackagedBountyClears" },
				HasAny = { "PackageBountyChaosIntro", "PackageBountyOceanus", "PackageBountyStarter", },
			},
			-- Weapon
			{
				Path = { "GameState", "WeaponsUnlocked", },
				HasAll = { "WeaponStaffSwing", "StaffAspectofYoungMelinoe", },
			},
			-- FirstLoot
			{
				Path = { "GameState", "TextLinesRecord", },
				HasAll = { "DemeterFirstPickUp", },
			},
			{
				Path = { "GameState", "TraitsTaken", },
				HasAll = { "LowHealthCritKeepsake", },
			},

			-- MetaUpgrades
			{
				Path = { "GameState", "MetaUpgradeLimitLevel", },
				Comparison = ">=",
				Value = 5,
			},
		},
    },
})

bountyAPI.RegisterBounty({
    Id = _PLUGIN.guid .. "BountyYMDagger",
    Title = "Trial of Initiate",
    Description = "Pass the final step of training by overcoming the witch teacher.",
    Difficulty = 4,
    IsStandardBounty = true,
    BiomeChar = "F",

    DataOverrides = function (RegisterValues)
        print("Overriding all the needed game tables for this challenge run...")
    end,
    SetupFunctions = function (BountyRunData, FromSave)
        if FromSave then
            print("Reacting to the data found in the persisted storage for this challenge run...")
        else
            print("Setting up the persisted data storage for this challenge run...")
        end
    end,
    RoomTransition = function (BountyRunData, RoomName)
        print("Room " .. RoomName .. " is being left. Choosing next room...")
    end,
    CanEnd = function (BountyRunData, RoomName)
        print("Determining whether this challenge run should end")
        return true
    end,
    EndFunctions = function (BountyRunData, Cleared)
        print("Challenge run is ending. Cleaning up...")
    end,

    BaseData = {
		InheritFrom = { "DefaultPackagedBounty", "BasePackageBountyBiomeF", },
        WeaponKitName = "WeaponDagger",
		WeaponUpgradeName = "DaggerAspectofYoungMelinoe",
		KeepsakeName = "EscalatingKeepsake",
		RemoveFamiliar = true,
		ForcedReward = "Mixer5CommonDrop",
		ForcedRewardRepeat = "MetaCurrencyDrop",


		RewardStoreOverrides =
		{
			RunProgress =
			{
				{
					Name = "MaxHealthDrop",
					AllowDuplicates = true,
				},
				{
					Name = "MaxManaDrop",
					AllowDuplicates = true,
				},
				{
					Name = "WeaponUpgrade",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						NamedRequirements = { "HammerLootRequirements" },
					}
				},
			},
		},
		RunOverrides =
		{
			MaxGodsPerRun = 1,
			LootTypeHistory =
			{
			HermesUpgrade = 2,
			},
		},

        StartingTraits =
		{
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },	
		},

		MetaUpgradeStateEquipped =
		{
			"HealthRegen", --1
			"LowHealthBonus", --4
		},

        ShrineUpgradesActive = --15 Fear total
		{
			EnemyHealthShrineUpgrade = 2,
			EnemySpeedShrineUpgrade = 1,
			EnemyCountShrineUpgrade = 3,
			EnemyEliteShrineUpgrade = 1,
			BossDifficultyShrineUpgrade = 1,
		},

        UnlockGameStateRequirements =
		{
			-- Biome and Shrine unlocks
			NamedRequirements = { "PackageBountyBiomeF", "ShrineUnlocked", },
			-- Bounty progress
			{
				Path = { "GameState", "PackagedBountyClears" },
				HasAny = { "PackageBountyChaosIntro", "PackageBountyOceanus", "PackageBountyStarter", },
			},
			-- Weapon
			{
				Path = { "GameState", "WeaponsUnlocked", },
				HasAll = { "WeaponDagger", "DaggerAspectofYoungMelinoe", },
			},
			-- FirstLoot
			{
				Path = { "GameState", "TextLinesRecord", },
				HasAll = { "HermesFirstPickUp", },
			},
			--Keepsake
			--{
			--	Path = { "GameState", "TraitsTaken", },
			--	HasAll = { "EscalatingKeepsake", },
			--},

			-- MetaUpgrades
			{
				PathTrue = { "GameState", "MetaUpgradeState", "HealthRegen", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LowHealthBonus", "Unlocked", },
			},
			{
				Path = { "GameState", "MetaUpgradeLimitLevel", },
				Comparison = ">=",
				Value = 5,
			},
		},
    },
})

bountyAPI.RegisterBounty({
    Id = _PLUGIN.guid .. "BountyYMTorch",
    Title = "Trial of Puddles",
    Description = "Skip down the ocean floor and splash the siren watery balloons.",
    Difficulty = 3,
    IsStandardBounty = true,
    BiomeChar = "G",

    DataOverrides = function (RegisterValues)
        print("Overriding all the needed game tables for this challenge run...")
    end,
    SetupFunctions = function (BountyRunData, FromSave)
        if FromSave then
            print("Reacting to the data found in the persisted storage for this challenge run...")
        else
            print("Setting up the persisted data storage for this challenge run...")
        end
    end,
    RoomTransition = function (BountyRunData, RoomName)
        print("Room " .. RoomName .. " is being left. Choosing next room...")
    end,
    CanEnd = function (BountyRunData, RoomName)
        print("Determining whether this challenge run should end")
        return true
    end,
    EndFunctions = function (BountyRunData, Cleared)
        print("Challenge run is ending. Cleaning up...")
    end,

    BaseData = {
		InheritFrom = { "DefaultPackagedBounty", "BasePackageBountyBiomeP", },
        WeaponKitName = "WeaponTorch",
		WeaponUpgradeName = "TorchAspectofYoungMelinoe",
		KeepsakeName = "FountainRarityKeepsake",
		RemoveFamiliar = true,
		ForcedReward = "Mixer5CommonDrop",
		ForcedRewardRepeat = "MetaCurrencyDrop",
		
		RunOverrides =
		{
			MaxGodsPerRun = 4,
			LootTypeHistory =
			{
			DemeterUpgrade = 2,
			ApolloUpgrade = 1,
			PoseidonUpgrade = 1,
			},
		},
		RewardStoreOverrides =
		{
			RunProgress =
			{
				{
					Name = "StackUpgrade",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						NamedRequirements = { "StackUpgradeLegal", },
					},
				},
				{
					Name = "MaxHealthDrop",
				},
				{
					Name = "MaxManaDrop",
				},
				{
					Name = "WeaponUpgrade",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						NamedRequirements = { "HammerLootRequirements" },
					}
				},
				{
					Name = "Boon",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						-- None
					},
				},
				{
					Name = "Boon",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						-- None
					},
				},
			},
		},
        StartingTraits =
		{
			{ Name = "DemeterCastBoon", Rarity = "Epic", },
			{ Name = "CastNovaBoonYM", Rarity = "Rare", },
			{ Name = "ApolloManaBoonYM", Rarity = "Rare", },
			{ Name = "PoseidonCastBoonYM", Rarity ="Epic"},
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
		},

		MetaUpgradeStateEquipped =
		{
			"LowManaDamageBonus",
			"BonusRarity",
			"EpicRarityBoost"
		},

        ShrineUpgradesActive = --15 Fear total
		{
			EnemyCountShrineUpgrade = 2,
			EnemyEliteShrineUpgrade = 2,
			BossDifficultyShrineUpgrade = 2,
		},

        UnlockGameStateRequirements =
		{
			-- Biome and Shrine unlocks
			NamedRequirements = { "PackageBountyBiomeG", "ShrineUnlocked", },
			-- Bounty progress
			{
				Path = { "GameState", "PackagedBountyClears" },
				HasAny = { "PackageBountyChaosIntro", "PackageBountyOceanus", "PackageBountyStarter", },
			},
			-- Weapon
			{
				Path = { "GameState", "WeaponsUnlocked", },
				HasAll = { "WeaponTorch", "TorchAspectofYoungMelinoe", },
			},
			-- FirstLoot
			{
				Path = { "GameState", "TextLinesRecord", },
				HasAll = { "PoseidonFirstPickUp", },
			},
			--Keepsake
			{
				Path = { "GameState", "TraitsTaken", },
				HasAll = { "FountainRarityKeepsake", },
			},

			-- MetaUpgrades
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LowManaDamageBonus", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "BonusRarity", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "EpicRarityBoost", "Unlocked", },
			},
			{
				Path = { "GameState", "MetaUpgradeLimitLevel", },
				Comparison = ">=",
				Value = 5,
			},
		},
    },
})

bountyAPI.RegisterBounty({
    Id = _PLUGIN.guid .. "BountyYMAxe",
    Title = "Trial of Scary Man",
    Description = "Brave the nightmare and overcome young Melinoë's worst fear.",
    Difficulty = 5,
    IsStandardBounty = true,
    BiomeChar = "I",

    DataOverrides = function (RegisterValues)
        print("Overriding all the needed game tables for this challenge run...")
    end,
    SetupFunctions = function (BountyRunData, FromSave)
        if FromSave then
            print("Reacting to the data found in the persisted storage for this challenge run...")
        else
            print("Setting up the persisted data storage for this challenge run...")
        end
    end,
    RoomTransition = function (BountyRunData, RoomName)
        print("Room " .. RoomName .. " is being left. Choosing next room...")
    end,
    CanEnd = function (BountyRunData, RoomName)
        print("Determining whether this challenge run should end")
        return true
    end,
    EndFunctions = function (BountyRunData, Cleared)
        print("Challenge run is ending. Cleaning up...")
    end,

    BaseData = {
		InheritFrom = { "DefaultPackagedBounty", "BasePackageBountyBiomeI", },
        WeaponKitName = "WeaponAxe",
		WeaponUpgradeName = "AxeAspectofYoungMelinoe",
		KeepsakeName = "ReincarnationKeepsake",
		RemoveFamiliar = true,
		ForcedReward = "Mixer5CommonDrop",
		ForcedRewardRepeat = "MetaCurrencyDrop",
		
		RunOverrides =
		{
			MaxGodsPerRun = 4,
			LootTypeHistory =
			{
			AphroditeUpgrade = 2,
			AresUpgrade = 1,
			HeraUpgrade = 1,
			},
		},
		RewardStoreOverrides =
		{
			RunProgress =
			{
				{
					Name = "StackUpgradeTriple",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						NamedRequirements = { "StackUpgradeLegal", },
					},
				},
				{
					Name = "MaxHealthDropBig",
					AllowDuplicates = true,
				},
				{
					Name = "MaxManaDropBig",
					AllowDuplicates = true,
				},
				{
					Name = "WeaponUpgrade",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						NamedRequirements = { "HammerLootRequirements" },
					}
				},
				{
					Name = "Boon",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						-- None
					},
				},
				{
					Name = "Boon",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						-- None
					},
				},
			},
		},
        StartingTraits =
		{
			{ Name = "AphroditeWeaponBoon", Rarity = "Heroic", },
			{ Name = "AphroditeCastBoon", Rarity = "Heroic", },
			{ Name = "AresSpecialBoon", Rarity = "Heroic", },
			{ Name = "HeraSprintBoon", Rarity ="Heroic"},
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
		},

		MetaUpgradeStateEquipped =
		{
			"LowManaDamageBonus", --2
			"BonusRarity", --3
			"EpicRarityBoost", --5
			"LastStand", --4
			"BonusHealth", --2,
			"HealthRegen", --1
		},

        --ShrineUpgradesActive = --10 Fear total
		--{
		--	BossDifficultyShrineUpgrade = 4,
		--},

        UnlockGameStateRequirements =
		{
			-- Biome and Shrine unlocks
			NamedRequirements = { "PackageBountyBiomeI", "ShrineUnlocked", },
			-- Bounty progress
			{
				Path = { "GameState", "PackagedBountyClears" },
				HasAny = { "PackageBountyChaosIntro", "PackageBountyOceanus", "PackageBountyStarter", },
			},
			-- Weapon
			{
				Path = { "GameState", "WeaponsUnlocked", },
				HasAll = { "WeaponAxe", "AxeAspectofYoungMelinoe", },
			},
			-- FirstLoot
			{
				Path = { "GameState", "TextLinesRecord", },
				HasAll = { "AphroditeFirstPickUp",},
			},
			{
				Path = { "GameState", "TextLinesRecord", },
				HasAll = { "AresFirstPickUp",},
			},
			--{
			--	Path = { "GameState", "TextLinesRecord", },
			--	HasAll = { "AphroditeFirstPickUp", "AresFirstPickUp", "HeraFirstPickUp",},
			--},
			--Keepsake
			{
				Path = { "GameState", "TraitsTaken", },
				HasAll = { "ReincarnationKeepsake", },
			},

			-- MetaUpgrades
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LowManaDamageBonus", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "BonusRarity", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "EpicRarityBoost", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LastStand", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "BonusHealth", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "HealthRegen", "Unlocked", },
			},
			{
				Path = { "GameState", "MetaUpgradeLimitLevel", },
				Comparison = ">=",
				Value = 5,
			},
		},
    },
})

bountyAPI.RegisterBounty({
    Id = _PLUGIN.guid .. "BountyYMSkull",
    Title = "Trial of the Goodboy",
    Description = "Use colorful ball to play fetch with the best boy in the underworld.",
    Difficulty = 4,
    IsStandardBounty = true,
    BiomeChar = "H",

    DataOverrides = function (RegisterValues)
        print("Overriding all the needed game tables for this challenge run...")
    end,
    SetupFunctions = function (BountyRunData, FromSave)
        if FromSave then
            print("Reacting to the data found in the persisted storage for this challenge run...")
        else
            print("Setting up the persisted data storage for this challenge run...")
        end
    end,
    RoomTransition = function (BountyRunData, RoomName)
        print("Room " .. RoomName .. " is being left. Choosing next room...")
    end,
    CanEnd = function (BountyRunData, RoomName)
        print("Determining whether this challenge run should end")
        return true
    end,
    EndFunctions = function (BountyRunData, Cleared)
        print("Challenge run is ending. Cleaning up...")
    end,

    BaseData = {
		InheritFrom = { "DefaultPackagedBounty", "BasePackageBountyBiomeI", },
        WeaponKitName = "WeaponLob",
		WeaponUpgradeName = "SkullAspectofYoungMelinoe",
		KeepsakeName = "DecayingBoostKeepsake",
		RemoveFamiliar = true,
		ForcedReward = "Mixer5CommonDrop",
		ForcedRewardRepeat = "MetaCurrencyDrop",
		
		RunOverrides =
		{
			MaxGodsPerRun = 4,
			LootTypeHistory =
			{
			DemeterUpgrade = 2,
			ZeusUpgrade = 1,
			HephaestusUpgrade = 2,
			},
		},
		RewardStoreOverrides =
		{
			RunProgress =
			{
				{
					Name = "StackUpgrade",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						NamedRequirements = { "StackUpgradeLegal", },
					},
				},
				{
					Name = "MaxHealthDrop",
				},
				{
					Name = "MaxManaDrop",
				},
				{
					Name = "WeaponUpgrade",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						NamedRequirements = { "HammerLootRequirements" },
					}
				},
				{
					Name = "Boon",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						-- None
					},
				},
			},
		},
        StartingTraits =
		{
			{ Name = "DemeterWeaponBoon", Rarity = "Heroic", },
			{ Name = "HephaestusSpecialBoon", Rarity = "Heroic", },
			{ Name = "ZeusSprintBoon", Rarity ="Heroic"},
			{ Name = "HephaestusManaBoon", Rarity = "Heroic", },

			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },

			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
		},

		MetaUpgradeStateEquipped =
		{
			"LowManaDamageBonus", --2
			"BonusRarity", --3
			"EpicRarityBoost", --5
			"LastStand", --4
			"BonusHealth", --2,
			"HealthRegen", --1
		},

        --ShrineUpgradesActive = --10 Fear total
		{
			EnemySpeedShrineUpgrade = 2,
			EnemyCountShrineUpgrade = 2,
			EnemyEliteShrineUpgrade = 2,
		},

        UnlockGameStateRequirements =
		{
			-- Biome and Shrine unlocks
			NamedRequirements = { "PackageBountyBiomeH", "ShrineUnlocked", },
			-- Bounty progress
			{
				Path = { "GameState", "PackagedBountyClears" },
				HasAny = { "PackageBountyChaosIntro", "PackageBountyOceanus", "PackageBountyStarter", },
			},
			-- Weapon
			{
				Path = { "GameState", "WeaponsUnlocked", },
				HasAll = { "WeaponLob", "SkullAspectofYoungMelinoe", },
			},
			-- FirstLoot
			{
				Path = { "GameState", "TextLinesRecord", },
				HasAll = { "HephaestusFirstPickUp",},
			},
			{
				Path = { "GameState", "TextLinesRecord", },
				HasAll = { "ZeusFirstPickUp",},
			},
			{
				Path = { "GameState", "TextLinesRecord", },
				HasAll = { "DemeterFirstPickUp",},
			},
			--Keepsake
			{
				Path = { "GameState", "TraitsTaken", },
				HasAll = { "DecayingBoostKeepsake", },
			},

			-- MetaUpgrades
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LowManaDamageBonus", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "BonusRarity", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "EpicRarityBoost", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LastStand", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "BonusHealth", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "HealthRegen", "Unlocked", },
			},
			{
				Path = { "GameState", "MetaUpgradeLimitLevel", },
				Comparison = ">=",
				Value = 5,
			},
		},
    },
})

bountyAPI.RegisterBounty({
    Id = _PLUGIN.guid .. "BountyYMSuit",
    Title = "Trial of Wings",
    Description = "Soar above the dark sea, riding on wings of metal. Overcome the winged terror awaiting at the base of the mountain.",
    Difficulty = 3,
    IsStandardBounty = true,
    BiomeChar = "O",

    DataOverrides = function (RegisterValues)
        print("Overriding all the needed game tables for this challenge run...")
    end,
    SetupFunctions = function (BountyRunData, FromSave)
        if FromSave then
            print("Reacting to the data found in the persisted storage for this challenge run...")
        else
            print("Setting up the persisted data storage for this challenge run...")
        end
    end,
    RoomTransition = function (BountyRunData, RoomName)
        print("Room " .. RoomName .. " is being left. Choosing next room...")
    end,
    CanEnd = function (BountyRunData, RoomName)
        print("Determining whether this challenge run should end")
        return true
    end,
    EndFunctions = function (BountyRunData, Cleared)
        print("Challenge run is ending. Cleaning up...")
    end,

    BaseData = {
		InheritFrom = { "DefaultPackagedBounty", "BasePackageBountyBiomeF", },
        WeaponKitName = "WeaponSuit",
		WeaponUpgradeName = "SuitAspectofYoungMelinoe",
		KeepsakeName = "TempHammerKeepsake",
		RemoveFamiliar = true,
		ForcedReward = "Mixer5CommonDrop",
		ForcedRewardRepeat = "MetaCurrencyDrop",

		RunOverrides =
		{
			MaxGodsPerRun = 4,
			LootTypeHistory =
			{
				PoseidonUpgrade = 1,
				ApolloUpgrade = 2,
			},
		},

        StartingTraits =
		{
			{ Name = "ApolloWeaponBoon", Rarity ="Epic"},
			{ Name = "PoseidonManaBoon", Rarity ="Epic"},
			{ Name = "DoubleRewardBoon", Rarity ="Epic"},
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
		},

		RunProgress =
			{
				{
					Name = "MaxHealthDropBig",
				},
				{
					Name = "MaxManaDrop",
				},
				{
					Name = "WeaponUpgrade",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						NamedRequirements = { "HammerLootRequirements" },
					}
				},
				{
					Name = "Boon",
					AllowDuplicates = true,
					GameStateRequirements =
					{
						-- None
					},
				},
				{
					Name = "StackUpgradeTriple",
					GameStateRequirements =
					{
						NamedRequirements = { "StackUpgradeLegal", },
					},
				},
			},

		MetaUpgradeStateEquipped =
		{
			"HealthRegen", --1
			"LowHealthBonus", --4
			"BonusHealth", --2,
		},

        ShrineUpgradesActive = --15 Fear total
		{
			EnemySpeedShrineUpgrade = 2,
			EnemyCountShrineUpgrade = 2,
			EnemyEliteShrineUpgrade = 2,
			BossDifficultyShrineUpgrade = 2,
		},

        UnlockGameStateRequirements =
		{
			-- Biome and Shrine unlocks
			NamedRequirements = { "PackageBountyBiomeO", "ShrineUnlocked", },
			-- Bounty progress
			{
				Path = { "GameState", "PackagedBountyClears" },
				HasAny = { "PackageBountyChaosIntro", "PackageBountyOceanus", "PackageBountyStarter", },
			},
			-- Weapon
			{
				Path = { "GameState", "WeaponsUnlocked", },
				HasAll = { "WeaponSuit", "SuitAspectofYoungMelinoe", },
			},
			-- FirstLoot
			{
				Path = { "GameState", "TextLinesRecord", },
				HasAll = { "PoseidonFirstPickUp", },
			},
			--Keepsake
			{
				Path = { "GameState", "TraitsTaken", },
				HasAll = { "TempHammerKeepsake", },
			},

			-- MetaUpgrades
			{
				PathTrue = { "GameState", "MetaUpgradeState", "HealthRegen", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LowHealthBonus", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "BonusHealth", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LastStand", "Unlocked", },
			},
			{
				Path = { "GameState", "MetaUpgradeLimitLevel", },
				Comparison = ">=",
				Value = 11,
			},
		},
    },
})