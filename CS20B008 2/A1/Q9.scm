#lang racket

; Q9

(define get-elements (lambda (f xx l l1) (
    if(null? l)l1
    (
     if(f xx (car l)) (get-elements f xx (cdr l) (append l1 (list (car l))))
       (
          get-elements f xx (cdr l) l1
       )  
    )
)))

(define checkDone (lambda (f x seen) (
    if(null? seen)#f
    (
        if(f x (car seen))#t
        (
            checkDone f x (cdr seen)
        )
    )  
)))

(define helper (lambda (f l seen ans) (
    if(null? l)ans
    (
        if(checkDone f (car l) seen)(helper f (cdr l) seen ans)
        (
            helper f (cdr l) (append seen (list (car l))) (append ans (list (get-elements f (car l) l '())))
        )  
    )  
)))


(define eqGroupify (lambda (ff ll) (
    helper ff ll '() '()
)))