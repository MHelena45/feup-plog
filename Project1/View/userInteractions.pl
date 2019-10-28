% Greets the player letting him/her know the color of his/hers pieces
greetPlayer(P):-
    write('\nPlayer '),
    write(P),
    write(', it\'s your turn!\nYour pieces are colored '),
    writeColor(P).
    
askPiece(Piece) :-
    write('.\nWhat piece do you want to play?\n '),
    read(Piece).

askRow(Row) :-
    write('In which row?\n'),
    read(Row).

askColumn(Column) :-
    write('In which column?\n'),
    read(Column).
    
writeColor(1):-
    write('white').

writeColor(2):-
    write('brown').  

wrongMove :-
    write('Can not do that move. Play again.\n').

notEmpty(Row, Collumn) :-
    write('\nRow '),
    write(Row),
    write(' Collumn '),
    write(Collumn),
    write(' with a piece. Can not Replace pieces.\n').

unavailablePiece :-
    write('You dont\'t have any more of those pieces. Choose a diferent one.\n').
    