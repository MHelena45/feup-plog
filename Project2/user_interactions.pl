
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

ask_row_or_column(Option) :-
    repeat,
    write('> Do you wish to restrict a row or a column (Options: row / column / exit) ?'),
    read(User_Option),
    translate_option(User_Option, Option).

translate_option('row', row).
translate_option('column', column).
translate_option('exit', stop).
translate_option(_, _) :-
    invalid_row_column, !, fail.

ask_which_row(Num_Row) :-
    write('> Which row do you want to restrict?'),
    read(Num_Row).

ask_which_column(Num_Col) :-
    write('> Which column do you want to restrict?'),
    read(Num_Col).

ask_distance(Distance) :-
    write('> What is the distance between shaded squares you wish to restrict?'),
    read(Distance).

press_any_button :-
    repeat,
    write('> Tap any key and Enter to go back to the main menu.'),
    get_code(_Ans_Code),
    skip_line.

exiting_message :-
    write('\nLeaving the game...\n\n').

% ===========================================================
%                        Error messages
% ===========================================================
invalid_option_message :-
    write('\n> Invalid Option! Options between 0 and 2.\n\n').

invalid_board_size_message :-
    write('\n> Invalid board size.\n').

invalid_row_message :-
    write('\n> Invalid Row. \n\n').

invalid_column_message :-
    write('\n> Invalid Column. \n\n').

invalid_row_column :-
    write('\n> Invalid option. Valid options: "r" / "c" / "row" / "column"\n\n').

