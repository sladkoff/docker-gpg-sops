FROM vladgh/gpg

ARG SOPS_VERSION=3.7.1

RUN apk add --update curl \
    && curl -qsL https://github.com/mozilla/sops/releases/download/v"${SOPS_VERSION}"/sops-v"${SOPS_VERSION}".linux -o /usr/local/bin/sops \
    && chmod +x /usr/local/bin/sops \
    && mkdir /root/secrets/

WORKDIR /root/secrets/

ENTRYPOINT ["/usr/local/bin/sops"]
