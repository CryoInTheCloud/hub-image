# CryoInTheCloud JupyterHub user image

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/CryoInTheCloud/hub-image/HEAD)
[![Build and push container image](https://github.com/CryoInTheCloud/hub-image/actions/workflows/build.yaml/badge.svg)](https://github.com/CryoInTheCloud/hub-image/actions/workflows/build.yaml)

The JupyterHub docker image used for [hub.cryointhecloud.com](https://cryointhecloud.com),
hosted on https://quay.io/repository/cryointhecloud/cryo-hub-image

## Updating packages in this repository

You can add or update packages on the cryointhecloud hub by making pull requests to this
repository. Follow these steps:

1. Edit either the `environment-cryocloud.yml` file (for most packages) or `apt.txt` file
   (for packages that need to be used in the Linux Desktop environment in the cloud)
2. Start a [pull request](https://github.com/CryoInTheCloud/hub-image/pulls) -
   you can even do that just from the GitHub UI! A bot will comment with a link to
   [mybinder.org](https://mybinder.org) where you can test your pull request to make sure it works
   as you would expect.
3. In the Pull Request, write a comment with the slash command `/condalock`.
   This will refresh the [`conda-lock.yml`](https://conda-incubator.github.io/conda-lock/output/#unified-lockfile)
   file that contains a snapshot of the exact library versions that will be
   used in the conda environment.

Once your Pull Request gets reviewed and merged, you can follow the
[2i2c docs](https://docs.2i2c.org/en/latest/admin/howto/configurator.html)
to have the JupyterHub use them!
