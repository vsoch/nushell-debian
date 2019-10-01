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

## Example

After nushell compiles, you will see the package being built:

```bash
...
 nushell-0.3.0/target/release/libnu.d
 nushell-0.3.0/target/release/nu.d
 nushell-0.3.0/target/release/nu_plugin_add.d
 nushell-0.3.0/target/release/nu_plugin_edit.d
 nushell-0.3.0/target/release/nu_plugin_embed.d
 nushell-0.3.0/target/release/nu_plugin_inc.d
 nushell-0.3.0/target/release/nu_plugin_ps.d
 nushell-0.3.0/target/release/nu_plugin_skip.d
 nushell-0.3.0/target/release/nu_plugin_str.d
 nushell-0.3.0/target/release/nu_plugin_sum.d
 nushell-0.3.0/target/release/nu_plugin_sys.d
 nushell-0.3.0/target/release/nu_plugin_textview.d
dpkg-source: info: using source format '3.0 (quilt)'
dpkg-source: info: building nu using existing ./nu_0.3.0.orig.tar.gz
dpkg-source: warning: executable mode 0755 of 'target/release/nu' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_add' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_edit' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_embed' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_inc' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_ps' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_skip' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_str' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_sum' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_sys' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_textview' will not be represented in diff
dpkg-source: info: building nu in nu_0.3.0-1.debian.tar.xz
dpkg-source: info: building nu in nu_0.3.0-1.dsc
dpkg-source: info: using source format '3.0 (quilt)'
dpkg-source: info: building nu using existing ./nu_0.3.0.orig.tar.gz
dpkg-source: warning: executable mode 0755 of 'target/release/nu' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_add' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_edit' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_embed' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_inc' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_ps' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_skip' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_str' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_sum' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_sys' will not be represented in diff
dpkg-source: warning: executable mode 0755 of 'target/release/nu_plugin_textview' will not be represented in diff
dpkg-source: info: building nu in nu_0.3.0-1.debian.tar.xz
dpkg-source: info: building nu in nu_0.3.0-1.dsc
 dpkg-buildpackage -rfakeroot -us -uc -ui -b -i
dpkg-buildpackage: warning: using a gain-root-command while being root
dpkg-buildpackage: info: source package nu
dpkg-buildpackage: info: source version 0.3.0-1
dpkg-buildpackage: info: source distribution unstable
dpkg-buildpackage: info: source changed by Jan Koprowski <jan.koprowski@gmail.com>
 dpkg-source -i --before-build nushell-0.3.0
dpkg-buildpackage: info: host architecture amd64
 fakeroot debian/rules clean
dh clean
   dh_clean
 debian/rules build
dh build
   dh_update_autotools_config
   dh_autoreconf
   create-stamp debian/debhelper-build-stamp
 fakeroot debian/rules binary
dh binary
   dh_testroot
   dh_prep
   dh_install
   dh_installdocs
   dh_installchangelogs
   dh_perl
   dh_link
   dh_strip_nondeterminism
   dh_compress
   dh_fixperms
   dh_missing
   dh_strip
   dh_makeshlibs
   dh_shlibdeps
   dh_installdeb
   dh_gencontrol
   dh_md5sums
   dh_builddeb
dpkg-deb: building package 'nu' in '../nu_0.3.0-1_amd64.deb'.
dpkg-deb: building package 'nu-dbgsym' in 'debian/.debhelper/scratch-space/build-nu/nu-dbgsym_0.3.0-1_amd64.deb'.
	Renaming nu-dbgsym_0.3.0-1_amd64.deb to nu-dbgsym_0.3.0-1_amd64.ddeb
 dpkg-genbuildinfo --build=binary
 dpkg-genchanges --build=binary >../nu_0.3.0-1_amd64.changes
dpkg-genchanges: info: binary-only upload (no source code included)
 dpkg-source -i --after-build nushell-0.3.0
dpkg-buildpackage: info: binary-only upload (no source included)
Now running lintian nu_0.3.0-1_amd64.changes ...
warning: the authors of lintian do not recommend running it with root privileges!
E: nu changes: bad-distribution-in-changes-file unstable
E: nu: embedded-library usr/bin/nu: curl
E: nu: embedded-library usr/bin/nu: libyaml
W: nu: new-package-should-close-itp-bug
W: nu: description-synopsis-starts-with-article
W: nu: binary-without-manpage usr/bin/nu
W: nu: binary-without-manpage usr/bin/nu_plugin_add
W: nu: binary-without-manpage usr/bin/nu_plugin_edit
W: nu: binary-without-manpage usr/bin/nu_plugin_embed
W: nu: binary-without-manpage usr/bin/nu_plugin_inc
W: nu: binary-without-manpage usr/bin/nu_plugin_ps
W: nu: binary-without-manpage usr/bin/nu_plugin_skip
W: nu: binary-without-manpage usr/bin/nu_plugin_str
W: nu: binary-without-manpage usr/bin/nu_plugin_sum
W: nu: binary-without-manpage usr/bin/nu_plugin_sys
W: nu: binary-without-manpage usr/bin/nu_plugin_textview
W: nu: maintainer-script-ignores-errors postinst
Finished running lintian.
```

And then the container will finish building, start running headless, and we will copy files
to the host system under "release":

```bash
$ tree release/
release/
├── nu_0.3.0-1_amd64.build
├── nu_0.3.0-1_amd64.buildinfo
├── nu_0.3.0-1_amd64.changes
├── nu_0.3.0-1_amd64.deb
├── nu_0.3.0-1.debian.tar.xz
├── nu_0.3.0-1.dsc
└── nu-dbgsym_0.3.0-1_amd64.ddeb

0 directories, 7 files
(base) vanessa@vanessa-ThinkPad-T460s:~/Documents/Dropbox/Code/rust/nushell-debian$ 
```
