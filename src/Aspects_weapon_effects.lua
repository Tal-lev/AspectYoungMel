local file = rom.path.combine(rom.paths.Content, 'Game/Weapons/PlayerWeapons.sjson')
	sjson.hook(file, function(data)
	for key, weapon in pairs(data.Weapons) do
		if weapon.Name == 'WeaponAxeSpecial' then
			weapon.Effects =
			{
				{
					Name = "AxeSpecialBlockSelfTriggerLock",
					Duration = 0.30,
					Active = true,
				},
				{
					Name = "AxeSpecialDisable",
					Duration = 0.31,
					DisableAttack = true,
					DisableMove = true,
					DisableRotate = true,
					RequestTriggerLock = true,
					Cancelable = false,
					Active = true,
				},
				{
					Name = "AxeSpecialDisableCancelable",
					Duration = 0.37,
					DisableAttack = true,
					DisableMove = true,
					DisableRotate = true,
					RequestTriggerLock = true,
					Cancelable = true,
					Active = true,
				},
				{
					Name = "AxeSpecialDisableMovementCancelable",
					Duration = 0.38,
					DisableAttack = false,
					DisableMove = true,
					DisableRotate = true,
					RequestTriggerLock = true,
					Cancelable = true,
					Active = true,
				},
				{
					Trigger = "Charging",
					Name = "AspectSlowCharge",
					Type = "SPEED",
					DurationFrames = 30,
					Modifier = 0.5,
					Cancelable = true,
					Active = false,
					CanAffectInvulnerable = true,
				},
				{
					Trigger = "Charging",
					Name = "AspectSlowFire",
					Type = "SPEED",
					DurationFrames = 60,
					Modifier = 0.5,
					Cancelable = true,
					Active = false,
					CanAffectInvulnerable = true,
				},
				{
					Trigger = "Charging",
					Name = "ShieldSelfSpeed",
					Type = "SPEED",
					HaltOnStart = true,
					Duration = 0.02,
					Modifier = 0.2,
					Active = false,
					CanAffectInvulnerable = true,
					
				},
				{
					Trigger = "Charging",
					Name = "ShieldSelfInvulnerableRush",
					Type = "INVULNERABLE",
					Duration = 0.1,
					Modifier = 1.0,
					Active = false,
					CanAffectInvulnerable = true,
					ClearOnAttack = true,
				},
				{
					Trigger = "Fire",
					Name = "ShieldSelfInvulnerableRush2",
					Type = "INVULNERABLE",
					DurationFrames = 34,
					Modifier = 1.0,
					Active = false,
					AngleCoverage = 220,
					CanAffectInvulnerable = true,
					Cancelable = true,
				},
				{
					Name = "ShieldFireDisableAttack",
					DurationFrames = 13,
					DisableAttack = true,
					RequestTriggerLock = true,
					Cancelable = false,
					Active = false,
				},
				{
					Trigger = "Charging",
					Name = "ShieldChargeDisableMove",
					DurationFrames = 19,
					DisableMove = true,
					DisableRotate = true,
					Cancelable = true,
					TimeModifierFraction = 0,
					ClearOnAttack = true,
					Active = false,
				},
				{
					Trigger = "Fire",
					Name = "ShieldFireDisableMove2",
					DurationFrames = 34,
					DisableMove = true,
					DisableRotate = true,
					Cancelable = true,
					TimeModifierFraction = 0,
					Active = false,
				},
			}
	
		--elseif weapon.Name == 'WeaponStaffBall' then 
		--	weapon.Effects =
		end
	end
	return data
	end)