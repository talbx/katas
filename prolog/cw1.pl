% sums of parts -> failed wegen Laufzeit
% [1,2,3] = [1,2,3], [2,3], [3], []
%            6          5    3
p3([],[0]).
p3([H|T],[Y,RH|RT]) :-
    p3(T,[RH|RT]),
    Y is H + RH.

maxis(Array,K,Res) :- 
    msort(Array,Sorted), 
    reverse(Sorted,Reversed),
    get(Reversed,K,0,Res).

get([H|T],K,Akk,Res) :-
    Akk < K,
    Res is H *
    Res is H * Res2.



%backwards primes
bp(Start,End,Res) :- go(Start,End,[]).

go(End,End,[End|_]) :-
    isPrime(End).
go(End,End,_).
go(Start,End,Res) :-
    Start < End,
    isPrime(Start),
    X is Start +1,
    go(X, End, [Start|Res]).
go(Start,End,Res) :-
    Start < End,
    X is Start +1,
    go(X, End, Res).



divisible(X,Y) :- 0 is X mod Y, !.
divisible(X,Y) :- X > Y+1, divisible(X, Y+1).

isPrime(2) :- true,!.
isPrime(X) :- X < 2,!,false.
isPrime(X) :- not(divisible(X, 2)).

% Is my friend cheating? -> failed wegen laufzeit
remove_nb(Num,X1) :- findall(N, between(1, Num, N), L), findall(O,isIn(L,O),X), append(X,X1).

isIn(L,[[A,B],[B,A]]) :-
    member(A,L),
    member(B,L),
    sumlist(L,Sum),
    A * B =:= Sum - A - B, !.

number_of_occurrences(H,[],0).
number_of_occurrences(H, [H|T], Occurrences) :-
    number_of_occurrences(H,T,N), !,
    Occurrences is N + 1.
number_of_occurrences(E, [H|T], Occurrences) :-
    number_of_occurrences(E,T,Occurrences).


% Growth of a Population - fails
nb_year(S,P,C,E,Y) :- 
    P2 is (P / 100),
    g(S,P2,C,E,0,Y), !.

g(End,_,_,End,Akk,A2) :-
    A2 is Akk +1.
g(Start,Percentage,CL,End,Akk,Years) :- 
    Start < End,
    T is integer(Start + (Start * Percentage) + CL),
    Akk2 is Akk + 1,
    g(T,Percentage,CL,End,Akk2,Years).
g(Start,_,_,End,Akk,Akk) :-
    Start > End.


op("NORTH","SOUTH").
op("SOUTH","NORTH").
op("EAST","WEST").
op("WEST","EAST").


dir_red(L,X) :- dr(L,[],X).
dr([A,B|T],Akk,X) :-
    op(A,B),
    dir(T,Akk,X).
dr([A,B|T],Akk,X) :-
    not(op(A,B)),
    dir([A|T],X).
