/* Mathematical model:
 *  add_divisors([l1...ln],div,list)= list, if n<=2 or n=div
 *                                  div U
 *                                  add_divisors([l2...ln],div+1,list),
 *                                  if n%div=0
 *                                  add_divisors([l2...ln],div+1,list),
 *                                  otherwise
 *                                  add_divisors(NR:number,DIV:number,LIST:list,R:list)
 *flow model: (i,i,i,o) */

add_divisors(NR,_,LIST,LIST):-NR=<2.
add_divisors(NR,NR,LIST,LIST):-!.
add_divisors(NR,DIV,LIST,[DIV|R]):-
    NR mod DIV =:=0,!,
    NextDIV is DIV+1,
    add_divisors(NR,NextDIV,LIST,R).
add_divisors(NR,DIV,LIST,R):-
    NextDiv is DIV+1,
    add_divisors(NR,NextDiv,LIST,R).

/*
 * divisors([l1...ln])= [],n=0
 *                    add_divisors(l1,2) U divisors(l2...ln), otherwise
 * divisors(L:list,R:list)
 * flow model: (i,o)
 */

divisors([],[]).
divisors([H|T],[H|R]):-
    divisors(T,Res),
    add_divisors(H,2,Res,R).


/*
 * heterogeneousList([l1...ln]) = [], n=0
 *                                divisors(l1) U
 *                                heterogeneousList([l2...ln]),
 *                                          if is_list(l1)=True
 *                                l1 U heterogeneousList([l2...ln])
 *                                               otherwise
 *
 *
 *
 * heterogeneousList(L:list,R:list)
 * flow model: (i,o)
 */
heterogeneousList([],[]).
heterogeneousList([H|T],[HR|R]):-is_list(H),!,
    divisors(H,HR),
    heterogeneousList(T,R).
heterogeneousList([H|T],[H|R]):-
    heterogeneousList(T,R).








