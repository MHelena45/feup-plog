:- use_module(library(random)).

numberToPiece('cone', 1).
numberToPiece('cylinder', 2).
numberToPiece('sphere', 3).
numberToPiece('cube', 4).

/**
 *
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
    
/* Check if Row and column don't have a piece for computer play , if true the game continues */
isEmpty(Board, Row, Column) :-
    getPieceFromBoard(Row, Column, Board, Piece),
    Piece == 0.

/* Check if the random movimen done by the computer is correct */
validMove( Board, Row, Column, Piece) :-
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
