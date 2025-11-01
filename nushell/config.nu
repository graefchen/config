# Nushell Config File

$env.config = {
  show_banner: false
  history: { file_format: sqlite }
  rm: { always_trash: true }
}

# Starship
use ~/.cache/starship/init.nu

use ./scripts/binary.nu
use ./scripts/fcount.nu
use ./scripts/walk.nu

# same as `from msgpack`
def "from mpk" [] { $in | from msgpack }
# same as `from msgpackz`
def "from mpkz" [] { $in | from msgpackz }
