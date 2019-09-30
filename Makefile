VERSION ?= 0.3.0
SUBVERSION ?= 1
URGENCY ?= low
STABILITY ?= unstable

all:
	wget https://github.com/nushell/nushell/archive/${VERSION}.tar.gz
	mv ${VERSION}.tar.gz nu_${VERSION}.orig.tar.gz
	tar -xzvf nu_${VERSION}.orig.tar.gz
	
	# Write first line with correct version
	# The changelog should already be updated from GitHub
	cd nushell-${VERSION}; \
	sed -i "1s/.*/nu (${VERSION}-${SUBVERSION}) ${STABILITY}; urgency=${URGENCY}/" debian/changelog; \
	dpkg-source -b .; \
	dpkg-buildpackage
