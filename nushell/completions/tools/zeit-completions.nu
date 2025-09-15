# Written by graefchen
# based on: zeit 0.0.8
# link: https://github.com/mrusme/zeit

# TODO: Finish

# Generate the autocompletion script for the specified shell
export extern "zeit completion" []

# Display or update activity
export extern "zeit entry" []

# Erase activity
export extern "zeit erase" []

# Export tracked activities
export extern "zeit export" []

# Finish currently running activity
export extern "zeit finish" []

# Help about any command
export extern "zeit help" []

# Import tracked activities
export extern "zeit import" []

# List activities
export extern "zeit list" []

# Project settings
export extern "zeit project" []

# Display activity statistics
export extern "zeit stats" []

# Task settings
export extern "zeit task" []

# Tracking time
export extern "zeit track" []

# Currently tracking activity
export extern "zeit tracking" []

# Display what Zeit it is
export extern "zeit version" []

export extern "zeit" [
	--help(-h)       # help for zeit
	--no-colors  # Do not use colors in output
]
