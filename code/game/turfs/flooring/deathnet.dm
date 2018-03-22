/turf/simulated/floor/plating/deathnet
	icon_state = "deathnet"

/turf/simulated/floor/plating/deathnet/New()
	..()
	deathnet_turfs += src
	set_light(2,2,"#ffffff")

/turf/simulated/floor/plating/deathnet/Del()
	deathnet_turfs -= src
	..()

/turf/simulated/floor/plating/deathnet/process()
	for (var/v in 0 to 5)
		spawn (v*2)
			create_fire(5)
	for (var/mob/living/carbon/C in contents)
		if (C.stat != DEAD)
			C.emote("scream")
			C.Weaken(10)
			C.Stun(10)
			C.dust()
			// partially charge all SMES, "fully" charge one
			for (var/obj/machinery/power/smes/S in smes_list)
				S.deathnet_powered(1)
			var/obj/machinery/power/smes/S = pick(smes_list)
			S.deathnet_powered(10)
	return 1
