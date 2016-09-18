;; Example: The Fibonacci Numbers
(defun fib (n)
  (fib-iter 1 0 n))

(defun fib-iter (a b count)
  (if (= count 0)
      b
    (fib-iter (+ a b) a (- count 1))))

(fib 6)
