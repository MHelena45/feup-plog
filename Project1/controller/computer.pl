:- use_module(library(random)).
:- use_module(library(lists)).

choose_move(Board, White_Pieces, Brown_Pieces, Level, Move, Player) :-
    valid_moves(Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves),
    get_move(Level, List_Of_Moves, Player, Board, Move).

valid_moves(Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves) :-
    % find all not working TODO: fix it!
    findall(Move, valid_move(Move, Player, Board, White_Pieces, Brown_Pieces), List_Of_Moves).

% Level 1 - Selects a random move
get_move(1, List_Of_Moves, _Player, _Board, Move) :-
    random_member(Move, List_Of_Moves).

% Level 2 - Selects best move based on value 
get_move(2, List_Of_Moves, Player, Board, Move) :-
    calculate_values(List_Of_Moves, Player, Board, Result), % result = List of [Move|Value]
    get_best_move(Result, Move).

calculate_values([], _Player, _Board, []).
calculate_values([Move|Rest], Player, Board, [[Move| Value]| More]) :-
    move(Move, Board, New_Board),
    value(New_Board, Player, Value),
    calculate_values(Rest, Player, Board, More).

get_best_move(Result, Move).
% TODO: best way to get the highest value in result

value(Board, Player, Value).
% TODO: get conditions that have a certain value, eg:
% If Board is in a win state -> value = 10.
% If There is a Row, Column or Square with 3 diferent pieces -> value = -10.
