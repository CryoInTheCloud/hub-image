# GitHub Actions Continuous Integration workflows

- binder.yaml - Adds a Binder badge to Pull Requests that are newly opened
- build.yaml - Build and push docker container images to a docker registry
- conda-lock-command.yml - Refresh conda-lock files by writing `/condalock` in a Pull Request comment
- retag.yml - Republish docker images originally tagged with a short hash using a new CalVer string
- test.yaml - Test building docker container images in a Pull Request
