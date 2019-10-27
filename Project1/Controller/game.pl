:- include('../Model/dataStructs.pl').
:- include('../View/boardPrinter.pl').
:- include('../View/userInteractions.pl').

start :- 
    board(Board), % Initialization of the board
    whitePieces(WhitePieces), % Initialization of the white pieces board
    brownPieces(BrownPieces), % Initialization of the brown pieces board
    displayGame(Board, WhitePieces, BrownPieces), % Displaying the main game & the available pieces
    play(1, Board, WhitePieces, BrownPieces). % Player 1 starts the game

 % Given the player, it plays the piece on the given position
play(Player, Board, WhitePieces, BrownPieces) :-
    repeat,
    getPlay(Piece, Row, Column, Player),
    isEmpty(Board,WhitePieces, BrownPieces, Row, Column, Player), 
    valid_move(Player, Board, WhitePieces, BrownPieces, Row, Column, Piece),
    playPiece(Row, Column, Piece, Board, NewBoard),
    removePiece(Piece, Player, WhitePieces, BrownPieces, NewWhitePieces, NewBrownPieces),  
    displayGame(NewBoard, NewWhitePieces, NewBrownPieces),
    % checkEnd
    changePlayer(Player, NewPlayer), % Changes current player
    play(NewPlayer, NewBoard, NewWhitePieces, NewBrownPieces).  % Changes current board

% ----------------------------- GET PLAY ------------------------------
% Gets the play from the player
getPlay(Piece, Row, Column, Player) :-
    greetPlayer(Player),
    getPiece(Piece, Player),
    getRow(Row),
    getColumn(Column).

getPiece(ColorPiece, Player) :-
    repeat, % If the player inserts an invalid piece, ask the piece again
    askPiece(Piece),
    checkPiece(Piece),
    translate(Piece, Player, ColorPiece).

getRow(Row) :-
    repeat, % If the player inserts an invalid row, ask the row again
    askRow(Row),
    checkPosition(Row).

getColumn(Column) :-
    repeat, % If the player inserts an invalid column, ask the column again
    askColumn(Column),
    checkPosition(Column).

% --------------------------- BOARD UPDATES -----------------------------
playPiece(Row, Column, Piece, TabIn, TabOut) :-
   updateRow(Row, Column, Piece, TabIn, TabOut).

updateRow(1, Column, Piece, [Row| More], [NewRow| More]):-
    updateColumn(Column, Piece, Row, NewRow).
updateRow(N, Column, Piece, [Row| More], [Row| MoreRows]) :-
    N > 1, Next is N-1, updateRow(Next, Column, Piece, More, MoreRows).

updateColumn(1, Piece, [_ | Rest], [Piece | Rest]).
updateColumn(N, Piece, [P | Rest], [P| More]) :-
    N > 1, Next is N-1, updateColumn(Next, Piece, Rest, More).

removePiece(Piece, 1, WhitePieces, BrownPieces, NewWhitePieces, BrownPieces) :- 
    searchBoard(Piece, WhitePieces, NewWhitePieces).
removePiece(Piece, 2, WhitePieces, BrownPieces, WhitePieces, NewBrownPieces) :- 
    searchBoard(Piece, BrownPieces, NewBrownPieces).

searchBoard(_, [], _).
searchBoard(Piece, [Row| Rest], [NewRow| MoreRows]) :-
    searchRow(Piece, Row, NewRow),
    searchBoard(Piece, Rest, MoreRows).

searchRow(_, [], _).
searchRow(Piece, [Piece| Rest], [0| Rest]).
searchRow(Piece, [P| Rest], [P| More]) :-
    searchRow(Piece, Rest, More).

% --------------------------- VERIFICATIONS -----------------------------
% Check if row and Column are valid (between 1 and 4 inclusive)
checkPosition(Pos) :-
    Pos < 5,
    Pos > 0. 

% Accepted pieces
checkPiece(cone).
checkPiece(sphere).
checkPiece(cylinder).
checkPiece(cube).

checkPlay(Piece, Row, Column, Player) :-
    checkValidRow(Piece, Player, Row).

% =================================
%           Get Piece
% =================================

getPieceFromList([H|_T], 1, Piece) :-
    Piece = H.

getPieceFromList([_H|T], Index, Piece) :-
    Index > 1,
    Index1 is Index - 1,
    getPieceFromList(T, Index1, Piece).

getPieceFromBoard([H|_T], 1, Column, Piece) :-
    getPieceFromList(H, Column, Piece).

getPieceFromBoard([_H|T], Row, Column, Piece) :-
    Row > 1,
    Row1 is Row - 1,
    getPieceFromBoard(T, Row1, Column, Piece).

/* Check if Row and column don't have a piece, if true the game continues */
isEmpty(Board, WhitePieces, BrownPieces, Row, Column, Player) :-
    getPieceFromBoard(Board, Row, Column, Piece),
    Piece == 0.

/* if is not empty, player as to play again. A error mensage is displayed. */
isEmpty(Board, WhitePieces, BrownPieces, Row, Column, P) :-
    notEmpty(Row, Column),
    play(P, Board, WhitePieces, BrownPieces).

/* Piece we can not find in the same row, column ou square */
opost(11, 12).
opost(51, 52).
opost(71, 72).
opost(91, 92).

opost(12, 11).
opost(52, 51).
opost(72, 71).
opost(92, 91).

valid_move(_Player, Board, _WhitePieces, _BrownPieces, Row, Column, Piece) :-
    Row1 is Row + 1,
    check_Top(Board, Row1, Column, Piece),
    Row2 is Row - 1,
    check_Down(Board, Row2, Column, Piece), 
    Column1 is Column + 1,
    check_Left(Board, Row, Column1, Piece),
    Column2 is Column - 1,
    check_Rigth(Board, Row, Column2, Piece).

valid_move(Player, Board, WhitePieces, BrownPieces, _Row, _Column, _Piece) :-
    wrongMove,
    play(Player, Board, WhitePieces, BrownPieces).

check_Top(_Board, 5, _Column, _Piece).
check_Top(Board, Row, Column, Piece) :-
    opost(Opost , Piece),
    getPieceFromBoard(Board, Row, Column, PieceThere),
    PieceThere =\= Opost,
    NewRow is Row+1,
    check_Top(Board, NewRow, Column, Piece).

check_Down(_Board, 0, _Column, _Piece).
check_Down(Board, Row, Column, Piece) :-
    opost(Opost , Piece),
    getPieceFromBoard(Board, Row, Column, PieceThere),
    PieceThere =\= Opost,
    NewRow is Row-1,
    check_Down(Board, NewRow, Column, Piece).

check_Left(_Board, _Row, 5, _Piece).
check_Left(Board, Row, Collumn, Piece) :-
    opost(Opost , Piece),
    getPieceFromBoard(Board, Row, Collumn, PieceThere),
    PieceThere =\= Opost,
    NewCollumn is Collumn + 1,
    check_Left(Board, Row, NewCollumn, Piece).

check_Rigth(_Board, _Row, 0, _Piece).
check_Rigth(Board, Row, Column, Piece) :-
    opost(Opost , Piece),
    getPieceFromBoard(Board, Row, Column, PieceThere),
    PieceThere =\= Opost,
    NewColumn is Column - 1,
    check_Rigth(Board, Row, NewColumn, Piece).

% --------------------------- TRANSLATIONS -----------------------------
% White pieces
translate(cone, 1, 11).
translate(cube, 1, 51).
translate(cylinder, 1, 71).
translate(sphere, 1, 91).

% Brown pieces
translate(cone, 2, 12).
translate(cube, 2, 52).
translate(cylinder, 2, 71).
translate(sphere, 2, 92).

% Changes the current player
changePlayer(1, 2).
changePlayer(2, 1).
