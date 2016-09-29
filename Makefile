MAKEFLAGS += --silent

all: emacs-25.1 emacs-24.5 emacs-24.4 emacs-24.3

emacs_git:
	# The GitHub repo seems to clone faster than the upstream
	# savannah.
	git clone "git@github.com:emacs-mirror/emacs.git" emacs_git

# We build all everything from a single checkout, so we cannot build
# multiple Emacs versions in parallel.
.NOTPARALLEL:

emacs-%: emacs_git
	$(eval VERSION = $(shell echo -n $@ | sed 's/emacs-//'))
	echo ">>>>>>>>>>>>>>>> BUILDING Emacs ${VERSION}"
	$(eval PREFIX = $(abspath "builds/emacs_${VERSION}"))
	mkdir -p ${PREFIX}

	-cd emacs_git && make clean | sed "s/^/[${VERSION}] /"
	cd emacs_git && git checkout emacs-${VERSION} | sed "s/^/[${VERSION}] /"

	cd emacs_git && ./autogen.sh all | sed "s/^/[${VERSION}] /"
	cd emacs_git && ./configure --prefix=$PREFIX | sed "s/^/[${VERSION}] /"
	cd emacs_git && make -j 3 | sed "s/^/[${VERSION}] /"
	cd emacs_git && make install | sed "s/^/[${VERSION}] /"
