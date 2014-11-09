# Emacs Stress Tests

Experimenting with some ideas around benchmarking Emacs itself.

No code here yet.

## Ideas

### Isolated

Some tests we can just run against different Emacs versions.

Time:

* Moving to the end of a large single-line file.
* Compare performance before and after byte-compilation (note that
  rainbow-delimiters uses lexical-binding purely for performance)
* compare performance with and without lexical binding (see
  [this emacs.SSE answer](http://emacs.stackexchange.com/q/2129))
* Stress test GC: repeatedly create some large lists. Experiment with
  the different GC configuration options (and possibly the different
  hash table options)
* Existing regexp engine benchmarks
  (e.g. [1](http://sljit.sourceforge.net/regex_perf.html)). Look at
  both average-case and worst-case.
* Primitive list manipulations.
* Primitive numeric calculations
* Startup time
* A large number of overlays (magit maybe, or
  https://lists.gnu.org/archive/html/emacs-devel/2014-09/msg00616.html )
* Running a simple keyboard macro until the end of a buffer (C-u 0 F4)
  for a very large file.
* Generating a large amount of memory (flx is apparently good at this)
  and playing with the GC configuration variables

Memory usage:

* Memory usage at startup
* Memory usage after opening a large number of buffers.

File size:

* Compare the size of bytecode between different Emacs versions.

### Included Major Modes

For some tests we want to test the included major modes.

Time:

* Numerics using calc.
* Font lock in a large C file (run `(font-lock-fontify-region (point-min) (point-max))`)
* which-func-mode in a large class (often slow in my experience).
* Org agenda search, org sparse tree search on a large org file.
* Org refile ido completion (with and without ido-hacks)
* Gnus with a large number of emails
* `isearch` with a pattern that matches pretty much everything in the
  buffer (fun examples: `.*.*` `(.*)*`)
* Time taken to byte-compile files (see
  [this emacs.SE answer](http://emacs.stackexchange.com/a/2092/304))
* [Linum can be slow](http://www.reddit.com/r/emacs/comments/2k5nhp/welcome_to_the_dark_side_switching_to_emacs/clk43j7?context=3)
  but how much slower?

### Reference Elisp

We could also look at an included major mode, take an old version that
runs on all our tests versions, so we're comparing exactly the same
elisp against different Emacs versions.

### Third-party Elisp

We could also look at benchmarking popular third-party packages:

Time:

* Fuzzy completions modes (grizzl, helm)
* Magit can be very slow when showing large diffs.

### .emacs.d

It would also be interesting to run the benchmarks inside a user's
usual environment, to see if their customisations are affecting
performance (and how much).
