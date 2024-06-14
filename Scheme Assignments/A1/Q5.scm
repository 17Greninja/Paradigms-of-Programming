#lang racket

; Q5

(define helper (lambda (ff l) (apply max (map ff l))))

(define helper2 (lambda (x ff l) (
    if(= x (ff (car l))) (car l)
      (helper2 x ff (cdr l))
)))

(define maximum-argument (lambda (ff l)
    
     (let ((x (helper ff l)))
       
        (helper2 x ff l)
        )
))


