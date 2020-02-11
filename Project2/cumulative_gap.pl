:-use_module(library(clpfd)).
:-use_module(library(lists)).


% N - Board Size
% Hor - Horizontal Clues (0 is no clue)
% Ver - Vertical Clues (0 is no clue)
gap(N, Hor, Ver):-
	solver(1, N, Hor, Ver, [ffc, bisect]),
	solver(2, N, Hor, Ver, [ffc, bisect]),
	solver(3, N, Hor, Ver, [ffc, bisect]),
	solver(4, N, Hor, Ver, [ffc, bisect]).
	
	% 1 - Simple approach (baseline)
	% 2 - Cumulative (Horizontal and Vertical)
	% 3 - Cumulative (Horizontal only)
	% 4 - Cumulative (Horizontal only) with no board


% Baseline approach
solver(1, N, Hor, Ver, Options):-
	length(Board, N),
	Z is N-2,
	makeBoard(Board, N, Z),		% domain and global_cardinality per line
		
	transpose(Board, TBoard),
	makeBoard(TBoard, N, Z),	% global_cardinality per column
	
	checkDiagonals(Board),		% spacing, even diagonally
	
	checkDistances(Board, Hor),		% horizontal clues
	checkDistances(TBoard, Ver),	% vertical clues
	
	append(Board, Vars),
	
	labeling(Options, Vars),
	fd_statistics,
	showBoard(Board, N, Hor, Ver).
	

% cumulative with horizontal and vertical tasks
solver(2, N, Hor, Ver, Options):-
	length(Board, N),
	Z is N-2,
	makeBoard(Board, N, Z),
	
	transpose(Board, TBoard),
	makeBoard(TBoard, N, Z),
	
	length(Starts, N),
	length(Ends, N),
	domain(Starts, 1, N),
	domain(Ends, 1, N),
	
	makeTasks(Board, Starts, Ends, Tasks, Hor, 1),	
	cumulative(Tasks, [limit(N)]),

	constrainDiagonals(Tasks),

	length(TStarts, N),
	length(TEnds, N),
	domain(TStarts, 1, N),
	domain(TEnds, 1, N),
	
	makeTasks(TBoard, TStarts, TEnds, TTasks, Ver, 1),
	cumulative(TTasks, [limit(N)]),
	
	append([Starts, Ends, TStarts, TEnds], Vars),
		
	labeling(Options, Vars),
	fd_statistics,
	showBoard(Board, N, Hor, Ver).



% cumulative with horizontal tasks and vertical and diagonal constraints
solver(3, N, Hor, Ver, Options):-
	length(Board, N),
	Z is N-2,
	makeBoard(Board, N, Z),
	
	transpose(Board, TBoard),
	makeBoard(TBoard, N, Z),
	
	length(Starts, N),
	length(Ends, N),
	domain(Starts, 1, N),
	domain(Ends, 1, N),
	
	makeTasks(Board, Starts, Ends, Tasks, Hor, 1),
	constrainDiagonals(Tasks),	
	cumulative(Tasks, [limit(N)]),
	
	append(Starts, Ends, Idxs),
	restrict(Idxs, 1, N, Ver),

	gc(Idxs, N),
	
	labeling(Options, Idxs),
	fd_statistics,
	showBoard(Board, N, Hor, Ver).


% cumulative with horizontal tasks and vertical and diagonal constraints, but no mapping to a board
solver(4, N, Hor, Ver, Options):-
	length(Starts, N),
	length(Ends, N),
	domain(Starts, 1, N),
	domain(Ends, 1, N),
	
	makeTasks2(N, Starts, Ends, Tasks, Hor, 1),
	constrainDiagonals(Tasks),	
	cumulative(Tasks, [limit(N)]),
	
	append(Starts, Ends, Idxs),
	restrict(Idxs, 1, N, Ver),
	
	gc(Idxs, N),
	
	labeling(Options, Idxs),!,
	fd_statistics,
	
	length(Board, N),
	Z is N-2,
	makeBoard(Board, N, Z),
	makeTasks(Board, Starts, Ends, Tasks, Hor, 1),
	showBoard(Board, N, Hor, Ver).
	
makeTasks2(Max, [], [], [], [], N):- N > Max, !.
makeTasks2(Max, [S|Ss], [E|Es], [task(S, D, E, 1, N)|Ts], [H|Hs], N):-
	N1 is N+1,
	D #> 1,
	H #> 0 #=> D #= H+1,
	makeTasks2(Max, Ss, Es, Ts, Hs, N1).


restrict(_, N, Max, _):-
	N > Max, !.
restrict(List, N, Max, [V|Vs]):-
	N1 is N+1,
	element(I1, List, N),
	element(I2, List, N),
	I2 #> I1,
	Dist #= I2 - I1,
	Dist #> 1,
	Dist #\= Max-1,
	Dist #\= Max+1,
	V #> 0 #=> 	( (I2 #= I1 + V + 1 #/\ (I2 #=< Max #\/ I1 #> Max) )			% S-S ou E-E
				#\/ (I2 #= I1 + V + 1 + Max )									% S-E
				#\/ (I2 #= I1 - V - 1 + Max  #/\ I2 #> Max #/\ I1 #=< Max )	),	% E-S
	restrict(List, N1, Max, Vs).


checkDistances([], []).
checkDistances([Line|Board], [H|Hor]):-
	element(S, Line, 1),
	element(E, Line, 1),
	D #= E - S,
	D #> 1,
	H #> 0 #=> D #= H+1,
	checkDistances(Board, Hor).
	

checkDiagonals([_]).
checkDiagonals([Lin1, Lin2 | Board]):-
	element(S1, Lin1, 1),
	element(E1, Lin1, 1),
	element(S2, Lin2, 1),
	element(E2, Lin2, 1),
	E1 #> S1,
	E2 #> S2,
	length(Idx, 4),
	length(Sorted, 4),
	sorting([S1, E1, S2, E2], Idx, Sorted),
	distance(Sorted),
	checkDiagonals([Lin2 | Board]).



constrainDiagonals([_]).
constrainDiagonals([task(S1,_,E1,_,_), task(S2,_,E2,_,_)|Tasks]):-
	length(Idx, 4),
	length(Sorted, 4),
	sorting([S1, E1, S2, E2], Idx, Sorted),
	distance(Sorted),
	constrainDiagonals([task(S2,_,E2,_,_)|Tasks]).

distance([_]).
distance([A, B|T]):-
	B #> A+1,
	distance([B|T]).

	
gc(Coords, N):-
	buildGC(N, GCV),
	global_cardinality(Coords, GCV).

buildGC(0, []).
buildGC(N, [N-2|V]):-
	N1 is N-1,
	buildGC(N1, V).



makeTasks([], [], [], [], [], _).
makeTasks([Line|Board], [S|Ss], [E|Es], [task(S, D, E, 1, N)|Ts], [H|Hs], N):-
	N1 is N+1,
	D #> 1,
	H #> 0 #=> D #= H+1,
	element(S, Line, 1),
	element(E, Line, 1),
	makeTasks(Board, Ss, Es, Ts, Hs, N1).
	


makeBoard([], _, _).
makeBoard([H|T], N, Z):-
	length(H, N),
	domain(H, 0, 1),
	global_cardinality(H, [0-Z, 1-2]),
	makeBoard(T, N, Z).




% Simple Viewer
showBoard(B, N, Hor, Ver):-
	write('  '), showVer(Ver),
	showBoard(B, N, Hor).
showBoard([], N, _):-write('  '), sep(N),nl.
showBoard([L|B], N, [H|Hor]):-
	write('  '), sep(N), nl,
	write(H), write(' '), showLine(L), nl,
	showBoard(B, N, Hor).
showLine([]):-write('|').
showLine([C|L]):-
	write('|'),
	show(C),
	showLine(L).
show(0):- write('  ').
show(1):- write('##').
sep(0):- write('+').
sep(N):-write('+--'), N1 is N-1, sep(N1).
showVer([]):-nl.
showVer([T|V]):-write('  '), write(T), showVer(V).