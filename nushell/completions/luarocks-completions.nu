# Written by graefchen
# based on luarocks 3.9.2
# link: https://luarocks.org

# Show help for commands.
export extern "luarocks help" []

# Output a shell completion script.
export extern "luarocks completion" []

# Build/compile a rock.
export extern "luarocks build" []

# Query information about the LuaRocks configuration.
export extern "luarocks config" []

# Show documentation for an installed rock.
export extern "luarocks doc" []

# Download a specific rock file from a rocks server.
export extern "luarocks download" []

# Initialize a directory for a Lua project using LuaRocks.
export extern "luarocks init" []

# Install a rock.
export extern "luarocks install" []

# Check syntax of a rockspec.
export extern "luarocks lint" []

# List currently installed rocks.
export extern "luarocks list" []

# Compile package in current directory using a rockspec.
export extern "luarocks make" []

# Auto-write a rockspec for a new version of a rock.
export extern "luarocks new_version" []

# Create a rock, packing sources or binaries.
export extern "luarocks pack" []

# Return the currently configured package path.
export extern "luarocks path" []

# Remove all installed rocks from a tree.
export extern "luarocks purge" []

# Uninstall a rock.
export extern "luarocks remove" []

# Query the LuaRocks servers.
export extern "luarocks search" []

# Show information about an installed rock.
export extern "luarocks show" []

# Run the test suite in the current directory.
export extern "luarocks test" []

# Unpack the contents of a rock.
export extern "luarocks unpack" []

# Upload a rockspec to the public rocks repository.
export extern "luarocks upload" []

# Tell which file corresponds to a given module name.
export extern "luarocks which" []

# Write a template for a rockspec file.
export extern "luarocks write_rockspec" []

# luarocks (lua package manager)
export extern "luarocks" [
	--help(-h)             # Show this help message and exit.
	--version              # Show version info and exit.
	--dev                  # Enable the sub-repositories in rocks servers for rockspecs of in-development versions.
	--server: string       # Fetch rocks/rockspecs from this server (takes priority over config file).
	--only-server: string  # Fetch rocks/rockspecs from this server only (overrides any entries in the config file).
	--only-sources: string # Restrict downloads to paths matching the given URL.
	--namespace: string    # Specify the rocks server namespace to use.
	--lua-dir: any         # Which Lua installation to use.
	--lua-version: any     # Which Lua version to use.
	--tree: string         # Which tree to operate on.
	--local                # Use the tree in the user's home directory. To enable it, see 'luarocks help path'.
	--global               # Use the system tree when `local_by_default` is `true`.
	--no-project           # Do not use project tree even if running from a project folder.
	--verbose              # Display verbose output of commands executed.
	--timeout: number      # Timeout on network operations, in seconds. 0 means no timeout (wait forever). Default is 30.
]
