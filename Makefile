MAKEFLAGS += --silent

all: emacs_git emacs_25_1 emacs_24_5 emacs_24_4 emacs_24_3

emacs_git:
	# The GitHub repo seems to clone faster than the upstream
	# savannah.
	git clone "git@github.com:emacs-mirror/emacs.git" emacs_git

# We build all everything from a single checkout, so we cannot build
# multiple Emacs versions in parallel.
.NOTPARALLEL:

emacs_25_1:
	echo ">>>>>>>>>>>>>>>> BUILDING Emacs 25.1"
	mkdir -p builds/emacs_25_1
	cd emacs_git && make clean
	cd emacs_git && git checkout emacs-25.1

	cd emacs_git && ./autogen.sh all
	cd emacs_git && ./configure --prefix=builds/emacs_25_1
	cd emacs_git && make -j 3
	cd emacs_git && make install

emacs_24_5:
	echo ">>>>>>>>>>>>>>>> BUILDING Emacs 24.5"
	mkdir -p builds/emacs_24_5
	cd emacs_git && make clean
	cd emacs_git && git checkout emacs-24.5

	cd emacs_git && ./autogen.sh all
	cd emacs_git && ./configure --prefix=builds/emacs_24_5
	cd emacs_git && make -j 3
	cd emacs_git && make install

emacs_24_4:
	echo ">>>>>>>>>>>>>>>> BUILDING Emacs 24.4"
	mkdir -p builds/emacs_24_4
	cd emacs_git && make clean
	cd emacs_git && git checkout emacs-24.4

	cd emacs_git && ./autogen.sh all
	cd emacs_git && ./configure --prefix=builds/emacs_24_4
	cd emacs_git && make -j 3
	cd emacs_git && make install

# TODO: there's a lot of duplication here, factor it out.
emacs_24_3:
	echo ">>>>>>>>>>>>>>>> BUILDING Emacs 24.3"
	mkdir -p builds/emacs_24_3
	cd emacs_git && make clean
	cd emacs_git && git checkout emacs-24.3

	cd emacs_git && ./autogen.sh all
	cd emacs_git && ./configure --prefix=builds/emacs_24_3
	cd emacs_git && make -j 3
	cd emacs_git && make install
