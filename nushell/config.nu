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
source ./scripts/disk.nu

use ./scripts/binary.nu
use ./scripts/commit.nu
use ./scripts/dead-links.nu
use ./scripts/hira.nu
use ./scripts/langs.nu
use ./scripts/neocities.nu
use ./scripts/rand.nu
use ./scripts/toc.nu
use ./scripts/walk.nu

# same as `from msgpack`
def "from mpk" [] { $in | from msgpack }
# same as `from msgpackz`
def "from mpkz" [] { $in | from msgpackz }
