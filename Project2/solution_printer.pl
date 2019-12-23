print_solution(Board_Size, Vars, Row_Restrictions, Column_Restrictions) :-
    clear_screen,
    print_column_restrictions(Column_Restrictions), nl,
    print_first_line_seperator(Board_Size), nl,
    print_puzzle(Board_Size, Vars).

print_puzzle(_Board_Size, []).
print_puzzle(Board_Size, [Shaded_Col1, Shaded_Col2 |RowsRest]) :-
    print_row(Board_Size, Shaded_Col1, Shaded_Col2),
    print_puzzle(Board_Size, RowsRest).

print_row(Board_Size, Shaded_Col1, Shaded_Col2) :-
    print_console_line(Board_Size, Shaded_Col1, Shaded_Col2), nl,
    print_console_line(Board_Size, Shaded_Col1, Shaded_Col2), nl,
    print_line_seperator(Board_Size), nl.

print_console_line(Board_Size, Shaded_Col1, Shaded_Col2) :-
    print_console_line(1, Board_Size, Shaded_Col1, Shaded_Col2).

print_console_line(Num_Col, Board_Size, _Shaded_Col1, _Shaded_Col2) :-
    Num_Col > Board_Size.

print_console_line(Shaded_Col1, Board_Size, Shaded_Col1, Shaded_Col2) :-
    check_first_col(Shaded_Col1),
    print_shaded_square,
    print_col_seperator,
    New_Col is Shaded_Col1 + 1,
    print_console_line(New_Col, Board_Size, Shaded_Col1, Shaded_Col2).

print_console_line(Shaded_Col2, Board_Size, Shaded_Col1, Shaded_Col2) :-
    check_first_col(Shaded_Col2),
    print_shaded_square,
    print_col_seperator,
    New_Col is Shaded_Col2 + 1,
    print_console_line(New_Col, Board_Size, Shaded_Col1, Shaded_Col2).

print_console_line(Num_Col, Board_Size, Shaded_Col1, Shaded_Col2) :-
    check_first_col(Num_Col),
    print_white_square,
    print_col_seperator,
    New_Col is Num_Col + 1,
    print_console_line(New_Col, Board_Size, Shaded_Col1, Shaded_Col2).

check_first_col(Num_Col) :-
    Num_Col == 1,
    write('|').

check_first_col(_Num_Col).

print_shaded_square :- write(' XXX ').
print_white_square :- write('     ').

print_first_line_seperator(Board_Size) :-
    Num_Seperators is (Board_Size * 6),
    write(' '),
    print_first_line_seperator(Num_Seperators, 1).

print_first_line_seperator(Counter, Counter).

print_first_line_seperator(Num_Seperators, Counter) :-
    write('_'),
    Counter1 is Counter + 1,
    print_first_line_seperator(Num_Seperators, Counter1).

print_line_seperator(Board_Size) :-
    Num_Seperators is (Board_Size * 6),
    print_line_seperator(Num_Seperators, 0).

print_line_seperator(Num_Seperators, Counter) :-
    Counter > Num_Seperators.
print_line_seperator(Num_Seperators, Counter) :-
    0 is mod(Counter, 6),
    write('|'),
    Counter1 is Counter + 1,
    print_line_seperator(Num_Seperators, Counter1).

print_line_seperator(Num_Seperators, Counter) :-
    write('_'),
    Counter1 is Counter + 1,
    print_line_seperator(Num_Seperators, Counter1).
    
print_col_seperator :- write('|').

print_column_restrictions(Column_Restrictions) :-
    sort(Column_Restrictions, Sorted_Column_Restrictions),
    print_column_restrictions(Sorted_Column_Restrictions, 1).

print_column_restrictions([], _Col_Counter).
print_column_restrictions([Num_Col-Distance|More], Col_Counter) :-
    print_col_rest(Num_Col, Distance, Col_Counter),
    New_Col_Counter is Num_Col + 1,
    print_column_restrictions(More, New_Col_Counter).

print_col_rest(Num_Col, Distance, Num_Col) :-
    print('   '),
    print(Distance),
    print('  ').

print_col_rest(Num_Col, Distance, Col_Counter) :-
    write('      '),
    Col_Counter1 is Col_Counter + 1,
    print_col_rest(Num_Col, Distance, Col_Counter1).

