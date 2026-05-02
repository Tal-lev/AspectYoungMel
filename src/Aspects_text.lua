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
			text.DisplayName = "Aspect of young Melinoë"
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
			text.DisplayName = "Aspect of young Melinoë"
			text.Description = "You can {$Keywords.Dash} more frequently."
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