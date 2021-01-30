/obj/structure/closet/crate/hydroponics/job/PopulateContents()
	. = ..()
	new /obj/structure/beebox/unwrenched(src)
	new /obj/item/honey_frame(src)
	new /obj/item/honey_frame(src)
	new /obj/item/honey_frame(src)
	new /obj/item/queen_bee/bought(src)
	new /obj/item/clothing/head/beekeeper_head(src)
	new /obj/item/clothing/suit/beekeeper_suit(src)
	new /obj/item/melee/flyswatter(src)

/datum/job/hydro/after_spawn(mob/H, mob/M, latejoin = FALSE)
	. = ..()
	if (latejoin)
		return
	var/atom/A = new /obj/structure/closet/crate/hydroponics/job(get_turf(H))
	return A