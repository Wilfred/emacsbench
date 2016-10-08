## Ideas

### Isolated

Some tests we can just run against different Emacs versions.

Time:

* Moving to the end of a large single-line file.
  (with and without `fast-but-imprecise-scrolling` in 25.1)
* Compare performance before and after byte-compilation (note that
  rainbow-delimiters uses lexical-binding purely for performance)
  ([relevant emacs devel discussion](https://lists.gnu.org/archive/html/emacs-devel/2015-10/msg01695.html),
  [perf discussion in elisp manual](https://www.gnu.org/software/emacs/manual/html_node/elisp/Speed-of-Byte_002dCode.html))
* compare performance with and without lexical binding (see
  [this emacs.SSE answer](http://emacs.stackexchange.com/q/2129))
* Stress test GC: repeatedly create some large lists. Experiment with
  the different GC configuration options (and possibly the different
  hash table options)
* Existing regexp engine benchmarks
  (e.g. [1](http://sljit.sourceforge.net/regex_perf.html)). Look at
  both average-case and worst-case.
* Primitive list manipulations.
* Startup time (note the changes in Emacs 25.1 to ensure
  package-initialize is not called more than once)
* A large number of overlays (magit maybe, or
  https://lists.gnu.org/archive/html/emacs-devel/2014-09/msg00616.html
  ) (see also [proposed speedups](https://lists.gnu.org/archive/html/emacs-devel/2014-09/msg00671.html))
* Running a simple keyboard macro until the end of a buffer (C-u 0 F4)
  for a very large file.
* Generating a large amount of memory (flx is apparently good at this)
  and playing with the GC configuration variables
* Parsing large JSON with json.el
  https://lists.gnu.org/archive/html/emacs-devel/2015-10/msg01651.html
* The consequences of `--with-wide-int` when compiling
  Emacs. `configure.ac` claims 10-30% slowdown.
* Positional arguments vs common lisp style keyword arguments
  (the latter
  [are slower apparently](https://lists.gnu.org/archive/html/emacs-devel/2016-02/msg01400.html))
* Measure the performance impact of eager-macro expansion.
* Measure the performance of bubble sort (used by
  [el-compilador](https://github.com/tromey/el-compilador) as a benchmark)

Memory usage:

* Memory usage at startup
* Memory usage after opening a large number of buffers.

File size:

* Compare the size of bytecode between different Emacs versions.

### Included Major Modes

For some tests we want to test the included major modes.

Time:

* Numerics using calc.
* which-func-mode in a large class (often slow in my experience).
* Org agenda search, org sparse tree search on a large org file.
* Org refile ido completion (with and without ido-hacks)
* Gnus with a large number of emails
* `isearch` with a pattern that matches pretty much everything in the
  buffer (fun examples: `.*.*` `(.*)*`)

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

## References

### Tooling

Emacs does have some built-in profiling tools:
http://www.gnu.org/software/emacs/manual/html_node/elisp/Profiling.html

### Known Performance Issues

* Comint renders text slowly, particularly on OS X
([ref 1](http://www.reddit.com/r/emacs/comments/2e8byy/slowass_text_rendering/ck06mzi)
use [this file](https://gist.github.com/Wilfred/59795973e6231cefe8f9)
to reproduce,
[ref 2](https://github.com/JuliaLang/julia/pull/8026))
* Very long lines slow down movement and display
  ([ref 1](http://emacs.stackexchange.com/q/598/304), [ref 2](http://www.reddit.com/r/emacs/comments/2o483m/if_the_display_code_of_emacs_is_complex_why_it/cmltfq9))
* Magit can be very slow when viewing large diffs
([ref](https://github.com/Wilfred/emacsbench/issues/1))
* Linum can be slow on large files
([Ref](http://www.reddit.com/r/emacs/comments/2k5nhp/welcome_to_the_dark_side_switching_to_emacs/clk43j7?context=3))
* Font-lock can be sensitive to garbage collection ([ref](http://emacs.stackexchange.com/q/5351/304))
* Helm with very large numbers of candidates ([ref](http://www.reddit.com/r/emacs/comments/2pvmkm/helm_projectile_now_enables_fuzzy_matching_by/cn1wg2d))
* New byte codes added to improve performance ([ref](https://lists.gnu.org/archive/html/emacs-devel/2016-02/msg00826.html))
* Emacs 24 is faster than 25 for shen-elisp ([ref](http://lists.gnu.org/archive/html/emacs-devel/2016-08/msg00540.html))
