#lang racket
(require rackunit)

(define (get_element_in_pascal_triangle row term)
  (cond ((= term 1) 1)
        ((= row term) 1)
        (else (+ (get_element_in_pascal_triangle (- row 1) (- term 1))
                 (get_element_in_pascal_triangle (- row 1) term)))))

(check-equal? (get_element_in_pascal_triangle 1 1) 1)
(check-equal? (get_element_in_pascal_triangle 3 2) 2)
(check-equal? (get_element_in_pascal_triangle 5 3) 6)
(check-equal? (get_element_in_pascal_triangle 7 4) 20)
(check-equal? (get_element_in_pascal_triangle 9 5) 70)
