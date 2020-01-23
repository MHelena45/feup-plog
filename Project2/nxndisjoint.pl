:-use_module(library(clpfd)).
:- include('menu.pl').
:- include('solution_printer.pl').
:- include('user_interactions.pl').

abordagem(Board_Size, Column, Column_Value, Row, Row_Value) :-   
    NumberOfVars is Board_Size * Board_Size,
    length(Vars, NumberOfVars),
    domain(Vars, 0, 1),
    check_number_of_squares(Board_Size, Vars),
    check_distance(Vars, 1, Board_Size, [], Rectangles, [], Margin ),
    disjoint2(Rectangles, Margin),
   % check_2_squares_row(Vars, Board_Size, Board_Size),
    column_Constraint(Vars, Column, Column_Value, Board_Size),
    row_constraints(Vars, Row, Row_Value, Board_Size),
    labeling([], Vars), 
    % show
    nl,
    show_board(Vars, Board_Size, Board_Size).

check_2_squares_row(_, 0, _).
check_2_squares_row(Vars, Column, Board_Size) :-
    NextColumn is Column - 1,
    element(N, Vars, 1),
    element(N1, Vars, 1),
    N #\= N1,
    (N mod Board_Size) #= NextColumn,
    (N1 mod Board_Size) #= NextColumn,
    check_2_squares_row(Vars, NextColumn, Board_Size).

/**
 * Disjoint tem a posição no vetor como x
 * usa as linhas a ser utilizadas como y
 */
check_distance(Vars, Counter, Board_Size, Rectangles, Final_Rectangles, Margin, Final_Margin ) :-
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

    C3X #= C3 - Board_Size + 1,
    C4X #= C4 - Board_Size + 1,

    NextCounter is Counter + 1,
    check_distance(Vars, NextCounter, Board_Size,
    [   rect(C1, 1, Counter, 1, Rectangle_Type), 
        rect(C2, 1, Counter, 1, Rectangle_Type),
        rect(C3X, 1, NextCounter, 1, Rectangle_Type), 
        rect(C4X, 1, NextCounter, 1, Rectangle_Type) | Rectangles], Final_Rectangles, 
    [ margin(Rectangle_Type, Rectangle_Type, 1, 1) | Margin] , Final_Margin).

check_distance(_Vars, -1, _Board_Size, Rectangles, Rectangles, Margin, Margin ).

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
    global_cardinality(Vars, [0-_,1-NumberOfOnes] ).

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