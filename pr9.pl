min_of_list(N, [H|T]) :- min_of_list(N, T, H).
min_of_list(N, [], N).
min_of_list(N, [H|T], H1) :- H1 >= H, min_of_list(N, T, H).
min_of_list(N, [H|T], H1) :- H1 < H, min_of_list(N, T, H1).

sort_my([], []).
sort_my(L1, [H|T]) :- min_of_list(H, L1), delete_first(H, L1, X), sort_my(X, T).
