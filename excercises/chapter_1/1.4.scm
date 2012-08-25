; Observe that our model of evaluation allows for combinations whose operators are compound
; expressions. Use this observation to describe the behavior of the following procedure:

(define
    (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

(a-plus-abs-b 1 -1)

; -- operator to apply to a and b (+ or -) is chosen depanding on how b compares to zero