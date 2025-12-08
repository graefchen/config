# based on: kona-211225
# link: https://github.com/kevinlawler/kona

use github.com/zzamboni/elvish-completions/comp

var k-opts = [
	[ &short="h" &arg-required=$true &desc="open an HTTP port"          ]
	[ &short="i" &arg-required=$true &desc="open an IPC port"           ]
	[ &short="c" &arg-required=$true &desc="execute a string"           ]
	[ &short="x" &arg-required=$true &desc="execute a string and print" ]
]

set edit:completion:arg-completer[k] = (comp:sequence &opts=$k-opts [{|arg|
	comp:files $arg &regex=".k"
}])
