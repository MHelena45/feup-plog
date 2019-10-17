:- include('printer.pl').

initBoard([
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty],
    [empty, empty, empty, empty]
    ]).

midBoard([
    [sphere_white, empty, empty, cylinder_white],
    [cube_brown, empty, empty, empty],
    [empty, cube_white, cone_brown, empty],
    [empty, empty, empty, cube_brown]
    ]).


finBoard([
    [sphere_white, empty, empty, cylinder_white],
    [cube_brown, cylinder_white, empty,cone_white],
    [empty, cube_white, cone_brown, sphere_brown],
    [empty, empty, empty, cube_brown]
    ]).


start :- 
    initBoard(X), 
    display_game(X).

