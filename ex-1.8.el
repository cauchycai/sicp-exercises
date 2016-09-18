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
