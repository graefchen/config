# written by graefchen

# The speedrun.com api in Nushell without authentification.
# Documentet from here: https://github.com/speedruncomorg/api


const REQ_LINK = "https://www.speedrun.com/api/v1/"

# https://github.com/speedruncomorg/api/blob/master/version1/games.md
def "srcom games" [
	--name(-n): string
	--bulk(-b)
] {
	mut request = $"($REQ_LINK)games?"
	if ($name | is-not-empty) {
		$request += $"name=\"($name)\""
	} else if $bulk {
		$request += "_bulk=yes"
	}

	return (http get $request)
}

# technically games/{id}
def "srcom games id" [
	id: string
] {
	mut request = $"($REQ_LINK)games/($id)"

	return (http get $request)
}

def "srcom games category" [
	id: string
] {
	mut request = $"($REQ_LINK)games/($id)/categories"

	return (http get $request)
}

def "srcom games levels" [
	id: string
] {
	mut request = $"($REQ_LINK)games/($id)/levels"

	return (http get $request)
}

def "srcom games variables" [
	id: string
] {
	mut request = $"($REQ_LINK)games/($id)/variables"

	return (http get $request)
}

def "srcom games derived-games" [
	id: string
] {
	mut request = $"($REQ_LINK)games/($id)/derived-games"

	return (http get $request)
}

def "srcom games records" [
	id: string
] {
	mut request = $"($REQ_LINK)games/($id)/records"

	return (http get $request)
}



def srcom [] {

}
