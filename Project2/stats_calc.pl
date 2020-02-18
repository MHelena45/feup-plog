:- use_module(library(clpfd)).
:- use_module(library(lists)).

:- include('2xndisjoint2.pl').
:- include('nxnautomaton.pl').
:- include('nxndisjoint.pl').
:- include('nxnsimple.pl').
:- include('2xnsimple.pl').
:- include('cumulative_gap.pl').

:- include('util.pl').
:- include('solution_printer.pl').

filename('C:\\Users\\pasga\\Desktop\\stats.csv').

% Variable data
board_sizes([9, 11, 13, 15]).
approaches([ % simple_nxn and disjoint_nxn missing due to taking too long
    automaton_nxn, 
    disjoint2_2xn, 
    simple_2xn, 
    cumulative_baseline, 
    cumulative_horizontal_and_vertical, 
    cumulative_horizontal_only,
    cumulative_horizontal_only_no_board
]). 
column_contraints([]).
row_constraints([]).

next_variable_options([leftmost, min, max, ff, anti_first_fail, occurrence, ffc, max_regret]).
way_choice_options([step, enum, bisect, median, middle]).
order_choice_options([up, down]).

calc_stats :-
    write_stats_header,
    board_sizes(Board_Sizes),
    for_each_board_size(Board_Sizes).

for_each_board_size([]).
for_each_board_size([Board_Size|Rest]) :-
    approaches(Approaches),
    for_each_approach(Board_Size, Approaches),
    for_each_board_size(Rest).

for_each_approach(_Board_Size, []).
for_each_approach(Board_Size, [Approach|Rest]) :-
    write(Approach), nl,
    next_variable_options(V_Options),
    for_each_next(Board_Size, Approach, V_Options),
    for_each_approach(Board_Size, Rest).

for_each_next(_Board_Size, _Approach, []).
for_each_next(Board_Size, Approach, [V_Option|Rest]) :-
    way_choice_options(W_Options),
    for_each_way(Board_Size, Approach, V_Option, W_Options),
    for_each_next(Board_Size, Approach, Rest).

for_each_way(_Board_Size, _Approach, _V_Option, []).
for_each_way(Board_Size, Approach, V_Option, [W_Option|Rest]) :-
    order_choice_options(O_Options),
    for_each_order(Board_Size, Approach, V_Option, W_Option, O_Options),
    for_each_way(Board_Size, Approach, V_Option, Rest).

for_each_order(_Board_Size, _Approach, _V_Option, _W_Option, []).
for_each_order(Board_Size, Approach, V_Option, W_Option, [O_Option|Rest]) :-
    column_contraints(Column_Contraints),
    row_constraints(Row_Contraints),
    execute_approach(Approach, Board_Size, Column_Contraints, Row_Contraints, [V_Option, W_Option, O_Option]),
    for_each_order(Board_Size, Approach, V_Option, W_Option, Rest).

execute_approach(Approach, Board_Size, Column_Contraints, Row_Contraints, Options) :-   
    A =.. [Approach, Board_Size, Column_Contraints, Row_Contraints, Options], 
    reset_stats,
    A,
    save_stats(Approach, Board_Size, Options).

reset_stats :-
    fd_statistics(resumptions, _),
    fd_statistics(entailments, _),
    fd_statistics(prunings, _),
    fd_statistics(backtracks, _),
    fd_statistics(constraints, _),
    statistics(runtime, _).

save_stats(Approach, Board_Size, Options) :-
    statistics(runtime, [_, Runtime]),
    statistics(memory, Memory),
    statistics(memory_used, Memory_Used),
    statistics(program, Program),

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
    save_options(Options),
    save(Runtime),
    save(Memory),
    save(Memory_Used),
    save(Program),
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
    save('Options'),
    save('Runtime'),
    save('Memory'),
    save('Memory_used'),
    save('Program'),
    save('Resumptions'),
    save('Entailments'),
    save('Prunings'),
    save('Backtracks'),
    write('Constraints'),

    nl,
    told.

save_options([Option1, Option2, Option3]) :-
    write(Option1), write('-'),
    write(Option2), write('-'),
    write(Option3), write(',').

save(Stat) :-
    write(Stat),
    write(',').
