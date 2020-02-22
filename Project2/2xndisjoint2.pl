disjoint2_2xn(Board_Size, Column_Constraints, Row_Constraints, Options) :-
    % Vars is a list in which 2 following members represent the column position of the shaded squares of the same row
    get_vars_list(Board_Size, Vars),
    restrict_cardinality(Board_Size, Vars), % Restricts the number shaded squares in a row
    restrict_distances_disjoint(Vars), % Makes sure that the shaded squares dont touch each other
    restrict_column_constraints(disjoint2_2xn, Column_Constraints, Vars),
    restrict_row_constraints(disjoint2_2xn, Row_Constraints, Vars),
    labeling(Options, Vars). % Gets the solution
    %print_solution(Board_Size, Vars, Row_Constraints, Column_Constraints).

restrict_distances_disjoint(SquaresColumns) :-
    create_rectangles_param(SquaresColumns, [], Rectangles, 1),
    disjoint2(Rectangles, [margin(a, a, 1, 1)]).

create_rectangles_param([], Rectangles, Rectangles, _Row_with_Board_Size_Value).
create_rectangles_param([Fisrt_square_1_Row, Second_Square_1_Row | Rest], Rectangles, FinalRectangles, Row) :-
    Fisrt_square_1_Row #< Second_Square_1_Row,
    NextRow is Row + 1,
    create_rectangles_param(  Rest , [ 
                rect(Fisrt_square_1_Row, 1, Row, 1, a), 
                rect(Second_Square_1_Row, 1, Row, 1, a)
                | Rectangles
            ], FinalRectangles, NextRow).
