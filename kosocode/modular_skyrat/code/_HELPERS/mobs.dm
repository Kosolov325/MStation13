/proc/copify_species(datum/species/tocopy)
	if(!istype(tocopy))
		return FALSE
	var/datum/D = new tocopy.type()
	for(var/V in (tocopy.vars - GLOB.duplicate_forbidden_vars - GLOB.duplicate_forbidden_vars_by_type[tocopy.type]))
		if(islist(tocopy.vars[V]))
			var/list/L = tocopy.vars[V]
			D.vars[V] = L.Copy()
		else if(istype(tocopy.vars[V], /datum/species))
			D.vars[V] = copify_species(tocopy.vars[V])
		else
			D.vars[V] = tocopy.vars[V]
	return D