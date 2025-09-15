# GitHub Actions Continuous Integration workflows

- binder.yaml - Adds a Binder badge to Pull Requests that are newly opened
- build.yaml - Build and push docker container images to a docker registry
- conda-lock-command.yml - Refresh conda-lock files by writing `/condalock` in a Pull Request comment
- pr_comment.yml - Respond to dependabot Pull Request updating environment.yml with `/condalock` command
- retag.yml - Republish docker images originally tagged with a short hash using a new CalVer string
- slash-command-dispatch.yml - ChatOps that looks for slash commands in Pull Requests to trigger automated scripts
- test.yaml - Test building docker container images in a Pull Request
