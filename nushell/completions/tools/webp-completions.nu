# Written by graefchen
# based on: libwebp 1.5.0
# link: https://developers.google.com/speed/webp

# cwebp

# NOTE: Only a short version because it uses "-*string*" and nushell doew not like this 

# convert PNG or JPEG image files to WebP format (use -h/-H fro more options)
export extern cwebp [
	-h        # short help
	-H        # long help
	-q: float # quality factor (0:small..100:big), default=75
	-z: int   # activates lossless preset with given level in [0:fast, ..., 9:slowest]
	-m: int   # compression method (0=fast, 6=slowest), default=4
	-v        # verbose, e.g. print encoding/decoding times
]
