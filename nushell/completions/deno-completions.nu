# Written by greafchen
# Based on the deno 1.45.2
# link: https://github.com/denoland/deno

def "nu-complete deno run" [] {
	ls
	| get name
	| find --regex ".*(\\.(ts|js){1})+$"
}

def "nu-complete deno run ext" [] {
	["ts", "tsx", "js", "jsx"]
}

# Run a JavaScript or TypeScript program
export extern "deno run" [
	command?: string@"nu-complete deno run"
	# --no-check[=<NO_CHECK_TYPE>]
	--import-map: string # Load import map file from local file or remote URL
	--quiet(-q) # Suppress diagnostic output
	--no-remote # Do not resolve remote modules
	--no-npm    # Do not resolve npm modules
	# --node-modules-dir[=<node-modules-dir>]
	# --vendor[=<vendor>]
	--config(-c): path # The configuration file can be used to configure different aspects of deno including TypeScript, linting, and code formatting.
	--no-config # Disable automatic loading of the configuration file
	# -r, --reload[=<CACHE_BLOCKLIST>...]
	# --lock [<FILE>]
	--lock-write # Force overwriting the lock file.
	--no-lock    # Disable auto discovery of the lock file.
	--cert: path # Load certificate authority from PEM encoded file
	# --allow-read[=<PATH>...]
	# --deny-read[=<PATH>...]
	# --allow-write[=<PATH>...]
	# --allow-net[=<IP_OR_HOSTNAME>...]
	# --deny-net[=<IP_OR_HOSTNAME>...]
	# --unsafely-ignore-certificate-errors[=<HOSTNAMES>...]
	# --allow-env[=<VARIABLE_NAME>...]
	# --deny-env[=<VARIABLE_NAME>...]
	# --allow-sys[=<API_NAME>...]
	# --deny-sys[=<API_NAME>...]
	# --allow-run[=<PROGRAM_NAME>...
	# --deny-run[=<PROGRAM_NAME>...]
	# --allow-ffi[=<PATH>...]
	# --deny-ffi[=<PATH>...]
	--allow-hrtime  # Allow high-resolution time measurement.
	--deny-hrtime   # Deny high-resolution time measurement.
	--allow-all(-A) # Allow all permissions.
	--no-prompt     # Always throw if required permission wasn't passe
	# --inspect[=<HOST_AND_PORT>
	# --inspect-brk[=<HOST_AND_PORT>]
	# --inspect-wait[=<HOST_AND_PORT>]
	--cached-only # Require that remote dependencies are already cached
	# --location <HREF>
	# --v8-flags[=<v8-flags>...]
	--seed: int # Set the random number generator seed
	# --check[=<CHECK_TYPE>]
	# --watch[=<FILES>...]
	# --watch-exclude[=<FILES>...]
	--no-clear-screen                        # Do not clear terminal screen when under watch mode
	--ext: string@"nu-complete deno run ext" # Set content type of the supplied file
	# --env[=<FILE>]
	--no-code-cache                          # Disable V8 code cache feature
	--help(-h)                               # Print help (see a summary with '-h')
	--unstable                               # Enable unstable features and APIs
	--unstable-bare-node-builtins            # Enable unstable bare node builtins feature
	--unstable-byonm                         # Enable unstable 'bring your own node_modules' feature
	--unstable-sloppy-imports                # Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing.
	--unstable-broadcast-channel             # Enable unstable `BroadcastChannel` API
	--unstable-cron                          # Enable unstable Deno.cron API
	--unstable-ffi                           # Enable unstable FFI APIs
	--unstable-fs                            # Enable unstable file system APIs
	--unstable-http                          # Enable unstable HTTP APIs
	--unstable-kv                            # Enable unstable Key-Value store APIs
	--unstable-net                           # Enable unstable net APIs
	--unstable-process                       # Enable unstable process APIs
	--unstable-temporal                      # Enable unstable Temporal API
	--unstable-unsafe-proto                  # Enable unsafe __proto__ support. This is a security risk.
	--unstable-webgpu                        # Enable unstable `WebGPU` API
	--unstable-worker-options                # Enable unstable Web Worker APIs
]

# Run a server
export extern "deno serve" []

# Add dependencies
export extern "deno add" [
	packages: string
	--quiet(-q)                   # Suppress diagnostic output
	--help(-h)                    # Print help (see a summary with '-h')clear
	--unstable                    # Enable unstable features and APIs
	--unstable-bare-node-builtins # Enable unstable bare node builtins feature
	--unstable-byonm              # Enable unstable 'bring your own node_modules' feature
	--unstable-sloppy-imports     # Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing.
	--unstable-broadcast-channel  # Enable unstable `BroadcastChannel` API
	--unstable-cron               # Enable unstable Deno.cron API
	--unstable-ffi                # Enable unstable FFI APIs
	--unstable-fs                 # Enable unstable file system APIs
	--unstable-http               # Enable unstable HTTP APIs
	--unstable-kv                 # Enable unstable Key-Value store APIs
	--unstable-net                # Enable unstable net APIs
	--unstable-process            # Enable unstable process APIs
	--unstable-temporal           # Enable unstable Temporal API
	--unstable-unsafe-proto       # Enable unsafe __proto__ support. This is a security risk.
	--unstable-webgpu             # Enable unstable `WebGPU` API
	--unstable-worker-options     # Enable unstable Web Worker APIs
]

# Run benchmarks
export extern "deno bench" []

# Bundle module and dependencies into single file
export extern "deno bundle" []

# Cache the dependencies
export extern "deno cache" []

# Type-check the dependencies
export extern "deno check" []

# Compile the script into a self contained executable
export extern "deno compile" []

# Generate shell completions
export extern "deno completions" []

# Print coverage reports
export extern "deno coverage" []

# Show documentation for a module
export extern "deno doc" []

# Eval script
export extern "deno eval" []

def "nu-complete deno fmt ext"  [] {
	["ts", "tsx", "js", "jsx", "md", "json", "jsonc", "ipynb"]
}

def "nu-complete deno fmt prose-wrap" [] {
	["always", "never", "preserve"]
}

# Format source filescl
export extern "deno fmt" [
	--config(-c):path                                      # The configuration file can be used to configure different aspects of deno including TypeScript, linting, and code formatting.
	--no-config                                            # Disable automatic loading of the configuration file.
	--quiet(-q)                                            # Suppress diagnostic output
	--check                                                # Check if the source files are formatted
	--ext: string@"nu-complete deno fmt ext"               # Set content type of the supplied file
	# --ignore=<ignore>...
	--watch                                                # Watch for file changes and restart process automatically.
	# --watch-exclude[=<FILES>...]
	--no-clear-screen                                      # Do not clear terminal screen when under watch mode
	# --use-tabs[=<use-tabs>]
	--line-width: number                                   # Define maximum line width. Defaults to 80.
	--indent-width: number                                 # Define indentation width. Defaults to 2.
	# --single-quote[=<single-quote>]
	--prose-wrap: string@"nu-complete deno fmt prose-wrap" # Define how prose should be wrapped. Defaults to always.
	# --no-semicolons[=<no-semicolons>]
	--help(-h)                                             # Print help (see a summary with '-h')clear
	--version(-V)                                          # Print version
	--unstable                                             # Enable unstable features and APIs
	--unstable-bare-node-builtins                          # Enable unstable bare node builtins feature
	--unstable-byonm                                       # Enable unstable 'bring your own node_modules' feature
	--unstable-sloppy-imports                              # Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing.
	--unstable-broadcast-channel                           # Enable unstable `BroadcastChannel` API
	--unstable-cron                                        # Enable unstable Deno.cron API
	--unstable-ffi                                         # Enable unstable FFI APIs
	--unstable-fs                                          # Enable unstable file system APIs
	--unstable-http                                        # Enable unstable HTTP APIs
	--unstable-kv                                          # Enable unstable Key-Value store APIs
	--unstable-net                                         # Enable unstable net APIs
	--unstable-process                                     # Enable unstable process APIs
	--unstable-temporal                                    # Enable unstable Temporal API
	--unstable-unsafe-proto                                # Enable unsafe __proto__ support. This is a security risk.
	--unstable-webgpu                                      # Enable unstable `WebGPU` API
	--unstable-worker-options                              # Enable unstable Web Worker APIs
]

# Initialize a new project
export extern "deno init" [
	dir?: string
	--lib
	--quiet(-q)                   # Suppress diagnostic output
	--help(-h)                    # Print help (see a summary with '-h')clear
	--version(-V)                 # Print version
	--unstable                    # Enable unstable features and APIs
	--unstable-bare-node-builtins # Enable unstable bare node builtins feature
	--unstable-byonm              # Enable unstable 'bring your own node_modules' feature
	--unstable-sloppy-imports     # Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing.
	--unstable-broadcast-channel  # Enable unstable `BroadcastChannel` API
	--unstable-cron               # Enable unstable Deno.cron API
	--unstable-ffi                # Enable unstable FFI APIs
	--unstable-fs                 # Enable unstable file system APIs
	--unstable-http               # Enable unstable HTTP APIs
	--unstable-kv                 # Enable unstable Key-Value store APIs
	--unstable-net                # Enable unstable net APIs
	--unstable-process            # Enable unstable process APIs
	--unstable-temporal           # Enable unstable Temporal API
	--unstable-unsafe-proto       # Enable unsafe __proto__ support. This is a security risk.
	--unstable-webgpu             # Enable unstable `WebGPU` API
	--unstable-worker-options     # Enable unstable Web Worker APIs
]

# Show info about cache or info related to source file
export extern "deno info " []

# Install script as an executable
export extern "deno install" []

# Deno kernel for Jupyter notebooks
export extern "deno jupyter " []

# Uninstall a script previously installed with deno install
export extern "deno uninstall" []

# Start the language server
export extern "deno lsp" []

# Lint source files
export extern "deno lint" []

# Read Eval Print Loop
export extern "deno repl" [
	# --env[=<FILE>]
	# --no-check[=<NO_CHECK_TYPE>]
	--quiet(-q) # Suppress diagnostic output
	--import-map: string # Load import map file from local file or remote URL
	--no-remote # Do not resolve remote modules
	--no-npm    # Do not resolve npm modules
	# --node-modules-dir[=<node-modules-dir>]
	# --vendor[=<vendor>]
	--config(-c): path #The configuration file can be used to configure different aspects of deno including TypeScript, linting, and code formatting.
	--no-config # Disable automatic loading of the configuration file
	# -r, --reload[=<CACHE_BLOCKLIST>...]
	# --lock [<FILE>]
	--lock-write # Force overwriting the lock file.
	--no-lock    # Disable auto discovery of the lock file.
	--cert: path # Load certificate authority from PEM encoded file
	# --allow-read[=<PATH>...]
	# --deny-read[=<PATH>...]
	# --allow-write[=<PATH>...]
	# --allow-net[=<IP_OR_HOSTNAME>...]
	# --deny-net[=<IP_OR_HOSTNAME>...]
	# --unsafely-ignore-certificate-errors[=<HOSTNAMES>...]
	# --allow-env[=<VARIABLE_NAME>...]
	# --deny-env[=<VARIABLE_NAME>...]
	# --allow-sys[=<API_NAME>...]
	# --deny-sys[=<API_NAME>...]
	# --allow-run[=<PROGRAM_NAME>...
	# --deny-run[=<PROGRAM_NAME>...]
	# --allow-ffi[=<PATH>...]
	# --deny-ffi[=<PATH>...]
	--allow-hrtime  # Allow high-resolution time measurement.
	--deny-hrtime   # Deny high-resolution time measurement.
	--allow-all(-A) # Allow all permissions.
	--no-prompt     # Always throw if required permission wasn't passe
	# --inspect[=<HOST_AND_PORT>
	# --inspect-brk[=<HOST_AND_PORT>]
	# --inspect-wait[=<HOST_AND_PORT>]
	--cached-only # Require that remote dependencies are already cached
	# --location <HREF>
	# --v8-flags[=<v8-flags>...]
	--seed: int # Set the random number generator seed
	# --check[=<CHECK_TYPE>]
	# --eval-file=<eval-file>..
	# --eval <code>
	--help(-h)                    # Print help (see a summary with '-h')
	--unstable                    # Enable unstable features and APIs
	--unstable-bare-node-builtins # Enable unstable bare node builtins feature
	--unstable-byonm              # Enable unstable 'bring your own node_modules' feature
	--unstable-sloppy-imports     # Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing.
	--unstable-broadcast-channel  # Enable unstable `BroadcastChannel` API
	--unstable-cron               # Enable unstable Deno.cron API
	--unstable-ffi                # Enable unstable FFI APIs
	--unstable-fs                 # Enable unstable file system APIs
	--unstable-http               # Enable unstable HTTP APIs
	--unstable-kv                 # Enable unstable Key-Value store APIs
	--unstable-net                # Enable unstable net APIs
	--unstable-process            # Enable unstable process APIs
	--unstable-temporal           # Enable unstable Temporal API
	--unstable-unsafe-proto       # Enable unsafe __proto__ support. This is a security risk.
	--unstable-webgpu             # Enable unstable `WebGPU` API
	--unstable-worker-options     # Enable unstable Web Worker APIs
]

def "nu-complete deno task" [] {
	if ('.\deno.json' | path exists) == true {
		open .\deno.json
		| get tasks
		| transpose name command
		| each {|r| { value: $r.name, description: $r.command }}
	} else if ('.\deno.jsonc' | path exists) == true {
		open .\deno.jsonc
		| from json
		| get tasks
		| transpose name command
		| each {|r| { value: $r.name, description: $r.command }}
	}
}

# Run a task defined in the configuration file
export extern "deno task" [
	command?: string@"nu-complete deno task"
	--config(-c): path            # The configuration file can be used to configure different aspects of deno including TypeScript, linting, and code formatting.
	--cwd: path                   # Specify the directory to run the task in
	--quiet(-q)                   # Suppress diagnostic output
	--help(-h)                    # Print help (see a summary with '-h')
	--unstable                    # Enable unstable features and APIs
	--unstable-bare-node-builtins # Enable unstable bare node builtins feature
	--unstable-byonm              # Enable unstable 'bring your own node_modules' feature
	--unstable-sloppy-imports     # Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing.
	--unstable-broadcast-channel  # Enable unstable `BroadcastChannel` API
	--unstable-cron               # Enable unstable Deno.cron API
	--unstable-ffi                # Enable unstable FFI APIs
	--unstable-fs                 # Enable unstable file system APIs
	--unstable-http               # Enable unstable HTTP APIs
	--unstable-kv                 # Enable unstable Key-Value store APIs
	--unstable-net                # Enable unstable net APIs
	--unstable-process            # Enable unstable process APIs
	--unstable-temporal           # Enable unstable Temporal API
	--unstable-unsafe-proto       # Enable unsafe __proto__ support. This is a security risk.
	--unstable-webgpu             # Enable unstable `WebGPU` API
	--unstable-worker-options     # Enable unstable Web Worker APIs
]

# Run tests
export extern "deno test" []

# Print runtime TypeScript declarations.
export extern "deno types" [
	--quit(-q)                    # Suppress diagnostic outputclear
	--help(-h)                    # Print help (see a summary with '-h')
	--unstable                    # Enable unstable features and APIs
	--unstable-bare-node-builtins # Enable unstable bare node builtins feature
	--unstable-byonm              # Enable unstable 'bring your own node_modules' feature
	--unstable-sloppy-imports     # Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing.
	--unstable-broadcast-channel  # Enable unstable `BroadcastChannel` API
	--unstable-cron               # Enable unstable Deno.cron API
	--unstable-ffi                # Enable unstable FFI APIs
	--unstable-fs                 # Enable unstable file system APIs
	--unstable-http               # Enable unstable HTTP APIs
	--unstable-kv                 # Enable unstable Key-Value store APIs
	--unstable-net                # Enable unstable net APIs
	--unstable-process            # Enable unstable process APIs
	--unstable-temporal           # Enable unstable Temporal API
	--unstable-unsafe-proto       # Enable unsafe __proto__ support. This is a security risk.
	--unstable-webgpu             # Enable unstable `WebGPU` API
	--unstable-worker-options     # Enable unstable Web Worker APIs
]

# Upgrade deno executable to given version. Defaults to latest.
export extern "deno upgrade" [
	# --version <version>
	# --output <output>
	--quiet(-q)                   # Suppress diagnostic output
	--dry-run                     #  Perform all checks without replacing old exe
	--force(-f)                   # Replace current exe even if not out-of-date
	--canary                      # Upgrade to canary builds
	--cert: path                  # Load certificate authority from PEM encoded file
	--help(-h)                    # Print help (see a summary with '-h')
	--unstable                    # Enable unstable features and APIs
	--unstable-bare-node-builtins # Enable unstable bare node builtins feature
	--unstable-byonm              # Enable unstable 'bring your own node_modules' feature
	--unstable-sloppy-imports     # Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing.
	--unstable-broadcast-channel  # Enable unstable `BroadcastChannel` API
	--unstable-cron               # Enable unstable Deno.cron API
	--unstable-ffi                # Enable unstable FFI APIs
	--unstable-fs                 # Enable unstable file system APIs
	--unstable-http               # Enable unstable HTTP APIs
	--unstable-kv                 # Enable unstable Key-Value store APIs
	--unstable-net                # Enable unstable net APIs
	--unstable-process            # Enable unstable process APIs
	--unstable-temporal           # Enable unstable Temporal API
	--unstable-unsafe-proto       # Enable unsafe __proto__ support. This is a security risk.
	--unstable-webgpu             # Enable unstable `WebGPU` API
	--unstable-worker-options     # Enable unstable Web Worker APIs
]

# Vendor remote modules into a local directory
export extern "deno vendor" []

# Print this message or the help of the given subcommand(s)
export extern "deno help" [
	--quiet(-q)                   # Suppress diagnostic output
	--help(-h)                    # Print help (see a summary with '-h')clear
	--version(-V)                 # Print version
	--unstable                    # Enable unstable features and APIs
	--unstable-bare-node-builtins # Enable unstable bare node builtins feature
	--unstable-byonm              # Enable unstable 'bring your own node_modules' feature
	--unstable-sloppy-imports     # Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing.
	--unstable-broadcast-channel  # Enable unstable `BroadcastChannel` API
	--unstable-cron               # Enable unstable Deno.cron API
	--unstable-ffi                # Enable unstable FFI APIs
	--unstable-fs                 # Enable unstable file system APIs
	--unstable-http               # Enable unstable HTTP APIs
	--unstable-kv                 # Enable unstable Key-Value store APIs
	--unstable-net                # Enable unstable net APIs
	--unstable-process            # Enable unstable process APIs
	--unstable-temporal           # Enable unstable Temporal API
	--unstable-unsafe-proto       # Enable unsafe __proto__ support. This is a security risk.
	--unstable-webgpu             # Enable unstable `WebGPU` API
	--unstable-worker-options     # Enable unstable Web Worker APIs
]

# A modern JavaScript and TypeScript runtime
export extern "deno" [
	--quiet(-q)                   # Suppress diagnostic output
	--help(-h)                    # Print help (see a summary with '-h')
	--version(-V)                 # Print version
	--unstable                    # Enable unstable features and APIs
	--unstable-bare-node-builtins # Enable unstable bare node builtins feature
	--unstable-byonm              # Enable unstable 'bring your own node_modules' feature
	--unstable-sloppy-imports     # Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing.
	--unstable-broadcast-channel  # Enable unstable `BroadcastChannel` API
	--unstable-cron               # Enable unstable Deno.cron API
	--unstable-ffi                # Enable unstable FFI APIs
	--unstable-fs                 # Enable unstable file system APIs
	--unstable-http               # Enable unstable HTTP APIs
	--unstable-kv                 # Enable unstable Key-Value store APIs
	--unstable-net                # Enable unstable net APIs
	--unstable-process            # Enable unstable process APIs
	--unstable-temporal           # Enable unstable Temporal API
	--unstable-unsafe-proto       # Enable unsafe __proto__ support. This is a security risk.
	--unstable-webgpu             # Enable unstable `WebGPU` API
	--unstable-worker-options     # Enable unstable Web Worker APIs
]