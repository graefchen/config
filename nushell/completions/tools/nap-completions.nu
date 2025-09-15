# Written by graefchen
# based on nap@latest
# link: https://github.com/maaslalani/nap

# Fuzzy find snippet.
export extern "nap fuzzy" []

# List snippets.
export extern "nap list" []

def "nu-complete nap" [] {
	nap list | split row "\n"
}

# Code snippets in your terminal
export extern "nap" [
	...snippet: string@"nu-complete nap" # 
]
