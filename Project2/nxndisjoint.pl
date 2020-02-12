:-use_module(library(clpfd)).
:-use_module(library(lists)).

disjoint2_nxn(Board_Size, Column_Constraints, Row_Constraints, Options) :-   
    get_vars_matrix(Board_Size, 0, Vars),
    check_distance_disjoint(Vars, 1, [], Rectangles, [], Margin ),
    disjoint2(Rectangles, Margin),
    % constrain_columns(Vars, Board_Size, Column_Constraints, 1),
    row_constraint(1, Row_Constraints, Vars),
    append_vars(Vars, [], Final_Vars),
    labeling(Options, Final_Vars),
    show_board_matrix(Vars).

row_constraints([], _Vars).
row_constraints([Row_Constraint | MoreConstraints], Vars) :-
    row_constraint(1, Row_Constraint, Vars),
    row_constraints(MoreConstraints, Vars).

row_constraint(Row, [Row-Row_Value], [Line | _]) :-
    element(S1, Line, 1), % first square of the first row
    element(S2, Line, 1), % second square of the second row
    disjoint2( 
       [rect(S1, 1, Row, 1, Rectangle_Type), 
        rect(S2, 1, Row, 1, Rectangle_Type) ],
       [ margin(Rectangle_Type, Rectangle_Type, Row_Value, 0) ] ).


row_constraint(Counter, Row_Constraint, [_Line1 | OtherLines]) :-
   NextCounter is Counter + 1,
   row_constraint(NextCounter, Row_Constraint, OtherLines).

/**
 * Disjoint tem a posição no vetor como x
 * usa as linhas a ser utilizadas como y
 */

check_distance_disjoint( [ _ ], _Board_Size, Rectangles, Rectangles, Margin, Margin).
check_distance_disjoint([Line1, Line2 | OtherLines], Counter, Rectangles, Final_Rectangles, Margin, Final_Margin ):-

    element(C1, Line1, 1), % first square of the first row
    element(C2, Line1, 1), % second square of the second row
    element(C3, Line2, 1), % first square of the first row
    element(C4, Line2, 1), % second square of the second square        

    (C1 + 1 #< C3 #\ C1 + 1 #> C3),  % check that C1 and C3 are spaced
    (C1 + 1 #< C4 #\ C1 + 1 #> C4), % check that C1 and C4 are spaced

    (C2 + 1 #< C3 #\ C2 + 1 #> C3), % check that C2 and C3 are spaced
    (C2 + 1 #< C4 #\ C2 + 1 #> C4), % check that C2 and C4 are spaced

    NextCounter is Counter + 1,
    check_distance_disjoint([Line2| OtherLines], NextCounter,
    [   rect(C1, 1, Counter, 1, Rectangle_Type), 
        rect(C2, 1, Counter, 1, Rectangle_Type),
        rect(C3, 1, NextCounter, 1, Rectangle_Type), 
        rect(C4, 1, NextCounter, 1, Rectangle_Type) | Rectangles], Final_Rectangles, 
    [ margin(Rectangle_Type, Rectangle_Type, 1, 1) | Margin] , Final_Margin).


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


	