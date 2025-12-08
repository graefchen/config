# Written by graefchen
# based on: zeit 1.0.1
# link: https://github.com/mrusme/zeit

# TODO: Finish

# zeit block
export extern "zeit block" []

# Generate the autocompletion script for the specified shell
export extern "zeit completion" []

# zeit end
export extern "zeit end" []

# zeit export
export extern "zeit export" []

# Help about any command
export extern "zeit help" []

# zeit import
export extern "zeit import " []

# zeit project
export extern "zeit project" []

# zeit start
export extern "zeit start" []

# zeit stat
export extern "zeit stat" []

# zeit task
export extern "zeit task" []

# zeit version
export extern "zeit version" []


export extern "zeit" [
	--color              # When to display icons (always, auto, never) (default "auto")
	--debug              # Display debugging output in the console
	--format(-f): string # Output format (cli, json) (default "cli")
	--help(-h)           # help for zeit
]
