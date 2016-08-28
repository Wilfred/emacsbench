;; Call a regular function 10,000,000 times.

(defun func (x)
  (1+ x))

(let ((x 0))
  (while (< x 10000000)
    (setq x (func x)))

  (message (format "DONE: FUNCTION CALLS: %s" x)))
