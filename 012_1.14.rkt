;; Exercise 1.14.

(define (count-change amount)
  (cc amount 5 1))
(define (cc amount kinds-of-coins depth)
  (print-desc amount kinds-of-coins depth)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1)
                     (+ depth 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins
                     (+ depth 1))))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (print-desc a b c)
  (display "(proc ")
  (display a)
  (display " ")
  (display b)
  (display " ")
  (display c)
  (display ")")
  (newline))

(count-change 11)

; Space requirement: depth of the tree, TH(n).
; Steps growth: TH(n^k) (?)