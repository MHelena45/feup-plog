:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- include('util.pl').

abordagem(Board_Size, Column, Column_Value, Row, Row_Value) :-   
    get_vars(Board_Size, 0, Vars),
    constrain_columns(Vars, Board_Size, [Column-Column_Value], 1),
    constrain_rows(Vars, Board_Size, [Row-Row_Value], 1),
    write('Back'), nl,
    append_vars(Vars, [], Final_Vars),
    labeling([], Final_Vars), 
    % show
    nl,
    show_board(Vars).

constrain_columns(_Vars, Board_Size, _Col_Constraint, Board_Size).
constrain_columns(Vars, Board_Size, Col_Constraint, Num_Col) :-
    get_column_tuple(Vars, Board_Size, Num_Col, Tuple1),
    check_specific_constraint(Num_Col, Col_Constraint, Tuple1),
    Num_Col1 is Num_Col + 1,
    get_column_tuple(Vars, Board_Size, Num_Col1, Tuple2),
    check_specific_constraint(Num_Col1, Col_Constraint, Tuple2),
    constrain_tuples(Tuple1, Tuple2),
    constrain_columns(Vars, Board_Size, Col_Constraint, Num_Col1).

constrain_rows(_Vars, Board_Size, _Row_Contraint, Num_Row):-
    Num_Row is Board_Size - 1.

constrain_rows(Vars, Board_Size, Row_Contraint, Num_Row) :-
    get_row_tuple(Vars, Num_Row, Tuple1),
    check_specific_constraint(Num_Row, Row_Contraint, Tuple1),
    Num_Row1 is Num_Row + 1,
    get_row_tuple(Vars, Num_Row1, Tuple2),
    check_specific_constraint(Num_Row1, Row_Contraint, Tuple2),
    constrain_tuples(Tuple1, Tuple2),
    constrain_rows(Vars, Board_Size, Row_Contraint, Num_Row1).

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

check_specific_constraint(Coord, [Coord-Distance], [_A, M, _D]) :-
    M #= Distance.

check_specific_constraint(_, _, _).

constrain_tuples([A1, _M1, D1], [A2, _M2, D2]) :-
    contrain_line_distance(A1, A2),
    contrain_line_distance(D1, D2).

contrain_line_distance(Dist1, Dist2) :-
    abs(Dist1 - Dist2) #> 1.


