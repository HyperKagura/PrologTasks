path(_, A, A, []).
path(G, A, B, [E1|T]):- next_node(G, A, A1, E1), delete_edge(E1, G, G1), delete_edge(edge(A1, A, _), G1, G2), path(G2, A1, B, T).

is_loose(G1):- to_nonoriented(G1, G),  member_node(A, G), member_node(B, G), A \= B,\+ (path(G, A, B, L), L \= []), !.

is_connected(G):- \+ is_loose(G).

next_node(graph([edge(A, C, N)|_]), A, C, edge(A,C,N)).
next_node(graph([edge(_, _, _)|T]), A, Q, E):- next_node(graph(T), A, Q, E).

to_nonoriented(graph([]), graph([])).
to_nonoriented(graph([edge(A,B,N)|T]), graph([edge(A,B,N), edge(B,A,N) |T2])):- to_nonoriented(graph(T), graph(T2)).

delete_edge(E, graph([E|T]), graph(T)).
delete_edge(E, graph([A|T]), graph([A|T1])):- A \= E, delete_edge(E, graph(T), graph(T1)).

member_node(A, graph([edge(A, _, _)|_])).
member_node(A, graph([edge(_, A, _)|_])).
member_node(A, graph([edge(H1, H2, _)|T])):- member_node(A, graph(T)), A \= H1, A \= H2.

delete_node(_, graph([]), graph([])).
delete_node(A, graph([edge(A, A, _)|T1]), graph(T2)):- delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(A, H1, _)|T1]), graph(T2)):- H1 \= A, delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(H1, A, _)|T1]), graph(T2)):- H1 \= A, delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(H1, H2, N)|T1]), graph([edge(H1, H2, N)|T2])):- H1 \= A, H2 \= A, delete_node(A, graph(T1), graph(T2)).
