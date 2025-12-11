# Nushell Config File

$env.config = {
  show_banner: false
  history: { file_format: sqlite }
  rm: { always_trash: true }
}

def "from mpk" [] { $in | from msgpack }
def "from mpkz" [] { $in | from msgpackz }
