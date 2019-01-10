#lang racket

(require rackunit)

(define (square x)
  (* x x))

(define (power-of-three x)
  (* x x x))

(define (third x y)
  (/ (+ x y) 3))

(define (good-enough? guess x)
  (< (abs (- (power-of-three guess) x)) 0.0001))

(define (improve guess x)
  (third (/ x (square guess)) (* 2 guess)))

(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x) x)))

(define (cubert x)
  (cubert-iter 1.0 x))

(test-case
 "Computes cube root"
 (check-equal? (round (cubert 125)) 5.0))
