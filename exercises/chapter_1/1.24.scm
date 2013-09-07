; Q: Modify the timed-prime-test procedure of exercise 1.22 to use fast-prime? (the Fermat method),
; and test each of the 12 primes you found in that exercise. Since the Fermat test has Θ(log n)
; growth, how would you expect the time to test primes near 1,000,000 to compare with the time
; needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you
; find?

(define (fast-exp base exp)
  (cond
    ((= exp 0) 1)
    ((even? exp) (square (fast-exp base (/ exp 2))))
    (else (* base (fast-exp base (- exp 1))))))

(define (expmod base exp m)
  (remainder (fast-exp base exp) m))

(define (fermat-test n)
  (define (try-it a) (= (expmod a n n) a))
  (try-it (+ (random (- n 1)) 1)))

(define (fast-prime? n times)
  (cond
    ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)))

;---------------------------------------------------------------------------------------------------

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 2)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;---------------------------------------------------------------------------------------------------

(fermat-test 100000000003)

(timed-prime-test 100000000003)
(timed-prime-test 100000000019)
(timed-prime-test 100000000057) ;

(timed-prime-test 1000000000039)
(timed-prime-test 1000000000061)
(timed-prime-test 1000000000063) ;

(timed-prime-test 10000000000037)
(timed-prime-test 10000000000051)
(timed-prime-test 10000000000099) ;

(timed-prime-test 100000000000031)
(timed-prime-test 100000000000067)
(timed-prime-test 100000000000097) ;
