; counter([l1l2...ln],e) = { [], 0 
;                            1 + counter([l2...ln],e), if l1 = e 
;                            counter([l2...ln],e), otherwise } 
;

( defun counter(l e) 
(cond
	((null l)0)
	((equal(car l)e)(+ (counter(cdr l) e) 1))
	(t(counter(cdr l) e))	
)
)
; (print(counter'(1 2 3 2 2) 2))

;
; remove_el([l1l2...ln],e) = { [], n=0 
;                              remove_el([l2...ln],e), l1=e
;                              l1 U [l2...ln], otherwise  }

( defun remove_el(l e)
(cond 
	((null l)nil)
	((equal(car l)e)(remove_el(cdr l) e))
	(t(cons (car l) (remove_el(cdr l) e)))
)
)
;(print(remove_el'(1 2 3 2 2) 2))

; sol([l1l2...ln])= { [], n=0 
;                     list(l1 counter(l,l1)) U sol(remove_el(l,l1)), otherwise } 
;

( defun sol(l)
( cond 
	((null l)nil)
	(t(cons (list (car l) (counter l (car l))) (sol (remove_el l (car l))))) 
)
)

(print(sol'(A B A B A C A)))