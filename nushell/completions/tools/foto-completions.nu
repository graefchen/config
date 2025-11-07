# Written by graefchen
# based on: foto v1.5.1
# link: https://github.com/waynezhang/foto

# Clear local cache
export extern "foto clear-cache" [
	--help(-h) # help for clear-cache
]

# Generate the autocompletion script for the specified shell
export extern "foto completion" []

# Create a new site
export extern "foto create" [
	--help(-h) # help for create
]

# Export sites
export extern "foto export" [
	--help(-h)           # help for export
	--minimize(-m)       # Wether minimize output files(css, html, js supported) or not
	--output(-s): string # Output directory (default "dist")
]

# Help about any command
export extern "foto help" []

# Preview in local environment
export extern "foto preview" [
	--help(-h)      # help for preview   
	--port(-p): int # Port (default 5000)
]

# Print the version
export extern "foto version" [
	--help(-h) # help for version
]

# Yet another publishing tool for photographers
export extern "foto" [
	--help(-h)    # help for foto
	--verbose(-v) # verbose output
]
