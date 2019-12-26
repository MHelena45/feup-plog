print_solution(Board_Size, Vars, Row_Restrictions, Column_Restrictions) :-
    clear_screen,
    sort_restrictions(Row_Restrictions, Column_Restrictions, Sorted_Row_Restrictions, Sorted_Column_Restrictions),
    print_column_restrictions(Sorted_Column_Restrictions), nl,
    print_first_line_seperator(Board_Size), nl,
    print_puzzle(Board_Size, Sorted_Row_Restrictions, Vars).

print_puzzle(Board_Size, Row_Restrictions, Vars) :-
    print_puzzle(Board_Size, Row_Restrictions, Vars, 1).

print_puzzle(_Board_Size, _Row_Restrictions, [], _Row_Counter).

print_puzzle(Board_Size, Row_Restrictions, [Shaded_Col1, Shaded_Col2 |Rows_Rest], Row_Counter) :-
    print_row(Row_Counter, Board_Size, Shaded_Col1, Shaded_Col2, Row_Restrictions, New_Restrictions),
    New_Row_Counter is Row_Counter + 1,
    print_puzzle(Board_Size, New_Restrictions, Rows_Rest, New_Row_Counter).

print_row(Row_Counter, Board_Size, Shaded_Col1, Shaded_Col2, Row_Restrictions, New_Restrictions) :-
    write('   '), print_console_line(Board_Size, Shaded_Col1, Shaded_Col2), nl,
    print_row_restriction(Row_Counter, Row_Restrictions, New_Restrictions),
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
    write('    '),
    print_first_line_seperator(Num_Seperators, 1).

print_first_line_seperator(Counter, Counter).

print_first_line_seperator(Num_Seperators, Counter) :-
    write('_'),
    Counter1 is Counter + 1,
    print_first_line_seperator(Num_Seperators, Counter1).

print_line_seperator(Board_Size) :-
    Num_Seperators is (Board_Size * 6),
    write('   '),
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

print_row_restriction(Num_Row, [Num_Row-Distance|Rest], Rest) :-
    write(' '),
    write(Distance),
    write(' ').

print_row_restriction(_Col_Counter, Row_Restrictions, Row_Restrictions) :-
    write('   ').

print_column_restrictions(Column_Restrictions) :-
    write('   '),
    print_column_restrictions(Column_Restrictions, 1).

print_column_restrictions([], _Col_Counter).
print_column_restrictions([Num_Col-Distance|More], Col_Counter) :-
    print_col_rest(Num_Col, Distance, Col_Counter),
    New_Col_Counter is Num_Col + 1,
    print_column_restrictions(More, New_Col_Counter).

print_col_rest(Num_Col, Distance, Num_Col) :-
    write('   '),
    write(Distance),
    write('  ').

print_col_rest(Num_Col, Distance, Col_Counter) :-
    write('      '),
    Col_Counter1 is Col_Counter + 1,
    print_col_rest(Num_Col, Distance, Col_Counter1).

sort_restrictions(Row_Restrictions, Column_Restrictions, Sorted_Row_Restrictions, Sorted_Column_Restrictions) :-
    sort(Row_Restrictions, Sorted_Row_Restrictions),
    sort(Column_Restrictions, Sorted_Column_Restrictions).

