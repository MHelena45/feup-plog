:- use_module(library(random)).
:- use_module(library(lists)).

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
winRowPlay(Board, Row, Piece) :-
    getRowSumC(Board, Row, RowSum),
    getForm(RowSum, Piece).

getRowSumC(Board, 1, RowSum) :-
    getRowSum(Board, 1, RowSum).

getRowSumC(Board, 2, RowSum) :-
    getRowSum(Board, 2, RowSum).

getRowSumC(Board, 3, RowSum) :-
    getRowSum(Board, 3, RowSum).

getRowSumC(Board, 4, RowSum) :-
    getRowSum(Board, 4, RowSum).

% Column
getColumnSumC(Board, 1, 0, ColSum) :-
    getColumnSum(Board, 1, 0, ColSum).

getColumnSumC(Board, 2, 0, ColSum) :-
    getColumnSum(Board, 2, 0, ColSum).

getColumnSumC(Board, 3, 0, ColSum) :-
    getColumnSum(Board, 3, 0, ColSum).

getColumnSumC(Board, 4, 0, ColSum) :-
    getColumnSum(Board, 4, 0, ColSum).

winColumnPlay(Board, Column, Piece):-
    getColumnSumC(Board, Column, 0, ColSum),
    getForm(ColSum, Piece).

% square
getSquareSumC(1, Board, SquareSum) :-
    getSquareSum(1, Board, SquareSum).

getSquareSumC(2, Board, SquareSum) :-
    getSquareSum(2, Board, SquareSum).

getSquareSumC(3, Board, SquareSum) :-
    getSquareSum(3, Board, SquareSum).

getSquareSumC(4, Board, SquareSum) :-
    getSquareSum(4, Board, SquareSum).

winSquarePlay(Board, SquareNum, Piece):-
    getSquareSumC(SquareNum, Board, SquareSum),
    getForm(SquareSum, Piece).

% ======================================================================
%      Gets the empty column of the piece missing to do the win move
% ======================================================================
getEmptyColumn(Board, Row, 1) :-
    isEmpty(Board, Row, 1). % Checks if the position is empty 

getEmptyColumn(Board, Row, 2) :-
    isEmpty(Board, Row, 2). % Checks if the position is empty 

getEmptyColumn(Board, Row, 3) :-
    isEmpty(Board, Row, 3). % Checks if the position is empty 

getEmptyColumn(Board, Row, 4) :-
    isEmpty(Board, Row, 4). % Checks if the position is empty 

% ======================================================================
%         Gets the empty row of the piece missing to do the win move
% ======================================================================
getEmptyRow(Board, 1, Column) :-
    isEmpty(Board, 1, Column).  % Checks if the position is empty 

getEmptyRow(Board, 2, Column) :-
    isEmpty(Board, 2, Column).  % Checks if the position is empty 

getEmptyRow(Board, 3, Column) :-
    isEmpty(Board, 3, Column).  % Checks if the position is empty 

getEmptyRow(Board, 4, Column) :-
    isEmpty(Board, 4, Column).  % Checks if the position is empty 

% ==================================================================================================
%      Gets the empty row and Column (on the square given) of the piece missing to do the win move
% ==================================================================================================
% first Square
getEmptySquare(Board, 1, 1, 1) :-
    isEmpty(Board, 1, 1). % Checks if the position is empty 

getEmptySquare(Board, 1, 2 , 1) :-
    isEmpty(Board, 1, 2). % Checks if the position is empty 

getEmptySquare(Board, 2, 1, 1) :-
    isEmpty(Board, 2, 1). % Checks if the position is empty 

getEmptySquare(Board, 2, 2, 1) :-
    isEmpty(Board, 2, 2). % Checks if the position is empty 

% second Square
getEmptySquare(Board, 1, 3, 2) :-
    isEmpty(Board, 1, 3). % Checks if the position is empty 

getEmptySquare(Board, 1, 4, 2) :-
    isEmpty(Board, 1, 4). % Checks if the position is empty 

getEmptySquare(Board, 2, 3, 2) :-
    isEmpty(Board, 2, 3). % Checks if the position is empty 

getEmptySquare(Board, 2, 4, 2) :-
    isEmpty(Board, 2, 4). % Checks if the position is empty 

% third Square
getEmptySquare(Board, 3, 1, 3) :-
    isEmpty(Board, 3, 1). % Checks if the position is empty 

getEmptySquare(Board, 3, 2, 3) :-
    isEmpty(Board, 3, 2). % Checks if the position is empty 

getEmptySquare(Board, 4, 1, 3) :-
    isEmpty(Board, 4, 1). % Checks if the position is empty 

getEmptySquare(Board, 4, 2, 3) :-
    isEmpty(Board, 4, 2). % Checks if the position is empty 

% 4 Square
getEmptySquare(Board, 3, 3, 4) :-
    isEmpty(Board, 3, 3). % Checks if the position is empty 

getEmptySquare(Board, 3, 4, 4) :-
    isEmpty(Board, 3, 4). % Checks if the position is empty 

getEmptySquare(Board, 4, 3, 4) :-
    isEmpty(Board, 4, 3). % Checks if the position is empty 

getEmptySquare(Board, 4, 4, 4) :-
    isEmpty(Board, 4, 4). % Checks if the position is empty 

% ======================================================================
%                  generates a winner play if exists
% ======================================================================
% winning row
winPlay(Board, Row, Column, Piece) :- % returns the Row, Column and Piece of the winning play
    winRowPlay(Board, Row, Piece),
    getEmptyColumn(Board, Row, Column).

% winning row
winPlay(Board, Row, Column, Piece) :- % returns the Row, Column and Piece of the winning play
    winColumnPlay(Board, Column, Piece),
    getEmptyRow(Board, Row, Column).

% winning square
winPlay(Board, Row, Column, Piece) :- % returns the Row, Column and Piece of the winning play
    winSquarePlay(Board, SquareNum, Piece),
    getEmptySquare(Board, Row, Column , SquareNum).

generatePlay(Player, Board, Row, Column, ColorPiece, WhitePieces, BrownPieces, _Cells, _NewCells, Level):-
    Level =\= 1, % if Level one, only generates random plays
    winPlay(Board, Row, Column, Piece), % Only returns a valid Row and column position that is empty
    translate(Piece, Player, ColorPiece),
    validMoveC(Board, Row, Column, ColorPiece), % Checks if the move is valid
    isPieceAvailable(ColorPiece, WhitePieces, BrownPieces). % Checks if the piece is available (2 equal pieces max per player)

/**
 * when there are not any winning play, we do a valid random play
 * The arg Pieces is the avalaible pieces of the Player playing and NewPieces, the Pieces except that is being play
 */
generatePlay(_Player, Board, Row, Column, Piece, Cells, NewCells, Pieces, NewPieces, _Level):-
    repeat,
    random_member([Row| Column], Cells),
    random_member(Piece, Pieces),
    validMoveC(Board, Row, Column, Piece), %fails if move not valid
    select([Row | Column], Cells, NewCells),  % removes from empty cells
    select(Piece, Pieces, NewPieces).

% ====================================================================================
%  Verification of computer moves (if not valid fail but don't warn on the screen)
% ======================================================================================
/* Check if Row and column don't have a piece for computer play , if true the game continues */
isEmpty(Board, Row, Column) :-
    getPieceFromBoard(Row, Column, Board, Piece),
    Piece == 0.

/* Check if the random movimen done by the computer is correct */
validMoveC(Board, Row, Column, Piece) :-
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
