:- include('menu_printer.pl').

main_menu :-
    print_main_menu,
    ask_menu_option(Option),
    manage_option(Option).

% get puzzles
manage_option('1') :-
    get_board_size(Board_Size),
    get_puzzle(Board_Size).

% see solutions
manage_option('2') :-
    get_board_size(Board_Size),
    play(Board_Size).

% Help
manage_option('2') :-
    print_help_menu,
    press_any_button,
    play.

% Exit
manage_option('0') :-
    exiting_message,
    break. % Stops executation

% Deals with invalid option
manage_option(_Other) :-
    invalid_option_message,
    play.

get_board_size(Board_Size) :-
    repeat, 
    ask_board_size(Board_Size),
    valid_board_size(Board_Size).

% board with less than 8 rows/columns are not valid
valid_board_size(Board_Size) :-
    Board_Size >= 8.

valid_board_size(_Board_Size) :-
    invalid_board_size_message,
    fail.