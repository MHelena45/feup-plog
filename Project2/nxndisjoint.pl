
disjoint2_nxn(Board_Size, Column_Constraints, Row_Constraints, Options) :-   
    NumberOfVars is Board_Size * Board_Size,
    length(Vars, NumberOfVars),
    domain(Vars, 0, 1),
    check_number_of_squares(Board_Size, Vars),
    check_distance_disjoint(Vars, 1, Board_Size, [], Rectangles, [], Margin ),
    disjoint2(Rectangles, Margin),
    check_2_squares_row(Vars, Board_Size, Board_Size),
    column_constraints(Vars, Column_Constraints, Board_Size),
    row_constraints(Vars, Row_Constraints, Board_Size),
    labeling(Options, Vars).
    %show_board(Vars, Board_Size, Board_Size).

/**
 * Disjoint tem a posição no vetor como x
 * usa as linhas a ser utilizadas como y
 */
check_distance_disjoint(Vars, Counter, Board_Size, Rectangles, Final_Rectangles, Margin, Final_Margin ) :-
    Counter < Board_Size,
    element(C1, Vars, 1), % first square of the first row
    element(C2, Vars, 1), % second square of the second row
    element(C3, Vars, 1), % first square of the first row
    element(C4, Vars, 1), % second square of the second square        

    % C1 in first line
    C1 #> ((Counter - 1) * Board_Size),
    C1 #< (Counter * Board_Size - 1), % only square 2 of the line can occupy the other positions
    C2 #>= ((Counter - 1) * Board_Size + 2),
    C2 #=< (Counter * Board_Size), % only square 2 of the line can occupy the other positions
    C3 #> (Counter * Board_Size),
    C3 #< ((Counter + 1) * Board_Size - 1), % only square 2 of the line can occupy the other positions
    C4 #>= (Counter * Board_Size + 2),
    C4 #=< ((Counter + 1) * Board_Size), % only square 2 of the line can occupy the other positions

    C1s1 #= C1 + 1,
    C2s2 #= C2 + 1,
    C3X #= C3 - Board_Size + 1,
    C4X #= C4 - Board_Size + 1,

    NextCounter is Counter + 1,
    check_distance_disjoint(Vars, NextCounter, Board_Size,
    [   rect(C1s1, 1, Counter, 1, Rectangle_Type), 
        rect(C2s2, 1, Counter, 1, Rectangle_Type),
        rect(C3X, 1, NextCounter, 1, Rectangle_Type), 
        rect(C4X, 1, NextCounter, 1, Rectangle_Type) | Rectangles], Final_Rectangles, 
    [ margin(Rectangle_Type, Rectangle_Type, 1, 1) | Margin] , Final_Margin).

check_distance_disjoint(_Vars, _, _Board_Size, Rectangles, Rectangles, Margin, Margin).
