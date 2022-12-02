# CryoInTheCloud JupyterHub user image

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/CryoInTheCloud/hub-image/HEAD)
[![Build and push container image](https://github.com/CryoInTheCloud/hub-image/actions/workflows/build.yaml/badge.svg)](https://github.com/CryoInTheCloud/hub-image/actions/workflows/build.yaml)

The JupyterHub docker image used for [hub.cryointhecloud.com](https://cryointhecloud.com),
hosted on https://quay.io/repository/cryointhecloud/cryo-hub-image

## Adding packages to this repository

You can easily add more packages to the cryointhecloud hub by making pull requests to this
repository. Edit either the `environment.yml` file (for most packages) or `apt.txt` file
(for packages that need to be used in the Linux Desktop environment in the cloud), and make
a pull request - you can even do that just from the GitHub UI! A bot will comment with a link to
[mybinder.org](https://mybinder.org) where you can test your pull request to make sure  it works
as you would expect.

## Updating the CryoCloud JupyterHub to use a new image

After your PR gets merged, our GitHub Actions will build and push a new image to 
[our image repository](https://quay.io/repository/cryointhecloud/cryo-hub-image?tab=tags) on quay.io. You
can monitor the progress of this in the GitHub Actions tab in this repo.

Once a new tag appears, someone with JupyterHub Admin permissions on the CryoCloud hub will have to
update it to use the new image.

1. Go to the [Configurator](https://hub.cryointhecloud.com/services/configurator/) for the CryoCloud hub.
2. Update the tag of the image under "User Docker Image" to use the new tag pushed for the PR in the
   [quay.io](https://quay.io/repository/cryointhecloud/cryo-hub-image?tab=tags) tags page. Make sure there are
   no trailing spaces!
3. Hit 'Submit'. Note that due to a bug you might not get feedback that your submission succeeded - refresh the 
   page to see if the tag stuck!
4. Once this is done, you can go start your server again (restart it if it is currently running). This will make sure
   you get the new image, with the changes you have performed!
   
The [2i2c docs](https://docs.2i2c.org/en/latest/admin/howto/configurator.html)
have some more information about the configurator!
