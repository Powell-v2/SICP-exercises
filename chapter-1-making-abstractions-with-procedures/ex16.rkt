#lang racket
(require rackunit)

(define (square n) (* n n))
(define (even? n) (= (remainder n 2) 0))

(define (expt-iter b n)
  (iterator b n 1))

(define (iterator b counter product)
  (cond ((= counter 0) product)
        ((even? counter) (iterator b
                             (- counter 2)
                             (* product (square b))))
        (else (iterator b
                        (- counter 1)
                        (* product b)))))

(check-equal? (expt-iter 2 10) 1024)
(check-equal? (expt-iter 3 3) 27)
