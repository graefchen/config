# Written by graefchen
# based on wren_cli 0.4.0
# link: https://github.com/wren-lang/wren-cli

def "nu-complete wren" [] {
	ls -lat | where name =~ ".wren"
}

# the wren cli
export extern wren [
	file?: string@"nu-complete wren"
	--help    # Show command line usage
	--version # Show version
]

export extern wrenc [
	file?: string@"nu-complete wren"
	--help(-h)    # print wrenc command line options
	--version(-v) # print wrenc and Wren version
	-e: string    #  evaluate code
]