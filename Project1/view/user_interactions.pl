% used when the game ends and we only want to display the board (because no who is going to play next )
greet_player(0).
% Greets the player letting him/her know the color of his/hers pieces
greet_player(3) :-                              % Computer is player 3 internally when player 1 outwardly
    write('\nComputer 1 turn to play.\n').
greet_player(4) :-                              % Computer is player 4 internally when player 2 outwardly
    write('\nComputer 2 turn to play.\n').
greet_player(Player) :-                         % Player con be 1 or 2
    write('\nPlayer '),
    write(Player),
    write(', it\'s your turn!\nYour pieces are colored '),
    write_color(Player), write('.'),
    nl.
    
ask_piece(Char1_Piece, Char2_Piece, Char3_Piece, Char4_Piece) :-
    write('\nWhat piece do you want to play (cone, cylinder, sphere or cube)?\n'),
    % Gets piece that is going to be checked latter
    get_char(Char1_Piece),
    get_char(Char2_Piece),
    get_char(Char3_Piece),
    get_char(Char4_Piece),                            
    skip_line.

ask_row(Row) :-
    write('In which row?\n'),
    get_code(Row_Code),                                         % Gets Row that is going to be checked latter
    Row is Row_Code - 48,
    skip_line.                                         

ask_column(Column) :-
    write('In which column?\n'),
    get_code(Column_Code),                                       % Gets Column that is going to be checked latter
    Column is Column_Code - 48,
    skip_line.

write_color(1):-                                        % Player 1 has white Pieces
    write('white').

write_color(2):-                                        % Player 2 has white Pieces
    write('brown').  

ask_menu_option(Option) :-
    repeat,
    write('> What is your option ? '),
    get_char(Option),
    skip_line.

ask_level(Level) :-
    repeat,
    write('Level: '),
    get_code(Level_Code),
    Level is Level_Code - 48,
    skip_line.

% used to leave help menu and in in case of a tie to go back to main
get_interaction :-
    repeat,
    write('Tap any key and Enter to go back to the main menu.'),
    get_char(_Ans),
    skip_line.

exiting_message :-
    write('\nLeaving the game...\n\n').

% ===========================================================
%                        Error messages
% ===========================================================
wrong_move_message :-
    write('Can not do that move. Play again.\n').

not_empty_message(Row, Collumn) :-
    write('\nRow '),
    write(Row),
    write(' Collumn '),
    write(Collumn),
    write(' with a piece. Can not replace pieces.\n').

unavailable_piece_message :-
    write('You dont\'t have any more of those pieces. Choose a diferent one.\n').

invalid_option_message:-
    write('\nInvalid Option! Options between 0 to 5.\n\n').

invalid_level_message :-
    write('\nInvalid Level Number! Level must be 1, 2 or 3.\nWhat\'s the level of difficulty?\n').

no_more_moves_message :-
    write('\nNo more moves available. It\'s a draw!\n').

invalid_move :-
    write('Invalid Row. ').

invalid_column :-
    write('Invalid Column. ').

piece_not_valid :-
    write('Piece not found.').