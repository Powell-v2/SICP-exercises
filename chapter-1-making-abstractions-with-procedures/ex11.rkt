#lang racket
(require rackunit)

; recursive
(define (recf n)
  (if (< n 3)
      n
      (+ (recf (- n 1))
         (* 2
            (recf (- n 2)))
         (* 3
            (recf (- n 3))))))

(test-case
 "Returns arg value if it's less than 3"
 (check-equal? (recf 2) 2))

(test-case
 "Calculates correct output value according to the formula"
 (check-equal? (recf 4) 11))

; iterative
(define (itf n)
  (if (< n 3)
      n
      (f-iter 2 1 0 (- n 2))))

(define (f-iter x y z counter)
  (if (= counter 0)
      x
      (f-iter (+ x (* 2 y) (* 3 z))
              x
              y
              (- counter 1))))

(test-case
 "Returns arg value if it's less than 3"
 (check-equal? (itf -1) -1))

(test-case
 "Calculates correct output value according to the formula"
 (check-equal? (itf 5) 25))
