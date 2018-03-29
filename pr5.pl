delete_one(H, [H|T1], T1).
delete_one(H, [H1|T1], [H1|T2]) :- delete_one(H, T1, T2).
