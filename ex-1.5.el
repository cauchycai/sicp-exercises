(defun p () (p))
(defun test (x y)
  (if (= x 0) 0 y))
;; (test 0 (p))
;; Applicative-order evaluation: Exceeds max recursion depth. b/c it'll evaluate all arguments, then apply operator
;; Normal(Lazy)-order evaluation: 0
