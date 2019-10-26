
% Empty simbol
printPiece(0, _) :-  write('.....').

% ------------------WHITE PIECES -------------------
% Cone
printPiece(11, _) :-    write('               ').
printPiece(11, 4) :-    write('       ^       ').
printPiece(11, 5) :-    write('      /\\       ').
printPiece(11, 6) :-    write('     /  \\      ').
printPiece(11, 7) :-    write('    /    \\     ').
printPiece(11, 8) :-    write('   /  WW  \\    ').
printPiece(11, 9) :-    write('  /  WWWW  \\   ').
printPiece(11, 10) :-   write(' /  WWWWWW  \\  ').
printPiece(11, 11) :-   write('/  WWWWWWWW  \\ ').
printPiece(11, 12) :-   write('\´-._______.-\´   ').

% Cube
printPiece(21, _) :-    write('               ').
printPiece(21, 4) :-    write('   +--------+  ').
printPiece(21, 5) :-    write('  /  WWWW  /|  ').
printPiece(21, 6) :-    write(' /  WWWW  / |  ').
printPiece(21, 7) :-    write('+--------+  |  ').
printPiece(21, 8) :-    write('|  WWWW  |  |  ').
printPiece(21, 9) :-    write('|  WWWW  |  |  ').
printPiece(21, 10) :-   write('|  WWWW  | /   ').
printPiece(21, 11) :-   write('|  WWWW  |/    ').
printPiece(21, 12) :-   write('+--------+     ').

% Cylinder
printPiece(31, _) :-    write('               ').
printPiece(31, 4) :-    write('   _.-----._   ').
printPiece(31, 5) :-    write(' .-  WWWWW  -. ').
printPiece(31, 6) :-    write(' |-_  WWW  _-| ').
printPiece(31, 7) :-    write(' |  ~-----~  | ').
printPiece(31, 8) :-    write(' |  WWWWWWW  | ').
printPiece(31, 9) :-    write(' |  WWWWWWW  | ').
printPiece(31, 10) :-   write(' |  WWWWWWW  | ').
printPiece(31, 11) :-   write(' \`._       _.\' ').
printPiece(31, 12) :-   write('     "-----"   ').

% Sphere
printPiece(41, _) :-    write('               ').
printPiece(41, 4) :-    write('    ____       ').
printPiece(41, 5) :-    write('  .W+.   .     ').
printPiece(41, 6) :-    write('WWw++-..       ').
printPiece(41, 7) :-    write('WWWW++--..     ').
printPiece(41, 8) :-    write('\`WWWww+++--\'   ').
printPiece(41, 9) :-    write('  \`WWWwww\'     ').
printPiece(41, 10) :-   write('     ""        ').

% ------------------BROWN PIECES -------------------
% Cone
printPiece(12, _) :-    write('               ').
printPiece(22, 4) :-    write('       ^       ').
printPiece(12, 5) :-    write('      /\\       ').
printPiece(12, 6) :-    write('     /  \\      ').
printPiece(12, 7) :-    write('    /    \\     ').
printPiece(12, 8) :-    write('   /  BB  \\    ').
printPiece(12, 9) :-    write('  /  BBBB  \\   ').
printPiece(12, 10) :-   write(' /  BBBBBB  \\  ').
printPiece(12, 11) :-   write('/  BBBBBBBB  \\ ').
printPiece(12, 12) :-   write('\´-._______.-\´   ').

% Cube
printPiece(22, _) :-    write('               ').
printPiece(22, 4) :-    write('   +--------+  ').
printPiece(22, 5) :-    write('  /  BBBB  /|  ').
printPiece(22, 6) :-    write(' /  BBBB  / |  ').
printPiece(22, 7) :-    write('+--------+  |  ').
printPiece(22, 8) :-    write('|  BBBB  |  |  ').
printPiece(22, 9) :-    write('|  BBBB  |  |  ').
printPiece(22, 10) :-   write('|  BBBB  | /   ').
printPiece(22, 11) :-   write('|  BBBB  |/    ').
printPiece(22, 12) :-   write('+--------+     ').

% Cylinder
printPiece(32, _) :-    write('               ').
printPiece(32, 4) :-    write('   _.-----._   ').
printPiece(32, 5) :-    write(' .-  BBBBB  -. ').
printPiece(32, 6) :-    write(' |-_  BBB  _-| ').
printPiece(32, 7) :-    write(' |  ~-----~  | ').
printPiece(32, 8) :-    write(' |  BBBBBBB  | ').
printPiece(32, 9) :-    write(' |  BBBBBBB  | ').
printPiece(32, 10) :-   write(' |  BBBBBBB  | ').
printPiece(32, 11) :-   write(' \`._       _.\' ').
printPiece(32, 12) :-   write('     "-----"   ').

% Sphere
printPiece(42, _) :-    write('               ').
printPiece(42, 4) :-    write('    ____       ').
printPiece(42, 5) :-    write('  .B+.   .     ').
printPiece(42, 6) :-    write('BBb++-..       ').
printPiece(42, 7) :-    write('BBBB++--..     ').
printPiece(42, 8) :-    write('\`BBBbb+++--\'   ').
printPiece(42, 9) :-    write('  \`BBBbbb\'     ').
printPiece(42, 10) :-   write('     ""        ').
