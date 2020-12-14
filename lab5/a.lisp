; product ([l1l2....ln]) = { 1, if the list is empty  
;                            l1 * product([l2...ln]), if l1 is a numeric atom
;                            product([l2...ln]), otherwise

(defun product(l)
	(cond
		((null l)1)
		((numberp(car l))(*(car l)(product(cdr l))))
		(t(product(cdr l)))
)
)

(print(product'(1(2 3)4))) 