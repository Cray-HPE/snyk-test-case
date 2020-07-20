Test repo using Github Actions
--
This repo contains an example Docker image which can be scanned with Snyk.

Build the image:
--
```
docker build --tag mladkau/snyk-test-case:latest .
```

Test the image manually:
--
Set the environment variable to your Snyk API Token (see <User Icon>->General setting in the Snyk UI)
```
export SNYK_TOKEN=12345678-1234-1234-1234-123456789012
```

Run snyk:
```
docker run -e SNYK_TOKEN -v "/var/run/docker.sock":"/var/run/docker.sock" -v "${PWD}":"/github/workspace" --workdir /github/workspace  snyk/snyk:docker "snyk" "test" "--file=Dockerfile --policy-path=.snyk --docker" "mladkau/snyk-test-case:latest"
```
A few points:
- This runs a docker container which executes the Snyk CLI inside.
- The API token is given via the environment variable: SNYK_TOKEN
- Since we test here a local docker image we need to give access to the local docker socket `-v "/var/run/docker.sock":"/var/run/docker.sock"`
- We mount the current directory (which should be the repo checkout) into the docker container: `-v "${PWD}":"/github/workspace"`
- We declare the working directory inside the container: `--workdir /github/workspace` to be the mounted checkout
- We run the Snyk CLI: `snyk test --file=Dockerfile --policy-path=.snyk --docker" "mladkau/snyk-test-case:latest`
