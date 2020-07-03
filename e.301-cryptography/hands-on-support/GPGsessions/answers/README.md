# Answer 
1- Launch `show-key.sh` to get the session key, for instance:

```bash
$./show_key.sh
gpg: encrypted with 2048-bit ELG key, ID 53471CF069B29916, created 2019-12-03
      "Good Guy (This is the key of the good guy) <good.guy@bisounours.fr>"
gpg: session key: '7:BFB87C36CB9353F8BEC72272EAB18462'
```
followed by the message content.

2- Use `decrypt_woph.sh` to decrypt `relevant.asc`
You first need to paste the content of the session-key into `decrypt_wopk.sh`
```bash
vim decrypt_wopk.sh
```

```bash
#!/bin/bash
# Run show_key.sh to get the session key
# Paste it between the quote in the gpg command below
GREEN="\\033[1;32m"
DEFAULT="\\033[0;39m"
echo -e $GREEN"Attempting to decrypt relevant.asc using a session key"$DEFAULT
#gpg --override-session-key '' -d ../relevant.asc
gpg --override-session-key '7:BFB87C36CB9353F8BEC72272EAB18462' -d ../relevant.asc

```

```bash
$./decrypt_wopk.sh
```

# Subsidiary questions

- Why not just give the content of relevant.asc?
> Because it would remove the cryptographic proof that "Bad Guy" actually wrote
> this message, and that "Good Guy" did not tamper with it.
- What about "Bad Guy"'s key, do you have it? 
> You don't have this key in your keyring, and you don't need it. Once only need
> to recipient key, or the session-key to decrypt a message.
