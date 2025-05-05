# written by graefchen

# get the maximum depth of the current folder
def --env depth []: nothing -> int {
    # 1.1 list all files in this and all following folder
    # 1.2 get all directorys
    # 2.1 check if is empty, else goto 3
    # 2.2 return 1
    # 3.1 get the name column
    # 3.2 split the path
    # 3.3 get the length of the path
    # 3.4 sort it (by default asc)
    # 3.5 return the last (bigges number)
    let dir = (ls **/* --threads | where type == "dir")
    if ($dir | is-empty) {
       1
    } else {
        $dir
        | get name
        | path split
        | each { $in | length }
        | sort
        | last
        | $in + 1
    }
}
