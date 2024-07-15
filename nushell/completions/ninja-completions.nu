# Written by graefchen
# based on: ninja 1.11.1
# link: https://github.com/ninja-build/ninja

def "nu-completions ninja MODE" [] {
	[
		{ value: "list", description: "list modes" },
		{ value: "stats", description: "print operation counts/timing info" },
		{ value: "explain", description: "explain what caused a command to execute" },
		{ value: "keepdepfile", description: "don't delete depfiles after they're read by ninja" },
		{ value: "keeprsp", description: "don't delete @response files on success" },
		{ value: "nostatcache", description: "don't batch stat() calls per directory and cache them" }
	]
}

def "nu-completions ninja TOOL" [] {
	[
		{ value: "list", description: "list subtools" },
		{ value: "browse", description: "browse dependency graph in a web browser" },
		{ value: "msvc", description: "build helper for MSVC cl.exe (DEPRECATED)" },
		{ value: "clean", description: "clean built files" },
		{ value: "commands", description: "list all commands required to rebuild given targets" },
		{ value: "inputs", description: "list all inputs required to rebuild given targets" },
		{ value: "deps", description: "show dependencies stored in the deps log" },
		{ value: "missingdeps", description: "check deps log dependencies on generated files" },
		{ value: "graph", description: "output graphviz dot file for targets" },
		{ value: "query", description: "show inputs/outputs for a path" },
		{ value: "targets", description: "list targets by their rule or depth in the DAG" },
		{ value: "compdb", description: "dump JSON compilation database to stdout" },
		{ value: "recompact", description: "recompacts ninja-internal data structures" },
		{ value: "restat", description: "restats all outputs in the build log" },
		{ value: "rules", description: "list all rules" },
		{ value: "cleandead", description: "clean built files that are no longer produced by the manifest" },
		{ value: "wincodepage", description: "print the Windows code page used by ninja" }
	]
}

def "nu-completions ninja FLAG" [] {
	["list"]
}

# a small build system with a focus on speed
export extern "ninja" [
	--version                              # print ninja version ("1.11.1")
	--help(-h)                             # print help message
	--verbose(-v)                          # show all command lines while building
	--quiet                                # don't show progress status, just command output
	-C: path                               # change to DIR before doing anything else
	-f: path                               # specify input build file [default=build.ninja]
	-j: number                             # run N jobs in parallel (0 means infinity) [default=10 on this system]
	-k: number                             # keep going until N jobs fail (0 means infinity) [default=1]
	-l: number                             # do not start new jobs if the load average is greater than N
	-n                                     # dry run (don't run commands but act like they succeeded)
	-d: string@"nu-completions ninja MODE" # enable debugging (use '-d list' to list modes)
	-t: string@"nu-completions ninja TOOL" # run a subtool (use '-t list' to list subtools) terminates toplevel options; further flags are passed to the tool
	-w: string@"nu-completions ninja FLAG" # adjust warnings (use '-w list' to list warnings)
]