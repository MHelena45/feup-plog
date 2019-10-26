:- include('printer.pl').
:- include('dataStructs.pl').

start :- 
    board(X), 
    whitePieces(W),
    brownPieces(B),
    display_game(X, W, B),
    play(1, X, W, B).

% check if row and Column are valid(between 1 and 4 inclusive)
checkPosition(Pos):-
    Pos < 5,
    Pos > 0.

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
    repeat,
    write('.\nWhat piece do you want to play?\n '),
    read(Piece), 
    % check Piece
    translate(ColorPiece, Piece, P),
    repeat, % if the player inserts a invalid row, ask the row again
    write('In which row?\n'),
    read(Row), 
    checkPosition(Row),
    repeat, % if the player inserts a invalid column, ask the column again
    write('In which collumn?\n'),
    read(Column),
    checkPosition(Column),
    !.

/**
 * given the number of the player, plays the piece the player want
 */
play(P,X, W, B) :-
    repeat,
    getPlay(Piece, Row, Column, 1),
    % valid_move
    playPiece(Row, Column, Piece, X, Y),    
    clearEverything,
    display_game(Y, W, B),
    %checkEnd
    NP is ((P+1)mod 2), % chnges player
    play(NP, Y, W, B).  % changes current board

% white pieces
translate(91, sphere , 1).
translate(71, cylinder, 1).
translate(51, cube, 1).
translate(11, cone, 1).

% brown pieces
translate(92, sphere , 2).
translate(72, cylinder, 2).
translate(52, cube, 2).
translate(12, cone, 2).

playPiece(Row, Column, Piece, TabIn, TabOut) :-
   updateRow(Row, Column, Piece, TabIn, TabOut).

updateRow(1, Column, Piece, [Row| More], [NewRow| More]):-
    updateColumn(Column, Piece, Row, NewRow).

updateRow(N, Column, Piece, [Row| More], [Row| MoreRows]) :-
    N > 1, Next is N-1, updateRow(Next, Column, Piece, More, MoreRows).

updateColumn(1, Piece, [_ | Rest], [Piece | Rest]).

updateColumn(N, Piece, [P | Rest], [P| More]) :-
    N>1, Next is N-1, updateColumn(Next, Piece, Rest, More).
