#lang racket
(require "recscm.scm")
(require "records.scm")
(require "tree.scm")
(require rnrs/mutable-pairs-6)
;A partial implementation of the interpreter discussed in the class
;Covers identifier, true/false, plusExpr and IfExpr

(define make-cell
(lambda (value)
(cons '*cell value)))
(define deref-cell cdr)
(define set-cell! set-cdr!)


(define extend-env
(lambda (id value env)
(cons (list (Identifier->Token id)
(make-cell value))
env)))

(define empty-env (lambda () '()))
;(define extend-env (lambda (id val env) (cons (cons id val) env)))
(define apply-env (lambda (env id)
                    (if (or (null? env) (null? id))
                        null
                        (let ((key (caar env))
                              (val (cdar env))
                              (env-prime (cdr env)))
                          (if (eq? id key) val (apply-env env-prime id))))))
;(define extend-env-list (lambda (ids vals env)
;                          (if (null? ids)
 ;                             env
  ;                            (extend-env-list
   ;                            (cdr ids)
    ;                           (cdr vals)
     ;                          (extend-env (car ids) (car vals) env)))))

(define getIds (lambda (l l1) (
    if(null? l)l1
    (getIds (cdr l) (cons (caar l) l1))
                               )))
(define get-ids (lambda (l) (getIds l '())))

(define getExp (lambda (l l1) (
    if(null? l)l1
    (getExp (cdr l) (cons (cadar l) l1))  
                               )))
(define get-exprs (lambda (l) (getExp l '())))

(define get-formals (lambda (l) (car l)))
(define get-closure-env (lambda (l) (cadr l)))
(define get-body (lambda (l) (caddr l)))
(define make-closure (lambda (listids exp env) (cons listids (cons env (list exp)))))

(define-record empty-env ())
(define-record normal-env (ids vals env))
(define-record rec-env (recdecl-list env))

(define extend-env-list (lambda (ids vals env)
                          (make-normal-env
                           (map cadr ids)
                           (map (lambda (value) (make-cell value))
                                vals)
                           env)))

(define eval-Expression
	(lambda (Expression env) 
		(record-case Expression
                (IntegerLiteral (Token) "Int") 
		(TrueLiteral (Token) "bool")
		(FalseLiteral (Token) "bool")
		(PlusExpression (Token1 Token2 Expression1 Expression2 Token3) (
                         let ((v1 (equal? "Int" (eval-Expression Expression1 env))) (v2 (equal? "Int" (eval-Expression Expression2 env))))
                          (if(and v1 v2)"Int"
                             (display "Type Error"))
                 ))
		(IfExpression (Token1 Token2 Expression1 Expression2 Expression3 Token3)
                        (let ((v2 (eval-Expression Expression2 env)) (v3 (eval-Expression Expression3 env)) (v1 (eval-Expression Expression1 env)))
                          (
                           if(and (equal? v2 v3) (equal? v1 "bool"))v2
                             (display "Type Error")
                             )))
                (LetExpression (Token1 Token2 Token3 List Token4 Expression Token5)
                               (let* ((ids (get-ids List))
                                      (exps (get-exprs List))
                                      (vals (map (lambda (Expression)
                                                   (eval-Expression Expression env))
                                                 exps))
                                      (new-env (extend-env-list ids vals env)))
                                 (eval-Expression Expression new-env)))
                (Assignment (Token1 Token2 Identifier Expression Token3)
                            (set-cell!
                             (apply-env env
                                        (Identifier->Token Identifier))
                             (eval-Expression Expression env)))
                (Application (Token1 Expression List Token2)
                             (let*
                                 ((clos (eval-Expression Expression env))
                                  (ids (get-formals clos))
                                  (vals (map (lambda (Exp) (eval-Expression Exp env)) List))
                                  (static-env (get-closure-env clos))
                                  (new-env (extend-env-list ids vals static-env))
                                  (body (get-body clos)))
                               (begin(eval-Expression body new-env)(display "Int->Int->Int"))))
                (ProcedureExp (Token1 Token2 Token3 List Token4 Expression Token5)
                              (begin(make-closure List Expression env)
                                    (display "Int->Int")))
                (RecExpression (Token1 Token2 Token3 List Token4 Expression Token5)
                               (eval-Expression Expression (make-rec-env List env)))
		(else (display "")))))
(define run
(lambda ()
	(record-case root
		(Goal (Expression Token)
		  (if(equal? (eval-Expression Expression (empty-env)) "Int")(display "Int")
                     (if(equal? (eval-Expression Expression (empty-env)) "bool")(display "Bool")
                        (display "")
                     )))
		 (else (error 'run "Goal not found")))))
(run)

