# Written by graefchen
# based on: serve 14.2.3
# link: https://github.com/vercel/serve

# serve - Static file serving and directory listing
export extern "serve" [
	--help                    # Shows this help message
	--version(-v)             # Displays the current version of serve
	--listen(-l): string      # Specify a URI endpoint on which to listen (see below) -  more than one may be specified to listen in multiple places
	-p                        # Specify custom port
	--single(-s)              # Rewrite all not-found requests to `index.html`
	--debug(-d)               # Show debugging information
	--config(-c)              # Specify custom path to `serve.json`
	--no-request-logging(-L)  # Do not log any request information to the console.
	--cors(-C)                # Enable CORS, sets `Access-Control-Allow-Origin` to `*`
	--no-clipboard(-n)        # Do not copy the local address to the clipboard
	--no-compression(-u)      # Do not compress files
	--no-etag                 # Send `Last-Modified` header instead of `ETag`
	--symlinks(-S)            # Resolve symlinks instead of showing 404 errors
	--ssl-cert                # Optional path to an SSL/TLS certificate to serve with HTTPS Supported formats: PEM (default) and PKCS12 (PFX)
	--ssl-key                 # Optional path to the SSL/TLS certificate's private key Applicable only for PEM certificates
	--ssl-pass                # Optional path to the SSL/TLS certificate's passphrase
	--no-port-switching       # Do not open a port other than the one specified when it's taken.
]
