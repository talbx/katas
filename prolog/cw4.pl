% persistent-bugger - geschafft!!! :)
trigger(Num,R) :- p(Num,0,R).

p(Num,Akk,Akk) :-
    atom_chars(Num,[H|T]),
    length([H|T],1),
    atom_number(H,R).
p(Num,Akk,R) :-
    atom_chars(Num,Chars),
    ctn(Chars,Nums),
    Akk2 is Akk +1,
    p(Nums,Akk2,R).

ctn([],1).
ctn([H|T],Y) :-
    ctn(T,R1),
    atom_number(H,Res),
    Y is Res * R1.


% digital root
p2(Num,R) :-
    atom_chars(Num,[H|T]),
    length([H|T],1),
    atom_number(H,R), !.
p2(Num,R) :-
    atom_chars(Num,Chars),
    ctn2(Chars,Nums),
    p2(Nums,R).

ctn2([],0).
ctn2([H|T],Y) :-
    ctn2(T,R1),
    atom_number(H,Res),
    Y is Res + R1.


% irreducible sums
x([],0).
x([[N,D]|T], R) :-
    x(T,R1),
    R = N / D + R1.


% max triplet sums
t(L,Sum) :- sort(L,S), reverse(S,[A,B,C|_]), sumlist([A,B,C],Sum).

% odd or even
oe(L,R) :- sumlist(L,Sum), 0 is Sum mod 2 -> R="even"; R="odd".

% count letters /digits
count_letters_and_digits(Input, Result) :- atom_chars(Input,L),
include([X] >> (is_alpha(X); atom_number(X,N), number(N)),L,I), length(I,Result).

% house numbers sum
hns([0|_],0).
hns([H|T],L) :-
    hns(T,L2),
    L is L2 + H, !.

% sqr nums
sqr([],0).
sqr([H|T], R) :-
    sqr(T,R1),
    R is H*H + R1.

% beeramyd
beeramid(Bonus, Price, Levels) :-
    C is Bonus / Price,
    Cans is floor(C),
    run(Cans,1,0,Levels), !.

run(C,Akk,Cans,Akk) :-
    C is Cans + Akk * Akk.

run(C,Akk,Cans,Levels) :-
    Cans2 is Cans + (Akk*Akk), 
    C > Cans2,
    Akk2 is Akk +1,
    run(C,Akk2,Cans2,Levels).

run(C,Akk,Cans,Levels) :-
    Cans2 is Cans + (Akk*Akk), 
    C < Cans2,
    Levels is Akk - 1.
    

% shorts words

sw(String,L) :-
    split_string(String,' ','',List),
    predsort(isLonger, List, Sorted).

isLonger(A,B) :-
    length(A,L1),
    length(B,L2),
    L1 < L2.

% get sum
get_sum(A,A,A).
get_sum(A, B, Result) :-
  A < B,
  findall(R,between(A,B,R),L),
  sumlist(L,Result), !.
get_sum(A, B, Result) :-
  A > B,
  get_sum(B,A,Result), !.

% are they the same
comp(L1,L2,0) :-
  length(L1,Len1),
  length(L2,Len2),
  Len1 \= Len2, !.
  
comp(L1,L2,R) :-
  length(L1,Length),
  length(L2,Length),
  same(L1,L2,R), !.
same(A,A,1).
same([],_,1).
same([H|T],L2, R) :-
    same(T,L2,R),
    Q is H*H,
    memberchk(Q,L2) -> R is 1; R is 0. 