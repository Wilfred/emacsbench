# Emacs Stress Tests

Experimenting with some ideas around benchmarking Emacs itself.

Nothing to see here yet.

## Ideas

Performance:

* Font lock in a large C file (run `(font-lock-fontify-region (point-min) (point-max))`).
* Moving to the end of a large single-line file.
* which-func-mode in a large class (often slow in my experience).
* Existing regexp engine benchmarks (e.g. [1](http://sljit.sourceforge.net/regex_perf.html)).
* Numeric calculations.
* List manipulations.
* Startup time.

Memory usage:

* Measuring memory usage at startup, and after opening a large number
  of buffers.
