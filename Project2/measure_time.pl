:- include('game.pl').

% measure time with one restriction in column and row only
play(Board_Size, Row, Row_value, Column, Column_value) :-
    statistics(runtime, _),
    get_vars_list(Board_Size, Vars),  
    restrict_cardinality(Board_Size, Vars),
    restrict_distances(Vars),
    restrict_column_distance(0, Column, Column_Value, Vars),
    restrict_row_distance(0, Row, Row_Value, Vars),
    labeling([], Vars),
    statistics(runtime, X),
    print_solution(Board_Size, Vars, Row_Restrictions, Column_Restrictions),
    % Helena's Path
    open('C:\\Users\\ferre\\Desktop\\3ano\\feup-plog\\Project2\\times.txt', append, C),
    % Gaspar's Path
    %open('C:\\Users\\pasga\\OneDrive - Universidade do Porto\\FEUP\\3rdYear\\PLOG\\feup-plog\\Project2\\times.txt', append, C),
    set_output(C), % set output to write on the file and not in the console
    write(X), write('ms\n'),
    statistics, 
    told. %write

