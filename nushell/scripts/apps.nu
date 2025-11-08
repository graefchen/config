# written by graefchen

# print all go apps
def goapps []: nothing -> list<string> {
    ls ($env.GOPATH | path join "bin") | get name | split column "\\" | get column6 | split column "." | get column1
}
# print all rust apps
def rustapps []: nothing -> list<string> {
    cargo install --list | split row "\n" | split column " " | get column1 | uniq | sort | reverse | drop | reverse
}
