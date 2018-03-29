tree_depth(nil, 0).
tree_depth(tree(LT, RT, _), N):- tree_depth(LT, X), tree_depth(RT, Y), X >= Y, N is X+1.
tree_depth(tree(LT, RT, _), N):- tree_depth(LT, X), tree_depth(RT, Y), X < Y, N is Y+1.
