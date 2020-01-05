
% Asks the user for the menu option. No dot needed in the end
ask_menu_option(Option) :-
    repeat,
    write('\n> What is your option ? '),
    get_char(Option),
    skip_line.

% Asks the user for the board size
ask_board_size(Board_Size) :-
    repeat,
    write('\n> Enter Board Size: '),
    read(Board_Size).
    /* we use read instead of get_code because de board can have any size, so the number can have 1 digit or
        100000... digits */

% Asks the user if he/she wants to restrict a row or a column
ask_row_or_column(Option) :-
    repeat,
    write('\n> Do you wish to restrict a row or a column (Options: row / column / stop) ?'),
    read(User_Option),
    translate_option(User_Option, Option).

% Translates the possible answers given by the user
translate_option('row', row).
translate_option('column', column).
translate_option('stop', stop).

% Asks the user which row he/she wants to restrict
ask_which_row(Num_Row) :-
    write('\n> Which row do you want to restrict?'),
    read(Num_Row).

% Asks the user which column he/she wants to restrict
ask_which_column(Num_Col) :-
    write('\n> Which column do you want to restrict?'),
    read(Num_Col).

% Aks the user wich row does he/she want to place a shaded square
ask_row(Row) :-
    write('\n> In which row do you want to place a shaded square?'),
    read(Row).

% Aks the user wich column does he/she want to place a shaded square   
ask_col(Col) :-
    write('\n> In which column do you want to place a shaded square?'),
    read(Col).

% Aks the user the distance between shade square that he/she wants to restrict
ask_distance(Distance) :-
    write('\n> What is the distance between shaded squares you wish to restrict?'),
    read(Distance).

% Used to get an interaction from the user in order to go to the main menu
press_any_button :-
    repeat,
    write('\n> Tap any key and Enter to go back to the main menu.'),
    get_code(_Ans_Code),
    skip_line.

 % Message displayed when the use exits the game
exiting_message :-
    write('\nLeaving the game...\n\n').

% Congratulates the user on finishing the puzzle
congratulations_message :-
    write('\n> Congratulations!! You solved the puzzle!\n\n').

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

incorrect_answer :-
    write('\n> Incorrect answer. Try other coordinates.').

