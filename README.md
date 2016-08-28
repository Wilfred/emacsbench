# Emacs Benchmarks

How fast is Emacs itself? How fast are the primitives? How fast is the
elisp interpreter?

This project is an attempt to get some hard numbers.

## Usage

benchmarks/ contains elisp benchmark script. Each file documents what
it is testing. Every script ends by printing a computed value, to
confirm that Emacs has actually done what we expected.

``` shell
$ for f in benchmarks/*; do echo $f; time emacs --quick --script $f; done
```

Use of Emacs for scripting is
[based on this blog post](http://www.lunaryorn.com/2014/08/12/emacs-script-pitfalls.html).

TODO

* bytecode performance metrics
* see if performance is equivalent in an emacs GUI
* see if loading site-lisp affects performance

## Contributing

Please file bugs and report areas where you find Emacs is too slow!
