substitute(nil, _, _, nil).
substitute(tree(LT1, RT1, V), V, T, tree(LT2, RT2, T)):- substitute(LT1, V, T, LT2), substitute(RT1, V, T, RT2).
substitute(tree(LT1,RT1, H), V, T, tree(LT2, RT2, H)):- V \= H, substitute(LT1, V, T, LT2), substitute(RT1, V, T, RT2).
