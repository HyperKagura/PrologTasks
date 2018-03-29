union1([], L2, L2).
union1([H|T1], L2, [H|T3]):-delete_all(H, L2, X), union1(T1, X, T3).

transposition([],[]).
transposition([H|T], L2):- transposition(T, T1), position(T1, H, L2).

position(L, H, [H|L]).
position([H1|T1], H, [H1|T2]):- position(T1, H, T2).

union(L1, L2, L3):- union1(L1, L2, X), transposition(X, L3).
