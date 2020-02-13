:- use_module(library(clpfd)).
:- use_module(library(lists)).

simple_nxn(Board_Size, _Column_Contraints, Row_Constraints, Options) :-   
    get_vars_matrix(Board_Size, 0, Vars),
    check_distance_simple(Vars, [], Squares),
    restrict_squares_per_column(Board_Size, Squares ),
    % column_Constraint(Vars, Column, Column_Value, Board_Size),
    % row_constraint(1, Row_Constraints, Vars),
    append_vars(Vars, [], Final_Vars),
    trace,
    labeling(Options, Final_Vars), 
    show_board_matrix(Vars).

row_constraint(Row, [Row-Row_Value], [Line | _]) :-
    element(S1, Line, 1),
    element(S2, Line, 1),
    S2 #= S1 + Row_Value + 1.

row_constraint(Counter, Row_Constraint, [_Line1 | OtherLines]) :-
   NextCounter is Counter + 1,
   row_constraint(NextCounter, Row_Constraint, OtherLines).

check_distance_simple([_Line], Squares, Squares).
check_distance_simple([Line1, Line2 | OtherLines], Squares, Final_Squares) :-
    element(C1, Line1, 1), % first square of the first row
    element(C2, Line1, 1), % second square of the second row
    element(C3, Line2, 1), % first square of the first row
    element(C4, Line2, 1), % second square of the second square
    
    % check that C1 and C2 don't touch and C1 is lower than C2
    C1p1 #= C1 + 1, % position of the first square of the row plus 1
    C1s1 #= C1 - 1, % position of the first square of the next row plus 1
    sum([C1, 1], #<, C2),     % check that C2 is greater than C1 and there is a space betewen them
    sum([C3, 1], #<, C4),     % check that C4 is greater than C3 and there is a space between them
    (C1p1 #< C3 #\ C1s1 #> C3),  % check that C1 and C3 are spaced
    (C1p1 #< C4 #\ C1s1 #> C4), % check that C1 and C4 are spaced
    C2p1 #= C2 + 1,
    C2s1 #= C2 - 1,
    (C2p1 #< C3 #\ C2s1 #> C3), % check that C2 and C3 are spaced
    (C2p1 #< C4 #\ C2s1 #> C4), % check that C2 and C4 are spaced

    check_distance_simple([Line2 | OtherLines], [C1, C2, C3, C4 | Squares], Final_Squares).

/**
 * Creates the variables needed ( list of lists), restrict domain
 */
get_vars_matrix(Board_Size, Board_Size, []).
get_vars_matrix(Board_Size, Row_Counter, [H|T]) :-
    length(H, Board_Size),                          % create line
    domain(H, 0, 1),
    global_cardinality(H, [0-_, 1-2]),
    Row_Counter1 is Row_Counter + 1,
    get_vars_matrix(Board_Size, Row_Counter1, T).

append_vars([], Acc, Acc).
append_vars([H|T], Acc, Final_Vars) :-
    append(Acc, H, Acc1),
    append_vars(T, Acc1, Final_Vars).

show_board_matrix([]).
show_board_matrix([Row|Rest]) :-
    show_row(Row), 
    nl,
    show_board_matrix(Rest).

show_row([]).
show_row([Col|Rest]) :-
    write(Col), write(' '),
    show_row(Rest).

/**
 * makes sure there are only two black squares per column
 */
restrict_squares_per_column( Board_Size, Squares ) :-
    get_cardinality(Board_Size, [], List_Of_Cardinality),
    global_cardinality(Squares, List_Of_Cardinality).   

/**
 * gets the list of cardinality being applied. Every integer number in the domain [1, board_size], 
 * must appear twice.
 */
get_cardinality(0, List_Of_Cardinality, List_Of_Cardinality).
get_cardinality(Board_Size, List_Of_Cardinality, Final_List_Of_Cardinality) :-
    Board_Size1 is Board_Size  - 1,
    append([Board_Size-2], List_Of_Cardinality, List_Of_Cardinality1),
    get_cardinality(Board_Size1, List_Of_Cardinality1, Final_List_Of_Cardinality).