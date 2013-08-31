(define (even? n)
    (= (remainder n 2) 0))

(define (square n) (* n n))

(define (fast-expt b n)
    (cond
        ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; Q: Design a procedure that evolves an iterative exponentiation process that uses successive
; squaring and uses a logarithmic number of steps, as does fast-expt. (Hint: Using the observation
; that (b^(n/2))² = (b²)^(n/2), keep, along with the exponent n and the base b, an additional state
; variable a, and define the state transformation in such a way that the product ab^n is unchanged
; from state to state. At the beginning of the process a is taken to be 1, and the answer is given
; by the value of a at the end of the process. In general, the technique of defining an invariant
; quantity that remains unchanged from state to state is a powerful way to think about the design
; of iterative algorithms.)

; A:
;
; (b²)^(n/2) = b^(n/2) * b^(n/2)

(define (exp-iter b n a)
    (cond
        ((= n 0) a)
        ((even? n) (exp-iter (square b) (/ n 2) a))
        (else (exp-iter b (- n 1) (* a b)))))

(define (exp b n) (exp-iter b n 1))

(exp 2 10)