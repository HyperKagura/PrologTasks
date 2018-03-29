reverse_my(L1, L2) :- reverse_my(L1, L2, []).
reverse_my([], L1, L1).
reverse_my([H1|T1], L1, L2) :- reverse_my(T1, L1, [H1|L2]).
