bouncing_ball(H, Bounce, Window, R) :-
    t(H,Bounce,Window,0,R), !.

t(X,_,_,_,-1):-
    X < 0.
t(_,B,_,_,-1):-
    B > 1; B < 0; B=1.0.
t(X,_,X,_,-1).
t(H,_,W,0,-1):-
    H < W.
t(H,_,W,Akk,Akk) :-
    H < W.
t(H,B,W,Akk,R) :-
    H > W,
    Akk1 is Akk + 1,
    b(H,B,W,Akk1,R).

b(H,B,W,Akk,Akk) :-
   X is  H * B,
    X < W.
b(H,B,W,Akk,R) :-
    X is H * B,
    X > W,
    Akk1 is Akk + 1,
    t(X,B,W,Akk1,R).

% no odds
no_odds([],[]).
no_odds([H|T], [H|R]) :- 
  no_odds(T,R),
  0 is H mod 2, !.
no_odds([H|T], R) :- 
  no_odds(T,R),
  not(0 is H mod 2).


solve(X,R) :-
    atom_chars(X,Z),
    permute(Z,R).

permute(XX,XX, Number) :-
    atomic_list_concat(XX,YY),
    atom_number(YY,C),
    0 is Number mod 25, !.
permute(XX, [B|YY], R) :-
    append(AA,[B|CC],XX),  
    append(AA,CC,DD),     
    permute(DD,YY, R).
permute([],[], _).

f(X,Number) :-
    random_permutation(X,Shuffeld),
    atomic_list_concat(Shuffeld,C),
    atom_number(C,Number),
    0 is Number mod 25, !.

f(X,R) :-
    random_permutation(X,Shuffeld),
    atomic_list_concat(Shuffeld,C),
    atom_number(C,Number),
    not(0 is not Number mod 25),
    f(X,R).

% quersumme

q1(X,Y) :-
    atom_chars(X,Z),
    delete(Z,-,Z1),
    p1(Z1,Y).

p1([],0).
p1([H|T], R) :-
    p1(T,R1),
    atom_number(H,H1),
    R is R1 + H1.