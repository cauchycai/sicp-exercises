;; Exercise 1.10
(defun A (x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (t (A (- x 1) (A x (- y 1))))))

;; (A 1 10) => (A (- 1 1) (A 1 (- 10 1))) => (A 0 (A 1 9)) => (* 2 (A 1 9)) => (* 2 (* 2 ...(* 2 2))) => 2^10 => 1024
(A 1 10) ;; => 1024
(A 2 4) ;; => 65536
(A 3 3) ;; => 65536

;; f(n) = 2n
(defun f (n)
  (A 0 n))

(f 10) ;; => 20

;; g(n) = 2^n
(defun g (n)
  (A 1 n))

(g 4) ;; => 16

;; h(n) = 2^2^2... (n 2's)
(defun h (n)
  (A 2 n))

(h 3)