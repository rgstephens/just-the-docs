#!/bin/sh
VERS=$(yq e '.version' _config.yml)
time docker buildx build --platform linux/amd64,linux/arm64 --output=type=registry -t ghcr.io/rgstephens/bandonbrawl.com:${VERS} -t ghcr.io/rgstephens/bandonbrawl.com:latest .
#docker push ghcr.io/rgstephens/golftrip.link --all-tags
#kubectl config use-context default
#kubectl rollout restart deploy bandonbrawl -n websites
