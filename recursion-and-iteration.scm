(define (f-tree n)
    (if (< n 3)
        n
        (+
            (f-tree (- n 1))
            (* 2 (f-tree (- n 2)))
            (* 3 (f-tree (- n 3))))))

(define (f-0 f-1 f-2 f-3)
    (+
        f-1
        (* 2 f-2)
        (* 3 f-3)))

(define (f-n n f-1 f-2 f-3)
    (if (< n 3)
        n
        (f-0 f-1 f-2 f-3)))

(define (f n-final n-current f-1 f-2 f-3)
    (if (= n-current n-final)
        (f-n n-current f-1 f-2 f-3)
        (f
            n-final
            (+ n-current 1)
            (f-n n-current f-1 f-2 f-3)
            f-1
            f-2)))

(define (f-iterative n) (f n 0 0 0 0))