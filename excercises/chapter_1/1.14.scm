(define (first-denomination kinds-of-coins)
    (cond
        ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (cc amount kinds-of-coins)
    (cond
        ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+
            (cc amount (- kinds-of-coins 1))
            (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))

(define (count-change amount) (cc amount 5))

(count-change 11)

; Q: Draw the tree illustrating the process generated by the count-change procedure in making change
; for 11 cents. What are the orders of growth of the space and number of steps used by this process
; as the amount to be changed increases?

(cc 11 5)

(+
    (cc 11 4)
    (cc -39 5))

(+
    (+
        (cc 11 3)
        (cc -14 4))
    (cc -39 5))

(+
    (+
        (+
            (cc 11 2)
            (cc 1 3))
        (cc -14 4))
    (cc -39 5))

(+
    (+
        (+
            (+
                (cc 11 1)
                (cc 6 2))
            (cc 1 3))
        (cc -14 4))
    (cc -39 5))

(+
    (+
        (+
            (+
                (+
                    (cc 11 0)
                    (cc 10 1))
                (cc 6 2))
            (cc 1 3))
        (cc -14 4))
    (cc -39 5))

(+
    (+
        (+
            (+
                (+
                    0
                    (+
                        (10 0)
                        (9 1)))
                (cc 6 2))
            (cc 1 3))
        (cc -14 4))
    (cc -39 5))


(+
    (+
        (+
            (+
                (+
                    0
                    (+
                        0
                        (+
                            (9 0)
                            (8 1))))
                (cc 6 2))
            (cc 1 3))
        (cc -14 4))
    (cc -39 5))


(+
    (+
        (+
            (+
                (+
                    0
                    (+
                        0
                        (+
                            0
                            (+
                                (8 0)
                                (7 1)))))
                (cc 6 2))
            (cc 1 3))
        (cc -14 4))
    (cc -39 5))


(+
    (+
        (+
            (+
                (+
                    0
                    (+
                        0
                        (+
                            0
                            (+
                                0
                                (+
                                    (7 0)
                                    (6 1))))))
                (cc 6 2))
            (cc 1 3))
        (cc -14 4))
    (cc -39 5))

(+
    (+
        (+
            (+
                (+
                    0
                    (+
                        0
                        (+
                            0
                            (+
                                0
                                (+
                                    0
                                    (+
                                        (6 0)
                                        (5 1)))))))
                (cc 6 2))
            (cc 1 3))
        (cc -14 4))
    (cc -39 5))

; A: as the amount N increases, the consumed memory grows as O(N), and thr number of steps grows as
; O(2^N). See the 1.14.mm FreeMind file for the process tree.
