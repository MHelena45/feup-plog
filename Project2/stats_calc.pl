:- use_module(library(clpfd)).
:- use_module(library(lists)).

:- include('2xndisjoint2.pl').
:- include('nxnautomaton.pl').
:- include('nxndisjoint.pl').
:- include('nxnsimple.pl').
:- include('2xnsimple.pl').

:- include('util.pl').
:- include('solution_printer.pl').

filename('C:\\Users\\pasga\\Desktop\\stats.csv').

calc_stats :-
    write_stats_header,
    board_sizes(Board_Sizes),
    for_each_board_size(Board_Sizes).

for_each_board_size([]).
for_each_board_size([Board_Size|Rest]) :-
    next_variable_options(V_Options),
    for_each_next(Board_Size, V_Options),
    for_each_board_size(Rest).

for_each_next(_Board_Size, []).
for_each_next(Board_Size, [V_Option|Rest]) :-
    way_choice_options(W_Options),
    for_each_way(Board_Size, V_Option, W_Options),
    for_each_next(Board_Size, Rest).

for_each_way(_Board_Size, _V_Option, []).
for_each_way(Board_Size, V_Option, [W_Option|Rest]) :-
    order_choice_options(O_Options),
    for_each_order(Board_Size, V_Option, W_Option, O_Options),
    for_each_way(Board_Size, V_Option, Rest).

for_each_order(_Board_Size, _V_Option, _W_Option, []).
for_each_order(Board_Size, V_Option, W_Option, [O_Option|Rest]) :-
    approaches(Approaches),
    for_each_approach(Board_Size, V_Option, W_Option, O_Option, Approaches),
    for_each_order(Board_Size, V_Option, W_Option, Rest).

for_each_approach(_Board_Size, _V_Option, _W_Option, _O_Option, []).
for_each_approach(Board_Size, V_Option, W_Option, O_Option, [Approach|Rest]) :-
    execute_approach(Approach, Board_Size, [], [], [V_Option, W_Option, O_Option]),
    for_each_approach(Board_Size, V_Option, W_Option, O_Option, Rest).

board_sizes([9, 11, 13, 15]).

next_variable_options([leftmost, min, max, ff, anti_first_fail, occurrence, ffc, max_regret]).
way_choice_options([step, enum, bisect, median, middle]).
order_choice_options([up, down, satisfy, best, all]).

approaches([automaton_nxn,disjoint2_2xn,disjoint2_nxn,simple_nxn,simple_2xn]).

execute_approach(Approach, Board_Size, Column_Contraints, Row_Contraints, Options) :-   
    A =.. [Approach, Board_Size, Column_Contraints, Row_Contraints, Options], 
    reset_stats,
    A,
    save_stats(Approach, Board_Size),
    fd_statistics,
    statistics.

reset_stats :-
    fd_statistics(resumptions, _),
    fd_statistics(entailments, _),
    fd_statistics(prunings, _),
    fd_statistics(backtracks, _),
    fd_statistics(constraints, _),
    statistics(runtime, _).

save_stats(Approach, Board_Size) :-
    statistics(runtime, [Runtime,_]),
    fd_statistics(resumptions, Resumptions),
    fd_statistics(entailments, Entailments),
    fd_statistics(prunings, Prunings),
    fd_statistics(backtracks, Backtracks),
    fd_statistics(constraints, Constraints),

    filename(Filename),
    open(Filename, append, C),
    set_output(C),

    save(Board_Size),
    save(Approach),
    save(Runtime),
    save(Resumptions),
    save(Entailments),
    save(Prunings),
    save(Backtracks),
    write(Constraints),

    nl,
    told.

write_stats_header :-
    filename(Filename),
    open(Filename, append, C),
    set_output(C),

    save('Board Size'),
    save('Approach'),
    save('Runtime'),
    save('Resumptions'),
    save('Entailments'),
    save('Prunings'),
    save('Backtracks'),
    write('Constraints'),

    nl,
    told.

save(Stat) :-
    write(Stat),
    write(',').
