#lang racket
(require rackunit)

(define (double n) (+ n n))
(define (halve-even n) (/ n 2))
(define (even? n) (= (remainder n 2) 0))

(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (* (double a) (halve-even b)))
        (else (+ a (* a (- b 1))))))

(check-equal? (double 20) 40)
(check-equal? (halve-even 500) 250)
(check-equal? (* 2 2000) 4000)
(check-equal? (* 11 1001) 11011)
