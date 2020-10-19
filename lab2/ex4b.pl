% addOne(L- list, E- element to add after an even number, Res- list)
% flow model: (i,i,o)
% MATHEMATICAL MODEL:
% addOne(l1l2..ln,e)= { [], if n is 0
%                       addOne(l2...ln,e), if l1%2!=0
%                       l1 U addOne(l2...ln,e), otherwise  }
addOne([],_,[]):-!.
addOne([H|T],E,[H,E|R]):-
    H mod 2 =:= 0,
    !,
    addOne(T,E,R).
addOne([H|T],E,[H|R]):-
    addOne(T,E,R).










