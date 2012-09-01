; Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root
; of x, then a better approximation is given by the value: http://screencast.com/t/CgGt4yDPcEJ7
; Use this formula to implement a cube-root procedure analogous to the square-root procedure.

(define (improve guess x)
        (/
            (+
                (/ x (* guess guess))
                (* 2 guess))
            3))

(define (next-is-good-enough? guess x)
    (<
        (abs
            (/
                (- guess (improve guess x))
                guess))
        0.001))

(define (cube-root guess x)
    (if (next-is-good-enough? guess x)
        (improve guess x)
        (cube-root (improve guess x) x)))

(cube-root 1 27)
(cube-root 1 8)
(cube-root 1 0.000000027)
(cube-root 1 27000000000000.0)