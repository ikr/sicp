(define atom?
  (lambda (x)
    (and
     (not (pair? x))
     (not (null? x)))))

(define rember
  (lambda (a lat)
    (cond
     ((null? lat) '())
     ((eq? a (car lat)) (cdr lat))
     (else
      (cons (car lat) (rember a (cdr lat)))))))

(define multirember
  (lambda (a lat)
    (cond
     ((null? lat) '())
     ((eq? a (car lat)) (multirember a (cdr lat)))
     (else
      (cons (car lat) (multirember a (cdr lat)))))))

(multirember 'the '(the ride the lightning the the the))
