disjoint2_nxn(Board_Size, Column_Constraints, Row_Constraints, Options) :-   
    get_vars_matrix(Board_Size, 0, Vars),
    check_distance_disjoint(Vars, 1, [], Rectangles, [], Squares),
    disjoint2(Rectangles, [margin(a, a, 1, 1)]),
    restrict_cardinality(Board_Size, Squares),
    restrict_column_constraints(disjoint2_nxn, Column_Constraints, Vars),
    restrict_row_constraints(disjoint2_nxn, Row_Constraints, Vars),
    append_vars(Vars, [], Final_Vars),
    labeling(Options, Final_Vars), !.
    % show_board_matrix(Vars).

/**
 * Disjoint tem a posição no vetor como x
 * usa as linhas a ser utilizadas como y
 */
check_distance_disjoint( [  ], _Board_Size, Rectangles, Rectangles, Squares, Squares) :- !.
check_distance_disjoint([Line1 | OtherLines], Counter, Rectangles, Final_Rectangles, Squares, Final_Squares ):-
    element(C1, Line1, 1), % first square of the first row
    element(C2, Line1, 1), % second square of the second row
    C1 #< C2,   
    NextCounter is Counter + 1,
    check_distance_disjoint( OtherLines, NextCounter,
    [   rect(C1, 1, Counter, 1, a), 
        rect(C2, 1, Counter, 1, a) | Rectangles], Final_Rectangles, 
    [ C1, C2| Squares] , Final_Squares).

