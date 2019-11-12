

choose_move(Board, White_Pieces, Brown_Pieces, Level, Move, Player, _Show_Error_Message) :-
    valid_moves(Level, Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves),
    get_move(Level, List_Of_Moves, Move).

valid_moves(1, Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves) :-
    getPiecesAvailable( White_Pieces, Brown_Pieces, New_White_Pieces, New_Brown_Pieces),
    setof(Move, valid_move(0, Move, Player, Board, New_White_Pieces, New_Brown_Pieces), List_Of_Moves),
    sleep(1).

% return in List_of_Moves only best plays at the moment
valid_moves(Level, Board, White_Pieces, Brown_Pieces, Player, List_Of_Moves ) :-
    getPiecesAvailable( White_Pieces, Brown_Pieces, New_White_Pieces, New_Brown_Pieces),
    setof([Value|Move], (valid_move(0, Move, Player, Board, New_White_Pieces, New_Brown_Pieces), 
        calc_value(Level, Board, Player, Move, New_White_Pieces, New_Brown_Pieces, Value)), Value_List_Of_Moves),
    nth0(0, Value_List_Of_Moves, [Value | _One_Most_Value_Move]),   % gets the lowest value of the game
    setof(Move1, member([Value | Move1], Value_List_Of_Moves), List_Of_Moves).

valid_moves(_Level, _Board, _White_Pieces, _Brown_Pieces, _Player, _List_Of_Moves, 1) :-
    no_more_moves_message,
    get_interaction,
    play.

get_move(_Level, List_Of_Moves, Move) :-
    random_member(Move, List_Of_Moves).

calc_value(Level, Board, Player, Move, White_Pieces, Brown_Pieces, Value) :-
    move_piece(Move, Board, New_Board),
    remove_piece(Move, Player, White_Pieces, Brown_Pieces, New_White_Pieces, New_Brown_Pieces),
    value(Level, New_Board, Player, Move, New_White_Pieces, New_Brown_Pieces, Value).

% ------ SECOND LEVEL PLAYS ------
% If Board is in a win state -> value = -66.
value(_Level, Board, _Player, Move, _White_Pieces, _Brown_Pieces, -66) :-
    not(game_over(0, Board, _Player, Move, _White_Pieces, _Brown_Pieces, _Mode)).

% If There is a winning play for the other player -> value = 10.
/*value(_Level, Board, Player, _Move, White_Pieces, Brown_Pieces, 10) :- 
    change_player(1, Player, New_Player),
    setof(Move, (valid_move(0, Move, New_Player, Board, White_Pieces, Brown_Pieces),
        move_piece(Move, Board, New_Board),
        not(game_over(0, New_Board, _New_Player, Move, _White_Pieces, _Brown_Pieces, _Mode))), _List_Of_Moves). 
*/
% if we can win in the next play with a move that the adversersay can't make
value(_Level, Board, Player, _Move, White_Pieces, Brown_Pieces, -65) :-
    change_player(1, Player, New_Player),   % gets the number of the other Player
    setof([Row, Column, Piece], (valid_move(0, [Row, Column, Piece], Player, Board, White_Pieces, Brown_Pieces),
        get_opposite(Other_Piece, Piece),
        not(valid_move(0, [Row, Column, Other_Piece], New_Player, Board, White_Pieces, Brown_Pieces)),
        move_piece([Row, Column, Piece], Board, New_Board),  
        not(game_over(0, New_Board, _Player, [Row, Column, Piece], _White_Pieces, _Brown_Pieces, _Mode))), _List_Of_Moves).

% ------ THIRD LEVEL PLAYS ------
/* if the play reduces the number of plays of the other Player, the piece
    is a row, column ou square where the plays hasn't already play */
value(3, Board, Player, _Move, White_Pieces, Brown_Pieces, Value) :-
    change_player(1, Player, New_Player),
    % checks if the play doesn't give the opposite the win
    not(setof(Move, (valid_move(0, Move, New_Player, Board, White_Pieces, Brown_Pieces),
        move_piece(Move, Board, New_Board),
        not(game_over(0, New_Board, _New_Player, Move, _White_Pieces, _Brown_Pieces, _Mode))), _List_Of_Moves)),
    setof(Move, valid_move(0, Move, New_Player, Board, White_Pieces, Brown_Pieces), List_Of_Moves),
    length(List_Of_Moves, Length),  % if the number of plays of the other player is reduce then the value is greater to us
    Value is -64 + Length.
    
% only in level two are plays that can have no value
% because level 1 doesn't evaluate the plays and level 3 evaluates all plays in the condition above
value(2, _Board, _Player, _Move, _White_Pieces, _Brown_Pieces, 0) :-
    % checks if the play doesn't give the opposite the win
    not(setof(Move, (valid_move(0, Move, New_Player, Board, White_Pieces, Brown_Pieces),
        move_piece(Move, Board, New_Board),
        not(game_over(0, New_Board, _New_Player, Move, _White_Pieces, _Brown_Pieces, _Mode))), _List_Of_Moves)).

not(X) :- X, !, fail.
not(_X).


% ======================================================================
% ----------------------- Get Pieces Available -------------------------
% ======================================================================
/**
 * getPiecesAvailable is used to get only the Pieces we can play, no pieces equal to 0 and no duplicate pieces.
 * This functions were created to improve the efficiency of the computer plays
 */
% remove dups and 0's from the Pieces
getPiecesAvailable( White_Pieces, Brown_Pieces, New_White_Pieces, New_Brown_Pieces) :-
    remove_dups(White_Pieces, White_Pieces1), % removes dups and all 0 execpt one
    select(0, White_Pieces1, New_White_Pieces), % remove last 0 remaining
    remove_dups( Brown_Pieces,  Brown_Pieces1), % removes dups and all 0 execpt one
    select(0,  Brown_Pieces1, New_Brown_Pieces). % remove last 0 remaining

% if there are no 0 just remove duplicated pieces
getPiecesAvailable( White_Pieces, Brown_Pieces, New_White_Pieces, New_Brown_Pieces) :-
    remove_dups(White_Pieces, New_White_Pieces), % removes dups and all 0 execpt one
    remove_dups( Brown_Pieces, New_Brown_Pieces). % removes dups and all 0 execpt one