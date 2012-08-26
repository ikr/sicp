; Alyssa P. Hacker doesn’t see why if needs to be pro- vided as a special form. “Why can’t I just
; define it as an ordinary procedure in terms of cond?” she asks. Alyssa’s friend Eva Lu Ator claims
; this can indeed be done, and she defines a new version of if:

(define
    (new-if predicate then-clause else-clause)
    (cond
        (predicate then-clause)
        (else else-clause)))

; Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)    ; 5

(new-if (= 1 1) 0 5)    ; 0

; Delighted, Alyssa uses new-if to rewrite the square-root program:

(define
    (good-enough? guess x)
    (<
        (abs (- (* guess guess) x))
        0.0000001))

(define
    (improve guess x)
    (/ (+ guess (/ x guess)) 2))

(define
    (sqrt-iter guess x)
    (new-if
        (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

; Q: What happens when Alyssa attempts to use this to compute square roots? Explain.

(sqrt-iter 1 2)

; A: infinite recursion of sqrt-iter.
; new-if, being a normal function, not a special form, obeys the applicative order evaluation rules,
; and evaluates all its arguments before proceeding to the cond-based implementation of "if". Thus,
; even though good-enough? will be long returning true, sqrt-iter will keep recurring without any
; limit.