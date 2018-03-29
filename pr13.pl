sub_tree(L, L):- L \= nil.
sub_tree(T1, tree(LT, _, _)):- sub_tree(T1, LT).
sub_tree(T1, tree(_, RT, _)):- sub_tree(T1, RT).
