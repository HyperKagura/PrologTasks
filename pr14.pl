flatten_tree(T, L):- flatten_tree_dl(T, dl(L, [])).

flatten_tree_dl(tree(nil, nil, H), dl([H|X], X)).
flatten_tree_dl(tree(LT, RT, H), dl(L, L1)):- flatten_tree_dl(LT, dl(X,X1)), flatten_tree_dl(RT, dl(Y,Y1)), append_dl(dl(X,X1), dl([H|Y], Y1), dl(L, L1)).

append_dl(dl(A,B),dl(B,C),dl(A,C)).
