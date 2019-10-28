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
    getPieceFromBoard(Board, Row, Column, Piece),
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
% TODO: checkEnd(Player, Board, Row, Column) :-



% ----------------------------------- VALID MOVE ---------------------------------
validMove(_Player, Board, _WhitePieces, _BrownPieces, Row, Column, Piece) :-
    Row1 is Row + 1,
    checkTop(Board, Row1, Column, Piece),
    Row2 is Row - 1,
    checkDown(Board, Row2, Column, Piece), 
    Column1 is Column + 1,
    checkLeft(Board, Row, Column1, Piece),
    Column2 is Column - 1,
    checkRigth(Board, Row, Column2, Piece),
    checkSquare1(Board, Row, Column, Piece),
    checkSquare2(Board, Row, Column, Piece),
    checkSquare3(Board, Row, Column, Piece),
    checkSquare4(Board, Row, Column, Piece).

/* If move isn't valid, repeat that play */
validMove(Player, Board, WhitePieces, BrownPieces, _Row, _Column, _Piece) :-
    wrongMove, % Displays message to player
    play(Player, Board, WhitePieces, BrownPieces).

checkTop(_Board, 5, _Column, _Piece).
checkTop(Board, Row, Column, Piece) :-
    opposite(Opposite, Piece),
    getPieceFromBoard(Board, Row, Column, PieceThere),
    PieceThere =\= Opposite,
    NewRow is Row + 1,
    checkTop(Board, NewRow, Column, Piece).

checkDown(_Board, 0, _Column, _Piece).
checkDown(Board, Row, Column, Piece) :-
    opposite(Opposite, Piece),
    getPieceFromBoard(Board, Row, Column, PieceThere),
    PieceThere =\= Opposite,
    NewRow is Row - 1,
    checkDown(Board, NewRow, Column, Piece).

checkLeft(_Board, _Row, 5, _Piece).
checkLeft(Board, Row, Column, Piece) :-
    opposite(Opposite, Piece),
    getPieceFromBoard(Board, Row, Column, PieceThere),
    PieceThere =\= Opposite,
    NewColumn is Column + 1,
    checkLeft(Board, Row, NewColumn, Piece).

checkRigth(_Board, _Row, 0, _Piece).
checkRigth(Board, Row, Column, Piece) :-
    opposite(Opposite , Piece),
    getPieceFromBoard(Board, Row, Column, PieceThere),
    PieceThere =\= Opposite,
    NewColumn is Column - 1,
    checkRigth(Board, Row, NewColumn, Piece).

checkSquare1(Board, Row, Column, Piece) :-
    Row < 3, Column < 3,
    opposite(Opposite, Piece),
    getPieceFromBoard(Board, 1, 1, PieceThere),
    PieceThere =\= Opposite,
    getPieceFromBoard(Board, 1, 2, PieceThere1),
    PieceThere1 =\= Opposite,
    getPieceFromBoard(Board, 2, 1, PieceThere2),
    PieceThere2 =\= Opposite,
    getPieceFromBoard(Board, 2, 2, PieceThere3),
    PieceThere3 =\= Opposite.

/* Piece is not going to be place in the first square */
checkSquare1(_Board, Row, _Column, _Piece):-
    Row > 2. 
checkSquare1(_Board, _Row, Column, _Piece):-
    Column > 2.

checkSquare2(Board, Row, Column, Piece) :-
    Row > 2, Column < 3,
    opposite(Opposite , Piece),
    getPieceFromBoard(Board, 1, 3, PieceThere),
    PieceThere =\= Opposite,
    getPieceFromBoard(Board, 1, 4, PieceThere1),
    PieceThere1 =\= Opposite,
    getPieceFromBoard(Board, 2, 3, PieceThere2),
    PieceThere2 =\= Opposite,
    getPieceFromBoard(Board, 2, 4, PieceThere3),
    PieceThere3 =\= Opposite.

/* Piece is not going to be place in the second square */
checkSquare2(_Board, Row, _Column, _Piece) :-
    Row < 3.
checkSquare2(_Board, _Row, Column, _Piece) :-
    Column > 2.

checkSquare3(Board, Row, Column, Piece) :-
    Row > 2, Column < 3,
    opposite(Opposite , Piece),
    getPieceFromBoard(Board, 3, 1, PieceThere),
    PieceThere =\= Opposite,
    getPieceFromBoard(Board, 3, 2, PieceThere1),
    PieceThere1 =\= Opposite,
    getPieceFromBoard(Board, 4, 1, PieceThere2),
    PieceThere2 =\= Opposite,
    getPieceFromBoard(Board, 4, 2, PieceThere3),
    PieceThere3 =\= Opposite.

/* Piece is not going to be place in the first square */
checkSquare3(_Board, Row, _Column, _Piece):-
    Row < 3. 
checkSquare3(_Board, _Row, Column, _Piece):-
    Column > 2.

checkSquare4(Board, Row, Column, Piece) :-
    Row > 2,
    Column > 2,
    opposite(Opposite , Piece),
    getPieceFromBoard(Board, 3, 3, PieceThere),
    PieceThere =\= Opposite,
    getPieceFromBoard(Board, 3, 4, PieceThere1),
    PieceThere1 =\= Opposite,
    getPieceFromBoard(Board, 4, 3, PieceThere2),
    PieceThere2 =\= Opposite,
    getPieceFromBoard(Board, 4, 4, PieceThere3),
    PieceThere3 =\= Opposite.

/* Piece is not going to be place in the second square */
checkSquare4(_Board, Row, _Column, _Piece) :-
    Row < 3.
checkSquare4(_Board, _Row, Column, _Piece) :-
    Column < 3.

/* Piece we can not find in the same row, column ou square */
opposite(11, 12).
opposite(51, 52).
opposite(71, 72).
opposite(91, 92).

opposite(12, 11).
opposite(52, 51).
opposite(72, 71).
opposite(92, 91).

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

getPieceFromBoard([H|_T], 1, Column, Piece) :-
    getPieceFromList(H, Column, Piece).

getPieceFromBoard([_H|T], Row, Column, Piece) :-
    Row > 1,
    Row1 is Row - 1,
    getPieceFromBoard(T, Row1, Column, Piece).
