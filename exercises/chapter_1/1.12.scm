; The following pattern of numbers is called Pascal’s triangle.

;         1
;       1   1
;     1   2   1
;   1   3   3   1
; 1   4   6   4   1

; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum
; of the two numbers above it. Write a procedure that computes elements of Pascal’s triangle by means
; of a recursive process.

(define (pascals-triangle-number row position)
    (if (or (= 1 position) (= row position))
        1
        (+
            (pascals-triangle-number (- row 1) (- position 1))
            (pascals-triangle-number (- row 1) position))))

(pascals-triangle-number 1 1)
(pascals-triangle-number 5 2)
(pascals-triangle-number 5 3)
(pascals-triangle-number 5 4)