:-use_module(library(clpfd)).

time(Board_Size, Column, Column_Value, Row, Row_Value) :-   
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
    Counter < Board_Size,
    element(C1, Vars, 1),
    element(C2, Vars, 1),
    element(C3, Vars, 1),
    element(C4, Vars, 1),
    % C1 in first line
    C1 #> (Counter * Board_Size),
    C1 #< ((Counter + 1) * Board_Size - 1),
    C3 #> ((Counter + 1) * Board_Size),
    C3 #< ((Counter + 2) * Board_Size - 1),
    % C3 in Second line
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
    NextCounter is Counter + 1,
    check_distance(Vars, NextCounter, Board_Size).

check_distance(Vars, Counter, Board_Size) :-
    element(C1, Vars, 1),
    element(C2, Vars, 1),
    C1 #> (Counter * Board_Size),
    C1 #< ((Counter + 1) * Board_Size - 1),
    sum([C1, 1], #<, C2).


row_constraints(Vars, Row, Row_Value, Board_Size) :-
    element(N, Vars, 1), % First square
    element(N1, Vars, 1),
    Start is Row * Board_Size - 1,
    sum([Start, Board_Size], #>, N ), % N is the fisrt square
    sum([Start, 1], #<, N),
    sum([N, Row_Value, 1], #=, N1). % constraints the distance


column_Constraint(Vars, Column, Column_Value, Board_Size) :-
    element(N, Vars, 1),
    element(N1, Vars, 1),
    X in 1..Board_Size,
    N #= Column + Board_Size * X,
    Distance is Column_Value * Board_Size,
    sum([N1, Distance], #=, N).


check_number_of_squares(Board_Size, Vars) :-
    NumberOfOnes is Board_Size * 2,
    NumberOfZeros is (Board_Size * Board_Size) - NumberOfOnes,
    global_cardinality(Vars, [0-NumberOfZeros,1-NumberOfOnes] ).