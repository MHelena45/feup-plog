
% Empty simbol
printPiece(0, _) :-     write('...............').

% ------------------WHITE PIECES -------------------
% Cone
printPiece(11, 4) :-    write('       ^       ').
printPiece(11, 5) :-    write('      /\\       ').
printPiece(11, 6) :-    write('     /  \\      ').
printPiece(11, 7) :-    write('    /    \\     ').
printPiece(11, 8) :-    write('   /  WW  \\    ').
printPiece(11, 9) :-    write('  /  WWWW  \\   ').
printPiece(11, 10) :-   write(' /  WWWWWW  \\  ').
printPiece(11, 11) :-   write('/  WWWWWWWW  \\ ').
printPiece(11, 12) :-   write('"-._______.-"  ').
printPiece(11, _) :-    write('               ').

% Cube
printPiece(51, 4) :-    write('    +--------+ ').
printPiece(51, 5) :-    write('   /  WWWW  /| ').
printPiece(51, 6) :-    write('  /  WWWW  / | ').
printPiece(51, 7) :-    write(' +--------+  | ').
printPiece(51, 8) :-    write(' |  WWWW  |  | ').
printPiece(51, 9) :-    write(' |  WWWW  |  | ').
printPiece(51, 10) :-   write(' |  WWWW  | /  ').
printPiece(51, 11) :-   write(' |  WWWW  |/   ').
printPiece(51, 12) :-   write(' +--------+    ').
printPiece(51, _) :-    write('               ').

% Cylinder
printPiece(71, 4) :-    write('   _.-----._   ').
printPiece(71, 5) :-    write(' .-  WWWWW  -. ').
printPiece(71, 6) :-    write(' |-_  WWW  _-| ').
printPiece(71, 7) :-    write(' |  ~-----~  | ').
printPiece(71, 8) :-    write(' |  WWWWWWW  | ').
printPiece(71, 9) :-    write(' |  WWWWWWW  | ').
printPiece(71, 10) :-   write(' |  WWWWWWW  | ').
printPiece(71, 11) :-   write(' "._       _." ').
printPiece(71, 12) :-   write('    "-----"    ').
printPiece(71, _) :-    write('               ').

% Sphere
printPiece(91, 4) :-    write('      ____     ').
printPiece(91, 5) :-    write('    .W+.   .   ').
printPiece(91, 6) :-    write('  WWw++-..     ').
printPiece(91, 7) :-    write('  WWWW++--..   ').
printPiece(91, 8) :-    write('  "WWWww+++--" ').
printPiece(91, 9) :-    write('    "WWWwww"   ').
printPiece(91, 10) :-   write('       ""      ').
printPiece(91, _) :-    write('               ').

% ------------------BROWN PIECES -------------------
% Cone
printPiece(12, 4) :-    write('       ^       ').
printPiece(12, 5) :-    write('      /\\       ').
printPiece(12, 6) :-    write('     /  \\      ').
printPiece(12, 7) :-    write('    /    \\     ').
printPiece(12, 8) :-    write('   /  BB  \\    ').
printPiece(12, 9) :-    write('  /  BBBB  \\   ').
printPiece(12, 10) :-   write(' /  BBBBBB  \\  ').
printPiece(12, 11) :-   write('/  BBBBBBBB  \\ ').
printPiece(12, 12) :-   write('"-._______.-"  ').
printPiece(12, _) :-    write('               ').

% Cube
printPiece(52, 4) :-    write('    +--------+ ').
printPiece(52, 5) :-    write('   /  BBBB  /| ').
printPiece(52, 6) :-    write('  /  BBBB  / | ').
printPiece(52, 7) :-    write(' +--------+  | ').
printPiece(52, 8) :-    write(' |  BBBB  |  | ').
printPiece(52, 9) :-    write(' |  BBBB  |  | ').
printPiece(52, 10) :-   write(' |  BBBB  | /  ').
printPiece(52, 11) :-   write(' |  BBBB  |/   ').
printPiece(52, 12) :-   write(' +--------+    ').
printPiece(52, _) :-    write('               ').

% Cylinder
printPiece(72, 4) :-    write('   _.-----._   ').
printPiece(72, 5) :-    write(' .-  BBBBB  -. ').
printPiece(72, 6) :-    write(' |-_  BBB  _-| ').
printPiece(72, 7) :-    write(' |  ~-----~  | ').
printPiece(72, 8) :-    write(' |  BBBBBBB  | ').
printPiece(72, 9) :-    write(' |  BBBBBBB  | ').
printPiece(72, 10) :-   write(' |  BBBBBBB  | ').
printPiece(72, 11) :-   write(' "._       _." ').
printPiece(72, 12) :-   write('    "-----"    ').
printPiece(72, _) :-    write('               ').

% Sphere
printPiece(92, 4) :-    write('      ____     ').
printPiece(92, 5) :-    write('    .B+.   .   ').
printPiece(92, 6) :-    write('  BBb++-..     ').
printPiece(92, 7) :-    write('  BBBB++--..   ').
printPiece(92, 8) :-    write('  "BBBbb+++--" ').
printPiece(92, 9) :-    write('    "BBBbbb"   ').
printPiece(92, 10) :-   write('       ""      ').
printPiece(92, _) :-    write('               ').
