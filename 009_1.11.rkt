;; Exercise 1.11.

(define (f-recur n)
  (cond ((< n 3) n)
        (else (+ (f-recur (- n 1))
                 (* 2 (f-recur (- n 2)))
                 (* 3 (f-recur (- n 3)))))))

(f-recur 0) ; Prints 0.
(f-recur 1) ; Prints 1.
(f-recur 2) ; Prints 2.
(f-recur 3) ; Prints 4.
(f-recur 4) ; Prints 11.
(f-recur 5) ; Prints 25.

(define (f-iter n3 n2 n1 counter)
  (if (= counter 0)
      n1
      (f-iter n2 n1 (+ n1 (* 2 n2) (* 3 n3)) (- counter 1))))

(define (f n)
  (if (< n 3)
      n
      (f-iter 0 1 2 (- n 2))))

(f 0) ; Prints 0.
(f 1) ; Prints 1.
(f 2) ; Prints 2.
(f 3) ; Prints 4.
(f 4) ; Prints 11.
(f 5) ; Prints 25.