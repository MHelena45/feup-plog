
print_main_menu :-
    clear_screen,
    nl,
    print_welcome_message,
    print_options,
    print_footer.

print_welcome_message :-
    write(' _______________________________________________________________________ '),nl,
    write('|                                                                       |'),nl,
    write('|                       Welcome to Gap Puzzles!!                        |'),nl,
    write('|_______________________________________________________________________|'),nl.

print_options :-
    write('|=======================================================================|'),nl,
    write('|       Your Options:                                                   |'),nl,
    write('|                                                                       |'),nl,
    write('|                      1. Get puzzles                                   |'),nl,
    write('|                                                                       |'),nl,
    write('|                      2. See solutions                                 |'),nl,
    write('|                                                                       |'),nl,
    write('|                      3. Help                                          |'),nl,
    write('|                                                                       |'),nl,
	write('|                      0. Exit                                          |'),nl,
    write('|                                                                       |'),nl,
    write('|_______________________________________________________________________|'),nl.

print_footer :-
    write('|=======================================================================|'),nl,
    write('|       Made by:                                                        |'),nl,
    write('|                          Gaspar Santos Pinheiro                       |'),nl,
    write('|                          Maria Helena Ferreira                        |'),nl,
    write('|_______________________________________________________________________| '),nl,nl,nl.


print_help_menu :-
    clear_screen,
    nl,
    write(' _________________________________________________________________________'),nl,
    write('|                                                                         |'),nl,
    write('|                        Rules of Gap Puzzles                             |'),nl,
    write('|                                                                         |'),nl,
    write('| -At each turn, players alternately place one of their pieces on the     |'),nl,
    write('|   board.                                                                |'),nl,
    write('|                                                                         |'),nl,
    write('|                                                                         |'),nl,
    write('| -When placing a piece on the board, each player must adhere to the      |'),nl,
    write('| following rule: It is not allowed to place a piece in a special column, |'),nl, 
    write('| row or zone in which the opponent has already placed a piece in the     |'),nl,
    write('| same way. A zone is any of the four squares formed at the ends of the   |'),nl,
    write('| board.An example of a square being formed by the 4 positions(1,1),      |'),nl,
    write('| (1,2), (2,1) and (2,2).                                                 |'),nl,
    write('|                                                                         |'),nl,
    write('|_________________________________________________________________________| '),nl,nl,nl.

% Clears the screen to better visualize the game 
clear_screen :-
    write('\33\[2J').