
automaton_nxn(Board_Size, Column_Constraints, Row_Constraints, Options) :-   
    get_vars_matrix(Board_Size, 0, Vars),
    constrain_columns(Vars, Board_Size, Column_Constraints, 1),
    constrain_rows(Vars, Board_Size, Row_Constraints, 1),
    append_vars(Vars, [], Final_Vars),
    labeling(Options, Final_Vars).
    % show_board_matrix(Vars).

constrain_columns(_Vars, Board_Size, _Col_Constraints, Board_Size).
constrain_columns(Vars, Board_Size, Col_Constraints, Num_Col) :-
    get_column_tuple(Vars, Board_Size, Num_Col, Tuple1),
    Num_Col1 is Num_Col + 1,
    get_column_tuple(Vars, Board_Size, Num_Col1, Tuple2),
    constrain_tuples(Tuple1, Tuple2),
    check_specific_constraint(Num_Col, Col_Constraints, New_Col_Constraints, Tuple1),
    check_specific_constraint(Num_Col1, New_Col_Constraints, New_Col_Constraints1, Tuple2),
    constrain_columns(Vars, Board_Size, New_Col_Constraints1, Num_Col1).

constrain_rows(_Vars, Board_Size, _Row_Contraint, Num_Row):-
    Num_Row is Board_Size - 1.

constrain_rows(Vars, Board_Size, Row_Contraints, Num_Row) :-
    get_row_tuple(Vars, Num_Row, Tuple1),
    check_specific_constraint(Num_Row, Row_Contraints, New_Row_Contraints, Tuple1),
    Num_Row1 is Num_Row + 1,
    get_row_tuple(Vars, Num_Row1, Tuple2),
    check_specific_constraint(Num_Row1, New_Row_Contraints, New_Row_Contraints1, Tuple2),
    constrain_tuples(Tuple1, Tuple2),
    constrain_rows(Vars, Board_Size, New_Row_Contraints1, Num_Row1).

get_column_tuple(Vars, Board_Size, Num_Col, Tuple) :-
    get_column(Vars, Board_Size, Num_Col, 1, Column),
    constrain_automaton(Column, Tuple).
    
get_row_tuple(Vars, Num_Row, Tuple) :-
    get_row(Vars, Num_Row, Row),
    constrain_automaton(Row, Tuple).

get_column(_Vars, Board_Size, _Num_Col, Num_Row, []) :-
    Num_Row is Board_Size + 1.

get_column(Vars, Board_Size, Num_Col, Num_Row, [M|R]) :-
    get_row(Vars, Num_Row, Row),
    element(Num_Col, Row, M),
    Num_Row1 is Num_Row + 1,
    get_column(Vars, Board_Size, Num_Col, Num_Row1, R).

get_row(Vars, Num_Row, Row) :-
    nth1(Num_Row, Vars, Row).

constrain_automaton(Row, [Af, Mf, Df]) :-
    automaton(Row, _, Row,
        [ source(a), sink(d)],
        [ arc(a, 0, a, [A+1, M, D]), arc(a, 1, b),
          arc(b, 0, c),  
          arc(c, 0, c, [A, M+1, D]), arc(c, 1, d),
          arc(d, 0, d, [A, M, D+1])
        ],
        [A, M, D],
        [0, 1, 0],
        [Af, Mf, Df]).

check_specific_constraint(Coord, [Coord-Distance|Rest], Rest, [_A, M, _D]) :-
    M #= Distance.

check_specific_constraint(_, Constraints, Constraints, _).

constrain_tuples([A1, _M1, D1], [A2, _M2, D2]) :-
    contrain_line_distance(A1, A2),
    contrain_line_distance(D1, D2).

contrain_line_distance(Dist1, Dist2) :-
    abs(Dist1 - Dist2) #> 1.



