#lang racket

; Q1

(define helper (lambda (i m g mylist) (
     if(> i m)mylist
     (
        begin
        (helper (+ i g) m g (append mylist (list i)))
     )
)))

(define iteration-space (lambda (l) (helper (car l) (car (cdr l)) (car (cdr (cdr l))) '())))
