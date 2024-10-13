# Written by graefchen
# based on: meson 1.4.1
# link: https://mesonbuild.com/index.html

# TODO: Finish

# Configure the project
export extern "meson setup" []

# Change project options
export extern "meson configure" []

# Generate release archive
export extern "meson dist" []

# Install the project
export extern "meson install" []

# Introspect project
export extern "meson introspect" []

# Create a new project
export extern "meson init" []

# Run tests
export extern "meson test" []

# Wrap tools
export extern "meson wrap" []

# Manage subprojects
export extern "meson subprojects" []

# Modify the project definition
export extern "meson rewrite" []

# Build the project
export extern "meson compile" []

# Run commands in developer environment
export extern "meson devenv" []

# Convert current environment to a cross or native file
export extern "meson env2mfile" []

def "nu-complete meson help" [] {
	[ 'setup' 'configure' 'dist' 'install' 'introspect' 'init' 'test' 'wrap' 'subprojects' 'rewrite' 'compile' 'devenv' 'env2mfile' ]
}

# Print help of a subcommand
export extern "meson help" [
	command: string@"nu-complete meson help"
]

# The Meson Build system
export extern "meson" [
	--help(-h) # show this help message and exit
	--version: # show the current version of meson
]