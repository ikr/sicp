;; Q: Modify the timed-prime-test procedure of exercise 1.22 to use fast-prime? (the Fermat method),
;; and test each of the 12 primes you found in that exercise. Since the Fermat test has Θ(log n)
;; growth, how would you expect the time to test primes near 1,000,000 to compare with the time
;; needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you
;; find?

(define (expmod base exp m)
  (cond
    ((= exp 0) 1)
    ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
    (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a) (= (expmod a n n) a))
  (try-it (+ (random (- n 1)) 1)))

(define (fast-prime? n times)
  (cond
    ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)))

;;--------------------------------------------------------------------------------------------------

(define (measure n)
  (write n)
  (write-char #\space)
  (with-timings
    (lambda () (fast-prime? n 100000))
    report))

(define (report run-time gc-time real-time)
  (write (internal-time/ticks->seconds real-time))
  (newline))

(measure 1019)            ;; 3.669s
(measure 10037)           ;; 4.246s
(measure 100043)          ;; 4.980s
(measure 1000037)         ;; 5.678s
(measure 10000019)        ;; 6.686s
(measure 100000037)       ;; 7.858s

(measure 100000000057)    ;; 12.799s
(measure 1000000000063)   ;; 13.497s
(measure 10000000000099)  ;; 14.198s
(measure 100000000000097) ;; 15.139s

;; A: Yep, that looks pretty much like a logarithmic growth to me.
