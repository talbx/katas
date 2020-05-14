%1/n cycle

cycle(N,-1) :-
    0 is 10 mod N; 0 is N mod 10.
cycle(N,X) :-
    T is 1/N,
    atom_chars(T,C),
    append([_,'.'],R,C),
    reverse(R,[H|Rev]),
    reverse(Rev,I),
    find(I,[],X), !.

find([],Akk,L) :- length(Akk,L).
find([H|T],Akk,R) :-
    not(member(H,Akk)),
    append(Akk,[H],Akk2),
    find(T,Akk2,R).
find([H|T],Akk,R) :-
    member(H,Akk),
    find(T,Akk,R).