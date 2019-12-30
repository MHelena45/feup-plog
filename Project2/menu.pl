:- include('menu_printer.pl').

main_menu(Board_Size) :-
    print_main_menu,
    ask_menu_option(Option),
    manage_option(Option, Board_Size).

% get puzzles
manage_option('1', Board_Size) :-
    get_board_size(Board_Size),
    get_puzzle(Board_Size).

% see solutions
manage_option('2', Board_Size) :-
    get_board_size(Board_Size).

% Help
manage_option('2', _Board_Size) :-
    print_help_menu,
    press_any_button,
    play.

% Exit
manage_option('0', _Board_Size) :-
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

get_board_size(_Board_Size) :-
    invalid_board_size_message,
    fail.

% TODO: SEE VALID BOARD SIZES
valid_board_size(_Board_Size).