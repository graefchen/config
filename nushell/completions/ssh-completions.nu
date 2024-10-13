# Written by graefchen
# based on: OpenSSH_for_Windows_9.5p1, LibreSSL 3.8.2
# link: https://github.com/PowerShell/openssh-portable
# or link: https://www.openssh.com

# TODO: Finish

# OpenSSH remote login client
export extern "ssh" [
	-V # Display the version number and exit.
	-v # Verbose mode
]

# OpenSSH secure file copy
export extern "scp" []

# OpenSSH secure file transfer
export extern "sftp" []

# adds private key identities to the OpenSSH authentication agent
export extern "ssh-add" [
	-D              # Deletes all identities from the agent.
	-d              # Instead of adding identities, removes identities from the agent.
	-e: string      # Remove keys provided by the PKCS#11 shared library pkcs11.
	-s: string      # Add keys provided by the PKCS#11 shared library pkcs11
	-T: string      # Tests whether the private keys that correspond to the specified pubkey files are usable by performing sign and verify operations on each.
	-t: int         # Set a maximum lifetime when adding identities to an agent.
	...file: string # File that contains a private key to be added to the authentication agent
]

# gather SSH public keys from servers
export extern "ssh-keyscan" [
	-K # Load resident keys from a FIDO authenticator.
	-k # When loading keys into or deleting keys from the agent, process plain private keys only and skip certificates.
	-L # Lists public key parameters of all identities currently represented by the agent.
	-l # Lists fingerprints of all identities currently represented by the agent.
	-q # Be quiet after a successful operation.
]

# OpenSSH authentication key utility
export extern "ssh-keygen" [
	-a: int    # When saving a private key, this option specifies the number of KDF (key derivation function, currently bcrypt_pbkdf(3)) rounds used. Higher numbers result in slower passphrase verification and increased resistance to brute-force password cracking (should the keys be stolen). The default is 16 rounds.
	-C: string # Provides a new comment.
	-f: string # Specifies the filename of the key file.
	-t: string # pecifies the type of key to create. The possible values are “ecdsa”, “ecdsa-sk”, “ed25519 (the default),” “ed25519-sk”, or “rsa”.
]

# OpenSSH authentication agent
export extern "ssh-agent" [
	-c # Generate C-shell commands on stdout. This is the default if SHELL looks like it's a csh style of shell.
	-D # Foreground mode. When this option is specified, ssh-agent will not fork.
	-d # Debug mode. When this option is specified, ssh-agent will not fork and will write debug information to standard error.
]
