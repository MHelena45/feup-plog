:- include('pieces_printer.pl').

display_game(Board, White_Pieces, Brown_Pieces) :-
    clear_screen,
    print_header_line,
    print_boards_content(Board, White_Pieces, Brown_Pieces, 1).

print_boards_content([], [], [], _). 
print_boards_content([Board_Line|Board_Rest], [White_Line|White_Rest], [Brown_Line|Brown_Rest], Num_Line) :-
    print_boards_line(Board_Line, White_Line, Brown_Line, Num_Line, 1), 
    print_line_seperators(Num_Line),
    Num_Line1 is Num_Line + 1,
    print_boards_content(Board_Rest, White_Rest, Brown_Rest, Num_Line1).

print_boards_line(_Board_Line, _White_Line, _Brown_Line, _Num_Line, 11).
print_boards_line(Board_Line, White_Line, Brown_Line, Num_Line, Console_Line) :-
    print_line(Board_Line, Num_Line, 1, Console_Line),
    print_line(White_Line, Num_Line, 1, Console_Line),
    print_line(Brown_Line, Num_Line, 1, Console_Line),
    nl,
    Console_Line1 is Console_Line + 1,
    print_boards_line(Board_Line, White_Line, Brown_Line, Num_Line, Console_Line1).

print_line([], _Num_Line, _Num_Col, _Console_Line).
print_line([Cell|Rest], Num_Line, Num_Col, Console_Line) :-  
    print_cell(Cell, Num_Line, Num_Col, Console_Line), 
    Num_Col1 is Num_Col + 1,
    print_line(Rest, Num_Line, Num_Col1, Console_Line).

% Specific printer to display number of board line
print_cell(Cell, Num_Line, 1, 5) :-
    print_line_coord(Num_Line),
    print_piece(Cell, 5),
    print_column_seperator(1). 

% Specific printer to display a seperator in the begining of each line
print_cell(Cell, _, 1, Console_Line) :-
    print_column_seperator(0),
    print_piece(Cell, Console_Line),
    print_column_seperator(1).

% General cell printer that displays the piece and then a cell seperator
print_cell(Cell, _, Num_Col, Console_Line) :-
    print_piece(Cell, Console_Line), 
    print_column_seperator(Num_Col).

% Special prints
print_header_line :-   
    write('\n             1                  2                   3                   4          '),
    write('                   WHITE PIECES                                 BROWN PIECES            \n'),
    print_line_seperators(0).

print_line_seperators(0) :-
    write('__XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'),
    write('    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n').

print_line_seperators(1) :-       
    write('__X___________________|___________________X___________________|___________________X'),
    write('    X___________________|___________________X    X___________________|___________________X\n').

print_line_seperators(2) :-       
    write('__XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'),
    write('    X___________________|___________________X    X___________________|___________________X\n').

print_line_seperators(3) :- print_line_seperators(1).
print_line_seperators(4) :- print_line_seperators(0).

print_column_seperator(0) :-      write('  X  ').
print_column_seperator(1) :-      write('  |  ').
print_column_seperator(2) :-      write('  X  ').
print_column_seperator(3) :-      write('  |  ').
print_column_seperator(4) :-      write('  X  ').

print_line_coord(Num_Line) :- 
    write(Num_Line),
    write(' X  ').

% Clears the screen to better visualize the game 
clear_screen :-
    write('\33\[2J').

     
