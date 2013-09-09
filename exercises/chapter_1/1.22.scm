(define (prime? n) (= n (smallest-divisor n)))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond
    ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

; Q: Most Lisp implementations include a primitive called runtime that returns an integer that
; specifies the amount of time the system has been running (measured, for example, in
; microseconds). The following timed-prime-test procedure, when called with an integer n, prints n
; and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by
; the amount of time used in performing the test.

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; Using this procedure, write a procedure search-for-primes that checks the primality of consecutive
; odd integers in a specified range. Use your procedure to find the three smallest primes larger
; than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to
; test each prime. Since the testing algorithm has order of growth of sqrt(n), you should expect
; that testing for primes around 10,000 should take about sqrt(10) times as long as testing for
; primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and
; 1,000,000 support the sqrt(n) prediction? Is your result compatible with the notion that programs
; on your machine run in time proportional to the number of steps required for the computation?

; A: To make the problem interesting for the modern processors' clock speed, we'll scale up the
; problem by a factor of 10^8

(define (search-for-primes current upper-bound)
  (timed-prime-test current)
  (if (>= current upper-bound)
    0
    (search-for-primes (+ current 2) upper-bound)))

(search-for-primes 100000000001 100000000059)
; 100000000003 *** .58
; 100000000019 *** .570000000000000
; 100000000057 *** .5800000000000001

(search-for-primes 1000000000001 1000000000065)
; 1000000000039 *** 1.8200000000000003
; 1000000000061 *** 1.83
; 1000000000063 *** 1.8200000000000003

(search-for-primes 10000000000001 10000000000101)
; 10000000000037 *** 5.7
; 10000000000051 *** 5.690000000000001
; 10000000000099 *** 5.73

(search-for-primes 100000000000001 100000000000099)
; 100000000000031 *** 18.11
; 100000000000067 *** 18.25
; 100000000000097 *** 18.120000000000005

; Yep, the time grows exactlt as it's predicted by the complexity analysis.

;;--------------------------------------------------------------------------------------------------
;; And, the original numbers' data...

(search-for-primes 1001 1021)
;; 1009 *** 0.
;; 1013 *** 0.
;; 1019 *** 0.

(search-for-primes 10001 10039)
;; 10007 *** 0.
;; 10009 *** 0.
;; 10037 *** 0.

(search-for-primes 100001 100045)
;; 100003 *** 0.
;; 100019 *** 0.
;; 100043 *** 0.

(search-for-primes 1000001 1000039)
;; 1000003 *** 0.
;; 1000033 *** 0.
;; 1000037 *** 0.
