# written by graefchen

def list []: nothing -> list<string> {
    ls ($env.GOPATH | path join "bin")
    | get name
    | split column "\\"
    | get column6
    | split column "."
    | get column1
}

# print all go apps
export def main []: nothing -> list<string> {
    list
}