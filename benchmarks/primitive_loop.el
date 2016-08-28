;; Count to 10,000,000 in a loop.

(let ((x 0))
  (while (< x 10000000)
    (setq x (1+ x)))

  (message (format "DONE: PRIMITIVE LOOP: %s" x)))
