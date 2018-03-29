delete_all(H, [], []).
delete_all(H, [H|T1], L2) :- delete_all(H, T1, L2).
delete_all(H, [H1|T1], [H1|T2]) :- H1 \= H, delete_all(H, T1, T2).
