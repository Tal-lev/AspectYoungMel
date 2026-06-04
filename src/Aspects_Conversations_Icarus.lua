---- Creating Event objects
OverwriteTableKeys( EnemyData.NPC_Icarus_01.InteractTextLineSets, {
    IcarusAboutSuitYM01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				PreEventFunctionName = "AngleNPCToHero",
				GameStateRequirements =
				{
                    {
                        Path = {"CurrentRun", "Hero", "TraitDictionary"},
                        HasAll = {"SuitAspectofYoungMelinoe", },
                    },
				},

				{ Cue = "/VO/Icarus_YM001",
                    PreContentSound = "/VO/Icarus_0223", --What {#Emph}is {#Prev}that thing?  
					PreLineAnim = "Icarus_Pensive_Start",
					Text = "What {#Emph}is {#Prev}that thing? Those wings...! Is that Xinth? I'm really sorry, I should never have worn it that one night." },
				{ Cue = "/VO/Melinoe_YM0007", UsePlayerSource = true,
                    PreContentSound = "/VO/Melinoe_0251", --Mm.
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Not your fault. We were only kids sneaking about. It was I one who pushed you to take them." },
				{ Cue = "/VO/Icarus_YM002",
					PreLineAnim = "Icarus_Pensive_End",
					Text = "I felt so bad... couldn't look at The Headmistress in the eye. I was so ashamed." },
				{ Cue = "/VO/Melinoe_YM0008", UsePlayerSource = true,
                    PreContentSound = "/VO/Melinoe_0253", --"{#Emph}<Sigh>"
					Portrait = "Portrait_Mel_Pleased_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "There is nothing to be ashamed. Thanks to that night I'm now able to wield your power, to fly above the waves. That childish mischief eventually lend great aid to the mission." },
				{ Cue = "/VO/Icarus_YM003",
					PreLineAnim = "Icarus_Explaining_Start",
					PostLineAnim = "Icarus_Explaining_End",
					Text = "These wings of mine, Meli. I'm glad you're able to wear them. And for what it's worth, I think they look better on you than they ever did on me." },
				PrePortraitExitFunctionName = "IcarusBenefitChoice",
				PrePortraitExitFunctionArgs = PresetEventArgs.IcarusBenefitChoices,
			},
})

---- Adding subtitles (duplicating the text from the event object)    
--Inserts text
local TextOrder = {
"Id",
"InheritFrom",
"DisplayName",
"Speaker",
"Event",
"OverwriteLocalization",
}
	
local file = rom.path.combine(rom.paths.Content, 'Game/Text/en/_NPCData_Icarus.en.sjson')
sjson.hook(file, function(data)

        table.insert(data.Texts, sjson.to_object(
        {
         Id = "Icarus_YM001",
        InheritFrom = "BaseNarrative",
        DisplayName = "What {#Emph}is {#Prev}that thing? Those wings...! Is that Xinth? I'm really sorry, I should never have worn it that one night.",
        Speaker = "Icarus",
        Event = "NPC_Icarus_01.InteractVoiceLines",
        },
        TextOrder)
    )

    table.insert(data.Texts, sjson.to_object(
        {
         Id = "Melinoe_YM0007",
        InheritFrom = "BaseNarrative",
        DisplayName = "Not your fault. We were only kids sneaking about. It was I one who pushed you to take them.",
        Speaker = "Melinoe",
        Event = "NPC_Icarus_01.InteractVoiceLines",
        },
        TextOrder)
    )

        table.insert(data.Texts, sjson.to_object(
        {
         Id = "Melinoe_YM0008",
        InheritFrom = "BaseNarrative",
        DisplayName = "There is nothing to be ashamed. Thanks to that night I'm now able to wield your power, to fly above the waves. That childish mischief eventually lend great aid to the mission.",
        Speaker = "Melinoe",
        Event = "NPC_Icarus_01.InteractVoiceLines",
        },
        TextOrder)
    )

    table.insert(data.Texts, sjson.to_object(
        {
         Id = "Icarus_YM002",
        InheritFrom = "BaseNarrative",
        DisplayName = "I felt so bad... couldn't look at The Headmistress in the eye. I was so ashamed.",
        Speaker = "Icarus",
        Event = "NPC_Icarus_01.InteractVoiceLines",
        },
        TextOrder)
    )

    table.insert(data.Texts, sjson.to_object(
        {
         Id = "Icarus_YM003",
        InheritFrom = "BaseNarrative",
        DisplayName = "These wings of mine, Meli. I'm glad you're able to wear them. And for what it's worth, I think they look better on you than they ever did on me.",
        Speaker = "Icarus",
        Event = "NPC_Icarus_01.InteractVoiceLines",
        },
        TextOrder)
    )

return data
end)

---- Inserting the new events into the NarrativeData in the correct place for the priority
table.insert(NarrativeData.NPC_Icarus_01.InteractTextLinePriorities, 11, "IcarusAboutSuitYM01")