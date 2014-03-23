(define (expmod-0 base exp m)
  (cond
    ((= exp 0) 1)
    ((even? exp) (remainder (square (expmod-0 base (/ exp 2) m)) m))
    (else (remainder (* base (expmod-0 base (- exp 1) m)) m))))

(define (fast-expt b n)
    (cond
        ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;; Q: Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod. After all,
;; she says, since we already know how to compute exponentials, we could have simply written

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

;; Is she correct? Would this procedure serve as well for our fast prime tester? Explain.

(define (report run-time gc-time real-time)
  (write (internal-time/ticks->seconds real-time))
  (newline))

(with-timings
    (lambda () (expmod-0 123071 250993 250993))
    report)

(with-timings
    (lambda () (expmod 123071 250993 250993))
    report)

;; A: No, she's not. As the example above demonstrates, the proposed "expmod" is way slower than the
;; original expmod-0 (5.977 seconds vs. under 0.001 seconds). Without the "remainder" on each
;; recursion step, keeping the numbers within the modulo-m field, all the arithmetic grows very fast
;; out of the processor word boundaries into the BigNum domain, and all the operations become
;; "non-elementary". Which means that the time required to subtract, multiply and divide those big
;; numbers grows with the numbers themselves.
