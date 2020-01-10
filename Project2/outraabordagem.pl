:-use_module(library(clpfd)).
:- include('menu.pl').
:- include('solution_printer.pl').
:- include('user_interactions.pl').

abordagem(Board_Size, Column, Column_Value, Row, Row_Value) :-   
    NumberOfVars is Board_Size * Board_Size,
    length(Vars, NumberOfVars),
    domain(Vars, 0, 1),
    check_number_of_squares(Board_Size, Vars),
    check_distance(Vars, 0, Board_Size),
    column_Constraint(Vars, Column, Column_Value, Board_Size),
    row_constraints(Vars, Row, Row_Value, Board_Size),
    labeling([], Vars), 
    write(Vars).

check_distance(Vars, Counter, Board_Size) :-
    Counter =< Board_Size,
    element(C1, Vars, 1), % first square of the first row
    element(C2, Vars, 1), % second square of the second row
    element(C3, Vars, 1), % first square of the first row
    element(C4, Vars, 1), % second square of the second square
    % C1 in first line
    C1 #> (Counter * Board_Size),
    C1 #< ((Counter + 1) * Board_Size - 1), % only square 2 of the line can occupy the other positions
    C2 #>= (Counter * Board_Size + 2),
    C2 #=< ((Counter + 1) * Board_Size), % only square 2 of the line can occupy the other positions
    C3 #> ((Counter + 1) * Board_Size),
    C3 #< ((Counter + 2) * Board_Size - 1), % only square 2 of the line can occupy the other positions
    C4 #>= ((Counter + 1) * Board_Size + 2),
    C4 #=< ((Counter + 2) * Board_Size), % only square 2 of the line can occupy the other positions
    % C3 in Second line
    C1p1 #= C1 + 1 + Board_Size, % position of the first square of the row plus 1
    C1s1 #= C1 - 1 + Board_Size, % position of the first square of the next row plus 1
    sum([C1, 1], #<, C2),     % check that C2 is greater than C1 and there is a space betewen them
    sum([C3, 1], #<, C4),     % check that C4 is greater than C3 and there is a space between them
    (C1p1 #< C3) #\ (C1s1 #> C3),  % check that C1 and C3 are spaced
    (C1p1 #< C4) #\ (C1s1 #> C4), % check that C1 and C4 are spaced
    C2p1 #= C2 + 1 + Board_Size,
    C2s1 #= C2 - 1 + Board_Size,
    (C2p1 #< C3) #\ (C2s1 #> C3), % check that C2 and C3 are spaced
    (C2p1 #< C4) #\ (C2s1 #> C4), % check that C2 and C4 are spaced
    NextCounter is Counter + 1,
    check_distance(Vars, NextCounter, Board_Size).

check_distance(Vars, Counter, Board_Size) :-
    element(C1, Vars, 1),
    element(C2, Vars, 1),
    C1 #> (Counter * Board_Size),
    C1 #< ((Counter + 1) * Board_Size - 1),
    sum([C1, 1], #<, C2) .

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