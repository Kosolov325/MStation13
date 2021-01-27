/*

### This file contains a list of all the areas in your station. Format is as follows:

/area/CATEGORY/OR/DESCRIPTOR/NAME 	(you can make as many subdivisions as you want)
	name = "NICE NAME" 				(not required but makes things really nice)
	icon = 'ICON FILENAME' 			(defaults to 'icons/turf/areas.dmi')
	icon_state = "NAME OF ICON" 	(defaults to "unknown" (blank))
	requires_power = FALSE 				(defaults to true)
	music = null					(defaults to nothing, look in sound/ambience for music)

NOTE: there are two lists of areas in the end of this file: centcom and station itself. Please maintain these lists valid. --rastaf0

*/


/*-----------------------------------------------------------------------------*/

/area/shuttle/cargo/CargoElevator
	name = "cargo elevator"
	has_gravity = FALSE

//Old Omega

/area/ruin/space/has_grav/oldomega/HigherHall
	name = "Old station Higher Hall"
	icon_state = "hallC"
	blob_allowed = FALSE

/area/ruin/space/has_grav/oldomega/LowerHall
	name = "Old station Lower Hall"
	icon_state = "hallC"
	blob_allowed = FALSE

/area/ruin/space/has_grav/oldomega/OldAtmos
	name = "Old station Atmospherics"
	icon_state = "atmos"
	blob_allowed = FALSE

/area/ruin/space/has_grav/oldomega/OldMedbay
	name = "Old station Med Bay"
	icon_state = "medbay"
	blob_allowed = FALSE

/area/ruin/space/has_grav/oldomega/LowerMaint
	name = "Old station Lower Maintenace"
	icon_state = "maintcentral"
	blob_allowed = FALSE

/area/ruin/space/has_grav/oldomega/OldSolars
	name = "Old station Solars"
	icon_state = "yellow"
	blob_allowed = FALSE

/area/ruin/space/has_grav/oldomega/HigherMaint
	name = "Old station Higher Maintenace"
	icon_state = "maintcentral"
	blob_allowed = FALSE

/area/ruin/space/has_grav/oldomega/TransitCenter
	name = "Old station Transit Center"
	icon_state = "blue"
	blob_allowed = FALSE

/area/ruin/space/has_grav/oldomega/OldStorage
	name = "Old station Storage"
	icon_state = "engi_storage"
	blob_allowed = FALSE

/area/ruin/space/has_grav/oldomega/OldOffice
	name = "Old station Office"
	icon_state = "blue"
	blob_allowed = FALSE

/area/ruin/space/has_grav/oldomega/OldEngi
	name = "Old station Engineering"
	icon_state = "engine_foyer"
	blob_allowed = FALSE

/area/bluespace_locker
  name = "Bluespace Locker"
  icon_state = "away"
  requires_power = FALSE
  has_gravity = STANDARD_GRAVITY
  noteleport = TRUE
  hidden = TRUE
