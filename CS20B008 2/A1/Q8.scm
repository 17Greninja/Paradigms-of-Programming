#lang racket

; Q8

(define setty-list-union (lambda (l1 l2) (make-setty-list (append l1 l2))))

(define isPresent (lambda (x l) (
    if(null? l)#f
    (
        if(= x (car l))#t
        (isPresent x (cdr l))
    )  
)))

(define remove-first (lambda (r front back) (
    if(null? back)front
    (
        if(= r (car back))(append front (cdr back))
        (
            remove-first r (append front (list (car back))) (cdr back)
        )  
    )  
)))

(define helper2 (lambda (l lr) (
    if(null? lr)l
    (
         helper2 (remove-first (car lr) '() l) (cdr lr)
    )  
)))

(define unique (lambda (l1 l2) (
    if(null? l1)l2
    (
        if(isPresent (car l1) l2)(unique (cdr l1) l2)
        (unique (cdr l1) (append l2 (list (car l1))))  
    )
)))

(define setty-list-minus (lambda (l1 l2) (
    helper2 l1 (unique l2 '())
)))

(define helper (lambda (l cur prev ans) (
    if(null? l)(
       if(= cur prev)ans
       (append ans (list cur))
    )
    (
        if(= cur prev)(helper (cdr l) (car l) cur ans)
        (
             helper (cdr l) (car l) cur (append ans (list cur))
        )  
    )  
                
)))

(define make-setty-list (lambda (l) (
    if(null? l)l
    (
        if(null? (cdr l))l
        (helper (cddr l) (cadr l) (car l) (list (car l)))
    )
)))