
simple_2xn(Board_Size, Column_Constraints, Row_Constraints, Options) :-
    % Vars is a list in which 2 following members represent the column position of the shaded squares of the same row
    get_vars_list(Board_Size, Vars),
    restrict_cardinality(Board_Size, Vars), % Restricts the number shaded squares in a row
    restrict_distances_simple(Vars), % Makes sure that the shaded squares dont touch each other
    restrict_column_constraints(simple_2xn, Column_Constraints, Vars),
    restrict_row_constraints(simple_2xn, Row_Constraints, Vars),
    labeling(Options, Vars). % Gets the solution
    %print_solution(Board_Size, Vars, Row_Constraints, Column_Constraints).

/**
 * Check if the squares don't touch each other, even at corners.
 * First predicate is used to all rows except the last.
*/ 
restrict_distances_simple([C1, C2, C3, C4| Rest]) :-
    % check that C1 and C2 don't touch and C1 is lower than C2
    C1p1 #= C1 + 1, % position of the first square of the row plus 1
    C1s1 #= C1 - 1, % position of the first square of the next row plus 1
    sum([C1, 1], #<, C2),     % check that C2 is greater than C1 and there is a space betewen them
    sum([C3, 1], #<, C4),     % check that C4 is greater than C3 and there is a space between them
    (C1p1 #< C3 #\ C1s1 #> C3),  % check that C1 and C3 are spaced
    (C1p1 #< C4 #\ C1s1 #> C4), % check that C1 and C4 are spaced
    C2p1 #= C2 + 1,
    C2s1 #= C2 - 1,
    (C2p1 #< C3 #\ C2s1 #> C3), % check that C2 and C3 are spaced
    (C2p1 #< C4 #\ C2s1 #> C4), % check that C2 and C4 are spaced
    restrict_distances_simple([C3, C4| Rest]).
    
% check the distance between the two elements of the last row
restrict_distances_simple([C1, C2]) :-
    % check that C1 and C2 don't touch and C1 is lower than C2
    sum([C1, 1], #<, C2).   % check that C2 is greater than C1 and there is a space between them