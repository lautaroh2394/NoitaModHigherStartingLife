function OnPlayerSpawned( player_entity )
    if tonumber(StatsGetValue("playtime")) > 1 then -- checks playtime, prevents additional spawns after first world load
		return
    end
    local multiplier = 5 -- Edit this. 100 * multiplier will be your starting life
    local damagemodels = EntityGetComponent( player_entity, "DamageModelComponent" )
	if( damagemodels ~= nil ) then
		for i,damagemodel in ipairs(damagemodels) do
            max_hp = tonumber( ComponentGetValue( damagemodel, "max_hp" ) ) * multiplier
            ComponentSetValue( damagemodel, "max_hp", max_hp)
            ComponentSetValue( damagemodel, "hp", max_hp)
		end
	end
end