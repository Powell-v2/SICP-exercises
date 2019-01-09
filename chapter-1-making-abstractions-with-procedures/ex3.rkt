#lang racket

(require rackunit)

(define (square x)
  (* x x))

(define (square-of-two-larger a b c)
  (cond
    [(and (< a b) (< a c)) (+ (square b) (square c))]
    [(and (< b a) (< b c)) (+ (square a) (square c))]
    [(and (< c a) (< c b)) (+ (square a) (square b))]
    ))
(test-case
 "Returns the sum of the squares of the two larger numbers"
 (check-equal? (square-of-two-larger 100 10 5) 10100))
