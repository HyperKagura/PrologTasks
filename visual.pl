start :- 
	new(DW, dialog('Syntax parse of english sentence')),
	new(EntrySent, text_item('enter sentence')),
	new(Out, text_item('result')),
	send_list(DW, append, [EntrySent, Out]),
	send(DW, append, button(clear,
		message(@prolog, myclear, EntrySent, Out)
	)),
	send(DW, append, button(proccess,
		message(@prolog, proc, EntrySent?selection, Out)
	)),
	send(DW, open),
	send(EntrySent, open).

myclear(Entry, Out) :- send(Entry, clear),
	send(Out, clear).

:- pce_begin_class(parse_tree, tree).

initialise(T, Tree:prolog) :->
        send(T, send_super, initialise, parse_node(Tree)),
        send(T, direction, list),
        send(T, level_gap, 20),
        send(T, node_handler,
             click_gesture(left, '', single,
                           message(@event?receiver?node, clicked))).

:- pce_end_class.

:- pce_begin_class(parse_node, node).

variable(value,  prolog,  get, "Associated value").

initialise(N, Tree:prolog) :->
        Tree = node(Value, Sons),
        send(N, send_super, initialise, new(text)),
        send(N, value, Value),
        (   Sons == []
        ->  send(N, collapsed, @nil)    % do not show [+] mark
        ;   forall(member(Son, Sons),
                   send(N, son, parse_node(Son)))
        ).

value(N, Value:prolog) :->
        "Set <-value and change label"::
        send(N, slot, value, Value),
        term_to_atom(Value, Label),
        send(N?image, string, Label).

clicked(N) :->
        get(N, value, Value),
        format('User clicked "~p"~n', [Value]).

:- pce_end_class.

proc(Entry, _):- atomic_list_concat(L, ' ', Entry),
	sentence(X, L, []),
	new(P, picture),
	send(P, display, parse_tree(X), point(10, 10)),
	send(P, open), !.

proc(_, Out):- send(Out, selection, 'some word was not found in a dictionary').
