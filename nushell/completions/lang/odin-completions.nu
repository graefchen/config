# Written by graefchen
# based on: odin version dev-2024-06-nightly
# link: https://github.com/odin-lang/Odin

# TODO: Finish

# Compiles directory of .odin files, as an executable. One must contain the program's entry point, all must be in the same package.
export extern "odin build" []

# Same as 'build', but also then runs the newly compiled executable.
export extern "odin run" []

# Parses, and type checks a directory of .odin files.
export extern "odin check" []

# Parses, type checks, and removes unneeded semicolons from the entire program.
export extern "odin strip-semicolon" []

# Builds and runs procedures with the attribute @(test) in the initial package.
export extern "odin test" []

# Generates documentation on a directory of .odin files.
export extern "odin doc" []

# Prints version.
export extern "odin version" []

# Prints information useful to reporting a bug.
export extern "odin report" []

# Prints the root path where Odin looks for the builtin collections.
export extern "odin root" []

def "nu-complete odin help" [] {
	[
		{ value: "build", description: "Compiles directory of .odin files, as an executable. One must contain the program's entry point, all must be in the same package." },
		{ value: "run", description: "Same as 'build', but also then runs the newly compiled executable." },
		{ value: "check", description: "Parses, and type checks a directory of .odin files." },
		{ value: "strip-semicolon", description: "Parses, type checks, and removes unneeded semicolons from the entire program." },
		{ value: "test", description: "Builds and runs procedures with the attribute @(test) in the initial package." },
		{ value: "doc", description: "Generates documentation on a directory of .odin files." },
		{ value: "version", description: "Prints version." },
		{ value: "report", description: "Prints information useful to reporting a bug." },
		{ value: "root", description: "Prints the root path where Odin looks for the builtin collections." }
	]
}

# The odin help command.
export extern "odin help" []

# odin is a tool for managing Odin source code.
export extern "odin" []
