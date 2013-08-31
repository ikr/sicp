; Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using
; applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

(define (p) (p))

(define
    (test x y)
    (if (= x 0) 0 y))

; Then he evaluates the expression

(test 0 (p))

; Q: What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What
; behavior will he observe with an interpreter that uses normal-order evaluation? Explain your
; answer. (Assume that the evaluation rule for the special form if is the same whether the
; interpreter is using normal or applicative order: The predicate expression is evaluated first, and
; the result determines whether to evaluate the consequent or the alternative expression.)

; A:
; applicative-order evaluation: endless recursion, because the interpereter will evaluate both of
; the "test's" operands first.

(test 0 ...((((((((((((((((p)))))))))))))))...)

; normal-order evaluation: (test 0 (p)) returns 0, because the interpreter will substutute the
; "test" invocation

(test 0 (p))

; with function definition, and pull through the formal arguments:

(if (= 0 0) 0 (p)))

; now the predicate evaluates to true, and zero gets returned by "if", without trying to evaluate
; (p)
