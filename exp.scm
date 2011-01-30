(define (exponentiate-iter base counter product)
    (if (= counter 0)
        product
        (exponentiate-iter base (- counter 1) (* base product))))

(define (exponentiate base exponent)
    (exponentiate-iter base exponent 1))


(define (even? n) (= (remainder n 2) 0))

(define (square x) (* x x))

(define (a-b-n a b n)
    (cond
        ((= n 0) a)
        ((even? n)
            (a-b-n a (* b b) (/ n 2)))
        (else
            (a-b-n (* a b) b (- n 1)))))

(define (fast-exponentiate base exponent) (a-b-n 1 base exponent))