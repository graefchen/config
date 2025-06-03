# written by graefchen

# Checks if a string is an URL.
export def main []: string -> bool {
    # TODO: Complete rework.
    # base regex: https://stackoverflow.com/a/49849482
    # url ref: https://en.wikipedia.org/wiki/Uniform_Resource_Identifier#Syntax
    # scheme ref: https://en.wikipedia.org/wiki/List_of_URI_schemes
    #             https://www.iana.org/assignments/uri-schemes/uri-schemes.xhtml
    # slightly modified
    # url: scheme:(//authority)?path(\?query)?(#fragment)?
    # scheme:    (http(s)?|ftp|mailto|file|data|irc){1}
    # authority: (www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b
    # path:      \b([-a-zA-Z0-9@:%_\+.~#?&//=]*)
    # query:     ~~in path~~
    # fragment:  ~~in path~~
    return ($in =~ '^(http(s)?|ftp|mailto|file|data|irc){1}:(//)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)')
}
