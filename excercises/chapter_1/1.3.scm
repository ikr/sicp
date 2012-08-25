; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the
; two larger numbers.

(define
    (sum-of-squares x y)
    (+ (* x x) (* y y)))

(sum-of-squares 3 4)        ; 25

(define
    (sum-of-squares-of-two-larger x y z)
    (cond
        ((and (>= x z) (>= y z)) (sum-of-squares x y))
        ((and (>= y x) (>= z x)) (sum-of-squares y z))
        (else (sum-of-squares x z))))

(sum-of-squares-of-two-larger 1 1 1)    ; 2

(sum-of-squares-of-two-larger 1 2 2)    ; 8

(sum-of-squares-of-two-larger 4 3 2)    ; 25