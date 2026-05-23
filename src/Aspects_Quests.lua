local ZagreusJourney = rom.mods["NikkelM-Zagreus-Journey"]

--local newQuestOrderData = {
	-- key / mission-critical
	--"YM_MaxAspect",
--    "YM_Chronos_aspects",
    --"YM_UnrivaledTyphon_Staff",
    --"YM_UnrivaledTyphon_Dagger",
    --"YM_UnrivaledTyphon_Torch",
    --"YM_UnrivaledTyphon_Axe",
    --"YM_UnrivaledTyphon_Skull",
    --"YM_HighCombo",
    --"YM_Cerberus_Ball",
    --"YM_Zagreus_Ball",
    --"YM_Block_Scylla",

--}

--if ZagreusJourney then
--	local insertIndex = nil
--	for index, questKey in ipairs(newQuestOrderData) do
--		if questKey == "YM_Block_Scylla" then
--			insertIndex = index + 1
--			break
--		end
--	end
--	if insertIndex then
--		table.insert(newQuestOrderData, insertIndex, "YM_Block_Hades_Laser")
--	end
--end

--game.ConcatTableValuesIPairs(game.QuestOrderData, newQuestOrderData)

table.insert( QuestOrderData, "Quest_YM_Chronos_aspects")
table.insert( QuestOrderData, "Quest_YM_MaxWeaponUpgrade")
table.insert( QuestOrderData, "Quest_YM_HammerUpgrades")
table.insert( QuestOrderData, "Quest_YM_LargeHealRun")
table.insert( QuestOrderData, "Quest_YM_HighCombo")

OverwriteTableKeys( QuestData, {
-- Clear with each weapon (any aspect)
	Quest_YM_Chronos_aspects =
	{
		InheritFrom = { "DefaultQuestItem", "DefaultKillQuest" },
		RewardResourceName = "Mixer5Common",
		RewardResourceAmount = 3,
		UnlockGameStateRequirements =
		{
			{
				Path = { "GameState", "WeaponsUnlocked" },
				HasAll = { 
                    "StaffAspectofYoungMelinoe", 
                    "DaggerAspectofYoungMelinoe", 
                    "TorchAspectofYoungMelinoe",
                    "AxeAspectofYoungMelinoe",
                    "SkullAspectofYoungMelinoe",
                    --"SuitAspectofYoungMelinoe",
                },
			},
			{
				Path = { "GameState", "ClearedWithWeapons" },
				HasAll =
				{
					"WeaponStaffSwing",
					"WeaponDagger",
					"WeaponTorch",
					"WeaponAxe",
					"WeaponLob",
					"WeaponSuit",
				},
			},
		},
		CompleteGameStateRequirements =
		{
			{
				Path = { "GameState", "ClearedWithAspects" },
				HasAll =
				{
					"StaffAspectofYoungMelinoe",
                    "DaggerAspectofYoungMelinoe",
                    "TorchAspectofYoungMelinoe",
                    "AxeAspectofYoungMelinoe",
                    "SkullAspectofYoungMelinoe",
                    --"SuitAspectofYoungMelinoe",
				},
			},
		},

		CashedOutVoiceLines =
		{
			{
				PreLineWait = 0.4,
				GameStateRequirements =
				{
					{
					},
				},
				Cooldowns =
				{
					{ Name = "MorosProphecyFulfilledSpeech", Time = 3 },
				},
				SkipAnim = true,
				RequiredSourceValueFalse = "InPartnerConversation",
				ObjectType = "NPC_Moros_01",

				{ Cue = "/VO/Moros_0623", Text = "The Arms of Night shall feast in all their forms." },
			},
		},
	},

    Quest_YM_MaxWeaponUpgrade =
	{
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "Mixer5Common",
		RewardResourceAmount = 2,
		UnlockGameStateRequirements =
		{
			{
				Path = { "GameState", "WeaponsUnlocked" },
				HasAny =
				{
					"StaffAspectofYoungMelinoe2",
                    "DaggerAspectofYoungMelinoe2",
                    "TorchAspectofYoungMelinoe2",
                    "AxeAspectofYoungMelinoe2",
                    "SkullAspectofYoungMelinoe2",
				},
			},
		},
		CompleteGameStateRequirements =
		{
			{
				Path = { "GameState", "WeaponsUnlocked" },
				HasAll =
				{
					"StaffAspectofYoungMelinoe5",
                    "DaggerAspectofYoungMelinoe5",
                    "TorchAspectofYoungMelinoe5",
                    "AxeAspectofYoungMelinoe5",
                    "SkullAspectofYoungMelinoe5",
				},
			},
		},
		CashedOutVoiceLines =
		{
			{
				PreLineWait = 0.4,
				GameStateRequirements =
				{
					{
					},
				},
				Cooldowns =
				{
					{ Name = "MorosProphecyFulfilledSpeech", Time = 3 },
				},
				SkipAnim = true,
				RequiredSourceValueFalse = "InPartnerConversation",
				ObjectType = "NPC_Moros_01",

				{ Cue = "/VO/Moros_0223", Text = "The Arms of Night were forged with you in mind." },
			},
		},
	},

    Quest_YM_HighCombo =
	{
		InheritFrom = { "DefaultQuestItem", "DefaultKillQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 300,
		UnlockGameStateRequirements =
		{
			{
				Path = { "GameState", "WeaponsUnlocked" },
				HasAll = { 
                    "SkullAspectofYoungMelinoe",
                },
			},
		},
		CompleteGameStateRequirements =
		{
			{
				PathTrue = { "GameState", "Flags", "High_Combo",},
			},
		},
		CashedOutVoiceLines =
		{
			{
				PreLineWait = 0.4,
				GameStateRequirements =
				{
					{
					},
				},
				Cooldowns =
				{
					{ Name = "MorosProphecyFulfilledSpeech", Time = 3 },
				},
				SkipAnim = true,
				RequiredSourceValueFalse = "InPartnerConversation",
				ObjectType = "NPC_Moros_01",

				{ Cue = "/VO/Moros_0596", Text = "Could the Fates have already expected your ascent...?" },
			},
		},
	},

    Quest_YM_LargeHealRun =
	{
		InheritFrom = { "DefaultQuestItem", "DefaultKillQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 300,
		UnlockGameStateRequirements =
		{
			{
				Path = { "GameState", "WeaponsUnlocked" },
				HasAll = { 
                    "StaffAspectofYoungMelinoe",
                },
			},
		},
		CompleteGameStateRequirements =
		{
			{
				PathTrue = { "GameState", "Flags", "LargeHealRun",},
			},
		},
		CashedOutVoiceLines =
		{
			{
				PreLineWait = 0.4,
				GameStateRequirements =
				{
					{
					},
				},
				Cooldowns =
				{
					{ Name = "MorosProphecyFulfilledSpeech", Time = 3 },
				},
				SkipAnim = true,
				RequiredSourceValueFalse = "InPartnerConversation",
				ObjectType = "NPC_Moros_01",

				{ Cue = "/VO/Moros_0240", Text = "Ever shall you walk in the light of the Moon." },
			},
		},
	},

    Quest_YM_HammerUpgrades =
	{
		InheritFrom = { "DefaultQuestItem", "DefaultUnseenQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 250,
		UnlockGameStateRequirements =
		{
			{
				Path = { "GameState", "TraitsTaken" },
				CountOf =
				{
                    --Staff
                    "StaffDoubleHealTraitYM",
                    "StaffSpecialHomingTraitYM",
                    --Dagger
                    "DaggerDashAttackTripleTraitYM",
                    --Torch
                    "ReflectiveCastTraitYM",
                    --Axe
                    "AxeShieldDeflectTraitYM",
                    --Skull
                    "LobExtendComboTraitYM",
                    "LobComboScalingTraitYM",
				},
				Comparison = ">=",
				Value = 3,
			},
		},
		CompleteGameStateRequirements =
		{
			{
				Path = { "GameState", "TraitsTaken" },
				HasAll =
				{
                    --Staff
                    "StaffDoubleHealTraitYM",
                    "StaffSpecialHomingTraitYM",
                    --Dagger
                    "DaggerDashAttackTripleTraitYM",
                    --Torch
                    "ReflectiveCastTraitYM",
                    --Axe
                    "AxeShieldDeflectTraitYM",
                    --Skull
                    "LobExtendComboTraitYM",
                    "LobComboScalingTraitYM",
				},
			},
		},

		CashedOutVoiceLines =
		{
			{
				PreLineWait = 0.4,
				GameStateRequirements =
				{
					{
					},
				},
				Cooldowns =
				{
					{ Name = "MorosProphecyFulfilledSpeech", Time = 3 },
				},
				SkipAnim = true,
				RequiredSourceValueFalse = "InPartnerConversation",
				ObjectType = "NPC_Moros_01",

				{ Cue = "/VO/Moros_0216", Text = "A necessary step along your path." },
			},
		},
	},
})