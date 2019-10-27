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
    % valid_move
    playPiece(Row, Column, Piece, Board, NewBoard),
    removePiece(Piece, WhitePieces, BrownPieces, NewWhitePieces, NewBrownPieces),  
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
    translate(ColorPiece, Piece, Player).

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

removePiece(Piece, WhitePieces, BrownPieces, NewWhitePieces, NewBrownPieces) :- 
    searchBoard(Piece, WhitePieces, NewWhitePieces),
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

% --------------------------- TRANSLATIONS -----------------------------
% White pieces
translate(11, cone, 1).
translate(51, cube, 1).
translate(71, cylinder, 1).
translate(91, sphere , 1).

% Brown pieces
translate(12, cone, 2).
translate(52, cube, 2).
translate(72, cylinder, 2).
translate(92, sphere , 2).

% Changes the current player
changePlayer(1, 2).
changePlayer(2, 1).
