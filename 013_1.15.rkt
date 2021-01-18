;; Exercise 1.15.

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

(sine 12.15)

#|
a. Procedure p is applied 5 times, that's how many steps are needed to
   successively divide 12.15 by 3 to get 0.01.

b. Growth is TH(log a) because it's proportional to the number of divisions
   we have to make.
|#