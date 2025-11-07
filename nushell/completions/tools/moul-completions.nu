# Written by graefchen
# based on: moul 3.2.3
# link: https://github.com/moul-co/moul

# Create photo collection
export extern "moul create" [
	--help(-h) # help for create
]

# Export photo collection
export extern "moul export" [
	--help(-h)  # help for export
	--o: string # output directory (default "dist")
	--v         # verbose output
]

# Help about any command
export extern "moul help" []

# Preview photo collection
export extern "moul preview" [
	--help(-h) # help for preview
]

# update to latest version
export extern "moul update" [
	--help(-h) # help for update
]

# Version
export extern "moul version" [
	--help(-h) # help for version
]

# The minimalist publishing tool for photographers
export extern "moul" [
	--help(-h)  # help for moul
]
