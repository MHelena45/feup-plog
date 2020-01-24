:-use_module(library(clpfd)).
:- include('menu.pl').
:- include('solution_printer.pl').
:- include('user_interactions.pl').

abordagem(Board_Size, Column, Column_Value, Row, Row_Value) :-   
    NumberOfVars is Board_Size * Board_Size,
    length(Vars, NumberOfVars),
    domain(Vars, 0, 1),
    constrain_board(Vars, Board_Size, [Row-Row_Value], 0),
    column_constraint(Vars, Column, Column_Value, Board_Size),
    labeling([], Vars), 
    % show
    nl,
    show_board(Vars, Board_Size, Board_Size).

constrain_board(_Vars, Board_Size, _Row_Contraint, Num_Row):-
    Num_Row is Board_Size - 1.

constrain_board(Vars, Board_Size, Row_Contraint, Num_Row) :-
    get_row_tuple(Vars, Board_Size, Num_Row, Tuple1),
    check_row_constraint(Num_Row, Row_Contraint, Tuple1),
    Num_Row1 is Num_Row + 1,
    get_row_tuple(Vars, Board_Size, Num_Row1, Tuple2),
    check_row_constraint(Num_Row1, Row_Contraint, Tuple2),
    constrain_tuples(Tuple1, Tuple2),
    constrain_board(Vars, Board_Size, Row_Contraint, Num_Row1).
    
get_row_tuple(Vars, Board_Size, Num_Row, Tuple) :-
    get_row(Vars, Board_Size, Num_Row, Row),
    constrain_row(Row, Tuple).

get_row(Vars, Board_Size, Num_Row, Row) :-
    Vars_Row_Index is Num_Row * Board_Size,
    get_row_vars(Vars, Vars_Row_Index, 0, Row_Vars),
    get_row_elems(Row_Vars, Board_Size, Row, 0).

get_row_vars(Rest, Counter, Counter, Rest).
get_row_vars([_M|R1], Vars_Row_Index, Counter, Row_Vars) :-
    Counter1 is Counter + 1,
    get_row_vars(R1, Vars_Row_Index, Counter1, Row_Vars).

get_row_elems(_, Board_Size, [], Board_Size).
get_row_elems([M|R1], Board_Size, [M|R2], Num_Col) :-
    Num_Col1 is Num_Col + 1,
    get_row_elems(R1, Board_Size, R2, Num_Col1).

constrain_row(Row, [Af, Mf, Df]) :-
    automaton(Row, _, Row,
        [ source(s), sink(f)],
        [ arc(s, 0, s, [A+1, M, D]), arc(s, 1, i), 
          arc(i, 0, i, [A, M+1, D]), arc(i, 1, f),
          arc(f, 0, f, [A, M, D+1])
        ],
        [A, M, D],
        [0, 0, 0],
        [Af, Mf, Df]),
    Mf #> 0.

column_constraint(Vars, Column, Column_Value, Board_Size) :-
    element(N, Vars, 1),
    element(N1, Vars, 1),
    %  X in 1..Board_Size,
    %   N #= Column + (Board_Size * (X-1)),
    (N mod Board_Size) #= Column,
    Distance is (Column_Value + 1) * Board_Size,
    sum([N1, Distance], #=, N).

check_row_constraint(Row_Index, [Num_Row-Distance], [_A, M, _D]) :-
    Num_Row is Row_Index + 1,
    M #= Distance.

check_row_constraint(_, _, _).

constrain_tuples(Tuple1, Tuple2).

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


