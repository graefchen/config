# Written by graefchen
# based on: OpenSSH_for_Windows_9.5p1, LibreSSL 3.8.2
# link: https://github.com/PowerShell/openssh-portable
# or link: https://www.openssh.com

# TODO: Finish

def "nu-complete ssh" [] {
	# Inpired and incluenced by:
	# https://github.com/nushell/nu_scripts/blob/main/custom-completions/ssh/ssh-completions.nu
	let lines = '~/.ssh/config' | open | lines | str trim
	mut result = []
	let hosts = $lines
		| each {|x| $x | parse --regex '^Host\s+(?<host>.+)' | get host }
		| compact --empty
		| flatten
	let hostnames = $lines
		| each {|x| $x | parse --regex '^HostName\s+(?<hostname>.+)' | get hostname }
		| compact --empty
		| flatten
	mut index = 0
	for $host in $hosts {
		let hos = $host | split row ' '
		for $h in $hos {
			$result = ($result | append {'value': ($h), 'description': ($hostnames | get $index) })
		}
		$index += 1
	}
	return $result
}

# OpenSSH remote login client
export extern "ssh" [
	destination?: string@"nu-complete ssh"
	...command: string
	-4         # Forces ssh to use IPv4 addresses only.
	-6         # Forces ssh to use IPv6 addresses only.
	-A         # Enables forwarding of connections from an authentication agent such as ssh-agent(1).
	-a         # Disables forwarding of the authentication agent connection.
	-B: string # Bind to the address of bind_interface before attempting to connect to the destination host.
	-b: string # Use bind_address on the local machine as the source address of the connection.
	-C         # Requests compression of all data (including stdin, stdout, stderr, and data for forwarded X11, TCP and UNIX-domain connections).
	-c: string # Selects the cipher specification for encrypting the session.
	-D: string # Specifies a local “dynamic” application-level port forwarding.
	-E: string # Append debug logs to log_file instead of standard error.
	-e: string # Sets the escape character for sessions with a pty (default: ‘~’).
	-F: string # Specifies an alternative per-user configuration file.
	-f         # Requests ssh to go to background just before command execution.
	-G         # Causes ssh to print its configuration after evaluating Host and Match blocks and exit.
	-g         # Allows remote hosts to connect to local forwarded ports.
	-I: string # Specify the PKCS#11 shared library ssh should use to communicate with a PKCS#11 token providing keys for user authentication.
	-i: string # Selects a file from which the identity (private key) for public key authentication is read.
	-J: string # Connect to the target host by first making an ssh connection to the jump host described by destination and then establishing a TCP forwarding to the ultimate destination from there.
	-K         # Enables GSSAPI-based authentication and forwarding (delegation) of GSSAPI credentials to the server.
	-k         # Disables forwarding (delegation) of GSSAPI credentials to the server.
	-L: string # Specifies that connections to the given TCP port or Unix socket on the local (client) host are to be forwarded to the given host and port, or Unix socket, on the remote side.
	-l: string # Specifies the user to log in as on the remote machine.
	-M         # Places the ssh client into “master” mode for connection sharing
	-m: string # A comma-separated list of MAC (message authentication code) algorithms, specified in order of preference.
	-N         # Do not execute a remote command.
	-n         # Redirects stdin from /dev/null (actually, prevents reading from stdin).
	-O: string # Control an active connection multiplexing master process.
	-o: string # Can be used to give options in the format used in the configuration file.
	-P: string # Specify a tag name that may be used to select configuration in ssh_config(5).
	-p: string # Port to connect to on the remote host.
	-Q: string # Queries for the algorithms.
	-q         # Quiet mode. Causes most warning and diagnostic messages to be suppressed.
	-R: string # Specifies that connections to the given TCP port or Unix socket on the remote (server) host are to be forwarded to the local side.
	-S: string # Specifies the location of a control socket for connection sharing, or the string “none” to disable connection sharing
	-s         # May be used to request invocation of a subsystem on the remote system.
	-T         # Disable pseudo-terminal allocation.
	-t         # Force pseudo-terminal allocation.
	-V         # Display the version number and exit.
	-v         # Verbose mode
	-W: string # Requests that standard input and output on the client be forwarded to host on port over the secure channel.
	-w: string # Requests tunnel device forwarding with the specified tun(4) devices between the client (local_tun) and the server (remote_tun).
	-X         # Enables X11 forwarding.
	-x         # Disables X11 forwarding.
	-Y         # Enables trusted X11 forwarding.
	-y         # Send log information using the syslog(3) system module.
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
