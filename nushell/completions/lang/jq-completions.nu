# Written by graefchen
# based on: jq-1.7.1
# link: https://jqlang.github.io/jq/

def "nu-complete json" [] {
	ls -lat | where name =~ ".json" | get name
}

# jq - commandline JSON processor
export extern "jq" [
	...file: string@"nu-complete json"
	--null-input(-n)        # use `null` as the single input value;    
	--raw-input(-R)         # read each line as string instead of JSON;
	--slurp(-s)             # read all inputs into an array and use it as  the single input value;
	--compact-output(-c)    # compact instead of pretty-printed output;   
	--raw-output(-r)        # output strings without escapes and quotes;  
	--raw-output0           # implies -r and output NUL after each output;
	--join-output(-j)       # implies -r and output without newline after each output;
	--ascii-output(-a)      # output strings by only ASCII characters using escape sequences;
	--sort-keys(-s)         # sort keys of each object on output;
	--color-output(-C)      # colorize JSON output;
	--monochrome-output(-M) # disable colored output;
	--tab                   # use tabs for indentation;
	--indent: int           # use n spaces for indentation (max 7 spaces);
	--unbuffered            # flush output stream after each output;
	--stream                # parse the input value in streaming fashion;
	--stream-errors         # implies --stream and report parse error as an array;
	--seq                   # parse input/output as application/json-seq;
	--from-file(-f): string # load filter from the file;
	-L:string               # search modules from the directory;
	--arg: string           # set $name to the string value;
	--argjson: string       # set $name to the JSON value;
	--slurpfile: string     # set $name to an array of JSON values read from the file;
	--rawfile: string       # set $name to string contents of file;
	--args                  # consume remaining arguments as positional string values;
	--jsonargs              # consume remaining arguments as positional JSON values;
	--exit-status(-e)       # set exit status code based on the output;
	--binary(-b)            # open input/output streams in binary mode;
	--version(-V)           # show the version;
	--build-configuration   # show jq's build configuration;
	--help(-h)              # show the help;
]

# based on: jqp version 0.7.0
# link: https://github.com/noahgorstein/jqp

# jqp is a TUI to explore the jq command line utility
export extern "jqp" [
	--config: string       # path to config file (default is $HOME/.jqp.yaml)
	--file(-f): string@"nu-complete json"     # path to the input JSON file
	--help(-h)             # help for jqp
	--theme(-t): string    # jqp theme
	--version(-v)          # version for jqp
]
