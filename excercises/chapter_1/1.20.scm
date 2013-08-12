(define (gcd a b)
  (if (= b 0)
    a
    (gcd
      b
      (remainder a b))))

; Q: The process that a procedure generates is of course dependent on the rules used by the
; interpreter. As an example, consider the iterative gcd procedure given above. Suppose we were to
; interpret this procedure using normal-order evaluation, as discussed in Section 1.1.5. (The
; normal-order-evaluation rule for if is described in Exercise 1.5.) Using the substitution method
; (for normal order), illustrate the process generated in evaluating (gcd 206 40) and indicate the
; remainder operations that are actually performed. How many remainder operations are actually
; performed in the normal-order evaluation of (gcd 206 40)? In the applicative-order evaluation?

; A: 1. Normal-order evaluation

(gcd 206 40)

(gcd
  40
  (remainder 206 40))

(if (= (remainder 206 40) 0) ; 1 call
  40
  (gcd
    (remainder 206 40)
    (remainder 40 (remainder 206 40))))

(if (= (remainder 40 (remainder 206 40)) 0) ; 2 calls
  (remainder 206 40)
  (gcd
    (remainder 40 (remainder 206 40))
    (remainder
      (remainder 206 40)
      (remainder 40 (remainder 206 40)))))

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; 4 calls
  (remainder 40 (remainder 206 40))
  (gcd
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (remainder
      (remainder 40 (remainder 206 40)))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
