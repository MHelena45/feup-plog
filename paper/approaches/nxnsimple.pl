
simple_nxn(Board_Size, Column_Constraints, Row_Constraints, Options) :-   
    get_vars_matrix(Board_Size, 0, Vars),
    check_distance_simple(Vars, [], Squares),
    restrict_cardinality(Board_Size, Squares),
    restrict_column_constraints(disjoint2_nxn, Column_Constraints, Vars),
    restrict_row_constraints(disjoint2_nxn, Row_Constraints, Vars),
    append_vars(Vars, [], Final_Vars),
    labeling(Options, Final_Vars), !.
    % show_board_matrix(Vars).

check_distance_simple([], Squares, Squares) :- !.
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

    check_distance_simple([Line2 | OtherLines], [C1, C2 | Squares], Final_Squares).

check_distance_simple([Line1 ], Squares, Final_Squares) :-
    element(C1, Line1, 1), % first square of the first row
    element(C2, Line1, 1), % second square of the second row
    
    sum([C1, 1], #<, C2),     % check that C2 is greater than C1 and there is a space betewen them

    check_distance_simple([], [C1, C2 | Squares], Final_Squares).
