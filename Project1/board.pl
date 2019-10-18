:- include('printer.pl').

initBoard([
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty]
    ]).

start :- 
    initBoard(X), 
    display_game(X).

% playPiece(Row, Column, Piece, TabIn, TabOut) :-
%   updateRow(Row, Column, Piece, TabIn, TabOut).

%updateRow(1, Column, Piece, [Row| More], [NewRow| More]):-
%    updateColumn(Column, Piece, Row, NewRow).

%updateRow(N, Column, Piece, [Row| More], [Row| MoreRows]) :-
%    N > 1, Next is N-1, updateRow(Next, Column, Piece, More, MoreRows).

%updateColumn(1, Piece, [_ | Rest], [Piece | Rest]).

%updateColumn(N, Piece, [P | Rest], [P| More]) :-
%    N>1, Next is N-1, updateColumn(Next, Piece, Rest, More).
