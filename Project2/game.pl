:-use_module(library(clpfd)).

% board is 9*9
play(BoardSize, Row, RowValue, Column, ColumnValue) :-
    BoardSquares is BoardSize * 2,
    length(Vars, BoardSquares),
    domain(Vars, 1, BoardSize),  
    getCardinality(BoardSize, [], ListOfCardinality),
    global_cardinality(Vars, ListOfCardinality),
    checkPosition(Vars), 
    checkRowDistance(Row, RowValue, Vars),
    checkColumnDistance(Column, ColumnValue, Vars),
    labeling([], Vars),
    write(Vars).

% When there are two numbers for the row spacing in the board
play(BoardSize, Row, RowValue, Row1, RowValue1, Column, ColumnValue) :-
    BoardSquares is BoardSize * 2,
    length(Vars, BoardSquares),
    domain(Vars, 1, BoardSize),  
    getCardinality(BoardSize, [], ListOfCardinality),
    global_cardinality(Vars, ListOfCardinality),
    checkPosition(Vars), 
    checkRowDistance(Row, RowValue, Vars),
    checkRowDistance(Row1, RowValue1, Vars),
    checkColumnDistance(Column, ColumnValue, Vars),
    labeling([], Vars),
    write(Vars).

getCardinality(0, ListOfCardinality, ListOfCardinality).
getCardinality(BoardSize, ListOfCardinality, FinalListOfCardinality) :-
    BoardSize1 is BoardSize  - 1,
    append([BoardSize-2],ListOfCardinality, ListOfCardinality1),
    getCardinality(BoardSize1, ListOfCardinality1, FinalListOfCardinality ).
    

checkRowDistance(Row, RowValue, Vars) :-
    % check if the indicated row have the rigth spacing between the 2 black squares
    Index1 is Row * 2 - 1,
    Index2 is Row * 2,
    element(Index1, Vars, Element1), 
    element(Index2, Vars, Element2),
    Element2 #= Element1 + RowValue + 1.

% check if the indicated row have the rigth spacing between the 2 black squares
checkColumnDistance(Column, ColumnValue, Vars) :-  
    element(Position1, Vars, Column),           % gets the index position of the element with the indicated row
    element(Position2, Vars, Column),
    (Position1 + 1) // 2 #= (Position2 + 1) // 2 + ColumnValue  + 1.

/**
 * check position check if the squares don't touch each other
 */
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
    
% check the distance between the two elements of the last line
checkPosition([C1, C2]) :-
    % check that C1 and C2 don't touch and C1 is less than C2
    C1p1 #= C1 + 1, % position of the first square of the row plus 1
    C1p1 #< C2.     % check that C2 is greater than C1 and there is a space beetwen them