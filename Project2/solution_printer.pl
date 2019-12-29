:- dynamic num_cols_per_cell/1.
:- dynamic num_lines_per_cell/1.


print_solution(Board_Size, Vars, Row_Restrictions, Column_Restrictions) :-
    clear_screen,
    sort_restrictions(Row_Restrictions, Column_Restrictions, Sorted_Row_Restrictions, Sorted_Column_Restrictions),
    calc_cell_size(Board_Size),
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
    num_lines_per_cell(Num_Lines),
    print_console_lines(Num_Lines, Row_Counter, Board_Size, Shaded_Col1, Shaded_Col2, Row_Restrictions),
    remove_restriction(Row_Counter, Row_Restrictions, New_Restrictions),
    print_line_seperator(Board_Size), nl.

remove_restriction(Num_Row, [Num_Row-_Distance|Rest], Rest).
remove_restriction(_Num_Row, Restrictions, Restrictions).

print_console_lines(0, _Row_Counter, _Board_Size, _Shaded_Col1, _Shaded_Col2, _Row_Restrictions).

print_console_lines(Num_Line, Row_Counter, Board_Size, Shaded_Col1, Shaded_Col2, Row_Restrictions) :-
    check_num_line(Num_Line, Print),
    print_row_restriction(Print, Row_Counter, Row_Restrictions),
    print_console_line(Board_Size, Shaded_Col1, Shaded_Col2), nl,
    Num_Line1 is Num_Line - 1,
    print_console_lines(Num_Line1, Row_Counter, Board_Size, Shaded_Col1, Shaded_Col2, Row_Restrictions).

check_num_line(Num_Line, 1) :-
    num_lines_per_cell(Num_Lines),
    Result is div(Num_Lines, 2),
    Num_Line == Result.

check_num_line(_Num_Line, 0).

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

print_shaded_square :- 
    num_cols_per_cell(Num_Cols),
    write_square('X', Num_Cols).

print_white_square :- 
    num_cols_per_cell(Num_Cols),
    write_square(' ', Num_Cols).

write_square(_Value, 0).
write_square(Value, Num_Cols) :-
    write(Value),
    Num_Cols1 is Num_Cols - 1,
    write_square(Value, Num_Cols1).

print_first_line_seperator(Board_Size) :-
    num_cols_per_cell(Num_Cols),
    Num is Num_Cols + 1,
    Num_Seperators is (Board_Size * Num),
    write('    '),
    print_first_line_seperator(Num_Seperators, 1).

print_first_line_seperator(Counter, Counter).

print_first_line_seperator(Num_Seperators, Counter) :-
    write('_'),
    Counter1 is Counter + 1,
    print_first_line_seperator(Num_Seperators, Counter1).

print_line_seperator(Board_Size) :-
    num_cols_per_cell(Num_Cols),
    Num is Num_Cols + 1,
    Num_Seperators is (Board_Size * Num),
    write('   '),
    print_line_seperator(Num_Seperators, 0).

print_line_seperator(Num_Seperators, Counter) :-
    Counter > Num_Seperators.
print_line_seperator(Num_Seperators, Counter) :-
    num_cols_per_cell(Num_Cols),
    Num is Num_Cols + 1,
    0 is mod(Counter, Num),
    write('|'),
    Counter1 is Counter + 1,
    print_line_seperator(Num_Seperators, Counter1).

print_line_seperator(Num_Seperators, Counter) :-
    write('_'),
    Counter1 is Counter + 1,
    print_line_seperator(Num_Seperators, Counter1).
    
print_col_seperator :- write('|').

print_row_restriction(1, Num_Row, [Num_Row-Distance|_Rest]) :-
    write(' '),
    write(Distance),
    write(' ').

print_row_restriction(_, _Num_Row, _Row_Restrictions) :-
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
    num_cols_per_cell(Num_Cols),
    Num is div(Num_Cols, 2),
    write_square(' ', Num),
    write(Distance),
    write_square(' ', Num).

print_col_rest(Num_Col, Distance, Col_Counter) :-
    num_cols_per_cell(Num_Cols),
    Num is Num_Cols + 1,
    write_square(' ', Num),
    Col_Counter1 is Col_Counter + 1,
    print_col_rest(Num_Col, Distance, Col_Counter1).

sort_restrictions(Row_Restrictions, Column_Restrictions, Sorted_Row_Restrictions, Sorted_Column_Restrictions) :-
    sort(Row_Restrictions, Sorted_Row_Restrictions),
    sort(Column_Restrictions, Sorted_Column_Restrictions).

calc_cell_size(Board_Size) :-
    Board_Size > 12,
    Board_Size =< 18,
    retract(num_cols_per_cell(_)),
    retract(num_lines_per_cell(_)),
    asserta(num_cols_per_cell(7)),
    asserta(num_lines_per_cell(3)).

calc_cell_size(Board_Size) :-
    Board_Size > 18,
    Board_Size =< 25,
    retract(num_cols_per_cell(_)),
    retract(num_lines_per_cell(_)),
    asserta(num_cols_per_cell(5)),
    asserta(num_lines_per_cell(2)).

calc_cell_size(Board_Size) :-
    Board_Size > 25,
    retract(num_cols_per_cell(_)),
    retract(num_lines_per_cell(_)),
    asserta(num_cols_per_cell(3)),
    asserta(num_lines_per_cell(1)).

calc_cell_size(_Board_Size).

% Default cells size
num_cols_per_cell(10).
num_lines_per_cell(5).

