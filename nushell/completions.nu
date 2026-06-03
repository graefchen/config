# written by graefchen

# region: SSH

# TODO: Finish sftp and maybe scp

def "nu-complete ssh" [] {
	# Inpired and influenced by:
	# https://github.com/nushell/nu_scripts/blob/main/custom-completions/ssh/ssh-completions.nu
	# https://github.com/nushell/nu_scripts/blob/b09b60cc434bb9be05ce2bbb6dc299760d13b18b/custom-completions/ssh/ssh-completions.nu#L35-L109
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
	-I: string # Specify the PKCscS#11 shared library ssh should use to communicate with a PKCS#11 token providing keys for user authentication.
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

# endregions

# region: git

# nu-version: 0.102.0

module git-completion-utils {
  export const GIT_SKIPABLE_FLAGS = ['-v', '--version', '-h', '--help', '-p', '--paginate', '-P', '--no-pager', '--no-replace-objects', '--bare']

  # Helper function to append token if non-empty
  def append-non-empty [token: string]: list<string> -> list<string> {
    if ($token | is-empty) { $in } else { $in | append $token }
  }

  # Split a string to list of args, taking quotes into account.
  # Code is copied and modified from https://github.com/nushell/nushell/issues/14582#issuecomment-2542596272
  export def args-split []: string -> list<string> {
    # Define our states
    const STATE_NORMAL = 0
    const STATE_IN_SINGLE_QUOTE = 1
    const STATE_IN_DOUBLE_QUOTE = 2
    const STATE_ESCAPE = 3
    const WHITESPACES = [" " "\t" "\n" "\r"]

    # Initialize variables
    mut state = $STATE_NORMAL
    mut current_token = ""
    mut result: list<string> = []
    mut prev_state = $STATE_NORMAL

    # Process each character
    for char in ($in | split chars) {
      if $state == $STATE_ESCAPE {
        # Handle escaped character
        $current_token = $current_token + $char
        $state = $prev_state
      } else if $char == '\' {
        # Enter escape state
        $prev_state = $state
        $state = $STATE_ESCAPE
      } else if $state == $STATE_NORMAL {
        if $char == "'" {
          $state = $STATE_IN_SINGLE_QUOTE
        } else if $char == '"' {
          $state = $STATE_IN_DOUBLE_QUOTE
        } else if ($char in $WHITESPACES) {
          # Whitespace in normal state means token boundary
          $result = $result | append-non-empty $current_token
          $current_token = ""
        } else {
          $current_token = $current_token + $char
        }
      } else if $state == $STATE_IN_SINGLE_QUOTE {
        if $char == "'" {
          $state = $STATE_NORMAL
        } else {
          $current_token = $current_token + $char
        }
      } else if $state == $STATE_IN_DOUBLE_QUOTE {
        if $char == '"' {
          $state = $STATE_NORMAL
        } else {
          $current_token = $current_token + $char
        }
      }
    }
    # Handle the last token
    $result = $result | append-non-empty $current_token
    # Return the result
    $result
  }

  # Get changed files which can be restored by `git checkout --`
  export def get-changed-files []: nothing -> list<string> {
    ^git status -uno --porcelain=2 | lines
    | where $it =~ '^1 [.MD]{2}'
    | each { split row ' ' -n 9 | last }
  }

  # Get files which can be retrieved from a branch/commit by `git checkout <tree-ish>`
  export def get-checkoutable-files []: nothing -> list<string> {
    # Relevant statuses are .M", "MM", "MD", ".D", "UU"
    ^git status -uno --porcelain=2 | lines
    | where $it =~ '^1 ([.MD]{2}|UU)'
    | each { split row ' ' -n 9 | last }
  }

  export def get-all-git-local-refs []: nothing -> list<record<ref: string, obj: string, upstream: string, subject: string>> {
    ^git for-each-ref --format '%(refname:lstrip=2)%09%(objectname:short)%09%(upstream:remotename)%(upstream:track)%09%(contents:subject)' refs/heads | lines | parse "{ref}\t{obj}\t{upstream}\t{subject}"
  }

  export def get-all-git-remote-refs []: nothing -> list<record<ref: string, obj: string, subject: string>> {
    ^git for-each-ref --format '%(refname:lstrip=2)%09%(objectname:short)%09%(contents:subject)' refs/remotes | lines | parse "{ref}\t{obj}\t{subject}"
  }

  # Get local branches, remote branches which can be passed to `git merge`
  export def get-mergable-sources []: nothing -> list<record<value: string, description: string>> {
    let local = get-all-git-local-refs | each {|x| {value: $x.ref description: $'Branch, Local, ($x.obj) ($x.subject), (if ($x.upstream | is-not-empty) { $x.upstream } else { "no upstream" } )'} } | insert style 'light_blue'
    let remote = get-all-git-remote-refs | each {|x| {value: $x.ref description: $'Branch, Remote, ($x.obj) ($x.subject)'} } | insert style 'blue_italic'
    $local | append $remote
  }
}

def "nu-complete git available upstream" [] {
  ^git for-each-ref --format '%(refname:short)' refs/heads refs/remotes | lines
}

def "nu-complete git remotes" [] {
  ^git remote --verbose
  | parse --regex '(?<value>\S+)\s+(?<description>\S+)'
  | uniq-by value # Deduplicate where fetch and push remotes are the same
}

def "nu-complete git log" [] {
  ^git log --pretty=%h | lines | each { |line| $line | str trim }
}

# Yield all existing commits in descending chronological order.
def "nu-complete git commits all" [] {
  ^git rev-list --all --remotes --pretty=oneline | lines | parse "{value} {description}"
}

# Yield commits of current branch only. This is useful for e.g. cut points in
# `git rebase`.
def "nu-complete git commits current branch" [] {
  ^git log --pretty="%h %s" | lines | parse "{value} {description}"
}

# Yield local branches like `main`, `feature/typo_fix`
def "nu-complete git local branches" [] {
  ^git for-each-ref --format '%(refname:short)' refs/heads | lines
}

# Yield remote branches like `origin/main`, `upstream/feature-a`
def "nu-complete git remote branches with prefix" [] {
  ^git for-each-ref --format='%(refname:lstrip=2)' refs/remotes | lines
}

# Yield local and remote branch names which can be passed to `git merge`
def "nu-complete git mergable sources" [] {
  use git-completion-utils *
  let branches = get-mergable-sources
  {
    options: {
        case_sensitive: false,
        completion_algorithm: prefix,
        sort: false,
    },
    completions: $branches
  }
}

def "nu-complete git switch" [] {
  use git-completion-utils *
  let branches = get-mergable-sources
  {
    options: {
        case_sensitive: false,
        completion_algorithm: prefix,
        sort: false,
    },
    completions: $branches
  }
}

def "nu-complete git checkout" [context: string, position?:int] {
  use git-completion-utils *
  let preceding = $context | str substring ..$position
  # See what user typed before, like 'git checkout a-branch a-path'.
  # We exclude some flags from previous tokens, to detect if  a branch name has been used as the first argument.
  # FIXME: This method is still naive, though.
  let prev_tokens = $preceding | str trim | args-split | where ($it not-in $GIT_SKIPABLE_FLAGS)
  # In these scenarios, we suggest only file paths, not branch:
  # - After '--'
  # - First arg is a branch
  # If before '--' is just 'git checkout' (or its alias), we suggest "dirty" files only (user is about to reset file).
  if $prev_tokens.2? == '--' {
    return (get-changed-files)
  }
  if '--' in $prev_tokens {
    return (get-checkoutable-files)
  }
  # Already typed first argument.
  if ($prev_tokens | length) > 2 and $preceding ends-with ' ' {
    # If we are creating a new branch, we may want to specify a start point
    if ("-b" not-in $prev_tokens) and ("-B" not-in $prev_tokens) and ("--orphan" not-in $prev_tokens) {
      return (get-checkoutable-files)
    }
  }
  # The first argument can be local branches, remote branches, files and commits
  # Get local and remote branches
  let branches = get-mergable-sources
  let files = (get-checkoutable-files) | wrap value | insert description 'File' | insert style green
  let commits = ^git rev-list -n 400 --remotes --oneline | lines | split column -n 2 ' ' value description | upsert description {|x| $'Commit, ($x.value) ($x.description)' } | insert style 'light_cyan_dimmed'
  {
    options: {
        case_sensitive: false,
        completion_algorithm: prefix,
        sort: false,
    },
    completions: [...$branches, ...$files, ...$commits]
  }
}

# Arguments to `git rebase --onto <arg1> <arg2>`
def "nu-complete git rebase" [] {
  (nu-complete git local branches)
  | parse "{value}"
  | insert description "local branch"
  | append (nu-complete git remote branches with prefix
            | parse "{value}"
            | insert description "remote branch")
  | append (nu-complete git commits all)
}

def "nu-complete git stash-list" [] {
  git stash list | lines | parse "{value}: {description}"
}

def "nu-complete git tags" [] {
  ^git tag --no-color | lines
}

# See `man git-status` under "Short Format"
# This is incomplete, but should cover the most common cases.
const short_status_descriptions = {
  ".D": "Deleted"
  ".M": "Modified"
  "!" : "Ignored"
  "?" : "Untracked"
  "AU": "Staged, not merged"
  "MD": "Some modifications staged, file deleted in work tree"
  "MM": "Some modifications staged, some modifications untracked"
  "R.": "Renamed"
  "UU": "Both modified (in merge conflict)"
}

def "nu-complete git files" [] {
  let relevant_statuses = ["?",".M", "MM", "MD", ".D", "UU"]
  ^git status -uall --porcelain=2
  | lines
  | each { |$it|
    if $it starts-with "1 " {
      $it | parse --regex "1 (?P<short_status>\\S+) (?:\\S+\\s?){6} (?P<value>\\S+)"
    } else if $it starts-with "2 " {
      $it | parse --regex "2 (?P<short_status>\\S+) (?:\\S+\\s?){6} (?P<value>\\S+)"
    } else if $it starts-with "u " {
      $it | parse --regex "u (?P<short_status>\\S+) (?:\\S+\\s?){8} (?P<value>\\S+)"
    } else if $it starts-with "? " {
      $it | parse --regex "(?P<short_status>.{1}) (?P<value>.+)"
    } else {
      { short_status: 'unknown', value: $it }
    }
  }
  | flatten
  | where $it.short_status in $relevant_statuses
  | insert "description" { |e| $short_status_descriptions | get $e.short_status}
}

def "nu-complete git built-in-refs" [] {
  [HEAD FETCH_HEAD ORIG_HEAD]
}

def "nu-complete git refs" [] {
  nu-complete git local branches
  | parse "{value}"
  | insert description Branch
  | append (nu-complete git tags | parse "{value}" | insert description Tag)
  | append (nu-complete git built-in-refs)
}

def "nu-complete git files-or-refs" [] {
  nu-complete git local branches
  | parse "{value}"
  | insert description Branch
  | append (nu-complete git files | where description == "Modified" | select value)
  | append (nu-complete git tags | parse "{value}" | insert description Tag)
  | append (nu-complete git built-in-refs)
}

def "nu-complete git aliases" [] {
  ^git config --get-regexp ^alias\.
  | lines
  | parse "alias.{value} {description}"
}

def "nu-complete git subcommands" [] {
  ^git help -a | lines | where $it starts-with "   " | parse -r '\s*(?P<value>[^ ]+) \s*(?P<description>\w.*)'
  | append (nu-complete git aliases)
  | uniq-by value
}

def "nu-complete git add" [] {
  nu-complete git files
}

def "nu-complete git pull rebase" [] {
  ["false","true","merges","interactive"]
}

def "nu-complete git merge strategies" [] {
  ['ort', 'octopus']
}

def "nu-complete git merge strategy options" [] {
  ['ours', 'theirs']
}


# Check out git branches and files
export extern "git checkout" [
  ...targets: string@"nu-complete git checkout"   # name of the branch or files to checkout
  --conflict: string                              # conflict style (merge or diff3)
  --detach(-d)                                    # detach HEAD at named commit
  --force(-f)                                     # force checkout (throw away local modifications)
  --guess                                         # second guess 'git checkout <no-such-branch>' (default)
  --ignore-other-worktrees                        # do not check if another worktree is holding the given ref
  --ignore-skip-worktree-bits                     # do not limit pathspecs to sparse entries only
  --merge(-m)                                     # perform a 3-way merge with the new branch
  --orphan: string                                # new unparented branch
  --ours(-2)                                      # checkout our version for unmerged files
  --overlay                                       # use overlay mode (default)
  --overwrite-ignore                              # update ignored files (default)
  --patch(-p)                                     # select hunks interactively
  --pathspec-from-file: string                    # read pathspec from file
  --progress                                      # force progress reporting
  --quiet(-q)                                     # suppress progress reporting
  --recurse-submodules                            # control recursive updating of submodules
  --theirs(-3)                                    # checkout their version for unmerged files
  --track(-t)                                     # set upstream info for new branch
  -b                                              # create and checkout a new branch
  -B: string                                      # create/reset and checkout a branch
  -l                                              # create reflog for new branch
]

export extern "git reset" [
  ...targets: string@"nu-complete git checkout"      # name of commit, branch, or files to reset to
  --hard                                          # reset HEAD, index and working tree
  --keep                                          # reset HEAD but keep local changes
  --merge                                         # reset HEAD, index and working tree
  --mixed                                         # reset HEAD and index
  --patch(-p)                                     # select hunks interactively
  --quiet(-q)                                     # be quiet, only report errors
  --soft                                          # reset only HEAD
  --pathspec-from-file: string                    # read pathspec from file
  --pathspec-file-nul                             # with --pathspec-from-file, pathspec elements are separated with NUL character
  --no-refresh                                    # skip refreshing the index after reset
  --recurse-submodules: string                    # control recursive updating of submodules
  --no-recurse-submodules                         # don't recurse into submodules
]

# Download objects and refs from another repository
export extern "git fetch" [
  repository?: string@"nu-complete git remotes" # name of the branch to fetch
  --all                                         # Fetch all remotes
  --append(-a)                                  # Append ref names and object names to .git/FETCH_HEAD
  --atomic                                      # Use an atomic transaction to update local refs.
  --depth: int                                  # Limit fetching to n commits from the tip
  --deepen: int                                 # Limit fetching to n commits from the current shallow boundary
  --shallow-since: string                       # Deepen or shorten the history by date
  --shallow-exclude: string                     # Deepen or shorten the history by branch/tag
  --unshallow                                   # Fetch all available history
  --update-shallow                              # Update .git/shallow to accept new refs
  --negotiation-tip: string                     # Specify which commit/glob to report while fetching
  --negotiate-only                              # Do not fetch, only print common ancestors
  --dry-run                                     # Show what would be done
  --write-fetch-head                            # Write fetched refs in FETCH_HEAD (default)
  --no-write-fetch-head                         # Do not write FETCH_HEAD
  --force(-f)                                   # Always update the local branch
  --keep(-k)                                    # Keep downloaded pack
  --multiple                                    # Allow several arguments to be specified
  --auto-maintenance                            # Run 'git maintenance run --auto' at the end (default)
  --no-auto-maintenance                         # Don't run 'git maintenance' at the end
  --auto-gc                                     # Run 'git maintenance run --auto' at the end (default)
  --no-auto-gc                                  # Don't run 'git maintenance' at the end
  --write-commit-graph                          # Write a commit-graph after fetching
  --no-write-commit-graph                       # Don't write a commit-graph after fetching
  --prefetch                                    # Place all refs into the refs/prefetch/ namespace
  --prune(-p)                                   # Remove obsolete remote-tracking references
  --prune-tags(-P)                              # Remove any local tags that do not exist on the remote
  --no-tags(-n)                                 # Disable automatic tag following
  --refmap: string                              # Use this refspec to map the refs to remote-tracking branches
  --tags(-t)                                    # Fetch all tags
  --recurse-submodules: string                  # Fetch new commits of populated submodules (yes/on-demand/no)
  --jobs(-j): int                               # Number of parallel children
  --no-recurse-submodules                       # Disable recursive fetching of submodules
  --set-upstream                                # Add upstream (tracking) reference
  --submodule-prefix: string                    # Prepend to paths printed in informative messages
  --upload-pack: string                         # Non-default path for remote command
  --quiet(-q)                                   # Silence internally used git commands
  --verbose(-v)                                 # Be verbose
  --progress                                    # Report progress on stderr
  --server-option(-o): string                   # Pass options for the server to handle
  --show-forced-updates                         # Check if a branch is force-updated
  --no-show-forced-updates                      # Don't check if a branch is force-updated
  -4                                            # Use IPv4 addresses, ignore IPv6 addresses
  -6                                            # Use IPv6 addresses, ignore IPv4 addresses
]

# Yield local branches and (if remote is specified) remote branches with colon prefix
def "nu-complete git push" [context: string, position: int] {
  use git-completion-utils *
  let preceding = $context | str substring ..$position
  let tokens = $preceding | str trim | args-split | where ($it not-in $GIT_SKIPABLE_FLAGS)

  # Check if we have a remote argument (2nd token, 1st is 'git', 2nd is 'push', 3rd is remote)
  # BUT, args-split might be different depending on how it's called.
  # "git push origin" -> ["git", "push", "origin"]
  # If we have at least 3 tokens, the 3rd one IS likely the remote.
  # We should double check if the 3rd token is actually a remote.
  
  mut remote = ""
  if ($tokens | length) >= 3 {
    $remote = $tokens.2
  }

  let local_branches = (nu-complete git local branches)
  
  if ($remote | is-empty) {
    return $local_branches
  }

  # If we have a remote, find branches for that remote
  # Use plumbing command to get remote branches, excluding HEAD
  let remote_branches = (^git for-each-ref --format='%(refname:lstrip=3)' $'refs/remotes/($remote)' | lines | where $it != 'HEAD')
  
  # Prefix them with :
  let deletion_candidates = ($remote_branches | each { |it| $":($it)" })

  $local_branches | append $deletion_candidates
}

# Push changes
export extern "git push" [
  remote?: string@"nu-complete git remotes",         # the name of the remote
  ...refs: string@"nu-complete git push"             # the branch / refspec
  --all                                              # push all refs
  --atomic                                           # request atomic transaction on remote side
  --delete(-d)                                       # delete refs
  --dry-run(-n)                                      # dry run
  --exec: string                                     # receive pack program
  --follow-tags                                      # push missing but relevant tags
  --force-with-lease                                 # require old value of ref to be at this value
  --force(-f)                                        # force updates
  --ipv4(-4)                                         # use IPv4 addresses only
  --ipv6(-6)                                         # use IPv6 addresses only
  --mirror                                           # mirror all refs
  --no-verify                                        # bypass pre-push hook
  --porcelain                                        # machine-readable output
  --progress                                         # force progress reporting
  --prune                                            # prune locally removed refs
  --push-option(-o): string                          # option to transmit
  --quiet(-q)                                        # be more quiet
  --receive-pack: string                             # receive pack program
  --recurse-submodules: string                       # control recursive pushing of submodules
  --repo: string                                     # repository
  --set-upstream(-u)                                 # set upstream for git pull/status
  --signed: string                                   # GPG sign the push
  --tags                                             # push tags (can't be used with --all or --mirror)
  --thin                                             # use thin pack
  --verbose(-v)                                      # be more verbose
]

# Pull changes
export extern "git pull" [
  remote?: string@"nu-complete git remotes",         # the name of the remote
  ...refs: string@"nu-complete git local branches",  # the branch / refspec
  --rebase(-r): string@"nu-complete git pull rebase",    # rebase current branch on top of upstream after fetching
  --quiet(-q)                                        # suppress output during transfer and merge
  --verbose(-v)                                      # be more verbose
  --commit                                           # perform the merge and commit the result
  --no-commit                                        # perform the merge but do not commit the result
  --edit(-e)                                         # edit the merge commit message
  --no-edit                                          # use the auto-generated merge commit message
  --cleanup: string                                  # specify how to clean up the merge commit message
  --ff                                               # fast-forward if possible
  --no-ff                                            # create a merge commit in all cases
  --gpg-sign(-S)                                     # GPG-sign the resulting merge commit
  --no-gpg-sign                                      # do not GPG-sign the resulting merge commit
  --log: int                                         # include log messages from merged commits
  --no-log                                           # do not include log messages from merged commits
  --signoff                                          # add Signed-off-by trailer
  --no-signoff                                       # do not add Signed-off-by trailer
  --stat(-n)                                         # show a diffstat at the end of the merge
  --no-stat                                          # do not show a diffstat at the end of the merge
  --squash                                           # produce working tree and index state as if a merge happened
  --no-squash                                        # perform the merge and commit the result
  --verify                                           # run pre-merge and commit-msg hooks
  --no-verify                                        # do not run pre-merge and commit-msg hooks
  --strategy(-s): string                             # use the given merge strategy
  --strategy-option(-X): string                      # pass merge strategy-specific option
  --verify-signatures                                # verify the tip commit of the side branch being merged
  --no-verify-signatures                             # do not verify the tip commit of the side branch being merged
  --summary                                          # show a summary of the merge
  --no-summary                                       # do not show a summary of the merge
  --autostash                                        # create a temporary stash entry before the operation
  --no-autostash                                     # do not create a temporary stash entry before the operation
  --allow-unrelated-histories                        # allow merging histories without a common ancestor
  --no-rebase                                        # do not rebase the current branch on top of the upstream branch
  --all                                              # fetch all remotes
  --append(-a)                                       # append fetched refs to existing contents of FETCH_HEAD
  --atomic                                           # use an atomic transaction to update local refs
  --depth: int                                       # limit fetching to the specified number of commits
  --deepen: int                                      # deepen the history by the specified number of commits
  --shallow-since: string                            # deepen or shorten the history since a specified date
  --shallow-exclude: string                          # exclude commits reachable from a specified branch or tag
  --unshallow                                        # convert a shallow repository to a complete one
  --update-shallow                                   # update .git/shallow with new refs
  --tags(-t)                                         # fetch all tags from the remote
  --jobs(-j): int                                    # number of parallel children for fetching
  --set-upstream                                     # add upstream (tracking) reference
  --upload-pack: string                              # specify non-default path for upload-pack on the remote
  --progress                                         # force progress status even if stderr is not a terminal
  --server-option(-o): string                        # transmit the given string to the server
]

# Switch between branches and commits
export extern "git switch" [
  switch?: string@"nu-complete git switch"        # name of branch to switch to
  start_point?: string@"nu-complete git rebase"   # name of the start point
  --create(-c)                                    # create a new branch
  --detach(-d): string@"nu-complete git log"      # switch to a commit in a detached state
  --force-create(-C): string                      # forces creation of new branch, if it exists then the existing branch will be reset to starting point
  --force(-f)                                     # alias for --discard-changes
  --guess                                         # if there is no local branch which matches then name but there is a remote one then this is checked out
  --ignore-other-worktrees                        # switch even if the ref is held by another worktree
  --merge(-m)                                     # attempts to merge changes when switching branches if there are local changes
  --no-guess                                      # do not attempt to match remote branch names
  --no-progress                                   # do not report progress
  --no-recurse-submodules                         # do not update the contents of sub-modules
  --no-track                                      # do not set "upstream" configuration
  --orphan: string                                # create a new orphaned branch
  --progress                                      # report progress status
  --quiet(-q)                                     # suppress feedback messages
  --recurse-submodules                            # update the contents of sub-modules
  --track(-t)                                     # set "upstream" configuration
]

# Apply the change introduced by an existing commit
export extern "git cherry-pick" [
  commit?: string@"nu-complete git commits all" # The commit ID to be cherry-picked
  --edit(-e)                                    # Edit the commit message prior to committing
  --no-commit(-n)                               # Apply changes without making any commit
  --signoff(-s)                                 # Add Signed-off-by line to the commit message
  --ff                                          # Fast-forward if possible
  --continue                                    # Continue the operation in progress
  --abort                                       # Cancel the operation
  --skip                                        # Skip the current commit and continue with the rest of the sequence
]

# Rebase the current branch
export extern "git rebase" [
  branch?: string@"nu-complete git rebase"    # name of the branch to rebase onto
  upstream?: string@"nu-complete git rebase"  # upstream branch to compare against
  --continue                                  # restart rebasing process after editing/resolving a conflict
  --abort                                     # abort rebase and reset HEAD to original branch
  --quit                                      # abort rebase but do not reset HEAD
  --interactive(-i)                           # rebase interactively with list of commits in editor
  --onto?: string@"nu-complete git rebase"    # starting point at which to create the new commits
  --root                                      # start rebase from root commit
]

# Merge from a branch
export extern "git merge" [
  # For now, to make it simple, we only complete branches (not commits) and support single-parent case.
  branch?: string@"nu-complete git mergable sources"         # The source branch
  --edit(-e)                                                 # Edit the commit message prior to committing
  --no-edit                                                  # Do not edit commit message
  --no-commit(-n)                                            # Apply changes without making any commit
  --signoff                                                  # Add Signed-off-by line to the commit message
  --ff                                                       # Fast-forward if possible
  --continue                                                 # Continue after resolving a conflict
  --abort                                                    # Abort resolving conflict and go back to original state
  --quit                                                     # Forget about the current merge in progress
  --strategy(-s): string@"nu-complete git merge strategies"  # Merge strategy
  -X: string@"nu-complete git merge strategy options"        # Option for merge strategy
  --verbose(-v)
  --help
]

# List or change branches
export extern "git branch" [
  ...branch: string@"nu-complete git local branches"             # name of branch (or branches) to operate on
  --abbrev                                                       # use short commit hash prefixes
  --edit-description                                             # open editor to edit branch description
  --merged                                                       # list reachable branches
  --no-merged                                                    # list unreachable branches
  --set-upstream-to: string@"nu-complete git available upstream" # set upstream for branch
  --unset-upstream                                               # remote upstream for branch
  --all                                                          # list both remote and local branches
  --copy                                                         # copy branch together with config and reflog
  --format                                                       # specify format for listing branches
  --move                                                         # rename branch
  --points-at                                                    # list branches that point at an object
  --show-current                                                 # print the name of the current branch
  --verbose                                                      # show commit and upstream for each branch
  --color                                                        # use color in output
  --quiet                                                        # suppress messages except errors
  --delete(-d)                                                   # delete branch
  -D                                                             # force delete branch
  --list                                                         # list branches
  --contains: string@"nu-complete git commits all"               # show only branches that contain the specified commit
  --no-contains                                                  # show only branches that don't contain specified commit
  --track(-t)                                                    # when creating a branch, set upstream
]

# List all variables set in config file, along with their values.
export extern "git config list" [
]

# Emits the value of the specified key.
export extern "git config get" [
]

# Set value for one or more config options.
export extern "git config set" [
]

# Unset value for one or more config options.
export extern "git config unset" [
]

# Rename the given section to a new name.
export extern "git config rename-section" [
]

# Remove the given section from the configuration file.
export extern "git config remove-section" [
]

# Opens an editor to modify the specified config file
export extern "git config edit" [
]

# List or change tracked repositories
export extern "git remote" [
  --verbose(-v)                            # Show URL for remotes
]

# Add a new tracked repository
export extern "git remote add" [
]

# Rename a tracked repository
export extern "git remote rename" [
  remote: string@"nu-complete git remotes"             # remote to rename
  new_name: string                                     # new name for remote
]

# Remove a tracked repository
export extern "git remote remove" [
  remote: string@"nu-complete git remotes"             # remote to remove
]

# Get the URL for a tracked repository
export extern "git remote get-url" [
  remote: string@"nu-complete git remotes"             # remote to get URL for
]

# Set the URL for a tracked repository
export extern "git remote set-url" [
  remote: string@"nu-complete git remotes"             # remote to set URL for
  url: string                                          # new URL for remote
]

# Show changes between commits, working tree etc
export extern "git diff" [
  rev1_or_file?: string@"nu-complete git files-or-refs"
  rev2?: string@"nu-complete git refs"
  --cached                                             # show staged changes
  --name-only                                          # only show names of changed files
  --name-status                                        # show changed files and kind of change
  --no-color                                           # disable color output
]

# Commit changes
export extern "git commit" [
  --all(-a)                                           # automatically stage all modified and deleted files
  --amend                                             # amend the previous commit rather than adding a new one
  --message(-m): string                               # specify the commit message rather than opening an editor
  --reuse-message(-C): string                         # reuse the message from a previous commit
  --reedit-message(-c): string                        # reuse and edit message from a commit
  --fixup: string                                     # create a fixup/amend commit
  --squash: string                                    # squash commit for autosquash rebase
  --reset-author                                      # reset author information
  --short                                             # short-format output for dry-run
  --branch                                            # show branch info in short-format
  --porcelain                                         # porcelain-ready format for dry-run
  --long                                              # long-format output for dry-run
  --null(-z)                                          # use NUL instead of LF in output
  --file(-F): string                                  # read commit message from file
  --author: string                                    # override commit author
  --date: string                                      # override author date
  --template(-t): string                              # use commit message template file
  --signoff(-s)                                       # add Signed-off-by trailer
  --no-signoff                                        # do not add Signed-off-by trailer
  --trailer: string                                   # add trailer to commit message
  --no-verify(-n)                                     # bypass pre-commit and commit-msg hooks
  --verify                                            # do not bypass pre-commit and commit-msg hooks
  --allow-empty                                       # allow commit with no changes
  --allow-empty-message                               # allow commit with empty message
  --cleanup: string                                   # cleanup commit message
  --edit(-e)                                          # edit commit message
  --no-edit                                           # do not edit commit message
  --include(-i)                                       # include given paths in commit
  --only(-o)                                          # commit only specified paths
  --pathspec-from-file: string                        # read pathspec from file
  --pathspec-file-nul                                 # use NUL character for pathspec file
  --untracked-files(-u): string                       # show untracked files
  --verbose(-v)                                       # show diff in commit message template
  --quiet(-q)                                         # suppress commit summary
  --dry-run                                           # show paths to be committed without committing
  --status                                            # include git-status output in commit message
  --no-status                                         # do not include git-status output
  --gpg-sign(-S)                                      # GPG-sign commit
  --no-gpg-sign                                       # do not GPG-sign commit
  ...pathspec: string                                 # commit files matching pathspec
]

# List commits
export extern "git log" [
  # Ideally we'd allow completion of revisions here, but that would make completion of filenames not work.
  -U                                                  # show diffs
  --follow                                            # show history beyond renames (single file only)
  --grep: string                                      # show log entries matching supplied regular expression
]

# Show or change the reflog
export extern "git reflog" [
]

# Stage files
export extern "git add" [
  ...file: string@"nu-complete git add"               # file to add
  --all(-A)                                           # add all files
  --dry-run(-n)                                       # don't actually add the file(s), just show if they exist and/or will be ignored
  --edit(-e)                                          # open the diff vs. the index in an editor and let the user edit it
  --force(-f)                                         # allow adding otherwise ignored files
  --interactive(-i)                                   # add modified contents in the working tree interactively to the index
  --patch(-p)                                         # interactively choose hunks to stage
  --verbose(-v)                                       # be verbose
]

# Delete file from the working tree and the index
export extern "git rm" [
  -r                                                   # recursive
  --force(-f)                                          # override the up-to-date check
  --dry-run(-n)                                        # Don't actually remove any file(s)
  --cached                                             # unstage and remove paths only from the index
]

# Show the working tree status
export extern "git status" [
  --verbose(-v)                                       # be verbose
  --short(-s)                                         # show status concisely
  --branch(-b)                                        # show branch information
  --show-stash                                        # show stash information
]

# Stash changes for later
export extern "git stash push" [
  --patch(-p)                                         # interactively choose hunks to stash
]

# Unstash previously stashed changes
export extern "git stash pop" [
  stash?: string@"nu-complete git stash-list"          # stash to pop
  --index(-i)                                          # try to reinstate not only the working tree's changes, but also the index's ones
]

# List stashed changes
export extern "git stash list" [
]

# Show a stashed change
export extern "git stash show" [
  stash?: string@"nu-complete git stash-list"
  -U                                                  # show diff
]

# Drop a stashed change
export extern "git stash drop" [
  stash?: string@"nu-complete git stash-list"
]

# Create a new git repository
export extern "git init" [
  --initial-branch(-b): string                         # initial branch name
]

# List or manipulate tags
export extern "git tag" [
  --delete(-d): string@"nu-complete git tags"         # delete a tag
]

# Prune all unreachable objects
export extern "git prune" [
  --dry-run(-n)                                       # dry run
  --expire: string                                    # expire objects older than
  --progress                                          # show progress
  --verbose(-v)                                       # report all removed objects
]

# Start a binary search to find the commit that introduced a bug
export extern "git bisect start" [
  bad?: string                 # a commit that has the bug
  good?: string                # a commit that doesn't have the bug
]

# Mark the current (or specified) revision as bad
export extern "git bisect bad" [
]

# Mark the current (or specified) revision as good
export extern "git bisect good" [
]

# Skip the current (or specified) revision
export extern "git bisect skip" [
]

# End bisection
export extern "git bisect reset" [
]

# Show help for a git subcommand
export extern "git help" [
  command?: string@"nu-complete git subcommands"       # subcommand to show help for
]

# git worktree
export extern "git worktree" [
  --help(-h)            # display the help message for this command
  ...args
]

# create a new working tree
export extern "git worktree add" [
  path: path            # directory to clone the branch
  branch?: string@"nu-complete git available upstream" # Branch to clone
  --help(-h)            # display the help message for this command
  --force(-f)           # checkout <branch> even if already checked out in other worktree
  -b                    # create a new branch
  -B                    # create or reset a branch
  --detach(-d)          # detach HEAD at named commit
  --checkout            # populate the new working tree
  --lock                # keep the new working tree locked
  --reason              # reason for locking
  --quiet(-q)           # suppress progress reporting
  --track               # set up tracking mode (see git-branch(1))
  --guess-remote        # try to match the new branch name with a remote-tracking branch
  ...args
]

# list details of each worktree
export extern "git worktree list" [
  --help(-h)            # display the help message for this command
  --porcelain           # machine-readable output
  --verbose(-v)         # show extended annotations and reasons, if available
  --expire              # add 'prunable' annotation to worktrees older than <time>
  -z                    # terminate records with a NUL character
  ...args
]

def "nu-complete worktree list" [] {
  ^git worktree list | to text | parse --regex '(?P<value>\S+)\s+(?P<commit>\w+)\s+(?P<description>\S.*)'
}

# prevent a working tree from being pruned
export extern "git worktree lock" [
  worktree: string@"nu-complete worktree list"
  --reason: string      # reason because the tree is locked
  --help(-h)            # display the help message for this command
  --reason              # reason for locking
  ...args
]

# move a working tree to a new location
export extern "git worktree move" [
  --help(-h)            # display the help message for this command
  --force(-f)           # force move even if worktree is dirty or locked
  ...args
]

# prune working tree information
export extern "git worktree prune" [
  --help(-h)            # display the help message for this command
  --dry-run(-n)         # do not remove, show only
  --verbose(-v)         # report pruned working trees
  --expire              # expire working trees older than <time>
  ...args
]

# remove a working tree
export extern "git worktree remove" [
  worktree: string@"nu-complete worktree list"
  --help(-h)            # display the help message for this command
  --force(-f)           # force removal even if worktree is dirty or locked
]

# allow working tree to be pruned, moved or deleted
export extern "git worktree unlock" [
  worktree: string@"nu-complete worktree list"
  ...args
]

# clones a repo
export extern "git clone" [
  --help(-h)                    # display the help message for this command
  --local(-l)                   # cloning from the local machine
  --no-local                    # use the git transport mechanism even if cloning from a local path
  --no-hardlinks                # force git to copy files when cloning from the local machine
  --shared(-s)                  # setup .git/objects/info/alternates to share objects with the source local repo
  --reference: string           # setup .git/objects/info/alternates to share objects with the =<reference> local repo
  --reference-if-able: string   # same as --reference, but skips empty folders
  --dissociate                  # borrow objects from the referenced repo (--reference)
  --quiet(-q)                   # suppress progress reporting
  --verbose(-v)                 # be verbose
  --progress                    # report progress unless --quiet
  --server-option: string       # transmit the =<option> to the server
  --no-checkout(-n)             # no checkout of HEAD
  --reject-shallow              # reject shallow repository as source
  --no-reject-shallow           # do not reject shallow repository as source
  --bare                        # make a bare git repo
  --sparse                      # initialize the sparse-checkout file
  --filter: string              # partial clone using the given =<filter-spec>
  --mirror                      # mirror the source repo
  --origin(-o): string          # use <name> as the name for the remote origin
  --branch(-b): string          # point HEAD to <name> branch
  --upload-pack(-u): string     # use <upload-pack> as the path in the other end when using ssh
  --template: string            # use <template-dir> as the templates directory
  --config(-c): string          # set a <key>=<value> config variable
  --depth: int                  # shallow clone <depth> commits
  --shallow-since: string       # shallow clone commits newer than =<date>
  --shallow-exclude: string     # do not clone commits reachable from <revision> (branch or tag)
  --single-branch               # clone commit history from a single branch
  --no-single-Branch            # do not clone only one branch
  --no-tags                     # do not clone any tags
  --recurse-submodules          # clone the submodules. Also accepts paths
  --shallow-submodules          # shallow clone submodules with depth 1
  --no-shallow-submodules       # do not shallow clone submodules
  --remote-submodules           # submodules are updating using their remote tracking branch
  --no-remote-submodules        # do not track submodules remote
  --separate-git-dir: string    # place the clone at =<git dir> and link it here
  --jobs(-j): int               # number of simultaneous submodules fetch
  ...args
]

# Restores files in working tree or index to previous versions
export extern "git restore" [
  --help(-h)                                    # Display the help message for this command
  --source(-s)                                  # Restore the working tree files with the content from the given tree
  --patch(-p)                                   # Interactively choose hunks to restore
  --worktree(-W)                                # Restore working tree (default if neither --worktree or --staged is used)
  --staged(-S)                                  # Restore index
  --quiet(-q)                                   # Quiet, suppress feedback messages
  --progress                                    # Force progress reporting
  --no-progress                                 # Suppress progress reporting
  --ours                                        # Restore from index using our version for unmerged files
  --theirs                                      # Restore from index using their version for unmerged files
  --merge(-m)                                   # Restore from index and recreate the conflicted merge in unmerged files
  --conflict: string                            # Like --merge but changes the conflict presentation with =<style>
  --ignore-unmerged                             # Restore from index and ignore unmerged entries (unmerged files are left as is)
  --ignore-skip-worktree-bits                   # Ignore sparse checkout patterns and unconditionally restores any files in <pathspec>
  --recurse-submodules                          # Restore the contents of sub-modules in working tree
  --no-recurse-submodules                       # Do not restore the contents of sub-modules in working tree (default)
  --overlay                                     # Do not remove files that don't exist when restoring from tree with --source
  --no-overlay                                  # Remove files that don't exist when restoring from tree with --source (default)
  --pathspec-from-file: string                  # Read pathspec from file
  --pathspec-file-nul                           # Separate pathspec elements with NUL character when reading from file
  ...pathspecs: string@"nu-complete git files"  # Target pathspecs to restore
]

# Print lines matching a pattern
export extern "git grep" [
  --help(-h)                            # Display the help message for this command
  --cached                              # Search blobs registered in the index file instead of worktree
  --untracked                           # Include untracked files in search
  --no-index                            # Similar to `grep -r`, but with additional benefits, such as using pathspec patterns to limit paths; Cannot be used together with --cached or --untracked
  --no-exclude-standard                 # Include ignored files in search (only useful with --untracked)
  --exclude-standard                    # No not include ignored files in search (only useful with --no-index)
  --recurse-submodules                  # Recursively search in each submodule that is active and checked out
  --text(-a)                            # Process binary files as if they were text
  --textconv                            # Honor textconv filter settings
  --no-textconv                         # Do not honor textconv filter settings (default)
  --ignore-case(-i)                     # Ignore case differences between patterns and files
  -I                                    # Don’t match the pattern in binary files
  --max-depth: int                      # Max <depth> to descend down directories for each pathspec. A value of -1 means no limit.
  --recursive(-r)                       # Same as --max-depth=-1
  --no-recursive                        # Same as --max-depth=0
  --word-regexp(-w)                     # Match the pattern only at word boundary
  --invert-match(-v)                    # Select non-matching lines
  -H                                    # Suppress filename in output of matched lines
  --full-name                           # Force relative path to filename from top directory
  --extended-regexp(-E)                 # Use POSIX extended regexp for patterns
  --basic-regexp(-G)                    # Use POSIX basic regexp for patterns (default)
  --perl-regexp(-P)                     # Use Perl-compatible regular expressions for patterns
  --line-number(-n)                     # Prefix the line number to matching lines
  --column                              # Prefix the 1-indexed byte-offset of the first match from the start of the matching line
  --files-with-matches(-l)              # Print filenames of files that contains matches
  --name-only                           # Same as --files-with-matches
  --files-without-match(-L)             # Print filenames of files that do not contain matches
  --null(-z)                            # Use \0 as the delimiter for pathnames in the output, and print them verbatim
  --only-matching(-o)                   # Print only the matched (non-empty) parts of a matching line, with each such part on a separate output line
  --count(-c)                           # Instead of showing every matched line, show the number of lines that match
  --no-color                            # Same as --color=never
  --break                               # Print an empty line between matches from different files.
  --heading                             # Show the filename above the matches in that file instead of at the start of each shown line.
  --show-function(-p)                   # Show the preceding line that contains the function name of the match, unless the matching line is a function name itself.
  --context(-C): int                    # Show <num> leading and trailing lines, and place a line containing -- between contiguous groups of matches.
  --after-context(-A): int              # Show <num> trailing lines, and place a line containing -- between contiguous groups of matches.
  --before-context(-B): int             # Show <num> leading lines, and place a line containing -- between contiguous groups of matches.
  --function-context(-W)                # Show the surrounding text from the previous line containing a function name up to the one before the next function name
  --max-count(-m): int                  # Limit the amount of matches per file. When using the -v or --invert-match option, the search stops after the specified number of non-matches.
  --threads: int                        # Number of grep worker threads to use. Use --help for more information on grep threads.
  -f: string                            # Read patterns from <file>, one per line.
  -e: string                            # Next parameter is the pattern. Multiple patterns are combined by --or.
  --and                                 # Search for lines that match multiple patterns.
  --or                                  # Search for lines that match at least one of multiple patterns. --or is implied between patterns without --and or --not.
  --not                                 # Search for lines that does not match pattern.
  --all-match                           # When giving multiple pattern expressions combined with --or, this flag is specified to limit the match to files that have lines to match all of them.
  --quiet(-q)                           # Do not output matched lines; instead, exit with status 0 when there is a match and with non-zero status when there isn’t.
  ...pathspecs: string                  # Target pathspecs to limit the scope of the search.
]

export extern "git" [
  command?: string@"nu-complete git subcommands"   # Subcommands
  --version(-v)                                    # Prints the Git suite version that the git program came from
  --help(-h)                                       # Prints the synopsis and a list of the most commonly used commands
  --html-path                                      # Print the path, without trailing slash, where Git’s HTML documentation is installed and exit
  --man-path                                       # Print the manpath (see man(1)) for the man pages for this version of Git and exit
  --info-path                                      # Print the path where the Info files documenting this version of Git are installed and exit
  --paginate(-p)                                   # Pipe all output into less (or if set, $env.PAGER) if standard output is a terminal
  --no-pager(-P)                                   # Do not pipe Git output into a pager
  --no-replace-objects                             # Do not use replacement refs to replace Git objects
  --bare                                           # Treat the repository as a bare repository
]


# endregion

# region: gh

def "nu-complete gh" [] {
    ^gh --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh" [
    command?: string@"nu-complete gh"
    --help          # Show help for command
]

def "nu-complete gh auth" [] {
    ^gh auth --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh auth" [
    command?: string@"nu-complete gh auth"
    --help          # Show help for command
]

export extern "gh browse" [
    command?: string   # TODO: completion with [<PR number> | <file path> | <commit-SHA>]
    --branch(-b)       # Select another branch by passing in the branch name
    --commit(-c)       # Select another commit by passing in the commit SHA, default is the last commit
    --no-browser(-n)   # Print destination URL instead of opening the browser
    --projects(-p)     # Open repository projects
    --releases(-r)     # Open repository releases
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --settings(-s)     # Open repository settings
    --wiki(-w)         # Open repository wiki
    --help             # Show help for command
]

def "nu-complete gh codespace" [] {
    ^gh codespace --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh codespace" [
    command?: string@"nu-complete gh codespace"
    --help             # Show help for command
]

def "nu-complete gh gist" [] {
    ^gh gist --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh gist" [
    command?: string@"nu-complete gh gist"
    --help             # Show help for command
]

export extern "gh gist clone" [
    gist: string        # gist to clone
    directory?:path     # directory to clone
    --help             # Show help for command
]

export extern "gh gist create" [
    filename_or_stdin: string        # gist to create
    --desc(-d): string               # A description for this gist
    --filename(-f): string           # Provide a filename to be used when reading from standard input
    --public(-p)                     # List the gist publicly (default: secret)
    --web(-w)                        # Open the web browser with created gist
    --public                         # Make the new gist public
    --help                           # Show help for command
]

export extern "gh gist delete" [
    gist: string@"nu-complete gist list"        # gist to delete
    --help                           # Show help for command
]

export extern "gh gist edit" [
    gist?: string@"nu-complete gist list"        # gist to edit
    --add(-a): string                # Add a new file to the gist
    --desc(-d): string               # New description for the gist
    --filename(-f): string           # Select a file to edit
    --remove(-r): string             # Remove a file from the gist
    --help                           # Show help for command
]

def "nu-complete gist list" [] {
    # TODO add the name of the gist to autocompletion
    ^gh gist list --limit 100 | lines | str replace --regex --multiline '\S+\K.*' ''
}

export extern "gh gist list" [
    --limit(-L): number     # Maximum number of repositories to list (default 30)
    --public                         # Show only the public gists
    --secret                         # Show only the secret gists
    --help                           # Show help for command
]

export extern "gh gist rename" [
    gist: string                   # gist to rename
    oldFilename: string            # gist to rename
    newFilename: string            # gist to rename
    --help                           # Show help for command
]

export extern "gh gist view" [
    gist?: string             # gist to view
    --filename(-f): string    # Display a single file from the gist
    --files                   # List file names from the gist
    --raw(-r)                 # Print raw instead of rendered gist contents
    --web(-w)                 # Open gist in the browser
    --help                           # Show help for command
]

def "nu-complete gh issue" [] {
    ^gh issue --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh issue" [
    command?: string@"nu-complete gh issue"
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --help             # Show help for command
]

def "nu-complete gh org" [] {
    ^gh org --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh org" [
    command?: string@"nu-complete gh org"
    --help             # Show help for command
]

def "nu-complete gh pr" [] {
    ^gh pr --help | lines | where { str starts-with "  " } | skip 1 | parse "{value}: {description}" | str trim
}

export extern "gh pr" [
    command?: string@"nu-complete gh pr"
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --help             # Show help for command
]

def "nu-complete gh list prs" [] {
    gh pr list --json title,number,author,updatedAt | from json | update author {|row| $row.author.login } | rename --column { number: value } | insert description { |row| ( $row.updatedAt | date humanize) + " - " + $row.title + " by " + $row.author } | select value description 
}

export extern "gh pr checkout" [
   branch_url_or_PRnumber: string@"nu-complete gh list prs" # {<number> | <url> | <branch>}
   --branch(-b): string           # Local branch name to use (default: the name of the head branch)
   --detach                       # Checkout PR with a detached HEAD
   --force(-f)                    # Reset the existing local branch to the latest state of the pull request
   --recurse-submodules           # Update all submodules after checkout   
   --repo(-R)                     # Select another repository using the [HOST/]OWNER/REPO format
   --help                         # Show help for command
]

def "nu-complete gh project" [] {
    ^gh project --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh project" [
    command?: string@"nu-complete gh project"
    --help             # Show help for command
]

def "nu-complete gh release" [] {
    ^gh release --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh release" [
    command?: string@"nu-complete gh release"
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --help             # Show help for command
]

def "nu-complete gh repo" [] {
    ^gh repo --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh repo" [
    command?: string@"nu-complete gh repo"
    --help             # Show help for command
]

def "nu-complete gh repo clone" [] {
    # regex that actually works
    # ^(?P<value>\S+) +(?P<description>\S+( \S+)*)? {2,}(?P<Visibility>public|private),?.*(?P<updated>about.*)
    ^gh repo list --limit 100 | lines | str replace --regex --multiline '\S+\K.*' ''
}

export extern "gh repo clone" [
    command: string@"nu-complete gh repo clone"
    --help             # Show help for command
]

def "nu-complete visibility" [] {
    ['public', 'private', 'internal']
}

export extern "gh repo list" [
    owner?: string          # List repos of this owner
    --archived              # Show only archived repositories
    --fork                  # Show only forks
    --jq(-q):string         # Filter JSON output using a jq expression
    --json: string          # Output JSON with the specified fields
    --language(-l): string  # Filter by primary coding language
    --limit(-L): number     # Maximum number of repositories to list (default 30)
    --no-archived           # Omit archived repositories
    --source                # Show only non-forks
    --template(-t): string  # Format JSON output using a Go template; see "gh help formatting"
    --topic: string         # Filter by topic
    --visibility: string@"nu-complete visibility"   # Filter by repository visibility: {public|private|internal}
    --help                  # Show help for command
]

export extern "gh repo view" [
    org_repo: string       # <ORG/REPO> to view
    --branch(-b):string    # View a specific branch of the repository
    --jq(-q):string        # Filter JSON output using a jq expression
    --json: string         # Output JSON with the specified fields
    --template(-t):string  # Format JSON output using a Go template; see "gh help formatting"
    --web                  # Open a repository in the browser
    --help                  # Show help for command
]

def "nu-complete gitignore list" [] {
    ^gh api  -H "Accept: application/vnd.github+json"  /gitignore/templates
    | from json
}

def "nu-complete licenses list" [] {
    let value = ^gh api  -H "Accept: application/vnd.github+json" /licenses | from json | get key | enumerate | reject index | rename value
    let description = ^gh api  -H "Accept: application/vnd.github+json" /licenses | from json | get name | enumerate | reject index | rename description
    $value | merge $description
}

export extern "gh repo create" [
    repo_name?: string
    --help                     # Show help for command
    --add-readme               # Add a README file to the new repository
    --clone(-c)                # Clone the new repository to the current directory
    --description(-d): string  # Description of the repository
    --disable-issues           # Disable issues in the new repository
    --disable-wiki             # Disable wiki in the new repository
    --gitignore(-g): string@"nu-complete gitignore list"    # Specify a gitignore template for the repository
    --homepage(-g): string     # Repository home page URL
    --include-all-branches     # Include all branches from template repository
    --internal                 # Make the new repository internal
    --license(-l): string@"nu-complete licenses list"      # Specify an Open Source License for the repository
    --private                  # Make the new repository private
    --public                   # Make the new repository public
    --push                     # Push local commits to the new repository
    --remote(-r): string       # Specify remote name for the new repository
    --source(-s): string       # Specify path to local repository to use as source
    --team(-t): string         # The name of the organization team to be granted access
    --template(-p): string     # Make the new repository based on a template repository
]

export extern "gh repo fork" [
    repo?: string
    --clone                # Clone the fork
    --default-branch-only  # Only include the default branch in the fork
    --fork-name: string    # Rename the forked repository
    --org: string          # Create the fork in an organization
    --remote               # Add a git remote for the fork
    --remote-name: string  # Specify the name for the new remote (default "origin")
    --help                 # Show help for command
]

def "nu-complete gh cache" [] {
    ^gh cache --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh cache" [
    command?: string@"nu-complete gh cache"
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --help             # Show help for command
]

def "nu-complete gh run" [] {
    ^gh run --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh run" [
    command?: string@"nu-complete gh run"
    --help          # Show help for command
]

def "nu-complete gh workflow" [] {
    ^gh workflow --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh workflow" [
    command?: string@"nu-complete gh workflow"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]

def "nu-complete gh alias" [] {
    ^gh alias --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh alias" [
    command?: string@"nu-complete gh alias"
    --help          # Show help for command
]

def "nu-complete gh api" [] {
    # TODO
    # endpoints
    # ["graphql", "gists"]
}

export extern "gh api" [
    --cache                      # Cache the response, e.g. "3600s", "60m", "1h"
    --field(-F)                  # `key=value` Add a typed parameter in key=value format
    --header(-H)                 # `key:value` Add a HTTP request header in key:value format
    --hostname                   # The GitHub hostname for the request (default "github.com")
    --include(-i)                # Include HTTP response status line and headers in the output
    --input file                 # The file to use as body for the HTTP request (use "-" to read from standard input)
    --jq(-q)                     # Query to select values from the response using jq syntax
    --method(-X)                 # The HTTP method for the request (default "GET")
    --paginate                   # Make additional HTTP requests to fetch all pages of results
    --preview(-p)                # GitHub API preview names to request (without the "-preview" suffix)
    --raw-field(-f)              # `key:value` Add a string parameter in key=value format
    --silent                     # Do not print the response body
    --template(-t)               # Format JSON output using a Go template; see "gh help formatting"
    --verbose                    # Include full HTTP request and response in the output
    --help                   # Show help for command
    command?: string@"nu-complete gh api"
]

def "nu-complete gh completion" [] {
  ['bash', 'fish', 'powershell', 'zsh']
}

export extern "gh completion" [
    command?: string@"nu-complete gh completion"
    --shell(-s)     # Shell type: {bash|zsh|fish|powershell}
    --help          # Show help for command
]

def "nu-complete gh config" [] {
    ^gh config --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh config" [
    command?: string@"nu-complete gh config"
    --help          # Show help for command
]

def "nu-complete gh extension" [] {
    ^gh extension --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh extension" [
    command?: string@"nu-complete gh extension"
    --help          # Show help for command
]

def "nu-complete gh gpg-key" [] {
    ^gh gpg-key --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh gpg-key" [
    command?: string@"nu-complete gh gpg-key"
    --help          # Show help for command
]

def "nu-complete gh label" [] {
    ^gh label --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh label" [
    command?: string@"nu-complete gh label"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]

def "nu-complete gh ruleset" [] {
    ^gh ruleset --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh ruleset" [
    command?: string@"nu-complete gh ruleset"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]

def "nu-complete gh search" [] {
    ^gh search --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh search" [
    --extension      # Filter on file extension
    --filename       # Filter on filename
    --jq(-q)         # Filter JSON output using a jq expression
    --json           # Output JSON with the specified fields
    --language       # Filter results by language
    --limit(-L)      # Maximum number of code results to fetch (default 30)
    --match          # Restrict search to file contents or file path: {file|path}
    --owner          # Filter on owner
    --repo(-R)       # Filter on repository
    --size           # Filter on size range, in kilobytes
    --template(-t)   # Format JSON output using a Go template; see "gh help formatting"
    --web(-w) a      # Open the search query in the web browser   
    --help           # Show help for command
    command?: string@"nu-complete gh search"
]

def "nu-complete gh secret" [] {
    ^gh secret --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh secret" [
    command?: string@"nu-complete gh secret"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]

def "nu-complete gh ssh-key" [] {
    ^gh ssh-key --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh ssh-key" [
    command?: string@"nu-complete gh ssh-key"
    --help          # Show help for command
]

export extern "gh status" [
    --exclude(-e)   # Comma separated list of repos to exclude in owner/name format
    --org(-o)       # Report status within an organization
    --help          # Show help for command
]

def "nu-complete gh variable" [] {
    ^gh variable --help 
    | lines 
    | where { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh variable" [
    command?: string@"nu-complete gh variable"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]

export def "gh pr view inlined-comments" [
    pr?: int
    repo?: string  # e.g. nushell/nu_scripts
] {
# nushell/nu_scripts/pull/1105
    let pr = if ($pr == null) { ^gh pr view --json number | from json | get number } else { $pr }
    let repo = if ($repo == null) {
        ^gh repo view --json name,owner | from json | select owner.login name | rename owner name
    } else {
        $repo | parse '{owner}/{name}' | get 0
    }

    ( (gh api
          -H "Accept: application/vnd.github+json"
          -H "X-GitHub-Api-Version: 2022-11-28"
          $"/repos/($repo.owner.)/($repo.name)/pulls/($pr)/comments")
      | from json
      | select user.login body diff_hunk
      | rename user comment diff )
}

def "gh get stars" [
    end_cursor: string = ""  # endCursor from a previous query
    --first: int = 100  # returns the first n elements from the list
] {
    # https://docs.github.com/en/graphql/reference/objects#user
    ^gh api graphql -F $'first=($first)' -F $'endCursor=($end_cursor)' -f query='
      query($first: Int, $endCursor: String!){
        viewer {
          starredRepositories(first: $first, after: $endCursor, orderBy: {field: STARRED_AT, direction: DESC}) {
            edges { node { url description } starredAt }
            pageInfo { hasNextPage endCursor }
          }
        }
      }
    '
    | from json | select data.viewer.starredRepositories.edges data.viewer.starredRepositories.pageInfo
    | rename stars pageInfo
}

export def "gh my stars" [] {
    mut stars = []
    mut end_cursor = ""
    loop {
        let $part = gh get stars $end_cursor
        $stars = $stars | append $part.stars
        if $part.pageInfo?.hasNextPage? == true {
            $end_cursor = $part.pageInfo.endCursor
        } else {
            break
        }
    }
    $stars | flatten | update cells --columns [starredAt] { $in | into datetime } | sort-by starredAt
}


# endregion

# region: jj

# Completions based on Jujutsu 0.40.0

def operations [] {
  {
    options: {
      sort: false,
    },
    completions: (^jj op log --ignore-working-copy --color never --no-graph -T 'id.short() ++ " " ++ description.first_line() ++ "\n"' | parse --regex '(?<value>\w+) (?<description>.*)'),
  }
}

def revisions [] {
  ^jj log --ignore-working-copy --color never --no-graph -r 'all()' -T 'change_id.short() ++ " " ++ description.first_line() ++ "\n"' | parse --regex '(?<value>\w+) (?<description>.*)'
}

def all-bookmarks [] {
  ^jj bookmark list --ignore-working-copy --color never --all-remotes -T 'if(remote != "git", name ++ if(remote, "@" ++ remote) ++ "\n")' | lines
}

def local-bookmarks [] {
  ^jj bookmark list --ignore-working-copy --color never -T 'if(!remote, name ++ "\n")' | lines
}

def tracked-bookmarks [] {
  ^jj bookmark list --ignore-working-copy --color never --all-remotes -T 'if(tracked && remote != "git", name ++ "\n")' | lines | uniq
}

def untracked-bookmarks [] {
  ^jj bookmark list --ignore-working-copy --color never --all-remotes -T 'if(!tracked && remote != "git", name ++ "\n")' | lines | uniq
}

def tags [] {
  ^jj tag list --ignore-working-copy --color never -T 'if(!remote, name ++ "\n")' | lines
}

def revsets [] {
  {
    options: { sort: false },
    completions: [
      ...(all-bookmarks | each {|b| { value: $b, style: purple } }),
      ...(tags | each {|t| { value: $t, style: default }}),
      ...(^jj log --ignore-working-copy --color never --no-graph -r 'all()' -T 'change_id.short() ++ " " ++ description.first_line() ++ "\n"' | parse --regex '(?<value>\w+) (?<description>.*)' | each {|o| { ...$o, style: cyan } }),
    ]
  }
}

def remotes [] {
  ^jj git remote list --ignore-working-copy --color never | parse --regex '(?<value>\S+)\s+(?<description>\S+)'
}

def workspaces [] {
  ^jj --ignore-working-copy --color never workspace list -T 'name ++ "\n"' | lines
}

def modes [] {
  [
    { value: 'normal', description: 'make a path non-executable' }
    { value: 'executable', description: 'male a path executable' }
  ]
}

def fetch-tags [] {
  [
    { value: 'all', description: 'always fetch all tags' }
    { value: 'included', description: 'only fetch tags that point to transmitted objects' }
    { value: 'none', description: 'do not fetch tags' }
  ]
}

def commands [] {
  [
    'abandon'
    'absorb'
    'arrange'
    'bisect'
    'bisect run'
    'bookmark'
    'bookmark advance'
    'bookmark create'
    'bookmark delete'
    'bookmark forget'
    'bookmark list'
    'bookmark move'
    'bookmark rename'
    'bookmark set'
    'bookmark track'
    'bookmark untrack'
    'commit'
    'config'
    'config edit'
    'config get'
    'config list'
    'config path'
    'config set'
    'config unset'
    'describe'
    'diff'
    'diffedit'
    'duplicate'
    'edit'
    'evolog'
    'file'
    'file annotate'
    'file chmod'
    'file list'
    'file search'
    'file show'
    'file track'
    'file untrack'
    'fix'
    'gerrit'
    'gerrit upload'
    'git'
    'git clone'
    'git colocation'
    'git colocation disable'
    'git colocation enable'
    'git colocation status'
    'git export'
    'git fetch'
    'git import'
    'git init'
    'git push'
    'git remote'
    'git remote add'
    'git remote list'
    'git remote remove'
    'git remote rename'
    'git remote set-url'
    'git root'
    'help'
    'interdiff'
    'log'
    'metaedit'
    'new'
    'next'
    'operation'
    'operation abandon'
    'operation diff'
    'operation integrate'
    'operation log'
    'operation restore'
    'operation revert'
    'operation show'
    'parallelize'
    'prev'
    'rebase'
    'redo'
    'resolve'
    'restore'
    'revert'
    'root'
    'show'
    'sign'
    'simplify-parents'
    'sparse'
    'sparse edit'
    'sparse list'
    'sparse reset'
    'sparse set'
    'split'
    'squash'
    'status'
    'tag'
    'tag delete'
    'tag list'
    'tag set'
    'undo'
    'unsign'
    'util'
    'util completion'
    'util config-schema'
    'util exec'
    'util gc'
    'util install-man-pages'
    'util markdown-help'
    'util snapshot'
    'version'
    'workspace'
    'workspace add'
    'workspace forget'
    'workspace list'
    'workspace rename'
    'workspace root'
    'workspace update-stale'
  ]
}

def keywords [] {
  [
    { value: 'bookmarks', description: 'named pointers to revisions' }
    { value: 'config', description: 'how and where to set configuration options' }
    { value: 'filesets', description: 'a functional language for selecting a set of files' }
    { value: 'glossary', description: 'definitions of various terms' }
    { value: 'revsets', description: 'a functional language for selecting a set of revision' }
    { value: 'templates', description: 'a functional language to customize command output' }
    { value: 'tutorial', description: 'show a tutorial to get started with jj' }
  ]
}

def bookmarks-sort [] {
  [
    'name'
    'name-'
    'author-name'
    'author-name-'
    'author-email'
    'author-email-'
    'author-date'
    'author-date-'
    'committer-name'
    'committer-name-'
    'committer-email'
    'committer-email-'
    'committer-date'
    'committer-date-'
  ]
}

def tags-sort [] {
  [
    'name'
    'name-'
    'author-name'
    'author-name-'
    'author-email'
    'author-email-'
    'author-date'
    'author-date-'
    'committer-name'
    'committer-name-'
    'committer-email'
    'committer-email-'
    'committer-date'
    'committer-date-'
  ]
}

def restore-options [] {
  [
    { value: 'repo', description: 'the jj repo state and local bookmarks' }
    { value: 'remote-tracking', description: 'the remote-tracking bookmarks' }
  ]
}

def shells [] {
  ['bash', 'elvish', 'fish', 'nushell', 'power-shell', 'zsh']
}

def sparse-patterns [] {
  [
    { value: 'copy', description: 'copy all sparse patterns from the current workspace' }
    { value: 'full', description: 'include all files in the new workspace' }
    { value: 'empty', description: 'clear all files from the workspace' }
  ]
}

def color-when [] {
  ['always', 'never', 'debug', 'auto']
}

def gerrit-notify [] {
  [
    { value: 'none', description: 'no notification' }
    { value: 'owner', description: 'notify the change owner' }
    { value: 'owner-reviewers', description: 'notify the change owner and reviewers' }
    { value: 'all', description: 'notify all relevant users' }
  ]
}

# Abandon a revision
export extern "jj abandon" [
  ...revsets: string@revsets                # the revision(s) to abandon (default: @)
  --retain-bookmarks                        # move bookmakrs to parent revisions
  --restore-descendents                     # do not modify the content of the children of the abandoned commits
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Move changes from a revision into the stack of mutable revisions
export extern "jj absorb" [
  ...filesets: path                         # move only changes to these paths
  --from(-f): string@revsets                # source revision to absorb from
  --into(-t): string@revsets                # destination revisions to absorb into
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Interactively arrange the commit graph
export extern "jj arrange" [
  ...revisions: string@revsets              # the revisions to edit
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Run a given command to find the first bad revision.
export extern "jj bisect run" [
  command: string                           # command to run to determine whether the bug is present
  ...args: string                           # arguments to pass to the command
  --range(-r): string@revsets               # range of revisions to bisect
  --find-good                               # whether to find the first good revision instead
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Advance the closest bookmarks to a target revision
export extern "jj bookmark advance" [
  ...names: string@local-bookmarks          # move bookmarks matching the given name
  --to(-t): string@revsets                  # move bookmarks to this revision
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create a new bookmark
export extern "jj bookmark create" [
  ...bookmarks: string                      # the bookmarks to create
  --revision(-r): string@revsets            # the bookmark's target revision
  --to: string@revsets                      # the bookmark's target revision
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Delete an existing bookmark 
export extern "jj bookmark delete" [
  ...bookmarks: string@local-bookmarks      # the bookmarks to delete
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Forget a bookmark without making it as a deletion to be pushed
export extern "jj bookmark forget" [
  ...bookmarks: string@local-bookmarks      # the bookmarks to forget
  --include-remotes                         # also forget any corresponding remote bookmarks
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List bookmarks and their target
export extern "jj bookmark list" [
  ...names: string@local-bookmarks          # show bookmarks whose local name matches the pattern
  --all-remotes(-a)                         # show all tracking and non-tracking remote bookmarks
  --remote: string@remotes                  # show all tracking and non-tracking bookmarks belonging to this remote
  --tracked(-t)                             # only show tracked bookmarks
  --conflicted(-c)                          # only show conflicted bookmarks
  --revisions(-r): string@revsets           # show bookmarks whose local targets are in the given revisions
  --template(-T): string                    # use a template to render bookmarks
  --sort: string@bookmarks-sort             # sort bookmarks based on the given key
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Move existing bookmarks to target revision
export extern "jj bookmark move" [
  ...names: string@local-bookmarks          # move bookmarks matching the pattern
  --from(-f): string@revsets                # the revisions to move the bookmarks from
  --to(-t): string@revsets                  # the revision to move the bookmarks to
  --allow-backwards(-B)                     # allow moving bookmarks backwards or sideways
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Rename a bookmark
export extern "jj bookmark rename" [
  old: string@local-bookmarks               # the bookmark to rename
  new: string                               # the new name of the bookmark
  --overwrite-existing                      # allow overwriting an existing bookmark
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create or update a bookmark to point to a certain commit
export extern "jj bookmark set" [
  ...names: string@local-bookmarks          # the bookmarks to update
  --revision(-r): string@revsets            # the bookmark's target revision
  --to: string@revsets                      # the bookmark's target revision
  --allow-backwards(-B)                     # allow moving the bookmark backwards or sideways
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Start tracking given remote bookmarks
export extern "jj bookmark track" [
  ...bookmarks: string@untracked-bookmarks  # remote bookmarks to track
  --remote: string@remotes                  # remotes to track bookmark from
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Start tracking given remote bookmarks
export extern "jj bookmark untrack" [
  ...bookmarks: string@tracked-bookmarks    # remote bookmarks to untrack
  --remote: string@remotes                  # remotes to untrack bookmark from
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update the description and create a new change on top [default alias: ci]
export extern "jj commit" [
  ...filesets: path                         # put theses changes in the first commit
  --interactive(-i)                         # interactively choose which changes to include in the first commit
  --tool: path                              # specify diff editor to be used (implies --interactive)
  --message(-m): string                     # the change description to use
  --editor                                  # open an editor to edit the change description
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Start an editor on a jj config file.
export extern "jj config edit" [
  --user                                    # targer the user-level config
  --repo                                    # target the repo-level config
  --workspace                               # target the workspace-level config
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Get the value of a given config option
export extern "jj config get" [
  name: string                              # the config option to get
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List variables set in config files, along with their values
export extern "jj config list" [
  name?: string                             # name of a config option to look upi
  --include-defaults                        # whether to include default values
  --include-overriden                       # whether to include overriden values
  --user                                    # target the user-level config
  --repo                                    # target the repo-level config
  --workspace                               # target the workspace-level config
  --template(-T): string                    # render each variable using the template
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Print the paths to the config files
export extern "jj config path" [
  --user                                    # targer the user-level config
  --repo                                    # target the repo-level config
  --workspace                               # target the workspace-level config
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update a config file to set the given option to a given value
export extern "jj config set" [
  name: string                              # the config option to set
  value: string                             # the value to set
  --user                                    # targer the user-level config
  --repo                                    # target the repo-level config
  --workspace                               # target the workspace-level config
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update a config file to unset the given option
export extern "jj config unset" [
  name: string                              # the config option to unset
  --user                                    # targer the user-level config
  --repo                                    # target the repo-level config
  --workspace                               # target the workspace-level config
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update the change description or other metadata
export extern "jj describe" [
  ...revisions: string@revsets              # the revision(s) whose description to edit (default: @)
  --message(-m): string                     # the change description to use
  --stdin                                   # read the change description from stdin
  --editor                                  # open an editor to edit the change description
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Compare file contents between two revisions
export extern "jj diff" [
  ...filesets: path                         # restrict the diff to these paths
  --revisions(-r): string@revsets           # show changes in these revisions
  --from(-f): string@revsets                # show changes from this revision
  --to(-t): string@revsets                  # show changes to this revision
  --template(-T): string                    # render each file diff entry using the given template
  --summary(-s)                             # show only whether each path was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated only by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --ignore-all-space(-w)                    # ignore whitespace when comparing lines
  --ignore-space-change(-b)                 # ignore changes in amount of whitespace when comparing lines
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Display the content changes in a revision with a diff editor
export extern "jj diffedit" [
  ...filesets: path                         # only display these paths
  --revisions(-r): string@revsets           # show changes in these revisions
  --from(-f): string@revsets                # show changes from this revision
  --to(-t): string@revsets                  # show changes to this revision
  --tool: path                              # specify diff editor to use
  --restore-descendants                     # preserve the content when rebasing descendants
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create new changes with the same content as existing ones
export extern "jj duplicate" [
  ...revsets: string@revsets                # the revisions to duplicate
  --onto(-o): string@revsets                # the revisions to duplicate onto
  --insert-after(-A): string@revsets        # the revisions to insert after
  --after: string@revsets                   # the revisions to insert after
  --insert-before(-B): string@revsets       # the revisions to isnert before
  --before: string@revsets                  # the revisions to isnert before
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Sets the specified revision as the working-copy revision
export extern "jj edit" [
  revset: string@revsets                    # the commit to edit
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show how a change has evolved over time
export extern "jj evolog" [
  --revisions(-r): string@revsets           # follow changes from these revisions
  --limit(-n): int                          # limit the number of revisions to show
  --reversed                                # show revisions in the opposite order
  --no-graph(-G)                            # do not show the graph
  --template(-T): string                    # render each revision using the given template
  --patch(-p)                               # show patch compated to the previous version
  --summary(-s)                             # show only whether each path was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated only by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --ignore-all-space                        # ignore whitespace when comparing lines
  --ignore-space-change                     # ignore changes in amount of whitespace when comparing lines
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show the source change for each line of the target file.
export extern "jj file annotate" [
  path: path                                # the file to annotate
  --revision(-r): string@revsets            # an optional revision to start at
  --template(-T): string                    # render each line using the given template
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Sets or removes the executable bit for paths in the repo
export extern "jj file chmod" [
  mode: string@modes                        # the mode to set
  ...files: path                            # paths to change the executable bit for
  --revision(-r): string@revsets            # an optional revision to start at
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List files in a revision
export extern "jj file list" [
  ...files: path                            # only list files matching these prefixes
  --revision(-r): string@revsets            # the revision to list files in
  --template(-T): string                    # render each line using the given template
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Search for content in files
export extern "jj file search" [
  ...filesets: path                         # only search files matching these prefixes
  --revision(-r): string@revsets            # the revision to search files in
  --pattern(-p): string                     # the glob pattern to search for
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Print contents of files in a revision
export extern "jj file show" [
  ...files: path                            # paths to print
  --revision(-r): string@revsets            # the revision to get the file contents from
  --template(-T): string                    # render each file metadata using the given template
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Start tracking specified paths in the working copy
export extern "jj file track" [
  ...files: path                            # paths to track
  --include-ignored                         # track paths even if they're ignored or too large
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Stop tracking specified paths in the working copy
export extern "jj file untrack" [
  ...files: path                            # paths to untrack
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update files with formatting fixes or other changes
export extern "jj fix" [
  ...filesets: path                         # fix only these paths
  --source(-s): string@revsets              # fix files in these revisions and their descendants
  --include-unchanged-files                 # also fix unchanged files
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Upload changes to Gerrit for code review, or update existing changes.
export extern "jj gerrit upload" [
  --revisions(-r): string@revsets           # the revisions to send to gerrit
  --remote-branch(-b)                       # the location where your changes are intended to land
  --remote: string                          # the gerrit remote to push top
  --dry-run(-n)                             # do not actually push the changes to gerrit
  --reviewer: string                        # add these emails as a reviewer
  --cc: string                              # CC these emails on the change
  --label(-l): string                       # add the following labels
  --topic: string                           # applies a topic to the change
  --hashtag: string                         # applies a hashtag to the change
  --wip                                     # marks the change as work in progress
  --ready                                   # unmarks the change as work in progress
  --private                                 #
  --remove-private                          # unmarks the change as private
  --publish-comments                        # publishes any draft comments for the given change
  --no-publish-comments                     # disables publishing of any draft comments
  --notify: string@gerrit-notify            # who to email notifications to
  --submit                                  # directly submit the changes
  --skip-validation                         # skip performing validations
  --ignore-attention-set                    # do not modify the attention set upon uploading
  --deadline: string                        # the deadline after which the push should be aborted
  --custom: string                          # send the following custom keyed values
  --trace: string                           # for debugging Gerrit
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create a new repo backed by a clone of a Git repo
export extern "jj git clone" [
  source: string                            # url or path of the git repo to clone
  destination?: path                        # target directory for the repository clone
  --remote: string                          # name of the newly created remote
  --colocate                                # colocate the jj repo with the git repo
  --no-colocate                             # disable colocation of the jj repo with the git repo
  --depth: int                              # creates a shallow clone of the given depth
  --fetch-tags: string@fetch-tags           # configure when to fetch tags
  --branch(-b): string                      # name of the branch to fetch
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Convert into a non-colocated Jujutsu/Git repository
export extern "jj git colocation disable" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Convert into a colocated Jujutsu/Git repository
export extern "jj git colocation enable" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show the current colocation status
export extern "jj git colocation status" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update the underlying Git repo with changes made in the repo
export extern "jj git export" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Fetch from a Git remote
export extern "jj git fetch" [
  --branch(-b): string                      # only fetch some of the branches
  --tracked                                 # only fetch tracked bookmarks
  --remote: string@remotes                  # the remote to fetch from
  --all-remotes                             # fetch from all remotes
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update repo with changes made in the underlying Git repo
export extern "jj git import" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create a new Git backed repo
export extern "jj git init" [
  destination?: path                        # the directory where the repo will be created (default '.')
  --colocate                                # creates a valid git repo
  --no-colocate                             # disable colocation of the jj repo with the git repo
  --git-repo: path                          # the git repo to use as the backing repo
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Push to a Git remote
export extern "jj git push" [
  --remote: string@remotes                  # the remote to push to
  --bookmark(-b): string@local-bookmarks    # push only this bookmark
  --all                                     # push all bookmarks
  --tracked                                 # push all tracked bookmarks
  --deleted                                 # push all deleted bookmarks
  --allow-empty-description                 # allow pushing commits with empty descriptions
  --allow-private                           # allow pushing commits that are private
  --revisions(-r): string@revsets           # push bookmarks pointing to these commits
  --change(-c): string@revsets              # push this commit by creating a bookmark
  --named: string                           # specify a new bookmark and the revision it points to
  --dry-run                                 # only display what will change on the remote
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Add a Git remote
export extern "jj git remote add" [
  remote: string                            # the remote name
  url: string                               # the remote's URL or path
  --fetch-tags: string@fetch-tags           # configure when to fetch tags
  --push-url: string                        # the URL or path to push to
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List Git remotes
export extern "jj git remote list" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Remove a Git remote and forget its bookmarks
export extern "jj git remote remove" [
  remote: string@remotes                    # the remote's name
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Rename a git remote
export extern "jj git remote rename" [
  old: string@remotes                       # the name of the existing remote
  new: string                               # the new name of the remote
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Set the URL of a Git remote
export extern "jj git remote set-url" [
  remote: string@remotes                    # the name of the existing remote
  url?: string                              # the new url or path for the remote
  --push: string                            # the URL or path to push to
  --fetch: string                           # the URL or path to fetch from
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show the underlying Git directory of a repository using the Git backend
export extern "jj git root" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Print a help message
export extern "jj help" [
  ...commands: string@commands              # print help for the subcommands
  --keyword(-k): string@keywords            # show help for a keyword instead of a command
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Compare the changes of two commits
export extern "jj interdiff" [
  ...filesets: path                         # restrict the diff to these paths
  --from(-f): string@revsets                # show changes from this revision
  --to(-t): string@revsets                  # show changes to this revision
  --summary(-s)                             # show only whether each path was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated only by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --ignore-all-space(-w)                    # ignore whitespace when comparing lines
  --ignore-space-change(-b)                 # ignore changes in amount of whitespace when comparing lines
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show revision history
export extern "jj log" [
  ...filesets: path                         # show revisions modifying the given paths
  --revisions(-r): string@revsets           # which revisions to show
  --limit(-n): int                          # number of revisions to show
  --reversed                                # show revisions in the opposite order
  --no-graph(-G)                            # do not show the graph, use a flat list
  --template(-T): string                    # use a template to render revisions
  --patch(-p)                               # show patch
  --count                                   # print the number of commits instead of showing them
  --summary(-s)                             # for each path, show only whether it was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a git format diff
  --color-words                             # show a word-level diff with changes indicated by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --ignore--all-space                       # ignore whitespace when comparing lines
  --ignore-space-change                     # ignore changes in amount of whitespace when comparing lines
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Modify the metadata of a revision without changing its content
export extern "jj metaedit" [
  ...revsets: string@revsets                # the revision(s) to modify
  --update-change-id                        # generate a new change-id
  --message(-m): string                     # update the change description
  --update-author-timestamp                 # update the author timestamp
  --update-author                           # update the author to the configured user
  --author: string                          # set author to the provided string
  --author-timestamp: string                # set the author timestamp to the given date
  --force-rewrite                           # rewrite the commit, even if no other metadata changed
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create a new, empty change
export extern "jj new" [
  ...revsets: string@revsets                # parent(s) of the new change
  --message(-m): string                     # the change description to use
  --no-edit                                 # do not edit the newly created change
  --insert-after(-A): string@revsets        # insert the new change after the given commits
  --after: string@revsets                   # insert the new change after the given commits
  --insert-before(-B): string@revsets       # insert the new change before the given commits
  --before: string@revsets                  # insert the new change before the given commits
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Move the working-copy commit to the child revision
export extern "jj next" [
  offset?: int                              # how many revisions to move forward
  --edit(-e)                                # edit the target instead of creating a new working copy commit
  --no-edit(-e)                             # create a new working copy commit
  --conflict                                # jump to the next conflicted descendant
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Abandon operation history
export extern "jj operation abandon" [
  operation: string@operations              # the operation to abandon
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Compare changes to the repository between two operations
export extern "jj operation diff" [
  --operation: string@operations            # show repository changes in this operation
  --from(-f): string@operations             # show repository changes from this operation
  --to(-t): string@operations               # show repository changes to this operation
  --no-graph(-G)                            # do not show the graph
  --patch(-p)                               # show patch of modifications to changes
  --summary(-s)                             # show only whether each path was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated only by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --ignore-all-space                        # ignore whitespace when comparing lines
  --ignore-space-change                     # ignore changes in amount of whitespace when comparing lines
  --show-changes-in: string@revsets         # only show changes in these revisions
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Make an operation part of the operation log
export extern "jj opreation integrate" [
  opreation: string                         # the operation to integrate
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show the operation log
export extern "jj operation log" [
  --limit(-n): int                          # limit the number of operations to show
  --reversed                                # show operations in the opposite order
  --no-graph(-G)                            # do not show the graph
  --template(-T): string                    # render each operation using the given template
  --op-diff(-d)                             # show changes to the repository at each operation
  --patch(-p)                               # show patch of modifications to changes
  --summary(-s)                             # show only whether each path was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated only by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --ignore-all-space                        # ignore whitespace when comparing lines
  --ignore-space-change                     # ignore changes in amount of whitespace when comparing lines
  --show-changes-in: string@revsets         # only show operations in these revisions
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create a new operation that restores the repo to an earlier state
export extern "jj operation restore" [
  operation: string@operations              # the operation to restore to
  --what: string@restore-options            # what portions of the local state to restore
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create a new operation that reverts an earlier operation
export extern "jj operation revert" [
  operation?: string@operations             # the operation to revert
  --what: string@restore-options            # what portions of the local state to revert
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show changes to the repository in an operation
export extern "jj operation show" [
  operation: string@operations              # show repository changes in this operation
  --no-graph(-G)                            # do not show the graph
  --template(-T): string                    # render the operation using the given template
  --patch(-p)                               # show patch of modifications to changes
  --no-op-diff                              # do not show operation diff
  --summary(-s)                             # show only whether each path was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated only by color
  --tool: path                              # generate diff by external command
  --context: path                           # number of lines of context to show
  --ignore-all-space                        # ignore whitespace when comparing lines
  --ignore-space-change                     # ignore changes in amount of whitespace when comparing lines
  --show-changes-in: string@revsets         # only show changes in these revisions
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Parallelize revisions by making them siblings
export extern "jj parallelize" [
  ...revesets: string@revsets               # revisions to parallelize
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Move the working-copy commit to the parent revision
export extern "jj prev" [
  offset?: int                              # how many revisions to move backward
  --edit(-e)                                # edit the target instead of creating a new working copy commit
  --no-edit(-e)                             # create a new working copy commit
  --conflict                                # jump to the next conflicted ancestor
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Move revisions to different parent(s)
export extern "jj rebase" [
  --branch(-b): string@revsets              # rebase the whole branch relative to destination
  --source(-s): string@revsets              # rebase specified revisions with their descendants
  --revisions(-r): string@revsets           # rebase only the given revisions
  --onto(-o): string@revsets                # the revisions to rebase onto
  --insert-after(-A): string@revsets        # the revision(s) to insert after
  --after: string@revsets                   # the revision(s) to insert after
  --insert-before(-B): string@revsets       # the revision(s) to insert before
  --before: string@revsets                  # the revision(s) to insert before
  --skip-emptied                            # abandon empty commits
  --keep-divergent                          # keep divergent commits
  --simplify-parents                        # simplify parents of rebased commits
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Redo the most recently undone operation
export extern "jj redo" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Resolve conflicted files with an external merge tool
export extern "jj resolve" [
  ...filesets: path                         # only resolve conflicts in these paths
  --revision(-r): string@revsets            # revision the conflicts of to resolve
  --list(-l)                                # instead of resolving conflicts, list all the conflicts
  --tool: path                              # the 3-way merge tool to be used
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Restore paths from another revision
export extern "jj restore" [
  ...filesets: path                         # restore only these paths
  --from(-f): string@revsets                # revision to restore from
  --into(-t): string@revsets                # revision to restore into
  --to: string@revsets                      # revision to restore into
  --changes-in(-c): string@revsets          # undo the changes in a revision
  --interactive(-i)                         # interactively choose which parts to restore
  --tool: path                              # specify diff editor to be used
  --restore-descendants                     # preserve the content when rebasing descendants
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Apply the reverse of the given revision(s)
export extern "jj revert" [
  --revisions(-r): string@revsets           # the revision(s) to apply the reverse of
  --onto(-o): string@revsets                # the revision(s) to apply the reverse on top of
  --insert-after(-A): string@revsets        # the revision(s) to insert the reverse changes after
  --after: string@revsets                   # the revision(s) to insert the reverse changes after
  --insert-before(-B): string@revsets       # the revision(s) to insert the reverse changes before
  --before: string@revsets                  # the revision(s) to insert the reverse changes before
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show the current workspace root directory (shortcut for `jj workspace root`)
export extern "jj root" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show commit description and changes in a revision
export extern "jj show" [
  revset: string@revsets                    # show changes in this revision
  --template(-T): string                    # render a revision using the given template
  --summary(-s)                             # for each path, show only whether it was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --no-patch                                # do not show the patch
  --ignore-all-space(-w)                    # ignore whitespace when comparing lines
  --ignore-space-change(-b)                 # ignore changes in amount of whitespace when comparing lines
  --no-patch                                # do not show the patch
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Cryptographically sign a revision
export extern "jj sign" [
  --revisions(-r): string@revsets           # the revision(s) to sign
  --key: string                             # the key to use for signing
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Simplify parent edges for the specified revision(s)
export extern "jj simplify-parents" [
  --source(-s): string@revsets              # revisions to be simplified together with their descendants
  --revisions(-r): string@revsets           # revisions to be simplified
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Start an editor to update the patterns that are present in the working copy
export extern "jj sparse edit" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List the patterns that are currently present in the working copy
export extern "jj sparse list" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Reset the patterns to include all files in the working copy
export extern "jj sparse reset" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update the patterns that are present in the working cop
export extern "jj sparse set" [
  --add: path                               # patterns to add to the working copy
  --remove: path                            # patterns to remove from the working copy
  --clear                                   # include no files in the working copy
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Split a revision in two
export extern "jj split" [
  ...filesets: path                         # files to put in the selected changes
  --interactive(-i)                         # interactively choose which parts to split
  --tool: path                              # the edito to be used
  --revision(-r): string@revsets            # the revision to spli
  --onto(-o): string@revsets                # the revision(s) to base the new revision onto
  --insert-after(-A): string@revsets        # the revision(s) to insert after
  --after: string@revsets                   # the revision(s) to insert after
  --insert-before(-B): string@revsets       # the revision(s) to insert before
  --before: string@revsets                  # the revision(s) to insert before
  --message(-m): string                     # the change description to use
  --editor                                  # open an editor to edit the change description
  --parallel(-p)                            # split the revision into two parallel revisions
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Move changes from a revision into another revision
export extern "jj squash" [
  ...filesets: path                         # move only changes to these paths
  --revision(-r): string@revsets            # revision to squash into its parent
  --from(-f): string@revsets                # revision(s) to squash from
  --into(-t): string@revsets                # revision to squash into
  --to: string@revsets                      # revision to squash into
  --onto(-o): string@revsets                # the revision(s) to use as parent for the new commit
  --insert-after(-A): string@revsets        # the revision(s) to insert the new commit after
  --after: string@revsets                   # the revision(s) to insert the new commit after
  --insert-before(-B): string@revsets       # the revision(s) to insert the new commit before
  --before: string@revsets                  # the revision(s) to insert the new commit before
  --message(-m): string                     # the description to use for squashed revision
  --use-destination-message(-u)             # use the description of the destination revision
  --editor                                  # open an editor to edit the change description
  --interactive(-i)                         # interactively choose which parts to squash
  --tool: path                              # specify diff editor to be used
  --keep-emptied(-k)                        # the source revision will not be andandoned
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show high-level repo status
export extern "jj status" [
  ...filesets: path                         # restrict the status display to these paths
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Delete existing tags
export extern "jj tag delete" [
  ...names: string@tags                     # tag names to delete
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List tags
export extern "jj tag list" [
  ...names: string                          # show tags whose local name matches
  --all-remotes(-a)                         # show tags from all remotes
  --conflicted(-c)                          # only show conflicted tags
  --revision(-r): string@revsets            # show tags in these revisions
  --template(-T): string                    # render each tag using the given template
  --sort: string@tags-sort                  # sort tags based on the given key 
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create or update tags
export extern "jj tag set" [
  ...names: string                         # tag names to create or update
  --revision(-r): string@revsets            # target revision to point to
  --allow-move                              # allow moving existing tags
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Undo the last operation
export extern "jj undo" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Drop a cryptographic signature
export extern "jj unsign" [
  --revisions(-r): string@revsets           # the revision(s) to unsign
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Print a command-line-completion script
export extern "jj util completion" [
  shell: string@shells                      # shell to print completion for
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Print the JSON schema for the jj TOML config format
export extern "jj util config-schema" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Execute an external command via jj
export extern "jj util exec" [
  command: path                             # external command to execute
  ...args                                   # arguments to pass to the external command
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Run backend-dependent garbage collection
export extern "jj util gc" [
  --expire: string                          # time threshold
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Install Jujutsu's manpages to the provided path
export extern "jj util install-man-pages" [
  path: path                                # the path where manpages will be installed
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Snapshot the working copy if needed
export extern "jj util snapshot" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Print the CLI help for all subcommands in Markdown
export extern "jj util markdown-help" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Display version information
export extern "jj version" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Add a workspace
export extern "jj workspace add" [
  destination: path                         # where to create the new workspace
  --name: string                            # a name for the workspace
  --revision(-r): string@revsets            # a list of parent revisions for the created workspace
  --message(-m): string                     # the change description to use
  --sparse-patterns: string@sparse-patterns # how to handle sparse patterns when creating a new workspace
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Stop tracking a workspace's working-copy commit in the repo
export extern "jj workspace forget" [
  ...workspaces: string@workspaces          # names of the workspaces to forget
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List workspaces
export extern "jj workspace list" [
  --template(-T): string                    # render each workspace using the given template
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Renames the current workspace
export extern "jj workspace rename" [
  new_name: string                          # the new name of the workspace
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show the workspace root directory
export extern "jj workspace root" [
  --name: string                            # name of the workspace
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update a workspace that has become stale
export extern "jj workspace update-stale" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# endregion

# region: zola

# Completion based on zola 0.22.1

# TODO: Write 'em.

# endregion