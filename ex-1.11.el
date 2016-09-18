;; recurse process implementation
(defun f1 (n)
  (cond ((< n 3) n)
        (t (+ (f1 (- n 1))
              (* 2 (f1 (- n 2)))
              (* 3 (f1 (- n 3)))))))

(f1 5)

;; iterative process
(defun f2 (n)
  (f2-iter 2 1 0 n))

(defun f2-iter (a b c count)
  (if (= count 0)
      c
      (f2-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))

(f2 5)
