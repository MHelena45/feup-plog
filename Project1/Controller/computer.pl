:- use_module(library(random)).
:- use_module(library(lists)).

% ======================================================================
%     checks if exists a row, Column or square with one piece left
% ======================================================================
% if Sum is 13, the piece missing is the sphere
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
getEmptyColumn(Row, 1, EmptyCells) :-
    member([Row , 1], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member

getEmptyColumn(Row, 2, EmptyCells) :-
    member([Row , 2], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member

getEmptyColumn(Row, 3, EmptyCells) :-
    member([Row , 3], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member

getEmptyColumn(Row, 4, EmptyCells) :-
    member([Row , 4], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member

% ======================================================================
%         Gets the empty row of the piece missing to do the win move
% ======================================================================
getEmptyRow(1, Column, EmptyCells) :-
    member([1, Column], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptyRow(2, Column, EmptyCells) :-
    member([2, Column], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptyRow(3, Column, EmptyCells) :-
    member([3, Column], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptyRow(4, Column, EmptyCells) :-
    member([4, Column], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

% ==================================================================================================
%      Gets the empty row and Column (on the square given) of the piece missing to do the win move
% ==================================================================================================
% first Square
getEmptySquare(1, 1, 1, EmptyCells) :-
    member([1, 1], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptySquare(1, 2, 1, EmptyCells) :-
    member([1, 2], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptySquare(2, 1, 1, EmptyCells) :-
    member([2, 1], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptySquare(2, 2, 1, EmptyCells) :-
    member([2, 2], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

% second Square
getEmptySquare(1, 3, 2, EmptyCells) :-
    member([1, 3], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptySquare(1, 4, 2, EmptyCells) :-
    member([1, 4], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptySquare(2, 3, 2, EmptyCells) :-
    member([2, 3], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptySquare(2, 4, 2, EmptyCells) :-
    member([2, 4], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

% third Square
getEmptySquare(3, 1, 3, EmptyCells) :-
    member([3, 1], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptySquare(3, 2, 3, EmptyCells) :-
    member([3, 2], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptySquare(4, 1, 3, EmptyCells) :-
    member([4, 1], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptySquare(4, 2, 3, EmptyCells) :-
    member([4, 2], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

% 4 Square
getEmptySquare(3, 3, 4, EmptyCells) :-
    member([3, 3], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptySquare(3, 4, 4, EmptyCells) :-
    member([3, 4], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptySquare(4, 3, 4, EmptyCells) :-
    member([4, 3], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

getEmptySquare(4, 4, 4, EmptyCells) :-
    member([4, 4], EmptyCells). % Checks if the position is empty, if it's member of the empty cells it is member 

% ======================================================================
%                  generates a winner play if exists
% ======================================================================
% winning row
winPlay(Board, Row, Column, Piece, EmptyCells) :- % returns the Row, Column and Piece of the winning play
    winRowPlay(Board, Row, Piece),
    getEmptyColumn(Row, Column, EmptyCells).

% winning row
winPlay(Board, Row, Column, Piece, EmptyCells) :- % returns the Row, Column and Piece of the winning play
    winColumnPlay(Board, Column, Piece),
    getEmptyRow(Row, Column, EmptyCells).

% winning square
winPlay(Board, Row, Column, Piece, Cells) :- % returns the Row, Column and Piece of the winning play
    winSquarePlay(Board, SquareNum, Piece),
    getEmptySquare( Row, Column , SquareNum, Cells).

% ======================================================================
%          fucntion use to generates a play for us to win in the next play
% ======================================================================

% check all the collumns
isTherePieceMineinAnyCollum(1, Column, Piece1, Piece2, Board, PieceWeWantToPlay) :-
    isTherePieceMineinCollum(1,Column, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinAnyCollum(2, Column, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMineinCollum(2, Column, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinAnyCollum(3, Column, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMineinCollum(3, Column, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinAnyCollum( 4, Column, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMineinCollum(4, Column, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinCollum(Row, Column, Piece1, Piece2, Board, Piece2) :-
    check(Row, Column, Board, Piece1).

isTherePieceMineinCollum(Row, Column, Piece1, Piece2, Board, Piece1) :-
    check(Row, Column, Board, Piece2).

check(Row, Column, Board, Piece) :-
    getPieceFromBoard(Row, Column, Board, PieceinTheBoard),
    Piece == PieceinTheBoard.

isPossible(RowSum, cylinder, sphere) :-
    RowSum == 6.

isPossible(RowSum, cube, sphere) :-
    RowSum == 8.

isPossible(RowSum, cylinder, cube) :-
    RowSum == 10.

isPossible(RowSum, sphere, cone) :-
    RowSum == 12.

isPossible(RowSum, cylinder, cone) :-
    RowSum == 14.

isPossible(RowSum, cube, cone) :-
    RowSum == 16.

% ======================================================================
%           generates a play for us to win in the next play
% ======================================================================
/**
 * If there are two diferent pieces, and only two pieces in the row and one of our pieces in in one empty column of that row
 * we want to play the other piece in the other row, then the winning play will be ours in the next move.
 * The other player can't play in the move remaining because we have a piece in that column
 */
wininNextMoveWithaRow(Player, Board, Row, ColumnOfThePlay, PieceWeWantToPlay, EmptyCells) :-
    getRowSumC(Board, Row, RowSum),
    isPossible(RowSum, Piece1Name, Piece2Name), % checks if there are 2 and only 2 pieces, that are differente
    translate(Piece1Name, Player, Piece1),
    translate(Piece2Name, Player, Piece2),
    getEmptyRow(Row, Column, EmptyCells),
    isTherePieceMineinAnyCollum(_, Column, Piece1, Piece2, Board, PieceWeWantToPlay), % the row were the Piece is doesn't mather
    select([Row, Column] , EmptyCells, NewEmptyCells),
    getEmptyRow(Row, ColumnOfThePlay, NewEmptyCells).

wininNextMovePlay(Player, Board, Row, ColumnOfThePlay, PieceWeWantToPlay, EmptyCells ) :-
    wininNextMoveWithaRow(Player, Board, Row, ColumnOfThePlay, PieceWeWantToPlay, EmptyCells).
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Functions use to get a good Play
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% doesn't have to worry with passing the NewCells because the game is going to end after this play
generatePlay(Player, Board, Row, Column, ColorPiece, EmptyCells, _NewCells, PiecesAvailable, Level):-
    Level =\= 1, % if Level one, only generates random plays
    winPlay(Board, Row, Column, Piece, EmptyCells), % Only returns a valid Row and column position that is empty
    translate(Piece, Player, ColorPiece),
    member(ColorPiece, PiecesAvailable), % if piece doesn't exist in the available ones, returns false (2 equal pieces max per player)
    validMove(Board, Row, Column, ColorPiece, 1). % Checks if the move is valid, last arg is 2 because we do't want error mensage

generatePlay(Player, Board, Row, Column, PieceWeWantToPlay, EmptyCells, NewCells, PiecesAvailable, 3):-
    wininNextMovePlay(Player, Board, Row, Column, PieceWeWantToPlay, EmptyCells),
    member(PieceWeWantToPlay, PiecesAvailable),
    validMove(Board, Row, Column, PieceWeWantToPlay, 1), % Checks if the move is valid, last arg is 2 because we do't want error mensage
    select([Row, Column], EmptyCells, NewCells), 
    write('DoneWinMovePlay'), sleep(1).  % removes from empty cells

/**
 * when there are not any winning play, we do a valid random play
 * The arg Pieces is the avalaible pieces of the Player playing and NewPieces, the Pieces except that is being play
 */
generatePlay(_Player, Board, Row, Column, Piece, EmptyCells, NewCells, PiecesAvailable, _Level):-
    repeat,
    write('Random\n'), sleep(1),
    random_member([Row| [Column| _]], EmptyCells),
    random_member(Piece, PiecesAvailable),
    validMove(Board, Row, Column, Piece, 1), %fails if move not valid
    select([Row, Column], EmptyCells, NewCells).  % removes from empty cells


/**
 * Generates good plays, only done if user choose nivel 3 and there is not a winning play

generatePlay(_Player, Board, Row, Column, Piece, Cells, NewCells, PiecesAvailable, 3) :-
    goodPlay(Board, Row, Column, Piece, PiecesAvailable),
    validMove(Board, Row, Column, Piece, 1), % Checks if the move is valid
    member(Piece, PiecesAvailable), % if piece doesn't exist in the available ones, returns false
    select([Row, Column], Cells, NewCells).  % removes from empty cells

goodPlay(Board, Row, Column, Piece, Pieces) :-
    getRowSumC(Board, Row, RowSum),
    getPossiblePiece(Piece, RowSum, Pieces), 
    getEmptyColumn(Board, Row, Column). % gets firts of the collumn without a piece

goodPlay(Board, Row, Column, Piece, Pieces) :-
    getColumnSumC(Board, Column, 0, ColSum),
    getPossiblePiece(Piece, ColSum, Pieces),
    getEmptyRow(Board, Row, Column).

*/
 /*
 * If there are two pieces in one row, column ou square playing there leaves a winning play for the other,
 * so we want to avoid it, playing in empty or 1 piece rows
 *//*
getPossiblePiece(Piece, 0, Pieces) :- % if there is no piece there we can play anything
    random_member(Piece, Pieces).

getPossiblePiece(Piece, 1, Pieces) :-
    random_member(Piece, Pieces).

getPossiblePiece(Piece, 5, Pieces) :-
    random_member(Piece, Pieces).

getPossiblePiece(Piece, 7, Pieces) :-
    random_member(Piece, Pieces).

getPossiblePiece(Piece, 9, Pieces) :-
    random_member(Piece, Pieces).
*/
