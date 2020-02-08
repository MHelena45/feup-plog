
get_vars(Board_Size, Board_Size, []).
get_vars(Board_Size, Row_Counter, [H|T]) :-
    length(H, Board_Size),
    domain(H, 0, 1),
    Row_Counter1 is Row_Counter + 1,
    get_vars(Board_Size, Row_Counter1, T).

append_vars([], Acc, Acc).
append_vars([H|T], Acc, Final_Vars) :-
    append(Acc, H, Acc1),
    append_vars(T, Acc1, Final_Vars).

show_board([]).
show_board([Row|Rest]) :-
    show_row(Row), 
    nl,
    show_board(Rest).

show_row([]).
show_row([Col|Rest]) :-
    write(Col), write(' '),
    show_row(Rest).