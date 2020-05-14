hm(Min,Max,R) :-
    findall(X,between(Min,Max,X), R),
    calc1(R,[]).

calc1([H|T],Akk) :-
    findall(X,between(1,H,X),L),
    test(H,L,Akk).

test(Fortune,[Each|T],Akk) :-
    fb(Fortune,Each),
    Akk2 is [["M: Fortune", B:]].

fb(Fortune,Each,["M: Fortune, B:]) :-  
    (2 is (Fortune-7)*Each),
    (1 is (Fortune-9)*Each).