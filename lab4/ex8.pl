% . Generate all strings of n parenthesis correctly closed.
% Eg: n=4 => (()) and () ()

paranteza('(').
paranteza(')').

% verify([l1,l2,...,ln],d) = verify([l2,...,ln],d+1), if l1='('
%                            verify([l2,...,ln],d-1), if d>0, and l1=')'
%verify (L: list, D: number)
%flow model: (i,i)
%this predicate verifies if the solution given is correct
%if in the end predicate doesn't have an empty list and
%the number=0, then the solution given is not correct

verify([],0).
verify([H|T],D):-
    H=='(',
    DD is D+1,
    verify(T,DD).
verify([H|T],D):-
    H==')',
    D>0,
    DD is D-1,
    verify(T,DD).

%allcombinations(N,I,[l1,...,ln])= [l1,...,ln], if N=I
%                                  allcombinations(N,I+1,paranteza(x)U[l1
%                                  ,...,ln]), if I<N
% allcombinations(N:number,I:number,D:list,R:list)
% this predicate generates all the combinations of parantheses
% flow model: (i,i,i,o)
%! predicate is used for preventing the backtracking
% the predicate stops when I is equal to N and R is given the list D
% formed with the paranthesis and the rest of the list
allcombinations(N,N,D,D):-!.
allcombinations(N,I,D,R):-
    paranteza(X),
    NI is I+1,
    allcombinations(N,NI,[X|D],R).

%onesol(N:number, R:list)
%flow model: (i,o)
%this predicate generates one solution and verifies it
%onesol(N)=R, where R=allcombinations(N,0,[]) and verify(R,0)
onesol(N,R):-
    allcombinations(N,0,[],R),
    verify(R,0).

% allsol(N:number, R:list)
% flow model: (i,o)
% findall: collects in a list all the solutions found
% findall arguments:
% arg1: RP, partial result, that must satisfy oneSol
% arg2: the predicate to be solved, onesol(N,RP)
% arg3: the list in which the solutions are collected
% the built in predicate findAll is used to collect a list of all
% the items that satisfy some goal
% allsol(N)= U onesol(N)
allsol(N,R):-
    findall(RP,onesol(N,RP),R).







