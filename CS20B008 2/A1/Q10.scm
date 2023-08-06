#lang racket

; Q10
; depth function taken from internet

(define (depth a)
  (if (pair? a)
      (+ 1 (apply max (map depth a)))
      0))

(define do-list (lambda (x l) (
      if(= x 1)l
      (do-list (- x 1) (list l))
)))

(define get-elements (lambda (l l1) (
      if(null? l)l1
      (
         let 
                 ((x (depth l))) 
                 (
                     if(= x 0)(append l1 (list l))
                     (
                         if(= x 1)(append l1 l)
                         (
                           get-elements (cdr l) (append l1 (get-elements (car l) '()))
                         )  
                     )  
                 ) 
             
      )
)))

(define push-element (lambda (l)
    (
       let((x (depth l))) (do-list x (get-elements l '())))               
    )
)
