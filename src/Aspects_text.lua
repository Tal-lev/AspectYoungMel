--inserting Keywords
local newKeywords = {
	"AxeRetaliate",
	"Combo",
	"Special_Cast",
}
game.ConcatTableValuesIPairs(game.KeywordList, newKeywords)

--Inserts text
	local TextOrder = {
    "Id",
    "InheritFrom",
    "DisplayName",
    "Description",
	"OverwriteLocalization",
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
		Id = "SkullAspectYoungMelStat",
		InheritFrom = "BaseStatLine",
		DisplayName = "{!Icons.Bullet}{#PropertyFormat}Combo Stack Damage:",
		Description = "{#UpgradeFormat}+{$TooltipData.ExtractData.ComboMultiplier}%"

	},
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "StaffDoubleHealTraitYM",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Tasty Vigor",
			Description = "Doubles your {$Keywords.SpecialEX} healing and increases its {$Keywords.Mana} cost by {$TooltipData.ExtractData.ManaCostAdded}",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "StaffSpecialHomingTraitYM",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Homing Bolt",
			Description = "Your {$Keywords.Special} has improved homing and range.",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "AxeShieldDeflectTraitYM",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Mirror Shield",
			Description = "Your {$Keywords.Special} can {$Keywords.Deflect}"
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "DaggerDashAttackTripleTraitYM",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Wooden Trick Knives",
			Description = "Your {$Keywords.DashStrike} also fires your {$Keywords.Special} {#UpgradeFormat}{$TooltipData.ExtractData.Count} {#Prev}times at once in a fan pattern."

		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "LobExtendComboTraitYM",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Game On",
			Description = "Your {$Keywords.Combo} takes longer to reset."

		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "LobComboScalingTraitYM",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Ultimate Combo",
			Description = "Increased damage scaling at high {$Keywords.Combo}."

		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "ReflectiveCastTraitYM",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Reflective Cast",
			Description = "Your {$Keywords.Special_Cast} is reflected from behind."

		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "AspectDashRechargeStatDisplay",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "{!Icons.Bullet}{#PropertyFormat}Dash Recovery Speed:",
			Description = "{#UpgradeFormat}{$TooltipData.StatDisplay1}"

		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "DaggerAspectofYoungMelinoe",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of Trainee Melinoë",
			Description = "You can {$Keywords.Dash} more frequently."
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "DaggerAspectofYoungMelinoe_Shop",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Lim and Oros, Aspect of Trainee Melinoë:",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "DaggerAspectofYoungMelinoe_Upgrade",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of Trainee Melinoë {$TooltipData.AspectRarityText}",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "DaggerAspectofYoungMelinoe_FlavorText",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Precision has to be learned and wood is a kinder teacher than steel.",
		},
		TextOrder)
	)
	
	table.insert(data.Texts, sjson.to_object(
		{
			Id = "Combo",
			DisplayName = "Combo",
			Description = "Stacking buff that increases {$Keywords.Attack} and {$Keywords.Special} damage. lost when failing to retrieve {$Keywords.Shells}",
		},
		TextOrder)
	)
	
	table.insert(data.Texts, sjson.to_object(
		{
			Id = "AxeRetaliate",
			DisplayName = "Retaliate",
			Description = "Temporarily increases {$Keywords.Attack} damage.",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "Special_Cast",
			DisplayName = "Special-Cast",
			Description = "Your {$Keywords.Special} creates an additional {$Keywords.Cast}.",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "TorchAspectofYoungMelinoe",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of Mischievous Melinoë",
			Description = "Your {$Keywords.Special} fires a {$Keywords.Special_Cast}."
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "TorchAspectofYoungMelinoe_Shop",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Umbral Flames, Aspect of Mischievous Melinoë:",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "TorchAspectofYoungMelinoe_Upgrade",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of Mischievous Melinoë {$TooltipData.AspectRarityText}",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
		Id = "TorchAspectofYoungMelinoe_FlavorText",
		InheritFrom = "BaseBoonMultiline",
		DisplayName = "Stop flinging your juice around the crossroads.",
	},
	TextOrder)
	)

	

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "TorchAspectYoungMelStat",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "{!Icons.Bullet}{#PropertyFormat}Olympian Bonus Damage:",
			Description = "{#UpgradeFormat}+{$TooltipData.ExtractData.OlympicBoonsYM}%"
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "AxeAspectofYoungMelinoe",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Axpect of young Melinoë",
			Description = "Your {$Keywords.Special} Block grants {$Keywords.AxeRetaliate}."
		},
		TextOrder)
	)
	
	table.insert(data.Texts, sjson.to_object(
		{
			Id = "AxeAspectYoungMelStat",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "{!Icons.Bullet}{#PropertyFormat}Retaliate Damage:",
			Description = "{#UpgradeFormat}+{$TooltipData.ExtractData.RetaliateDamage}%"
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "AxeAspectofYoungMelinoe_Shop",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Moonstone Axe, Axpect of Young Melinoë:",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "AxeAspectofYoungMelinoe_Upgrade",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Axpect of young Melinoë {$TooltipData.AspectRarityText}",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "AxeAspectofYoungMelinoe_FlavorText",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "One day its blade could even split the light of the Moon, once its wielder is tall enough to lift it.",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "StaffAspectofYoungMelinoe",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of Sweet-Tooth Melinoë",
			Description = "While you have no more than {#UpgradeFormat}{$TooltipData.ExtractData.HealthThreshold}%{!Icons.Health}{#Prev}, absorb your {$Keywords.SpecialEX} blast to restore {#BoldFormatGraft}{$TooltipData.ExtractData.HealAmount}{!Icons.Health}{#Prev}."
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "StaffAspectofYoungMelinoe_Shop",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Witch's Staff, Aspect of Sweet-Tooth Melinoë:",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "StaffAspectofYoungMelinoe_Upgrade",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of Sweet-Tooth Melinoë {$TooltipData.AspectRarityText}",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "StaffAspectofYoungMelinoe_FlavorText",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "A waxing crescent moon; the promise of power, if one could get it out of her mouth."
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "SkullAspectofYoungMelinoe",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of Playful Melinoë",
			Description = "Consecutive {$Keywords.Attack} grants {$Keywords.Combo}."
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "SkullAspectofYoungMelinoe_Shop",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Argent Skull, Aspect of Playful Melinoë:",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "SkullAspectofYoungMelinoe_Upgrade",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of Playful Melinoë {$TooltipData.AspectRarityText}",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "SkullAspectofYoungMelinoe_FlavorText",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "The will of Night is never to be chronicled, but rarely, on moonless nights, it is dodgeball."
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "UI_ComboStacks",
			DisplayName = "{$CurrentRun.Hero.TraitDictionary['SkullAspectofYoungMelinoe'][1].Combo}",
      		OverwriteLocalization = true,
		},
		TextOrder)
	)

	--Torch boons
	table.insert(data.Texts, sjson.to_object(
	{
      Id = "ZeusCastBoonYM",
      InheritFrom = "BaseBoonMultiline",
      DisplayName = "Special Storm Ring",
      Description = "Your {$Keywords.Special_Cast} cause lightning bolts to repeatedly strike {#BoldFormatGraft}1 {#Prev}foe at a time in the binding circle.",
    },
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "HeraCastBoonYM",
      InheritFrom = "BaseBoonMultiline",
      DisplayName = "Special Engagement Ring",
      Description = "Your {$Keywords.Special_Cast} inflict {$Keywords.Link} and immediately deal damage based on foes in the binding circle.",
    },
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "PoseidonCastBoonYM",
      InheritFrom = "BaseBoonMultiline",
      DisplayName = "Special Tidal Ring",
      Description = "Your {$Keywords.Special_Cast} also immediately hit foes with a powerful splash that inflicts {$Keywords.KnockbackAmplify}.",
    },
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "DemeterCastBoonYM",
      InheritFrom = "BaseBoonMultiline",
      DisplayName = "Special Arctic Ring",
      Description = "Your {$Keywords.Special_Cast} inflict {$Keywords.Root} and repeatedly deal damage to foes in the binding circle.",
    },
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "ApolloCastBoonYM",
      InheritFrom = "BaseBoonMultiline",
      DisplayName = "Special Solar Ring",
      Description = "Your {$Keywords.Special_Cast} inflict {$Keywords.Blind}, and deal a burst of damage before they expire.",
    },
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "AphroditeCastBoonYM",
      InheritFrom = "BaseBoonMultiline",
      DisplayName = "Special Rapture Ring",
      Description = "Your {$Keywords.Special_Cast} inflict {$Keywords.Weak}, and damage foes while dragging them toward the center.",
    },
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "HephaestusCastBoonYM",
      InheritFrom = "BaseBoonMultiline",
      DisplayName = "Special Anvil Ring",
      Description = "Your {$Keywords.Special_Cast} deal damage {$TooltipData.ExtractData.Detonations} times in succession to foes in the binding circle.",
    },
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "HestiaCastBoonYM",
      InheritFrom = "BaseBoonMultiline",
      DisplayName = "Special Smolder Ring",
      Description = "Your {$Keywords.Special_Cast} repeatedly inflict {$Keywords.Burn} on foes in the binding circle.",
    },
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "AresCastBoonYM",
      InheritFrom = "BaseBoonMultiline",
      DisplayName = "Special Sword Ring" ,
      Description = "Your {$Keywords.Special_Cast} create a falling blade over each foe in the binding circle."
    },
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "SpawnCastDamageBoonYM",
      InheritFrom = "BaseBoonMultiline",
      DisplayName = "Special Rousing Reception",
      Description = "Your {$Keywords.Special_Cast} damage any foes as they join the {$Keywords.EncounterAlt}, wherever they appear.",
    },
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "CastNovaBoonYM",
      InheritFrom = "BaseBoonMultiline",
      DisplayName = "Special Arctic Gale",
      Description = "Your {$Keywords.Special_Cast} also create a {$Keywords.SlowField} around the binding circle.",
    },
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "ApolloManaBoonYM",
      DisplayName = "Special Lucid Gain",
      Description = "Whenever your {$Keywords.Special_Cast} expire, restore {!Icons.Mana}.",
    },
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "BurnSprintBoonYM",
      InheritFrom = "BaseBoonMultiline",
      DisplayName = "Special Fire Away",
      Description = "Your {$Keywords.Special_Cast} destroy many foes' ranged shots, and inflict {$Keywords.Burn} on the attacking foes.",
    },
	TextOrder)
	)


	--Quests
	table.insert(data.Texts, sjson.to_object(
	{
      Id = "Quest_YM_Chronos_aspects",
      DisplayName = "Bearing Youthful Gifts",
      Description = "The daughter of the god of the dead shall prevail against either of her ultimate adversaries using each and every {#Emph}Aspect {#Prev}of her {#Emph}Youth {#Prev}."
	},
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "Quest_YM_LargeHealRun",
      DisplayName = "Mender of Health",
      Description = "The daughter of the god of the dead shall some evening {#Emph}regain {#Prev} her {#Emph}vigor {#Prev} as she did in her {#Emph}Youth {#Prev}.",
	},
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "LargeHealRun",
      DisplayName = "Heal 500 Health with the aspect of Sweet-Tooth Melinoë",
	},
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "Quest_YM_HighCombo",
      DisplayName = "Catcher of Balls",
      Description = "The daughter of the god of the dead shall some evening catch the ball each and every time."
	},
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "High_Combo",
      DisplayName = "Reach 50 Combo with the aspect of Playful Melinoë",
	},
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "Quest_YM_MaxWeaponUpgrade",
      DisplayName = "Awakened Aspects of Youth",
      Description = "The daughter of the god of the dead shall fully upgrade {#Emph}all {#Prev}of the {#Emph}Aspects {#Prev}of her {#Emph}Youth{#Prev}.",
    },
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "StaffAspectofYoungMelinoe5",
      DisplayName = "Raise Aspect of Sweet-Tooth Melinoë to {#LegendaryFormat}Rank V",
	},
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "DaggerAspectofYoungMelinoe5",
      DisplayName = "Raise Aspect of Trainee Melinoë to {#LegendaryFormat}Rank V",
	},
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "TorchAspectofYoungMelinoe5",
      DisplayName = "Raise Aspect of Mischievous Melinoë to {#LegendaryFormat}Rank V",
	},
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "AxeAspectofYoungMelinoe5",
      DisplayName = "Raise Axpect of young Melinoë to {#LegendaryFormat}Rank V",
	},
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "SkullAspectofYoungMelinoe5",
      DisplayName = "Raise Aspect of Playful Melinoë to {#LegendaryFormat}Rank V",
	},
	TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
	{
      Id = "Quest_YM_HammerUpgrades",
      DisplayName = "Hammers of Youth",
      Description = "The daughter of the god of the dead shall apply various {#Emph}Daedalus {#Prev}enchantments to the {#Emph}Aspects {#Prev}of her {#Emph}Youth {#Prev}.",
	},
	TextOrder)
	)
	
	

	
	return data
	end)