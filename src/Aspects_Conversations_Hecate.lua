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
            PreContentSound = "/VO/Hecate_0382", "{#Emph}Hrm..."
            Text = "That form, It's been some time since I last saw you with sweet Descura sticking out of your mouth.",
        },
        { 
            Cue = "/VO/Melinoe_YM0001", UsePlayerSource = true,
            PreContentSound = "/VO/Melinoe_0321", --"{#Emph}Tsch."
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
            PreContentSound = "/VO/Hecate_0382", --{#Emph}Hrm...
            Text = "Wooden Lim and Oros, These wooden blades were ever your favorite form during training.",
        },
        { 
            Cue = "/VO/Melinoe_YM0002", UsePlayerSource = true,
            PreContentSound = "/VO/Melinoe_0326", --Truly.
            PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
            PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
            Text = "Truly, training with these blades were part of the rare times I could run around like a care-free child, wacking at trees.", 
        },
        EndVoiceLines =
        {
            {
                PreLineWait = 0.4,
                ObjectType = "NPC_Hecate_01",
                { 
                    Cue = "/VO/MelinoeField_0711", --I can't do that again...
                    --PreContentSound = "/SFX/Menu Sounds/ChaosMiscSFX",
                    Text = "I can't do that again...",
                },
            },
        },
    },
    HecateAboutTorchYM01 =
    {
        PlayOnce = true,
        UseableOffSource = true,
        GameStateRequirements =
        {
            {
                Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"TorchAspectofYoungMelinoe", },
            },
        },
        OnQueuedFunctionName = "CheckDistanceTriggerThread",
        OnQueuedFunctionArgs = PresetEventArgs.HecateGreeting,

        { 
            Cue = "/VO/Hecate_YM0004",
            PreContentSound = "/VO/Hecate_0382", --{#Emph}Hrm...
            Text = "This aspect of Ygnium? Back to your old mischief I see. At least I hope you no longer fill those balloons with nectar.",
        },
        { 
            Cue = "/VO/Melinoe_YM0003", UsePlayerSource = true,
            PreContentSound = "/VO/Melinoe_0253", --"{#Emph}<Sigh>"
            PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
            PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
            Text = "Only water Headmistress. Per the family customs, Nectar is reserved for friends and gifts.", 
        },
        EndVoiceLines =
        {
        
        },
    }, 
    HecateAboutAxeYM01 =
    {
        PlayOnce = true,
        UseableOffSource = true,
        GameStateRequirements =
        {
            {
                Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"AxeAspectofYoungMelinoe", },
            },
        },
        OnQueuedFunctionName = "CheckDistanceTriggerThread",
        OnQueuedFunctionArgs = PresetEventArgs.HecateGreeting,

        { 
            Cue = "/VO/Hecate_YM0005",
            PreContentSound = "/VO/Hecate_0382",--{#Emph}Hrm...
            Text = "These markings on Zorephet. Do tell me you no longer fear the scary man in charge of time.",
        },
        { 
            Cue = "/VO/Melinoe_YM0004", UsePlayerSource = true,
            PreContentSound = "/VO/Melinoe_0865", --"Death to Chronos. I'll see to that. No one is more prepared."
            PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
            PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
            Text = "I have grown since then as has my resolve. Death to Chronos. I'll see to that. No one is more prepared.", 
        },
        { 
            Cue = "/VO/Hecate_0063", --Death to Chronos
            PreContentSound = "/VO/Hecate_0063",
            Text = "Death to Chronos.",
        },
        EndVoiceLines =
        {
        
        },
    }, 
    HecateAboutSkullYM01 =
    {
        PlayOnce = true,
        UseableOffSource = true,
        GameStateRequirements =
        {
            {
                Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"SkullAspectofYoungMelinoe", },
            },
        },
        OnQueuedFunctionName = "CheckDistanceTriggerThread",
        OnQueuedFunctionArgs = PresetEventArgs.HecateGreeting,

        { 
            Cue = "/VO/Hecate_YM0003",
            PreContentSound = "/VO/Hecate_0382", --{#Emph}Hrm...
            Text = "These wooden blades were ever your favorite form during training.",
        },
        { 
            Cue = "/VO/Melinoe_YM0002", UsePlayerSource = true,
            PreContentSound = "/VO/Melinoe_0326", --Truly.
            PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
            PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
            Text = "Training with these blades were part of the rare times I could run around like a care-free child, wacking at trees.", 
        },
        EndVoiceLines =
        {
        
        },
    }, 
    HecateAboutSuitYM01 =
    {
        PlayOnce = true,
        UseableOffSource = true,
        GameStateRequirements =
        {
            {
                Path = {"CurrentRun", "Hero", "TraitDictionary"},
                HasAll = {"SuitAspectofYoungMelinoe", },
            },
        },
        OnQueuedFunctionName = "CheckDistanceTriggerThread",
        OnQueuedFunctionArgs = PresetEventArgs.HecateGreeting,

        { 
            Cue = "/VO/Hecate_YM0006",
            PreContentSound = "/VO/Hecate_0382", --{#Emph}Hrm...
            Text = "That form. Did you let young Icarus bear the Nocturnal Arms?",
        },
        { 
            Cue = "/VO/Melinoe_YM0005", UsePlayerSource = true,
            PreContentSound = "/VO/Melinoe_0251", --Mm.
            PreLineAnim = "MelTalkFlustered01", PreLineAnimTarget = "Hero",
            PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
            Text = "We were young and foolish wandering around the crossroads playing with things we shouldn't. The Cauldron, Xinth.", 
        },
        { 
            Cue = "/VO/Hecate_YM0007",
            PreContentSound = "/VO/Hecate_0580", --{#Emph}Hmm.
            Text = "It was more that once that I caught you swimming in the Cauldron.",
        },
        EndVoiceLines =
        {
        
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
        DisplayName = "Wooden Lim and Oros, these wooden blades were ever your favorite form during training.",
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

    table.insert(data.Texts, sjson.to_object(
        {
         Id = "Hecate_YM0004",
        InheritFrom = "BaseNarrative",
        DisplayName = "This aspect of Ygnium? Back to your old mischief I see. At least I hope you no longer fill those balloons with nectar.",
        Speaker = "Hecate",
        Event = "HecateAboutTorchYM01",
        },
        TextOrder)
    )

    table.insert(data.Texts, sjson.to_object(
        {
         Id = "Melinoe_YM0003",
        InheritFrom = "BaseNarrative",
        DisplayName = "Only water Headmistress. Per the family customs, Nectar is reserved for friends and gifts.",
        Speaker = "Melinoe",
        Event = "HecateAboutTorchYM01",
        },
        TextOrder)
    )

        table.insert(data.Texts, sjson.to_object(
        {
         Id = "Hecate_YM0005",
        InheritFrom = "BaseNarrative",
        DisplayName = "This aspect of Ygnium? Back to your old mischief I see. At least I hope you no longer fill those balloons with nectar.",
        Speaker = "Hecate",
        Event = "HecateAboutAxeYM01",
        },
        TextOrder)
    )

        table.insert(data.Texts, sjson.to_object(
        {
         Id = "Melinoe_YM0004",
        InheritFrom = "BaseNarrative",
        DisplayName = "Only water Headmistress. Per the family customs, Nectar is reserved for friends and gifts.",
        Speaker = "Melinoe",
        Event = "HecateAboutAxeYM01",
        },
        TextOrder)
    )

        table.insert(data.Texts, sjson.to_object(
        {
         Id = "Hecate_YM0006",
        InheritFrom = "BaseNarrative",
        DisplayName = "That form. Did you let young Icarus bear the Nocturnal Arms?",
        Speaker = "Hecate",
        Event = "HecateAboutSuitYM01",
        },
        TextOrder)
    )

            table.insert(data.Texts, sjson.to_object(
        {
         Id = "Melinoe_YM0005",
        InheritFrom = "BaseNarrative",
        DisplayName = "We were young and foolish wandering around the crossroads playing with things we shouldn't. The Cauldron, Xinth.",
        Speaker = "Melinoe",
        Event = "HecateAboutSuitYM01",
        },
        TextOrder)
    )

            table.insert(data.Texts, sjson.to_object(
        {
         Id = "Hecate_YM0007",
        InheritFrom = "BaseNarrative",
        DisplayName = "It was more that once that I caught you swimming in the Cauldron.",
        Speaker = "Hecate",
        Event = "HecateAboutSuitYM01",
        },
        TextOrder)
    )

return data
	end)

---- Inserting the new events into the NarrativeData in the correct place for the priority
table.insert(NarrativeData.Hecate.BossIntroTextLinePriorities, 35, "HecateAboutStaffYM01")
table.insert(NarrativeData.Hecate.BossIntroTextLinePriorities, 35, "HecateAboutDaggerYM01")
table.insert(NarrativeData.Hecate.BossIntroTextLinePriorities, 35, "HecateAboutTorchYM01")
table.insert(NarrativeData.Hecate.BossIntroTextLinePriorities, 35, "HecateAboutAxeYM01")

--table.insert(NarrativeData.Hecate.BossIntroTextLinePriorities, 35, "HecateAboutSkullYM01")
table.insert(NarrativeData.Hecate.BossIntroTextLinePriorities, 35, "HecateAboutSuitYM01")

