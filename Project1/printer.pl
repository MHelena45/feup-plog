:- include('piecesPrinter.pl').

display_game(Board) :-
    printColumnCoordinates,
    printBoardContent(Board, 1).

printBoardContent([], _). 
printBoardContent([Line|Rest], NumLine) :- 
    printBoardLine(Line, NumLine, 1), 
    printLineSeperators(NumLine),
    NumLine1 is NumLine + 1,
    printBoardContent(Rest, NumLine1).

printBoardLine(Line, _, 16).
printBoardLine(Line, NumLine, PieceLine) :-
    printLine(Line, NumLine, 1, PieceLine),
    printNewLine,
    PieceLine1 is PieceLine + 1,
    printBoardLine(Line, NumLine, PieceLine1).

printLine([], _, _, _).
printLine([Cell|Rest], NumLine, NumCol, PieceLine) :-  
    printCell(Cell, NumLine, NumCol, PieceLine), 
    NumCol1 is NumCol + 1,
    printLine(Rest, NumLine, NumCol1, PieceLine).

% Specific printer to display number of board line
printCell(Cell, NumLine, 1, 7) :-
    printLineCoord(NumLine),
    printPiece(Cell, PieceLine),
    printColumnSeperator(1). 

%Specific printer to display a seperator in the begining of each line
printCell(Cell, _, 1, _) :-
    printColumnSeperator(0),
    printPiece(Cell, PieceLine),
    printColumnSeperator(1).

% General cell printer that displays the piece and then a cell seperator
printCell(Cell, NumLine, NumCol, PieceLine) :-
    printPiece(Cell, PieceLine), 
    printColumnSeperator(NumCol).

% special prints
printColumnCoordinates :-   
    write('\n             1                  2                   3                   4          \n'),
    printLineSeperators(0).
                               
printLineSeperators(1) :-       write('______________________|___________________X___________________|___________________X\n').
printLineSeperators(3) :-       write('______________________|___________________X___________________|___________________X\n').
printLineSeperators(_) :-       write('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n').

printNewLine :-                 write('\n').
printColumnSeperator(0) :-      write('  X  ').
printColumnSeperator(1) :-      write('  |  ').
printColumnSeperator(2) :-      write('  X  ').
printColumnSeperator(3) :-      write('  |  ').
printColumnSeperator(4) :-      write('  X  ').

printLineCoord(NumLine) :- 
    write(NumLine),
    write(' X  ').
     
