:- include('printer.pl').

:- (dynamic board/1).
board([
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty]
    ]).

start :- 
    board(X), 
    display_game(X).

% Indicates which player has the next turn (1 || 2)
:- (dynamic nextPlayer/1).
nextPlayer(1).

/**
 * Clears everyThing done before, to torn the code more 
 * a game style
 */  
clearEverything :-
    write('\33\[2J').

/**
 * asks the play what we wants to play, and puts it on the board
 */
play(P) :-
    nextPlayer(P),
    board(X),
    write('What piece do you want to play?\n '),
    read(Piece), 
    write('In which row?\n'),
    read(Row), 
    write('In which collumn?\n'),
    read(Column),
    playPiece(Row, Column, Piece, X, Y),
    assert(board(Y)),
    clearEverything,
    display_game(Y),
    set_next_player(P).

/**
 * game with only two players
 * set_next_player(current Player)
 * sets the other play the current player that can play
 */ 
set_next_player(1) :-
    assert(nextPlayer(2)).

set_next_player(2) :-
    assert(nextPlayer(1)).

playPiece(Row, Column, Piece, TabIn, TabOut) :-
   updateRow(Row, Column, Piece, TabIn, TabOut).

updateRow(1, Column, Piece, [Row| More], [NewRow| More]):-
    updateColumn(Column, Piece, Row, NewRow).

updateRow(N, Column, Piece, [Row| More], [Row| MoreRows]) :-
    N > 1, Next is N-1, updateRow(Next, Column, Piece, More, MoreRows).

updateColumn(1, Piece, [_ | Rest], [Piece | Rest]).

updateColumn(N, Piece, [P | Rest], [P| More]) :-
    N>1, Next is N-1, updateColumn(Next, Piece, Rest, More).
