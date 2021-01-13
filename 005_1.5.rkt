;; Exercise 1.5.

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

#|
Since the Scheme interpreter is using applicative order by default,
that is, it evaluates the operator and the operands first before applying
them to the operator, running this code freezes the interpreter.

When we run (test 0 (p)), despite the fact that (if ...) does not
evaluate the alternative until the predicate is false, the interpreter
tries to evaluate both 0 and (p) in order to apply to (test ...) and
enters an infinite loop because (p) is defined in terms of itself.

If the interpreter were to use normal mode, (test 0 (p)) would return 0
because (p) would never have been evaluated: (if ...) does not evaluate
the alternative when x is 0.
|#