# Written by graefchen
# based on: alire 2.1.0
# link: https://ada-lang.io

# TODO: (2025-08-03) Finish all of the completions.

# Shows help on the given command/topic
export extern "alr help" []

# Inspect and manage Alire's cache
export extern "alr cache" []

# List, Get, Set or Unset Alire settings options
export extern "alr settings" []

# Deprecated command. Please use `alr settings` instead.
export extern "alr config" []

# Manage installation prefixes
export extern "alr install" []

# Select Alire's preferred toolchain
export extern "alr toolchain" []

# Show detailed version, configuration, and environment information
export extern "alr version" []

# Fetch a published crate
export extern "alr get" []

# Manage indexes used by current configuration
export extern "alr index" []

# Search for a string in names and properties of crates
export extern "alr search" []

# Display information about a crate version
export extern "alr show" []

# Build the library or executables of the crate
export extern "alr build" []

# Clean generated files or downloaded dependencies
export extern "alr clean" []

# Start an editor with Alire build environment setup
export extern "alr edit" []

# Run the given command in the alire project context
export extern "alr exec" []

# Create a new crate for an executable or library
export extern "alr init" []

# Pin dependencies to exact versions
export extern "alr pin" []

# Print the build environment variables
export extern "alr printenv" []

# Launch an executable built by the crate
export extern "alr run" []

# Update some or all dependencies to a newer version
export extern "alr update" []

# Add or remove dependencies
export extern "alr with" []

# List or manually trigger action hooks
export extern "alr action" []

# Developer helpers
export extern "alr dev" []

# Test the compilation of all or some releases
export extern "alr test" []

# Help publishing a new version of a crate
export extern "alr publish" []

# alr 2.1.0
export extern alr [
  --settings(-s): path   # Override settings folder location
  --chdir(-C): path      # Run `alr` in the given directory
  --force(-f)            # Keep going after a recoverable troublesome situation
  --non-interactive(-n)  # Assume default answers for all user prompts
  --format               # Use structured output for tables (JSON, TOML)
  --no-color             # Disables colors in output. Default when NO_COLOR is defined in the environment.
  --no-tty               # Disables control characters in output
  --prefer-oldest        # Prefer oldest versions instead of newest when resolving dependencies
  --version              # Displays version and exits
  -q                     # Limit output to errors
  -v                     # Be more verbose (use twice for extra detail)
  --debug(-d)            # Enable debug-specific log messages
]
