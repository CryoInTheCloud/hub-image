# CryoInTheCloud JupyterHub user image

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/CryoInTheCloud/hub-image/HEAD)

The JupyterHub image used for [hub.cryointhecloud.com](https://cryointhecloud.com).

## Adding packages to this repository

You can easily add more packages to the cryointhecloud hub by making pull requests to this
repository. Edit either the `environment.yml` file (for most packages) or `apt.txt` file
(for packages that need to be used in the Linux Desktop environment in the cloud), and make
a pull request - you can even do that just from the GitHub UI! A bot will comment with a link to
[mybinder.org](https://mybinder.org) where you can test your pull request to make sure  it works
as you would expect.

Once your PR gets merged, you can follow the [2i2c docs](https://docs.2i2c.org/en/latest/admin/howto/configurator.html)
to have the hub use them!
