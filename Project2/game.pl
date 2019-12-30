:-use_module(library(clpfd)).
:-use_module(library(lists)).
:- use_module(library(random)). % used to generate radom puzzles
:- use_module(library(between)).

:- include('menu.pl').
:- include('solution_printer.pl').
:- include('user_interactions.pl').

% start execution
play :-
    main_menu(Board_Size),
    play(Board_Size).

% board has variable size
play(Board_Size) :-
    get_vars_list(Board_Size, Vars),  
    restrict_cardinality(Board_Size, Vars),
    restrict_distances(Vars),
    restrict_specific_distances(Vars, Board_Size, Row_Restrictions, Column_Restrictions), 
    labeling([], Vars),
    statistics(runtime, X),
    print_solution(Board_Size, Vars, Row_Restrictions, Column_Restrictions).

/**  gets all vars needed acording to the board size.
 *  As we can only have 2 squares per row, vars represents the column of the black squares.
 *  The row can be calculated by the postion in the Vars vetor
 */
get_vars_list(Board_Size, Vars) :-
    Board_Squares is Board_Size * 2, % size of the vector vars
    length(Vars, Board_Squares),
    domain(Vars, 1, Board_Size). % vars can only be between 1 and th board size

restrict_cardinality(Board_Size, Vars) :-
    get_cardinality(Board_Size, List_Of_Cardinality),
    global_cardinality(Vars, List_Of_Cardinality).

get_cardinality(Board_Size, List_Of_Cardinality) :-
    get_cardinality(Board_Size, [], List_Of_Cardinality).

get_cardinality(0, List_Of_Cardinality, List_Of_Cardinality).
get_cardinality(Board_Size, List_Of_Cardinality, Final_List_Of_Cardinality) :-
    Board_Size1 is Board_Size  - 1,
    append([Board_Size-2], List_Of_Cardinality, List_Of_Cardinality1),
    get_cardinality(Board_Size1, List_Of_Cardinality1, Final_List_Of_Cardinality).

/**
 * Check if the squares don't touch each other, even at corners.
 * First is used to all rows except the last.
 */
restrict_distances([C1, C2, C3, C4| Rest]) :-
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
    restrict_distances([C3, C4| Rest]).
    
% check the distance between the two elements of the last row
restrict_distances([C1, C2]) :-
    % check that C1 and C2 don't touch and C1 is less than C2
    C1p1 #= C1 + 1, % position of the first square of the row plus 1
    C1p1 #< C2.     % check that C2 is greater than C1 and there is a space beetwen them

restrict_specific_distances(Vars, Board_Size, Row_Restrictions, Column_Restrictions) :-
    restrict_specific_distances(Vars, Board_Size, [], [], Row_Restrictions, Column_Restrictions).

restrict_specific_distances(Vars, Board_Size, Row_Rest_Acc, Col_Rest_Acc, Row_Restrictions, Column_Restrictions) :- 
    get_user_option(Option),
    !, restrict_user_option(Option, Vars, Board_Size, Row_Rest_Acc, Col_Rest_Acc, Row_Restrictions, Column_Restrictions).

% Restrict Row
restrict_user_option(row, Vars, Board_Size, Row_Rest_Acc, Col_Rest_Acc, Row_Restrictions, Column_Restrictions) :-
    get_num_row(Num_Row, Board_Size), !,
    get_distance(Distance, Board_Size),
    restrict_row_distance(1, Num_Row, Distance, Vars),
    append(Row_Rest_Acc, [Num_Row-Distance], New_Row_Acc),
    !, restrict_specific_distances(Vars, Board_Size, New_Row_Acc, Col_Rest_Acc, Row_Restrictions, Column_Restrictions).

% Restrict Column
restrict_user_option(column, Vars, Board_Size, Row_Rest_Acc, Col_Rest_Acc, Row_Restrictions, Column_Restrictions) :-
    get_num_column(Num_Column, Board_Size), !,
    get_distance(Distance, Board_Size),
    restrict_column_distance(1, Num_Column, Distance, Vars),
    append(Col_Rest_Acc, [Num_Column-Distance], New_Col_Acc),
    !, restrict_specific_distances(Vars, Board_Size, Row_Rest_Acc, New_Col_Acc, Row_Restrictions, Column_Restrictions).

restrict_user_option(stop, _Vars, _Board_Size, Row_Rest_Acc, Col_Rest_Acc, Row_Rest_Acc, Col_Rest_Acc) :- !.

get_user_option(Option) :-
    repeat, 
    ask_row_or_column(Option),
    valid_user_option(Option).

get_num_row(Num_Row, Board_Size) :-
    repeat,
    ask_which_row(Num_Row),
    valid_coord(Num_Row, Board_Size).

get_num_column(Num_Column, Board_Size) :-
    repeat,
    ask_which_column(Num_Column),
    valid_coord(Num_Column, Board_Size).

get_distance(Distance, Board_Size) :-
    repeat, 
    ask_distance(Distance),
    valid_distance(Distance, Board_Size).

% the user can only responde with 3 option
valid_user_option(row).
valid_user_option(column).
valid_user_option(stop).
valid_user_option(_) :-
    invalid_user_option, fail.

valid_coord(Coord, Board_Size) :-
    Coord >= 1, 
    Coord =< Board_Size.

valid_coord(_Coord, _Board_Size) :-
    invalid_coord, fail.

valid_distance(Distance, Board_Size) :-
    Distance >= 1,
    Max_Distance is Board_Size - 2,
    Distance =< Max_Distance.

valid_distance(_Distance, _Board_Size) :-
    invalid_distance, fail.

restrict_row_distance(_Show_error_message, Row, Row_Value, Vars) :-
    % check if the indicated row have the rigth spacing between the 2 black squares
    Index1 is Row * 2 - 1,
    Index2 is Row * 2,
    element(Index1, Vars, Element1), 
    element(Index2, Vars, Element2),
    Element2 #= Element1 + Row_Value + 1.

restrict_row_distance(1, _Row, _Row_Value, _Vars) :-
    impossible_distance_restriction, fail.

% check if the indicated row have the rigth spacing between the 2 black squares
restrict_column_distance(_Show_error_message, Column, Column_Value, Vars) :-  
    element(Position1, Vars, Column),           % gets the index position of the element with the indicated column
    element(Position2, Vars, Column),
    (Position1 + 1) // 2 #= (Position2 + 1) // 2 + Column_Value  + 1.

restrict_column_distance(1, _Column, _Column_Value, _Vars) :-
    impossible_distance_restriction, fail.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      Generate puzzles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
get_puzzle(Board_Size) :-
    % number of the row where the restriction will exists
    random(1, Board_Size, Row),
    % number of the column where the restriction will exists
    random(1, Board_Size, Column),
    % even if 2 squares are in the maximum distance, that distante is (Board_Size - 2)
    Distance is (Board_Size - 2),
    % distance between the two squares in the row
    random(1, Distance, Row_Value),
    % distance betwwn the 2 squares in the same column
    random(1, Distance, Column_Value),
    check_if_solution_exists(Board_Size, Column, Column_Value, Row, Row_Value),
    write('Column : '), write(Column), write(' with '), write( Column_Value), nl,
    write('Row :'), write(Row), write(' with '), write(Row_Value), nl,
    press_any_button.

check_if_solution_exists(Board_Size, Column, Column_Value, Row, Row_Value) :-
    get_vars_list(Board_Size, Vars),  
    restrict_cardinality(Board_Size, Vars),
    restrict_distances(Vars),
    restrict_column_distance(0, Column, Column_Value, Vars), 
    restrict_row_distance(0, Row, Row_Value, Vars),
    labeling([], Vars).

% get another puzzle
check_if_solution_exists(Board_Size, _Column, _Column_Value, _Row, _Row_Value) :-
    get_puzzle(Board_Size).

