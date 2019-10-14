include("printer.pl").

initBoard([
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty]
    ]).

start :- 
    initBoard(X), 
    printBoard(X).

