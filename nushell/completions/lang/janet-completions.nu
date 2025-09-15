# Written by graefchen
# based on: Janet 1.38.0-local
# link: https://www.lua.org

export extern janet [
  --help(-h)               # Show this help
  --version(-v)            # Print the version string
  --stdin(-s)              # Use raw stdin instead of getline like functionality
  --eval(-e): string       # Execute a string of janet
  --expression(-E)         # Evaluate an expression as a short-fn with arguments
  --debug(-d)              # Set the debug flag in the REPL
  --repl(-r)               # Enter the REPL after running all scripts
  --noprofile(-R)          # Disables loading profile.janet when JANET_PROFILE is present
  --persistent(-p)         # Keep on executing if there is a top-level error (persistent)
  --quiet(-q)              # Hide logo (quiet)
  --flycheck(-k)           # Compile scripts but do not execute (flycheck)
  --syspath(-m): string    # Set system path for loading global modules
  --compile(-c): string    #  Compile janet source code into an image
  --image(-i)              # Load the script argument as an image file instead of source code
  --nocolor(-n)            # Disable ANSI color output in the REPL
  --color(-N)              # Enable ANSI color output in the REPL
  --library(-l)            # Use a module before processing more arguments
  --lint-warn(-w)          # Set the lint warning level - default is "normal"
  --lint-error(-x)         # Set the lint error level - default is "none"
  --install(-b): string    # Install a bundle from a directory
  --reinstall(-B): string  # Reinstall a bundle by bundle name
  --uninstall(-u): string  # Uninstall a bundle by bundle name
  --update-all(-U)         # Reinstall all installed bundles
  --prune(-P)              # Uninstalled all bundles that are orphaned
  --list(-L)               # List all installed bundles
]
