# Written by graefchen
# based on: erde 1.0.0-1
# link: https://erde-lang.github.io

# Compile Erde files into Lua.
export extern "erde compile" [
	--outdir(-o): string     #Output directory for compiled files.
	--watch(-w)            #Watch files and recompile on change.
	--force(-f)           #Force rewrite existing Lua files with compiled files.
	--print(-p)            #Print compiled code instead of writing to files.
]

# Remove generated Lua files.
export extern "erde clean" []

# Map a compiled (Lua) line to a source (Erde) line.
export extern "erde sourcemap" []

export extern "erde" [
	--help(-v)           # Show this help message and exit.
	--version(-v)        # Show version and exit.
	--bitlib(-b): string # Library to use for bit operations.
	--target(-t): string # Lua target for version compatability. Must be one of: jit, 5.1, 5.1+, 5.2, 5.2+, 5.3, 5.3+, 5.4, 5.4+
	file?: string
]
