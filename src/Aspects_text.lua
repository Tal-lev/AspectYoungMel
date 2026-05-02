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

	table.insert(data.Texts, sjson.to_object(
		{
			Id = "DaggerDashAttackTripleTraitYoung",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Trick Knives",
			Description = "Your {$Keywords.DashStrike} also fires your {$Keywords.Special} {#UpgradeFormat}{$TooltipData.ExtractData.Count} {#Prev}times at once in a fan pattern."

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
			DisplayName = "Aspect of young Melinoë {#AltUpgradeFormat}{$TooltipData.AspectRarityText}",
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
			Id = "AxeAspectofYoungMelinoe",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "Aspect of young Melinoë",
			Description = "Replaces your {$Keywords.Special} with a Block."
		},
		TextOrder)
	)
	
	table.insert(data.Texts, sjson.to_object(
		{
			Id = "AxeAspectYoungMelStat",
			InheritFrom = "BaseBoonMultiline",
			DisplayName = "{!Icons.Bullet}{#PropertyFormat}Omega Special Damage:",
			Description = "{#UpgradeFormat}{$TooltipData.StatDisplay1}"
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
			DisplayName = "Aspect of young Melinoë {#AltUpgradeFormat}{$TooltipData.AspectRarityText}",
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
			DisplayName = "Aspect of young Melinoë {#AltUpgradeFormat}{$TooltipData.AspectRarityText}",
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

	return data
	end)