# Written by graefchen
# based on: hyperfine 1.18.0
# link: https://github.com/sharkdp/hexyl

def "nu-complete hyperfine style" [] {
	[
		{ value: "basic", description: " disable output coloring and interactive elements"},
		{ value: "full", description: "enable all effects even if no interactive terminal was detected"},
		{ value: "nocolor", description: "keep the interactive output without any colors"},
		{ value: "color", description: "keep the colors without any interactive output"},
		{ value: "none", description: "disable all the output of the too"}
	]
}

def "nu-complete hyperfine sort" [] {
	[
		{ value: "auto", description: "the speed comparison will be ordered by time and the markup tables will be ordered by command (input order)"}
		{ value: "command", description: "order benchmarks in the way they were specified"}
		{ value: "mean.time", description: "order benchmarks by mean runtime"}
	]
}

def "nu-complete hyperfine time" [] {
	[ "microsecond","millisecond" "second"]
}

# A command-line benchmarking tool.
export extern "hyperfine" [
	--warmup(-w): int                                    # Perform NUM warmup runs before the actual benchmark.
	--min-runs(-m): int                                  # Perform at least NUM runs for each command (default: 10).
	--max-runs(-M): int                                  # Perform at most NUM runs for each command. By default, there is no limit.
	--runs(-r): int                                      # Perform exactly NUM runs for each command. 
	--setup(-s): string                                  # Execute CMD before each set of timing runs.
	--prepare(-p): string                                # Execute CMD before each timing run.
	--cleanup (-c): string                               # Execute CMD after the completion of all benchmarking runs for each individual command to be benchmarked.
	--parameter-scan(-P): string                         # Perform benchmark runs for each value in the range MIN..MAX.
	--parameter-step-size(-D): string                    # This argument requires --parameter-scan to be specified as well. Traverse the range MIN..MAX in steps of DELTA.
	--parameter-list(-L): string                         # Perform benchmark runs for each value in the comma-separated list VALUES.
	--shell(-S): string                                  # Set the shell to use for executing benchmarked commands. 
	-N                                                   # An alias for '--shell=none'.
	--ignore-failure(-i)                                 # Ignore non-zero exit codes of the benchmarked programs.
	--style: string@"nu-complete hyperfine style"        # Set output style type (default: auto).
	--sort: string@"nu-complete hyperfine sort"          # Specify the sort order of the speed comparison summary and the exported tables for markup formats (Markdown, AsciiDoc, org-mode) (default: auto)
	--time-unit(-u): string@"nu-complete hyperfine time" # Set the time unit to be used. If the option is not given, the time unit is determined automatically. This option affects the standard output as well as all export formats except for CSV and JSON.
	--export-asciidoc: string                            # Export the timing summary statistics as an AsciiDoc table to the given FILE.
	--export-csv: string                                 # Export the timing summary statistics as CSV to the given FILE.
	--export-json: string                                # Export the timing summary statistics and timings of individual runs as JSON to the given FILE.
	--export-markdown: string                            # Export the timing summary statistics as a Markdown table to the given FILE.
	--export-orgmode: string                             # Export the timing summary statistics as an Emacs org-mode table to the given FILE.
	--show-output                                        # Print the stdout and stderr of the benchmark instead of suppressing it.
	--output: string                                     # Control where the output of the benchmark is redirected. 
	--input: string                                      # Control where the input of the benchmark comes from.
	--command-name(-n):string                            # Give a meaningful name to a command.
	--help(-h)                                           # Print help
	--version(-V)                                        # Print version
	...command: string                                   # The command to benchmark.
]
