; operation(operator,x,y) = { a + b, if operator = "+" 
;							  a - b, if operator = "-"
;							  a * b, if operator = "*" 
;							  a \ b, if operator = "\" 
;
( defun operation(operator x y) 
	(cond
		((string= operator "+")(+ x y))
		((string= operator "-")(- x y))
		((string= operator "*")(* x y))	
		((string= operator "/")(floor x y))
)
)

;(print(operation '+ 3 4))

; expression([l1l2...ln]) = { [], n=0 
;							{ operation(l1,l2,l3) U expression([l4...ln]), if l1 is an operator AND
;																	       l2 is a number AND
;																		   l3 is a number
;							  l1 U expression([l2...ln]), otherwise
;

( defun expression(l)
	(cond 
		((null l) nil)
		((and (and (numberp (cadr l)) (numberp (caddr l))) (atom (car l))) (cons (operation (car l) (cadr l) (caddr l)) (expression (cdddr l))))
		(t(cons(car l)(expression(cdr l))))
)
)

; sol([l1l2...ln]) = { l1, if [l2...ln]=0
;					   expression([l1l2...ln]), otherwise
;
;

( defun sol(l)
	(cond
		((null (cdr l))(car l))
		(t(sol(expression l)))
	
)
)

(print(sol'(+ * 2 4 - 5 * 2 2)))