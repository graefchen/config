# Written by graefchen
# based on: age v1.2.1
# link: https://github.com/FiloSottile/age

# simple, modern, and secure file encryption
export extern age [
    --encrypt(-e)               # Encrypt the input to the output. Default if omitted.
    --decrypt(-d)               # Decrypt the input to the output.
    --output(-o): string        # Write the result to the file at path OUTPUT.
    --armor(-a)                 # Encrypt to a PEM encoded format.
    --passphrase(-p)            # Encrypt with a passphrase.
    --recipient(-r): string     # Encrypt to the specified RECIPIENT. Can be repeated.
    --recipients-file(-R): path # Encrypt to recipients listed at PATH. Can be repeated.
    --identity(-i): path        # Use the identity file at PATH. Can be repeated.
]

# generate age(1) key pairs
export extern age-keygen [
    --output(-o): string # Write the result to the file at path OUTPUT.
    -y                   # Convert an identity file to a recipients file.
]
