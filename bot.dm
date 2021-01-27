/datum/controller/subsystem/bot
	name = "bot"
	wait = 1000
	var/s = ""
	var/file = "/data/bot.txt"

/datum/controller/subsystem/bot/fire()
	var/sname = /datum/config_entry/string/servername
	var/counter = 0
	for(var/X in GLOB.clients)
		var/client/C = X
		if(!C)
			continue
		counter++

	s += counter
	s += sname

	text2file(s,file)