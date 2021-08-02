# docker-sops-gpg

This is a simple docker image with SOPS and GPG pre-installed. 
You can use this to mount GPG keys into a container and run SOPS.

## Example usage

Sample bash script `~/sops-gpg.sh`:

```bash 
#!/bin/bash

command=$@

directoryname=$(pwd)

docker run -it -v ~/.gnupg:/root/.gnupg \
    -v $directoryname:/root/secrets sldk/gpg-sops:latest $command
```

Run with:

```bash
# Go to a directory that contains a .sops.yaml
cd ~/my-working-directory

~/sops-gpg.sh -d ./relative-secret-directory/secret.yaml
```
