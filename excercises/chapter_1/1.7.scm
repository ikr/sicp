; Q: The good-enough? test used in computing square roots will not be very effective for finding the
; square roots of very small numbers. Also, in real computers, arithmetic operations are almost
; always performed with limited precision. This makes our test inadequate for very large numbers.
; Explain these statements, with examples showing how the test fails for small and large numbers. An
; alternative strategy for implementing good-enough? is to watch how guess changes from one
; iteration to the next and to stop when the change is a very small fraction of the guess. Design a
; square-root procedure that uses this kind of end test. Does this work better for small and large
; numbers?

(define
    (good-enough? guess x)
    (<
        (abs (- (* guess guess) x))
        0.001))

(define
    (improve guess x)
    (/ (+ guess (/ x guess)) 2))

(define
    (a-sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (a-sqrt-iter (improve guess x) x)))

; A: On a small number like that

(a-sqrt-iter 1 0.000004)

; a-sqrt-iter returns 0.0312926134104966, which is over 10 times greater than the actual sqrt
; 0.002

; For a large number like that (uncomment to run):

; (a-sqrt-iter 1 40000000000000.0)

; sqrt-iter doesn't even terminate on my machine. Here's a better good-enough? function:

(define
    (next-is-good-enough? guess x)
    (<
        (abs
            (/
                (- guess (improve guess x))
                guess))
        0.001))

(define
    (b-sqrt-iter guess x)
    (if (next-is-good-enough? guess x)
        (improve guess x)
        (b-sqrt-iter (improve guess x) x)))

(b-sqrt-iter 1 0.000004)            ; returns way more accurate result than a-sqrt-iter

(b-sqrt-iter 1 40000000000000.0)    ; terminates (yay!) and the result is accurate too

; mission accomploshed :)