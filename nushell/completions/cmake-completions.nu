# Written by graefchen
# based on: cmake version 3.30.1
# link: https://cmake.org

# The CMake Software Build System
export extern "cmake" [
	path: string
	-S: string                    # Explicitly specify a source directory.
	-B: string                    # Explicitly specify a build directory.
	-C: string                    # Pre-load a script to populate the cache.
	-D: string                    # Create or update a cmake cache entry.
	-U: string                    # Remove matching entries from CMake cache.
	-G: string                    # Specify a build system generator.
	-T: string                    # Specify toolset name if supported by generator.
	-A: string                    # Specify platform name if supported by generator.
	--toolchain: string           # Specify toolchain file [CMAKE_TOOLCHAIN_FILE].
	--install-prefix: string      # Specify install directory [CMAKE_INSTALL_PREFIX].--preset: string # Specify a configure preset.
	-E                            # CMake command mode.
	--fresh                       # Configure a fresh build tree, removing any existing cache file.
	--build: string               # Build a CMake-generated project binary tree.
	--install: string             # Install a CMake-generated project binary tree.
	--open: string                # Open generated project in the associated application.
	-N                            # View mode only.
	-P: string                    # Process script mode.
	--find-package                # Legacy pkg-config like mode.  Do not use.
	--system-information: string  # Dump information about this system.
	--log-context                 # Prepend log messages with context, if given
	--debug-trycompile            # Do not delete the try_compile build tree. Only useful on one try_compile at a time.
	--debug-output                # Put cmake in a debug mode.
	--debug-find                  # Put cmake find in a debug mode.
	--trace                       # Put cmake in trace mode.
	--trace-expand                # Put cmake in trace mode with variable expansion.
	--warn-uninitialized          # Warn about uninitialized values.
	--no-warn-unused-cli          # Don't warn about command line options.
	--check-system-vars           # Find problems with variable usage in system files.
	--compile-no-warning-as-error # Ignore COMPILE_WARNING_AS_ERROR property and CMAKE_COMPILE_WARNING_AS_ERROR variable.
	--help(-h)                    # Print usage information and exit.
	--version                     # Print version number and exit.
	--help: string                # Print help for one keyword and exit.
	--help-full: string           # Print all help manuals and exit.
	--help-manual: string         # Print one help manual and exit.
	--help-manual-list: string    # List help manuals available and exit.
	--help-command: string        # Print help for one command and exit.
	--help-command-list: string   # List commands with help available and exit.
	--help-commands: string       # Print cmake-commands manual and exit.
	--help-module: string         # Print help for one module and exit.
	--help-module-list: string    # List modules with help available and exit.
	--help-modules: string        # Print cmake-modules manual and exit.
	--help-policy: string         # Print help for one policy and exit.
	--help-policy-list: string    # List policies with help available and exit.
	--help-policies: string       # Print cmake-policies manual and exit.
	--help-property: string       # Print help for one property and exit.
	--help-property-list: string  # List properties with help available and exit.
	--help-properties: string     # Print cmake-properties manual and exit.
	--help-variable var: string   # Print help for one variable and exit.
	--help-variable-list: string  # List variables with help available and exit.
	--help-variables: string      # Print cmake-variables manual and exit.
]