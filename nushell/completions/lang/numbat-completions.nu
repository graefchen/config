# Written by graefchen
# based on: numbat 1.16.0
# link: https://github.com/sharkdp/numbat

def "nu-complete numbat pretty-print" [] {
	["always" "never" "auto"]
}

def "nu-complete numbat intro-banner" [] {
	["long" "short" "off"]
}

def "nu-complete numbat" [] {
	ls -lat | where name =~ ".nbt"
}

# A statically typed programming language for scientific computations for scientific computations with first class support for physical dimensions and units.
export extern "numbat" [
	file?: string@"nu-complete numbat"
	--expression(-e): string                                 # Evaluate a single expression. Can be specified multiple times to evaluate several expressions in sequence
	--inspect-interactively(-i)                              # Enter interactive session after running a numbat script or expression
	--no-config                                              # Do not load the user configuration file
	--no-prelude(-N)                                         # Do not load the prelude with predefined physical dimensions and units. This implies --no-init
	--no-init                                                # Do not load the user init file
	--pretty-print: string@"nu-complete numbat pretty-print" # Whether or not to pretty-print every input expression
	--color: string@"nu-complete numbat pretty-print"        # Whether or not coloring should occur
	--intro-banner: string@"nu-complete numbat intro-banner" # What kind of intro banner to show (if any)
	--generate-config                                        # Generate a default configuration file
	--help(-h)                                               # Print help (see a summary with '-h')
	--version(-V)                                            # Print version
]
