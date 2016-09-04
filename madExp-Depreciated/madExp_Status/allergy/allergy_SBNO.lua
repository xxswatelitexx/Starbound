--How this essentially is set up is first we use the status effect file to define if an allergy exists. 
--We do this by writing the exact race name in the species file ( capitalization matters ) 
--Then assign the value 1 [ True ] if an allergy is present for that food. 
--If the allergy is present a different action occurs if not than something else happens.
--So a question may be for custom race authors: Do I need to patch all food files then?
--A: No, because a default value is given as 0 if the race is not mentioned. Only need to patch foods which have allergies for that race.
--There also many ways to make it so certain races face much more severe effects etc. But I will let you figure that part on your own.

function init()
	playerSpecies = world.entitySpecies(entity.id())
	world.logInfo(effect.configParameter(playerSpecies, 0).." Species Check")
	hasAllergy = effect.configParameter(playerSpecies, 0)
	world.logInfo(hasAllergy.." Has allergy value")
	
	if hasAllergy == 0 then
		world.logInfo("Does not have Allergy")
		else
		world.logInfo("Has Allergy")
	end
end

function update(dt)
end

function uninit()
end