/datum/species/synth
	name = "Synthetic"
	id = "synth"
	say_mod = "states"
	sexes = 0
	species_traits = list(NOTRANSSTING,NOZOMBIE,ROBOTIC_LIMBS,NO_DNA_COPY,CAN_SCAR,HAS_FLESH,HAS_BONE) //all of these + whatever we inherit from the real species. I know you sick fucks want to fuck synths so yes you get genitals. Degenerates.
	inherent_traits = list(TRAIT_RADIMMUNE,TRAIT_NOCLONE,TRAIT_TOXINLOVER,TRAIT_NOBREATH,TRAIT_RESISTCOLD,TRAIT_RESISTLOWPRESSURE)
	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID
	dangerous_existence = 0 //not dangerous anymore i guess
	blacklisted = 0 //not blacklisted anymore
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/synthmeat
	gib_types = /obj/effect/gibspawner/robot
	damage_overlay_type = "robotic"
	limbs_id = SPECIES_SYNTH
	icon_limbs = 'kosocode/modular_skyrat/icons/mob/synth_parts.dmi'
	mutant_bodyparts = list()
	var/list/initial_species_traits = list(NOTRANSSTING,NOZOMBIE,ROBOTIC_LIMBS,NO_DNA_COPY) //for getting these values back for assume_disguise()
	var/list/initial_inherent_traits = list(TRAIT_RADIMMUNE,TRAIT_NOCLONE,TRAIT_TOXINLOVER,TRAIT_NOBREATH,TRAIT_RESISTCOLD,TRAIT_RESISTLOWPRESSURE) //blah blah i explained above
	var/disguise_fail_health = 45 //When their health gets to this level their synthflesh partially falls off
	var/datum/species/fake_species = null //a species to do most of our work for us, unless we're damaged
	var/isdisguised = FALSE //boolean to help us with disguising proper
	var/actualhealth = 100 //value we calculate to assume disguise and etc
	//Same organs as an IPC basically, to share functionality.
	mutant_heart = /obj/item/organ/heart/ipc
	mutantlungs = /obj/item/organ/lungs/ipc
	mutantliver = /obj/item/organ/liver/ipc
	mutantstomach = /obj/item/organ/stomach/ipc
	mutanteyes = /obj/item/organ/eyes/ipc
	mutantears = /obj/item/organ/ears/ipc
	mutanttongue = /obj/item/organ/tongue/robot/ipc
	mutant_brain = /obj/item/organ/brain/ipc
	//same damage as ipcs
	coldmod = 0.5
	burnmod = 1.1
	heatmod = 1.2
	brutemod = 1.1
	siemens_coeff = 1.2
	//Skyrat change - blood
	exotic_bloodtype = "SY"
	//Power cord so they no die hungry
	mutant_organs = list(/obj/item/organ/cyberimp/arm/power_cord)

/datum/species/synth/military
	name = "Military Synth"
	id = SPECIES_SYNTH_MIL
	armor = 25
	punchdamagelow = 10
	punchdamagehigh = 19
	punchstunthreshold = 14
	disguise_fail_health = 50

/datum/species/synth/proc/assume_disguise(datum/species/S, mob/living/carbon/human/H) //rework the proc for it to NOT fuck up with dunmer/other skyrat custom races
	if(S && !istype(S, type))
		name = S.name
		say_mod = S.say_mod
		sexes = S.sexes
		species_traits = initial_species_traits.Copy()
		inherent_traits = initial_inherent_traits.Copy()
		species_traits |= S.species_traits.Copy()
		inherent_traits |= (S.inherent_traits.Copy() - list(TRAIT_NOLIMBDISABLE, TRAIT_NODISMEMBER))
		attack_verb = S.attack_verb
		attack_sound = S.attack_sound
		miss_sound = S.miss_sound
		meat = S.meat
		nojumpsuit = S.nojumpsuit
		no_equip = S.no_equip.Copy()
		icon_limbs = S.icon_limbs
		limbs_id = S.limbs_id
		use_skintones = S.use_skintones
		fixed_mut_color = S.fixed_mut_color
		hair_color = S.hair_color
		mutant_bodyparts = S.mutant_bodyparts.Copy()
		isdisguised = TRUE
		fake_species = copify_species(S)
	else
		name = initial(name)
		say_mod = initial(say_mod)
		species_traits = initial_species_traits.Copy()
		inherent_traits = initial_inherent_traits.Copy()
		attack_verb = initial(attack_verb)
		attack_sound = initial(attack_sound)
		miss_sound = initial(miss_sound)
		nojumpsuit = initial(nojumpsuit)
		no_equip = list()
		meat = initial(meat)
		icon_limbs = initial(icon_limbs)
		limbs_id = initial(limbs_id)
		use_skintones = initial(use_skintones)
		sexes = initial(sexes)
		fixed_mut_color = ""
		hair_color = ""
		mutant_bodyparts = list()
		isdisguised = FALSE
		fake_species = new /datum/species/human()

	H.regenerate_icons()
	handle_mutant_bodyparts(H)
	H.update_body_parts(force = TRUE)

/datum/species/synth/on_species_gain(mob/living/carbon/human/H, datum/species/old_species)
	. = ..()
	//H.grant_language(/datum/language/machine)
	RegisterSignal(H, COMSIG_MOB_SAY, .proc/handle_speech)
	assume_disguise(old_species, H)

/datum/species/synth/on_species_loss(mob/living/carbon/human/H)
	. = ..()
	//H.remove_language(/datum/language/machine)
	UnregisterSignal(H, COMSIG_MOB_SAY)
	H.set_species(fake_species)

/datum/species/synth/proc/handle_speech(datum/source, list/speech_args)
	if(ishuman(source))
		var/mob/living/carbon/human/H = source
		actualhealth = (100 - (H.getBruteLoss() + H.getFireLoss() + H.getOxyLoss() + H.getToxLoss() + H.getCloneLoss()))
		if(!isdisguised || (actualhealth < disguise_fail_health))
			speech_args[SPEECH_SPANS] |= SPAN_ROBOT
	return

/datum/species/synth/proc/unassume_disguise(mob/living/carbon/human/H)
	name = initial(name)
	say_mod = initial(say_mod)
	species_traits = initial_species_traits.Copy()
	inherent_traits = initial_inherent_traits.Copy()
	attack_verb = initial(attack_verb)
	attack_sound = initial(attack_sound)
	miss_sound = initial(miss_sound)
	nojumpsuit = initial(nojumpsuit)
	no_equip = list()
	meat = initial(meat)
	limbs_id = initial(limbs_id)
	use_skintones = initial(use_skintones)
	sexes = initial(sexes)
	fixed_mut_color = ""
	hair_color = ""
	mutant_bodyparts = list()
	isdisguised = FALSE

	H.regenerate_icons()
	handle_mutant_bodyparts(H)
	H.update_body_parts()

/datum/species/synth/spec_life(mob/living/carbon/human/H)
	. = ..()
	actualhealth = (100 - (H.getBruteLoss() + H.getFireLoss() + H.getOxyLoss() + H.getToxLoss() + H.getCloneLoss()))
	if((actualhealth < disguise_fail_health) && isdisguised)
		unassume_disguise(H)
		H.visible_message("<span class='danger'>[H]'s disguise falls apart!</span>", "<span class='userdanger'>Your disguise falls apart!</span>")
	else if((actualhealth >= disguise_fail_health) && !isdisguised && (H.stat != DEAD))
		assume_disguise(fake_species, H)
		H.visible_message("<span class='warning'>[H] morphs their appearance to that of \a [fake_species.name].</span>", "<span class='notice'>You morph your appearance to that of [fake_species.name].</span>")

/datum/species/synth/handle_hair(mob/living/carbon/human/H, forced_colour)
	if(fake_species && isdisguised)
		return fake_species.handle_hair(H, forced_colour)
	else
		return ..()

/datum/species/synth/handle_body(mob/living/carbon/human/H)
	if(fake_species && isdisguised)
		return fake_species.handle_body(H)
	else
		return ..()

/datum/species/synth/handle_mutant_bodyparts(mob/living/carbon/human/H, forced_colour)
	if(fake_species && isdisguised)
		return fake_species.handle_mutant_bodyparts(H,forced_colour)
	else
		return ..()
