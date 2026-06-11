#!/usr/bin/env elvish

# written by graefchen
# based on the script on the elvish website
# converts the jpg-images into webp
use str

for x [*.jpg] {
  var name = [(str:split "/" (str:trim-suffix $x .jpg))][-1]
  # Note: (2025-08-13) Why not using cwebp?
  #       Because it does not read the rotation of the file
  #       that it wants to convert...
  e:magick $x -auto-orient $name.webp
}
