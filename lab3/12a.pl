add_divisors(NR,_,LIST,LIST):-NR=<2.
add_divisors(NR,NR,LIST,LIST).
add_divisors(NR,DIV,LIST,[DIV|R]):-
    NR mod DIV =:=0,!,
    NextDIV is DIV+1,
    add_divisors(NR,NextDIV,LIST,R).
add_divisors(NR,DIV,LIST,R):-
    NextDiv is DIV+1,
    add_divisors(NR,NextDiv,LIST,R).
divisors([],[]).
divisors([H|T],[H|R]):-
    divisors(T,RD),
    add_divisors(H,2,RD,R).

