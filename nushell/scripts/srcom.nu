# written by graefchen
#
# The speedrun.com api in Nushell without authentification.
# Documentef here: https://github.com/speedruncomorg/api
# TODO: Use the nushell command `url build-query` for it
#       Instead ... of the mess I did.

def filter-empty []: record -> record {
	$in
	| transpose k v
	| where ($it.v | is-not-empty )
	| reduce -f {} {|i,a| $a | insert $i.k $i.v}
}

# the required BASE link
const BASE_LINK = "https://www.speedrun.com/api/v1/"

# region: categories
# endregions

# region: developer
# endregions

# region: embedding
# endregions

# region: engines

# https://github.com/speedruncomorg/api/blob/master/version1/engines.md

# return engines on speedrun.com
#
# as of 26.04.2025 there are 1126 games
# need to work with offset and max
export def engines [
	--offset(-O): int
	--max(-M): int
	--bulk(-B)
] {
	# TODO: maybe ask to update documentation(?)
	let query = (
		{"offset": $offset, "max": $max, "bulk": (if ($bulk) {"yes"})}
		| url build-query
	)

	let request = $"($BASE_LINK)engines?($query)"

	return (http get --allow-errors $request)
}

# get information about a engine by its id
export def "engines id" [
	id: string
] {
	let request = $"($BASE_LINK)engine/($id)"

	return (http get --allow-errors $request)
}

# endregions

# region: games

# https://github.com/speedruncomorg/api/blob/master/version1/games.md

# get information about a game by its id
#
# technically games/{id}
# to get a game you need to use `srcom games -n *NAMEOFTHEGAME*`
# to get the id of the game
export def "games id" [
	id: string
] {
	let request = $"($BASE_LINK)games/($id)"

	return (http get $request)
}

export def "games category" [
	id: string
	--miscellanious(-m) # filter out miscellanious
] {
	let request = $"($BASE_LINK)games/($id)/categories?miscellaneous=(if $miscellanious {"no"} else {"yes"})"

	return (http get $request)
}

export def "games levels" [
	id: string
] {
	let request = $"($BASE_LINK)games/($id)/levels"

	return (http get $request)
}

export def "games variables" [
	id: string
] {
	let request = $"($BASE_LINK)games/($id)/variables"

	return (http get $request)
}

export def "games derived-games" [
	id: string
] {
	let request = $"($BASE_LINK)games/($id)/derived-games"

	return (http get $request)
}

export def "games records" [
	id: string
] {
	let request = $"($BASE_LINK)games/($id)/records"

	return (http get $request)
}

# get info about a speedrun.com game
export def games [
	--name(-n): string
	--abbreviation(-a): string
	--released(-r): int
	--platform(-p): string # needs to platform ID
	--region(-R): string # needs the region ID
	--engine(-e): string # needs the engine ID
	--developer(-d): string # needs the developer ID
	--publisher(-p): string # needs the publisher ID
	--moderator(-m): string # needs the moderator ID
	--offset(-O): int
	--max(-M): int
	--bulk(-B)
] {
	let query = ({
			"name": $name,
			"abbreviation": $abbreviation,
			"released": $released,
			"platform": $platform,
			"region": $region,
			"engine": $engine,
			"developer": $developer,
			"publisher": $publisher,
			"moderator": $moderator,
			"offset": $offset,
			"max": $max,
			"bulk": (if ($bulk) {"yes"} else {null})
		} | filter-empty | url build-query)

	let request = $"($BASE_LINK)games?($query)"

	return (http get --allow-errors $request)
}

# endregion

# region: gametypes
# endregions

# region: genres
# endregions

# region: guest
# endregions

# region: leaderboards
# endregions

# region: levels
# endregions

# region: notification
# endregions

# region: pagination
# endregions

# region: platforms
# endregions

# region: profile
# endregions

# region: publishers
# endregions

# region: regions
# endregions

# region: runs
# endregions

# region: series
# endregions

# region: users
# endregions

# region: variables
# endregions


# the speedrun.com api
export def main [] {

}
