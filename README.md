# CryoInTheCloud JupyterHub user image

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/CryoInTheCloud/hub-image/HEAD)
[![Build and push container image](https://github.com/CryoInTheCloud/hub-image/actions/workflows/build.yaml/badge.svg)](https://github.com/CryoInTheCloud/hub-image/actions/workflows/build.yaml)

The JupyterHub docker image used for [hub.cryointhecloud.com](https://cryointhecloud.com),
hosted on https://quay.io/repository/cryointhecloud/cryo-hub-image

The image is built with [repo2docker](https://repo2docker.readthedocs.io), which uses
Ubuntu Bionic Beaver (18.04) as the base image. If you'd like to run a test build
locally, please read the [repo2docker Getting Started
doc](https://repo2docker.readthedocs.io/en/latest/getting-started/index.html) and the
[repo2docker Configuration Files
doc](https://repo2docker.readthedocs.io/en/latest/config_files.html#config-files).

## Updating packages in this repository

You can add or update packages on the cryointhecloud hub by making pull requests to this
repository. Follow these steps:

1. Edit either the [`environment.yml`](https://github.com/CryoInTheCloud/hub-image/edit/main/environment.yml)
   file (for most packages) or [`apt.txt`](https://github.com/CryoInTheCloud/hub-image/edit/main/apt.txt)
   file (for packages that need to be used in the Linux Desktop environment in the cloud).
2. Start a [pull request](https://github.com/CryoInTheCloud/hub-image/pulls) -
   you can even do that just from the GitHub UI! A bot will comment with a link to
   [mybinder.org](https://mybinder.org) where you can test your pull request to make sure it works
   as you would expect.
3. In the Pull Request, write a comment with the slash command `/condalock`.
   This will refresh the [`conda-lock.yml`](https://conda-incubator.github.io/conda-lock/output/#unified-lockfile)
   file that contains a snapshot of the exact library versions contained in the
   conda environment, which will be useful for reproducibility.
4. If the bot does not commit any changes to update the `conda-lock.yml` file in your PR, you can check the
   status of the action in the "Actions" tab; the bot could fail silently, in which case you should address
   any errors and re-comment with the `/condalock` command.

### Testing locally

To test the build locally, first ensure you have an up-to-date conda lock file, then
build with `repo2docker` (if your conda lock file was already updated by the bot as
described above, you can skip the first line):

```
conda-lock lock --mamba --kind explicit --file environment.yml --platform linux-64
repo2docker --apendix "$(cat appendix)" .
```

This build may take up to 30 minutes.

Once the image is built, `repo2docker` will automatically run a JupyterLab
server and display a message like this:

```
    To access the notebook, open this file in a browser:
        file:///home/<YOUR_USERNAME>/.local/share/jupyter/runtime/nbserver-27-open.html
    Or copy and paste this URL:
        http://127.0.0.1:53695/?token=<YOUR_TOKEN>
```

Click the URL on the last line of the `repo2docker` output to open the local JupyterLab
instance in your browser, and you're ready to test!

From here, you'll be able to locally test anything you can do in a cloud deployment:
run terminal commands, edit and run notebooks, or start a desktop VNC session.

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
