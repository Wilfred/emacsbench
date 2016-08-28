;; Measure font-lock performance for a very large C file.
;;
;; LIMITATIONS
;;
;; This is not an isolated elisp test: we're using the built-in
;; cc-mode.el, which changes between Emacs versions.

(find-file "test_files/testmgr.h")

;; During normal editing, Emacs tries to just highlight the sections
;; of the buffer that are visible. Instead, we fontify the whole
;; buffer (28KLOC).
(font-lock-fontify-region (point-min) (point-max))

(message (format "DONE: HIGHLIGHTING: %s" (prin1-to-string (buffer-substring 1048596 1048602))))
