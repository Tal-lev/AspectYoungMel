---@module 'game'
game = rom.game

---@diagnostic disable-next-line: undefined-global
local mods = rom.mods

---@module "Siuhnexus-BountyAPI"
bountyAPI = mods["Siuhnexus-BountyAPI"]

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

		--ForcedRewards =
		--{
		--},

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
			{ Name = "HermesWeaponBoon", Rarity ="Rare"},
			{ Name = "SorcerySpeedBoon", Rarity = "Rare", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
		},

		--RewardStoreOverrides = {
		--	HubRewards =
		--	{
		--		{
		--			Name = "MaxHealthDropBig",
		--		},
		--		{
		--			Name = "WeaponUpgrade",
		--			AllowDuplicates = true,
		--			GameStateRequirements =
		--			{
		--				-- None
		--			},
		--		},
		--	},
		--
		--	SubRoomRewards =
		--	{
		--		{
		--			Name = "TalentDrop",
		--			GameStateRequirements =
		--			{
		--				NamedRequirements = { "TalentLegal", },
		--			},
		--		},
		--		{
		--			Name = "MaxHealthDrop",
		--			GameStateRequirements =
		--			{
		--				NamedRequirementsFalse = { "TalentLegal", },
		--			},
		--		},
		--	},
		--	SubRoomRewardsHard =
		--	{
		--		{
		--			Name = "TalentDrop",
		--			GameStateRequirements =
		--			{
		--				NamedRequirements = { "TalentLegal", },
		--			},
		--		},
		--		{
		--			Name = "MaxHealthDrop",
		--			GameStateRequirements =
		--			{
		--				NamedRequirementsFalse = { "TalentLegal", },
		--			},
		--		},
		--	},
		--},

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
			NextBiomeEnemyShrineUpgrade = 2,
			EnemyEliteShrineUpgrade = 1,
			BossDifficultyShrineUpgrade = 1,
		},

        UnlockGameStateRequirements =
		{
			-- Biome and Shrine unlocks
			NamedRequirements = { "PackageBountyBiomeN", "ShrineUnlocked", },
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

		--ForcedRewards =
		--{
		--},

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

		--RewardStoreOverrides = {
		--	HubRewards =
		--	{
		--		{
		--			Name = "MaxHealthDropBig",
		--		},
		--		{
		--			Name = "WeaponUpgrade",
		--			AllowDuplicates = true,
		--			GameStateRequirements =
		--			{
		--				-- None
		--			},
		--		},
		--	},
		--
		--	SubRoomRewards =
		--	{
		--		{
		--			Name = "TalentDrop",
		--			GameStateRequirements =
		--			{
		--				NamedRequirements = { "TalentLegal", },
		--			},
		--		},
		--		{
		--			Name = "MaxHealthDrop",
		--			GameStateRequirements =
		--			{
		--				NamedRequirementsFalse = { "TalentLegal", },
		--			},
		--		},
		--	},
		--	SubRoomRewardsHard =
		--	{
		--		{
		--			Name = "TalentDrop",
		--			GameStateRequirements =
		--			{
		--				NamedRequirements = { "TalentLegal", },
		--			},
		--		},
		--		{
		--			Name = "MaxHealthDrop",
		--			GameStateRequirements =
		--			{
		--				NamedRequirementsFalse = { "TalentLegal", },
		--			},
		--		},
		--	},
		--},

		MetaUpgradeStateEquipped =
		{
			"HealthRegen", --1
			"LowHealthBonus", --4
			"BonusHealth", --2,
			"LastStand", --4
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

			-- MetaUpgrades
			{
				Path = { "GameState", "MetaUpgradeLimitLevel", },
				Comparison = ">=",
				Value = 11,
			},
		},
    },
})