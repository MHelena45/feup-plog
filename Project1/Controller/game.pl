:- include('../Model/dataStructs.pl').
:- include('../View/boardPrinter.pl').
:- include('../View/userInteractions.pl').
:- include('../View/menu.pl').
:- include('verifications.pl').
:- include('computer.pl').
:- use_module(library(system)). % used for sleep

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
    elements(Board, WhitePieces, BrownPieces), % inits the elements comuns to all types of game
    play(1, Board, WhitePieces, BrownPieces). % Player 1 starts the game

startPlayervsComputer(Level) :-
    elements(Board, WhitePieces, BrownPieces), % inits the elements comuns to all types of game
    emptyCells(EmptyCells), % empty cells used to computer moves
    playPvsC(Board, WhitePieces, BrownPieces, EmptyCells, Level). % Player 1 starts the game against computer

startComputervsPlayer(Level) :-
    elements(Board, WhitePieces, BrownPieces),    % inits the elements comuns to all types of game
    emptyCells(EmptyCells), % empty cells used to computer moves
    playCvsP(Board, WhitePieces, BrownPieces, EmptyCells, Level). % computer is Player 1 and starts the game

startComputervsComputer(Level) :-
    elements(Board, WhitePieces, BrownPieces),   % inits the elements comuns to all types of game
    emptyCells(EmptyCells), % empty cells used to computer moves
    playCvsC(Board, WhitePieces, BrownPieces, EmptyCells, Level). % Player 1 starts the game (Computer against computer)

% ============================================================================================================
%      Main loop of the 4 differnte kinds of game
% ================================================================================================================

playComputer(Player, Board, WhitePieces, BrownPieces, Board1, WhitePieces1, BrownPieces1, EmptyCells, EmptyCells1, CongratulateNumber, Level):-
    getPiecesAvailable(Player, WhitePieces, BrownPieces, PiecesAvailable),
    generatePlay(Player, Board, Row, Column, Piece, EmptyCells, EmptyCells1, PiecesAvailable, Level), % only generates valid moves
    playPiece(Row, Column, Piece, Board, Board1),
    removePiece(Piece, Player, WhitePieces, BrownPieces, WhitePieces1, BrownPieces1),  % used in display
    displayGame(Board1, WhitePieces1, BrownPieces1),
    checkEnd(Player, Board1, Row, Column, CongratulateNumber),  % type of Congratulation is different if compVScomp or personVSComp
    sleep(1).

playPvsC(Board, WhitePieces, BrownPieces, EmptyCells, Level) :-
    playPerson(1, Board, WhitePieces, BrownPieces, Board1, WhitePieces1, BrownPieces1, Row, Column, 3),
    select([Row, Column], EmptyCells, EmptyCells1), %removes from the list of available pieces to play
    playComputer(2, Board1, WhitePieces1, BrownPieces1, Board2, WhitePieces2, BrownPieces2, EmptyCells1, EmptyCells2, 2, Level),
    playPvsC( Board2, WhitePieces2, BrownPieces2, EmptyCells2, Level).

playCvsP(Board, WhitePieces, BrownPieces, EmptyCells, Level) :-
    playComputer(1, Board, WhitePieces, BrownPieces, Board1, WhitePieces1, BrownPieces1, EmptyCells, EmptyCells1, 2, Level),
    playPerson(2, Board1, WhitePieces1, BrownPieces1, Board2, WhitePieces2, BrownPieces2, Row, Column, 3),
    select([Row, Column], EmptyCells1, EmptyCells2),
    playCvsP(Board2, WhitePieces2, BrownPieces2, EmptyCells2, Level).

playCvsC(Board, WhitePieces, BrownPieces, EmptyCells, Level) :-
    playComputer(1, Board, WhitePieces, BrownPieces, Board1, WhitePieces1, BrownPieces1, EmptyCells, EmptyCells1,  1, Level),
    playComputer(2, Board1, WhitePieces1, BrownPieces1, Board2, WhitePieces2, BrownPieces2, EmptyCells1, EmptyCells2, 1, Level),
    playCvsC(Board2, WhitePieces2, BrownPieces2, EmptyCells2, Level).

playPerson(Player, Board, WhitePieces, BrownPieces, Board1, WhitePieces1, BrownPieces1, Row, Column, CongratulateNumber) :-
    repeat, % if the colocation of the piece fails, we ask again the all play
    getPlay(Piece, Row, Column, Player), % ask the play
    validPlay(Player, Board, WhitePieces, BrownPieces, Row, Column, Piece), % checks if it is valid, fails if not
    playPiece(Row, Column, Piece, Board, Board1),
    removePiece(Piece, Player, WhitePieces, BrownPieces, WhitePieces1, BrownPieces1),  
    displayGame(Board1, WhitePieces1, BrownPieces1),
    checkEnd(Player, Board1, Row, Column, CongratulateNumber).

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
    repeat,
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
removePiece(Piece, 1, WhitePieces, BrownPieces, WhitePieces1, BrownPieces1) :-
    select(0, WhitePieces1, Piece, WhitePieces),
    BrownPieces1 = BrownPieces.

removePiece(Piece, 2, WhitePieces, BrownPieces, WhitePieces1, BrownPieces1) :-
    select(0, BrownPieces1, Piece, BrownPieces),
    WhitePieces1 = WhitePieces.

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

% ======================================================================
% ----------------------- Get Pieces Available -------------------------
% ======================================================================
% remove dups and 0's from the Pieces
getPiecesAvailable(1, WhitePieces, _BrownPieces, PiecesAvailable) :-
    remove_dups(WhitePieces, WhitePieces1), % removes dups and all 0 execpt one
    select(0, WhitePieces1, PiecesAvailable). % remove last 0 remaining

getPiecesAvailable(2, _WhitePieces, BrownPieces, PiecesAvailable) :-
    remove_dups(BrownPieces, BrownPieces1), % removes all 0 execpt one
    select(0, BrownPieces1, PiecesAvailable). % remove last 0 remaining

% if there are no 0 just remove duplicated pieces
getPiecesAvailable(1, WhitePieces, _BrownPieces, PiecesAvailable) :-
    remove_dups(WhitePieces, WhitePieces1),
    PiecesAvailable = WhitePieces1.

getPiecesAvailable(2, _WhitePieces, BrownPieces, PiecesAvailable) :-
    remove_dups(BrownPieces, BrownPieces1),
    PiecesAvailable = BrownPieces1.