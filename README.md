# Repro Instructions

```
docker build . -t testimage
snyk test --file=./Dockerfile --exclude-base-image-vulns --docker testimage:latest
echo $?
```

Expected output: `0`
Observed output: `1`
