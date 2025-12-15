# based on: Io 20110905
# link: https://iolanguage.org

use github.com/zzamboni/elvish-completions/comp

var io-opts = [
    [ &short="h"                                     &desc="print this help message and exit"                       ]
    [ &short="v" &long="version" &arg-required=$true &desc="print the version of the interpreter and exit"          ]
    [ &short="e"                 &arg-required=$true &desc="eval a given expression and exit"                       ]
    [ &short="i"                 &arg-required=$true &desc="run the interpreter, after processing the files passed" ]
]

set edit:completion:arg-completer[io] = (comp:sequence &opts=$io-opts [{|arg|
    comp:files $arg &regex=".io"
}])
