# Written by graefchen
# based on: dart-sass 1.79.5
# link: https://github.com/sass/dart-sass

# Compile Sass to CSS.
export extern "sass" [
	input: string              # input css
	output?: string            # output css
	--stdin                    # Read the stylesheet from stdin.
	--no-stdin                 # Read the stylesheet from stdin.
	--indented                 # Use the indented syntax for input from stdin.
	--no-indented              # Use the indented syntax for input from stdin.
	--load-path(-I): string    # A path to use when resolving imports. May be passed multiple times.
	--pkg-importer(-p): string # Built-in importer(s) to use for pkg: URLs.
	--pkg-node: string         # Load files like Node.js package resolution.
	--style(-s): string        # Output style. [expanded (default), compressed]
	--charset                  # Emit a @charset or BOM for CSS with non-ASCII characters. (defaults to on)
	--no-charset               # Emit a @charset or BOM for CSS with non-ASCII characters. (defaults to on)
	--error-css                # When an error occurs, emit a stylesheet describing it. Defaults to true when compiling to a file.
	--no-error-css             # When an error occurs, emit a stylesheet describing it. Defaults to true when compiling to a file.
	--update                   # Only compile out-of-date stylesheets.
	--source-map               # Whether to generate source maps. (defaults to on)
	--no-source-map            # Whether to generate source maps. (defaults to on)
	--source-map-urls          # How to link from source maps to source files. [relative (default), absolute]
	--embed-sources            # Embed source file contents in source maps.
	--no-embed-sources         # Embed source file contents in source maps.
	--embed-source-map         # Embed source map contents in CSS.
	--no-embed-source-map      # Embed source map contents in CSS.
	--quiet(-q)                # Don't print warnings.
	--no-quiet                 # Don't print warnings.
	--quiet-deps               # Don't print compiler warnings from dependencies.
	--no-quiet-deps            # Don't print compiler warnings from dependencies.
	--verbose                  # Print all deprecation warnings even when they're repetitive.
	--no-verbose               # Print all deprecation warnings even when they're repetitive.
	--fatal-deprecation        # Deprecations to treat as errors.
	--silence-deprecation      # Deprecations to ignore.
	--future-deprecation       # Opt in to a deprecation early.
	--watch(-w)                # Watch stylesheets and recompile when they change.
	--poll                     # Manually check for changes rather than using a native watcher. Only valid with --watch.
	--no-poll                  # Manually check for changes rather than using a native watcher. Only valid with --watch.
	--stop-on-error            # Don't compile more files once an error is encountered.
	--no-stop-on-error         # Don't compile more files once an error is encountered.
	--interactive(-i)          # Run an interactive SassScript shell.
	--color(-c)                # Whether to use terminal colors for messages.
	--no-color                 # Whether to use terminal colors for messages.
	--unicode                  # Whether to use Unicode characters for messages.
	--no-unicode               # Whether to use Unicode characters for messages.
	--trace                    # Print full Dart stack traces for exceptions.
	--no-trace                 # Print full Dart stack traces for exceptions.
	--help(-h)                 # Print this usage information.
	--version                  # Print the version of Dart Sass.
]