:-use_module(library(clpfd)).

:- include('menu.pl').
:- include('solution_printer.pl').
:- include('user_interactions.pl').

play :-
    main_menu(Board_Size),
    play(Board_Size).

% board has variable size
play(Board_Size) :-
    statistics(runtime, _),
    get_vars_list(Board_Size, Vars),  
    restrict_cardinality(Board_Size, Vars),
    check_distances(Vars),
    check_specific_distances(Vars), 
    labeling([], Vars),
    statistics(runtime, X),
    write(X),
    print_solution(Board_Size, Vars).

check_specific_distances(_). 
    % TODO

get_vars_list(Board_Size, Vars) :-
    Board_Squares is Board_Size * 2,
    length(Vars, Board_Squares),
    domain(Vars, 1, Board_Size).

restrict_cardinality(Board_Size, Vars) :-
    get_cardinality(Board_Size, List_Of_Cardinality),
    global_cardinality(Vars, List_Of_Cardinality).

get_cardinality(Board_Size, List_Of_Cardinality) :-
    get_cardinality(Board_Size, [], List_Of_Cardinality).

get_cardinality(0, List_Of_Cardinality, List_Of_Cardinality).
get_cardinality(Board_Size, List_Of_Cardinality, Final_List_Of_Cardinality) :-
    Board_Size1 is Board_Size  - 1,
    append([Board_Size-2], List_Of_Cardinality, List_Of_Cardinality1),
    get_cardinality(Board_Size1, List_Of_Cardinality1, Final_List_Of_Cardinality ).

check_row_distance(Row, Row_Value, Vars) :-
    % check if the indicated row have the rigth spacing between the 2 black squares
    Index1 is Row * 2 - 1,
    Index2 is Row * 2,
    element(Index1, Vars, Element1), 
    element(Index2, Vars, Element2),
    Element2 #= Element1 + Row_Value + 1.

% check if the indicated row have the rigth spacing between the 2 black squares
check_column_distance(Column, Column_Value, Vars) :-  
    element(Position1, Vars, Column),           % gets the index position of the element with the indicated row
    element(Position2, Vars, Column),
    (Position1 + 1) // 2 #= (Position2 + 1) // 2 + Column_Value  + 1.

/**
 * check_distances check if the squares don't touch each other, event at corners
 */
check_distances([C1, C2, C3, C4| Rest]) :-
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
    check_distances([C3, C4| Rest]).
    
% check the distance between the two elements of the last line
check_distances([C1, C2]) :-
    % check that C1 and C2 don't touch and C1 is less than C2
    C1p1 #= C1 + 1, % position of the first square of the row plus 1
    C1p1 #< C2.     % check that C2 is greater than C1 and there is a space beetwen them



play(BoardSize, Row, RowValue, Column, ColumnValue) :-
    statistics(runtime, _),
    BoardSquares is BoardSize * 2,
    length(Vars, BoardSquares),
    domain(Vars, 1, BoardSize),  
    get_cardinality(BoardSize, [], ListOfCardinality),
    global_cardinality(Vars, ListOfCardinality),
    check_distances(Vars), 
    check_row_distance(Row, RowValue, Vars),
    check_column_distance(Column, ColumnValue, Vars),
    labeling([], Vars),
    statistics(runtime, X),
    print_solution(BoardSize, Vars),
    open('C:\\Users\\ferre\\Desktop\\3ano\\feup-plog\\Project2\\times', append, C),
    set_output(C),
    write(X), write('ms\n'),
    statistics, 
    told. %write