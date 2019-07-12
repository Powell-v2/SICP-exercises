#lang racket
(require rackunit)

(define (double n) (+ n n))
(define (halve-even n) (/ n 2))
(define (even? n) (= (remainder n 2) 0))

(define (* a b) (iterator a b 0))

(define (iterator a counter product)
  (cond ((= counter 0) product)
        ((even? counter) (iterator (double a)
                                   (halve-even counter)
                                   product))
        (else (iterator a
                        (- counter 1)
                        (+ a product)))))

(check-equal? (* 3 5000) 15000)
(check-equal? (* 20 400) 8000)