:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- use_module(library(random)). % used to generate radom puzzles
:- use_module(library(between)).

:- include('menu.pl').
:- include('solution_printer.pl').
:- include('user_interactions.pl').

% start execution
play :-
    main_menu.

% board has variable size
play(Board_Size) :-
    get_vars_list(Board_Size, Vars),  
    restrict_cardinality(Board_Size, Vars),
    restrict_distances(Vars),
    restrict_specific_distances(Vars, Board_Size, Row_Restrictions, Column_Restrictions), 
    labeling([], Vars),
    print_solution(Board_Size, Vars, Row_Restrictions, Column_Restrictions),
    press_any_button,
    main_menu.

/**  gets all vars needed acording to the board size.
 *  As we can only have 2 squares per row, vars represents the column of the black squares.
 *  The row can be calculated by the postion in the Vars vetor
 */
get_vars_list(Board_Size, Vars) :-
    Board_Squares is Board_Size * 2, % size of the vector vars
    length(Vars, Board_Squares),
    domain(Vars, 1, Board_Size). % vars can only be between 1 and the board size

/**
 * makes sure there are only two black squares per column (and row indirectly)
 */
restrict_cardinality(Board_Size, Vars) :-
    get_cardinality(Board_Size, [], List_Of_Cardinality),
    global_cardinality(Vars, List_Of_Cardinality).   

/**
 * gets the list of cardinality being applied. Every integer number in the domain [1, board_size], 
 * must appear twice.
 */
get_cardinality(0, List_Of_Cardinality, List_Of_Cardinality).
get_cardinality(Board_Size, List_Of_Cardinality, Final_List_Of_Cardinality) :-
    Board_Size1 is Board_Size  - 1,
    append([Board_Size-2], List_Of_Cardinality, List_Of_Cardinality1),
    get_cardinality(Board_Size1, List_Of_Cardinality1, Final_List_Of_Cardinality).

/**
 * Check if the squares don't touch each other, even at corners.
 * First predicate is used to all rows except the last.
 */
restrict_distances([C1, C2, C3, C4| Rest]) :-
    % check that C1 and C2 don't touch and C1 is lower than C2
    C1p1 #= C1 + 1, % position of the first square of the row plus 1
    C1s1 #= C1 - 1, % position of the first square of the next row plus 1
    C1p1 #< C2,     % check that C2 is greater than C1 and there is a space beetwen them
    C3 + 1 #< C4,     % check that C4 is greater than C3 and there is a space beetwen them
    (C1p1 #< C3 #\/ C1s1 #> C3),  % check that C1 and C3 are spaced
    (C1p1 #< C4 #\/ C1s1 #> C4), % check that C1 and C4 are spaced
    C2p1 #= C2 + 1,
    C2s1 #= C2 - 1,
    (C2p1 #< C3 #\/ C2s1 #> C3), % check that C2 and C3 are spaced
    (C2p1 #< C4 #\/ C2s1 #> C4), % check that C2 and C4 are spaced
    restrict_distances([C3, C4| Rest]).
    
% check the distance between the two elements of the last row
restrict_distances([C1, C2]) :-
    % check that C1 and C2 don't touch and C1 is lower than C2
    C1 + 1 #< C2.   % check that C2 is greater than C1 and there is a space beetwen them

restrict_specific_distances(Vars, Board_Size, Row_Restrictions, Column_Restrictions) :-
    restrict_specific_distances(Vars, Board_Size, [], [], Row_Restrictions, Column_Restrictions).

restrict_specific_distances(Vars, Board_Size, Row_Rest_Acc, Col_Rest_Acc, Row_Restrictions, Column_Restrictions) :- 
    get_user_option(Option),
    !, restrict_user_option(Option, Vars, Board_Size, Row_Rest_Acc, Col_Rest_Acc, Row_Restrictions, Column_Restrictions).

% Restrict Row
restrict_user_option(row, Vars, Board_Size, Row_Rest_Acc, Col_Rest_Acc, Row_Restrictions, Column_Restrictions) :-
    get_num_row(Num_Row, Board_Size, Row_Rest_Acc), !,
    get_distance(Distance, Board_Size),
    restrict_row_distance(1, Num_Row, Distance, Vars),
    append(Row_Rest_Acc, [Num_Row-Distance], New_Row_Acc),
    !, restrict_specific_distances(Vars, Board_Size, New_Row_Acc, Col_Rest_Acc, Row_Restrictions, Column_Restrictions).

% Restrict Column
restrict_user_option(column, Vars, Board_Size, Row_Rest_Acc, Col_Rest_Acc, Row_Restrictions, Column_Restrictions) :-
    get_num_column(Num_Column, Board_Size, Col_Rest_Acc), !,
    get_distance(Distance, Board_Size), 
    restrict_column_distance(1, Num_Column, Distance, Vars),
    append(Col_Rest_Acc, [Num_Column-Distance], New_Col_Acc),
    !, restrict_specific_distances(Vars, Board_Size, Row_Rest_Acc, New_Col_Acc, Row_Restrictions, Column_Restrictions).

restrict_user_option(stop, _Vars, _Board_Size, Row_Rest_Acc, Col_Rest_Acc, Row_Rest_Acc, Col_Rest_Acc) :- !.

get_user_option(Option) :-
    repeat, 
    ask_row_or_column(Option),
    valid_user_option(Option).

get_num_row(Num_Row, Board_Size, Row_Restrictions) :-
    repeat,
    ask_which_row(Num_Row),
    valid_coord(Num_Row, Board_Size),
    valid_restriction(Num_Row, Row_Restrictions).

get_num_column(Num_Column, Board_Size, Column_Restrictions) :-
    repeat,
    ask_which_column(Num_Column),
    valid_coord(Num_Column, Board_Size),
    valid_restriction(Num_Column, Column_Restrictions).

get_distance(Distance, Board_Size) :-
    repeat, 
    ask_distance(Distance),
    valid_distance(Distance, Board_Size).

% the user can only responde with 3 options
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

valid_restriction(_Num_Res, []).
valid_restriction(Num_Res, [Num_Res-_Distance|_Rest]) :-
    invalid_restriction, !, fail.

valid_restriction(Num_Res, [_Num-_Distance|Rest]) :-
    valid_restriction(Num_Res, Rest).

valid_distance(Distance, Board_Size) :-
    Distance >= 1,
    Max_Distance is Board_Size - 2,
    Distance =< Max_Distance.

valid_distance(_Distance, _Board_Size) :-
    invalid_distance, fail.

restrict_row_distance( _Show_error_message, Row, Row_Value, Vars) :-
    % check if the indicated row have the rigth spacing between the 2 black squares
    Index2 is Row * 2 ,
    Index1 is Index2 - 1, % subtract operation are faster than multiplication ones
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
    get_vars_list(Board_Size, Vars),  
    restrict_cardinality(Board_Size, Vars),
    restrict_distances(Vars),
    Number_of_Restrictions is Board_Size//40 + 1,
    repeat, % if we can't solve this problem he have to generate other constrains
    generate_restrict_column_distance(Number_of_Restrictions, Board_Size, Vars, [], Column_Restrictions),
    generate_restrict_row_distance(Number_of_Restrictions, Board_Size, Vars, [], Row_Restrictions),
    labeling([], Vars),
    print_unsolved_puzzle(Board_Size, Row_Restrictions, Column_Restrictions),
    press_any_button,
    main_menu.

generate_restrict_column_distance(0, _Board_Size, _Vars, Column_Restrictions, Column_Restrictions).
generate_restrict_column_distance(Restriction_Left, Board_Size, Vars, Col_Acc, Column_Restrictions) :-
    Restriction_Left > 0,
    % number of the column where the restriction will exists
    random(1, Board_Size, Column),
    % even if 2 squares are in the maximum distance, that distante is (Board_Size - 2)
    Max_Distance is (Board_Size - 2),
    % distance betwwn the 2 squares in the same column
    random(1, Max_Distance, Column_Value),
    restrict_column_distance(0, Column, Column_Value, Vars), 
    append(Col_Acc, [Column-Column_Value], New_Column_Restrictions),
    Restriction_Next_Left is Restriction_Left - 1,
    generate_restrict_column_distance(Restriction_Next_Left, Board_Size, Vars, New_Column_Restrictions, Column_Restrictions).

generate_restrict_row_distance(0, _Board_Size, _Vars, Row_Restrictions, Row_Restrictions).
generate_restrict_row_distance(Restriction_Left, Board_Size, Vars, Row_Acc, Row_Restrictions) :-
    Restriction_Left > 0,
    % number of the row where the restriction will exist
    random(1, Board_Size, Row),
    % even if 2 squares are in the maximum distance, that distante is (Board_Size - 2)
    Distance is (Board_Size - 2),
    % distance between the 2 squares in the same row
    random(1, Distance, Row_Value),
    restrict_row_distance(0, Row, Row_Value, Vars),
    append(Row_Acc, [Row-Row_Value], New_Row_Restrictions),
    Restriction_Next_Left is Restriction_Left - 1,
    generate_restrict_row_distance(Restriction_Next_Left, Board_Size, Vars, New_Row_Restrictions, Row_Restrictions).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           time measure and puzzzle analyse
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% measure time with one restriction in column and row only
time(Board_Size, Column, Column_Value, Row, Row_Value) :-   
    statistics(runtime, _),
    get_vars_list(Board_Size, Vars),  
    restrict_cardinality(Board_Size, Vars),
    restrict_distances(Vars),
    restrict_column_distance(0, Column, Column_Value, Vars), 
    restrict_row_distance(0, Row, Row_Value, Vars),
    write('Backtracking'), % analyse if backtracking exists (once is always print)
    labeling([], Vars),
    statistics(runtime, X),
    %  print_solution(Board_Size, Vars, Row_Restrictions, Column_Restrictions),
    % Helena's Path
    % open('C:\\Users\\ferre\\Desktop\\3ano\\feup-plog\\Project2\\times.txt', append, C),
    % Gaspar's Path
    % open('C:\\Users\\pasga\\OneDrive - Universidade do Porto\\FEUP\\3rdYear\\PLOG\\feup-plog\\Project2\\times.txt', append, C),
    % set_output(C), % set output to write on the file and not in the console
    write(X), write('ms\n'),
   % statistics, 
    told. %write

% measure time with one restriction in a column and two restriction in a row
time(Board_Size, Column, Column_Value, Row, Row_Value, Row1, Row1_Value) :-   
    statistics(runtime, _),
    get_vars_list(Board_Size, Vars),  
    restrict_cardinality(Board_Size, Vars),
    restrict_distances(Vars),
    restrict_column_distance(0, Column, Column_Value, Vars), 
    restrict_row_distance(0, Row, Row_Value, Vars),
    restrict_row_distance(0, Row1, Row1_Value, Vars),
    write('Backtracking'), % analyse if backtracking exists (once is always print)
    labeling([], Vars),
    statistics(runtime, X),
    %  print_solution(Board_Size, Vars, Row_Restrictions, Column_Restrictions),
    % Helena's Path
    % open('C:\\Users\\ferre\\Desktop\\3ano\\feup-plog\\Project2\\times.txt', append, C),
    % Gaspar's Path
    % open('C:\\Users\\pasga\\OneDrive - Universidade do Porto\\FEUP\\3rdYear\\PLOG\\feup-plog\\Project2\\times.txt', append, C),
    % set_output(C), % set output to write on the file and not in the console
    write(X), write('ms\n'),
    % statistics, 
    told. %write

% measure time with one restriction in a column and three restriction in a row
time(Board_Size, Column, Column_Value, Row, Row_Value, Row1, Row1_Value, Row2, Row2_Value) :-   
    statistics(runtime, _),
    get_vars_list(Board_Size, Vars),  
    restrict_cardinality(Board_Size, Vars),
    restrict_distances(Vars),
    restrict_column_distance(0, Column, Column_Value, Vars), 
    restrict_row_distance(0, Row, Row_Value, Vars),
    restrict_row_distance(0, Row1, Row1_Value, Vars),
    restrict_row_distance(0, Row2, Row2_Value, Vars),
    write('Backtracking'), % analyse if backtracking exists (once is always print)
    labeling([], Vars),
    statistics(runtime, X),
    %  print_solution(Board_Size, Vars, Row_Restrictions, Column_Restrictions),
    % Helena's Path
    % open('C:\\Users\\ferre\\Desktop\\3ano\\feup-plog\\Project2\\times.txt', append, C),
    % Gaspar's Path
    % open('C:\\Users\\pasga\\OneDrive - Universidade do Porto\\FEUP\\3rdYear\\PLOG\\feup-plog\\Project2\\times.txt', append, C),
    % set_output(C), % set output to write on the file and not in the console
    write(X), write('ms\n'),
    % statistics, 
    told. %write