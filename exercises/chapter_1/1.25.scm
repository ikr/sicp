(define (expmod-0 base exp m)
  (cond
    ((= exp 0) 1)
    ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
    (else (remainder (* base (expmod base (- exp 1) m)) m))))

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
