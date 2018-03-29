no_doubles([], []).
no_doubles([H|T1], [H|T2]) :- delete_all(H, T1, X), no_doubles(X, T2).
