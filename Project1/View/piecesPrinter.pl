
% Empty simbol
printPiece(0, _) :-     write('...............').

% ------------------ WHITE PIECES -------------------
% Cone
printPiece(11, 2) :-    write('      /\\       ').
printPiece(11, 3) :-    write('     /  \\      ').
printPiece(11, 4) :-    write('    /    \\     ').
printPiece(11, 5) :-    write('   /  WW  \\    ').
printPiece(11, 6) :-    write('  /  WWWW  \\   ').
printPiece(11, 7) :-    write(' /  WWWWWW  \\  ').
printPiece(11, 8) :-    write('/  WWWWWWWW  \\ ').
printPiece(11, 9) :-    write('"-._______.-"  ').
printPiece(11, _) :-    write('               ').

% Cube
printPiece(51, 2) :-    write('    +--------+ ').
printPiece(51, 3) :-    write('   /  WWWW  /| ').
printPiece(51, 4) :-    write('  /  WWWW  / | ').
printPiece(51, 5) :-    write(' +--------+  | ').
printPiece(51, 6) :-    write(' |  WWWW  |  | ').
printPiece(51, 7) :-    write(' |  WWWW  | /  ').
printPiece(51, 8) :-    write(' |  WWWW  |/   ').
printPiece(51, 9) :-    write(' +--------+    ').
printPiece(51, _) :-    write('               ').

% Cylinder
printPiece(71, 2) :-    write('   _.-----._   ').
printPiece(71, 3) :-    write(' .-  WWWWW  -. ').
printPiece(71, 4) :-    write(' |-_  WWW  _-| ').
printPiece(71, 5) :-    write(' |  ~-----~  | ').
printPiece(71, 6) :-    write(' |  WWWWWWW  | ').
printPiece(71, 7) :-    write(' |  WWWWWWW  | ').
printPiece(71, 8) :-    write(' "._       _." ').
printPiece(71, 9) :-    write('    "-----"    ').
printPiece(71, _) :-    write('               ').

% Sphere
printPiece(91, 3) :-    write('      ____     ').
printPiece(91, 4) :-    write('    .W+.   .   ').
printPiece(91, 5) :-    write('  WWw++-..   . ').
printPiece(91, 6) :-    write('  WWWW++--..  .').
printPiece(91, 7) :-    write('  "WWWww+++--" ').
printPiece(91, 8) :-    write('    "WWWwww"   ').
printPiece(91, 9) :-    write('       ""      ').
printPiece(91, _) :-    write('               ').

% ------------------ BROWN PIECES -------------------
% Cone
printPiece(12, 2) :-    write('      /\\       ').
printPiece(12, 3) :-    write('     /  \\      ').
printPiece(12, 4) :-    write('    /    \\     ').
printPiece(12, 5) :-    write('   /  BB  \\    ').
printPiece(12, 6) :-    write('  /  BBBB  \\   ').
printPiece(12, 7) :-    write(' /  BBBBBB  \\  ').
printPiece(12, 8) :-    write('/  BBBBBBBB  \\ ').
printPiece(12, 9) :-    write('"-._______.-"  ').
printPiece(12, _) :-    write('               ').

% Cube
printPiece(52, 2) :-    write('    +--------+ ').
printPiece(52, 3) :-    write('   /  BBBB  /| ').
printPiece(52, 4) :-    write('  /  BBBB  / | ').
printPiece(52, 5) :-    write(' +--------+  | ').
printPiece(52, 6) :-    write(' |  BBBB  |  | ').
printPiece(52, 7) :-    write(' |  BBBB  | /  ').
printPiece(52, 8) :-    write(' |  BBBB  |/   ').
printPiece(52, 9) :-    write(' +--------+    ').
printPiece(52, _) :-    write('               ').

% Cylinder
printPiece(72, 2) :-    write('   _.-----._   ').
printPiece(72, 3) :-    write(' .-  BBBBB  -. ').
printPiece(72, 4) :-    write(' |-_  BBB  _-| ').
printPiece(72, 5) :-    write(' |  ~-----~  | ').
printPiece(72, 6) :-    write(' |  BBBBBBB  | ').
printPiece(72, 7) :-    write(' |  BBBBBBB  | ').
printPiece(72, 8) :-    write(' "._       _." ').
printPiece(72, 9) :-    write('    "-----"    ').
printPiece(72, _) :-    write('               ').

% Sphere
printPiece(92, 3) :-    write('      ____     ').
printPiece(92, 4) :-    write('    .B+.   .   ').
printPiece(92, 5) :-    write('  BBb++-..   . ').
printPiece(92, 6) :-    write('  BBBB++--..  .').
printPiece(92, 7) :-    write('  "BBBbb+++--" ').
printPiece(92, 8) :-    write('    "BBBbbb"   ').
printPiece(92, 9) :-    write('       ""      ').
printPiece(92, _) :-    write('               ').
