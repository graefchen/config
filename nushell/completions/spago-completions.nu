# Written by graefchen
# based on: spago 0.21.0
# link: https://github.com/purescript/spago

# Initialize a new sample project, or migrate a psc-package one
export extern "spago init" [
	--force(-f)       # Overwrite any project found in the current directory
	--no-comments(-C) # Generate package.dhall and spago.dhall files without tutorial comments
	--tag: string     # Optional package set tag to be used instead of the latest one.
	--help(-h)        # Show this help text
]

# Install the dependencies and compile the current package
export extern "spago build" [
	--watch(-w)             # Watch for changes in local files and automatically rebuild
	--clear-screen(-l)      # Clear the screen on rebuild (watch mode only)
	--allow-ignored(-I)     # Allow files ignored via .gitignore to trigger rebuilds (watch mode only)
	--path(-p): string      # Source path to include (in addition to paths in spago.dhall)
	--source-maps(-x)       # Whether to generate source maps for the bundle
	--no-install(-n)        # Don't run the automatic installation of packages
	--purs-args(-u): string # Arguments to pass to purs compile. Wrap in quotes.
	--deps-only             # Only use sources from dependencies, skipping the project sources.
	--before: string        # Commands to run before a build.
	--then: string          # Commands to run following a successful build.
	--else: string          # Commands to run following an unsuccessful build.
	--help(-h)              # Show this help text
]

# Start a REPL
export extern "spago repl" [
	--dependency(-d): string # Package name to add as a dependency
	--path(-p): string       # Source path to include (in addition to paths in spago.dhall)
	--purs-args(-u): string  # Arguments to pass to purs compile. Wrap in quotes.
	--repl-package: string   # The REPL package to use for evaluating expressions (default: "psci-support")
	--help(-h)               # Show this help text
]

# Test the project with some module, default Test.Main
export extern "spago test" [
	--main(-m): string      # Module to be used as the application's entry point
	--watch(-w)             # Watch for changes in local files and automatically rebuild
	--clear-screen(-l)      # Clear the screen on rebuild (watch mode only)
	--allow-ignored(-I)     # Allow files ignored via .gitignore to trigger rebuilds (watch mode only)
	--path(-p): string      # Source path to include (in addition to paths in spago.dhall)
	--source-maps(-x)       # Whether to generate source maps for the bundle
	--no-install(-n)        # Don't run the automatic installation of packages
	--purs-args(-u): string # Arguments to pass to purs compile. Wrap in quotes.
	--deps-only             # Only use sources from dependencies, skipping the project sources.
	--before: string        # Commands to run before a build.
	--then: string          # Commands to run following a successful build.
	--else: string          # Commands to run following an unsuccessful build.
	--exec-args(-b): string # Argument to pass to the backend (run/test only)
	--node-args(-a): string # Argument to pass to node (run/test only)
	--help(-h)              # Show this help text
]

# Runs the project with some module, default Main
export extern "spago run" [
	--main(-m): string      # Module to be used as the application's entry point
	--watch(-w)             # Watch for changes in local files and automatically rebuild
	--clear-screen(-l)      # Clear the screen on rebuild (watch mode only)
	--allow-ignored(-I)     # Allow files ignored via .gitignore to trigger rebuilds (watch mode only)
	--path(-p): string      # Source path to include (in addition to paths in spago.dhall)
	--source-maps(-x)       # Whether to generate source maps for the bundle
	--no-install(-n)        # Don't run the automatic installation of packages
	--purs-args(-u): string # Arguments to pass to purs compile. Wrap in quotes.
	--deps-only             # Only use sources from dependencies, skipping the project sources.
	--before: string        # Commands to run before a build.
	--then: string          # Commands to run following a successful build.
	--else: string          # Commands to run following an unsuccessful build.
	--exec-args(-b): string # Argument to pass to the backend (run/test only)
	--node-args(-a): string # Argument to pass to node (run/test only)
	--help(-h)              # Show this help text
]

# Bundle the project into an executable
export extern "spago bundle-app" [
	--main(-m): string      # Module to be used as the application's entry point
	--to(-t): string        # The target file path
	--platform(-p): string  # Bundle platform 'browser' (default) or 'node'
	--minify(-y)            # Minifies the bundle
	--no-build(-s)          # Skip build step
	--watch(-w)             # Watch for changes in local files and automatically rebuild
	--clear-screen(-l)      # Clear the screen on rebuild (watch mode only)
	--allow-ignored(-I)     # Allow files ignored via .gitignore to trigger rebuilds (watch mode only)
	--path(-p): string      # Source path to include (in addition to paths in spago.dhall)
	--source-maps(-x)       # Whether to generate source maps for the bundle
	--no-install(-n)        # Don't run the automatic installation of packages
	--purs-args(-u): string # Arguments to pass to purs compile. Wrap in quotes.
	--deps-only             # Only use sources from dependencies, skipping the project sources.
	--before: string        # Commands to run before a build.
	--then: string          # Commands to run following a successful build.
	--else: string          # Commands to run following an unsuccessful build.
	--help(-h)              # Show this help text
]

# Bundle the project into a module
export extern "spago bundle-module" [
	--main(-m): string      # Module to be used as the application's entry point
	--to(-t): string        # The target file path
	--platform(-p): string  # Bundle platform 'browser' (default) or 'node'
	--minify(-y)            # Minifies the bundle
	--no-build(-s)          # Skip build step
	--watch(-w)             # Watch for changes in local files and automatically rebuild
	--clear-screen(-l)      # Clear the screen on rebuild (watch mode only)
	--allow-ignored(-I)     # Allow files ignored via .gitignore to trigger rebuilds (watch mode only)
	--path(-p): string      # Source path to include (in addition to paths in spago.dhall)
	--source-maps(-x)       # Whether to generate source maps for the bundle
	--no-install(-n)        # Don't run the automatic installation of packages
	--purs-args(-u): string # Arguments to pass to purs compile. Wrap in quotes.
	--deps-only             # Only use sources from dependencies, skipping the project sources.
	--before: string        # Commands to run before a build.
	--then: string          # Commands to run following a successful build.
	--else: string          # Commands to run following an unsuccessful build.
	--help(-h)              # Show this help text
]

# Generate docs for the project and its dependencies
export extern "spago docs" [
	--format(-f): string # Docs output format (markdown | html | etags | ctags)
	--path(-p): string   # Source path to include (in addition to paths in spago.dhall)
	--deps-only          # Only use sources from dependencies, skipping the project sources.
	--no-search(-S)      # Do not make the documentation searchable
	--open(-o)           # Open generated documentation in browser (for HTML format only)
	--help(-h)           # Show this help text
]

# Start a search REPL to find definitions matching names and types
export extern "spago search" [
	--help(-h) # Show this help text
]

# Display paths used by the project
export extern "spago path" [
	--watch(-w)             # Watch for changes in local files and automatically rebuild
	--clear-screen(-l)      # Clear the screen on rebuild (watch mode only)
	--allow-ignored(-I)     # Allow files ignored via .gitignore to trigger rebuilds (watch mode only)
	--path(-p): string      # Source path to include (in addition to paths in spago.dhall)
	--source-maps(-x)       # Whether to generate source maps for the bundle
	--no-install(-n)        # Don't run the automatic installation of packages
	--purs-args(-u): string # Arguments to pass to purs compile. Wrap in quotes.
	--deps-only             # Only use sources from dependencies, skipping the project sources.
	--before: string        # Commands to run before a build.
	--then: string          # Commands to run following a successful build.
	--else: string          # Commands to run following an unsuccessful build.
	--help(-h)              # Show this help text
]

# List all the source paths (globs) for the dependencies of the project
export extern "spago sources" [
	--help(-h) # Show this help text
]

# Produce a new-style, Registry-compatible configuration file from the current one
export extern "spago migrate" [
	--help(-h) # Show this help text
]

# Install (download) all dependencies listed in spago.dhall
export extern "spago install" [
	PACKAGE?: string # Package name to add as dependency
	--help(-h)       # Show this help text
]

# List command. Supports: `packages`, `deps`
export extern "spago ls" [
	--help(-h) # Show this help text
]

# List packages available in the local package set
export extern "spago ls packages" [
	--json(-j) # Produce JSON output
	--help(-h) # Show this help text
]

# List dependencies of the project
export extern "spago ls deps" [
	--json(-j)       # Produce JSON output
	--transitive(-t) # Include transitive dependencies
	--help(-h)       # Show this help text
]

# Verify that a single package is consistent with the Package Set
export extern "spago verify" [
	PACKAGE?: string # Specify a package name. You can list them with `ls packages`
	--help(-h)       # Show this help text
]

# Verify that the whole Package Set builds correctly
export extern "spago verify-set" [
	--no-check-modules-unique(-M) # Skip checking whether modules names are unique across all packages.
	--help(-h)                    # Show this help text
]

# Upgrade the upstream in packages.dhall to the latest package-sets release
export extern "spago upgrade-set" [
	--tag: string # Optional package set tag to be used instead of the latest one.
	--help(-h)    # Show this help text
]

# Recompute the hashes for the package-set
export extern "spago freeze" [
	--help(-h) # Show this help tex
]

# Bump and tag a new version, and generate bower.json, in preparation for release.
export extern "spago bump-version" [
	--no-dry-run(-f) # Actually perform side-effects (the default is to describe what would be done)
	BUMP: string     # How to bump the version. Acceptable values: 'major','minor', 'patch', or a version (e.g. 'v1.2.3').
	--help(-h)       # Show this help text
]

# Run the selected file as a script with the specified dependencies and package set tag
export extern "spago script" [
	source?: string         # Source file to run as script
	--tag: string           # Optional package set tag to be used instead of the latest one.
	--dependency(-d):string # Package name to add as a dependency
	--purs-args(-u):string  # Arguments to pass to purs compile. Wrap in quotes.
	--before: string        # Commands to run before a build.
	--then: string          # Commands to run following a successful build.
	--else: string          # Commands to run following an
	--help(-h)              # Show this help text
]

# Show spago version
export extern "spago version" [
	--help(-h) # Show this help text
]

# Spago - manage your PureScript projects
export extern "spago" [
	--help(-h)                 # Show this help text
	--quiet(-q)                # Suppress all spago logging
	--verbose(-v)              # Enable additional debug logging, e.g. printing `purs` commands
	--very-verbose(-V)         # Enable more verbosity: timestamps and source locations
	--no-color                 # Log without ANSI color escape sequences
	--no-psa(-P)               # Don't build with `psa`, but use `purs`
	--jobs(-j): string         # Limit the amount of jobs that can run concurrently
	--config(-x):string        # Optional config path to be used instead of the default spago.dhall
	--global-cache(-c): string # Configure the global caching behaviour: skip it with `skip` or force update with `update`
	--version                  # Show spago version
]