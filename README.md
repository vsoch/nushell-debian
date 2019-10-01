# Nushell Debian

This is testing an Debian package build for nushell, specifically we are:

 - using a Docker ubuntu 18.04 image as base with dependencies
 - based on a version, subversion, and other release arguments, building a container to download and build the release
 - copying final files from the container to the host in a "release" folder.

I'm not entirely sure why using a Docker base isn't more common, it seems like a modern way to do it as opposed to having an actual debian build system, or an older/different container abstraction (vm, pbuilder, chroot, etc.)

## Usage

To run with defaults (see the top of the [Makefile](Makefile):

```bash
$ make
```

The build will take about 20 minutes, given building a release verison of nushell.
If you want to customize any arguments, you can do that:

```bash
$ make VERSION=0.3.0 SUBVERSION=1 DOCKERFILE=Dockerfile.ubuntu URGENCY=high STABILITY=stable IMAGE=ubuntu
```

And the idea would be that a webhook from the [nushell/nushell](https://www.github.com/nushell/nushell]) 
repository (or a GitHub Action) would trigger, given a release there, a build here. What I'm still unsure about is how
to properly upload/release the final files.
