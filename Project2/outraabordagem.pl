:-use_module(library(clpfd)).

time(Board_Size, Column, Column_Value, Row, Row_Value) :-   
    NumberOfVars is Board_Size * Board_Size,
    length(Vars, NumberOfVars),
    check_number_of_squares(Board_Size, Vars),
    labeling([], Vars).

check_number_of_squares(Board_Size, Vars) :-
    NumberOfOnes is Board_Size * 2,
    global_cardinality(Vars, [1-NumberOfOnes] ).
  %  sum([Vars] , #=, NumberOfOnes).