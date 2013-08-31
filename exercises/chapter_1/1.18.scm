; Q: Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that generates an
; iterative process for multiplying two integers in terms of adding, doubling, and halving and uses
; a logarithmic number of steps.

; A:

(define (double x) (+ x x))
(define (halve x) (/ x 2))

; Let's introduce c: ab + c is constant for each iteration

(define (mul-iter a b c)
    (cond
        ((= b 0) c)
        ((even? b) (mul-iter (double a) (halve b) c))
        (else (mul-iter a (- b 1) (+ a c)))))

(define (mul a b) (mul-iter a b 0))

(mul 5 11)