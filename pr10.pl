transposition([], []).
transposition([H|T], L):- transposition(T, T1), position(T1, H, L).

position(L, X, [X|L]).
position([H|T1], X, [H|T2]):-position(T1, X, T2).

subset1([], []).
subset1([H1|T1], [H1|T2]):- subset1(T1, T2).
subset1(L, [_|T]):- subset1(L, T).

subset(L1, L2):- subset1(T1, L2), transposition(T1, L1).
