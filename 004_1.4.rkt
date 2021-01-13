;; Exercise 1.4.

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; (a-plus-abs-b 1 2) prints 3.
; (a-plus-abs-b 1 -2) prints 3.
; (a-plus-abs-b -1 -2) prints 1.

#|
When b is greater than zero, combination (if (> b 0) + -)
resolves to +, otherwise it resolves to -.

The resulting expression is (+ a b) or (- a b). We have
returned a procedure from (if ...) and used that as operator.
|#