#lang racket

; Q2

(define helper (lambda (i m g mylist) (
     if(> i m)mylist
     (
        begin
        (helper (+ i g) m g (append mylist (list i)))
     )
)))

(define iteration-space (lambda (l) (helper (car l) (car (cdr l)) (car (cdr (cdr l))) '())))

(define for-loop (lambda (f l) (map f (iteration-space l))))