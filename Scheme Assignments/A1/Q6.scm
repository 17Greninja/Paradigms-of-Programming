#lang racket

; Q6

(define mix (lambda (l1 l2) (whoami (list l1 l2))))

(define whoami
(lambda (l1)
(apply map list l1))
)

(define unmix (lambda (l) (whoami l)))

