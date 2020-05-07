op("NORTH","SOUTH").
op("SOUTH","NORTH").
op("EAST","WEST").
op("WEST","EAST").

rm1(_, [], []).
rm1(Term, [Term|Tail], Tail).
rm1(Term, [Head|Tail], [Head|Result]) :-
  rm1(Term, Tail, Result).

%dir_reduc(["NORTH","WEST","SOUTH","EAST"],["NORTH","WEST","SOUTH","EAST"]).
dir_reduc([H|T],R) :-
    op(H,Op),
    memberchk(Op,T),
    rm1(H,[H|T],R1),
    rm1(Op,R1,R2),
    dir_reduc(R2,R), !.
dir_reduc([H|T],R) :-
    op(H,Op),
    not(memberchk(Op,T)),
    dir_reduc(R2,R), !.
dir_reduc(L,L).

find_it(L,Num) :- occ(L,Num).

occ([H|T],H) :-
    delete([H|T],H,R), 
    ord_symdiff([H|T],R,X),
    length(X,Length),
    not(0 is Length mod 2).
occ([_|T],X) :-
    occ(T,X).

jo(N,K,R) :-
    num2list(N,L),
    run(L,K,0,R).

run([X],_,_,X).
run(L,K,Akk,R) :-
    Akk < K,
    Akk2 is Akk + 1,
    run(L,K,Akk2,R).
run(L,K,K,R) :-
    K2 is K-1,
    nth0(K2,L,E),
    delete(L,E,L2),
    run(L2,K,0,R).

num2list(N, List) :-
    num2list(1, N, List), !.

num2list(N, N, [N]).
num2list(N0, N, [N0| List]) :-
    N0 < N,
    N1 is N0 + 1,
    num2list(N1, N, List).



odds(L,X) :-
    odd(L,0,X), !.
odd(L,Akk,Akk) :-
    count(L,Akk,C),
    1 is C mod 2.
odd(L,Akk,X) :-
    Akk2 is Akk +1,
    odd(L,Akk2,X).

count(L, E, N) :-
    include(=(E), L, L2), length(L2, N), !.


% square evey digit --> laufzeit

s(I,O) :-
    atom_chars(I,C),
    g(C,R),
    atomic_list_concat(R,L),
    atom_number(L,O).

g([],[]).
g([H|T],[Y|X2]) :-
    g(T,X2),
    atom_number(H,Num),
    Y is Num * Num.



% alphabetical addition
a(a,1).
a(b,2).
a(c,3).
a(d,4).
a(e,5).
a(f,6).
a(g,7).
a(h,8).
a(i,9).
a(j,10).
a(k,11).
a(l,12).
a(m,13).
a(n,14).
a(o,15).
a(p,16).
a(q,17).
a(r,18).
a(s,19).
a(t,20).
a(u,21).
a(v,22).
a(w,23).
a(x,24).
a(y,25).
a(z,26).

add_letters([X],X).
add_letters([],z).
add_letters(L,R) :- add(L,X), sumlist(X,I), T is I mod 26, a(R,T), !.
add([X],[Y]) :- a(X,Y).
add([H|T],[O|R1]) :-
    add(T,R1),
    a(H,O).


% multiples of 3,5
solution(X,R) :-
  findall(Num,between(1,X,Num),L), include([X]>>(0 is X mod 3; 0 is X mod 5),L,R2),
  sumlist(R2,R).