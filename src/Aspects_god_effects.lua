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

local function PropertiesMatch(propertyChange, property)
	local ignoredFields = {"Replacements", "Deletions", "Additions"}
	local ignoredFields2 = {}
	for _, field in ipairs(ignoredFields) do
		for _, field2 in ipairs(propertyChange[field] or {}) do
			table.insert(ignoredFields2, field2)
		end
	end
	local merge = true
	for field, value in pairs(propertyChange) do
		if not game.Contains(ignoredFields, field) and not game.Contains(ignoredFields2, field) then
			if type(value) ~= type(property[field]) then
				merge = false
			end
			if type(value) ~= table and property[field] ~= value then
				merge = false
			end
			if type(value) == table and table.concat(property[field] or {}) ~= table.concat(value) then
				merge = false
			end
		end
	end
	if merge then
		for index, value in ipairs(propertyChange.Replacements or {}) do
			property[value] = propertyChange[value]
		end
		for index, value in ipairs(propertyChange.Deletions or {}) do
			property[value] = nil
		end
		for index, value in ipairs(propertyChange.Additions or {}) do
			property[value] = propertyChange[value]
		end
	end
end

local function ModifyGodTraitWeaponProperty(args)
	if args.PropertyChanges == nil then
		return
	end
	local prefix = args.TraitPrefix or ""
	local suffix = args.TraitSuffix or ""
	for _, god in pairs(CoreGods) do
		local traitName = (prefix) .. god .. (suffix)
		local properties = args.PropertyChanges
		local traitData = game.TraitData[traitName]
		if traitData then
			for _, propertyChange in ipairs(properties) do
				for _, traitProperty in ipairs(traitData.PropertyChanges or {}) do
					local processedPropertyChange = game.DeepCopyTable(propertyChange)
					if processedPropertyChange.ValuePrefix ~= nil or processedPropertyChange.ValueSuffix ~= nil then
						processedPropertyChange.ChangeValue = (processedPropertyChange.ValuePrefix or "") .. god .. (processedPropertyChange.ValueSuffix or "")
						processedPropertyChange.ValuePrefix = nil
						processedPropertyChange.ValueSuffix = nil
					end
					PropertiesMatch(processedPropertyChange, traitProperty)
				end
			end
		end
	end
end

ModifyGodTraitWeaponProperty({
	TraitSuffix = "SpecialBoon",
	PropertyChanges = {
		{
			FalseTraitNames = { "AxeBlockEmpowerTrait", "AxeRallyAspect", "AxeAspectofYoungMelinoe"},
			WeaponName = "WeaponAxeSpecial",
			WeaponProperty = "FireFx",
			ValuePrefix = "AxeSpinDouble_",
			ChangeType = "Absolute",
			ExcludeLinked = true,

			Replacements = {
				"FalseTraitNames"
			},
			Deletions = {

			},
			Additions = {

			}
		},
		{
			TraitName = "AxeBlockEmpowerTrait",
			FalseTraitNames = { "AxeRallyAspect", "AxeAspectofYoungMelinoe"},
			WeaponName = "WeaponAxeSpecial",
			WeaponProperty = "FireFx",
			ChangeValue = "null",
			ChangeType = "Absolute",
			ExcludeLinked = true,

			Replacements = {

			},
			Deletions = {
				"FalseTraitName"
			},
			Additions = {
				"FalseTraitNames"
			}
		},
	}
})

--Starting to add god_effects

--RemoveWeaponPropertyFromTraits("WeaponAxeSpecial", "FireFx")
RemoveWeaponPropertyFromGodTraits("WeaponCastYM", "Graphic")
RemoveWeaponPropertyFromGodTraits("WeaponCastYM", "DetonateFx")
RemoveWeaponPropertyFromGodTraits("WeaponCastYM", "ImpactFx")
	-- At TraitData_God.lua
	AddGodTraitProperty({
		TraitSuffix = "SpecialBoon",
		PropertyChanges = {
			-- Axe YoungMel special (no FX)
			{
				TraitName = "AxeAspectofYoungMelinoe" ,
				FalseTraitNames = { "AxeBlockEmpowerTrait" },
				WeaponName = "WeaponAxeSpecial",
				WeaponProperty = "FireFx",
				Value = "null",
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

	AddGodTraitProperty({
		TraitSuffix = "CastBoonYM",
		PropertyChanges = {
			-- Torches Aspect of young Mel special 
			{
				WeaponName = "WeaponCastYM",
				ProjectileName = "ProjectileCastYM",
				ProjectileProperty = "Graphic",
				ValuePrefix = "CastCircleIn",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponCastYM",
				ProjectileName = "ProjectileCastYM",
				ProjectileProperty = "DetonateFx",
				ValuePrefix = "CastCircleOut",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponCastYM",
				ProjectileName = "ProjectileCastYM",
				ProjectileProperty = "ImpactFx",
				ValuePrefix = "CastCircleUnitFxFront",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	})

		AddGodTraitProperty({
		TraitSuffix = "WeaponBoon",
		PropertyChanges = {
			-- Torches Aspect of young Mel special 
			{
				WeaponName = "WeaponSuit",
				ProjectileName = "HarpyFlapFast_YM",
				ProjectileProperty = "Graphic",
				ValuePrefix = "HarpyTornadoYM_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponSuit2",
				ProjectileName = "HarpyFlapFast_YM",
				ProjectileProperty = "Graphic",
				ValuePrefix = "HarpyTornadoYM_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponSuit3",
				ProjectileName = "HarpyFlapFast_YM",
				ProjectileProperty = "Graphic",
				ValuePrefix = "HarpyTornadoYM_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponSuitDash",
				ProjectileName = "HarpyFlapFast_YM",
				ProjectileProperty = "Graphic",
				ValuePrefix = "HarpyTornadoYM_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponSuitDash",
				ProjectileName = "HarpyFlapFastDash_YM",
				ProjectileProperty = "Graphic",
				ValuePrefix = "HarpyTornadoYM_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "WeaponSuitCharged",
				ProjectileName = "HarpyFlapFastCharge_YM",
				ProjectileProperty = "Graphic",
				ValuePrefix = "HarpyTornadoYM_",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--{
			--	WeaponName = "WeaponSuitCharged",
			--	TraitName = "SuitAspectofYoungMelinoe",
			--	ProjectileProperty = "FireFx",
			--	ValuePrefix = "null",
			--	ChangeType = "Absolute",
			--	ExcludeLinked = true,
			--},
		}
	})