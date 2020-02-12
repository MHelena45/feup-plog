place(StartsX, StartsY) :-
StartsX= [Ax, Bx, Cx],
StartsY= [Ay, By, Cy],
domain(StartsX, 1, 10),
domain(StartsY, 1, 10),
Rectangles = [
    rect(Ax, 9, Ay, 4),
    rect(Bx, 4, By, 5),
    rect(Cx, 5, Cy, 5)
    ],Ax+ 9 #=< 10, 
    Ay + 4 #=< 10,
    Bx+ 4 #=< 10, 
    By + 5 #=< 10,
    Cx+ 5 #=< 10,
    Cy + 5 #=< 10,
     disjoint2(Rectangles),
     append(StartsX, StartsY, Vars),labeling([], Vars)