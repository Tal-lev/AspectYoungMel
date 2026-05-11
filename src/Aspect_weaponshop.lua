-- Staff Aspect of young Mel
OverwriteTableKeys(WeaponShopItemData, { 
		StaffAspectofYoungMelinoe = {

            WeaponName = "WeaponStaffSwing",
			HideAfterPurchased = true,
			IconScale = 0.8,
			UnlockTextId = "WeaponShopAspectUnlock",
			Cost =
			{
				PlantIShaderot = 5,
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
				BreakIfPlayed = true,
				PreLineWait = 0.65,
				ObjectType = "NPC_Skelly_01",
				TriggerCooldowns = { "SkellyAnyQuipSpeech" },

				{ Cue = "/VO/Skelly_0350", Text = "A witch most-powerful!" },
			},
            }   
        },
        StaffAspectofYoungMelinoe2 =
	    {
		WeaponName = "WeaponStaffSwing",
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "StaffAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 1,
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "StaffAspectofYoungMelinoe" }
			},
		},
		PreRevealGlobalVoiceLines = "StaffAspectUpgradedVoiceLines",
	    },
        StaffAspectofYoungMelinoe3 =
        {
            WeaponName = "StaffAspectofYoungMelinoe",
            IconScale = 0.8,
            Graphic = "WeaponArt05",
            TraitUpgrade = "StaffAspectofYoungMelinoe",
            InheritFrom = { "BaseWeaponUpgrade", },
            Cost =
            {
                WeaponPointsRare = 1,
            },
            GameStateRequirements =
            {
                {
                    PathTrue = { "GameState", "WeaponsUnlocked", "StaffAspectofYoungMelinoe2" }
                }
            },
            PreRevealGlobalVoiceLines = "StaffAspectUpgradedVoiceLines",
        },
        StaffAspectofYoungMelinoe4 =
        {
            WeaponName = "WeaponStaffSwing",
            IconScale = 0.8,
            Graphic = "WeaponArt05",
            TraitUpgrade = "StaffAspectofYoungMelinoe",
            InheritFrom = { "BaseWeaponUpgrade", },
            Cost =
            {
                WeaponPointsRare = 1,
            },
            GameStateRequirements =
            {
                {
                    PathTrue = { "GameState", "WeaponsUnlocked", "StaffAspectofYoungMelinoe3" }
                }
            },
            PreRevealGlobalVoiceLines = "StaffAspectUpgradedVoiceLines",
        },
        StaffAspectofYoungMelinoe5 =
        {
            WeaponName = "WeaponStaffSwing",
            HideAfterPurchased = false,
            IconScale = 0.8,
            Graphic = "WeaponArt05",
            TraitUpgrade = "StaffAspectofYoungMelinoe",
            InheritFrom = { "BaseWeaponUpgrade", },
            Cost =
            {
                WeaponPointsRare = 2,
            },
            GameStateRequirements =
            {
                {
                    PathTrue = { "GameState", "WeaponsUnlocked", "StaffAspectofYoungMelinoe4" }
                }
            },
            PreRevealVoiceLines =
            {
                TriggerCooldowns = { "MelinoeMiscWeaponEquipSpeech" },
                { GlobalVoiceLines = "SkellyWeaponMaxUpgradeReactionVoiceLines" },
                { GlobalVoiceLines = "SkellyWeaponUpgradeReactionVoiceLines" },
            },
        },
    })

	-- Adding Staff aspect into Weapon shop
    table.insert( ScreenData.WeaponShop.ItemCategories[2], "StaffAspectofYoungMelinoe")
	table.insert( ScreenData.WeaponShop.ItemCategories[2], "StaffAspectofYoungMelinoe2")
	table.insert( ScreenData.WeaponShop.ItemCategories[2], "StaffAspectofYoungMelinoe3")
	table.insert( ScreenData.WeaponShop.ItemCategories[2], "StaffAspectofYoungMelinoe4")
	table.insert( ScreenData.WeaponShop.ItemCategories[2], "StaffAspectofYoungMelinoe5")
	
	-- Adding Staff aspect into aspect selection shop
    table.insert( ScreenData.WeaponUpgradeScreen.DisplayOrder.WeaponStaffSwing, 2 , "StaffAspectofYoungMelinoe" )
    
-- Dagger Aspect of young Mel
OverwriteTableKeys(WeaponShopItemData, { 
		DaggerAspectofYoungMelinoe = {
	
			WeaponName = "WeaponDagger",
			HideAfterPurchased = true,
			IconScale = 0.8,
			UnlockTextId = "WeaponShopAspectUnlock",
			Cost =
			{
				PlantODriftwood = 3,
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
					BreakIfPlayed = true,
					PreLineWait = 0.65,
					ObjectType = "NPC_Skelly_01",
					TriggerCooldowns = { "SkellyAnyQuipSpeech" },

					{ Cue = "/VO/Skelly_0196", Text = "She knows her blades!" },
				},
			},
		},
		DaggerAspectofYoungMelinoe2 =
		{
		WeaponName = "WeaponDagger",
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "DaggerAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 1,
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "DaggerAspectofYoungMelinoe" }
			}
		},
		PreRevealGlobalVoiceLines = "DaggerAspectUpgradedVoiceLines",
	},
	DaggerAspectofYoungMelinoe3 =
	{
		WeaponName = "WeaponDagger",
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "DaggerAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 1,
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "DaggerAspectofYoungMelinoe2" }
			}
		},
		PreRevealGlobalVoiceLines = "DaggerAspectUpgradedVoiceLines",
	},
	DaggerAspectofYoungMelinoe4 =
	{
		WeaponName = "WeaponDagger",
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "DaggerAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 1,
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "DaggerAspectofYoungMelinoe3" }
			}
		},
		PreRevealGlobalVoiceLines = "DaggerAspectUpgradedVoiceLines",
	},
	DaggerAspectofYoungMelinoe5 =
	{
		WeaponName = "WeaponDagger",
		HideAfterPurchased = false,
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "DaggerAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 2,
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "DaggerAspectofYoungMelinoe4" }
			}
		},
		PreRevealVoiceLines =
		{
			TriggerCooldowns = { "MelinoeMiscWeaponEquipSpeech" },
			{ GlobalVoiceLines = "SkellyWeaponMaxUpgradeReactionVoiceLines" },
			{ GlobalVoiceLines = "SkellyWeaponUpgradeReactionVoiceLines" },
		},
	}
	})
	--Adding Dagger Aspect to weapon shop
	table.insert( ScreenData.WeaponShop.ItemCategories[3], "DaggerAspectofYoungMelinoe")
	table.insert( ScreenData.WeaponShop.ItemCategories[3], "DaggerAspectofYoungMelinoe2")
	table.insert( ScreenData.WeaponShop.ItemCategories[3], "DaggerAspectofYoungMelinoe3")
	table.insert( ScreenData.WeaponShop.ItemCategories[3], "DaggerAspectofYoungMelinoe4")
	table.insert( ScreenData.WeaponShop.ItemCategories[3], "DaggerAspectofYoungMelinoe5")
	--Adding Dagger aspect to weapon selection
	table.insert( ScreenData.WeaponUpgradeScreen.DisplayOrder.WeaponDagger, 2 , "DaggerAspectofYoungMelinoe" )

-- Axe Aspect of young Mel

OverwriteTableKeys(WeaponShopItemData, {
    AxeAspectofYoungMelinoe =
	{
		WeaponName = "WeaponAxe",
		HideAfterPurchased = true,
		IconScale = 0.8,
		UnlockTextId = "WeaponShopAspectUnlock",
		Cost =
		{
			OreFSilver = 5,
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
				BreakIfPlayed = true,
				PreLineWait = 0.65,
				ObjectType = "NPC_Skelly_01",
				PreLineAnim = "Skelly_Babbling",
				TriggerCooldowns = { "SkellyAnyQuipSpeech" },
				{ Cue = "/VO/Skelly_0346", Text = "Wait, {#Emph}who?!" },
			},
		},
	},
    AxeAspectofYoungMelinoe2 =
	{
		WeaponName = "WeaponAxe",
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "AxeAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 1,
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "AxeAspectofYoungMelinoe" }
			}
		},
		PreRevealGlobalVoiceLines = "AxeAspectUpgradedVoiceLines",
	},
	AxeAspectofYoungMelinoe3 =
	{
		WeaponName = "WeaponAxe",
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "AxeAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 1,
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "AxeAspectofYoungMelinoe2" }
			}
		},
		PreRevealGlobalVoiceLines = "AxeAspectUpgradedVoiceLines",
	},
	AxeAspectofYoungMelinoe4 =
	{
		WeaponName = "WeaponAxe",
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "AxeAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 1,
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "AxeAspectofYoungMelinoe3" }
			}
		},
		PreRevealGlobalVoiceLines = "AxeAspectUpgradedVoiceLines",
	},
	AxeAspectofYoungMelinoe5 =
	{
		WeaponName = "WeaponAxe",
		HideAfterPurchased = false,
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "AxeAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 2,
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "AxeAspectofYoungMelinoe4" }
			}
		},
		PreRevealVoiceLines =
		{
			TriggerCooldowns = { "MelinoeMiscWeaponEquipSpeech" },
			{ GlobalVoiceLines = "SkellyWeaponMaxUpgradeReactionVoiceLines" },
			{ GlobalVoiceLines = "SkellyWeaponUpgradeReactionVoiceLines" },
		},
	},
})
	--Adding Axe aspect to weapon shop
    table.insert( ScreenData.WeaponShop.ItemCategories[5], "AxeAspectofYoungMelinoe")
	table.insert( ScreenData.WeaponShop.ItemCategories[5], "AxeAspectofYoungMelinoe2")
	table.insert( ScreenData.WeaponShop.ItemCategories[5], "AxeAspectofYoungMelinoe3")
	table.insert( ScreenData.WeaponShop.ItemCategories[5], "AxeAspectofYoungMelinoe4")
	table.insert( ScreenData.WeaponShop.ItemCategories[5], "AxeAspectofYoungMelinoe5")
	
	--Adding Axe aspect to weapon selection
	table.insert( ScreenData.WeaponUpgradeScreen.DisplayOrder.WeaponAxe, 2 , "AxeAspectofYoungMelinoe" )

-- Torch Aspect of young Mel

OverwriteTableKeys(WeaponShopItemData, {
	TorchAspectofYoungMelinoe =
	{
		WeaponName = "WeaponTorch",
		HideAfterPurchased = true,
		IconScale = 0.8,
		UnlockTextId = "WeaponShopAspectUnlock",
		Cost =
		{
			OreNBronze = 1,
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
				BreakIfPlayed = true,
				PreLineWait = 0.65,
				ObjectType = "NPC_Skelly_01",
				TriggerCooldowns = { "SkellyAnyQuipSpeech" },

				{ Cue = "/VO/Skelly_0348", Text = "I shoulda known!" },
			},
		},
	},
	TorchAspectofYoungMelinoe2 =
	{
		WeaponName = "WeaponTorch",
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "TorchAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 1,
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "TorchAspectofYoungMelinoe" },
			}
		},
		PreRevealGlobalVoiceLines = "TorchAspectUpgradedVoiceLines",
	},
	TorchAspectofYoungMelinoe3 =
	{
		WeaponName = "WeaponTorch",
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "TorchAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 1,
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "TorchAspectofYoungMelinoe2" },
			}
		},
		PreRevealGlobalVoiceLines = "TorchAspectUpgradedVoiceLines",
	},
	TorchAspectofYoungMelinoe4 =
	{
		WeaponName = "WeaponTorch",
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "TorchAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 1,
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "TorchAspectofYoungMelinoe3" },
			}
		},
		PreRevealGlobalVoiceLines = "TorchAspectUpgradedVoiceLines",
	},
	TorchAspectofYoungMelinoe5 =
	{
		WeaponName = "WeaponTorch",
		HideAfterPurchased = false,
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "TorchAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 2,
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "TorchAspectofYoungMelinoe4" },
			}
		},
		PreRevealVoiceLines =
		{
			TriggerCooldowns = { "MelinoeMiscWeaponEquipSpeech" },
			{
				PreLineWait = 0.25,
				UsePlayerSource = true,

				{ Cue = "/VO/Melinoe_3585", Text = "Ygnium, we're forged together in flame." },
			},
			{ GlobalVoiceLines = "SkellyWeaponMaxUpgradeReactionVoiceLines" },
			{ GlobalVoiceLines = "SkellyWeaponUpgradeReactionVoiceLines" },
		},
	},
})
	--Adding Torch aspect to weapon shop
    table.insert( ScreenData.WeaponShop.ItemCategories[4], "TorchAspectofYoungMelinoe")
	table.insert( ScreenData.WeaponShop.ItemCategories[4], "TorchAspectofYoungMelinoe2")
	table.insert( ScreenData.WeaponShop.ItemCategories[4], "TorchAspectofYoungMelinoe3")
	table.insert( ScreenData.WeaponShop.ItemCategories[4], "TorchAspectofYoungMelinoe4")
	table.insert( ScreenData.WeaponShop.ItemCategories[4], "TorchAspectofYoungMelinoe5")
	
	--Adding Torch aspect to weapon selection
	table.insert( ScreenData.WeaponUpgradeScreen.DisplayOrder.WeaponTorch, 2 , "TorchAspectofYoungMelinoe" )

-- Skull Aspect of young Mel

OverwriteTableKeys(WeaponShopItemData, {
    SkullAspectofYoungMelinoe =
	{
		WeaponName = "WeaponLob",
		HideAfterPurchased = true,
		IconScale = 0.8,
		UnlockTextId = "WeaponShopAspectUnlock",
		Cost =
		{
			PlantFNightshade =2,
			PlantIPoppy = 2,

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
				BreakIfPlayed = true,
				PreLineWait = 0.65,
				ObjectType = "NPC_Skelly_01",
				PreLineAnim = "Skelly_Babbling",
				TriggerCooldowns = { "SkellyAnyQuipSpeech" },
				{ Cue = "/VO/Skelly_0193", Text = "Oh she's a scary one!" },
			},
		},
	},
    SkullAspectofYoungMelinoe2 =
	{
		WeaponName = "WeaponLob",
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "SkullAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 1
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "SkullAspectofYoungMelinoe" }
			}
		},
		PreRevealGlobalVoiceLines = "LobAspectUpgradedVoiceLines",
	},
	SkullAspectofYoungMelinoe3 =
	{
		WeaponName = "WeaponLob",
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "SkullAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 1
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "SkullAspectofYoungMelinoe2" },
			}
		},
		PreRevealGlobalVoiceLines = "LobAspectUpgradedVoiceLines",
	},
	SkullAspectofYoungMelinoe4 =
	{
		WeaponName = "WeaponLob",
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "SkullAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 1
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "SkullAspectofYoungMelinoe3" },
			}
		},
		PreRevealGlobalVoiceLines = "LobAspectUpgradedVoiceLines",
	},
	SkullAspectofYoungMelinoe5 =
	{
		WeaponName = "WeaponLob",
		HideAfterPurchased = false,
		IconScale = 0.8,
		Graphic = "WeaponArt05",
		TraitUpgrade = "SkullAspectofYoungMelinoe",
		InheritFrom = { "BaseWeaponUpgrade", },
		Cost =
		{
			WeaponPointsRare = 2
		},
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WeaponsUnlocked", "SkullAspectofYoungMelinoe4" },
			}
		},
		PreRevealVoiceLines =
		{
			TriggerCooldowns = { "MelinoeMiscWeaponEquipSpeech" },
			{
				PreLineWait = 0.35,
				UsePlayerSource = true,

				{ Cue = "/VO/Melinoe_3588", Text = "Revaal, I see what you see now." },
			},
			{ GlobalVoiceLines = "SkellyWeaponMaxUpgradeReactionVoiceLines" },
			{ GlobalVoiceLines = "SkellyWeaponUpgradeReactionVoiceLines" },
		},
	},
})
	--Adding Skull aspect to weapon shop
    table.insert( ScreenData.WeaponShop.ItemCategories[6], "SkullAspectofYoungMelinoe")
	table.insert( ScreenData.WeaponShop.ItemCategories[6], "SkullAspectofYoungMelinoe2")
	table.insert( ScreenData.WeaponShop.ItemCategories[6], "SkullAspectofYoungMelinoe3")
	table.insert( ScreenData.WeaponShop.ItemCategories[6], "SkullAspectofYoungMelinoe4")
	table.insert( ScreenData.WeaponShop.ItemCategories[6], "SkullAspectofYoungMelinoe5")
	
	--Adding Skull aspect to weapon selection
	table.insert( ScreenData.WeaponUpgradeScreen.DisplayOrder.WeaponLob, 2 , "SkullAspectofYoungMelinoe" )