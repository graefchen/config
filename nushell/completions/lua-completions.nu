# Written by greafchen

# lua
export extern "lua" [
	script?: path
	-e: string # execute string 'stat'
	-i         # enter interactive mode after executing 'script'
	-l: string # require library 'name' into global 'name'
	-v         # show version information
	-E         # ignore environment variables
	-W         # turn warnings on
]

# luac
export extern "luac" [
	filenames?: list<string>
	-l          # list (use -l -l for full listing)
	-o: string  # output to file 'name' (default is "luac.out")
	-p          # parse only
	-s          # strip debug information
	-v          # show version information
]

# luajit
export extern "luajit" [
	script?: path
	-e: string # Execute string 'chunk'.
	-l: string # Require library 'name'.
	-b         # Save or list bytecode.
	-j: string # Perform LuaJIT control command.
	-O: number # Control LuaJIT optimizations.
	-i         # Enter interactive mode after executing 'script'.
	-v         # Show version information.
	-E         # Ignore environment variables.
]