# written by graefchen

# a file counter
#
# counts all the files and returns either a string or a record
export def --env main []: nothing -> string, nothing -> record {
    let files = (ls **/* --threads | where type == "file")
    if ($files | is-empty) {
        return "No files in directory"
    } else {
        mut dict = {}
        for $file in $files {
            let index = ($file | get name | path parse | get extension)
            if ($index | is-empty) { continue }
            if ($index in $dict) {
                $dict = $dict | update $index { $in + 1 }
            } else {
                $dict = $dict | insert $index 1
            }
        }
        return ($dict | sort)
    }
}
