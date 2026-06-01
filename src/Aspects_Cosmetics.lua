---@diagnostic disable-next-line: undefined-global
local mods = rom.mods

---@module "NikkelM-Cosmetics_API"
CosmeticsAPI = mods["NikkelM-Cosmetics_API"]

CosmeticsAPI.RegisterCrossroadsPackages({ "JarlUlsfark-AspectYoungMel_ArcanaBacks" })

-- #YM Aspect Pack
CosmeticsAPI.RegisterCardBackPack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_YMAspects",
	Name = {
		en = "Arcana, Youthful-Memories",
	},
	Description = {
		en =
		"{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}6 {#Prev}alternate themes, featuring Nocturnal Arms in the aspects of Melinoë's youth.",
	},
	FlavorText = {
		en =
		"The bearers of the Arms have in common their pleasant memories of innocent times long forgotten.",
	},
	IconPath = "JarlUlsfark-AspectYoungMel\\ArcanaBackSet",
	Cost = {
		CosmeticsPoints = 2500,
		--ModsNikkelMHadesBiomes_PlantAsphodel = 2,
		--ModsNikkelMHadesBiomes_CropElysium = 2,
		--ModsNikkelMHadesBiomes_OreStyx = 4,

	},
	GameStateRequirements = {
		{
			PathTrue = { "GameState", "WorldUpgradesAdded", "Cosmetic_CardDeck01" },
		},
		{
				Path = { "GameState", "WeaponsUnlocked", },
				HasAll = { 
                    "WeaponStaffSwing", "StaffAspectofYoungMelinoe",
                    "WeaponDagger", "DaggerAspectofYoungMelinoe", 
                    "WeaponTorch", "TorchAspectofYoungMelinoe", 
                    "WeaponAxe", "AxeAspectofYoungMelinoe", 
                    "WeaponLob", "SkullAspectofYoungMelinoe",
                    "WeaponSuit", "SuitAspectofYoungMelinoe",
                },
        },
	},
	InsertAfterCosmetic = "Cosmetic_CardDeck02",
	PreRevealVoiceLines = {
		Queue = "Interrupt",
		{
			PreLineWait = 0.35,
			UsePlayerSource = true,
			{ Cue = "/VO/Melinoe_5281", Text = "Time to retrace my steps..." },
		},
		{ GlobalVoiceLines = "DoraCosmeticReactionVoiceLines" },
	},
})

CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_YM_Staff",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_YMAspects",
	DeckArtPath = "JarlUlsfark-AspectYoungMel\\ArcanaBackStaffNotSel",
	DeckArtMouseoverPath = "JarlUlsfark-AspectYoungMel\\ArcanaBackStaffYesSel",
	CardBackPath = "JarlUlsfark-AspectYoungMel_ArcanaBacks\\ArcanaBackStaff",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_YM_Dagger",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_YMAspects",
	DeckArtPath = "JarlUlsfark-AspectYoungMel\\ArcanaBackDaggerNotSel",
	DeckArtMouseoverPath = "JarlUlsfark-AspectYoungMel\\ArcanaBackDaggerYesSel",
	CardBackPath = "JarlUlsfark-AspectYoungMel_ArcanaBacks\\ArcanaBackDagger",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_YM_Torch",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_YMAspects",
	DeckArtPath = "JarlUlsfark-AspectYoungMel\\ArcanaBackTorchNotSel",
	DeckArtMouseoverPath = "JarlUlsfark-AspectYoungMel\\ArcanaBackTorchYesSel",
	CardBackPath = "JarlUlsfark-AspectYoungMel_ArcanaBacks\\ArcanaBackTorch",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_YM_Axe",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_YMAspects",
	DeckArtPath = "JarlUlsfark-AspectYoungMel\\ArcanaBackAxeNotSel",
	DeckArtMouseoverPath = "JarlUlsfark-AspectYoungMel\\ArcanaBackAxeYesSel",
	CardBackPath = "JarlUlsfark-AspectYoungMel_ArcanaBacks\\ArcanaBackAxe",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_YM_Skull",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_YMAspects",
	DeckArtPath = "JarlUlsfark-AspectYoungMel\\ArcanaBackSkullNotSel",
	DeckArtMouseoverPath = "JarlUlsfark-AspectYoungMel\\ArcanaBackSkullYesSel",
	CardBackPath = "JarlUlsfark-AspectYoungMel_ArcanaBacks\\ArcanaBackSkull",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_YM_Suit",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_YMAspects",
	DeckArtPath = "JarlUlsfark-AspectYoungMel\\ArcanaBackSuitNotSel",
	DeckArtMouseoverPath = "JarlUlsfark-AspectYoungMel\\ArcanaBackSuitYesSel",
	CardBackPath = "JarlUlsfark-AspectYoungMel_ArcanaBacks\\ArcanaBackSuit",
})