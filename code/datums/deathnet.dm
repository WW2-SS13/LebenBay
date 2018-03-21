/datum/deathnet
	var/next_start = -1

/datum/deathnet/New()
	..()
	if (!deathnet)
		deathnet = src

/datum/deathnet/Del()
	if (deathnet == src)
		deathnet = null
	..()

/datum/deathnet/proc/start()
	if (world.time < next_start)
		return 0
	for (var/turf in deathnet_turfs)
		var/turf/simulated/floor/plating/deathnet/D = turf
		D.process()
	next_start = world.time + 300
	return 1