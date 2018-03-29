path(_, A, A, []).
path(G, A, B, [E1|T]):- A \= B, next_node(G, A, N1, E1), delete_node(A, G, G1), path(G1, N1, B, T).

next_node(graph([edge(A, C, N)|_]), A, C, edge(A,C,N)).
next_node(graph([edge(_, _, _)|T]), A, Q, E):- next_node(graph(T), A, Q, E).

delete_node(_, graph([]), graph([])).
delete_node(A, graph([edge(A, A, _)|T1]), graph(T2)):- delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(A, H1, _)|T1]), graph(T2)):- H1 \= A, delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(H1, A, _)|T1]), graph(T2)):- H1 \= A, delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(H1, H2, N)|T1]), graph([edge(H1, H2, N)|T2])):- H1 \= A, H2 \= A, delete_node(A, graph(T1), graph(T2)).
