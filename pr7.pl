starts_with([], L2).
starts_with([H|T1], [H|T2]) :- starts_with(T1, T2).

sublist([], []).
sublist(L1, L1).
sublist(L1, [H|T]) :- sublist(L1, T).
sublist(L1, L2) :- starts_with(L1, L2).
