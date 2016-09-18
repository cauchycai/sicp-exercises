;;; -*- lexical-binding: t -*-
(defun ex1_3 (n1 n2 n3)
  (cond ((and (< n1 n2) (< n1 n3)) (+ (* n2 n2) (* n3 n3)))
        ((and (< n2 n1) (< n2 n3)) (+ (* n1 n1) (* n3 n3)))
        ((and (< n3 n1) (< n3 n2)) (+ (* n1 n1) (* n2 n2)))))

(ex1_3 1 2 3)
