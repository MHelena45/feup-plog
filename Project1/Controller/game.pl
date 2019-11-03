:- include('../Model/dataStructs.pl').
:- include('../View/boardPrinter.pl').
:- include('../View/userInteractions.pl').
:- include('../View/menu.pl').
:- include('verifications.pl').
:- include('computer.pl').

start :-
    mainMenu.

start2Players :- 
    board(Board), % Initialization of the board
    whitePieces(WhitePieces), % Initialization of the white pieces board
    brownPieces(BrownPieces), % Initialization of the brown pieces board
    displayGame(Board, WhitePieces, BrownPieces), % Displaying the main game & the available pieces
    play(1, Board, WhitePieces, BrownPieces). % Player 1 starts the game

startPlayervsComputer :-
    board(Board), % Initialization of the board
    whitePieces(WhitePieces), % Initialization of the white pieces board
    brownPieces(BrownPieces), % Initialization of the brown pieces board
    displayGame(Board, WhitePieces, BrownPieces), % Displaying the main game & the available pieces
    playPvsC(Board, WhitePieces, BrownPieces). % Player 1 starts the game

startComputervsComputer :-
    board(Board), % Initialization of the board
    whitePieces(WhitePieces), % Initialization of the white pieces board
    brownPieces(BrownPieces), % Initialization of the brown pieces board
    playCvsC(Board, WhitePieces, BrownPieces). % Player 1 starts the game

playComputer(Player, Board, WhitePieces, BrownPieces, NewBoard, NewWhitePieces, NewBrownPieces, CongratulateNumber):-
    generatePlay(Player, Board, Row, Column, Piece, WhitePieces, BrownPieces), % only generates valid moves
    playPiece(Row, Column, Piece, Board, NewBoard),
    removePiece(Piece, Player, WhitePieces, BrownPieces, NewWhitePieces, NewBrownPieces),  
    displayGame(NewBoard, NewWhitePieces, NewBrownPieces),
    checkEnd(Player, NewBoard, Row, Column, CongratulateNumber). % type of Congratulation is different if compVScomp or personVSComp

playPvsC(Board, WhitePieces, BrownPieces) :-
    playPerson(1, Board, WhitePieces, BrownPieces, NewBoard, NewWhitePieces, NewBrownPieces),
    playComputer(2, NewBoard, NewWhitePieces, NewBrownPieces, NewBoard1, NewWhitePieces1, NewBrownPieces1, 2),
    playPvsC(NewBoard1, NewWhitePieces1, NewBrownPieces1).

playCvsC(Board, WhitePieces, BrownPieces) :-
    playComputer(1, Board, WhitePieces, BrownPieces, NewBoard, NewWhitePieces, NewBrownPieces, 1),
    playComputer(2, NewBoard, NewWhitePieces, NewBrownPieces, NewBoard1, NewWhitePieces1, NewBrownPieces1, 1),
    playCvsC(NewBoard1, NewWhitePieces1, NewBrownPieces1).

playPerson(Player, Board, WhitePieces, BrownPieces, NewBoard, NewWhitePieces, NewBrownPieces) :-
    getPlay(Piece, Row, Column, Player),
    validPlay(Player, Board, WhitePieces, BrownPieces, Row, Column, Piece),
    playPiece(Row, Column, Piece, Board, NewBoard),
    removePiece(Piece, Player, WhitePieces, BrownPieces, NewWhitePieces, NewBrownPieces),  
    displayGame(NewBoard, NewWhitePieces, NewBrownPieces),
    checkEnd(Player, NewBoard, Row, Column, 1).

 % Given the player, it plays the piece on the given position
play(Player, Board, WhitePieces, BrownPieces) :-
    playPerson(Player, Board, WhitePieces, BrownPieces, NewBoard, NewWhitePieces, NewBrownPieces),  
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

updateColumn(1, Piece, [_P | Rest], [Piece | Rest]).
updateColumn(N, Piece, [P | Rest], [P| More]) :-
    N > 1, Next is N-1, updateColumn(Next, Piece, Rest, More).

removePiece(Piece, 1, WhitePieces, BrownPieces, NewWhitePieces, BrownPieces) :- 
    searchBoard(Piece, WhitePieces, NewWhitePieces).
removePiece(Piece, 2, WhitePieces, BrownPieces, WhitePieces, NewBrownPieces) :- 
    searchBoard(Piece, BrownPieces, NewBrownPieces).

searchBoard(_Piece, [], _NewBoard).
searchBoard(Piece, [Row| Rest], [NewRow| MoreRows]) :-
    searchRow(Piece, Row, NewRow),
    searchBoard(Piece, Rest, MoreRows).

searchRow(_Piece, [], _NewRow).
searchRow(Piece, [Piece| Rest], [0| Rest]).
searchRow(Piece, [P| Rest], [P| More]) :-
    searchRow(Piece, Rest, More).

% --------------------------- TRANSLATIONS -----------------------------
% White pieces
translate(cone, 1, 11).
translate(cube, 1, 51).
translate(cylinder, 1, 71).
translate(sphere, 1, 91).

% Brown pieces
translate(cone, 2, 12).
translate(cube, 2, 52).
translate(cylinder, 2, 72).
translate(sphere, 2, 92).

% Changes the current player
changePlayer(1, 2).
changePlayer(2, 1).
