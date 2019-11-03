:- use_module(library(random)).

% ======================================================================
%     checks if exists a row, Column or square with one piece left
% ======================================================================

getForm(Sum, Piece) :-
    Sum == 13,
    Piece = 'sphere'.

getForm(Sum, Piece) :-
    Sum == 15,
    Piece = 'cylinder'.

getForm(Sum, Piece) :-
    Sum == 17,
    Piece = 'cube'.

getForm(Sum, Piece) :-
    Sum == 21,
    Piece = 'cone'.   

% ======================================================================
%    checks for every column, row and square the sum of the pieces
% ======================================================================
% Row
winRowPlay(Board, Row, Piece):-
    getRowSum(Board, 1, RowSum),
    getForm(RowSum, Piece), 
    Row = 1.

winRowPlay(Board, Row, Piece):-
    getRowSum(Board, 2, RowSum),
    getForm(RowSum, Piece),
    Row = 2.

winRowPlay(Board, Row, Piece):-
    getRowSum(Board, 3, RowSum),
    getForm(RowSum, Piece),
    Row = 3.

winRowPlay(Board, Row, Piece):-
    getRowSum(Board, 4, RowSum),
    getForm(RowSum, Piece), 
    Row = 4.

% Column
winColumnPlay(Board, Column, Piece):-
    getColumnSum(Board, 1, 0, ColSum),
    getForm(ColSum, Piece), 
    Column = 1.

winColumnPlay(Board, Column, Piece):-
    getColumnSum(Board, 2, 0, ColSum),
    getForm(ColSum, Piece), 
    Column = 2.

winColumnPlay(Board, Column, Piece):-
    getColumnSum(Board, 3, 0, ColSum),
    getForm(ColSum, Piece), 
    Column = 3.

winColumnPlay(Board, Column, Piece):-
    getColumnSum(Board, 4, 0, ColSum),
    getForm(ColSum, Piece), 
    Column = 4.

%square
winSquarePlay(Board, SquareNum, Piece):-
    getSquareSum(1, Board, SquareSum),
    getForm(SquareSum, Piece), 
    SquareNum = 1.

winSquarePlay(Board, SquareNum, Piece):-
    getSquareSum(2, Board, SquareSum),
    getForm(SquareSum, Piece), 
    SquareNum = 2.

winSquarePlay(Board, SquareNum, Piece):-
    getSquareSum(3, Board, SquareSum),
    getForm(SquareSum, Piece), 
    SquareNum = 3.

winSquarePlay(Board, SquareNum, Piece) :-
    getSquareSum(4, Board, SquareSum),
    getForm(SquareSum, Piece), 
    SquareNum = 4.

% ======================================================================
%      Gets the empty column of the piece missing to do the win move
% ======================================================================
getEmptyColumn(Board, Row, Column) :-
    isEmpty(Board, Row, 1), % Checks if the position is empty 
    Column = 1.

getEmptyColumn(Board, Row, Column) :-
    isEmpty(Board, Row, 2), % Checks if the position is empty 
    Column = 2.

getEmptyColumn(Board, Row, Column) :-
    isEmpty(Board, Row, 3), % Checks if the position is empty 
    Column = 3.

getEmptyColumn(Board, Row, Column) :-
    isEmpty(Board, Row, 4), % Checks if the position is empty 
    Column = 4.

% ======================================================================
%         Gets the empty row of the piece missing to do the win move
% ======================================================================

getEmptyRow(Board, Row, Column) :-
    isEmpty(Board, 1, Column), % Checks if the position is empty 
    Row = 1.

getEmptyRow(Board, Row, Column) :-
    isEmpty(Board, 2, Column), % Checks if the position is empty 
    Row = 2.

getEmptyRow(Board, Row, Column) :-
    isEmpty(Board, 3, Column), % Checks if the position is empty 
    Row = 3.

getEmptyRow(Board, Row, Column) :-
    isEmpty(Board, 4, Column), % Checks if the position is empty 
    Row = 4.

% ==================================================================================================
%      Gets the empty row and Column (on the square given) of the piece missing to do the win move
% ==================================================================================================
% first Square
getEmptySquare(Board, Row, Column, 1) :-
    isEmpty(Board, 1, 1), % Checks if the position is empty 
    Row = 1, Column = 1.

getEmptySquare(Board, Row, Column, 1) :-
    isEmpty(Board, 1, 2), % Checks if the position is empty 
    Row = 1, Column = 2.

getEmptySquare(Board, Row, Column, 1) :-
    isEmpty(Board, 2, 1), % Checks if the position is empty 
    Row = 2, Column = 1.

getEmptySquare(Board, Row, Column, 1) :-
    isEmpty(Board, 2, 2), % Checks if the position is empty 
    Row = 2, Column = 2.

% second Square
getEmptySquare(Board, Row, Column, 2) :-
    isEmpty(Board, 1, 3), % Checks if the position is empty 
    Row = 1, Column = 3.

getEmptySquare(Board, Row, Column, 2) :-
    isEmpty(Board, 1, 4), % Checks if the position is empty 
    Row = 1, Column = 4.

getEmptySquare(Board, Row, Column, 2) :-
    isEmpty(Board, 2, 3), % Checks if the position is empty 
    Row = 2, Column = 3.

getEmptySquare(Board, Row, Column, 2) :-
    isEmpty(Board, 2, 4), % Checks if the position is empty 
    Row = 2, Column = 4.

% third Square
getEmptySquare(Board, Row, Column, 3) :-
    isEmpty(Board, 3, 1), % Checks if the position is empty 
    Row = 3, Column = 1.

getEmptySquare(Board, Row, Column, 3) :-
    isEmpty(Board, 3, 2), % Checks if the position is empty 
    Row = 3, Column = 2.

getEmptySquare(Board, Row, Column, 3) :-
    isEmpty(Board, 4, 1), % Checks if the position is empty 
    Row = 4, Column = 1.

getEmptySquare(Board, Row, Column, 3) :-
    isEmpty(Board, 4, 2), % Checks if the position is empty 
    Row = 4, Column = 2.

% 4 Square
getEmptySquare(Board, Row, Column, 4) :-
    isEmpty(Board, 3, 3), % Checks if the position is empty 
    Row = 3, Column = 3.

getEmptySquare(Board, Row, Column, 4) :-
    isEmpty(Board, 3, 4), % Checks if the position is empty 
    Row = 3, Column = 4.

getEmptySquare(Board, Row, Column, 4) :-
    isEmpty(Board, 4, 3), % Checks if the position is empty 
    Row = 4, Column = 3.

getEmptySquare(Board, Row, Column, 4) :-
    isEmpty(Board, 4, 4), % Checks if the position is empty 
    Row = 4, Column = 4.

% ======================================================================
%                  generates a winner play if exists
% ======================================================================
% winning row
winPlay(Board, Row, Column, Piece) :-
    winRowPlay(Board, Row, Piece),
    getEmptyColumn(Board, Row, Column).

% winning row
winPlay(Board, Row, Column, Piece) :-
    winColumnPlay(Board, Column, Piece),
    getEmptyRow(Board, Row, Column).

% winning square
winPlay(Board, Row, Column, Piece) :-
    winSquarePlay(Board, SquareNum, Piece),
    getEmptySquare(Board, Row, Column , SquareNum).

generatePlay(Player, Board, Row, Column, ColorPiece, WhitePieces, BrownPieces):-
    winPlay(Board, Row, Column, Piece), % Only returns a empty Row and column position
    translate(Piece, Player, ColorPiece),
    validMove(Board, Row, Column, ColorPiece), % Checks if the move is valid
    isPieceAvailable(ColorPiece, WhitePieces, BrownPieces). % Checks if the piece is available (2 equal pieces max per player)

/**
 * when there are not any winning play, we do a valid random play
 */
generatePlay(Player, Board, Row, Column, ColorPiece, WhitePieces, BrownPieces):-
    repeat,
    random(1, 5, Row),
    random(1, 5, Column),
    isEmpty(Board, Row, Column), % Checks if the position is empty 
    repeat,
    random(1, 5, NumberPiece),
    numberToPiece(Piece, NumberPiece),
    translate(Piece, Player, ColorPiece),
    validMove(Board, Row, Column, ColorPiece), % Checks if the move is valid
    isPieceAvailable(ColorPiece, WhitePieces, BrownPieces). % Checks if the piece is available (2 equal pieces max per player)
    
% ======================================================================
%         converts number between [1, 4] into a possible piece
% ======================================================================
numberToPiece('cone', 1).
numberToPiece('cylinder', 2).
numberToPiece('sphere', 3).
numberToPiece('cube', 4).

% ====================================================================================
%  Verification of computer moves (if not valid fail but don't warn on the screen)
% ======================================================================================
/* Check if Row and column don't have a piece for computer play , if true the game continues */
isEmpty(Board, Row, Column) :-
    getPieceFromBoard(Row, Column, Board, Piece),
    Piece == 0.

/* Check if the random movimen done by the computer is correct */
validMove(Board, Row, Column, Piece) :-
    Row1 is Row + 1,
    checkTop(Row1, Column, Board, Piece),
    Row2 is Row - 1,
    checkDown(Row2, Column, Board, Piece), 
    Column1 is Column + 1,
    checkLeft(Row, Column1, Board, Piece),
    Column2 is Column - 1,
    checkRigth(Row, Column2, Board, Piece),
    getSquareNum(Row, Column, SquareNum),
    checkSquare(SquareNum, Piece, Board).

/* Checks if Piece is available for computer moves */
isPieceAvailable(Piece, WhitePieces, _BrownPieces) :-
    searchPiece(Piece, WhitePieces).

isPieceAvailable( Piece, _WhitePieces, BrownPieces) :-
    searchPiece(Piece, BrownPieces).
