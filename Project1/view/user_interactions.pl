% Greets the player letting him/her know the color of his/hers pieces
greet_player(P):-
    write('\nPlayer '),
    write(P),
    write(', it\'s your turn!\nYour pieces are colored '),
    write_color(P),
    nl.
    
ask_piece(Piece) :-
    write('.\nWhat piece do you want to play?\n '),
    read(Piece).

ask_row(Row) :-
    write('In which row?\n'),
    read(Row).

ask_column(Column) :-
    write('In which column?\n'),
    read(Column).
    
write_color(1):-
    write('white').

write_color(2):-
    write('brown').  

ask_menu_option(Option) :-
    write('> What is your option ? '),
    read(Option).

ask_level(Level) :-
    write('Level: '),
    read(Level).

get_interaction :-
    write('Tap any button to go back to the main menu.'),
    read(_Ans).

exiting_message :-
    write('\nLeaving the game...\n\n').

% Error messages
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