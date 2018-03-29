pathes(_, B, [[edge(N1,B,W)|T]|_], [edge(N1, B, W)|T]).
pathes(G, B, [[edge(A,C,N)|T]|Other], Way):- A \= B, C \= B,
   findall(Some_way, prolong_way(G, C, [edge(A,C,N)|T], Some_way), WaysList),
   append(Other, WaysList, NewWays),
   pathes(G, B, NewWays, Way).

short_path(_, A, A, []).
short_path(G, A, B, L):- A \= B, findall(Way, prolong_way(G, A, [], Way), WaysList), pathes(G, B, WaysList, L).

prolong_way(G, B, L, [E|L]):- delete_nodes(L, G, G1), next_node(G1, B, _, E).

next_node(graph([edge(A, C, N)|_]), A, C, edge(A,C,N)).
next_node(graph([edge(_, _, _)|T]), A, Q, E):- next_node(graph(T), A, Q, E).

member_node(A, graph([edge(A, _, _)|_])).
member_node(A, graph([edge(_, A, _)|_])).
member_node(A, graph([edge(H1, H2, _)|T])):- H1 \= A, H2 \= A, member_node(A, graph(T)).

delete_nodes([], G, G).
delete_nodes([edge(A,_,_)|T], G, GRes):- delete_node(A, G, G1), delete_nodes(T, G1, GRes).

delete_node(_, graph([]), graph([])).
delete_node(A, graph([edge(A, A, _)|T1]), graph(T2)):- delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(A, H1, _)|T1]), graph(T2)):- H1 \= A, delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(H1, A, _)|T1]), graph(T2)):- H1 \= A, delete_node(A, graph(T1), graph(T2)).
delete_node(A, graph([edge(H1, H2, N)|T1]), graph([edge(H1, H2, N)|T2])):- H1 \= A, H2 \= A, delete_node(A, graph(T1), graph(T2)).
