initBoard([[empty, empty, empty, empty],
            [empty, empty, empty, empty],
            [empty, empty, empty, empty],
            [empty, empty, empty, empty]
        ]).

start:- initBoard(X), printInicialLine, pb(X).

pb([]). %print board

pb([L|T]) :- 
%printInicialLine, 
pLineBegin, pl(L), pNewLine, printLine,pb(T).

pl([]).
pl([C|T]):-  pc(C), pl(T).

pc(C):-
 translate(C, P), write(P), psep.

translate(empty, '..').

% white pieces
translate(sphere_white, Ow).
translate(cylinder_white, Hw).
translate(sphere_white, Ow).
translate(cylinder_white, Hw).

% brown pieces
translate(sphere_brown, Ob).
translate(cylinder_brown, Hb).
translate(sphere_brown, Ob).
translate(cylinder_brown, Hb).

printInicialLine:-
write(' ___________________________\n').

printLine:-
write('|_____|______|______|______|\n').

pNewLine:-
write('\n').

psep:- write('  |  ').

pLineBegin:- 
write('| ').