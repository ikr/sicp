;; Q: Demonstrate that the Carmichael numbers listed in Footnote 1.47 really do fool the Fermat
;; test. That is, write a procedure that takes an integer n and tests whether a^n is congruent to a
;; modulo n for every a < n, and try your procedure on the given Carmichael numbers.

;; Footnote 1.47: Numbers that fool the Fermat test are called Carmichael numbers, and little is
;; known about them other than that they are extremely rare. There are 255 Carmichael numbers below
;; 100,000,000. The smallest few are 561, 1105, 1729, 2465, 2821, and 6601. In testing primality of
;; very large numbers chosen at random, the chance of stumbling upon a value that fools the Fermat
;; test is less than the chance that cosmic radiation will cause the computer to make an error in
;; carrying out a “correct” algorithm. Considering an algorithm to be inadequate for the first
;; reason but not for the second illustrates the difference between mathematics and engineering.

;; A: Indeed, the Carmichael numbers fool the Fermat test for all values of a < n

(define (expmod base exp m)
  (cond
    ((= exp 0) 1)
    ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
    (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (complete-fermat-test a n)
  (if (= a n)
      1
      (if (= a (expmod a n n))
          (complete-fermat-test (+ a 1) n)
          0)))

;; Carmichael numbers
(complete-fermat-test 0 561)  ;; 1, even though 561 = 3 * 11 * 17 -- not a prime
(complete-fermat-test 0 1105) ;; 1
(complete-fermat-test 0 1729) ;; 1
(complete-fermat-test 0 2465) ;; 1
(complete-fermat-test 0 2821) ;; 1
(complete-fermat-test 0 6601) ;; 1

;; Actual primes
(complete-fermat-test 0 3571) ;; 1
(complete-fermat-test 0 827)  ;; 1

;; Not a prime
(complete-fermat-test 0 6241) ;; 0
