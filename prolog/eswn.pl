op("NORTH","SOUTH").
op("SOUTH","NORTH").
op("EAST","WEST").
op("WEST","EAST").

dir_reduc(L,R5) :- q(L,R), q(R,R2),q(R2,R3),q(R3,R4),q(R4,R5), !.
q([],[]).
q([H1],[H1]).
q([H1,H2|T],R2) :-
    q(T,R2),
    op(H1,H2).
q([H1,H2|T],[H1|R2]) :-
    q([H2|T],R2),
    op(H1,Op),
    H2 \= Op.



% best practice:
dir_reduc(L, R) :-
  (
  append(LH, ["NORTH", "SOUTH"|RH], L);
  append(LH, ["SOUTH", "NORTH"|RH], L);
  append(LH, ["EAST", "WEST"|RH], L);
  append(LH, ["WEST", "EAST"|RH], L))
  ,
  append(LH, RH, LL),
  dir_reduc(LL, R), !.
  
dir_reduc(L, L).