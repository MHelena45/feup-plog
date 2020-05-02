:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- use_module(library(timeout)).

% Approaches
:- include('approaches/2xndisjoint2.pl').
:- include('approaches/nxnautomaton.pl').
:- include('approaches/nxndisjoint.pl').
:- include('approaches/nxnsimple.pl').
:- include('approaches/2xnsimple.pl').
:- include('approaches/cumulative_gap.pl').

:- include('util.pl').
:- include('constraints.pl').

:- include('../Project2/solution_printer.pl').

board_sizes([11]).
filename('C:\\Users\\pasga\\Desktop\\extra.csv'). % File name to save results to

timeout_ms(30000). % miliseconds = 0.5 minute

% Variable data
approaches([ 
    automaton_nxn, 
    disjoint2_2xn,
    disjoint2_nxn, 
    simple_2xn,
    simple_nxn,
    cumulative_baseline, 
    cumulative_horizontal_and_vertical, 
    cumulative_horizontal_only,
    cumulative_horizontal_only_no_board
]). 

next_variable_options([leftmost, min, max, ff, anti_first_fail, occurrence, ffc, max_regret]).
way_choice_options([step, enum, bisect, median, middle]).
order_choice_options([up, down]).

calc_stats :-
    write_stats_header,
    write_log_header,
    board_sizes(Board_Sizes),
    for_each_board_size(Board_Sizes), !.

for_each_board_size([]) :- !.
for_each_board_size([Board_Size|Rest]) :-
    findall(Column_Constraint-Row_Constraint, constraints(Board_Size, Column_Constraint, Row_Constraint), List_Of_Constraints),
    for_each_constraint(Board_Size, List_Of_Constraints),
    for_each_board_size(Rest).

for_each_constraint(_Board_Size, []) :- !.
for_each_constraint(Board_Size, [Column_Constraint-Row_Constraint|Rest]) :-
    approaches(Approaches), 
    for_each_approach(Board_Size, Column_Constraint, Row_Constraint, Approaches),
    for_each_constraint(Board_Size, Rest).

for_each_approach(_Board_Size, _Column_Contraint, _Row_Contraint, []) :- !.
for_each_approach(Board_Size, Column_Contraint, Row_Contraint, [Approach|Rest]) :-
    register_log(Board_Size, Column_Contraint, Row_Contraint, Approach),
    next_variable_options(V_Options),
    for_each_next(Board_Size, Column_Contraint, Row_Contraint, Approach, V_Options),
    for_each_approach(Board_Size, Column_Contraint, Row_Contraint, Rest).

for_each_next(_Board_Size, _Column_Contraint, _Row_Contraint, _Approach, []) :- !.
for_each_next(Board_Size, Column_Contraint, Row_Contraint, Approach, [V_Option|Rest]) :-
    way_choice_options(W_Options),
    for_each_way(Board_Size, Column_Contraint, Row_Contraint, Approach, V_Option, W_Options),
    for_each_next(Board_Size, Column_Contraint, Row_Contraint, Approach, Rest).

for_each_way(_Board_Size, _Column_Contraint, _Row_Contraint, _Approach, _V_Option, []) :- !.
for_each_way(Board_Size, Column_Contraint, Row_Contraint, Approach, V_Option, [W_Option|Rest]) :-
    order_choice_options(O_Options),
    for_each_order(Board_Size, Column_Contraint, Row_Contraint, Approach, V_Option, W_Option, O_Options),
    for_each_way(Board_Size, Column_Contraint, Row_Contraint, Approach, V_Option, Rest).

for_each_order(_Board_Size, _Column_Contraint, _Row_Contraint, _Approach, _V_Option, _W_Option, []) :- !.
for_each_order(Board_Size, Column_Contraint, Row_Contraint, Approach, V_Option, W_Option, [O_Option|Rest]) :-
    execute_approach(Approach, Board_Size, Column_Contraint, Row_Contraint, [V_Option, W_Option, O_Option]),
    for_each_order(Board_Size, Column_Contraint, Row_Contraint, Approach, V_Option, W_Option, Rest).

execute_approach(Approach, Board_Size, Column_Contraints, Row_Contraints, Options) :-  
    timeout_ms(Timeout),
    A =.. [Approach, Board_Size, Column_Contraints, Row_Contraints, [satisfy | Options]], 
    reset_stats,
    call_with_timeout(A, Timeout, Flag), 
    save_stats(Approach, Board_Size, Column_Contraints, Row_Contraints, Options, Flag), !.

call_with_timeout(Approach, Timeout, Flag) :-
    time_out(Approach, Timeout, Flag).

call_with_timeout(_Approach, _Timeout, failed).

reset_stats :-
    fd_statistics(resumptions, _),
    fd_statistics(entailments, _),
    fd_statistics(prunings, _),
    fd_statistics(backtracks, _),
    fd_statistics(constraints, _),
    statistics(runtime, _).

save_stats(Approach, Board_Size, Column_Contraints, Row_Contraints, Options, Flag) :-
    statistics(runtime, [_, Runtime]),
    statistics(memory, [Memory, _]),
    statistics(memory_used, Memory_Used),
    statistics(program, [Program, _]),

    fd_statistics(resumptions, Resumptions),
    fd_statistics(entailments, Entailments),
    fd_statistics(prunings, Prunings),
    fd_statistics(backtracks, Backtracks),
    fd_statistics(constraints, Constraints),

    filename(Filename),
    open(Filename, append, C),
    set_output(C),

    save(Board_Size),
    save_constraints(Column_Contraints),
    save_constraints(Row_Contraints),
    save(Approach),
    save(Flag),

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

write_log_header :-
    write('Board Size - Column Constraint - Row Constraint - Approach\n').

register_log(Board_Size, Column_Contraint, Row_Contraint, Approach) :-
    write(Board_Size), write(' - '),
    write(Column_Contraint), write(' - '),
    write(Row_Contraint), write(' - '),
    write(Approach), nl.

write_stats_header :-
    filename(Filename),
    open(Filename, append, C),
    set_output(C),

    save('Board Size'),
    save('Column Constraints'),
    save('Row Constraints'),
    save('Approach'),
    save('Result'),
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

save_constraints([]) :- write(',').
save_constraints([Constraint|Rest]) :-
    write(Constraint), write(' | '),
    save_constraints(Rest).

save_options([Option1, Option2, Option3]) :-
    write(Option1), write('-'),
    write(Option2), write('-'),
    write(Option3), write(',').

save(Stat) :-
    write(Stat),
    write(',').

% Predicate to test if the constraints available in 'constraints.pl' 
% form possible solutions
test :-
    board_sizes(Board_Sizes),
    for_each_board_size2(Board_Sizes), !.

for_each_board_size2([]) :- !.
for_each_board_size2([Board_Size|Rest]) :-
    findall(Column_Constraint-Row_Constraint, constraints(Board_Size, Column_Constraint, Row_Constraint), List_Of_Constraints),
    for_each_constraint2(Board_Size, List_Of_Constraints),
    for_each_board_size2(Rest).

for_each_constraint2(_Board_Size, []) :- !.
for_each_constraint2(Board_Size, [Column_Constraint-Row_Constraint|Rest]) :-
    register_log(Board_Size, Column_Constraint, Row_Constraint, simple_2xn),
    time_out(
        simple_2xn(Board_Size, Column_Constraint, Row_Constraint, []),
        10000,
        Flag),
    check_flag(Flag),
    for_each_constraint2(Board_Size, Rest).

check_flag(success).
check_flag(time_out) :- write('##### TIMEOUT #####\n').
