-- Utility functions
local CoreGods = { "Aphrodite", "Apollo", "Ares", "Demeter", "Hephaestus", "Hera", "Hestia", "Poseidon", "Zeus" }

local function AddGodTraitProperty( args )
	if args.PropertyChanges == nil or (args.TraitPrefix == nil and args.TraitSuffix == nil) then
		return
	end
	for _, god in pairs(CoreGods) do
		local traitName = (args.TraitPrefix or "") .. god .. (args.TraitSuffix or "")
		local properties = DeepCopyTable(args.PropertyChanges)
		if TraitData[traitName] ~= nil and TraitData[traitName].PropertyChanges ~= nil then
			for _, property in pairs(properties) do
				if property.Value ~= nil then
					property.ChangeValue = property.Value
					property.Value = nil
				elseif property.ValuePrefix ~= nil or property.ValueSuffix ~= nil then
					property.ChangeValue = (property.ValuePrefix or "") .. god .. (property.ValueSuffix or "")
					property.ValuePrefix = nil
					property.ValueSuffix = nil
				end
				table.insert( TraitData[traitName].PropertyChanges, property )
			end
		end
	end
end

local function RemoveWeaponPropertyFromGodTraits(weaponName, weaponProperty)
    for traitName, trait in pairs(TraitData) do
        
        -- 1. Identify if the trait is a God Boon
        -- Boons typically have a 'LootName' or 'God' key tied to them.
        local isGodBoon = (trait.LootName ~= nil) or (trait.God ~= nil)
        
        -- 2. Explicitly safeguard against modifying Aspects
        -- Aspects usually use this flag, or have "Aspect" in their internal name.
        local isAspect = trait.IsWeaponEnchantment or string.find(traitName, "Aspect") ~= nil
        
        -- 3. Proceed only if it's a boon and definitely not an aspect
        if isGodBoon and not isAspect and trait.PropertyChanges then
            for i = #trait.PropertyChanges, 1, -1 do
                local change = trait.PropertyChanges[i]
                if change.WeaponName == weaponName and change.WeaponProperty == weaponProperty then
                    table.remove(trait.PropertyChanges, i)
                end
            end
        end
    end
end

--Starting to add god_effects

--RemoveWeaponPropertyFromTraits("WeaponAxeSpecial", "FireFx")
	-- At TraitData_God.lua
	AddGodTraitProperty({
		TraitSuffix = "SpecialBoon",
		PropertyChanges = {

			-- Axe Default special (no aspect overrides)
			{
				FalseTraitNames = { "AxeBlockEmpowerTrait", "AxeRallyAspect", "AxeAspectofYoungMelinoe" },
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "FireFx",
				ValuePrefix = "AxeSpinDouble_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Axe Nergal special
			{
				TraitName =  "AxeRallyAspect",
				FalseTraitNames = { "AxeBlockEmpowerTrait", "AxeAspectofYoungMelinoe" },
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "FireFx",
				ValuePrefix = "AxeSwipeUpper_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Axe farther special hammer (no FX)
			{
				TraitName = "AxeBlockEmpowerTrait",
				FalseTraitNames = { "AxeAspectofYoungMelinoe", "AxeRallyAspect" },
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "FireFx",
				ValuePrefix = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Axe YoungMel special (no FX)
			{
				TraitName = "AxeAspectofYoungMelinoe" ,
				FalseTraitNames = { "AxeBlockEmpowerTrait", "AxeRallyAspect" },
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "FireFx",
				ValuePrefix = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				ProjectileName = "ProjectileAxeBlockSpin",
				ProjectileProperty = "DetonateFx",
				ValuePrefix = "AxeDeflect_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponAxeSpecial",
				ProjectileName = "ProjectileAxeBlockSpinDeflect",
				ProjectileProperty = "DetonateFx",
				ValuePrefix = "AxeDeflect_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			-- Staff Aspect of young Mel special 
			{
				WeaponName = "WeaponStaffBall",
				ProjectileName = "ProjectileStaffBoltEA",
				ProjectileProperty = "Graphic",
				ValuePrefix = "StaffBallProjectileIn_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			-- Dagger Aspect of young Mel special 
			{
				WeaponName = "WeaponDaggerThrow",
				ProjectileName = "ProjectileDaggerThrowEA",
				ProjectileProperty = "Graphic",
				ValuePrefix = "DaggerProjectileFx_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	})