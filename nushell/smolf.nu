# written by graefchen
# NOTE: I have no idea where that "font" is from
#       I only know, that i slightly modified it
# got some parts from here: 

const MAP = {
    a:   { upper: " ▄▀█",   lower: " █▀█" },
    b:   { upper: " █▄▄",   lower: " █▄█" },
    c:   { upper: " █▀▀",   lower: " █▄▄" },
    d:   { upper: " █▀▄",   lower: " █▄▀" },
    e:   { upper: " █▀▀",   lower: " ██▄" },
    f:   { upper: " █▀▀",   lower: " █▀ " },
    g:   { upper: " █▀▀",   lower: " █▄█" },
    h:   { upper: " █░█",   lower: " █▀█" },
    i:   { upper: " █",     lower: " █" },
    j:   { upper: " ░░█",   lower: " █▄█" },
    k:   { upper: " █▄▀",   lower: " █░█" },
    l:   { upper: " █░░",   lower: " █▄▄" },
    m:   { upper: " █▀▄▀█", lower: " █░▀░█" },
    n:   { upper: " █▄░█",  lower: " █░▀█" },
    o:   { upper: " █▀█",   lower: " █▄█" },
    p:   { upper: " █▀█",   lower: " █▀▀" },
    q:   { upper: " █▀█",   lower: " ▀▀█" },
    r:   { upper: " █▀█",   lower: " █▀▄" },
    s:   { upper: " █▀",    lower: " ▄█" },
    t:   { upper: " ▀█▀",   lower: " ░█░" },
    u:   { upper: " █░█",   lower: " █▄█" },
    v:   { upper: " █░█",   lower: " ▀▄▀" },
    w:   { upper: " █░█░█", lower: " ▀▄▀▄▀" },
    x:   { upper: " ▀▄▀",   lower: " █░█" },
    y:   { upper: " █▄█",   lower: " ░█░" },
    z:   { upper: " ▀█",    lower: " █▄" },
    "-": { upper: " ▄▄",    lower: "░░░" },
    "+": { upper: " ▄█▄",   lower: "░░▀░" },
    ".": { upper: "░",      lower: "▄" },
}

def smolf [msg: string]: nothing -> string {
    let chars = ($msg | str downcase | split chars)
    mut upper = ""
    mut lower = ""
    for $c in $chars {
        # only take the chars, that are in the table
        if ($c in $MAP) {
            let map = $MAP | get $c
            $upper = $upper + ($map | get upper)
            $lower = $lower + ($map | get lower)
        }
    }
    return ($upper | append $lower | str join "\n")
}