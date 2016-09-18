(defun sqrt-iter (guess x)
  (if (good-enough-p guess x)
      guess
    (sqrt-iter (improve guess x) x)))

(defun good-enough-p (guess x)
  (< (abs (/ (- (square guess) x) x)) 0.001))

(defun improve (guess x)
  (average guess (/ x guess)))

(defun average (a b)
  (/ (+ a b) 2))

(defun my-sqrt (x)
  (sqrt-iter 1 x))

(square (my-sqrt 1000.0))

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
