# Nushell Config File

$env.config = {
  show_banner: false
  history: {
    file_format: sqlite
  }
}

# Starship
use ~/.cache/starship/init.nu

# Using completions ...
source ./completions/misc-completions.nu
source ./completions/extern/mod.nu
source ./completions/lang/mod.nu
source ./completions/package/mod.nu
# source ./completions/tools/mod.nu

# Using scripts...
use ./scripts/dead-links.nu
use ./scripts/depth.nu
use ./scripts/executables.nu
use ./scripts/fcount.nu
use ./scripts/goapps.nu
use ./scripts/neocities.nu
use ./scripts/rustapps.nu
use ./scripts/setup.nu
use ./scripts/toc.nu
use ./scripts/walk.nu

# adding support for `open` for the shorthand file extension version of the
# MessagePack and brotli-compressed MessagePack
# be aware that nushell writes this comment when using `help ftom mpk(z)`

# same as `from msgpack`
def "from mpk" [] { $in | from msgpack }
# same as `from msgpackz`
def "from mpkz" [] { $in | from msgpackz }
