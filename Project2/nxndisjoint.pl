:-use_module(library(clpfd)).
:-use_module(library(lists)).

disjoint2_nxn(Board_Size, Column_Constraints, Row_Constraints, Options) :-   
    get_vars_matrix(Board_Size, 0, Vars),
    check_distance_disjoint(Vars, 1, [], Rectangles, [], Squares),
    disjoint2(Rectangles, [margin(a, a, 1, 1)]),
    restrict_squares_per_column(Board_Size, Squares ),
   % constrain_columns(Vars, Board_Size, Column_Constraints, 1),
    % row_constraints(1, Row_Constraints, Vars),
    append_vars(Vars, [], Final_Vars),
    labeling(Options, Final_Vars),
    show_board_matrix(Vars).


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

/**
 * Disjoint tem a posição no vetor como x
 * usa as linhas a ser utilizadas como y
 */
check_distance_disjoint( [  ], _Board_Size, Rectangles, Rectangles, Squares, Squares).
check_distance_disjoint([Line1 | OtherLines], Counter, Rectangles, Final_Rectangles, Squares, Final_Squares ):-

    element(C1, Line1, 1), % first square of the first row
    element(C2, Line1, 1), % second square of the second row
    C1 #< C2,   
    NextCounter is Counter + 1,
    check_distance_disjoint( OtherLines, NextCounter,
    [   rect(C1, 1, Counter, 1, a), 
        rect(C2, 1, Counter, 1, a) | Rectangles], Final_Rectangles, 
    [ C1, C2| Squares] , Final_Squares).


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


	