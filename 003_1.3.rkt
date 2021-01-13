;; Exercise 1.3.

(define (square x) (* x x))

(define (sum-squares a b)
  (+ (square a) (square b)))

(define (largest-two-squares a b c)
  (cond ((and (<= a b) (<= a c)) (sum-squares b c))
        ((and (<= b a) (<= b c)) (sum-squares a c))
        (else (sum-squares a b))))

; (largest-two-squares 1 2 3) prints 13.
; (largest-two-squares 3 2 1) prints 13.
; (largest-two-squares 1 3 2) prints 13.
; (largest-two-squares 1 1 1) prints 2.
; (largest-two-squares 1 1 2) prints 5.