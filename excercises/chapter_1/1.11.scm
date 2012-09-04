; A function f is defined by the rule that
;
; f(n) = n if n < 3 and
; f(n) = f(n − 1) + 2f(n − 2) + 3f(n − 3) if n ≥ 3.
;
; Q: Write a procedure that computes f by means of a recursive process. Write a procedure that
; computes f by means of an iterative process.

; A: recursive implementation

(define (f-rec n)
    (if (< n 3)
        n
        (+
            (f-rec (- n 1))
            (* 2 (f-rec (- n 2)))
            (* 3 (f-rec (- n 3))))))

(f-rec 1)
(f-rec 2)
(f-rec 3)
(f-rec 4)
(f-rec 5)
(f-rec 6)
(f-rec 7)
(f-rec 8)

; A: iterative implementation

(define (f-iter n)
    (define (g counter gcounter-1 gcounter-2 gcounter-3 n)
        (define h (+ gcounter-1 (* 2 gcounter-2) (* 3 gcounter-3)))
        (if (< n 3)
            n
            (if (= n counter)
                h
                (g (+ counter 1) h gcounter-1 gcounter-2 n))))
    (g 3 2 1 0 n))

(f-iter 1)
(f-iter 2)
(f-iter 3)
(f-iter 4)
(f-iter 5)
(f-iter 6)
(f-iter 7)
(f-iter 8)