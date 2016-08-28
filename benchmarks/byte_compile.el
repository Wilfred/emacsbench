;; Measuring performance of byte-compilation.
;;
;; Stefan Monnier has used byte-compilation performance as his Emacs
;; benchmark of choice: http://emacs.stackexchange.com/a/2092/304
;;
;; To find a test file, I took a copy of all the packages in MELPA:
;;
;; $ rsync -avz --delete --progress rsync://melpa.org/packages/ melpa_mirror
;;
;; My criteria were:
;;
;; * large package
;; * a standalone .el file (so there's no data files inflating the size)
;; * no third-party dependencies
;; * support for old Emacs versions (so we can run this on more Emacs
;;   versions)
;;
;; twittering-mode.el (12KLOC) seemed like the best fit.

(byte-compile-file "test_files/twittering-mode-20160710.1017.el")

(message "DONE: BYTE COMPILE: %s" (file-exists-p "test_files/twittering-mode-20160710.1017.el"))
