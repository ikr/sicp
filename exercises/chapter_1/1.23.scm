; Q: The smallest-divisor procedure shown at the start of this section does lots of needless
; testing: After it checks to see if the number is divisible by 2 there is no point in checking to
; see if it is divisible by any larger even numbers. This suggests that the values used for
; test-divisor should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, .... To implement this
; change, define a procedure next that returns 3 if its input is equal to 2 and otherwise returns
; its input plus 2. Modify the smallest-divisor procedure to use (next test-divisor) instead of (+
; test-divisor 1). With timed-prime-test incorporating this modified version of smallest-divisor,
; run the test for each of the 12 primes found in exercise 1.22. Since this modification halves the
; number of test steps, you should expect it to run about twice as fast. Is this expectation
; confirmed? If not, what is the observed ratio of the speeds of the two algorithms, and how do you
; explain the fact that it is different from 2?

(define (prime? n) (= n (smallest-divisor n)))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond
    ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (next test-divisor)))))

(define (divides? a b) (= (remainder b a) 0))

(define (next a) (if (= a 2) 3 (+ a 2)))

;---------------------------------------------------------------------------------------------------

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " ")
  (display elapsed-time))

(timed-prime-test 100000000003)
(timed-prime-test 100000000019)
(timed-prime-test 100000000057) ; was: ~0.6 now: ~0.36

(timed-prime-test 1000000000039)
(timed-prime-test 1000000000061)
(timed-prime-test 1000000000063) ; was: ~1.8 now: ~1.15

(timed-prime-test 10000000000037)
(timed-prime-test 10000000000051)
(timed-prime-test 10000000000099) ; was: ~5.7 now: ~3.57

(timed-prime-test 100000000000031)
(timed-prime-test 100000000000067)
(timed-prime-test 100000000000097) ; was: ~18.1 now: ~11.35

; A: No, the tests don't quite run twice as fast. Even thogh we halved the number of iterations in
; find-divisor, we've replaced a trivial, and probably fast, integer increment with a user function
; call -- "next"; therefore making each iteration a bit slower. Also, find-divisor is not on the top
; of the call stack, and the time required to get to it in the stack stayed unchanged. However, as
; the numbers grow, the ratio between the times in 1.22's and this implementation should
; asymptotically approach to 2.0.
