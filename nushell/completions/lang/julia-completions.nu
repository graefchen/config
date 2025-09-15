# Written by graefchen
# based on: julia version 1.10.4
# link: https://julialang.org

def "nu-complete julia yn" [] {
	["yes" "no"]
}

def "nu-complete julia yna" [] {
	["yes" "no" "auto"]
}

def "nu-complete julia yne" [] {
	["yes" "no" "error"]
}

def "nu-complete julia nua" [] {
	["none" "user" "all"]
}

# Julia is a high-level, high-performance, dynamic, open-source programming language.
export extern "julia" [
	--version(-v)                                         # Display version information
	--help(-h)                                            # Print this message (--help-hidden for more)
	--help-hidden                                         # Uncommon options not shown by `-h`
	--project:path                                        # Set <dir> as the home project/environment
	--sysimage(-J): string                                # Start up with the given system image file
	--home(-H): string                                    # Set location of `julia` executable
	--startup-file: string@"nu-complete julia yn"         # Load `JULIA_DEPOT_PATH/config/startup.jl`; if `JULIA_DEPOT_PATH` environment variable is unset, load `~/.julia/config/startup.jl`
	--handle-signals: string@"nu-complete julia yn"       # Enable or disable Julia's default signal handlers
	--sysimage-native-code: string@"nu-complete julia yn" # Use native code from system image if available
	--compiled-modules: string@"nu-complete julia yn"     # Enable or disable incremental precompilation of modules
	--pkgimages: string@"nu-complete julia yn"            # Enable or disable usage of native code caching in the form of pkgimages ($)  
	--eval(-e): string                                    # Evaluate <expr>
	--print(-E): string                                   # Evaluate <expr> and display the result
	--load(-L): path                                      # Load <file> immediately on all processors
	--threads(-t): string                                 # Enable N[+M] threads; N threads are assigned to the `default` threadpool, and if M is specified, M threads are assigned to the `interactive` threadpool;
	--gcthreads: string                                   # Use N threads for the mark phase of GC and M (0 or 1) threads for the concurrent sweeping phase of GC.
	--procs(-p): int                                      # Integer value N launches N additional local worker processes "auto" launches as many workers as the number of local CPU threads (logical cores)
	--machine-file: string                                # Run processes on hosts listed in <file>
	--interactive(-i)                                     # Interactive mode; REPL runs and `isinteractive()` is true
	--quiet(-q)                                           # Quiet startup: no banner, suppress REPL warnings
	--banner: string@"nu-complete julia yna"              # Enable or disable startup banner
	--color: string@"nu-complete julia yna"               # Enable or disable color text
	--history-file: string@"nu-complete julia yn"         #  Load or save history
	--depwarn: string@"nu-complete julia yne"             # Enable or disable syntax and method deprecation warnings (`error` turns warnings into errors)
	--warn-overwrite: string@"nu-complete julia yn"       # Enable or disable method overwrite warnings
	--warn-scope: string@"nu-complete julia yn"           # Enable or disable warning for ambiguous top-level scope
	-C, --cpu-target: string                              # Limit usage of CPU features up to <target>; set to `help` to see the available options
	-O, --optimize: int                                   # Set the optimization level (level 3 if `-O` is used without a level) ($)     
	--min-optlevel: int                                   # Set a lower bound on the optimization level
	-g, --debug-info: int                                 # Set the level of debug info generation (level 2 if `-g` is used without a level) ($)
	--inline: string@"nu-complete julia yn"               # Control whether inlining is permitted, including overriding @inline declarations
	--check-bounds: string@"nu-complete julia yna"        # Emit bounds checks always, never, or respect @inbounds declarations ($)      
	--code-coverage: string@"nu-complete julia nua"       # Count executions of source lines (omitting setting is equivalent to `user`)  
	--code-coverage=@: path                               # Count executions but only in files that fall under the given file path/directory. The `@` prefix is required to select this option. A `@` with no path will track the current directory.
	--code-coverage=tracefile.info                        # Append coverage information to the LCOV tracefile (filename supports format tokens)
	--track-allocation: string@"nu-complete julia nua"    # Count bytes allocated by each source line (omitting setting is equivalent to `user`)
	--track-allocation=@: path                            # Count bytes but only in files that fall under the given file path/directory.  The `@` prefix is required to select this option. A `@` with no path will track the current directory.
	--bug-report: string                                  # Launch a bug report session. It can be used to start a REPL, run a script, or evaluate  expressions. It first tries to use BugReporting.jl installed in current environment and  fallbacks to the latest compatible BugReporting.jl if not. For more information, see
	--heap-size-hint: string                              # Forces garbage collection if memory usage is higher than that value.
]