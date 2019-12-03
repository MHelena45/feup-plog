:-use_module(library(clpfd)).

% board is 9*9
play(Row, RowValue, Column, ColumnValue) :-
    length(Vars, 18),
    domain(Vars, 1, 9),  
    global_cardinality(Vars, [1-2, 2-2, 3-2, 4-2, 5-2, 6-2, 7-2, 8-2, 9-2]),
    checkPosition(Vars), 
    % check if the indicated row have the rigth spacing between the 2 black squares
    Index1 is (Row - 1) * 2 + 1,
    Index2 is Row * 2,
    element(Index1, Vars, Element1), 
    element(Index2, Vars, Element2),
    Element2 #= Element1 + RowValue + 1, 
    % check if the indicated row have the rigth spacing between the 2 black squares
    element(Position1, Vars, Column), 
    element(Position2, Vars, Column), 
    Position2 #= Position1 + (ColumnValue * 2) + 2, % both squares are the first ou second in that row
    labeling([],Vars),
    write(Vars).

checkPosition([C1, C2, C3, C4| Rest]) :-
    % check that C1 and C2 don't touch and C1 is less than C2
    C1p1 #= C1 + 1, % position of the first square of the row plus 1
    C1s1 #= C1 - 1, % position of the first square of the next row plus 1
    C1p1 #< C2,     % check that C2 is greater than C1 and there is a space beetwen them
    C3p1 #= C3 + 1,  % position of the first square of the next row plus 1
    C3p1 #< C4,     % check that C4 is greater than C3 and there is a space beetwen them
    (C1p1 #< C3 #\/ C1s1 #> C3),  % check that C1 and C3 are spaced
    (C1p1 #< C4 #\/ C1s1 #> C4), % check that C1 and C4 are spaced
    C2p1 #= C2 + 1,
    C2s1 #= C2 - 1,
    (C2p1 #< C3 #\/ C2s1 #> C3), % check that C2 and C3 are spaced
    (C2p1 #< C4 #\/ C2s1 #> C4), % check that C2 and C4 are spaced
    checkPosition([C3, C4| Rest]).
    
checkPosition([C1, C2]) :-
    % check that C1 and C2 don't touch and C1 is less than C2
    C1p1 #= C1 + 1, % position of the first square of the row plus 1
    C1p1 #< C2.     % check that C2 is greater than C1 and there is a space beetwen them