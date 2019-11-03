% ========================================================================
% --------------------------- ALl MENUS   --------------------------------
% =========================================================================

mainMenu :-
    printMainMenu,
    askMenuOption,
    read(Input),
    manageInput(Input).

manageInput(1) :-
    start2Players,
    mainMenu.

manageInput(2) :-
    startPlayervsComputer,
    mainMenu.

manageInput(3) :-
    startComputervsComputer,
    mainMenu.

manageInput(4) :-
    help,
    write('Tap any button to go back to the main menu '),
    read(_Ans),
    mainMenu.

manageInput(0) :-
    write('\nLeaving the game...\n\n'),
    break. %stops executation

manageInput(_Other) :-
    write('\nInvalid Option! Options between 0 to 3.\n\n'),
    askMenuOption,
    read(Input),
    manageInput(Input).

printMainMenu :-
    clearEverything,
    nl,
    write(' _______________________________________________________________________ '),nl,
    write('|                                                                       |'),nl,
    write('|                      Welcome to Quantik!!!!                           |'),nl,
    write('|                                                                       |'),nl,
    write('|       Your Options:                                                   |'),nl,
    write('|                                                                       |'),nl,
    write('|                          1. Player vs Player                          |'),nl,
    write('|                                                                       |'),nl,
    write('|                          2. Player vs Computer                        |'),nl,
    write('|                                                                       |'),nl,
	write('|                          3. Computer vs Computer                      |'),nl,
    write('|                                                                       |'),nl,
    write('|                          4. help                                      |'),nl,
    write('|                                                                       |'),nl,
    write('|                          0. Exit                                      |'),nl,
    write('|                                                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|=======================================================================|'),nl,
    write('|       Made by:                                                        |'),nl,
    write('|                          Gaspar Santos Pinheiro                       |'),nl,
    write('|                          Maria Helena Ferreira                        |'),nl,
    write('|                                                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|_______________________________________________________________________| '),nl,nl,nl.

congratulatePlayer(Player) :-
    nl,nl,
    write(' _______________________________________________________________________ '),nl,
    write('|                                                                       |'),nl,
    write('|                    Congratulations, player '),
    write(Player),
    write('                          |'),nl,
    write('|                                                                       |'),nl,
    write('|       Your Options:                                                   |'),nl,
    write('|                                                                       |'),nl,
    write('|                         1. Player vs Player                           |'),nl,
    write('|                                                                       |'),nl,
    write('|                         2. Player vs Computer                         |'),nl,
    write('|                                                                       |'),nl,
	write('|                         3. Computer vs Computer                       |'),nl,
    write('|                                                                       |'),nl,
    write('|                         4. help                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|                         0. Exit                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|_______________________________________________________________________| '),nl,nl,nl.

sorryPlayer :-
    nl,nl,
    write(' _______________________________________________________________________ '),nl,
    write('|                                                                       |'),nl,
    write('|                The Computer won this time                             |'),nl,
    write('|                                                                       |'),nl,
    write('|       Your Options:                                                   |'),nl,
    write('|                                                                       |'),nl,
    write('|                         1. Player vs Player                           |'),nl,
    write('|                                                                       |'),nl,
    write('|                         2. Player vs Computer                         |'),nl,
    write('|                                                                       |'),nl,
	write('|                         3. Computer vs Computer                       |'),nl,
    write('|                                                                       |'),nl,
    write('|                         4. help                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|                         0. Exit                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|_______________________________________________________________________|'),nl,nl,nl.

help :-
    clearEverything,
    nl,
    write(' _________________________________________________________________________'),nl,
    write('|                                                                         |'),nl,
    write('|                       Rules of Quantik                                  |'),nl,
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