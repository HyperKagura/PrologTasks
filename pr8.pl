number(H, 0, [H|T]).
number(H, N, [H1|T]) :- number(H, X, T), N is X + 1.
