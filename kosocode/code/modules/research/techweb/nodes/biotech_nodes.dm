/datum/techweb_node/biotech
	id = "biotech"
	display_name = "Biological Technology"
	description = "What makes us tick."	//the MC, silly!
	prereq_ids = list("base")
	design_ids = list("medicalkit", "chem_heater", "chem_master", "chem_dispenser", "sleeper", "vr_sleeper", "pandemic", "defibrillator", "defibmount", "operating", "soda_dispenser", "beer_dispenser", "healthanalyzer", "blood_bag", "bloodbankgen", "telescopiciv", "medspray","genescanner","chem_pack", "portable_chem_mixer", "syringegun")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)