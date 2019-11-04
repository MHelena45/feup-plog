:- include('../Model/dataStructs.pl').
:- include('../View/boardPrinter.pl').
:- include('../View/userInteractions.pl').
:- include('../View/menu.pl').
:- include('verifications.pl').
:- include('computer.pl').
:- use_module(library(system)).

start :-
    mainMenu.

% ======================================================================================
%   Starts acording to the option choose in main menu
% ======================================================================================
% inits the elements comuns to all types of game
elements(Board, WhitePieces, BrownPieces)  :-
    board(Board), % Initialization of the board
    whitePieces(WhitePieces), % Initialization of the white pieces board for display
    brownPieces(BrownPieces), % Initialization of the brown pieces board for display
    displayGame(Board, WhitePieces, BrownPieces). % Displaying the main game & the available pieces

start2Players :- 
    elements(Board, WhitePieces, BrownPieces),
    play(1, Board, WhitePieces, BrownPieces). % Player 1 starts the game

startPlayervsComputer :-
    elements(Board, WhitePieces, BrownPieces),
    emptyCells(Cells), % empty cells used to computer moves
    bPieces(BP),  % Used to computer moves
    playPvsC(Board, WhitePieces, BrownPieces, Cells, BP). % Player 1 starts the game against computer

startComputervsPlayer :-
    elements(Board, WhitePieces, BrownPieces),   
    emptyCells(Cells), % empty cells used to computer moves
    wPieces(WP),  % Used to computer moves
    playCvsP(Board, WhitePieces, BrownPieces, Cells, WP). % computer is Player 1 and starts the game

startComputervsComputer :-
    elements(Board, WhitePieces, BrownPieces),   
    emptyCells(Cells), % empty cells used to computer moves
    wPieces(WP), % Used to computer moves
    bPieces(BP),
    playCvsC(Board, WhitePieces, BrownPieces, Cells, WP, BP). % Player 1 starts the game (Computer against computer)

% ============================================================================================================
%      Main loop of the 4 differnte kinds of game
% ================================================================================================================

playComputer(Player, Board, WhitePieces, BrownPieces, NewBoard, NewWhitePieces, NewBrownPieces, Cells, NewCells, CongratulateNumber, Pieces, NewPieces):-
    generatePlay(Player, Board, Row, Column, Piece, Cells, NewCells, Pieces, NewPieces), % only generates valid moves
    playPiece(Row, Column, Piece, Board, NewBoard),
    removePiece(Piece, Player, WhitePieces, BrownPieces, NewWhitePieces, NewBrownPieces),  % used in display
    displayGame(NewBoard, NewWhitePieces, NewBrownPieces),
    sleep(1),
    checkEnd(Player, NewBoard, Row, Column, CongratulateNumber). % type of Congratulation is different if compVScomp or personVSComp

playPvsC(Board, WhitePieces, BrownPieces, Cells, BP) :-
    playPerson(1, Board, WhitePieces, BrownPieces, NewBoard, NewWhitePieces, NewBrownPieces, Row, Column, 3),
    select([Row, Column], Cells, NewCells), %removes from the list of available pieces to play
    playComputer(2, NewBoard, NewWhitePieces, NewBrownPieces, NewBoard1, NewWhitePieces1, NewBrownPieces1, NewCells, NewCells1, 2, BP, BP1),
    playPvsC(NewBoard1, NewWhitePieces1, NewBrownPieces1, NewCells1, BP1).

playCvsP(Board, WhitePieces, BrownPieces, Cells, BP) :-
    playComputer(1, Board, WhitePieces, BrownPieces, NewBoard, NewWhitePieces, NewBrownPieces, Cells, NewCells, 2, BP, BP1),
    playPerson(2, NewBoard, NewWhitePieces, NewBrownPieces, NewBoard1, NewWhitePieces1, NewBrownPieces1, Row, Column, 3),
    select([Row, Column], NewCells, Cells1),
    playCvsP(NewBoard1, NewWhitePieces1, NewBrownPieces1, Cells1, BP1).

playCvsC(Board, WhitePieces, BrownPieces, Cells, WP, BP) :-
    playComputer(1, Board, WhitePieces, BrownPieces, NewBoard, NewWhitePieces, NewBrownPieces, Cells, NewCells,  1, WP, WP1),
    playComputer(2, NewBoard, NewWhitePieces, NewBrownPieces, NewBoard1, NewWhitePieces1, NewBrownPieces1, NewCells, Cells1, 1, BP, BP2),
    playCvsC(NewBoard1, NewWhitePieces1, NewBrownPieces1, Cells1, WP1, BP2).

playPerson(Player, Board, WhitePieces, BrownPieces, NewBoard, NewWhitePieces, NewBrownPieces, Row, Column, CongratulateNumber) :-
    repeat, % if the colocation of the piece fails, we ask again the all play
    getPlay(Piece, Row, Column, Player), % ask the play
    validPlay(Player, Board, WhitePieces, BrownPieces, Row, Column, Piece), % checks if it is valid, fails if not
    playPiece(Row, Column, Piece, Board, NewBoard),
    removePiece(Piece, Player, WhitePieces, BrownPieces, NewWhitePieces, NewBrownPieces),  
    displayGame(NewBoard, NewWhitePieces, NewBrownPieces),
    checkEnd(Player, NewBoard, Row, Column, CongratulateNumber).

 % Given the player, it plays the piece on the given position
play(Player, Board, WhitePieces, BrownPieces) :-
    playPerson(Player, Board, WhitePieces, BrownPieces, NewBoard, NewWhitePieces, NewBrownPieces, _R, _C, 1),  
    changePlayer(Player, NewPlayer), % Changes current player
    play(NewPlayer, NewBoard, NewWhitePieces, NewBrownPieces).  % Changes current board

% Changes the current player (in games Person vs Person)
changePlayer(1, 2).
changePlayer(2, 1).

% ==============================================================================
% ----------------------------- GET PLAY          ------------------------------
% ==============================================================================

% Gets the play from the player
getPlay(Piece, Row, Column, Player) :-
    greetPlayer(Player),
    getPiece(Piece, Player),
    getRow(Row),
    getColumn(Column).

getPiece(ColorPiece, Player) :-
    askPiece(Piece),
    checkPiece(Piece),
    translate(Piece, Player, ColorPiece).

getRow(Row) :-
    askRow(Row),
    checkPosition(Row).

getColumn(Column) :-
    askColumn(Column),
    checkPosition(Column).

% ========================================================================
% ---------------------------  BOARD UPDATES -----------------------------
% ========================================================================
% plays a Piece, get the new Board for Tabout Board
playPiece(Row, Column, Piece, TabIn, TabOut) :-
   updateRow(Row, Column, Piece, TabIn, TabOut).

updateRow(1, Column, Piece, [Row| More], [NewRow| More]):-
    updateColumn(Column, Piece, Row, NewRow).
updateRow(N, Column, Piece, [Row| More], [Row| MoreRows]) :-
    N > 1, Next is N-1, updateRow(Next, Column, Piece, More, MoreRows).

updateColumn(1, Piece, [_P | Rest], [Piece | Rest]).
updateColumn(N, Piece, [P | Rest], [P| More]) :-
    N > 1, Next is N-1, updateColumn(Next, Piece, Rest, More).

% removes Piece form the white Pieces and BrownPieces available to play
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

% ======================================================================
% --------------------------- TRANSLATIONS -----------------------------
% ======================================================================
% the play only writes the form and it is translate to the correct number to save in the board
% White pieces translate 
translate(cone, 1, 11). % form, number of player and number of the correspondent piece
translate(cube, 1, 51).
translate(cylinder, 1, 71).
translate(sphere, 1, 91).

% Brown pieces
translate(cone, 2, 12).
translate(cube, 2, 52).
translate(cylinder, 2, 72).
translate(sphere, 2, 92).
