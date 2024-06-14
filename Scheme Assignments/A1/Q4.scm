#lang racket

; Q4

(define create-symbol-table (lambda (l) (append l '())))

(define lookup (lambda (myST x) (
   if(null? myST)'()
   (
       if(eq? x (car (car myST)))(car (cdr (car myST)))
       (
           lookup (cdr myST) x
       )
   )     
)))

(define extend-symbol-table (lambda (l1 l) (append l l1)))
