set imap_user = "theguestone@gmail.com"
set imap_pass = ""
set smtp_url = "smtp://theguestone@smtp.gmail.com:587/"
set smtp_pass = ""
set from = "theguestone@gmail.com"
set realname = "Guest One"
set postponed = ""
set record = ""




set pgp_decode_command="gpg %?p?--passphrase-fd 0? --no-verbose --batch --output - %f"
set pgp_verify_command="gpg --no-verbose --batch --output - --verify %s %f"
set pgp_decrypt_command="gpg --passphrase-fd 0 --no-verbose --batch --output - %f"
set pgp_sign_command="gpg --no-verbose --batch --output - --passphrase-fd 0 --armor --detach-sign --textmode %?a?-u %a? %f"
set pgp_clearsign_command="gpg --no-verbose --batch --output - --passphrase-fd 0 --armor --textmode --clearsign %?a?-u %a? %f"
set pgp_encrypt_only_command="pgpewrap gpg --batch --quiet --no-verbose --output - --encrypt --textmode --armor --always-trust --encrypt-to 6574BEF2 -- -r %r -- %f"
set pgp_encrypt_sign_command="pgpewrap gpg --passphrase-fd 0 --batch --quiet --no-verbose --textmode --output - --encrypt --sign %?a?-u %a? --armor --always-trust --encrypt-to 6574BEF2 -- -r %r -- %f"
set pgp_import_command="gpg --no-verbose --import -v %f"
set pgp_export_command="gpg --no-verbose --export --armor %r"
set pgp_verify_key_command="gpg --no-verbose --batch --fingerprint --check-sigs %r"
set pgp_list_pubring_command="gpg --no-verbose --batch --with-colons --list-keys %r" 
set pgp_list_secring_command="gpg --no-verbose --batch --with-colons --list-secret-keys %r" 

# this set the number of seconds to keep in memory the passpharse used to encrypt/sign
# the more the less secure it will be
set pgp_timeout=60

# it's a regexp used against the GPG output: if it matches some line of the output
# then mutt considers the message a good signed one (ignoring the GPG exit code)
set pgp_good_sign="^gpg: Good signature from"

# mutt uses by default PGP/GPG to sign/encrypt messages
# if you want to use S-mime instead set the smime_is_default variable to yes

# automatically sign all outgoing messages
set crypt_autosign
# sign only replies to signed messages
set crypt_replysign

# automatically encrypt outgoing messages
set crypt_autoencrypt=yes
# encrypt only replies to signed messages
set crypt_replyencrypt=yes
# encrypt and sign replies to encrypted messages
set crypt_replysignencrypted=yes

# automatically verify the sign of a message when opened
set crypt_verify_sig=yes

# specify the uid to use when encrypting/signing
set pgp_sign_as=6574BEF2

# this set the number of seconds to keep in memory the passpharse used to encrypt/sign
# the more the less secure it will be
set pgp_timeout=60

# it's a regexp used against the GPG output: if it matches some line of the output
# then mutt considers the message a good signed one (ignoring the GPG exit code)
set pgp_good_sign="^gpg: Good signature from"

# mutt uses by default PGP/GPG to sign/encrypt messages
# if you want to use S-mime instead set the smime_is_default variable to yes

# automatically sign all outgoing messages
set crypt_autosign
# sign only replies to signed messages
set crypt_replysign

# automatically encrypt outgoing messages
set crypt_autoencrypt=yes
# encrypt only replies to signed messages
set crypt_replyencrypt=yes
# encrypt and sign replies to encrypted messages
set crypt_replysignencrypted=yes

# automatically verify the sign of a message when opened
set crypt_verify_sig=yes
