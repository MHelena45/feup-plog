
get_vars_list(Board_Size, Vars) :-
    Board_Squares is Board_Size * 2, % size of the vector vars
    length(Vars, Board_Squares),
    domain(Vars, 1, Board_Size). % vars can only be between 1 and the board size

get_vars_matrix(Board_Size, Board_Size, []).
get_vars_matrix(Board_Size, Row_Counter, [H|T]) :-
    length(H, Board_Size),
    global_cardinality(H, [0-_, 1-2]),
    domain(H, 0, 1),
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

restrict_cardinality(Board_Size, Vars) :-
    get_cardinality(Board_Size, [], List_Of_Cardinality),
    global_cardinality(Vars, List_Of_Cardinality).   

get_cardinality(0, List_Of_Cardinality, List_Of_Cardinality).
get_cardinality(Board_Size, List_Of_Cardinality, Final_List_Of_Cardinality) :-
    Board_Size1 is Board_Size - 1,
    append([Board_Size-2], List_Of_Cardinality, List_Of_Cardinality1),
    get_cardinality(Board_Size1, List_Of_Cardinality1, Final_List_Of_Cardinality).

check_2_squares_row(_, 0, _).
check_2_squares_row(Vars, Column, Board_Size) :-
    NextColumn is Column - 1,
    element(N, Vars, 1),
    element(N1, Vars, 1),
    N #\= N1,
    (N mod Board_Size) #= NextColumn,
    (N1 mod Board_Size) #= NextColumn,
    check_2_squares_row(Vars, NextColumn, Board_Size).

row_constraints(Vars, Row, Row_Value, Board_Size) :-
    element(N, Vars, 1), % First square
    element(N1, Vars, 1),
    Start is (Row- 1) * Board_Size,
    sum([Start, Board_Size], #>, N ), % N is the fisrt square
    sum([Start], #<, N),
    sum([N, Row_Value, 1], #=, N1). % constraints the distance


column_Constraint(Vars, Column, Column_Value, Board_Size) :-
    element(N, Vars, 1),
    element(N1, Vars, 1),
    %  X in 1..Board_Size,
    %   N #= Column + (Board_Size * (X-1)),
    (N mod Board_Size) #= Column,
    Distance is (Column_Value + 1) * Board_Size,
    sum([N1, Distance], #=, N).

check_number_of_squares(Board_Size, Vars) :-
    NumberOfOnes is Board_Size * 2,
    global_cardinality(Vars, [0-_,1-NumberOfOnes]).

show_board([], 0, _Board_Size).
show_board(Vars, Line, Board_Size) :-
    show_board_line(Vars, Get_Rest, Board_Size),
    Next1 is Line - 1, nl,
    show_board(Get_Rest, Next1, Board_Size).

show_board_line(Get_Rest, Get_Rest, 0).
show_board_line([V1 | Vars], Get_Rest, Line) :-
    write(V1), write(' '),
    Next1 is Line - 1,
    show_board_line(Vars, Get_Rest, Next1).

restrict_column_constraints(_Approach, [], _Vars).
restrict_column_constraints(Approach, [Column_Constraint|Rest], Vars) :-
    restrict_column_distance(Approach, Column_Constraint, Vars),
    restrict_column_constraints(Approach, Rest, Vars).

restrict_row_constraints(_Approach, [], _Vars).
restrict_row_constraints(Approach, [Row_Constraint|Rest], Vars) :-
    restrict_row_distance(Approach, Row_Constraint, Vars),
    restrict_row_constraints(Approach, Rest, Vars).

restrict_row_distance(disjoint2_2xn, Row-Row_Value, Vars) :-
    % check if the indicated row have the right spacing between the 2 black squares
    Index2 is Row * 2 ,
    Index1 is Index2 - 1, % subtract operation are faster than multiplication ones
    element(Index1, Vars, Element1), 
    element(Index2, Vars, Element2),
    Element2 #= Element1 + Row_Value + 1.

restrict_row_distance(disjoint2_nxn, Row-Row_Value, Vars) :-
    nth1(Row, Vars, Line),
    element(Index1, Line, 1),
    element(Index2, Line, 1),
    Index1 #< Index2,
    Row_Value #= Index2 - Index1 - 1.
    
restrict_row_distance(simple_2xn, Row-Row_Value, Vars) :-
    % check if the indicated row have the right spacing between the 2 black squares
    Index2 is Row * 2 ,
    Index1 is Index2 - 1, % subtract operation are faster than multiplication ones
    element(Index1, Vars, Element1), 
    element(Index2, Vars, Element2),
    Element2 #= Element1 + Row_Value + 1.

% check if the indicated row has the rigth spacing between the 2 black squares
restrict_column_distance(disjoint2_2xn, Column-Column_Value, Vars) :-  
    element(Position1, Vars, Column),           % gets the index position of the element with the indicated column
    element(Position2, Vars, Column),
    (Position1 + 1) // 2 #= (Position2 + 1) // 2 + Column_Value  + 1.

restrict_column_distance(disjoint2_nxn, Num_Col-Column_Value, Vars) :-
    nth1(1, Vars, First_Line),
    length(First_Line, Board_Size),
    get_column(Vars, Board_Size, Num_Col, 1, Column),
    element(Index1, Column, 1),
    element(Index2, Column, 1),
    Index1 #< Index2,
    Column_Value #= Index2 - Index1 - 1.

% check if the indicated row has the rigth spacing between the 2 black squares
restrict_column_distance(simple_2xn, Column-Column_Value, Vars) :-  
    element(Position1, Vars, Column),           % gets the index position of the element with the indicated column
    element(Position2, Vars, Column),
    (Position1 + 1) // 2 #= (Position2 + 1) // 2 + Column_Value  + 1.

cumulative_baseline(Board_Size, Column_Constraints, Row_Constraints, Options) :-
    parse_constraints(Column_Constraints, Board_Size, 1, [], Parsed_Col_Constraints),
    parse_constraints(Row_Constraints, Board_Size, 1, [], Parsed_Row_Constraints),
    solver(1, Board_Size, Parsed_Row_Constraints, Parsed_Col_Constraints, Options).

cumulative_horizontal_and_vertical(Board_Size, Column_Constraints, Row_Constraints, Options) :-
    parse_constraints(Column_Constraints, Board_Size, 1, [], Parsed_Col_Constraints),
    parse_constraints(Row_Constraints, Board_Size, 1, [], Parsed_Row_Constraints),
    solver(2, Board_Size, Parsed_Row_Constraints, Parsed_Col_Constraints, Options).

cumulative_horizontal_only(Board_Size, Column_Constraints, Row_Constraints, Options) :-
    parse_constraints(Column_Constraints, Board_Size, 1, [], Parsed_Col_Constraints),
    parse_constraints(Row_Constraints, Board_Size, 1, [], Parsed_Row_Constraints),
    solver(3, Board_Size, Parsed_Row_Constraints, Parsed_Col_Constraints, Options).

cumulative_horizontal_only_no_board(Board_Size, Column_Constraints, Row_Constraints, Options) :-
    parse_constraints(Column_Constraints, Board_Size, 1, [], Parsed_Col_Constraints),
    parse_constraints(Row_Constraints, Board_Size, 1, [], Parsed_Row_Constraints),
    solver(4, Board_Size, Parsed_Row_Constraints, Parsed_Col_Constraints, Options).

parse_constraints(_Constraints, Board_Size, Coord_Counter, Acc, Acc) :-
    C1 is (Board_Size + 1),
    Coord_Counter = C1, !.

parse_constraints([], Board_Size, Coord_Counter, Acc, Parsed) :-
    append(Acc, [0], Acc1),
    Coord_Counter1 is Coord_Counter + 1,
    parse_constraints([], Board_Size, Coord_Counter1, Acc1, Parsed).

parse_constraints([Coord-Dist|R], Board_Size, Coord_Counter, Acc, Parsed) :-
    Coord \= Coord_Counter,
    Coord_Counter1 is Coord_Counter + 1,
    append(Acc, [0], Acc1),
    parse_constraints([Coord-Dist|R], Board_Size, Coord_Counter1, Acc1, Parsed).

parse_constraints([Coord-Dist|R], Board_Size, Coord, Acc, Parsed) :-
    append(Acc, [Dist], Acc1),
    Coord_Counter is Coord + 1,
    parse_constraints(R, Board_Size, Coord_Counter, Acc1, Parsed).
