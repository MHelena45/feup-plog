% =========================================================================================
%      Board, Pieces of the players available ( 2 of wich form availabe in the begining )
% =========================================================================================

init_board([
    [0, 0, 0, 0],         % 0 represents a empty cell
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0]
]).

init_white_pieces([
    11, 11,     % white cones are represented by 11 and are 2 available in the start
    51, 51,     % white cube are represented by 51 and are 2 available in the start
    71, 71,     % white cylinder are represented by 71 and are 2 available in the start
    91, 91      % white sphere are represented by 91 and are 2 available in the start
]).

init_brown_pieces([
    12, 12,     % brown cone are represented by 12 and are 2 available in the start
    52, 52,     % brown cube are represented by 52 and are 2 available in the start
    72, 72,     % brown cylinder are represented by 72 and are 2 available in the start
    92, 92      % brown sphere are represented by 92 and are 2 available in the start
]).
