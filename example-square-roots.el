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
