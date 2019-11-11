:- use_module(library(random)).
:- use_module(library(lists)).

choose_move(Board, White_Pieces, Brown_Pieces, Level, Move, Player) :-
    valid_moves(Level, Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves),
    get_move(Level, List_Of_Moves, Player, Board, Move).

valid_moves(1, Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves) :-
    setof(Move, valid_move(0, Move, Player, Board, White_Pieces, Brown_Pieces), List_Of_Moves).

valid_moves(2, Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves) :-
    setof([Move|Value], valid_move(0, Move, Player, Board, White_Pieces, Brown_Pieces), calc_value(Board, Player, Move, Value), List_Of_Moves).

% Level 1 - Selects a random move
get_move(1, List_Of_Moves, _Player, _Board, Move) :-
    random_member(Move, List_Of_Moves).

% Level 2 - Selects best move based on value 
get_move(2, List_Of_Moves, Player, Board, Move) :-
    get_best_move(List_Of_Moves, Move).

get_best_move(List_Of_Moves, Move) :-
    


calc_value(Board, Player, Move, Value) :-
    move(Move, Board, New_Board),
    value(New_Board, Player, Value).

% TODO: get conditions that have a certain value, eg:
% If Board is in a win state -> value = 10.
% If There is a Row, Column or Square with 3 diferent pieces -> value = -10.
value(Board, Player, Value).
