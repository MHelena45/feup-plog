:- use_module(library(random)). % used to generate radom puzzles

generator(Board_size) :-
    random(1, Board_size, Row),
    random(1, Board_size, Square_position),
    Maximum_distance is Board_size - (Board_size - Square_position) - 2,
    random(1, Maximum_distance, Row_value),
    random_member(Variable_option, [leftmost, min, max, ff, anti_first_fail, occurrence, ffc, max_regret]),
    random_member(Way_option, [step, enum, bisect, median, middle]),
    random_member(Order_option, [up, down]).