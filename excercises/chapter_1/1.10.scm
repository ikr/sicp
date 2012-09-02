; The following procedure computes a mathematical function called Ackermann’s function.

(define (A x y)
    (cond
        ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else
            (A
                (- x 1)
                (A x (- y 1))))))

; What are the values of the following expressions?

(A 1 10)

; (cond
;     ((= 10 0) 0)
;     ((= 1 0) (* 2 y))
;     ((= 10 1) 2)
;     (else
;         (A
;             (- 1 1)
;             (A 1 (- 10 1)))))

; (A 0 (A 1 9))

; (A 0 (cond
;     ((= 9 0) 0)
;     ((= 1 0) (* 2 y))
;     ((= 9 1) 2)
;     (else
;         (A
;             (- 1 1)
;             (A 1 (- 9 1))))))

; (A 0 (A 0 (A 1 8)))
; (A 0 (A 0 ( A 0 (A 1 7))))
; (A 0 (A 0 ( A 0 (A 0 (A 1 6)))))
; (A 0 (A 0 ( A 0 (A 0 (A 0 (A 1 5))))))
; (A 0 (A 0 ( A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
; (A 0 (A 0 ( A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
; (A 0 (A 0 ( A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
; (A 0 (A 0 ( A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
; (A 0 (A 0 ( A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
; (A 0 (A 0 ( A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
; (A 0 (A 0 ( A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
; (A 0 (A 0 ( A 0 (A 0 (A 0 (A 0 16))))))
; (A 0 (A 0 ( A 0 (A 0 (A 0 32)))))
; (A 0 (A 0 ( A 0 (A 0 64))))
; (A 0 (A 0 ( A 0 128)))
; (A 0 (A 0 256))
; (A 0 512)
; 1024

(A 2 4)

; (cond
;     ((= 4 0) 0)
;     ((= 2 0) (* 2 4))
;     ((= 4 1) 2)
;     (else
;         (A
;             (- 2 1)
;             (A 2 (- 4 1)))))

; (A (- 2 1) (A 2 (- 4 1)))
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 4))
; (A 1 16)
; 65536

(A 3 3)

; (cond
;     ((= 3 0) 0)
;     ((= 3 0) (* 2 y))
;     ((= 3 1) 2)
;     (else
;         (A
;             (- 3 1)
;             (A 3 (- 3 1)))))

; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2))
; (A 2 4)
; 65536

; Q: Consider the following procedures, where A is the procedure defined above. Give concise
; mathematical definitions for the functions computed by the procedures f, g, and h for positive
; integer values of n. For example,

(define (k n) (* 5 n n))

; (k n) computes 5n^2.

(k 1)   ; 5
(k 2)   ; 20

(define (f n) (A 0 n))

; (f n) computes 2n

(f 10)  ; 20
(f 55)  ; 110

(define (g n) (A 1 n))

; (g n) computes 2^n

(g 5)   ; 32
(g 10)  ; 1024

(define (h n) (A 2 n))

; (h n) computes 2^...^2 (n times), like 2^(2^(2^2)) for (h 4)

(h 1)   ; 2
(h 2)   ; 4
(h 3)   ; 16
(h 4)   ; 65536
