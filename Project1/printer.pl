:- include('piecesPrinter.pl').

display_game(Board, WhitePieces, BrownPieces) :-
    printColumnCoordinates,
    printBoardContent(Board, 1),
    printLegend.

printBoardContent([], _). 
printBoardContent([Line|Rest], NumLine) :- 
    printLineCoord(NumLine), 
    printBoardLine(Line, 1), 
    printNewLine, 
    printLineSeperators(NumLine),
    NumLine1 is NumLine + 1,
    printBoardContent(Rest, NumLine1).

printBoardLine(Line, PieceLine) :-
    PieceLine < 20,
    printLine(Line, 1, PieceLine),
    PieceLine1 is PieceLine + 1,
    printBoardLine(Line, PieceLine1).

printLine([], _).
printLine([Cell|Rest], NumCol, PieceLine) :-  
    printCell(Cell, NumCol, PieceLine), 
    NumCol1 is NumCol + 1,
    printLine(Rest, NumCol1, PieceLine).

printCell(Cell, NumCol, PieceLine) :-
    printPiece(Cell, PieceLine), 
    printSeperator(NumCol).

% special prints
printColumnCoordinates :-   
    write('\n     1      2      3      4    \n'),
    write('  xxxxxxxxxxxxxxxxxxxxxxxxxxxxx\n').

printLineSeperators(2) :-   write('  Xxxxxxx|xxxxxxXxxxxxx|xxxxxxX\n').
printLineSeperators(4) :-   write('  XxxxxxxxxxxxxxXxxxxxxxxxxxxxX\n').
printLineSeperators(_) :-   write('  X______|______X______|______X\n').
printNewLine :-             write('\n').
printSeperator(2) :-        write('  X  ').
printSeperator(4) :-        write('  X  ').
printSeperator(_) :-        write('  |  ').
printLineCoord(N) :- 
    write(N),
    write(' X  ').

printLegend :- 
    write('LEGEND:\n'),
    write('Piece: <solid>_<color>\n'),
    write(' Solid    -  Symbol     Color  -  Symbol\n'),
    write('  Cone    -    A        Brown  -    b\n'),
    write('  Cube    -    M        White  -    w\n'),
    write('Cylinder  -    H\n'),
    write(' Sphere   -    O\n').
     
