# Written by graefchen
# based on: pip 24.3.1
# link: https://www.python.org

# TODO: Finish

# Install packages.
export extern "pip install" []

# Download packages.
export extern "pip download" []

# Uninstall packages.
export extern "pip uninstall" []

# Output installed packages in requirements format.
export extern "pip freeze" []

# Inspect the python environment.
export extern "pip inspect" []

# List installed packages.
export extern "pip list" []

# Show information about installed packages.
export extern "pip show" []

# Verify installed packages have compatible dependencies.
export extern "pip check" []

# Manage local and global configuration.
export extern "pip config" []

# Search PyPI for packages.
export extern "pip search" []

# Inspect and manage pip's wheel cache.
export extern "pip cache" []

# Inspect information available from package indexes.
export extern "pip index" []

# Build wheels from your requirements.
export extern "pip wheel" []

# Compute hashes of package archives.
export extern "pip hash" []

# A helper command used for command completion.
export extern "pip completion" []

# Show information useful for debugging.
export extern "pip debug" []

# Show help for commands.
export extern "pip help" []

# Python is a programming language that lets you work quickly and integrate systems more effectively.
export extern "pip" [
	--version(-v) # Show the version number
	--help(-h)    # Show this help text
	...args
]
