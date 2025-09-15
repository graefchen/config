# Written by graefchen
# based on: juijutsu 0.31.0-312c610c592b41ec81f0661e124fd660cb510ab0
# link: https://github.com/jj-vcs/jj

# TODO: (2025-07-23) Finish all of the completions.

# Abandon a revision
export extern "jj abandon" []

# Move changes from a revision into the stack of mutable revisions
export extern "jj absorb" []

# Manage bookmarks [default alias: b]
export extern "jj bookmark" []

# Update the description and create a new change on top
export extern "jj commit" []

# Manage config options
export extern "jj config" []

# Update the change description or other metadata [aliases: desc]
export extern "jj describe" []

# Compare file contents between two revisions
export extern "jj diff" []

# Touch up the content changes in a revision with a diff editor
export extern "jj diffedit" []

# Create new changes with the same content as existing ones
export extern "jj duplicate" []

# Sets the specified revision as the working-copy revision
export extern "jj edit" []

# Show how a change has evolved over time [aliases: evolution-log]
export extern "jj evolog" []

# File operations
export extern "jj file" []

# Update files with formatting fixes or other changes
export extern "jj fix" []

# Commands for working with Git remotes and the underlying Git repo
export extern "jj git" []

# Print this message or the help of the given subcommand(s)
export extern "jj help" []

# Compare the changes of two commits
export extern "jj interdiff" []

# Show revision history
export extern "jj log" []

# Create a new, empty change and (by default) edit it in the working copy
export extern "jj new" []

# Move the working-copy commit to the child revision
export extern "jj next" []

# Commands for working with the operation log [aliases: op]
export extern "jj operation" []

# Parallelize revisions by making them siblings
export extern "jj parallelize" []

# Change the working copy revision relative to the parent revision
export extern "jj prev" []

# Move revisions to different parent(s)
export extern "jj rebase" []

# Resolve conflicted files with an external merge tool
export extern "jj resolve" []

# Restore paths from another revision
export extern "jj restore" []

# Apply the reverse of the given revision(s)
export extern "jj revert" []

# Show the current workspace root directory (shortcut for `jj workspace root`)
export extern "jj root" []

# Show commit description and changes in a revision
export extern "jj show" []

# Cryptographically sign a revision
export extern "jj sign" []

# Simplify parent edges for the specified revision(s)
export extern "jj simplify-parents" []

# Manage which paths from the working-copy commit are present in the working copy
export extern "jj sparse" []

# Split a revision in two
export extern "jj split" []

# Move changes from a revision into another revision
export extern "jj squash" []

# Show high-level repo status [aliases: st]
export extern "jj status" []

# Manage tags
export extern "jj tag" []

# Undo an operation (shortcut for `jj op undo`)
export extern "jj undo" []

# Drop a cryptographic signature
export extern "jj unsign" []

# Infrequently used commands such as for generating shell completions
export extern "jj util" []

# Display version information
export extern "jj version" []

# Commands for working with workspaces
export extern "jj workspace" []

# Jujutsu (An experimental VCS)
export extern jj [
	--version(-V) # Print version
]
