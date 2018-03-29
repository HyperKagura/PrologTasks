path(_, A, A, []).
path(G, A, B, [E1|T]):- next_node(G, A, A1, E1), delete_edge(E1, G, G1), path(G1, A1, B, T).

cyclic(G):- member_node(A, G), path(G, A, A, L), L \= [].

next_node(graph([edge(A, C, N)|_]), A, C, edge(A,C,N)).
next_node(graph([edge(_, _, _)|T]), A, Q, E):- next_node(graph(T), A, Q, E).

delete_edge(E, graph([E|T]), graph(T)).
delete_edge(E, graph([A|T]), graph(A|T1)):- A \= E, delete_edge(E, graph(T), graph(T1)).

member_node(A, graph([edge(A, _, _)|_])).
member_node(A, graph([edge(_, A, _)|_])).
member_node(A, graph([edge(H1, H2, _)|T])):- member_node(A, graph(T)), A \= H1, A \= H2.

delete_node(_, graph([]), graph([])).
delete_node(A, graph([edge(A, A, _)|T1]), graph(T2)):- delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(A, H1, _)|T1]), graph(T2)):- H1 \= A, delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(H1, A, _)|T1]), graph(T2)):- H1 \= A, delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(H1, H2, N)|T1]), graph([edge(H1, H2, N)|T2])):- H1 \= A, H2 \= A, delete_node(A, graph(T1), graph(T2)).
