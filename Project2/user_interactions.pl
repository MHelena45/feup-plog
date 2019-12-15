
ask_menu_option(Option) :-
    repeat,
    write('> What is your option ? '),
    get_char(Option),
    skip_line.

ask_board_size(Board_Size) :-
    repeat,
    write('> Enter Board Size: '),
    read(Board_Size).
    /* get_code(Size_Code),
    Board_Size is Size_Code - 48,
    skip_line. */

press_any_button :-
    repeat,
    write('Tap any key and Enter to go back to the main menu.'),
    get_code(_Ans_Code),
    skip_line.

exiting_message :-
    write('\nLeaving the game...\n\n').

% ===========================================================
%                        Error messages
% ===========================================================
invalid_option_message :-
    write('\nInvalid Option! Options between 0 and 2.\n\n').

invalid_board_size_message :-
    write('\nInvalid board size.\n').

invalid_row_message :-
    write('Invalid Row. ').

invalid_column_message :-
    write('Invalid Column. ').

