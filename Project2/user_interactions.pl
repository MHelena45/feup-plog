
ask_menu_option(Option) :-
    repeat,
    write('\n> What is your option ? '),
    get_char(Option),
    skip_line.

ask_board_size(Board_Size) :-
    repeat,
    write('\n> Enter Board Size: '),
    read(Board_Size).
    /* we use read instead of get_code because de board can have any size, so the number can have 1 digit or
        100000... digits */
    
ask_row_or_column(Option) :-
    repeat,
    write('\n> Do you wish to restrict a row or a column (Options: row / column / stop) ?'),
    read(User_Option),
    translate_option(User_Option, Option).

translate_option('row', row).
translate_option('column', column).
translate_option('stop', stop).

ask_which_row(Num_Row) :-
    write('\n> Which row do you want to restrict?'),
    read(Num_Row).

ask_which_column(Num_Col) :-
    write('\n> Which column do you want to restrict?'),
    read(Num_Col).

ask_distance(Distance) :-
    write('\n> What is the distance between shaded squares you wish to restrict?'),
    read(Distance).

press_any_button :-
    repeat,
    write('\n> Tap any key and Enter to go back to the main menu.'),
    get_code(_Ans_Code),
    skip_line.

exiting_message :-
    write('\nLeaving the game...\n\n').

% ===========================================================
%                        Error messages
% ===========================================================
invalid_option_message :-
    write('\n> Invalid Option! Options between 0 and 3.\n\n').

invalid_board_size_message :-
    write('\n> Invalid board size.\n').

invalid_row_message :-
    write('\n> Invalid Row. \n\n').

invalid_column_message :-
    write('\n> Invalid Column. \n\n').

invalid_user_option :-
    write('\n> Invalid option. \n\n').

invalid_coord :-
    write('\n> Invalid coordinate.\n\n').

invalid_distance :-
    write('\n> Invalid distance.\n\n').

invalid_Constraint :-
    write('\n> Invalid Constraint. You already placed a Constraint there.').

impossible_distance_Constraint :-
    write('\n> There can\'t be two shaded squares together and there can only be two shaded squares per row and per column.').

