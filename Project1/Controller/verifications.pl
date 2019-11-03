% ========================================================================
% --------------------------- VERIFICATIONS ------------------------------
% =========================================================================

% =================================================================================
%       Deal with invalid plays
% =================================================================================

validPlay(Player, Board, WhitePieces, BrownPieces, Row, Column, Piece) :-
    isEmpty(Board, WhitePieces, BrownPieces, Row, Column, Player), % Checks if the position is empty 
    validMove(Player, Board, WhitePieces, BrownPieces, Row, Column, Piece), % Checks if the move is valid
    isPieceAvailable(Player, Board, Piece, WhitePieces, BrownPieces). % Checks if the piece is available (2 equal pieces max per player)

% ----------------------------------- IS EMPTY ---------------------------------

/* Check if Row and column don't have a piece, if true the game continues */
isEmpty(Board, _WhitePieces, _BrownPieces, Row, Column, _Player) :-
    getPieceFromBoard(Row, Column, Board, Piece),
    Piece == 0.
    
/* If is not empty, player as to play again. An error message is displayed. */
isEmpty(Board, WhitePieces, BrownPieces, Row, Column, P) :-
    notEmpty(Row, Column), % Displays message to user
    play(P, Board, WhitePieces, BrownPieces).

% ----------------------------------- PIECE AVAILABLE ---------------------------------

isPieceAvailable(1, _Board, Piece, WhitePieces, _BrownPieces) :-
    searchPiece(Piece, WhitePieces).

isPieceAvailable(2, _Board, Piece, _WhitePieces, BrownPieces) :-
    searchPiece(Piece, BrownPieces).

isPieceAvailable(Player, Board, _Piece, WhitePieces, BrownPieces) :-
    unavailablePiece,
    play(Player, Board, WhitePieces, BrownPieces).

searchPiece(Piece, Board) :-
    pieceRow(Piece, NumRow),
    searchPieceInRow(Piece, Board, NumRow).

searchPieceInRow(Piece, [Row| _Rest], 1) :-
    searchPieceInColumns(Piece, Row).
searchPieceInRow(Piece, [_Row| Rest], NumRow) :- 
    NumRow > 1, NumRow1 is NumRow - 1,
    searchPieceInRow(Piece, Rest, NumRow1).

searchPieceInColumns(Piece, [Piece| _More]). % Found piece
searchPieceInColumns(Piece, [_Column| More]) :-
    searchPieceInColumns(Piece, More).

% Number of Row in Pieces Board for each piece
pieceRow(11, 1). % White Cone
pieceRow(51, 2). % White Cube
pieceRow(71, 3). % White Cylinder
pieceRow(91, 4). % White Sphere

pieceRow(12, 1). % Brown Cone
pieceRow(52, 2). % Brown Cube
pieceRow(72, 3). % Brown Cylinder
pieceRow(92, 4). % Brown Sphere

% ----------------------------------- CHECK END ---------------------------------
% sucess if game is not over
checkEnd(_Player, Board, Row, Column, _CongratulateNumber) :-
    getRowSum(Board, Row, RowSum),
    RowSum =\= 22,
    getColumnSum(Board, Column, 0, ColSum),
    ColSum =\= 22,
    getSquareNum(Row, Column, SquareNum),
    getSquareSum(SquareNum, Board, SquareSum),
    SquareSum =\= 22.

% if game end and the winner a person ou a Computer is a game Computer vs computer
checkEnd(Player, _Board, _Row, _Column, 1) :-
    congratulatePlayer(Player),
    askMenuOption,
    read(Input),
    manageInput(Input).

% if game end and the winner of the play Computer vs Person is the COmputer
checkEnd(_Player, _Board, _Row, _Column, 2) :-
    sorryPlayer, % if computer wins a person, congratulate Menu is different
    askMenuOption,
    read(Input),
    manageInput(Input).

getRowSum([Row| _Rest], 1, Solution) :-
    sumRow(Row, 0, Solution).
getRowSum([_Row| Rest], NumRow, Sum) :-
    NumRow > 1,
    NumRow1 is NumRow - 1,
    getRowSum(Rest, NumRow1, Sum).

sumRow([], Sum, Sum).
sumRow([Col| More], Sum, Solution) :-
    Value is div(Col, 10),
    Sum1 is Sum + Value,
    sumRow(More, Sum1, Solution).

getColumnSum([], _Column, Sum, Sum).
getColumnSum([Row| Rest], Column, Sum, Solution) :-
    getRowValue(Row, Column, Value),
    Sum1 is Value + Sum, 
    getColumnSum(Rest, Column, Sum1, Solution).

getRowValue([Col| _More], 1, Value) :-
    Value is div(Col, 10).
getRowValue([_Col| More], NumColumn, Value) :-
    NumColumn > 1,
    NumColumn1 is NumColumn - 1,
    getRowValue(More, NumColumn1, Value).

getSquareSum(1, Board, SquareSum) :-
    getSquareValue(1, 1, Board, Value1),
    getSquareValue(1, 2, Board, Value2),
    getSquareValue(2, 1, Board, Value3),
    getSquareValue(2, 2, Board, Value4),
    SquareSum1 is Value1 + Value2,
    SquareSum2 is Value3 + Value4,
    SquareSum is SquareSum1 + SquareSum2.

getSquareSum(2, Board, SquareSum) :-
    getSquareValue(1, 3, Board, Value1),
    getSquareValue(1, 4, Board, Value2),
    getSquareValue(2, 3, Board, Value3),
    getSquareValue(2, 4, Board, Value4),
    SquareSum1 is Value1 + Value2,
    SquareSum2 is Value3 + Value4,
    SquareSum is SquareSum1 + SquareSum2.

getSquareSum(3, Board, SquareSum) :-
    getSquareValue(3, 1, Board, Value1),
    getSquareValue(3, 2, Board, Value2),
    getSquareValue(4, 1, Board, Value3),
    getSquareValue(4, 2, Board, Value4),
    SquareSum1 is Value1 + Value2,
    SquareSum2 is Value3 + Value4,
    SquareSum is SquareSum1 + SquareSum2.

getSquareSum(4, Board, SquareSum) :-
    getSquareValue(3, 3, Board, Value1),
    getSquareValue(3, 4, Board, Value2),
    getSquareValue(4, 3, Board, Value3),
    getSquareValue(4, 4, Board, Value4),
    SquareSum1 is Value1 + Value2,
    SquareSum2 is Value3 + Value4,
    SquareSum is SquareSum1 + SquareSum2.

getSquareValue(Row, Column, Board, Value) :-
    getPieceFromBoard(Row, Column, Board, Piece),
    Value is div(Piece, 10).

% ----------------------------------- VALID MOVE ---------------------------------

validMove(_Player, Board, _WhitePieces, _BrownPieces, Row, Column, Piece) :-
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

/* If move isn't valid, repeat that play */
validMove(Player, Board, WhitePieces, BrownPieces, _Row, _Column, _Piece) :-
    wrongMove, % Displays message to player
    play(Player, Board, WhitePieces, BrownPieces).

checkTop(5, _Column, _Board, _Piece).
checkTop(Row, Column, Board, Piece) :-
    getOpposite(Piece, Opposite),
    comparePiece(Row, Column, Board, Opposite),
    NewRow is Row + 1,
    checkTop(NewRow, Column, Board, Piece).

checkDown(0, _Column, _Board, _Piece).
checkDown(Row, Column, Board, Piece) :-
    getOpposite(Piece, Opposite),
    comparePiece(Row, Column, Board, Opposite),
    NewRow is Row - 1,
    checkDown(NewRow, Column, Board, Piece).

checkLeft(_Row, 5, _Board, _Piece).
checkLeft(Row, Column, Board, Piece) :-
    getOpposite(Piece, Opposite),
    comparePiece(Row, Column, Board, Opposite),
    NewColumn is Column + 1,
    checkLeft(Row, NewColumn, Board, Piece).

checkRigth(_Row, 0, _Board, _Piece).
checkRigth(Row, Column, Board, Piece) :-
    getOpposite(Piece, Opposite),
    comparePiece(Row, Column, Board, Opposite),
    NewColumn is Column - 1,
    checkRigth(Row, NewColumn, Board, Piece).

checkSquare(1, Piece, Board) :-
    getOpposite(Piece, Opposite),
    comparePiece(1, 1, Board, Opposite),
    comparePiece(1, 2, Board, Opposite),
    comparePiece(2, 1, Board, Opposite),
    comparePiece(2, 2, Board, Opposite).
    
checkSquare(2, Piece, Board) :-
    getOpposite(Piece, Opposite),
    comparePiece(1, 3, Board, Opposite),
    comparePiece(1, 4, Board, Opposite),
    comparePiece(2, 3, Board, Opposite),
    comparePiece(2, 4, Board, Opposite).

checkSquare(3, Piece, Board) :-
    getOpposite(Piece, Opposite),
    comparePiece(3, 1, Board, Opposite),
    comparePiece(3, 2, Board, Opposite),
    comparePiece(4, 1, Board, Opposite),
    comparePiece(4, 2, Board, Opposite).

checkSquare(4, Piece, Board) :-
    getOpposite(Piece, Opposite),
    comparePiece(3, 3, Board, Opposite),
    comparePiece(3, 4, Board, Opposite),
    comparePiece(4, 3, Board, Opposite),
    comparePiece(4, 4, Board, Opposite).

comparePiece(Row, Column, Board, Opposite) :-
    getPieceFromBoard(Row, Column, Board, Piece),
    Piece =\= Opposite.

getSquareNum(Row, Column, 1) :-
    Row < 3, 
    Column < 3.

getSquareNum(Row, Column, 2) :-
    Row < 3, 
    Column > 2.

getSquareNum(Row, Column, 3) :-
    Row > 2, 
    Column < 3.

getSquareNum(Row, Column, 4) :-
    Row > 2, 
    Column > 2.

/* Piece we can not find in the same row, column ou square */
getOpposite(11, 12).
getOpposite(51, 52).
getOpposite(71, 72).
getOpposite(91, 92).

getOpposite(12, 11).
getOpposite(52, 51).
getOpposite(72, 71).
getOpposite(92, 91).

% ----------------------------------- VALID POSITION ---------------------------------
% Check if row and Column are valid (between 1 and 4 inclusive)
checkPosition(Pos) :-
    Pos < 5,
    Pos > 0. 

% ----------------------------------- VALID PIECE ---------------------------------
% Accepted pieces
checkPiece(cone).
checkPiece(sphere).
checkPiece(cylinder).
checkPiece(cube).

% =================================
%           Get Piece
% =================================

getPieceFromList([H|_T], 1, Piece) :-
    Piece = H.

getPieceFromList([_H|T], Index, Piece) :-
    Index > 1,
    Index1 is Index - 1,
    getPieceFromList(T, Index1, Piece).

getPieceFromBoard(1, Column, [H|_T], Piece) :-
    getPieceFromList(H, Column, Piece).

getPieceFromBoard(Row, Column, [_H|T], Piece) :-
    Row > 1,
    Row1 is Row - 1,
    getPieceFromBoard(Row1, Column, T, Piece).
