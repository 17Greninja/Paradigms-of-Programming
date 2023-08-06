#lang racket

;Q7
; referred to slides(factorial problem)

(define fib (lambda (n) (
    cond
((equal? n 1) 1)
((equal? n 2) 1)
(else (fib-iter n)))                     
))


(define fib-iter
(lambda (n)
(letrec ((fib-iter-acc
(lambda (n cur prev)
(if (= 2 n) cur
(fib-iter-acc (- n 1)
(+ cur prev) cur)
))))
(fib-iter-acc n 1 1))))

