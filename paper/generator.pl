:- use_module(library(random)). % used to generate radom puzzles
:- use_module(library(clpfd)).
:- use_module(library(lists)).

restrict_distances_disjoint(SquaresColumns) :-
    create_rectangles_param(SquaresColumns, [], Rectangles, 1),
    disjoint2(Rectangles, [margin(a, a, 1, 1)]).

create_rectangles_param([], Rectangles, Rectangles, _Row_with_Board_Size_Value) :- !.
create_rectangles_param([Fisrt_square_1_Row, Second_Square_1_Row | Rest], Rectangles, FinalRectangles, Row) :-
    Fisrt_square_1_Row #< Second_Square_1_Row,
    NextRow is Row + 1,
    create_rectangles_param(  Rest , [ 
                rect(Fisrt_square_1_Row, 1, Row, 1, a), 
                rect(Second_Square_1_Row, 1, Row, 1, a)
                | Rectangles
            ], FinalRectangles, NextRow).

get_vars_list(Board_Size, Vars) :-
    Board_Squares is Board_Size * 2, % size of the vector vars
    length(Vars, Board_Squares),
    domain(Vars, 1, Board_Size). % vars can only be between 1 and the board size

restrict_cardinality(Board_Size, Vars) :-
    get_cardinality(Board_Size, [], List_Of_Cardinality),
    global_cardinality(Vars, List_Of_Cardinality).   

get_cardinality(0, List_Of_Cardinality, List_Of_Cardinality) :- !.
get_cardinality(Board_Size, List_Of_Cardinality, Final_List_Of_Cardinality) :-
    Board_Size1 is Board_Size - 1,
    append([Board_Size-2], List_Of_Cardinality, List_Of_Cardinality1),
    get_cardinality(Board_Size1, List_Of_Cardinality1, Final_List_Of_Cardinality).

restrict_row_distance(Row-Row_Value, Vars) :-
    % check if the indicated row have the right spacing between the 2 black squares
    Index2 is Row * 2 ,
    Index1 is Index2 - 1, % subtract operation are faster than multiplication ones
    element(Index1, Vars, Element1), 
    element(Index2, Vars, Element2),
    Element2 #= Element1 + Row_Value + 1.

disjoint2_2xn(Board_Size, Row-Row_value, Vars, Options) :-
    % Vars is a list in which 2 following members represent the column position of the shaded squares of the same row
    get_vars_list(Board_Size, Vars),
    restrict_cardinality(Board_Size, Vars), % Restricts the number shaded squares in a row
    restrict_distances_disjoint(Vars), % Makes sure that the shaded squares dont touch each other
    restrict_row_distance( Row-Row_value, Vars),
    labeling(Options, Vars), !. % Gets the solution

generator(Board_size) :-
    Number_of_rows is Board_size + 1,
    random(1, Number_of_rows, Row),
    random(1, Number_of_rows, Square_position),
    get_maximum_distance(Square_position, Board_size, Maximum_distance), !,
    random(1, Maximum_distance, Row_value),
    random_member(Variable_option, [leftmost, min, max, ff, anti_first_fail, occurrence, ffc, max_regret]),
    random_member(Way_option, [step, enum, bisect, median, middle]),
    random_member(Order_option, [up, down]),
    disjoint2_2xn(Board_size, Row-Row_value, Puzzle, [Variable_option, Way_option, Order_option]),
    write(Puzzle),
    random(1, Number_of_rows, Column),
    write(Column),
    get_column_distance(Puzzle, Column, Distance),
    write('tip: '), write(Column), write(' - '), write(Distance).

get_maximum_distance(Square_position, Board_size, Maximum_distance) :-
    Square_position > Board_size // 2,
    Maximum_distance is Board_size - (Board_size - Square_position) - 2.

get_maximum_distance(Square_position, Board_size, Maximum_distance) :-
    Maximum_distance is Board_size - Square_position - 1.

get_column_distance(Puzzle, Column, Distance) :-
    element(N1, Puzzle, Column),
    element(N2, Puzzle, Column),
    N1 #< N2,
    labeling([], [N1, N2]),
    (N2 - N1) // 2 #= Distance + 1.
