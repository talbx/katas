cht(N,R) :-
    findall(X,between(1,N,X),L),
    try(L,[],R).

try([],Akk,Akk).
try([H|T],Akk1,R) :-
    try2(H,[H|T],R),
    try(T,R,R2).
    
try2(_,[],[]).
try2(A,[H|T],[(A,H)|R2]) :-
    try2(A,T,R2),
    Y is A * H,
    delete(A,[H|T],Rest),
    sumlist(Rest,Y).

try2(A,[H|T],R) :-
    try2(A,T,R2).