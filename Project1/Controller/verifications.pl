% ========================================================================
% --------------------------- VERIFICATIONS ------------------------------
% =========================================================================

% Check if row and Column are valid (between 1 and 4 inclusive)
checkPosition(Pos) :-
    Pos < 5,
    Pos > 0. 

% Accepted pieces
checkPiece(cone).
checkPiece(sphere).
checkPiece(cylinder).
checkPiece(cube).

/* Piece we can not find in the same row, column ou square */
opost(11, 12).
opost(51, 52).
opost(71, 72).
opost(91, 92).

opost(12, 11).
opost(52, 51).
opost(72, 71).
opost(92, 91).

checkPlay(Piece, Row, _Column, Player) :-
    checkValidRow(Piece, Player, Row).

check_Top(_Board, 5, _Column, _Piece).
check_Top(Board, Row, Column, Piece) :-
    opost(Opost , Piece),
    getPieceFromBoard(Board, Row, Column, PieceThere),
    PieceThere =\= Opost,
    NewRow is Row+1,
    check_Top(Board, NewRow, Column, Piece).

check_Down(_Board, 0, _Column, _Piece).
check_Down(Board, Row, Column, Piece) :-
    opost(Opost , Piece),
    getPieceFromBoard(Board, Row, Column, PieceThere),
    PieceThere =\= Opost,
    NewRow is Row-1,
    check_Down(Board, NewRow, Column, Piece).

check_Left(_Board, _Row, 5, _Piece).
check_Left(Board, Row, Column, Piece) :-
    opost(Opost , Piece),
    getPieceFromBoard(Board, Row, Column, PieceThere),
    PieceThere =\= Opost,
    NewCollumn is Column + 1,
    check_Left(Board, Row, NewCollumn, Piece).

check_Rigth(_Board, _Row, 0, _Piece).
check_Rigth(Board, Row, Column, Piece) :-
    opost(Opost , Piece),
    getPieceFromBoard(Board, Row, Column, PieceThere),
    PieceThere =\= Opost,
    NewColumn is Column - 1,
    check_Rigth(Board, Row, NewColumn, Piece).

check_square_1(Board, Row, Column, Piece) :-
    Row < 3, Column < 3,
    opost(Opost , Piece),
    getPieceFromBoard(Board, 1, 1, PieceThere),
    PieceThere =\= Opost,
    getPieceFromBoard(Board, 1, 2, PieceThere1),
    PieceThere1 =\= Opost,
    getPieceFromBoard(Board, 2, 1, PieceThere2),
    PieceThere2 =\= Opost,
    getPieceFromBoard(Board, 2, 2, PieceThere3),
    PieceThere3 =\= Opost.

/* Piece is not going to be place in the first square */
check_square_1(_Board, Row, _Column, _Piece):-
    Row > 2. 
check_square_1(_Board, _Row, Column, _Piece):-
    Column > 2.

check_square_2(Board, Row, Column, Piece) :-
    Row > 2, Column < 3,
    opost(Opost , Piece),
    getPieceFromBoard(Board, 1, 3, PieceThere),
    PieceThere =\= Opost,
    getPieceFromBoard(Board, 1, 4, PieceThere1),
    PieceThere1 =\= Opost,
    getPieceFromBoard(Board, 2, 3, PieceThere2),
    PieceThere2 =\= Opost,
    getPieceFromBoard(Board, 2, 4, PieceThere3),
    PieceThere3 =\= Opost.

/* Piece is not going to be place in the second square */
check_square_2(_Board, Row, _Column, _Piece) :-
    Row < 3.
check_square_2(_Board, _Row, Column, _Piece) :-
    Column > 2.

check_square_3(Board, Row, Column, Piece) :-
    Row > 2, Column < 3,
    opost(Opost , Piece),
    getPieceFromBoard(Board, 3, 1, PieceThere),
    PieceThere =\= Opost,
    getPieceFromBoard(Board, 3, 2, PieceThere1),
    PieceThere1 =\= Opost,
    getPieceFromBoard(Board, 4, 1, PieceThere2),
    PieceThere2 =\= Opost,
    getPieceFromBoard(Board, 4, 2, PieceThere3),
    PieceThere3 =\= Opost.

/* Piece is not going to be place in the first square */
check_square_3(_Board, Row, _Column, _Piece):-
    Row < 3. 
check_square_3(_Board, _Row, Column, _Piece):-
    Column > 2.

check_square_4(Board, Row, Column, Piece) :-
    Row > 2,
    Column > 2,
    opost(Opost , Piece),
    getPieceFromBoard(Board, 3, 3, PieceThere),
    PieceThere =\= Opost,
    getPieceFromBoard(Board, 3, 4, PieceThere1),
    PieceThere1 =\= Opost,
    getPieceFromBoard(Board, 4, 3, PieceThere2),
    PieceThere2 =\= Opost,
    getPieceFromBoard(Board, 4, 4, PieceThere3),
    PieceThere3 =\= Opost.

/* Piece is not going to be place in the second square */
check_square_4(_Board, Row, _Column, _Piece) :-
    Row < 3.
check_square_4(_Board, _Row, Column, _Piece) :-
    Column < 3.

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

% =================================================================================
%       Deal with invalid plays
% =================================================================================

/* Check if Row and column don't have a piece, if true the game continues */
isEmpty(Board, _WhitePieces, _BrownPieces, Row, Column, _Player) :-
    getPieceFromBoard(Board, Row, Column, Piece),
    Piece == 0.
    
/* if is not empty, player as to play again. A error mensage is displayed. */
isEmpty(Board, WhitePieces, BrownPieces, Row, Column, P) :-
    notEmpty(Row, Column),
    play(P, Board, WhitePieces, BrownPieces).

valid_move(_Player, Board, _WhitePieces, _BrownPieces, Row, Column, Piece) :-
    Row1 is Row + 1,
    check_Top(Board, Row1, Column, Piece),
    Row2 is Row - 1,
    check_Down(Board, Row2, Column, Piece), 
    Column1 is Column + 1,
    check_Left(Board, Row, Column1, Piece),
    Column2 is Column - 1,
    check_Rigth(Board, Row, Column2, Piece),
    check_square_1(Board, Row, Column, Piece),
    check_square_2(Board, Row, Column, Piece),
    check_square_3(Board, Row, Column, Piece),
    check_square_4(Board, Row, Column, Piece).

/* if move isn't valid, repeat that play */
valid_move(Player, Board, WhitePieces, BrownPieces, _Row, _Column, _Piece) :-
    wrongMove,
    play(Player, Board, WhitePieces, BrownPieces).