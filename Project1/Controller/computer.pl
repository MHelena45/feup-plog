:- use_module(library(random)).

numberToPiece('cone', 1).
numberToPiece('cylinder', 2).
numberToPiece('sphere', 3).
numberToPiece('cube', 4).

/**
 *
 */
generatePlay(Player, Row, Column, ColorPiece):-
    random(1, 9, Row),
    random(1, 9, Column),
    random(1, 5, NumberPiece),
    numberToPiece(Piece, NumberPiece),
    translate(Piece, Player, ColorPiece).

validCPlay(Player, Board, WhitePieces, BrownPieces, Row, Column, Piece) :-
    isEmptyC(Board, WhitePieces, BrownPieces, Row, Column, Player), % Checks if the position is empty 
    validMoveC(Player, Board, WhitePieces, BrownPieces, Row, Column, Piece), % Checks if the move is valid
    isPieceAvailableC(Player, Board, Piece, WhitePieces, BrownPieces). % Checks if the piece is available (2 equal pieces max per player)

/* Check if Row and column don't have a piece for computer play , if true the game continues */
isEmptyC(Board, _WhitePieces, _BrownPieces, Row, Column, _Player) :-
    getPieceFromBoard(Row, Column, Board, Piece),
    Piece == 0.

/* Checks if Piece is available for computer moves */
isPieceAvailableC(1, _Board, Piece, WhitePieces, _BrownPieces) :-
    searchPiece(Piece, WhitePieces).

isPieceAvailableC(2, _Board, Piece, _WhitePieces, BrownPieces) :-
    searchPiece(Piece, BrownPieces).
