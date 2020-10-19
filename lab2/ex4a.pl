belongs(E,[E|_]):-!.
belongs(E,[_|L]):-
    belongs(E,L).

difference([],_,[]).
difference(L,[],L).
difference([H|T],P,Res):-
    \+belongs(H,P),
    difference(T,P,Res1),
    Res=[H|Res1].
difference([H|T],P,Res):-
    belongs(H,P),
    difference(T,P,Res).

