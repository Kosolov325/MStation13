// ##################################################################################
// 							BRAZILIAN & MISC FOODS
// ##################################################################################

/obj/item/reagent_containers/food/snacks/trakinas
	name = "trakinas"
	desc = "The Classic."
	icon = 'icons/maconha/misc/foods.dmi'
	icon_state = "trakinas"
	trash = /obj/item/trash/trakinas
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/coco = 3, /datum/reagent/consumable/hot_coco = 1)
	junkiness = 20
	filling_color = "#D2691E"
	tastes = list("trakinas" = 1)
	foodtype = JUNKFOOD | SUGAR

/obj/item/trash/trakinas
	name = "trakinas"
	icon = 'icons/maconha/misc/foods.dmi'
	icon_state= "trakinas-trash"
