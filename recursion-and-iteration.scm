(define (f-recursive n)
    (if (< n 3)
        n
        (+
            (f-recursive (- n 1))
            (* 2 (f-recursive (- n 2)))
            (* 3 (f-recursive (- n 3))))))

(f-recursive 1)
(f-recursive 2)
(f-recursive 3)
(f-recursive 4)
(f-recursive 5)
(f-recursive 10)
(f-recursive 20)
(f-recursive 30)