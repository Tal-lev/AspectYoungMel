--inserting Keywords
local newKeywords = {
	"AxeRetaliate",
	"Combo",
}
game.ConcatTableValuesIPairs(game.KeywordList, newKeywords)

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
		Id = "SkullAspectYoungMelStat",
		InheritFrom = "BaseStatLine",
		DisplayName = "{!Icons.Bullet}{#PropertyFormat}Combo Stack Damage:",
		Description = "{#UpgradeFormat}+{$TooltipData.ExtractData.ComboMultiplier}%"

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

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "DaggerDashAttackTripleTraitYoung",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Wooden Trick Knives",
			Description = "Your {$Keywords.DashStrike} also fires your {$Keywords.Special} {#UpgradeFormat}{$TooltipData.ExtractData.Count} {#Prev}times at once in a fan pattern."

		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "LobExtendComboTrait",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Game On",
			Description = "Your {$Keywords.Combo} takes longer to reset."

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
			DisplayName = "Aspect of young Melinoë",
			Description = "You can {$Keywords.Dash} more frequently."
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "DaggerAspectofYoungMelinoe_Shop",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Lim and Oros, Aspect of Young Melinoë:",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "DaggerAspectofYoungMelinoe_Upgrade",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of young Melinoë {$TooltipData.AspectRarityText}",
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
			Id = "AxeAspectofYoungMelinoe",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of young Melinoë",
			Description = "{$Keywords.Special} Block grants {$Keywords.AxeRetaliate}."
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
			DisplayName = "Moonstone Axe, Aspect of Young Melinoë:",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "AxeAspectofYoungMelinoe_Upgrade",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of young Melinoë {$TooltipData.AspectRarityText}",
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
			DisplayName = "Aspect of young Melinoë",
			Description = "While you have no more than {#UpgradeFormat}{$TooltipData.ExtractData.HealthThreshold}%{!Icons.Health}{#Prev}, absorb your {$Keywords.SpecialEX} blast to restore {#BoldFormatGraft}{$TooltipData.ExtractData.HealAmount}{!Icons.Health}{#Prev}."
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "StaffAspectofYoungMelinoe_Shop",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Witch's Staff, Aspect of Young Melinoë:",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "StaffAspectofYoungMelinoe_Upgrade",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of young Melinoë {$TooltipData.AspectRarityText}",
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
			DisplayName = "Aspect of young Melinoë",
			Description = "Consecutive {$Keywords.Attack} grants {$Keywords.Combo}."
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "SkullAspectofYoungMelinoe_Shop",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Argent Skull, Aspect of Young Melinoë:",
		},
		TextOrder)
	)

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "SkullAspectofYoungMelinoe_Upgrade",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of young Melinoë {$TooltipData.AspectRarityText}",
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

	return data
	end)