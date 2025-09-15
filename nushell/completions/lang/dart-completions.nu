# Written by graefchen
# based on: go1.22.5
# link: https://go.dev

# TODO: Finish

# Analyze Dart code in a directory.
export extern "dart analyze" []

# Compile Dart to various formats.
export extern "dart compile" []

# Create a new Dart project.
export extern "dart create" []

# Open DevTools (optionally connecting to an existing application).
export extern "dart devtools" []

# Generate API documentation for Dart projects.
export extern "dart doc" []

# Apply automated fixes to Dart source code.
export extern "dart fix" []

# Idiomatically format Dart source code.
export extern "dart format" []

# Show diagnostic information about the installed tooling.
export extern "dart info" []

# Work with packages.
export extern "dart pub" []

# Run a Dart program.
export extern "dart run" []

# Run tests for a project.
export extern "dart test" []

def "nu-complete dart help" [] {
	[
		{ value: "analyze", description: "Analyze Dart code in a directory." },
		{ value: "compile", description: "Compile Dart to various formats." },
		{ value: "create", description: "Create a new Dart project." },
		{ value: "devtools", description: "Open DevTools (optionally connecting to an existing application)." },
		{ value: "doc", description: "Generate API documentation for Dart projects." },
		{ value: "fix", description: "Apply automated fixes to Dart source code." },
		{ value: "format", description: "Idiomatically format Dart source code." },
		{ value: "info", description: "Show diagnostic information about the installed tooling." },
		{ value: "pub", description: "Work with packages." },
		{ value: "run", description: "Run a Dart program." },
		{ value: "test", description: "Run tests for a project." }
	]
}

# Display help information for dart.
export extern "dart help" [
	command?: string@"nu-complete dart help"
	--help(-h) # Print this usage information
]

# A command-line utility for Dart development.
export extern "dart" [
	--verbose(-v)        # Show additional command output.
	--version            # Print the Dart SDK version.
	--enable-analytics   # Enable analytics.
	--disable-analytics  # Disable analytics.
	--suppress-analytics # Disallow analytics for this `dart *` run without changing the analytics configuration.
	--help(-h)           # Print this usage information.
]
