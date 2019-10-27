:- include('piecesPrinter.pl').

displayGame(Board, WhitePieces, BrownPieces) :-
    clearEverything,
    printHeaderLine,
    printBoardsContent(Board, WhitePieces, BrownPieces, 1).

printBoardsContent(_, _, _, 5). 
printBoardsContent([BoardLine|BoardRest], [WhiteLine|WhiteRest], [BrownLine|BrownRest], NumLine) :- 
    printBoardsLine(BoardLine, WhiteLine, BrownLine, NumLine, 1), 
    printLineSeperators(NumLine),
    NumLine1 is NumLine + 1,
    printBoardsContent(BoardRest, WhiteRest, BrownRest, NumLine1).

printBoardsLine(_, _, _, _, 11).
printBoardsLine(BoardLine, WhiteLine, BrownLine, NumLine, ConsoleLine) :-
    printLine(BoardLine, NumLine, 1, ConsoleLine),
    printLine(WhiteLine, NumLine, 1, ConsoleLine),
    printLine(BrownLine, NumLine, 1, ConsoleLine),
    printNewLine,
    ConsoleLine1 is ConsoleLine + 1,
    printBoardsLine(BoardLine, WhiteLine, BrownLine, NumLine, ConsoleLine1).

printLine([], _, _, _).
printLine([Cell|Rest], NumLine, NumCol, ConsoleLine) :-  
    printCell(Cell, NumLine, NumCol, ConsoleLine), 
    NumCol1 is NumCol + 1,
    printLine(Rest, NumLine, NumCol1, ConsoleLine).

% Specific printer to display number of board line
printCell(Cell, NumLine, 1, 5) :-
    printLineCoord(NumLine),
    printPiece(Cell, 5),
    printColumnSeperator(1). 

% Specific printer to display a seperator in the begining of each line
printCell(Cell, _, 1, ConsoleLine) :-
    printColumnSeperator(0),
    printPiece(Cell, ConsoleLine),
    printColumnSeperator(1).

% General cell printer that displays the piece and then a cell seperator
printCell(Cell, _, NumCol, ConsoleLine) :-
    printPiece(Cell, ConsoleLine), 
    printColumnSeperator(NumCol).

% Special prints
printHeaderLine :-   
    write('\n             1                  2                   3                   4          '),
    write('                   WHITE PIECES                                 BROWN PIECES            \n'),
    printLineSeperators(0).

printLineSeperators(0) :-
    write('__XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'),
    write('    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n').

printLineSeperators(1) :-       
    write('__X___________________|___________________X___________________|___________________X'),
    write('    X___________________|___________________X    X___________________|___________________X\n').

printLineSeperators(2) :-       
    write('__XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'),
    write('    X___________________|___________________X    X___________________|___________________X\n').

printLineSeperators(3) :- printLineSeperators(1).
printLineSeperators(4) :- printLineSeperators(0).

printNewLine :-                 write('\n').

printColumnSeperator(0) :-      write('  X  ').
printColumnSeperator(1) :-      write('  |  ').
printColumnSeperator(2) :-      write('  X  ').
printColumnSeperator(3) :-      write('  |  ').
printColumnSeperator(4) :-      write('  X  ').

printLineCoord(NumLine) :- 
    write(NumLine),
    write(' X  ').

% Clears the screen to better visualize the game 
clearEverything :-
    write('\33\[2J').

     
