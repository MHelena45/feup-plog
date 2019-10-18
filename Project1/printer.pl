display_game(X) :-
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

translate(empty, '..').

% white pieces
translate(sphere_white, 'Ow').
translate(cylinder_white, 'Hw').
translate(cube_white, 'Mw').
translate(cone_white, 'Aw').

% brown pieces
translate(sphere_brown, 'Ob').
translate(cylinder_brown, 'Hb').
translate(cube_brown, 'Mb').
translate(cone_brown, 'Ab').

% special prints
printColumnCoordinates :-   write('  __1___ __2___ __3___ __4___ \n').
printLineSeperators(2) :-   write(' |xxxxxx|xxxxxxXxxxxxx|xxxxxx|\n').
printLineSeperators(_) :-   write(' |______|______X______|______|\n').
printNewLine :-             write('\n').
printSeperator(2) :-        write('  X  ').
printSeperator(_) :-        write('  |  ').
printLineCoord(N) :- 
    write(N),
    write('|  ').

printLegend :- 
    write('LEGEND:\n'),
    write('Piece: <solid><color>\n'),
    write(' Solids   - Symbol     Colors  -  Symbol\n'),
    write('  Cube    -  M          Brown  -    b\n'),
    write(' Sphere   -  O          White  -    w\n'),
    write('  Cone    -  A\n'),
    write('Cylinder  -  H\n').
