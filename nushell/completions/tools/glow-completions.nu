# Written by graefchen
# based on: 
# link: https://github.com/charmbracelet/glow

# Edit the glow config file
export extern " glow config" [
	--help(-h) # help for confi
]

# Help about any command
export extern " glow help" []

# Stash a markdown
export extern " glow stash" [
	--help(-h)          # help for stash
	--memo(-m):string   # memo/note for stashing
]

# Render markdown on the CLI, with pizzazz!
export extern "glow" [
	...source
	--all(-a)            # show system files and directories (TUI-mode only)
	--config: string     # config file
	--help(-h)           # help for glow
	--local(-l)          # show local files only; no network (TUI-mode only)
	--pager(-p)          # display with pager
	--style(-s): string  # style name or JSON path (default "auto")
	--version(-v)        # version for glow
	--width(-w): int     # word-wrap at width
]
