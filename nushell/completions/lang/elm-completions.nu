# Written by graefchen
# based on: Elm 0.19.1
# link: https://elm-lang.org

# Open up an interactive programming session.
export extern "elm repl" [
	--help                      # Get bunch of additional details
	--interpreter=<interpreter> # Path to a alternate JS interpreter, like node or nodejs.
 	--no-colors                 # Turn off the colors in the REPL.
]

# Start an Elm project
export extern "elm init" [
	--help # Get bunch of additional details
]

# Compile code with a click.
export extern "elm reactor" [
	--help # Get bunch of additional details
]

# Compile Elm intp JS or HTML.
export extern "elm make" [
	--help     # Get bunch of additional details
	--debug    # Turn on the time-travelling debugger.
	--optimize #Turn on optimizations to make code smaller and faster.
]

# Fetch packages for your Elm project.
export extern "elm install" [
	--help # Get bunch of additional details
]

# Figuring out the next veriosn based on API changes.
export extern "elm bump" [
	--help # Get bunch of additional details
]

# Detect API changes.
export extern "elm diff" [
	--help # Get bunch of additional details
]

# Publish your package.
export extern "elm publish" [
	--help # Get bunch of additional details
]

# A delightful language for reliable webapps.
export extern "elm" [
	--help # Get bunch of additional details
]
