#lang racket
(require rackunit)

(define (square n) (* n n))

(define (fib n) (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count) (fib-iter a
                                 b
                                 (+ (square p) (square q))
                                 (* (+ (* 2 p) q) q)
                                 (/ count 2)))
        (else (fib-iter (+ (* a p) (* q (+ a b)))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(check-equal? (square 25) 625)
(check-equal? (fib 10) 55)
(check-equal? (fib 11) 89)
(check-equal? (fib 12) 144)