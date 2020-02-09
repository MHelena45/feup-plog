
get_vars_list(Board_Size, Vars) :-
    Board_Squares is Board_Size * 2, % size of the vector vars
    length(Vars, Board_Squares),
    domain(Vars, 1, Board_Size). % vars can only be between 1 and the board size

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