# Written by graefchen
# based on: zola 0.19.2
# link: https://github.com/getzola/zola

# Create a new Zola project
export extern "zola init" [
	...name: string # Name of the project. Will create a new directory with that name in the current directory [default: .]
	--force(-f)     # Force creation of project even if directory is non-empty
	--help(-h)      # Print help
]

# Deletes the output directory if there is one and builds the site
export extern "zola build" [
	--base-url(-u): string   # Force the base URL to be that value (defaults to the one in config.toml)
	--output-dir(-o): string # Outputs the generated site in the given path (by default 'public' dir in project rooot)
	--force(-f)              # Force building the site even if output directory is non-empty
	--drafts                 # Include drafts when loading the site
	--help(-h)               # Print help
]

# Serve the site. Rebuild and reload on change automatically
export extern "zola serve" [
	--interface(-i): string  # Interface to bind on [default: 127.0.0.1]
	--port(-p): string       # Which port to use [default: 1111]
	--output-dir(-o): string # Outputs assets of the generated site in the given path (by default 'public' dir in project root). HTML/XML will be stored in memory
	--force                  # Force use of the directory for serving the site even if output directory is non-empty
	--base-url(-u): string   # Changes the base_url
	--drafts                 # Include drafts when loading the site
	--open(-O)               # Open site in the default browser
	--fast(-f)               # Only rebuild the minimum on change - useful when working on a specific page/section
	--no-port-append         # Default append port to the base url
	--help(-h)               # Print help
]

# Try to build the project without rendering it. Checks links
export extern "zola check" [
	--drafts   # Include drafts when loading the site       
	--help(-h) # Print help
]

# Generate shell completion
export extern "zola completion" [
	...shell: string # Shell to generate completion for [possible values: bash, elvish, fish, powershell, zsh]
	--help(-h)       # Print help
]

# Print this message or the help of the given subcommand(s)
export extern "zola help" []

# A fast static site generator with everything built-in
export extern "zola" [
	--root(-r): string   # Directory to use as root of project [default: .]
	--config(-c): string # Path to a config file other than config.toml in the root of project [default: config.toml]
	--help(-h)           # Print help
	--version(-v)        # Print version
]