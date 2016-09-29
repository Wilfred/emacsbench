MAKEFLAGS += --silent

all: emacs-25.1 emacs-24.5 emacs-24.4 emacs-24.3

emacs_git:
	# The GitHub repo seems to clone faster than the upstream
	# savannah.
	git clone "git@github.com:emacs-mirror/emacs.git" emacs_git

# We build all everything from a single checkout, so we cannot build
# multiple Emacs versions in parallel.
.NOTPARALLEL:

NO_COLOR=\x1b[0m
GREEN=\x1b[32;01m

clean:
	rm -rf builds

emacs-%: emacs_git
	echo ">>>>>>>>>>>>>>>> BUILDING $@"
	$(eval PREFIX = $(abspath "builds/$@"))
	mkdir -p ${PREFIX}

	-cd emacs_git && git clean -dfx | sed "s/^/[${GREEN}$@ Clean${NO_COLOR}] /"
	cd emacs_git && git checkout $@ | sed "s/^/[${GREEN}$@ Checkout${NO_COLOR}] /"

	cd emacs_git && ./autogen.sh all | sed "s/^/[${GREEN}$@ Autogen${NO_COLOR}] /"
	cd emacs_git && ./configure --prefix=${PREFIX} --with-jpeg=no | sed "s/^/[${GREEN}$@ Configure${NO_COLOR}] /"
	cd emacs_git && make -j 3 | sed "s/^/[${GREEN}$@ Build${NO_COLOR}] /"
	cd emacs_git && make install | sed "s/^/[${GREEN}$@ Install${NO_COLOR}] /"
