;; Pascal's Triangle
;; row: i, column: j
(defun p (i j)
  (cond ((> j i) nil)
        ((or (= j 1) (= j i)) 1)
        (t (+ (p (- i 1) (- j 1)) (p (- i 1) j)))))

(p 2 2)
(p 3 2)
(p 5 3)
