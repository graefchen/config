# Written by graefchen
# based on wren_cli 0.4.0
# link: https://github.com/wren-lang/wren-cli

use github.com/zzamboni/elvish-completions/comp

var wren-opts = [
    [ &long="help"    &desc="Show command line usage" ]
    [ &long="version" &desc="Show version"            ]
]

var wrenc-opts = [
    [ &short="h" &long="help"                         &desc="print wrenc command line options" ]
    [ &short="v" &long="version"                      &desc="print wrenc and Wren version"     ]
    [ &short="e"                 &arg-required= $true &desc="evaluate code"                    ]
]

set edit:completion:arg-completer[wren] = (comp:sequence &opts=$wren-opts [{|arg|
    comp:files $arg &regex=".wren"
}])


set edit:completion:arg-completer[wrenc] = (comp:sequence &opts=$wrenc-opts [{|arg|
    comp:files $arg &regex=".wren"
}])
