display_game(X, W, B) :-
    printColumnCoordinates,
    printBoardContent(X, 1),
    printLegend.

printBoardContent([], _). 
printBoardContent([L|T], N) :- 
    printLineCoord(N), 
    printLine(L, 1), 
    printNewLine, 
    printLineSeperators(N),
    N1 is N + 1,
    printBoardContent(T, N1).

printLine([], _).
printLine([C|T], N) :-  
    printCell(C, N), 
    N1 is N + 1,
    printLine(T, N1).

printCell(C, N) :-
    translate(C, P), 
    write(P), 
    printSeperator(N).

translate(0, '..').

% white pieces
translate(41, 'Ow').
translate(31, 'Hw').
translate(21, 'Mw').
translate(11, 'Aw').

% brown pieces
translate(42, 'Ob').
translate(32, 'Hb').
translate(22, 'Mb').
translate(12, 'Ab').

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
     
