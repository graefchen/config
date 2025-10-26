# written by graefchen

# get the size (in bytes) of all the files in the directory
export def --env main []: nothing -> string,  nothing -> table {
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
