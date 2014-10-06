# Emacs Stress Tests

Experimenting with some ideas around benchmarking Emacs itself.

Nothing to see here yet.

## Ideas

Performance:

* Font lock in a large C file (run `(font-lock-fontify-region (point-min) (point-max))`).
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
* A large number of overlays (magit?)
* Generating a large amount of memory (flx is apparently good at this)
  and playing with the GC configuration variables
* `isearch` with a pattern that matches pretty much everything in the
  buffer

Memory usage:

* Measuring memory usage at startup, and after opening a large number
  of buffers.
