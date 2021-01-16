;; Exercise 1.9.

(define (add1 a b)
  (if (= a 0)
      b
      (inc (add1 (dec a) b))))

; (add1 4 5)
; (inc (add1 3 5))
; (inc (inc (add1 2 5)))
; (inc (inc (inc (add1 1 5))))
; (inc (inc (inc (inc (add1 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9

(define (add2 a b)
  (if (= a 0)
      b
      (add2 (dec a) (inc b))))

; (add2 4 5)
; (add2 3 6)
; (add2 2 7)
; (add2 1 8)
; (add2 0 9)
; 9

#|
Clearly, (add1 ...) is recursive and (add2 ...) is iterative.
|#