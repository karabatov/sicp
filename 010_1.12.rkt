;; Exercise 1.12.

(define (pt-recur row element)
  (cond ((or (< element 1) (> element row)) 0)
        ((or (= element 1) (= element row)) 1)
        (else (+ (pt-recur (- row 1) (- element 1))
                 (pt-recur (- row 1) element)))))

(do ((row 1 (+ row 1)))
  ((= row 10) (newline))
  (do ((element 1 (+ element 1)))
    ((> element row) (newline))
    (display (pt-recur row element))
    (display " ")))