

choose_move(Board, White_Pieces, Brown_Pieces, Level, Move, Player) :-
    valid_moves(Level, Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves),
    get_move(Level, List_Of_Moves, Player, Board, Move).

valid_moves(1, Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves) :-
    setof(Move, valid_move(0, Move, Player, Board, White_Pieces, Brown_Pieces), List_Of_Moves).

valid_moves(2, Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves) :-
    setof([Value|Move], (valid_move(0, Move, Player, Board, White_Pieces, Brown_Pieces), calc_value(Board, Player, Move,White_Pieces, Brown_Pieces, Value)), List_Of_Moves).

% Level 1 - Selects a random move
get_move(1, List_Of_Moves, _Player, _Board, Move) :-
    random_member(Move, List_Of_Moves).

% Level 2 - Selects best move based on value 
get_move(2, List_Of_Moves, _Player, _Board, Move) :-
    get_best_move(List_Of_Moves, Move).

get_best_move(List_Of_Moves, Move) :-
    List_Of_Moves = [[0|_Move]|_Rest],
    random_member([0|Move], List_Of_Moves).

get_best_move([[_Value|Move]|_Rest], Move).

calc_value(Board, Player, Move, White_Pieces, Brown_Pieces, Value) :-
    move_piece(Move, Board, New_Board),
    value(New_Board, Player, Move, White_Pieces, Brown_Pieces, Value).

% If Board is in a win state -> value = 10.
value(Board, Player, Move, White_Pieces, Brown_Pieces, -10) :-
    not(game_over(0, Board, Player, Move, White_Pieces, Brown_Pieces)).

% If There is a winning play for the other player -> value = -10.
value(Board, Player, _Move, White_Pieces, Brown_Pieces, 10) :- 
    change_player(1, Player, New_Player),
    setof(Move, (valid_move(0, Move, New_Player, Board, White_Pieces, Brown_Pieces), game_over(0, Board, New_Player, Move, White_Pieces, Brown_Pieces)), _List_Of_Moves).

% if we can win in the next play with a play we can't make
value(Board, Player, _Move, White_Pieces, Brown_Pieces, -8) :-
    setof(Move, (valid_move(0, Move, Player, Board, White_Pieces, Brown_Pieces), game_over(0, Board, Player, Move, White_Pieces, Brown_Pieces)), _List_Of_Moves).

% if we can win in two moves ad the other can win between
% value(Board, Player, _Move, 7). % TODO

value(_Board, _Player, _Move, _White_Pieces, _Brown_Pieces, 0).

not(X) :- X, !, fail.
not(_X).
