# Written by graefchen
# based on: Lua 5.4.2
# link: https://www.lua.org
# and
# based on: LuaJIT 2.1.0-beta
# link: https://luajit.org

# lua is the stand-alone Lua interpreter. It loads and executes Lua programs, either in textual source form or in precompiled binary form. 
export extern "lua" [
	script?: path
	-e: string # execute string 'stat'
	-i         # enter interactive mode after executing 'script'
	-l: string # require library 'name' into global 'name'
	-v         # show version information
	-E         # ignore environment variables
	-W         # turn warnings on
]

# luac is the Lua compiler. It translates programs written in the Lua programming language into binary files that can be later loaded and executed.
export extern "luac" [
	-l          # list (use -l -l for full listing)
	-o: string  # output to file 'name' (default is "luac.out")
	-p          # parse only
	-s          # strip debug information
	-v          # show version information
	...filenames: string
]

# Just-In-Time Compiler for the Lua Language
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
