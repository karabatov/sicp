(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))

;; Exercise 1.6.

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter2 guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter2 (improve guess x)
                     x)))

#|
(if ...) needs to provided as a special form instead of us writing a procedure
in terms of (cond ...) because of the applicative order in which the interpreter
works. The form (if ...) does not evaluate its else-clause operand until it is
necessary i.e. when the predicate is false, which our (new-if ...) procedure has
to evaluate the else-clause because it's a regular procedure.

Consequently, when defining (sqrt-iter2 ...) in terms of (new-if ...) and trying
to run it, (new-if ...) evaluates the else-clause and we are entering
an infinite loop because the result of (good-enough? ...) is never checked and
(sqrt-iter2 ...) is just called over and over again.
|#

;; Exercise 1.7.

#|
The (good-enough? ...) test will not be effective for finding roots of very
small numbers because the tolerance that it has (0.001) is quite large
compared to the small number itself. Let's compare:

(my-sqrt 0.0000001) ; Prints 0.03125106561775382.
(sqrt 0.0000001) ; Prints 0.00031622776601683794.

The answer is orders of magnitude away from the "correct" result.

Since the precision of "default" floating-point numbers is limited, the test
will break down for very large numbers, because in (good-enough? ...), the
square of guess will never reach the value of the original number x. Some digits
in the representation of x have been trimmed because it's so large, and the
value of guess is too small to reach the original magnitude of x. Observe:

(sqrt 3162277660168379411111) ; Prints 56234132519.03491.
(my-sqrt 3162277660168379411111) ; Infinite loop.
|#

(define (guess-unchanged? guess prev-guess)
  (< (abs (- guess prev-guess)) 0.0000000001))

(define (sqrt-iter-slide guess prev-guess x)
  (if (guess-unchanged? guess prev-guess)
      guess
      (sqrt-iter-slide (improve guess x)
                       guess
                       x)))

(define (my-sqrt-slide x)
  (sqrt-iter-slide 1.0 0.0 x))

#|
We introduce (guess-unchanged? ...) which uses an extra prev-guess operand to
watch how the guess changed compared to the previous guess. If the change is
smaller than a certain tolerance, (guess-unchanged? ...) returns true.

This fixes the problem both for small and large numbers and we achieve the same
result as the built-in (sqrt ...) procedure:

(my-sqrt-slide 0.0000001) ; Prints 0.00031622776601683794.
(sqrt 0.0000001) ; Prints 0.00031622776601683794.

(my-sqrt-slide 3162277660168379411111) ; Prints 56234132519.03491.
(sqrt 3162277660168379411111) ; Prints 56234132519.03491.
|#

;; Exercise 1.8.

(define (improve-cube guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (cube-root-iter guess prev-guess x)
  (if (guess-unchanged? guess prev-guess)
      guess
      (cube-root-iter (improve-cube guess x)
                      guess
                      x)))

(define (my-cube-root x)
  (cube-root-iter 1.0 0.0 x))

; (my-cube-root 27) ; Prints 3.0.
; (my-cube-root 3) ; Prints 1.4422495703074085.