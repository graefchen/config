# Written by graefchen
# based on: version 2.3.3
# link: https://ftp.regressive.org/snobol4/

def "nu-complete snobol4" [] {
	ls -lat | where name =~ ".snb"
}
# SNOBOL4 (StriNg Oriented and symBOlic Language)
export extern "snobol4" [
	...files: string@"nu-complete snobol4"
	-b         # disable display of startup banner
	-d: int    # size of dynamic region in descriptors (default: 512k)
	-f         # toggle folding of identifiers to upper case (-CASE)
	-g         # enable GC trace (&GTRACE)
	-h         # help (this message)
	-k         # toggle running programs with compilation errors (-[NO]ERRORS)
	-l: string # enable listing (-LIST) and specify file
	-n         # toggle running program after compilation (-[NO]EXECUTE)
	-p         # toggle SPITBOL operators (-PLUSOPS)
	-r         # toggle reading INPUT from after END statement
	-s         # toggle display of statistics
	-u: string # parameter data available via HOST(0)
	-v         # display version and exit
	-x         # force display of startup banner
	-z         # show directory search path in use
	-B         # toggle SNOBOL4B operators (-[NO]BLOCKS)
	-I: string # add directory to search path
	-L: string # load source file before user program
	-M         # process multiple files for program code
	-N         # clear search path
	-P: int    # size of pattern match stack in descriptors (default: 8000)
	-S: int    # size of interpreter stack in descriptors (default: 4000)
	-U         # make all stdio I/O unbuffered
]
