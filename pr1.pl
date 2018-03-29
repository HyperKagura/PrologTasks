append_my([], L2, L2).
append_my([H|T1], L2, [H|T2]) :- append_my(T1, L2, T2).
