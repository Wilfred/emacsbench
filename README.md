# Emacs Stress Tests

Experimenting with some ideas around benchmarking Emacs itself.

Nothing to see here yet.

## Ideas

Performance:

* Font lock in a large C file (run `(font-lock-fontify-region (point-min) (point-max))`)
* Moving to the end of a large single-line file.
* which-func-mode in a large class (often slow in my experience).
* Existing regexp engine benchmarks
  (e.g. [1](http://sljit.sourceforge.net/regex_perf.html)). Look at
  both average-case and worst-case.
* Numeric calculations (built-in arithmetic, calc).
* List manipulations.
* Startup time.
* Org agenda search, org sparse tree search on a large org file.
* Org refile ido completion (with and without ido-hacks)
* Other fuzzy completions modes (grizzl, helm)
* Gnus with a large number of emails
* Running a simple keyboard macro until the end of a buffer (C-u 0 F4)
  for a very large file.
* A large number of overlays (magit maybe, or
  https://lists.gnu.org/archive/html/emacs-devel/2014-09/msg00616.html )
* Generating a large amount of memory (flx is apparently good at this)
  and playing with the GC configuration variables
* `isearch` with a pattern that matches pretty much everything in the
  buffer (fun examples: `.*.*` `(.*)*`)
* Time taken to byte-compile files (see
  [this emacs.SE answer](http://emacs.stackexchange.com/a/2092/304))
* Compare performance before and after byte-compilation
* compare performance with and without lexical binding (see
  [this emacs.SSE answer](http://emacs.stackexchange.com/q/2129))
* Stress test GC: repeatedly create some large lists. Experiment with
  the different GC configuration options (and possibly the different
  hash table options)

Memory usage:

* Measuring memory usage at startup, and after opening a large number
  of buffers.

Compilation:

* Compare the size of bytecode between different Emacs versions.

It would also be interesting to run the benchmarks inside a user's
usual environment, to see if their customisations are affecting
performance (and how much).
