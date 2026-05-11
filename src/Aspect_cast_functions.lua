--Default
function mod.FireCastAtLocationYM( triggerArgs )
	if triggerArgs.LocationX and triggerArgs.LocationY then
		local dropLocation = SpawnObstacle({ Name = "InvisibleTarget", LocationX = triggerArgs.LocationX, LocationY = triggerArgs.LocationY  })
		FireWeaponFromUnit({ Weapon = "WeaponCastYM", Id = CurrentRun.Hero.ObjectId, DestinationId = dropLocation, FireFromTarget = true, Angle = fireAngle })
		Destroy({Id = dropLocation })
	end 		
end

function mod.WeaponCastFiredYM( owner, weaponData, args, triggerArgs)
	local projectileIds = { triggerArgs.ProjectileId }
	local attachedProjectileIds = {}
	local baseDuration = GetBaseDataValue({ Type = "Projectile", Name = "ProjectileCastYM", Property = "FuseStart" })
	baseDuration = baseDuration * GetTotalHeroTraitValue("CastDurationMultiplier", {IsMultiplier = true })
	-- TODO: Extracting this data from property changes and/or fired function args are foiled by the way that various boons change every variable separately
	for i, traitArgs in pairs(GetHeroTraitValues("CastProjectileModifiers")) do
		for _, projectileId in pairs( projectileIds ) do
			SetDamageRadiusMultiplier({ Id = projectileId, Fraction = traitArgs.AreaIncrease, Duration = baseDuration })
		end
	end
	thread( mod.StartCastSlowYM, triggerArgs.ProjectileId, baseDuration )
	SessionMapState.CastAttachedProjectiles[triggerArgs.ProjectileId] = attachedProjectileIds
	SessionMapState.LastCastProjectileId = triggerArgs.ProjectileId
	SessionMapState.LastCastProjectileVolley = triggerArgs.ProjectileVolley
	SessionMapState.CastAttachTriggered = nil

	if weaponData.Name == "WeaponCastYM" and weaponData.UnarmedCastCompleteGraphic then
		thread(CheckCastCompleteGraphic, weaponData)
	end
	if SessionMapState.ArmCast then
		RunWeaponMethod({ Id = CurrentRun.Hero.ObjectId, Weapon = "WeaponCastArm", Method = "ArmProjectiles" })
		SessionMapState.ArmCast = nil
		local interestedTraits = 
		{
			StaffSelfHitAspect = true,
			PoseidonManaBoon = true,
			LobGunAspect = true,
			ClearCastTalent = true,
			ChaosExAttackCurse = true,
			MagicCritMetaUpgrade = true,
		}
		for traitName in pairs( interestedTraits ) do
			if HeroHasTrait(traitName) then
				triggerArgs.DisjointExCast = true
				local traitData = GetHeroTrait(traitName)
				if traitData.OnWeaponFiredFunctions then
					thread( CallFunctionName, traitData.OnWeaponFiredFunctions.FunctionName, weaponData, traitData.OnWeaponFiredFunctions.FunctionArgs, triggerArgs )
				end
				triggerArgs.DisjointExCast = false
			end
		end
	end
	if HeroHasTrait("HadesCastProjectileBoon") and triggerArgs.TargetId then
		AttachProjectiles({ Ids = projectileIds, DestinationId = triggerArgs.TargetId })
		for _, id in pairs(SessionState.PoseidonExCastTarget) do
			Attach({ Id = id, DestinationId = triggerArgs.TargetId  })
		end
	end
	notifyExistingWaiters(weaponData.Name .. "Fired")
end

function mod.StartCastSlowYM( projectileId, duration )
	local scaleX = GetProjectileDataValue({ Id = projectileId, Property = "DamageRadiusScaleX" })
	local scaleY = GetProjectileDataValue({ Id = projectileId, Property = "DamageRadiusScaleY" })
	local impactSlowDataProperties = ShallowCopyTable( EffectData.ImpactSlowYM.DataProperties )
	local impactSlowEffect = { Id = CurrentRun.Hero.ObjectId, EffectName = "ImpactSlowYM", DataProperties = impactSlowDataProperties }
	local impactGripDataProperties = ShallowCopyTable( EffectData.ImpactGripYM.DataProperties )
	local impactGripEffect = { Id = CurrentRun.Hero.ObjectId, EffectName = "ImpactGripYM", DataProperties = impactGripDataProperties }
	while ProjectileExists({ Id = projectileId }) do
		local radius = GetProjectileProperty({ ProjectileId = projectileId, Property = "ModifiedDamageRadius" })
		local ids = GetClosestIds({ ProjectileId = projectileId, Distance = radius, DestinationName = "EnemyTeam", IgnorePermanentlyInvulnerable = true, ScaleX = scaleX, ScaleY = scaleY, PreciseCollision = true })
		for _, id in pairs( ids ) do
			local victim = ActiveEnemies[id]
			if victim ~= nil  and victim.ActivationFinished then
				if victim.IgnoreCastSlow then
					impactSlowDataProperties.Type = "TAG"
					impactSlowDataProperties.HaltOnStart = false
					impactGripDataProperties.Type = "TAG"
					impactGripDataProperties.HaltOnStart = false
				else
					impactSlowDataProperties.Type = EffectData.ImpactSlowYM.DataProperties.Type
					impactSlowDataProperties.HaltOnStart = EffectData.ImpactSlowYM.DataProperties.HaltOnStart
					impactGripDataProperties.Type = EffectData.ImpactGripYM.DataProperties.Type
					impactGripDataProperties.HaltOnStart = EffectData.ImpactGripYM.DataProperties.HaltOnStart
				end
				impactSlowEffect.DestinationId = id
				ApplyEffect( impactSlowEffect )
				impactGripEffect.DestinationId = id
				ApplyEffect( impactGripEffect )
				for i, data in ipairs( CurrentRun.Hero.HeroTraitValuesCache.OnCastEffectApplyFunction ) do
					CallFunctionName( data.FunctionName, victim, data.FunctionArgs, projectileId )
				end
			end
		end
		if HeroHasTrait("HestiaCastBoonYM") then
			if not IsEmpty( MapState.OilPuddleIds ) then
				local validOilPuddleIds = GetClosestIds({ ProjectileId = projectileId, PreciseCollision = true, DestinationIds = MapState.OilPuddleIds, ScaleX = 1, ScaleY = 0.5, Distance = radius })
				for _, ids in pairs(validOilPuddleIds) do
					local puddle = ActiveEnemies[ids]
					if puddle ~= nil then
						thread( OilPuddleOnHit, puddle, { AttackerTable = CurrentRun.Hero, SourceWeapon = "WeaponCastYM", SourceProjectile = "ProjectileCastYM" })
					end
				end
			end
		end
		if not IsEmpty( GetInProjectilesBlast({ Id = CurrentRun.Hero.ObjectId, DestinationName = "ProjectileCastYM", UseDamageRadius = true, ReturnFirst = true }) ) then
			local effectName = "InsideCastBuff"
			ApplyEffect({ DestinationId = CurrentRun.Hero.ObjectId, Id = CurrentRun.Hero.ObjectId, EffectName = effectName, DataProperties = EffectData[effectName].DataProperties })
		end
		waitUnmodified( 0.15 )
	end
end

function mod.RefreshImpactSlowYM( victim, victimId, triggerArgs )
	if not Contains( victim.Groups, "EnemyTeam" ) then
		return
	end
	local effectNames = { "ImpactSlowYM", "ImpactGripYM" }
	for _, effectName in pairs(effectNames) do
		local dataProperties = ShallowCopyTable(EffectData[effectName].DataProperties)
		if victim.IsBoss then
			dataProperties.HaltOnStart = false
		end
		if CurrentRun.Hero.ObjectId ~= nil then
			ApplyEffect({ DestinationId = victimId, Id = CurrentRun.Hero.ObjectId, EffectName = effectName, DataProperties = dataProperties })
		end
	end
end

--Zeus
function mod.OnZeusCastYM( weaponData, functionArgs, triggerArgs )
	local projectileId = triggerArgs.ProjectileId
	local tempObstacleId = SpawnObstacle({ Name = "InvisibleTarget", LocationX = triggerArgs.LocationX, LocationY= triggerArgs.LocationY })
	
	thread( mod.ManageZeusCloudYM, functionArgs, tempObstacleId, triggerArgs.ProjectileId )
	print("triggerArgs.ProjectileId id is :::::")
	print(triggerArgs.ProjectileId)
end

function mod.ManageZeusCloudYM( functionArgs, tempObstacleId, projectileId )
	local strikeCount = 0
	local yScale = nil
	local range = functionArgs.Range
	if projectileId then
		yScale = GetProjectileDataValue({ Id = projectileId, Property = "DamageRadiusScaleY"})
	end
	while ProjectileExists({ Id = projectileId }) do
		if projectileId then
			local projectileLocation = GetLocation({Id = projectileId, IsProjectile = true })
			if projectileLocation.X and projectileLocation.Y then
				Destroy({Id = tempObstacleId})	
				range = GetProjectileProperty({ ProjectileId = projectileId, Property = "ModifiedDamageRadius" })
				tempObstacleId = SpawnObstacle({ Name = "InvisibleTarget", LocationX = projectileLocation.X, LocationY= projectileLocation.Y})
			else
				-- projectile likely destroyed, clean up and early exit
				Destroy({Id = tempObstacleId})	
				return
			end
		end
		thread( CreateZeusBolt, {
		SourceId = tempObstacleId,
		Range = range, 
		SeekTarget = true,
		WeaponName = "WeaponCastYM",
		YScale = yScale,
		ProjectileName = functionArgs.ProjectileName, 
		DamageMultiplier = functionArgs.DamageMultiplier,
		InitialDelay = 0,
		Delay = 0.1, 
		Count = 1 })
		waitUnmodified( functionArgs.StrikeInterval * GetTotalHeroTraitValue("CastDurationMultiplier", { IsMultiplier = true }), RoomThreadName )
		strikeCount = strikeCount + 1
	end
	Destroy({ Id = tempObstacleId})
end

--Hera
function mod.HeraCastCountBlastYM( weaponData, traitArgs, triggerArgs )

	if not triggerArgs.ProjectileX or not triggerArgs.ProjectileY or not triggerArgs.ProjectileId then
		return
	end
	local delay = traitArgs.Delay or 0
	waitUnmodified( delay )
	if ProjectileExists({ Id = triggerArgs.ProjectileId }) then
		local castCount = 0
		for id, enemy in pairs( ShallowCopyTable( ActiveEnemies ) ) do
			if enemy and enemy.ActiveEffects and enemy.ActiveEffects.ImpactSlowYM then
				castCount = castCount + 1
			end
		end

		local modifier = GetProjectileProperty({ ProjectileId = triggerArgs.ProjectileId, Property = "BlastRadiusModifier" })
		CreateProjectileFromUnit({ Name = traitArgs.ProjectileName, BlastRadiusModifier = modifier, ProjectileDestinationId = triggerArgs.ProjectileId, Id = CurrentRun.Hero.ObjectId, DamageMultiplier = traitArgs.DamageMultiplier * castCount, FireFromTarget = true })
	end
end

function mod.CheckApplyDamageShareYM( victim, functionArgs, triggerArgs )
	if triggerArgs.EffectName == "ImpactSlowYM" then
		ApplyDamageShare( victim, functionArgs, triggerArgs )
	end
end

-- Posideon
function mod.CheckSlipApplyYM( victim, functionArgs, triggerArgs )
	if triggerArgs.EffectName == "ImpactSlowYM" then
		local effectName = functionArgs.EffectName
		local dataProperties = EffectData[effectName].EffectData
		ApplyEffect({ DestinationId = victim.ObjectId, Id = CurrentRun.Hero.ObjectId, EffectName = effectName, DataProperties = dataProperties})
	end
end

--Apollo
function mod.CheckBlindApplyYM( victim, functionArgs, triggerArgs )
	if triggerArgs.EffectName == "ImpactSlowYM" then
		local effectName = functionArgs.EffectName
		local dataProperties = EffectData[effectName].EffectData
		ApplyEffect({ DestinationId = victim.ObjectId, Id = CurrentRun.Hero.ObjectId, EffectName = effectName, DataProperties = dataProperties})
	end
end

--Aphrodite
function mod.CheckProjectilePullYM(weaponData, traitArgs, triggerArgs )
	local baseDuration = GetProjectileDataValue({ Id = CurrentRun.Hero.ObjectId, WeaponName = "WeaponCastYM", Property = "FuseStart" }) / GetTotalHeroTraitValue("CastDurationMultiplier", { IsMultiplier = true })
	local tempObstacleId = SpawnObstacle({ Name = "InvisibleTarget", LocationX = triggerArgs.ProjectileX, LocationY= triggerArgs.ProjectileY })
	traitArgs.PullCount = baseDuration / traitArgs.Interval
	thread( ManageProjectilePull, traitArgs, tempObstacleId, triggerArgs.ProjectileId )
end

function mod.CheckCastAphroditeVulnerabilityApplyYM( victim, functionArgs, triggerArgs )
	if triggerArgs.EffectName == "ImpactSlowYM" and victim.ActivationFinished then
		local effectName = functionArgs.EffectName 	
		ApplyAphroditeVulnerability( victim, functionArgs, triggerArgs )
	end
end

-- Hestia

function mod.CheckCastBurnApplyYM( victim, functionArgs, projectileId )
	if CheckCooldown("CastBurnApply"..victim.ObjectId..projectileId, functionArgs.Cooldown * GetTotalHeroTraitValue("CastDurationMultiplier", { IsMultiplier = true }) ) then
		local damageMultiplier = CalculateDamageMultipliers( CurrentRun.Hero, victim, WeaponData.WeaponCastYM, { SourceWeapon = "WeaponCastYM", ExplicitMultipliersOnly = true })
		functionArgs = ShallowCopyTable(functionArgs)
		functionArgs.NumStacks = round(functionArgs.NumStacks * damageMultiplier)
		ApplyBurn( victim, functionArgs, triggerArgs )
	end
end

-- Ares

function mod.CheckAresCurseApplyYM( victim, functionArgs, triggerArgs )
	if triggerArgs.EffectName == "ImpactSlowYM" and not triggerArgs.Reapplied then
		local dataProperties = {}
		local blastModifier = 1
		local count = 1
		for _, data in pairs(GetHeroTraitValues("AresSwordModifiers")) do
			if data.Fuse then
				dataProperties.FuseStart = data.Fuse
				dataProperties.Fuse = data.Fuse
			end
			if data.AoEMuliplier then
				blastModifier = blastModifier * data.AoEMuliplier
			end
			if data.AddCount then
				count = count + data.AddCount
			end
		end
		for i=1,count do
			dataProperties.StartDelay = i * 0.3
			CreateProjectileFromUnit({ 
				Name = functionArgs.ProjectileName, 
				DestinationId = victim.ObjectId, 
				Id = CurrentRun.Hero.ObjectId, 
				DamageMultiplier = functionArgs.DamageMultiplier, 
				FireFromTarget = true,
				BlastRadiusModifier = blastModifier,
				ScaleMultiplier = blastModifier,
				ProjectileCap = 4, 
				DataProperties = dataProperties
			})			
		end
	end
end