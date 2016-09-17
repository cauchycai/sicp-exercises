;;; -*- lexical-binding: t -*-

;; Exercise 1.2
(/ (+ 5
      4
      (- 2
         (- 3
            (+ 6
               (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))

;; Exercise 1.3
(defun ex1_3 (n1 n2 n3)
  (cond ((and (< n1 n2) (< n1 n3)) (+ (* n2 n2) (* n3 n3)))
        ((and (< n2 n1) (< n2 n3)) (+ (* n1 n1) (* n3 n3)))
        ((and (< n3 n1) (< n3 n2)) (+ (* n1 n1) (* n2 n2)))))

(ex1_3 1 2 3)

;; Exercise 1.4
(defun a-plus-abs-b (a b)
  (funcall (if (> b 0) '+ '-) a b))

(a-plus-abs-b 1 -2)

;; Exercise 1.5
(defun p () (p))
(defun test (x y)
  (if (= x 0) 0 y))
;; (test 0 (p))
;; Applicative-order evaluation: Exceeds max recursion depth. b/c it'll evaluate all arguments, then apply operator
;; Normal(Lazy)-order evaluation: 0

;; Example: Square Roots by Newton’s Method
(defun sqrt-iter (guess x)
  (if (good-enough-p guess x)
      guess
    (sqrt-iter (improve guess x) x)))

(defun good-enough-p (guess x)
  (< (abs (- (square guess) x)) 0.001))

(defun improve (guess x)
  (average guess (/ x guess)))

(defun average (a b)
  (/ (+ a b) 2))

(defun my-sqrt (x)
  (sqrt-iter 1 x))

(square (my-sqrt 1000.0))

;; Exercise 1.6
(defun new-if (predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 1 1) 0 5)

(defun sqrt-iter-2 (guess x)
  (new-if (good-enough-p guess x)
          guess
          (sqrt-iter-2 (improve guess x) x)))

;;(sqrt-iter-2 1 1000.0)
;; Error, new-if will evalute both then-clause and else-clause in each execution
;; and the third argument of new-if will cause an infinite loop

;; Exercise 1.7
(defun better-good-enough-p (guess x)
  (< (abs (/ (- (square guess) x) x)) 0.001))

;; Exercise 1.8
(defun cbrt-iter (guess x)
  (if (cbrt-good-enough-p guess x)
      guess
    (cbrt-iter (cbrt-improve guess x) x)))

(defun cbrt-good-enough-p (guess x)
  (< (abs (- (cube guess) x)) 0.001))

(defun cbrt-improve (guess x)
  (/ (+ (/ x
           (square guess))
        (* guess 2))
     3))

(defun cube (a)
  (* a a a))

(cube (cbrt-iter 1 10.0))

;; Exercise 1.9
;; The first is recursive, and the second is iterative

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


(provide 'ch-1)
;;; ch-1 ends here
