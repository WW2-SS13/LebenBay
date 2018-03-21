/turf/simulated/floor/plating/deathnet
	icon_state = "deathnet"

/turf/simulated/floor/plating/deathnet/New()
	..()
	deathnet_turfs += src

/turf/simulated/floor/plating/deathnet/Del()
	deathnet_turfs -= src
	..()

/turf/simulated/floor/plating/deathnet/process()
	create_fire(1000)
	for (var/mob/living/carbon/C in contents)
		C.emote("scream")
		C.Weaken(10)
		C.Stun(10)
		C.adjustFireLoss(500)
		// partially charge all SMES, fully charge one
		for (var/obj/machinery/power/smes/S in smes_list)
			S.deathnet_powered(1)
		var/obj/machinery/power/smes/S = pick(smes_list)
		S.deathnet_powered(10)
	return 1
