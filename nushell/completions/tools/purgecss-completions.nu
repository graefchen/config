# Written by graefchen
# based od: purgecss 6.0.0
# link: https://github.com/FullHuman/purgecss

export extern purgecss [
  --version(-V)             # output the version number
  --content                 # glob of content files
  --css                     # glob of css files
  --config(-c): path        # path to the configuration file
  --output(-o): path        # file path directory to write purged css files to
  --font-face               # option to remove unused font-faces
  --keyframes               # option to remove unused keyframes
  --variables(-v)           # option to remove unused variables
  --rejected                # option to output rejected selectors
  --rejected-css            # option to output rejected css
  --safelist(-s)            # list of classes that should not be removed
  --blocklist(-b)           # list of selectors that should be removed
  --skippedContentGlobs(-k) # list of glob patterns for folders/files that should not be scanned
  --help(-h)                # display help for command
]
