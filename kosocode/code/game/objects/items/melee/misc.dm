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


/obj/item/melee/baton/blueshieldprod/update_icon_state() // Thanks Trilby i nut -CinderWC
    if(turned_on)
        icon_state = "bsprod_active"
    else if(!cell)
        icon_state = "bsprod_nocell"
    else
        icon_state = "bsprod"

/obj/item/melee/baton/blueshieldprod/common_baton_melee(mob/M, mob/living/H, disarming = FALSE)
    if(iscyborg(M) || !isliving(M))        //can't baton cyborgs
        return FALSE
    if(!HAS_TRAIT(H, TRAIT_MINDSHIELD))
        clowning_around(H)
        return TRUE
    if(IS_STAMCRIT(H))            //CIT CHANGE - makes it impossible to baton in stamina softcrit
        to_chat(H, "<span class='danger'>You're too exhausted for that.</span>")
        return TRUE
    if(ishuman(M))
        var/mob/living/carbon/human/L = M
        if(check_martial_counter(L, H))
            return TRUE
    if(turned_on)
        if(baton_stun(M, H, disarming))
            H.do_attack_animation(M)
            H.adjustStaminaLoss(getweight())        //CIT CHANGE - makes stunbatonning others cost stamina
    else if(H.a_intent != INTENT_HARM)            //they'll try to bash in the last proc.
        M.visible_message("<span class='warning'>[H] has prodded [M] with [src]. Luckily it was off.</span>", \
                        "<span class='warning'>[H] has prodded you with [src]. Luckily it was off</span>")
    return disarming || (H.a_intent != INTENT_HARM)