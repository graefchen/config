# Written by graefchen
# based on: Picat version 3.7
# link: http://picat-lang.org

# A simple, and yet powerful, logic-based multi-paradigm programming language aimed for general-purpose applications.
export extern "picat" [
	# -path
	-p: int    # size for program are
	-s: int    # size fir global and local stack
	-b: int    # size for tail stack
	-g: string # Goal
	-d         # Debug
	# -log
	--help     # Help message
	--version  # Version message
	PicatMainFileName?: string
	...An: string
]