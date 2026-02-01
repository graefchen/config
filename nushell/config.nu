# Nushell Config File

$env.config = {
  show_banner: false
  history: { file_format: sqlite }
  rm: { always_trash: true }
}

use ~/.cache/starship/init.nu
source ./completions.nu
# some of my better more liked scripts
source ./disk.nu
source ./pandora.nu
source ./smolf.nu
source ./walk.nu

def "from mpk" [] { $in | from msgpack }
def "from mpkz" [] { $in | from msgpackz }

# TODO: Add files for completion, etc when nupm ain't experimental anymore
