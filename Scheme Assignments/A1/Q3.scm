#lang racket

; Q3

(define helper (lambda (i m g mylist) (
     if(> i m)mylist
     (
        begin
        (helper (+ i g) m g (append mylist (list i)))
     )
)))

(define iteration-space (lambda (l) (helper (car l) (car (cdr l)) (car (cdr (cdr l))) '())))

(define myListQ3 0)

(define make-iterator (lambda (l) (
     
     let ((x (set! myListQ3 (iteration-space l))) )
     0
)))

(define hasNext (lambda (itr) (
   if(null? myListQ3)#f
   #t
)))

(define next (lambda (itr) (
   if(null? myListQ3)'()
     (let ((x (car myListQ3)) (y (set! myListQ3 (cdr myListQ3))))
     x)
)))


