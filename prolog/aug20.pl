% triangular

is_triangular(N,1) :- 
    sqrt(8 * N+1,X),
    not(float(X)),
    0 is (X-1) mod 2, !.
is_triangular(_,0).

% funny add

add(A,B,R) :-
    number_chars(A,A1),
    number_chars(B,B2),
    reverse(A1,R1),
    reverse(B2,R2),
    run(R1,R2,R3),
    reverse(R3,R4),
    atomic_list_concat(R4,Num),
    atom_number(Num,R), !.
    
run([],[],[]).
run([X],[],[X]).
run([],[X],[X]).
run([A],[B],[R]) :- 
    atom_number(A,A1),
    atom_number(B,B2),
    R is A1 + B2.

run([H1|T1],[H2|T2],[Res|R1]) :-
    run(T1,T2,R1),
    atom_number(H1,A1),
    atom_number(H2,B2),
    Res is A1 + B2.

chk(A,B,R) :-
    (A @>= B, R is A-B);
    (B @>= B, R is B-A).

mhd([A1,A2],[B1,B2],R) :-
    chk(A1,B1,R1),
    chk(A2,B2,R2),
    R is R1 + R2.


pin(Hash,Pin) :-
random(0,10,A1)