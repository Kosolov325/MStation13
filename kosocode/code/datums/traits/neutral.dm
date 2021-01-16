//Kosolov
/datum/quirk/synthetic
	name = "Synthetic"
	desc = "You're not actually the species you seem to be. You're a synth! You generally function in the same manner as IPCs, but with a organic skin hiding your true self."
	value = 0
	mob_trait = TRAIT_SYNTH
	languagewhitelist =list("Encoded Audio Language")
	var/list/blacklistedspecies = list(/datum/species/synth, /datum/species/android, /datum/species/ipc, /datum/species/synthliz, /datum/species/shadow, /datum/species/plasmaman, /datum/species/jelly, /datum/species/jelly/slime)

/datum/quirk/synthetic/add()
	sleep(10)
	var/mob/living/carbon/human/H = quirk_holder
	if(istype(H))
		if(!(H.dna.species.type in blacklistedspecies))
			H.set_species(/datum/species/synth) //the synth on_gain stuff handles everything, that's why i made this shit a quirk and not a roundstart race or whatever
			return TRUE
	addtimer(CALLBACK(src, .proc/remove), 10)

/datum/quirk/synthetic/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/thespecies = H.dna.species
		if(thespecies.type == /datum/species/synth)
			var/datum/species/synth/synthspecies = thespecies
			var/datum/species/oldspecies = synthspecies.fake_species
			if(oldspecies)
				H.set_species(oldspecies)
			else
				H.set_species(/datum/species/ipc) //we fall back on IPC if something stinky happens. Shouldn't happe but you know.
				to_chat(H, "<span class='warning'>Uh oh, stinky! Something poopy happened to your fakespecies! You have been set to an IPC as a fallback.</span>") //shouldn't happen. if it does uh oh.
		else
			to_chat(H, "<span class='warning'>The [H.dna.species.name] species is blacklisted from being a synth. You will stay with the normal, non-synth race. It could mean that Bob Joga broke the code too.</span>")
//synth end
