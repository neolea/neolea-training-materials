# Preliminaries
## Exercise settings

The folder `setup` contains the script and files used to set up the hands-on
exercise. If you are using the VM you are all set, otherwise you need to run
`setup.sh` to set up keys, and encrypted files.

## Scenario settings

We created two keys, one for the person being the focused of
an investigation "Bad Guy", and one for our witness "Good Guy".

There are two messages:
- One relevant to the investigation: relevant.asc
- One irrelevant to the investigation: irrelevant.asc

"Good guy" is willing to cooperate, but he uses gpg to store securely his personal
thoughts and he is really ashamed of the content of irrelevant.asc (as you will
see, he should be!). Technically "Good Guy" encrypts files to himself.

"Bad Guy" is "Good Guy" acquaintance and sent a compromising message to "Good Guy".

Now, after being contacted by Law Enforcement, "Good Guy" agreed to shared
`relevant.asc` along with the required key to open it. But he does not to give
access to all his secrect (`irrelevant.asc`)

## Why we want session keys

Without sessions-keys one needs to give away its private key for decrypting
documents to which it is the recipient. It is all-or-nothing situation as any
message encrypted to this key will be decipherable.

But GPG is an hybrid cipher: it only uses the asymmetric key to encrypt a
symmetric key for each message. Therefore one can only share a message's
symmetric key--the session key--to decrypt one particular document only.

# Instructions

1- Using "Good Guy"'s passphrase "goodguypassphrase" extract the session-key for relevant.asc.
2- Act as the Law Enforcement officer receiving both relevant.asc, and the session-key, and decipher relevant.asc
3- Try to decrypt irrelevant.asc with the session-keys you get from relevant.asc, does it work?

# GPG help

## How to encrypt a file using a private key, to a particular recipient
```bash
$gpg --encrypt -u "$idgg" --armor --yes -r good.guy@bisounours.fr --output ../irrelevant.asc to_encrypt_irrelevant 
```

## How to decrypt a file
```bash
$gpg --decrypt ../to_encrypt_irrelevant.asc
```

## How to show a message's session key
```bash
$gpg --show-session-key --decrypt filetodecrypt 
```

## How to decrypt a message with a session key
```bash
$gpg --override-session-key 'the session key you get' -d filetodecrypt 
```

# Subsidiary questions

- Why not just give the content of relevant.asc?
- What about "Bad Guy"'s key, do you have it? 
