
disjoint2_2xn(Board_Size, Row_Constraints, Column_Constraints, Options) :-
    % Vars is a list in which 2 following members represent the column position of the shaded squares of the same row
    get_vars_list(Board_Size, Vars),
    restrict_cardinality(Board_Size, Vars), % Restricts the number shaded squares in a row
    restrict_distances_disjoint(Vars), % Makes sure that the shaded squares dont touch each other
    labeling(Options, Vars), % Gets the solution
    print_solution(Board_Size, Vars, Row_Constraints, Column_Constraints).

restrict_distances_disjoint(SquaresColumns) :-
    create_rectangles_param(SquaresColumns, [], Rectangles, [], Margin, 1),
    disjoint2(Rectangles, Margin).

create_rectangles_param([_,_], Rectangles, Rectangles, Margin, Margin, _Row_with_Board_Size_Value).
create_rectangles_param([Fisrt_square_1_Row, Second_Square_1_Row, Fisrt_square_2_Row, Second_Square_2_Row | Rest], Rectangles, FinalRectangles, Margin, FinalMargin, Row) :-
    NextRow is Row + 1,
    create_rectangles_param( [ Fisrt_square_2_Row, Second_Square_2_Row | Rest] , [ 
                rect(Fisrt_square_1_Row, 1, Row, 1, RectangleType), 
                rect(Second_Square_1_Row, 1, Row, 1, RectangleType),
                rect(Fisrt_square_2_Row, 1, Row, 1, RectangleType), 
                rect(Second_Square_2_Row, 1, Row, 1, RectangleType) | Rectangles
            ], FinalRectangles,
            [
                margin(RectangleType, RectangleType, 1, 1) | Margin
            ], FinalMargin, NextRow).


