# Written by graefchen
# based od: mdq 0.7.3-dev
# link: https://github.com/yshavit/mdq

export extern mdq [
  --link-pos: string            # Where to put link references [default: section] [possible values: section, doc]
  --footnote-pos: string        # Where to put footnote references. Defaults to be same as --link-pos [possible values: section, doc]
  --link-format(-l): string     # [default: never-inline] [possible values: keep, inline, never-inline]
  --renumber-footnotes: string  # [default: true] [possible values: true, false]
  --output(-o): string          # Specifies the output format. Defaults to markdown [default: markdown] [possible values: markdown, md, json, plain]
  --wrap-width: number          # The number of characters to wrap text at. This is only valid when the output format is markdown
  --quiet(-q)                   # Quiet: do not print anything to stdout. The exit code will still be 0 if any elements match, and non-0 if none do
  --no-br                       # Include breaks between elements in plain and markdown output mode
  --br                          # Include breaks between elements in plain and markdown output mode
  --help(-h)                    # Print help
  --version(-V)                 # Print version
]
