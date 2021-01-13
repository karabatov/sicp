;; Exercise 1.1.

; 10 ; Prints 10.
; (+ 5 3 4) ; Prints 12.
; (- 9 1) ; Prints 8.
; (/ 6 2) ; Prints 3;
; (+ (* 2 4) (- 4 6)) ; Prints 6.
(define a 3)
(define b (+ a 1))
; (+ a b (* a b)) ; Prints 19.
; (= a b) ; Prints #f.
#|(if (and (> b a) (< b (* a b)))
    b
    a)
|# ; Prints 4.
#| (cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
|# ; Prints 16.
; (+ 2 (if (> b a) b a)) ; Prints 6.
#| (* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
|# ; Prints 16.