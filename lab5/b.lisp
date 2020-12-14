; replace([l1l2...ln],e,o) = {  [], n=0 
;                               o U replace([l2...ln],e,o), if l1=e 
;                               l1 u replace([l2...ln],e,o), otherwise 

(defun replacare(l e o)
	(cond
		((null l)l)
		((=(car l)e)(cons o (cdr l)))
        (t(cons(car l)(replacare(cdr l)e o)))
)
)

(print(replacare'(1 2 3 4 5)2 5))