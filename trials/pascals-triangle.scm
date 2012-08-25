(define (pascals-triangle-number row col)
    (cond
        ((< row 1) 0)
        ((< col 1) 0)
        ((> col row) 0)
        ((= col 1) 1)
        ((= row col) 1)
        (else
            (+
                (pascals-triangle-number (- row 1) (- col 1))
                (pascals-triangle-number (- row 1) col)))))