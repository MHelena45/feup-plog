:- dynamic num_cols_per_cell/1.
:- dynamic num_lines_per_cell/1.

% Prints a grid representing the puzzle, and the also prints the column restrictions above the puzzle
% and the row restrictions on the left side of the puzzle
print_solution(Board_Size, Vars, Row_Constraints, Column_Constraints) :-
    clear_screen, % Clear screen to better visualize puzzle
    % Needs to sort the constraints because they can be unordered since they are inserted by the user
    sort_constraints(Row_Constraints, Column_Constraints, Sorted_Row_Constraints, Sorted_Column_Constraints), 
    calc_cell_size(Board_Size), %Calculates the best size for each cell considering the board size
    print_column_Constraints(Sorted_Column_Constraints), nl, % Prints the column constraints above column of the board
    print_first_line_seperator(Board_Size), nl, % Prints the first line seperator of the board
    print_puzzle(Board_Size, Sorted_Row_Constraints, Vars). % Prints the puzzle itself with the row constrains on the left side

print_puzzle(Board_Size, Row_Constraints, Vars) :-
    print_puzzle(Board_Size, Row_Constraints, Vars, 1).

% Prints the puzzle itself with the row constrains on the left side
% Goes through two elements of the list Vars at a time. Each two elements represent the column position of the two shaded squares
% of the current row with number equal to the row counter
print_puzzle(_Board_Size, _Row_Constraints, [], _Row_Counter).
print_puzzle(Board_Size, Row_Constraints, [Shaded_Col1, Shaded_Col2 |Rows_Rest], Row_Counter) :-
    print_row(Row_Counter, Board_Size, Shaded_Col1, Shaded_Col2, Row_Constraints, New_Constraints),
    New_Row_Counter is Row_Counter + 1,
    print_puzzle(Board_Size, New_Constraints, Rows_Rest, New_Row_Counter).

% Prints the row, leaving the columns that dont have a corresponding constraint empty and the other ones are drawn with Xs
print_row(Row_Counter, Board_Size, Shaded_Col1, Shaded_Col2, Row_Constraints, New_Constraints) :-
    num_lines_per_cell(Num_Lines), % Gets the number of lines per cell that was previously calculated
    % prints equal console line a number of times equals to the num lines
    print_console_lines(Num_Lines, Row_Counter, Board_Size, Shaded_Col1, Shaded_Col2, Row_Constraints), 
    remove_Constraint(Row_Counter, Row_Constraints, New_Constraints), % Updates the constraints list if it was printed in this row
    print_line_seperator(Board_Size), nl. % Prints a line seperator below the printed row

% The number of the row is equal to the number of the row of the first constraint in the row constraints list, 
% so it is removed, returning in New Row Constraints (last argument) the rest of the list
remove_Constraint(Num_Row, [Num_Row-_Distance|Rest], Rest).
% No constraint is removed. 
remove_Constraint(_Num_Row, Constraints, Constraints).

print_console_lines(0, _Row_Counter, _Board_Size, _Shaded_Col1, _Shaded_Col2, _Row_Constraints).
print_console_lines(Num_Line, Row_Counter, Board_Size, Shaded_Col1, Shaded_Col2, Row_Constraints) :-
    check_num_line(Num_Line, Print), % Checks if the current console line must print the row restriction
    % Prints the row restriction if the current row has a corresponding restriction and if Print is 1
    print_row_Constraint(Print, Row_Counter, Row_Constraints), 
    % Prints all the columns of the line, leaving blank the ones that do not correspond to Shaded_Col1 or Shaded_Col2
    print_console_line(Board_Size, Shaded_Col1, Shaded_Col2), nl,
    Num_Line1 is Num_Line - 1,
    % Repeats the cicle a number of times equal to the initial value in the first argument
    print_console_lines(Num_Line1, Row_Counter, Board_Size, Shaded_Col1, Shaded_Col2, Row_Constraints).

% Puts 1 in the second argument if the first argument, the number of the current console line being draw, is the middle one
check_num_line(Num_Line, 1) :-
    num_lines_per_cell(Num_Lines), % Gets the number of lines per cell that was previously calculated
    Result is div(Num_Lines, 2),
    Num_Line == Result.
check_num_line(_Num_Line, 0). % Returns 0 if the current line is not the middle one

% Prints the rows of the console line
print_console_line(Board_Size, Shaded_Col1, Shaded_Col2) :-
    print_console_line(1, Board_Size, Shaded_Col1, Shaded_Col2).

% Ends when the column counter is greater then the board size
print_console_line(Num_Col, Board_Size, _Shaded_Col1, _Shaded_Col2) :-
    Num_Col > Board_Size.

% The current column being printed is equal to the column value of the first shaded square of the row
print_console_line(Shaded_Col1, Board_Size, Shaded_Col1, Shaded_Col2) :-
    check_first_col(Shaded_Col1), % Checks if the current column is the first one
    print_shaded_square, % Prints all Xs a numbe of times equal to the number of rows that each cell occupies
    print_col_seperator, % Prints a column seperator to seperate each cell
    New_Col is Shaded_Col1 + 1, % Repeats the cicle until all columns of the row are printed
    print_console_line(New_Col, Board_Size, Shaded_Col1, Shaded_Col2).

% The current column being printed is equal to the column value of the second shaded square of the row
print_console_line(Shaded_Col2, Board_Size, Shaded_Col1, Shaded_Col2) :-
    check_first_col(Shaded_Col2), % Checks if the current column is the first one
    print_shaded_square, % Prints all Xs a number of times equal to the number of rows that each cell occupies
    print_col_seperator, % Prints a column seperator to seperate each cell
    New_Col is Shaded_Col2 + 1, % Repeats the cicle until all columns of the row are printed
    print_console_line(New_Col, Board_Size, Shaded_Col1, Shaded_Col2).

% The current row is not a shaded square so it prints a blank space
print_console_line(Num_Col, Board_Size, Shaded_Col1, Shaded_Col2) :-
    check_first_col(Num_Col), % Checks if the current column is the first one
    print_white_square, % Prints a blank space a number of times equal to the number of rows that each cell occupies
    print_col_seperator, % Prints a column seperator to seperate each cell
    New_Col is Num_Col + 1, % Repeats the cicle until all columns of the row are printed
    print_console_line(New_Col, Board_Size, Shaded_Col1, Shaded_Col2).

% If the current column is the first one of the line a column seperator is printed before the cell
check_first_col(Num_Col) :-
    Num_Col == 1,
    write('|').

check_first_col(_Num_Col).

% % Prints Xs a number of times equal to the number of rows that each cell occupies
print_shaded_square :- 
    num_cols_per_cell(Num_Cols), % Gets the number of columns per cell that was previously calculated
    write_square('X', Num_Cols).

% Prints a blank space a number of times equal to the number of rows that each cell occupies
print_white_square :- 
    num_cols_per_cell(Num_Cols), % Gets the number of columns per cell that was previously calculated
    write_square(' ', Num_Cols).

% Writes a value repetedly a number of times to the second argument
write_square(_Value, 0).
write_square(Value, Num_Cols) :-
    write(Value),
    Num_Cols1 is Num_Cols - 1,
    write_square(Value, Num_Cols1).

% First line seperator of the board
print_first_line_seperator(Board_Size) :-
    num_cols_per_cell(Num_Cols), % Gets the number of columns per cell that was previously calculated
    Num is Num_Cols + 1,
    % The number of times it is needed to write a seperator is equal to the board size times the number 
    % of columns per cell plus 1, because for each cell a column seperator is printed
    Num_Seperators is (Board_Size * Num), 
    write('    '), % Empty space before the board to be occupied by the row restrictions
    print_first_line_seperator(Num_Seperators, 1).

print_first_line_seperator(Counter, Counter).

% Prints a '_' a number of times equal to the firs argument
print_first_line_seperator(Num_Seperators, Counter) :-
    write('_'),
    Counter1 is Counter + 1,
    print_first_line_seperator(Num_Seperators, Counter1).

% Prints a seperator between each row
print_line_seperator(Board_Size) :-
    num_cols_per_cell(Num_Cols),  
    Num is Num_Cols + 1,
    % The number of times it is needed to write a seperator is equal to the board size times the number 
    % of columns per cell plus 1, because for each cell a column seperator is printed
    Num_Seperators is (Board_Size * Num),
    write('   '), % Empty space before the board to be occupied by the row restrictions
    print_line_seperator(Num_Seperators, 0). 

% Ends when the separator counter is grater then the total number of seperators
print_line_seperator(Num_Seperators, Counter) :-
    Counter > Num_Seperators.
print_line_seperator(Num_Seperators, Counter) :-
    num_cols_per_cell(Num_Cols), % Gets the number of columns per cell that was previously calculated
    Num is Num_Cols + 1, 
    % If the rest of the division of the Counter and the number of columns per cell plus 1 is zero
    % it prints a column seperator to seperate each cell vertically
    0 is mod(Counter, Num), 
    print_col_seperator,
    Counter1 is Counter + 1,
    print_line_seperator(Num_Seperators, Counter1).

print_line_seperator(Num_Seperators, Counter) :-
    write('_'), % If the condition above doesnt check it just prints the normal line seperator
    Counter1 is Counter + 1,
    print_line_seperator(Num_Seperators, Counter1).
    
print_col_seperator :- write('|').

% Prints the row constraint if the if the first argument is 1 and the current row has a row constraint
print_row_constraint(1, Num_Row, [Num_Row-Distance|_Rest]) :-
    % If the distance constraint has only 1 digit then it prints an empty space
    check_num_digits(Distance), 
    write(Distance),
    write(' ').

% If the conditions above are not checked it only prints an empty space
print_row_constraint(_, _Num_Row, _Row_Constraints) :-
    write('   ').

% If the distance constraint has only 1 digit then it prints an empty space, 
%so that the constraints are well formated even with number of double digits
check_num_digits(Distance) :-
    0 is div(Distance, 10),
    write(' ').

check_num_digits(_Distance).

print_column_constraints(Column_Constraints) :-
    write('   '), % Space needed to draw the row Constraints
    print_column_constraints(Column_Constraints, 1).

% Prints one line of columns constraints with the spacing neccessary to be well formatted with the columns of the board
print_column_constraints([], _Col_Counter).

% Goes through the list of column constraints and prints each one
print_column_constraints([Num_Col-Distance|More], Col_Counter) :-
    print_col_constraint(Num_Col, Distance, Col_Counter),
    New_Col_Counter is Num_Col + 1,
    print_column_constraints(More, New_Col_Counter).

% If the current column being processed is the one the column constraint, it prints it
print_col_constraint(Num_Col, Distance, Num_Col) :-
    num_cols_per_cell(Num_Cols), % Gets the number of columns per cell that was previously calculated
    Num is div(Num_Cols, 2), % Prints the column constraint in the center of the column
    write_square(' ', Num),
    write(Distance),
    write_square(' ', Num).

% If the condition above are not met, it prints a blank space for each column 
%until it reached the first colum constraint of the list
print_col_constraint(Num_Col, Distance, Col_Counter) :-
    num_cols_per_cell(Num_Cols), % Gets the number of columns per cell that was previously calculated
    Num is Num_Cols + 1,
    write_square(' ', Num), % Prints an empty space
    Col_Counter1 is Col_Counter + 1,
    print_col_constraint(Num_Col, Distance, Col_Counter1).

% Sorts the constraints list. This is needed because they can be unordered since they are inserted by the user
sort_constraints(Row_Constraints, Column_Constraints, Sorted_Row_Constraints, Sorted_Column_Constraints) :-
    sort(Row_Constraints, Sorted_Row_Constraints),
    sort(Column_Constraints, Sorted_Column_Constraints).

% Calculates the best size for each cell considering the board size
calc_cell_size(Board_Size) :-
    Board_Size =< 12,
    retract(num_cols_per_cell(_)),
    retract(num_lines_per_cell(_)),
    asserta(num_cols_per_cell(10)),
    asserta(num_lines_per_cell(5)).

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

