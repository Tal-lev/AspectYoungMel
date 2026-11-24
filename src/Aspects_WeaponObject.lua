--WeaponSuit3
local file = rom.path.combine(rom.paths.Content, 'Game/Weapons/PlayerWeapons.sjson')
sjson.hook(file, function(data)
    
    table.insert(data.Weapons,
    {
		Name = "IcarusAspectWeaponSuit3",
        InheritFrom = "WeaponSuit",
        SwapOnFire = "WeaponSuit",
        BlockMoveInput = true,
        CancelMovement = true,
        Cooldown = 0.6,
        FireGraphic = "Melinoe_Suit_SpecialMissile_FireQuick",
        RootOwnerWhileFiring = true,
        SelfVelocity = -500,
        ControlWindow = 0.4,
    })

return data
end)

table.insert(WeaponSets.HeroWeaponSets.WeaponSuit, "IcarusAspectWeaponSuit3")
table.insert(WeaponData.WeaponSuit.DashSwaps, "IcarusAspectWeaponSuit3")