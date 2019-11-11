

choose_move(Board, White_Pieces, Brown_Pieces, Level, Move, Player, _Show_Error_Message) :-
    valid_moves(Level, Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves),
    get_move(Level, List_Of_Moves, Move).

valid_moves(1, Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves) :-
    setof(Move, valid_move(0, Move, Player, Board, White_Pieces, Brown_Pieces), List_Of_Moves).

valid_moves(Level, Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves) :-
    setof([Value|Move], (valid_move(0, Move, Player, Board, White_Pieces, Brown_Pieces), calc_value(Level, Board, Player, Move, White_Pieces, Brown_Pieces, Value)), List_Of_Moves).

valid_moves(_Level, _Board, _White_Pieces, _Brown_Pieces, _Player, _List_Of_Moves, 1) :-
    no_more_moves_message,
    get_interaction,
    play.

% Level 1 - Selects a random move
get_move(1, List_Of_Moves, Move) :-
    random_member(Move, List_Of_Moves).

% Level 2/3 - Selects best move based on value 
get_move(_Level, List_Of_Moves, Move) :-
    get_best_move(List_Of_Moves, Move).

get_best_move(List_Of_Moves, [Row, Column, Piece]) :-
    nth0(0, List_Of_Moves, First_Move),
    First_Move = [0, _Row, _Column, _Piece],
    random_member([0, Row, Column, Piece], List_Of_Moves).

get_best_move([[_Value|Move]|_Rest], Move).

calc_value(Level, Board, Player, Move, White_Pieces, Brown_Pieces, Value) :-
    move_piece(Move, Board, New_Board),
    remove_piece(Move, Player, White_Pieces, Brown_Pieces, New_White_Pieces, New_Brown_Pieces),
    value(Level, New_Board, Player, Move, New_White_Pieces, New_Brown_Pieces, Value).

% If Board is in a win state -> value = -10.
value(_Level, Board, _Player, Move, _White_Pieces, _Brown_Pieces, -10) :-
    not(game_over(0, Board, _Player, Move, _White_Pieces, _Brown_Pieces, _Mode)).

% If There is a winning play for the other player -> value = 10.
value(_Level, Board, Player, _Move, White_Pieces, Brown_Pieces, 10) :- 
    change_player(1, Player, New_Player),
    setof(Move, (valid_move(0, Move, New_Player, Board, White_Pieces, Brown_Pieces), not(game_over(0, Board, _New_Player, Move, _White_Pieces, _Brown_Pieces, _Mode))), _List_Of_Moves).

% if we can win in the next play with a move that the adversersay can't make
value(_Level, Board, Player, _Move, White_Pieces, Brown_Pieces, -8) :-
    setof(Move, (valid_move(0, Move, Player, Board, White_Pieces, Brown_Pieces), not(game_over(0, Board, _Player, Move, _White_Pieces, _Brown_Pieces, _Mode))), _List_Of_Moves).

% ------ SECOND LEVEL OF PLAYS ------
% if we can win in two moves and the other can't win in between plays
value(3, Board, Player, _Move, White_Pieces, Brown_Pieces, -6) :-
    write('\nCalculating value on a dificulty of level 3\n'),
    choose_move(Board, White_Pieces, Brown_Pieces, 2, Move, Player),
    not(game_over(0, Board, _Player, Move, _White_Pieces, _Brown_Pieces, _Mode)).

value(_Level, _Board, _Player, _Move, _White_Pieces, _Brown_Pieces, 0).

not(X) :- X, !, fail.
not(_X).
