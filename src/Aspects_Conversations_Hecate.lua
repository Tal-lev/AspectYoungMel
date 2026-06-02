---- Creating Event objects
OverwriteTableKeys( EnemyData.Hecate.BossIntroTextLineSets, {
    HecateAboutStaffYM01 =
    {
        PlayOnce = true,
        UseableOffSource = true,
        GameStateRequirements =
        {
            {
                Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"StaffAspectofYoungMelinoe", },
            },
        },
        OnQueuedFunctionName = "CheckDistanceTriggerThread",
        OnQueuedFunctionArgs = PresetEventArgs.HecateGreeting,

        { 
            Cue = "/VO/Hecate_YM0001",
            PreContentSound = "/VO/Hecate_0382",
            Text = "That form, It's been some time since I last saw you with sweet Descura sticking out of your mouth.",
        },
        { 
            Cue = "/VO/Melinoe_YM0001", UsePlayerSource = true,
            PreContentSound = "/VO/Melinoe_0321",
            PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
            PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
            Text = "My skills have grown since that time; isn't that so, Headmistress?",
        },
        { 
            Cue = "/VO/Hecate_YM0002", 
            PreContentSound = "/SFX/Enemy Sounds/Hecate/EmoteLaugh",
            Text = "We shall see about that.",
        },
        EndVoiceLines =
        {
            --{
            --    PreLineWait = 0.4,
            --    ObjectType = "NPC_Hecate_01",

            --    { 
            --        Cue = "/VO/Hecate_YM0002", 
            --        --PreContentSound = "/SFX/Menu Sounds/ChaosMiscSFX",
            --        Text = "We shall see about that.",
            --    },
            --},
        },
    },
    HecateAboutDaggerYM01 =
    {
        PlayOnce = true,
        UseableOffSource = true,
        GameStateRequirements =
        {
            {
                Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"DaggerAspectofYoungMelinoe", },
            },
        },
        OnQueuedFunctionName = "CheckDistanceTriggerThread",
        OnQueuedFunctionArgs = PresetEventArgs.HecateGreeting,

        { 
            Cue = "/VO/Hecate_YM0003",
            PreContentSound = "/VO/Hecate_0382",
            Text = "These wooden blades were ever your favorite form during training.",
        },
        { 
            Cue = "/VO/Melinoe_YM0002", UsePlayerSource = true,
            PreContentSound = "/VO/Melinoe_0326,
            PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
            PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
            Text = "Training with these blades were part of the rare times I could run around like a care-free child, wacking at trees.", 
        },
        EndVoiceLines =
        {
            {
                PreLineWait = 0.4,
                ObjectType = "NPC_Hecate_01",
                { 
                    Cue = "/VO/MelinoeField_0711", 
                    --PreContentSound = "/SFX/Menu Sounds/ChaosMiscSFX",
                    Text = "I can't do that again...",
                },
            },
        },
    },
        

} )

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
	
local file = rom.path.combine(rom.paths.Content, 'Game/Text/en/_EnemyData_Hecate.en.sjson')
sjson.hook(file, function(data)
    
    table.insert(data.Texts, sjson.to_object(
        {
         Id = "Hecate_YM0001",
        InheritFrom = "BaseNarrative",
        DisplayName = "That form, It's been some time since I last saw you with sweet Descura sticking out of your mouth.",
        Speaker = "Hecate",
        Event = "HecateAboutStaffYM01",
        },
        TextOrder)
    )

    table.insert(data.Texts, sjson.to_object(
        {
         Id = "Melinoe_YM0001",
        InheritFrom = "BaseNarrative",
        DisplayName = "My skills have grown since that time; isn't that so, Headmistress?",
        Speaker = "Melinoe",
        Event = "HecateAboutStaffYM01",
        },
        TextOrder)
    )

    table.insert(data.Texts, sjson.to_object(
        {
         Id = "Hecate_YM0002",
        InheritFrom = "BaseNarrative",
        DisplayName = "We shall see about that.",
        Speaker = "Hecate",
        Event = "HecateAboutStaffYM01",
        },
        TextOrder)
    )

table.insert(data.Texts, sjson.to_object(
        {
         Id = "Hecate_YM0003",
        InheritFrom = "BaseNarrative",
        DisplayName = "These wooden blades were ever your favorite form during training.",
        Speaker = "Hecate",
        Event = "HecateAboutDaggerYM01",
        },
        TextOrder)
    )

    table.insert(data.Texts, sjson.to_object(
        {
         Id = "Melinoe_YM0002",
        InheritFrom = "BaseNarrative",
        DisplayName = "Training with these blades were part of the rare times I could run around like a care-free child, wacking at trees.",
        Speaker = "Melinoe",
        Event = "HecateAboutDaggerYM01",
        },
        TextOrder)
    )

return data
	end)

---- Inserting the new events into the NarrativeData in the correct place for the priority
table.insert(NarrativeData.Hecate.BossIntroTextLinePriorities, 35, "HecateAboutStaffYM01")
table.insert(NarrativeData.Hecate.BossIntroTextLinePriorities, 35, "HecateAboutDaggerYM01")

