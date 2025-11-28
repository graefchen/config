# Nushell Config File

$env.config = {
  show_banner: false
  history: { file_format: sqlite }
  rm: { always_trash: true }
}

# Starship
use ~/.cache/starship/init.nu
# Using completions ...
source ./completions/misc-completions.nu
source ./completions/extern/mod.nu
source ./completions/lang/mod.nu
source ./completions/package/mod.nu
source ./completions/tools/mod.nu

source ./scripts/apps.nu
source ./scripts/binary.nu
source ./scripts/commit.nu
source ./scripts/disk.nu
source ./scripts/neocities.nu
source ./scripts/pandora.nu
source ./scripts/walk.nu

use ./scripts/dead-links.nu
use ./scripts/hira.nu
use ./scripts/langs.nu
use ./scripts/rand.nu
use ./scripts/setup.nu
use ./scripts/smolf.nu
use ./scripts/toc.nu

# same as `from msgpack`
def "from mpk" [] { $in | from msgpack }
# same as `from msgpackz`
def "from mpkz" [] { $in | from msgpackz }
