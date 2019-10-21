:- include('printer.pl').

board([
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty]
    ]).

start :- 
    board(X), 
    display_game(X),
    play(1, X).

/**
 * Clears everyThing done before, to torn the code more 
 * a game style
 */  
clearEverything :-
    write('\33\[2J').

writeColor(1):-
    write('white').

writeColor(2):-
    write('brown').   

/**
 * asks the play what we wants to play
 */
getPlay(ColorPiece, Row, Column, P):-
    write('\nPlayer '),
    write(P),
    write(' is your turn!\nYour pieces are '),
    writeColor(P),
    write('\nWhat piece do you want to play?\n '),
    read(Piece), 
    translate(ColorPiece, Piece, P),
    write('In which row?\n'),
    read(Row), 
    write('In which collumn?\n'),
    read(Column).

/**
 * given the number of the player, plays the piece the player want
 */
play(P,X) :-
    getPlay(Piece, Row, Column, 1),
    playPiece(Row, Column, Piece, X, Y),
    clearEverything,
    display_game(Y),
    NP is ((P+1)mod 2),
    play(NP, Y).

% white pieces
translate(sphere_white, sphere , 1).
translate(cylinder_white, cylinder, 1).
translate(cube_white, cube, 1).
translate(cone_white, cone, 1).

% white pieces
translate(sphere_brown, sphere , 2).
translate(cylinder_brown, cylinder, 2).
translate(cube_brown, cube, 2).
translate(cone_brown, cone, 2).

playPiece(Row, Column, Piece, TabIn, TabOut) :-
   updateRow(Row, Column, Piece, TabIn, TabOut).

updateRow(1, Column, Piece, [Row| More], [NewRow| More]):-
    updateColumn(Column, Piece, Row, NewRow).

updateRow(N, Column, Piece, [Row| More], [Row| MoreRows]) :-
    N > 1, Next is N-1, updateRow(Next, Column, Piece, More, MoreRows).

updateColumn(1, Piece, [_ | Rest], [Piece | Rest]).

updateColumn(N, Piece, [P | Rest], [P| More]) :-
    N>1, Next is N-1, updateColumn(Next, Piece, Rest, More).
