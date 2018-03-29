delete_first(H, [H|T], T).
delete_first(H1, [H2|T1], [H2|T2]) :- H1 \= H2, delete_first(H1, T1, T2).
