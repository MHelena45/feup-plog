printBoard(X) :-
    printInicialLine,
    printBoardContent(X).

printBoardContent([]). 
printBoardContent([L|T]) :- 
    printLineBegin, 
    printLine(L), 
    printNewLine, 
    printLineSeperators,
    printBoardContent(T).

printLine([]).
printLine([C|T]) :-  
    printCell(C), 
    printLine(T).

printCell(C) :-
    translate(C, P), 
    write(P), 
    printSeperator.

translate(empty, '..').

% white pieces
translate(sphere_white, Ow).
translate(cylinder_white, Hw).
translate(sphere_white, Ow).
translate(cylinder_white, Hw).

% brown pieces
translate(sphere_brown, Ob).
translate(cylinder_brown, Hb).
translate(sphere_brown, Ob).
translate(cylinder_brown, Hb).

% special prints
printInicialLine:- write(' ___________________________\n').
printLineSeperators:- write('|_____|______|______|______|\n').
printNewLine:- write('\n').
printSeperator:- write('  |  ').
printLineBegin:- write('| ').