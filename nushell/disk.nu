# written by graefchen

# a file counter
#
# counts all the files and returns either a string or a record
# it does not ignore files and directorys that are specified in the
# .gitignore file or other files
def --env fcount []: nothing -> string, nothing -> number, nothing -> record {
    mut files = (ls **/* --threads | where type == "file")
    if ($files | is-empty) {
        return "No files in directory"
    } else {
        mut dict = {}
        for $file in $files {
            let index = ($file | get name | path parse | get extension)
            if ($index | is-empty) { continue }
            if ($index in $dict) {
                $dict = $dict | update $index { $in + 1}
            } else {
                $dict = $dict | insert $index 1
            }
        }
        return ($dict | sort)
    }
}

# get the size (in bytes) of all the files in the directory
def --env fsize  []: nothing -> string,  nothing -> table {
    mut files = (ls **/* --threads | where type == "file")
    if ($files | is-empty) {
        return "No files in directory"
    } else {
        mut dict = {}
        for $file in $files {
            let index = ($file | get name | path parse | get extension)
            let size  = ($file | get size)
            if ($index | is-empty) { continue }
            if ($index in $dict) {
                $dict = $dict | update $index { $in + $size }
            } else {
                $dict = $dict | insert $index $size
            }
        }
        return ($dict | sort | transpose name size)
    }
}

# getting the current disk space
def --env ds [] { du --max-depth 8 | sort-by apparent | update path { path basename } }

# get the maximum depth of the current folder
def --env depth []: nothing -> int {
    let dir = (ls **/* --threads | where type == "dir")
    if ($dir | is-empty) {
       1
    } else {
        $dir | get name | path split | each { $in | length } | sort | last | $in + 1
    }
}

# get the number of files in all subdirectorys
#
# is bad with ".vscode" folders
def --env filenum []: nothing -> table {
    ls -t | where type == dir | each {|name| {
        name: $name.name,
        filenum: (ls -t **/* | where ($it.type == file) | where ($it.name | path split | first) == $name.name | length)
    } }
}