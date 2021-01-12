(define (cube x) (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (improve guess x)
  (/ (+ (* 2 guess) (/ x (* guess guess))) 3))

(define (cube-root guess x)
  (if (good-enough? guess x)
      guess
      (cube-root (improve guess x) x)))