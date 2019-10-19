:- include('printer.pl').

initBoard([
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty]
    ]).

midBoard([
    [sphere_white, empty, empty, cylinder_white],
    [cube_brown, empty, empty, empty],
    [empty, cube_white, cone_brown, empty],
    [empty, empty, empty, cube_brown]
    ]).


finBoard([
    [sphere_white, empty, empty, cylinder_white],
    [cube_brown, cylinder_white, empty,cone_white],
    [empty, cube_white, cone_brown, sphere_brown],
    [empty, empty, empty, cube_brown]
    ]).

:- (dynamic board/1).
board([
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty]
    ]).

start :- 
    initBoard(X), 
    display_game(X).

% Indicates which player has the next turn (1  || 2)
:- (dynamic nextPlayer/1).
nextPlayer(1).

play :-
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
    display_game(Y),
    set_next_player(P).

/** 
 * set_next_player(+Player)
 */ 
set_next_player(1):-
    assert(nextPlayer(2)).

set_next_player(2):-
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
