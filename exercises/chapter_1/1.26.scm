;; Q: Louis Reasoner is having great difficulty doing Exercise 1.24. His fast-prime? test seems to
;; run more slowly than his prime? test. Louis calls his friend Eva Lu Ator over to help. When they
;; examine Louis’s code, they find that he has rewritten the expmod procedure to use an explicit
;; multiplication, rather than calling square:

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base
                                    (- exp 1)
                                    m))
                    m))))

;; “I don’t see what difference that could make,” says Louis. “I do.” says Eva. “By writing the
;; procedure like that, you have transformed the Θ(log n) process into a Θ(n) process.” Explain.

;; A: Scheme interpreter follows the applicative order evaluation strategy; meaning that, when
;; evaluating (* A B), it completely evaluates both A and B first. Thus, instead of just halving the
;; recursive call argument on each iteration: 32 - 16 - 8 - 4 - 2, we're yielding a binary tree of
;; recursive computation:
;;
;;        32
;;       /  \
;;     16    16
;;    /  \  /  \
;;   8    88    8
;;  /............\
;;
;; The number of vertices in that computation tree has the same order of growth as the recursion
;; argument itself, meaning we've got a Θ(n) process.
