(define (cube-root x)
    (define (cube-root-iter guess prev-guess)
        (if (good-enough? guess prev-guess)
            guess
            (cube-root-iter (improve guess) guess)))

    (define (improve guess)
        (/
            (+
                (/ x (* guess guess))
                (* 2 guess))
            3))

    (define (good-enough? guess prev-guess)
        (<
            (abs (- guess prev-guess))
            0.000001))
            
    (cube-root-iter 1.0 0.0))
    
(define (factorial-a n)
    (define (iter product counter)
        (if (> counter n)
            product
            (iter (* counter product) (+ counter 1))))

    (iter 1 1))
    
(define (factorial-b n)
    (if (< n 2)
        1
        (* n (factorial-b (- n 1)))))
        
(define (A x y)
    (cond
        ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))
        
(define (f n) (A 0 n))


(define (f n)
    (cond
        ((= n 1) 2)
        (else (* 2 n))))

(define (g n) (A 1 n))

(define (g n)
    (cond
        ((= n 1) 2)
        (else (f (g (- n 1))))))

(define (h n) (A 2 n))

(define (h n)
    (cond
        ((= n 1) 2)
        (else (g (h (- n 1))))))
        
(define (fib n)
    (cond
        ((= n 0) 0)
        ((= n 1) 1)
        (else
            (+
                (fib (- n 1))
                (fib (- n 2))))))