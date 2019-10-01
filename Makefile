DOCKERFILE ?= Dockerfile.ubuntu-bionic
IMAGE ?= ubuntu-bionic
VERSION ?= 0.3.0
SUBVERSION ?= 1
URGENCY ?= low
STABILITY ?= unstable

all:
	docker build -f "${DOCKERFILE}" --build-arg VERSION="${VERSION}" --build-arg SUBVERSION="${SUBVERSION}" --build-arg "URENCY=${URGENCY}" --build-arg STABILITY="${STABILITY}" -t "${IMAGE}" .
	docker run -d --rm --name ${IMAGE} "${IMAGE}"
	docker ps
	mkdir -p release
	for filename in nu_${VERSION}-${SUBVERSION}_amd64.deb \
			nu-dbgsym_${VERSION}-${SUBVERSION}_amd64.ddeb \
			nu_${VERSION}-${SUBVERSION}_amd64.buildinfo \
			nu_${VERSION}-${SUBVERSION}_amd64.build \
			nu_${VERSION}-${SUBVERSION}_amd64.changes \
			nu_${VERSION}-${SUBVERSION}.dsc \
			nu_${VERSION}-${SUBVERSION}.debian.tar.xz ; do \
		docker cp ${IMAGE}:/code/$${filename} release/$${filename} ; \
	done
