/obj/item/melee/baton/blueshieldprod
	name = "\improper The electrifryer"
	desc = "A non-lethal takedown is always the most silent way to eliminate resistance."
	icon = 'kosocode/modular_skyrat/icons/obj/stunprod.dmi'
	icon_state = "bsprod"
	item_state = "bsprod"
	obj_flags = UNIQUE_RENAME
	lefthand_file = 'kosocode/modular_skyrat/icons/mob/inhands/weapons/melee_lefthand.dmi' //pissholder
	righthand_file = 'kosocode/modular_skyrat/icons/mob/inhands/weapons/melee_righthand.dmi' //placeholder fuck
	stamforce = 35 //considerably better than a normal baton
	hitcost = 600 //less energy cost per hit
	slot_flags = null //you'll have to put it on a belt or whatever
	force = 11
	attack_verb = list("prodded", "struck", "\"non-lethalled\"", "silent takedowned") //le deus ex
	w_class = WEIGHT_CLASS_SMALL //small but packs a PUNCH.
	preload_cell_type = /obj/item/stock_parts/cell/high/plus