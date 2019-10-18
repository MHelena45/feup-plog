:- include('printer.pl').

initBoard([
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty]
    ]).

midBoard([
    [sphere_white, empty, empty, cylinder_white],
    [cube_brown, empty, empty, empty],
    [empty, cube_white, cone_brown, empty],
    [empty, empty, empty, cube_brown]
    ]).


finBoard([
    [sphere_white, empty, empty, cylinder_white],
    [cube_brown, cylinder_white, empty,cone_white],
    [empty, cube_white, cone_brown, sphere_brown],
    [empty, empty, empty, cube_brown]
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
