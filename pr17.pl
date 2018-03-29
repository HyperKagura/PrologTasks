path(_, A, A, 0, []).
path(G, A, B, N, [E1|T]):- A \= B, next_node(G, A, A1, E1), E1 = edge(_,_,N1), delete_node(A, G, G1), path(G1, A1, B, N2, T), N is N1 + N2.

min_path(G, A, B, N, L):- path(G, A, B, N, L), \+ (path(G, A, B, N1, _), N1 < N).

next_node(graph([edge(A, C, N)|_]), A, C, edge(A,C,N)).
next_node(graph([edge(_, _, _)|T]), A, Q, E):- next_node(graph(T), A, Q, E).

member_node(A, graph([edge(A, _, _)|_])).
member_node(A, graph([edge(_, A, _)|_])).
member_node(A, graph([edge(H1, H2, _)|T])):- H1 \= A, H2 \= A, member_node(A, graph(T)).

delete_node(_, graph([]), graph([])).
delete_node(A, graph([edge(A, A, _)|T1]), graph(T2)):- delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(A, H1, _)|T1]), graph(T2)):- H1 \= A, delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(H1, A, _)|T1]), graph(T2)):- H1 \= A, delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(H1, H2, N)|T1]), graph([edge(H1, H2, N)|T2])):- H1 \= A, H2 \= A, delete_node(A, graph(T1), graph(T2)).
