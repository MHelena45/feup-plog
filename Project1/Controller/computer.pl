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

% ============================================================================
%         fucntions used to generate a play for us to win in the next play
% ============================================================================

% check all the columns
isTherePieceMineinTheColumn(1, Column, Piece1, Piece2, Board, PieceWeWantToPlay) :-
    isTherePieceMine(1,Column, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheColumn(2, Column, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(2, Column, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheColumn(3, Column, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(3, Column, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheColumn( 4, Column, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(4, Column, Piece1, Piece2, Board, PieceWeWantToPlay).

% check all the Rows
isTherePieceMineinTheRow(Row, 1, Piece1, Piece2, Board, PieceWeWantToPlay) :-
    isTherePieceMine(Row, 1, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheRow(Row, 2, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(Row, 2, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheRow(Row, 3, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(Row, 3, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheRow(Row, 4, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(Row, 4, Piece1, Piece2, Board, PieceWeWantToPlay).

% check the 4 positions of the square given by number
% First square
isTherePieceMineinTheSquare(1, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(1, 1, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheSquare(1, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(1, 2, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheSquare(1, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(2, 1, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheSquare(1, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(2, 2, Piece1, Piece2, Board, PieceWeWantToPlay).

% second square
isTherePieceMineinTheSquare(2, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(1, 3, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheSquare(1, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(1, 4, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheSquare(1, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(2, 3, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheSquare(1, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(2, 4, Piece1, Piece2, Board, PieceWeWantToPlay).

% third square
isTherePieceMineinTheSquare(3, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(3, 1, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheSquare(3, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine( 3, 2, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheSquare(3, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(4, 1, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheSquare(3, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(4, 2, Piece1, Piece2, Board, PieceWeWantToPlay).

% four square
isTherePieceMineinTheSquare(4, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(3, 3, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheSquare(4, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(3, 4, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheSquare(4, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(4, 3, Piece1, Piece2, Board, PieceWeWantToPlay).

isTherePieceMineinTheSquare(4, Piece1, Piece2, Board, PieceWeWantToPlay ) :-
    isTherePieceMine(4, 4, Piece1, Piece2, Board, PieceWeWantToPlay).

% Function used to check if the poistion has one of two wanted pieces 
isTherePieceMine(Row, Column, Piece1, Piece2, Board, Piece2) :- % The piece we find is the one we don't want to play
    check(Row, Column, Board, Piece1).

isTherePieceMine(Row, Column, Piece1, Piece2, Board, Piece1) :-
    check(Row, Column, Board, Piece2).

check(Row, Column, Board, Piece) :-
    getPieceFromBoard(Row, Column, Board, PieceinTheBoard),
    Piece == PieceinTheBoard.

% Check if there is 2 (and only 2) diferent pieces
isPossible(Sum, cylinder, sphere) :-
    Sum == 6.

isPossible(Sum, cube, sphere) :-
    Sum == 8.

isPossible(Sum, cylinder, cube) :-
    Sum == 10.

isPossible(Sum, sphere, cone) :-
    Sum == 12.

isPossible(Sum, cylinder, cone) :-
    Sum == 14.

isPossible(Sum, cube, cone) :-
    Sum == 16.

checkAndget2PiecesMissing(Sum, Player, Piece1, Piece2) :-
    isPossible(Sum, Piece1Name, Piece2Name), % checks if there are 2 and only 2 pieces, that are differente
    translate(Piece1Name, Player, Piece1),
    translate(Piece2Name, Player, Piece2).

isTherePiceMineinColumnSquare(_SquareNum, Column, Piece1, Piece2, Board, PieceWeWantToFind) :-
   isTherePieceMineinTheColumn(_, Column, Piece1, Piece2, Board, PieceWeWantToFind). % the row were the Piece is doesn't mather

isTherePiceMineinColumnSquare(SquareNum, _Column, Piece1, Piece2, Board, PieceWeWantToFind) :-
    isTherePieceMineinTheSquare(SquareNum, Piece1, Piece2, Board, PieceWeWantToFind).

isTherePiceMineinRowSquare(_SquareNum, Row, Piece1, Piece2, Board, PieceWeWantToFind) :-
   isTherePieceMineinTheRow(Row, _, Piece1, Piece2, Board, PieceWeWantToFind). % the row were the Piece is doesn't mather

isTherePiceMineinRowSquare(SquareNum, _Row, Piece1, Piece2, Board, PieceWeWantToFind) :-
    isTherePieceMineinTheSquare(SquareNum, Piece1, Piece2, Board, PieceWeWantToFind).

isTherePiceMineinRowOrColumn(_Row, Column, Piece1, Piece2, Board, PieceWeWantToFind) :-
   isTherePieceMineinTheColumn(_, Column, Piece1, Piece2, Board, PieceWeWantToFind). % the row were the Piece is doesn't mather

isTherePiceMineinRowOrColumn(Row, _Column, Piece1, Piece2, Board, PieceWeWantToFind) :-
   isTherePieceMineinTheRow(Row, _, Piece1, Piece2, Board, PieceWeWantToFind). % the row were the Piece is doesn't mather

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
    checkAndget2PiecesMissing(RowSum, Player, Piece1, Piece2),
    getEmptyRow(Row, Column, EmptyCells),
    getSquareNum(Row, Column, SquareNum),
    isTherePiceMineinColumnSquare(SquareNum, Column, Piece1, Piece2, Board, PieceWeWantToPlay),
    select([Row, Column] , EmptyCells, NewEmptyCells),
    getEmptyRow(Row, ColumnOfThePlay, NewEmptyCells).

wininNextMoveWithaColumn(Player, Board, RowOfThePlay, Column, PieceWeWantToPlay, EmptyCells) :-
    getColumnSumC(Board, Column, 0, ColSum),
    checkAndget2PiecesMissing(ColSum, Player, Piece1, Piece2),
    getEmptyColumn(Row, Column, EmptyCells),
    getSquareNum(Row, Column, SquareNum),
    isTherePiceMineinRowSquare(SquareNum, Row, Piece1, Piece2, Board, PieceWeWantToPlay),
    select([Row, Column] , EmptyCells, NewEmptyCells),
    getEmptyColumn(RowOfThePlay, Column, NewEmptyCells).

wininNextMoveWithaSquare(Player, Board, RowOfThePlay, ColumnOfThePlay, PieceWeWantToPlay, EmptyCells) :-
    getSquareSumC(SquareNum, Board, SquareSum),
    checkAndget2PiecesMissing(SquareSum, Player, Piece1, Piece2),
    getEmptySquare(Row, Column , SquareNum, EmptyCells),
    isTherePiceMineinRowOrColumn(Row, Column, Piece1, Piece2, Board, PieceWeWantToPlay),
    select([Row, Column] , EmptyCells, NewEmptyCells),
    getEmptySquare(RowOfThePlay, ColumnOfThePlay, SquareNum, NewEmptyCells).

wininNextMovePlay(Player, Board, Row, ColumnOfThePlay, PieceWeWantToPlay, EmptyCells ) :-
    wininNextMoveWithaRow(Player, Board, Row, ColumnOfThePlay, PieceWeWantToPlay, EmptyCells).

wininNextMovePlay(Player, Board, Row, ColumnOfThePlay, PieceWeWantToPlay, EmptyCells ) :-
    wininNextMoveWithaColumn(Player, Board, Row, ColumnOfThePlay, PieceWeWantToPlay, EmptyCells).

wininNextMovePlay(Player, Board, Row, ColumnOfThePlay, PieceWeWantToPlay, EmptyCells ) :-
    wininNextMoveWithaSquare(Player, Board, Row, ColumnOfThePlay, PieceWeWantToPlay, EmptyCells).
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Functions use to get a good Play
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% doesn't have to worry with passing the EmptyCells because the game is going to end after this play
choose_move(Board, Level, Move, Player, EmptyCells, _NewEmptyCells, PiecesAvailable) :-
    Level =\= 1, % if Level one, only generates random plays
    winPlay(Board, Row, Column, Piece, EmptyCells), % Only returns a valid Row and column position that is empty
    translate(Piece, Player, ColorPiece),
    member(ColorPiece, PiecesAvailable), % if piece doesn't exist in the available ones, returns false (2 equal pieces max per player)
    validMove(Board, Row, Column, ColorPiece, 1), % Checks if the move is valid, last arg is 2 because we do't want error mensage
    Move = [Row, Column, ColorPiece].

choose_move(Board, 3, Move, Player, EmptyCells, NewEmptyCells, PiecesAvailable) :-
    wininNextMovePlay(Player, Board, Row, Column, PieceWeWantToPlay, EmptyCells),
    member(PieceWeWantToPlay, PiecesAvailable),
    validMove(Board, Row, Column, PieceWeWantToPlay, 1), % Checks if the move is valid, last arg is 2 because we do't want error mensage
    select([Row, Column], EmptyCells, NewEmptyCells),  % removes from empty cells
    Move = [Row, Column, PieceWeWantToPlay].

/**
 * when there are not any winning play, we do a valid random play
 * The arg Pieces is the avalaible pieces of the Player playing and NewPieces, the Pieces except that is being play
 */
choose_move(Board, _Level, Move, _Player, EmptyCells, NewEmptyCells, PiecesAvailable) :-
    valid_moves(Board, EmptyCells, PiecesAvailable, ListOfMoves),
    random_member(Move, ListOfMoves),
    nth0(0, Move, Row),
    nth0(1, Move, Column),
    select([Row, Column], EmptyCells, NewEmptyCells).  % removes from empty cells

valid_moves(Board, EmptyCells, PiecesAvailable, ListOfMoves) :-
    getAllValidMoves(Board, EmptyCells, PiecesAvailable, [], ListOfMoves). % inicialy the List of moves is empty

getAllValidMoves(_, [], _, ListOfMoves, ListOfMoves).
getAllValidMoves(Board, [CellChecking | OtherEmptyCells], PiecesAvailable, ListOfMoves, NewListOfMoves1) :-
    getValidMovesOfCell(Board, CellChecking, PiecesAvailable, ListOfMoves, NewListOfMoves),
    getAllValidMoves(Board, OtherEmptyCells, PiecesAvailable, NewListOfMoves, NewListOfMoves1).

% check Valid moves for all Pieces available for a given emptyCell
getValidMovesOfCell( _Board, _EmptyCellChecking, [], ListOfMoves, ListOfMoves).    
getValidMovesOfCell(Board, EmptyCellChecking, [Piece | OtherPiecesAvailable], ListOfMoves, NewListOfMoves) :-
    checkCellForm(Board, EmptyCellChecking, Piece, ListOfMoves, ListOfMoves1 ),
    getValidMovesOfCell(Board, EmptyCellChecking, OtherPiecesAvailable, ListOfMoves1, NewListOfMoves).

getValidMovesOfCell(Board, EmptyCells, [ _Piece | OtherPiecesAvailable], ListOfMoves, NewListOfMoves) :-
    getValidMovesOfCell(Board, EmptyCells, OtherPiecesAvailable, ListOfMoves, NewListOfMoves).

checkCellForm(Board, [Row, Column], Piece, ListOfMoves, NewListOfMoves ) :-
    validMove(Board, Row, Column, Piece, 1), %fails if move not valid
    select([Row, Column, Piece], NewListOfMoves, ListOfMoves).

/**
 * Try not to repeat pieces
 */
 /*
choose_move(Board, Level, Move, Player, EmptyCells, _NewEmptyCells, PiecesAvailable) :-
    goodPlay(Board, Row, Column, Piece, PiecesAvailable),
    validMove(Board, Row, Column, Piece, 1), % Checks if the move is valid
    member(Piece, PiecesAvailable), % if piece doesn't exist in the available ones, returns false
    select([Row, Column], Cells, NewEmptyCells).  % removes from empty cells

goodPlay(Board, Row, Column, Piece, Pieces) :-
    getRowSumC(Board, Row, RowSum),
    getPossiblePiece(Piece, RowSum, Pieces), 
    getColumnSumC(Board, Column, 0, ColSum),
    getPossiblePiece(Piece, ColSum, Pieces),


getPossiblePiece(Piece, 0, Pieces) :- % if there is no piece there we can play anything
    random_member(Piece, Pieces).

getPossiblePiece(Piece, 1, Pieces) :-
    select(11, Pieces, NewPieces,
    random_member(NewPiece, Pieces).

getPossiblePiece(Piece, 1, Pieces) :-
    select(12, Pieces, NewPieces,
    random_member(NewPiece, Pieces).

getPossiblePiece(Piece, 5, Pieces) :-
    select(51, Pieces, NewPieces,
    random_member(NewPiece, Pieces).

getPossiblePiece(Piece, 5, Pieces) :-
    select(52, Pieces, NewPieces,
    random_member(NewPiece, Pieces).

getPossiblePiece(Piece, 9, Pieces) :-
    select(91, Pieces, NewPieces,
    random_member(NewPiece, Pieces).

getPossiblePiece(Piece, 9, Pieces) :-
    select(92, Pieces, NewPieces,
    random_member(NewPiece, Pieces).

getPossiblePiece(Piece, 7, Pieces) :-
    select(11, Pieces, NewPieces,
    random_member(NewPiece, Pieces).

getPossiblePiece(Piece, 7, Pieces) :-
    select(12, Pieces, NewPieces,
    random_member(NewPiece, Pieces).

*/