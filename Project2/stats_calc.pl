:- use_module(library(clpfd)).
:- use_module(library(lists)).

:- include('2xndisjoint2.pl').
:- include('nxnautomaton.pl').
:- include('nxndisjoint.pl').
:- include('nxnsimples.pl').
:- include('2xnsimple.pl').

:- include('util.pl').
:- include('solution_printer.pl').

calc_stats :-
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
   A.
