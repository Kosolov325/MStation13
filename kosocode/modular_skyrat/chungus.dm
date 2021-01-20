//abomination
/mob/living/simple_animal/pet/chungus
	icon = 'kosocode/modular_skyrat/icons/mob/chungus.dmi'
	icon_state = "chungus"
	name = "\proper Big Chungus"
	desc = "The beast itself."
	speak = list("Thanks for the gold, kind stranger!",
				"I am a cuck, AMA!",
				"Keanu Reeves!",
				"Wholesome 100!",
				"I hate fortnite!",
				"Pewdiepie plays minecraft!",
				"Big big chungus!",
				)
	var/chungus_music = 'kosocode/modular_skyrat/sound/chungus/bigchungus.ogg'
	speak_chance = 20

/mob/living/simple_animal/pet/chungus/BiologicalLife(seconds, times_fired)
	. = ..()
	//1% chance to play big chungus.ogg every 2 seconds
	if(chungus_music && prob(1))
		playsound(src, chungus_music, rand(50,100), 0)

//xom...
/mob/living/simple_animal/pet/chungus/xom
	name = "xom"
	desc = "This otherwordly creature keeps spouting senseless crap. Maybe you're just not wise enough to comprehend."
	icon_state = "xom"
	chungus_music = null
	var/icon_state_cool = "cooler_xom"
	var/static/list/funny = list(
		'modular_skyrat/sound/cultiste/cultiste_rire_1.ogg',
		'modular_skyrat/sound/cultiste/cultiste_rire_2.ogg',
		'modular_skyrat/sound/cultiste/cultiste_rire_3.ogg',
		'modular_skyrat/sound/cultiste/cultiste_rire_4.ogg',
		'modular_skyrat/sound/cultiste/cultiste_rire_5.ogg',
		'modular_skyrat/sound/cultiste/cultiste_rire_6.ogg',
	)
	var/list/possible_messages = list()
	speak_chance = 3

//client controlled xom can forcefully shitpost
/mob/living/simple_animal/pet/chungus/xom/verb/say_something_funny()
	set category = "IC"
	set name = "Say Something Funny"
	set desc = "Xom..."

	handle_automated_speech(TRUE)

//xom does not move unless they have a client
/mob/living/simple_animal/pet/chungus/xom/handle_automated_movement()
	return FALSE

//xom is quite funny
/mob/living/simple_animal/pet/chungus/xom/handle_automated_speech(override)
	set waitfor = FALSE
	if(prob(speak_chance) || override)
		//xom just says random shit someone has spouted in the round with a chance
		//to say a cringe word at the end (or nigger)
		var/list/cringe = list("nigger")
		cringe |= GLOB.in_character_filter
		var/message = "Penis guacamole!"
		if(!length(possible_messages) || prob(speak_chance))
			for(var/mob/living/L in GLOB.mob_living_list)
				var/log_source = L.logging
				for(var/log_type in log_source)//this whole loop puts the read-ee's say logs into say_log in an easy to access way
					var/nlog_type = text2num(log_type)
					if(nlog_type & LOG_SAY)
						var/list/bingus = log_source[log_type]
						if(islist(bingus))
							for(var/i in bingus)
								possible_messages |= bingus[i]
		if(length(possible_messages))
			message = pick(possible_messages)
		message = copytext(message, 1, findtext(message, "FORCED") || length(message))
		message = replacetext(message, "\"", "")
		if(config.punctuation_filter && !findtext(message, config.punctuation_filter, length(message)) && !(config.bingus_filter && findtext(message, config.bingus_filter, 1, 2)))
			message += "."
		say("[message] [capitalize(pick(cringe))]!", forced = TRUE)
		//sunglasses
		icon_state = icon_state_cool
		addtimer(CALLBACK(src, .proc/not_cool), 3 SECONDS)

//client controlled xom is always cool and laughing
/mob/living/simple_animal/pet/chungus/xom/say(message, bubble_type, list/spans, sanitize, datum/language/language, ignore_spam, forced)
	. = ..()
	//do the funny laugh
	playsound(src, pick(funny), 65, 0)
	//go sunglasses mode if you have a client :sunglasses:
	if(client)
		icon_state = icon_state_cool
		addtimer(CALLBACK(src, .proc/not_cool), 2 SECONDS)

//not cool anymore
/mob/living/simple_animal/pet/chungus/xom/proc/not_cool()
	icon_state = initial(icon_state)
