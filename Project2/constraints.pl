% constraints(Board_Size, Column_Constraints, Row_Constraints) 

% ######## 1 Column - 0 Row ##############
constraints(_, [], []).
constraints(9, [2-3], []). 
constraints(11, [2-2], []).
constraints(13, [2-2], []).
constraints(15, [2-2], []).
constraints(_, [2-4], []). 
constraints(_, [2-6], []). 
constraints(9, [5-2], []).
constraints(11, [5-2], []).
constraints(13, [5-3], []).
constraints(_, [5-4], []).
constraints(15, [5-5], []).
constraints(_, [5-6], []).
constraints(9, [7-2], []).
constraints(11, [7-2], []).
constraints(13, [7-3], []).
constraints(_, [7-5], []).
constraints(15, [7-6], []).

% ######## 0 Column - 1 Row ##############
constraints(_, [], [1-2]).
constraints(_, [], [1-4]).
constraints(_, [], [1-7]).
constraints(_, [], [6-3]).
constraints(_, [], [6-5]).
constraints(_, [], [6-6]).
constraints(_, [], [8-3]).
constraints(_, [], [8-5]).
constraints(_, [], [8-7]). 

% ######## 1 Column - 1 Row ##############
constraints(9, [2-3], [1-2]).
constraints(11, [2-2], [1-2]).
constraints(13, [2-2], [1-2]).
constraints(15, [2-2], [1-2]).
constraints(9, [2-3], [1-4]).
constraints(11, [2-2], [1-4]).
constraints(13, [2-2], [1-4]).
constraints(15, [2-2], [1-4]).
constraints(9, [2-3], [1-5]).
constraints(11, [2-2], [1-5]).
constraints(13, [2-2], [1-5]).
constraints(15, [2-2], [1-5]).
constraints(9, [2-3], [6-3]).
constraints(11, [2-2], [6-3]).
constraints(13, [2-2], [6-3]).
constraints(15, [2-2], [6-3]).
constraints(9, [2-3], [6-6]).
constraints(11, [2-2], [6-6]).
constraints(13, [2-2], [6-6]).
constraints(15, [2-2], [6-6]).
constraints(9, [2-3], [8-3]).
constraints(11, [2-2], [8-3]).
constraints(13, [2-2], [8-3]).
constraints(15, [2-2], [8-3]).
constraints(9, [2-3], [8-5]).
constraints(11, [2-2], [8-5]).
constraints(13, [2-2], [8-5]).
constraints(15, [2-2], [8-5]).
constraints(9, [2-3], [8-7]). 
constraints(11, [2-2], [8-7]).
constraints(13, [2-2], [8-7]).
constraints(15, [2-2], [8-7]). 

constraints(_, [2-4], [1-2]).
constraints(_, [2-4], [1-4]).
constraints(_, [2-4], [1-5]).
constraints(_, [2-4], [6-3]).
constraints(11, [2-4], [6-6]).
constraints(13, [2-4], [6-6]).
constraints(15, [2-4], [6-6]).
constraints(_, [2-4], [8-3]).
constraints(11, [2-4], [8-5]).
constraints(13, [2-4], [8-5]).
constraints(15, [2-4], [8-5]).
constraints(11, [2-4], [8-7]).
constraints(13, [2-4], [8-7]).
constraints(15, [2-4], [8-7]). 

constraints(_, [2-6], [1-2]).
constraints(_, [2-6], [1-4]).
constraints(_, [2-6], [1-5]).
constraints(_, [2-6], [6-3]).
constraints(11, [2-6], [6-6]).
constraints(13, [2-6], [6-6]).
constraints(15, [2-6], [6-6]).
constraints(_, [2-6], [8-3]).
constraints(11, [2-6], [8-5]).
constraints(13, [2-6], [8-5]).
constraints(15, [2-6], [8-5]).
constraints(11, [2-6], [8-7]).
constraints(13, [2-6], [8-7]).
constraints(15, [2-6], [8-7]). 

constraints(9, [5-2], [1-2]).
constraints(11, [5-2], [1-2]).
constraints(13, [5-2], [1-2]).
constraints(9, [5-2], [1-4]).
constraints(11, [5-2], [1-4]).
constraints(13, [5-2], [1-4]).
constraints(_, [5-2], [1-5]).
constraints(9, [5-2], [6-3]).
constraints(11, [5-2], [6-3]).
constraints(13, [5-2], [6-3]).
constraints(9, [5-2], [6-6]).
constraints(11, [5-2], [6-6]).
constraints(13, [5-2], [6-6]).
constraints(9, [5-2], [8-3]).
constraints(11, [5-2], [8-3]).
constraints(13, [5-2], [8-3]).
constraints(9, [5-2], [8-5]).
constraints(11, [5-2], [8-5]).
constraints(13, [5-2], [8-5]).
constraints(9, [5-2], [8-7]).
constraints(11, [5-2], [8-7]).
constraints(13, [5-2], [8-7]).  

constraints(_, [5-4], [1-2]).
constraints(_, [5-4], [1-4]).
constraints(_, [5-4], [1-5]).
constraints(11, [5-4], [6-3]).
constraints(13, [5-4], [6-3]).
constraints(15, [5-4], [6-3]).
constraints(11, [5-4], [6-6]).
constraints(13, [5-4], [6-6]).
constraints(14, [5-4], [6-6]).
constraints(_, [5-4], [8-3]).
constraints(11, [5-4], [8-5]).
constraints(13, [5-4], [8-5]).
constraints(15, [5-4], [8-5]).
constraints(11, [5-4], [8-7]).
constraints(13, [5-4], [8-7]).
constraints(15, [5-4], [8-7]). 

constraints(15, [5-5], [1-2]).
constraints(15, [5-5], [1-4]).
constraints(15, [5-5], [1-5]).
constraints(15, [5-5], [6-3]).
constraints(15, [5-5], [6-6]).
constraints(15, [5-5], [8-3]).
constraints(15, [5-5], [8-5]).
constraints(15, [5-5], [8-7]). 

constraints(_, [5-6], [1-2]).
constraints(_, [5-6], [1-4]).
constraints(_, [5-6], [1-5]).
constraints(_, [5-6], [6-3]).
constraints(11, [5-6], [6-6]).
constraints(13, [5-6], [6-6]).
constraints(15, [5-6], [6-6]).
constraints(_, [5-6], [8-3]).
constraints(11, [5-6], [8-5]).
constraints(13, [5-6], [8-5]).
constraints(15, [5-6], [8-5]).
constraints(11, [5-6], [8-7]).
constraints(13, [5-6], [8-7]).
constraints(15, [5-6], [8-7]). 

constraints(_, [7-5], [1-2]).
constraints(_, [7-5], [1-4]).
constraints(_, [7-5], [1-5]).
constraints(_, [7-5], [6-3]).
constraints(_, [7-5], [6-6]).
constraints(_, [7-5], [8-3]).
constraints(_, [7-5], [8-5]).
constraints(9, [7-5], [8-7]).
constraints(11, [7-5], [8-7]).
constraints(13, [7-5], [8-9]).
constraints(15, [7-5], [8-7]).  

% ######## 2 Column - 0 Row ##############
constraints(9, [2-3, 5-4], []).
constraints(11, [2-2, 5-4], []).
constraints(13, [2-2, 5-4], []).
constraints(15, [2-2, 5-4], []).
constraints(9, [2-3, 5-6], []).
constraints(11, [2-2, 5-6], []).
constraints(13, [2-2, 5-6], []).
constraints(15, [2-2, 5-6], []).
constraints(9, [2-3, 7-5], []).
constraints(11, [2-2, 7-5], []).
constraints(13, [2-2, 7-5], []).
constraints(15, [2-2, 7-5], []).
constraints(9, [2-3, 7-6], []).
constraints(11, [2-2, 7-7], []).
constraints(13, [2-2, 7-7], []).
constraints(15, [2-2, 7-7], []).

constraints(_, [2-4, 5-4], []).
constraints(_, [2-4, 5-6], []).
constraints(9, [2-5, 7-5], []).
constraints(11, [2-4, 7-5], []).
constraints(13, [2-4, 7-5], []).
constraints(15, [2-4, 7-5], []).
constraints(11, [2-4, 7-7], []).
constraints(12, [2-4, 7-7], []).
constraints(13, [2-4, 7-7], []). 

constraints(11, [2-6, 5-4], []).
constraints(13, [2-6, 5-4], []).
constraints(15, [2-6, 5-4], []).
constraints(11, [2-6, 5-6], []).
constraints(13, [2-6, 5-6], []).
constraints(15, [2-6, 5-6], []).
constraints(11, [2-6, 7-5], []).
constraints(13, [2-6, 7-5], []).
constraints(15, [2-6, 7-5], []).
constraints(11, [2-6, 7-7], []).
constraints(12, [2-6, 7-7], []).
constraints(13, [2-6, 7-7], []). 

constraints(11, [5-4, 7-2], []).
constraints(13, [5-4, 7-3], []).
constraints(11, [5-4, 7-5], []).
constraints(13, [5-4, 7-5], []).
constraints(15, [5-4, 7-5], []).
constraints(15, [5-4, 7-6], []).
constraints(11, [5-4, 7-7], []).
constraints(13, [5-4, 7-7], []). 
constraints(15, [5-4, 7-7], []). 

constraints(11, [5-6, 7-2], []).
constraints(13, [5-6, 7-3], []).
constraints(11, [5-6, 7-5], []).
constraints(13, [5-6, 7-5], []).
constraints(15, [5-6, 7-5], []).
constraints(15, [5-6, 7-6], []).
constraints(11, [5-6, 7-7], []).
constraints(13, [5-6, 7-7], []). 
constraints(15, [5-6, 7-7], []). 
  
% ######## 0 Column - 2 Row ##############
constraints(_, [], [1-2, 6-3]). 
constraints(_, [], [1-2, 6-5]).
constraints(_, [], [1-2, 6-6]).
constraints(_, [], [1-2, 8-3]).
constraints(_, [], [1-2, 8-5]).
constraints(_, [], [1-2, 8-7]). 

constraints(_, [], [1-4, 6-3]). 
constraints(_, [], [1-4, 6-5]).
constraints(_, [], [1-4, 6-6]).
constraints(_, [], [1-4, 8-3]).
constraints(_, [], [1-4, 8-5]).
constraints(9, [], [1-4, 8-6]).
constraints(11, [], [1-4, 8-7]).
constraints(13, [], [1-4, 8-7]).
constraints(15, [], [1-4, 8-7]). 

constraints(11, [], [1-7, 7-3]). 
constraints(13, [], [1-7, 7-3]). 
constraints(15, [], [1-7, 7-3]). 
constraints(11, [], [1-7, 7-5]).
constraints(13, [], [1-7, 7-5]).
constraints(15, [], [1-7, 7-5]).
constraints(11, [], [1-7, 7-6]).
constraints(13, [], [1-7, 7-6]).
constraints(15, [], [1-7, 7-6]).
constraints(11, [], [1-7, 9-3]).
constraints(13, [], [1-7, 9-3]).
constraints(15, [], [1-7, 9-3]).
constraints(11, [], [1-7, 9-5]).
constraints(13, [], [1-7, 9-5]).
constraints(15, [], [1-7, 9-5]).
constraints(11, [], [1-7, 9-7]).
constraints(13, [], [1-7, 9-7]).
constraints(15, [], [1-7, 9-7]). 

constraints(_, [], [6-3, 8-3]).
constraints(_, [], [6-3, 8-5]).
constraints(_, [], [6-3, 8-7]).  

constraints(11, [], [6-5, 8-3]).
constraints(13, [], [6-5, 8-3]).
constraints(15, [], [6-5, 8-3]).
constraints(11, [], [6-5, 8-5]).
constraints(13, [], [6-5, 8-5]).
constraints(15, [], [6-5, 8-5]).
constraints(_, [], [6-5, 8-7]). 

constraints(11, [], [6-6, 8-3]).
constraints(13, [], [6-6, 8-3]).
constraints(15, [], [6-6, 8-3]).
constraints(_, [], [6-6, 8-5]).
constraints(_, [], [6-6, 8-7]). 

% ######## 2 Column - 1 Row ##############
constraints(11, [2-2, 5-4], [1-2]).
constraints(13, [2-2, 5-4], [1-2]).
constraints(15, [2-2, 5-4], [1-2]).
constraints(9, [2-3, 5-6], [1-2]).
constraints(11, [2-2, 5-6], [1-2]).
constraints(13, [2-2, 5-6], [1-2]).
constraints(15, [2-2, 5-6], [1-2]).
constraints(9, [2-3, 7-5], [1-2]).
constraints(11, [2-2, 7-5], [1-2]).
constraints(13, [2-2, 7-5], [1-2]).
constraints(15, [2-2, 7-5], [1-2]).
constraints(9, [2-3, 7-6], [1-2]).
constraints(11, [2-2, 7-7], [1-2]).
constraints(13, [2-2, 7-7], [1-2]).
constraints(15, [2-2, 7-7], [1-2]).

constraints(_, [2-4, 5-4], [1-2]).
constraints(11, [2-4, 5-6], [1-2]).
constraints(13, [2-4, 5-6], [1-2]).
constraints(15, [2-4, 5-6], [1-2]).
constraints(9, [2-5, 7-5], [1-2]).
constraints(11, [2-4, 7-5], [1-2]).
constraints(13, [2-4, 7-5], [1-2]).
constraints(15, [2-4, 7-5], [1-2]).
constraints(11, [2-4, 7-7], [1-2]).
constraints(12, [2-4, 7-7], [1-2]).
constraints(13, [2-4, 7-7], [1-2]). 

constraints(11, [2-6, 5-4], [1-2]).
constraints(13, [2-6, 5-4], [1-2]).
constraints(15, [2-6, 5-4], [1-2]).
constraints(11, [2-6, 5-6], [1-2]).
constraints(13, [2-6, 5-6], [1-2]).
constraints(15, [2-6, 5-6], [1-2]).
constraints(11, [2-6, 7-5], [1-2]).
constraints(13, [2-6, 7-5], [1-2]).
constraints(15, [2-6, 7-5], [1-2]).
constraints(11, [2-6, 7-7], [1-2]).
constraints(12, [2-6, 7-7], [1-2]).
constraints(13, [2-6, 7-7], [1-2]). 

constraints(11, [5-4, 7-2], [1-2]).
constraints(13, [5-4, 7-3], [1-2]).
constraints(11, [5-4, 7-5], [1-2]).
constraints(13, [5-4, 7-5], [1-2]).
constraints(15, [5-4, 7-5], [1-2]).
constraints(15, [5-4, 7-6], [1-2]).
constraints(11, [5-4, 7-7], [1-2]).
constraints(13, [5-4, 7-7], [1-2]). 
constraints(15, [5-4, 7-7], [1-2]). 

constraints(11, [5-6, 7-2], [1-2]).
constraints(13, [5-6, 7-3], [1-2]).
constraints(11, [5-6, 7-5], [1-2]).
constraints(13, [5-6, 7-5], [1-2]).
constraints(15, [5-6, 7-5], [1-2]).
constraints(15, [5-6, 7-6], [1-2]).
constraints(11, [5-6, 7-7], [1-2]).
constraints(13, [5-6, 7-7], [1-2]). 
constraints(15, [5-6, 7-7], [1-2]). 

constraints(9, [2-3, 5-4], [1-4]).
constraints(11, [2-2, 5-4], [1-4]).
constraints(13, [2-2, 5-4], [1-4]).
constraints(15, [2-2, 5-4], [1-4]).
constraints(9, [2-3, 5-6], [1-4]).
constraints(11, [2-2, 5-6], [1-4]).
constraints(13, [2-2, 5-6], [1-4]).
constraints(15, [2-2, 5-6], [1-4]).
constraints(9, [2-3, 7-5], [1-5]).
constraints(11, [2-2, 7-5], [1-4]).
constraints(13, [2-2, 7-5], [1-4]).
constraints(15, [2-2, 7-5], [1-4]).
constraints(9, [2-3, 7-6], [1-4]).
constraints(11, [2-2, 7-7], [1-4]).
constraints(13, [2-2, 7-7], [1-4]).
constraints(15, [2-2, 7-7], [1-4]).

constraints(9, [2-4, 5-4], [1-5]).
constraints(11, [2-4, 5-4], [1-4]).
constraints(13, [2-4, 5-4], [1-4]).
constraints(15, [2-4, 5-4], [1-4]).
constraints(_, [2-4, 5-6], [1-4]).
constraints(11, [2-4, 7-5], [1-4]).
constraints(13, [2-4, 7-5], [1-4]).
constraints(15, [2-4, 7-5], [1-4]).
constraints(11, [2-4, 7-7], [1-4]).
constraints(12, [2-4, 7-7], [1-4]).
constraints(13, [2-4, 7-7], [1-4]). 

constraints(11, [2-6, 5-4], [1-4]).
constraints(13, [2-6, 5-4], [1-4]).
constraints(15, [2-6, 5-4], [1-4]).
constraints(11, [2-6, 5-6], [1-4]).
constraints(13, [2-6, 5-6], [1-4]).
constraints(15, [2-6, 5-6], [1-4]).
constraints(11, [2-6, 7-5], [1-4]).
constraints(13, [2-6, 7-5], [1-4]).
constraints(15, [2-6, 7-5], [1-4]).
constraints(11, [2-6, 7-7], [1-4]).
constraints(12, [2-6, 7-7], [1-4]).
constraints(13, [2-6, 7-7], [1-4]). 

constraints(11, [5-4, 7-2], [1-4]).
constraints(13, [5-4, 7-3], [1-4]).
constraints(11, [5-4, 7-5], [1-4]).
constraints(13, [5-4, 7-5], [1-4]).
constraints(15, [5-4, 7-5], [1-4]).
constraints(15, [5-4, 7-6], [1-4]).
constraints(11, [5-4, 7-7], [1-4]).
constraints(13, [5-4, 7-7], [1-4]). 
constraints(15, [5-4, 7-7], [1-4]). 

constraints(11, [5-6, 7-2], [1-4]).
constraints(13, [5-6, 7-3], [1-4]).
constraints(11, [5-6, 7-5], [1-4]).
constraints(13, [5-6, 7-5], [1-4]).
constraints(15, [5-6, 7-5], [1-4]).
constraints(15, [5-6, 7-6], [1-4]).
constraints(11, [5-6, 7-7], [1-4]).
constraints(13, [5-6, 7-7], [1-4]). 
constraints(15, [5-6, 7-7], [1-4]). 

constraints(9, [2-3, 5-4], [1-6]).
constraints(11, [2-2, 5-4], [1-7]).
constraints(13, [2-2, 5-4], [1-7]).
constraints(15, [2-2, 5-4], [1-7]).
constraints(9, [2-3, 5-6], [1-6]).
constraints(11, [2-2, 5-6], [1-7]).
constraints(13, [2-2, 5-6], [1-7]).
constraints(15, [2-2, 5-6], [1-7]).
constraints(9, [2-3, 7-5], [1-6]).
constraints(11, [2-2, 7-5], [1-7]).
constraints(13, [2-2, 7-5], [1-7]).
constraints(15, [2-2, 7-5], [1-7]).
constraints(11, [2-2, 7-7], [1-7]).
constraints(13, [2-2, 7-7], [1-7]).
constraints(15, [2-2, 7-7], [1-7]).

constraints(9, [2-4, 5-4], [1-6]).
constraints(11, [2-4, 5-4], [1-7]).
constraints(13, [2-4, 5-4], [1-7]).
constraints(15, [2-4, 5-4], [1-7]).
constraints(11, [2-4, 5-6], [1-7]).
constraints(13, [2-4, 5-6], [1-7]).
constraints(15, [2-4, 5-6], [1-7]).
constraints(9, [2-5, 7-5], [1-6]).
constraints(11, [2-4, 7-5], [1-7]).
constraints(13, [2-4, 7-5], [1-7]).
constraints(15, [2-4, 7-5], [1-7]).
constraints(11, [2-4, 7-7], [1-7]).
constraints(12, [2-4, 7-7], [1-7]).
constraints(13, [2-4, 7-7], [1-7]). 

constraints(11, [2-6, 5-4], [1-7]).
constraints(13, [2-6, 5-4], [1-7]).
constraints(15, [2-6, 5-4], [1-7]).
constraints(11, [2-6, 5-6], [1-7]).
constraints(13, [2-6, 5-6], [1-7]).
constraints(15, [2-6, 5-6], [1-7]).
constraints(11, [2-6, 7-5], [1-7]).
constraints(13, [2-6, 7-5], [1-7]).
constraints(15, [2-6, 7-5], [1-7]).
constraints(11, [2-6, 7-7], [1-7]).
constraints(12, [2-6, 7-7], [1-7]).
constraints(13, [2-6, 7-7], [1-7]). 

constraints(11, [5-4, 7-2], [1-7]).
constraints(13, [5-4, 7-3], [1-7]).
constraints(11, [5-4, 7-5], [1-7]).
constraints(13, [5-4, 7-5], [1-7]).
constraints(15, [5-4, 7-5], [1-7]).
constraints(15, [5-4, 7-6], [1-7]).
constraints(11, [5-4, 7-7], [1-7]).
constraints(13, [5-4, 7-7], [1-7]). 
constraints(15, [5-4, 7-7], [1-7]). 

constraints(11, [5-6, 7-2], [1-7]).
constraints(13, [5-6, 7-3], [1-7]).
constraints(11, [5-6, 7-5], [1-7]).
constraints(13, [5-6, 7-5], [1-7]).
constraints(15, [5-6, 7-5], [1-7]).
constraints(15, [5-6, 7-6], [1-7]).
constraints(11, [5-6, 7-7], [1-7]).
constraints(13, [5-6, 7-7], [1-7]). 
constraints(15, [5-6, 7-7], [1-7]). 

constraints(11, [2-2, 5-4], [6-3]).
constraints(13, [2-2, 5-4], [6-3]).
constraints(15, [2-2, 5-4], [6-3]).
constraints(11, [2-2, 5-6], [6-3]).
constraints(13, [2-2, 5-6], [6-3]).
constraints(15, [2-2, 5-6], [6-3]).
constraints(11, [2-2, 7-5], [6-3]).
constraints(13, [2-2, 7-5], [6-3]).
constraints(15, [2-2, 7-5], [6-3]).
constraints(11, [2-2, 7-7], [6-3]).
constraints(13, [2-2, 7-7], [6-3]).
constraints(15, [2-2, 7-7], [6-3]).

constraints(11, [2-4, 5-4], [6-3]).
constraints(13, [2-4, 5-4], [6-3]).
constraints(15, [2-4, 5-4], [6-3]).
constraints(11, [2-4, 5-6], [6-3]).
constraints(13, [2-4, 5-6], [6-3]).
constraints(15, [2-4, 5-6], [6-3]).
constraints(11, [2-4, 7-5], [6-3]).
constraints(13, [2-4, 7-5], [6-3]).
constraints(15, [2-4, 7-5], [6-3]).
constraints(11, [2-4, 7-7], [6-3]).
constraints(12, [2-4, 7-7], [6-3]).
constraints(13, [2-4, 7-7], [6-3]). 

constraints(11, [2-6, 5-4], [6-3]).
constraints(13, [2-6, 5-4], [6-3]).
constraints(15, [2-6, 5-4], [6-3]).
constraints(11, [2-6, 5-6], [6-3]).
constraints(13, [2-6, 5-6], [6-3]).
constraints(15, [2-6, 5-6], [6-3]).
constraints(11, [2-6, 7-5], [6-3]).
constraints(13, [2-6, 7-5], [6-3]).
constraints(15, [2-6, 7-5], [6-3]).
constraints(11, [2-6, 7-7], [6-3]).
constraints(12, [2-6, 7-7], [6-3]).
constraints(13, [2-6, 7-7], [6-3]). 

constraints(11, [5-4, 7-2], [6-3]).
constraints(13, [5-4, 7-3], [6-3]).
constraints(11, [5-4, 7-5], [6-3]).
constraints(13, [5-4, 7-5], [6-3]).
constraints(15, [5-4, 7-5], [6-3]).
constraints(15, [5-4, 7-6], [6-3]).
constraints(11, [5-4, 7-7], [6-3]).
constraints(13, [5-4, 7-7], [6-3]). 
constraints(15, [5-4, 7-7], [6-3]). 

constraints(11, [5-6, 7-2], [6-3]).
constraints(13, [5-6, 7-3], [6-3]).
constraints(11, [5-6, 7-5], [6-3]).
constraints(13, [5-6, 7-5], [6-3]).
constraints(15, [5-6, 7-5], [6-3]).
constraints(15, [5-6, 7-6], [6-3]).
constraints(11, [5-6, 7-7], [6-3]).
constraints(13, [5-6, 7-7], [6-3]). 
constraints(15, [5-6, 7-7], [6-3]). 

constraints(11, [2-2, 5-4], [6-5]).
constraints(13, [2-2, 5-4], [6-5]).
constraints(15, [2-2, 5-4], [6-5]).
constraints(11, [2-2, 5-6], [6-5]).
constraints(13, [2-2, 5-6], [6-5]).
constraints(15, [2-2, 5-6], [6-5]).
constraints(11, [2-2, 7-5], [6-5]).
constraints(13, [2-2, 7-5], [6-5]).
constraints(15, [2-2, 7-5], [6-5]).
constraints(11, [2-2, 7-7], [6-5]).
constraints(13, [2-2, 7-7], [6-5]).
constraints(15, [2-2, 7-7], [6-5]).

constraints(11, [2-4, 5-4], [6-5]).
constraints(13, [2-4, 5-4], [6-5]).
constraints(15, [2-4, 5-4], [6-5]).
constraints(_, [2-4, 5-6], [6-5]).
constraints(11, [2-4, 7-5], [6-5]).
constraints(13, [2-4, 7-5], [6-5]).
constraints(15, [2-4, 7-5], [6-5]).
constraints(11, [2-4, 7-7], [6-5]).
constraints(12, [2-4, 7-7], [6-5]).
constraints(13, [2-4, 7-7], [6-5]). 

constraints(11, [2-6, 5-4], [6-5]).
constraints(13, [2-6, 5-4], [6-5]).
constraints(15, [2-6, 5-4], [6-5]).
constraints(11, [2-6, 5-6], [6-5]).
constraints(13, [2-6, 5-6], [6-5]).
constraints(15, [2-6, 5-6], [6-5]).
constraints(11, [2-6, 7-5], [6-5]).
constraints(13, [2-6, 7-5], [6-5]).
constraints(15, [2-6, 7-5], [6-5]).
constraints(11, [2-6, 7-7], [6-5]).
constraints(12, [2-6, 7-7], [6-5]).
constraints(13, [2-6, 7-7], [6-5]). 

constraints(11, [5-4, 7-2], [6-5]).
constraints(13, [5-4, 7-3], [6-5]).
constraints(11, [5-4, 7-5], [6-5]).
constraints(13, [5-4, 7-5], [6-5]).
constraints(15, [5-4, 7-5], [6-5]).
constraints(15, [5-4, 7-6], [6-5]).
constraints(11, [5-4, 7-7], [6-5]).
constraints(13, [5-4, 7-7], [6-5]). 
constraints(15, [5-4, 7-7], [6-5]). 

constraints(11, [5-6, 7-2], [6-5]).
constraints(13, [5-6, 7-3], [6-5]).
constraints(11, [5-6, 7-5], [6-5]).
constraints(13, [5-6, 7-5], [6-5]).
constraints(15, [5-6, 7-5], [6-5]).
constraints(15, [5-6, 7-6], [6-5]).
constraints(11, [5-6, 7-7], [6-5]).
constraints(13, [5-6, 7-7], [6-5]). 
constraints(15, [5-6, 7-7], [6-5]). 

constraints(9, [2-3, 5-4], [8-3]).
constraints(11, [2-2, 5-4], [8-3]).
constraints(13, [2-2, 5-4], [8-3]).
constraints(15, [2-2, 5-4], [8-4]).
constraints(9, [2-3, 5-6], [8-3]).
constraints(11, [2-2, 5-6], [8-3]).
constraints(13, [2-2, 5-6], [8-3]).
constraints(15, [2-2, 5-6], [8-3]).
constraints(11, [2-2, 7-5], [8-3]).
constraints(13, [2-2, 7-5], [8-3]).
constraints(15, [2-2, 7-5], [8-3]).
constraints(9, [2-3, 7-6], [8-3]).
constraints(11, [2-2, 7-7], [8-3]).
constraints(13, [2-2, 7-7], [8-3]).
constraints(15, [2-2, 7-7], [8-3]).

constraints(11, [2-4, 5-4], [8-3]).
constraints(13, [2-4, 5-4], [8-3]).
constraints(15, [2-4, 5-4], [8-3]).
constraints(_, [2-4, 5-6], [8-3]).
constraints(11, [2-4, 7-5], [8-3]).
constraints(13, [2-4, 7-5], [8-3]).
constraints(15, [2-4, 7-5], [8-3]).
constraints(11, [2-4, 7-7], [8-3]).
constraints(12, [2-4, 7-7], [8-3]).
constraints(13, [2-4, 7-7], [8-3]). 

constraints(11, [2-6, 5-4], [8-3]).
constraints(13, [2-6, 5-4], [8-3]).
constraints(15, [2-6, 5-4], [8-3]).
constraints(11, [2-6, 5-6], [8-3]).
constraints(13, [2-6, 5-6], [8-3]).
constraints(15, [2-6, 5-6], [8-3]).
constraints(11, [2-6, 7-5], [8-3]).
constraints(13, [2-6, 7-5], [8-3]).
constraints(15, [2-6, 7-5], [8-3]).
constraints(11, [2-6, 7-7], [8-3]).
constraints(12, [2-6, 7-7], [8-3]).
constraints(13, [2-6, 7-7], [8-3]). 

constraints(11, [5-4, 7-2], [8-3]).
constraints(13, [5-4, 7-3], [8-3]).
constraints(11, [5-4, 7-5], [8-3]).
constraints(13, [5-4, 7-5], [8-3]).
constraints(15, [5-4, 7-5], [8-3]).
constraints(15, [5-4, 7-6], [8-3]).
constraints(11, [5-4, 7-7], [8-3]).
constraints(13, [5-4, 7-7], [8-3]). 
constraints(15, [5-4, 7-7], [8-3]). 

constraints(11, [5-6, 7-2], [8-3]).
constraints(13, [5-6, 7-3], [8-3]).
constraints(11, [5-6, 7-5], [8-3]).
constraints(13, [5-6, 7-5], [8-3]).
constraints(15, [5-6, 7-5], [8-3]).
constraints(15, [5-6, 7-6], [8-3]).
constraints(11, [5-6, 7-7], [8-3]).
constraints(13, [5-6, 7-7], [8-3]). 
constraints(15, [5-6, 7-7], [8-3]). 

constraints(9, [2-3, 5-4], [8-6]).
constraints(11, [2-2, 5-4], [8-5]).
constraints(13, [2-2, 5-4], [8-5]).
constraints(15, [2-2, 5-4], [8-5]).
constraints(11, [2-2, 5-6], [8-5]).
constraints(13, [2-2, 5-6], [8-5]).
constraints(15, [2-2, 5-6], [8-5]).
constraints(11, [2-2, 7-5], [8-5]).
constraints(13, [2-2, 7-5], [8-5]).
constraints(15, [2-2, 7-5], [8-5]).
constraints(9, [2-3, 7-6], [8-4]).
constraints(11, [2-2, 7-7], [8-5]).
constraints(13, [2-2, 7-7], [8-5]).
constraints(15, [2-2, 7-7], [8-5]).

constraints(11, [2-4, 5-4], [8-5]).
constraints(13, [2-4, 5-4], [8-5]).
constraints(15, [2-4, 5-4], [8-5]).
constraints(11, [2-4, 5-6], [8-5]).
constraints(13, [2-4, 5-6], [8-5]).
constraints(15, [2-4, 5-6], [8-5]).
constraints(11, [2-4, 7-5], [8-5]).
constraints(13, [2-4, 7-5], [8-5]).
constraints(15, [2-4, 7-5], [8-5]).
constraints(11, [2-4, 7-7], [8-5]).
constraints(12, [2-4, 7-7], [8-5]).
constraints(13, [2-4, 7-7], [8-5]). 

constraints(11, [2-6, 5-4], [8-5]).
constraints(13, [2-6, 5-4], [8-5]).
constraints(15, [2-6, 5-4], [8-5]).
constraints(11, [2-6, 5-6], [8-5]).
constraints(13, [2-6, 5-6], [8-5]).
constraints(15, [2-6, 5-6], [8-5]).
constraints(11, [2-6, 7-5], [8-5]).
constraints(13, [2-6, 7-5], [8-5]).
constraints(15, [2-6, 7-5], [8-5]).
constraints(11, [2-6, 7-7], [8-5]).
constraints(12, [2-6, 7-7], [8-5]).
constraints(13, [2-6, 7-7], [8-5]). 

constraints(11, [5-4, 7-2], [8-5]).
constraints(13, [5-4, 7-3], [8-5]).
constraints(11, [5-4, 7-5], [8-5]).
constraints(13, [5-4, 7-5], [8-5]).
constraints(15, [5-4, 7-5], [8-5]).
constraints(15, [5-4, 7-6], [8-5]).
constraints(11, [5-4, 7-7], [8-5]).
constraints(13, [5-4, 7-7], [8-5]). 
constraints(15, [5-4, 7-7], [8-5]). 

constraints(11, [5-6, 7-2], [8-5]).
constraints(13, [5-6, 7-3], [8-5]).
constraints(11, [5-6, 7-5], [8-5]).
constraints(13, [5-6, 7-5], [8-5]).
constraints(15, [5-6, 7-5], [8-5]).
constraints(15, [5-6, 7-6], [8-5]).
constraints(11, [5-6, 7-7], [8-5]).
constraints(13, [5-6, 7-7], [8-5]). 
constraints(15, [5-6, 7-7], [8-5]). 

constraints(11, [2-2, 5-4], [8-7]).
constraints(13, [2-2, 5-4], [8-7]).
constraints(15, [2-2, 5-4], [8-7]).
constraints(11, [2-2, 5-6], [8-7]).
constraints(13, [2-2, 5-6], [8-7]).
constraints(15, [2-2, 5-6], [8-7]).
constraints(11, [2-2, 7-5], [8-7]).
constraints(13, [2-2, 7-5], [8-7]).
constraints(15, [2-2, 7-5], [8-7]).
constraints(11, [2-2, 7-7], [8-7]).
constraints(13, [2-2, 7-7], [8-7]).
constraints(15, [2-2, 7-7], [8-7]).

constraints(11, [2-4, 5-4], [8-7]).
constraints(13, [2-4, 5-4], [8-7]).
constraints(15, [2-4, 5-4], [8-7]).
constraints(11, [2-4, 5-6], [8-7]).
constraints(13, [2-4, 5-6], [8-7]).
constraints(15, [2-4, 5-6], [8-7]).
constraints(11, [2-4, 7-5], [8-7]).
constraints(13, [2-4, 7-5], [8-7]).
constraints(15, [2-4, 7-5], [8-7]).
constraints(11, [2-4, 7-7], [8-7]).
constraints(12, [2-4, 7-7], [8-7]).
constraints(13, [2-4, 7-7], [8-7]). 

constraints(11, [2-6, 5-4], [8-7]).
constraints(13, [2-6, 5-4], [8-7]).
constraints(15, [2-6, 5-4], [8-7]).
constraints(11, [2-6, 5-6], [8-7]).
constraints(13, [2-6, 5-6], [8-7]).
constraints(15, [2-6, 5-6], [8-7]).
constraints(11, [2-6, 7-5], [8-7]).
constraints(13, [2-6, 7-5], [8-7]).
constraints(15, [2-6, 7-5], [8-7]).
constraints(11, [2-6, 7-7], [8-7]).
constraints(12, [2-6, 7-7], [8-7]).
constraints(13, [2-6, 7-7], [8-7]). 

constraints(11, [5-4, 7-2], [8-7]).
constraints(13, [5-4, 7-3], [8-7]).
constraints(11, [5-4, 7-5], [8-7]).
constraints(13, [5-4, 7-5], [8-7]).
constraints(15, [5-4, 7-5], [8-7]).
constraints(15, [5-4, 7-6], [8-7]).
constraints(11, [5-4, 7-7], [8-7]).
constraints(13, [5-4, 7-7], [8-7]). 
constraints(15, [5-4, 7-7], [8-7]). 

constraints(11, [5-6, 7-2], [8-7]).
constraints(13, [5-6, 7-3], [8-7]).
constraints(11, [5-6, 7-5], [8-7]).
constraints(13, [5-6, 7-5], [8-7]).
constraints(15, [5-6, 7-5], [8-7]).
constraints(15, [5-6, 7-6], [8-7]).
constraints(11, [5-6, 7-7], [8-7]).
constraints(13, [5-6, 7-7], [8-7]). 
constraints(15, [5-6, 7-7], [8-7]). 

% ######## 1 Column - 2 Row ##############
constraints(_, [2-4], [1-2, 6-3]). 
constraints(_, [2-4], [1-2, 6-5]).
constraints(11, [2-4], [1-2, 6-6]).
constraints(13, [2-4], [1-2, 6-6]).
constraints(15, [2-4], [1-2, 6-6]).
constraints(11, [2-4], [1-2, 8-3]).
constraints(13, [2-4], [1-2, 8-3]).
constraints(15, [2-4], [1-2, 8-3]).
constraints(11, [2-4], [1-2, 8-5]).
constraints(13, [2-4], [1-2, 8-5]).
constraints(15, [2-4], [1-2, 8-5]).
constraints(_, [2-4], [1-2, 8-7]). 

constraints(11, [2-4], [1-4, 6-3]). 
constraints(13, [2-4], [1-4, 6-3]). 
constraints(15, [2-4], [1-4, 6-3]). 
constraints(_, [2-4], [1-4, 6-5]).
constraints(11, [2-4], [1-4, 6-6]).
constraints(13, [2-4], [1-4, 6-6]).
constraints(15, [2-4], [1-4, 6-6]).
constraints(11, [2-4], [1-4, 8-3]).
constraints(13, [2-4], [1-4, 8-3]).
constraints(15, [2-4], [1-4, 8-3]).
constraints(11, [2-4], [1-4, 8-5]).
constraints(13, [2-4], [1-4, 8-5]).
constraints(15, [2-4], [1-4, 8-5]).
constraints(9, [2-4], [1-4, 8-6]).
constraints(11, [2-4], [1-4, 8-7]).
constraints(13, [2-4], [1-4, 8-7]).
constraints(15, [2-4], [1-4, 8-7]). 

constraints(11, [2-4], [1-7, 7-3]). 
constraints(13, [2-4], [1-7, 7-3]). 
constraints(15, [2-4], [1-7, 7-3]). 
constraints(11, [2-4], [1-7, 7-5]).
constraints(13, [2-4], [1-7, 7-5]).
constraints(15, [2-4], [1-7, 7-5]).
constraints(11, [2-4], [1-7, 7-6]).
constraints(13, [2-4], [1-7, 7-6]).
constraints(15, [2-4], [1-7, 7-6]).
constraints(11, [2-4], [1-7, 9-3]).
constraints(13, [2-4], [1-7, 9-3]).
constraints(15, [2-4], [1-7, 9-3]).
constraints(11, [2-4], [1-7, 9-5]).
constraints(13, [2-4], [1-7, 9-5]).
constraints(15, [2-4], [1-7, 9-5]).
constraints(11, [2-4], [1-7, 9-7]).
constraints(13, [2-4], [1-7, 9-7]).
constraints(15, [2-4], [1-7, 9-7]). 

constraints(9, [2-5], [6-3, 8-3]).
constraints(11, [2-4], [6-3, 8-3]).
constraints(13, [2-4], [6-3, 8-3]).
constraints(15, [2-4], [6-3, 8-3]).
constraints(11, [2-4], [6-3, 8-5]).
constraints(13, [2-4], [6-3, 8-5]).
constraints(15, [2-4], [6-3, 8-5]).
constraints(11, [2-4], [6-3, 8-7]).  
constraints(13, [2-4], [6-3, 8-7]).  
constraints(15, [2-4], [6-3, 8-7]).  

constraints(11, [2-4], [6-5, 8-3]).
constraints(13, [2-4], [6-5, 8-3]).
constraints(15, [2-4], [6-5, 8-3]).
constraints(11, [2-4], [6-5, 8-5]).
constraints(13, [2-4], [6-5, 8-5]).
constraints(15, [2-4], [6-5, 8-5]).
constraints(_, [2-4], [6-5, 8-7]). 

constraints(11, [2-4], [6-6, 8-3]).
constraints(13, [2-4], [6-6, 8-3]).
constraints(15, [2-4], [6-6, 8-3]).
constraints(_, [2-4], [6-6, 8-5]).
constraints(9, [2-3], [6-6, 8-7]). 
constraints(11, [2-4], [6-6, 8-7]). 
constraints(13, [2-4], [6-6, 8-7]). 
constraints(15, [2-4], [6-6, 8-7]). 

constraints(9, [2-5], [1-2, 6-3]). 
constraints(11, [2-6], [1-2, 6-3]).
constraints(13, [2-6], [1-2, 6-3]).
constraints(15, [2-6], [1-2, 6-3]).
constraints(11, [2-6], [1-2, 6-5]).
constraints(13, [2-6], [1-2, 6-5]).
constraints(15, [2-6], [1-2, 6-5]).
constraints(_, [2-6], [1-2, 6-6]).
constraints(_, [2-6], [1-2, 8-3]).
constraints(_, [2-6], [1-2, 8-5]).
constraints(11, [2-6], [1-2, 8-7]). 
constraints(13, [2-6], [1-2, 8-7]). 
constraints(15, [2-6], [1-2, 8-7]). 

constraints(_, [2-6], [1-4, 6-3]). 
constraints(11, [2-6], [1-4, 6-5]).
constraints(13, [2-6], [1-4, 6-5]).
constraints(15, [2-6], [1-4, 6-5]).
constraints(_, [2-6], [1-4, 6-6]).
constraints(_, [2-6], [1-4, 8-3]).
constraints(_, [2-6], [1-4, 8-5]).
constraints(11, [2-6], [1-4, 8-7]).
constraints(13, [2-6], [1-4, 8-7]).
constraints(15, [2-6], [1-4, 8-7]). 

constraints(11, [2-6], [1-7, 7-3]). 
constraints(13, [2-6], [1-7, 7-3]). 
constraints(15, [2-6], [1-7, 7-3]). 
constraints(11, [2-6], [1-7, 7-5]).
constraints(13, [2-6], [1-7, 7-5]).
constraints(15, [2-6], [1-7, 7-5]).
constraints(11, [2-6], [1-7, 7-6]).
constraints(13, [2-6], [1-7, 7-6]).
constraints(15, [2-6], [1-7, 7-6]).
constraints(11, [2-6], [1-7, 9-3]).
constraints(13, [2-6], [1-7, 9-3]).
constraints(15, [2-6], [1-7, 9-3]).
constraints(11, [2-6], [1-7, 9-5]).
constraints(13, [2-6], [1-7, 9-5]).
constraints(15, [2-6], [1-7, 9-5]).
constraints(11, [2-6], [1-7, 9-7]).
constraints(13, [2-6], [1-7, 9-7]).
constraints(15, [2-6], [1-7, 9-7]). 

constraints(_, [2-6], [6-3, 8-3]).
constraints(11, [2-6], [6-3, 8-5]).
constraints(13, [2-6], [6-3, 8-5]).
constraints(15, [2-6], [6-3, 8-5]).
constraints(11, [2-6], [6-3, 8-7]).  
constraints(13, [2-6], [6-3, 8-7]).  
constraints(15, [2-6], [6-3, 8-7]).  

constraints(11, [2-6], [6-5, 8-3]).
constraints(13, [2-6], [6-5, 8-3]).
constraints(15, [2-6], [6-5, 8-3]).
constraints(11, [2-6], [6-5, 8-5]).
constraints(13, [2-6], [6-5, 8-5]).
constraints(15, [2-6], [6-5, 8-5]).
constraints(11, [2-6], [6-5, 8-7]). 
constraints(13, [2-6], [6-5, 8-7]). 
constraints(15, [2-6], [6-5, 8-7]). 

constraints(11, [2-6], [6-6, 8-3]).
constraints(13, [2-6], [6-6, 8-3]).
constraints(15, [2-6], [6-6, 8-3]).
constraints(_, [2-6], [6-6, 8-5]).
constraints(11, [2-6], [6-6, 8-7]). 
constraints(13, [2-6], [6-6, 8-7]). 
constraints(15, [2-6], [6-6, 8-7]). 

constraints(11, [5-4], [1-2, 6-3]). 
constraints(13, [5-4], [1-2, 6-3]). 
constraints(15, [5-4], [1-2, 6-3]). 
constraints(11, [5-4], [1-2, 6-5]).
constraints(13, [5-4], [1-2, 6-5]).
constraints(15, [5-4], [1-2, 6-5]).
constraints(11, [5-4], [1-2, 6-6]).
constraints(13, [5-4], [1-2, 6-6]).
constraints(15, [5-4], [1-2, 6-6]).
constraints(9, [5-2], [1-2, 8-3]).
constraints(11, [5-4], [1-2, 8-3]).
constraints(13, [5-4], [1-2, 8-3]).
constraints(15, [5-4], [1-2, 8-3]).
constraints(9, [5-3], [1-2, 8-5]).
constraints(11, [5-4], [1-2, 8-5]).
constraints(13, [5-4], [1-2, 8-5]).
constraints(15, [5-4], [1-2, 8-5]).
constraints(11, [5-4], [1-2, 8-7]). 
constraints(13, [5-4], [1-2, 8-7]). 
constraints(15, [5-4], [1-2, 8-7]). 

constraints(11, [5-4], [1-4, 6-3]). 
constraints(13, [5-4], [1-4, 6-3]). 
constraints(15, [5-4], [1-4, 6-3]). 
constraints(11, [5-4], [1-4, 6-5]).
constraints(13, [5-4], [1-4, 6-5]).
constraints(15, [5-4], [1-4, 6-5]).
constraints(11, [5-4], [1-4, 6-6]).
constraints(13, [5-4], [1-4, 6-6]).
constraints(15, [5-4], [1-4, 6-6]).
constraints(11, [5-4], [1-4, 8-3]).
constraints(13, [5-4], [1-4, 8-3]).
constraints(15, [5-4], [1-4, 8-3]).
constraints(9, [5-2], [1-4, 8-5]).
constraints(11, [5-4], [1-4, 8-5]).
constraints(13, [5-4], [1-4, 8-5]).
constraints(15, [5-4], [1-4, 8-5]).
constraints(11, [5-4], [1-4, 8-7]).
constraints(13, [5-4], [1-4, 8-7]).
constraints(15, [5-4], [1-4, 8-7]). 

constraints(11, [5-4], [1-7, 7-3]). 
constraints(13, [5-4], [1-7, 7-3]). 
constraints(15, [5-4], [1-7, 7-3]). 
constraints(11, [5-4], [1-7, 7-5]).
constraints(13, [5-4], [1-7, 7-5]).
constraints(15, [5-4], [1-7, 7-5]).
constraints(11, [5-4], [1-7, 7-6]).
constraints(13, [5-4], [1-7, 7-6]).
constraints(15, [5-4], [1-7, 7-6]).
constraints(11, [5-4], [1-7, 9-3]).
constraints(13, [5-4], [1-7, 9-3]).
constraints(15, [5-4], [1-7, 9-3]).
constraints(11, [5-4], [1-7, 9-5]).
constraints(13, [5-4], [1-7, 9-5]).
constraints(15, [5-4], [1-7, 9-5]).
constraints(11, [5-4], [1-7, 9-7]).
constraints(13, [5-4], [1-7, 9-7]).
constraints(15, [5-4], [1-7, 9-7]). 

constraints(11, [5-4], [6-3, 8-3]).
constraints(13, [5-4], [6-3, 8-3]).
constraints(15, [5-4], [6-3, 8-3]).
constraints(9, [5-2], [6-3, 8-5]).
constraints(11, [5-4], [6-3, 8-5]).
constraints(13, [5-4], [6-3, 8-5]).
constraints(15, [5-4], [6-3, 8-5]).
constraints(9, [5-2], [6-3, 8-7]).  
constraints(11, [5-4], [6-3, 8-7]).  
constraints(13, [5-4], [6-3, 8-7]).  
constraints(15, [5-4], [6-3, 8-7]).  

constraints(11, [5-4], [6-5, 8-3]).
constraints(13, [5-4], [6-5, 8-3]).
constraints(15, [5-4], [6-5, 8-3]).
constraints(11, [5-4], [6-5, 8-5]).
constraints(13, [5-4], [6-5, 8-5]).
constraints(15, [5-4], [6-5, 8-5]).
constraints(11, [5-4], [6-5, 8-7]). 
constraints(13, [5-4], [6-5, 8-7]). 
constraints(15, [5-4], [6-5, 8-7]). 

constraints(11, [5-4], [6-6, 8-3]).
constraints(13, [5-4], [6-6, 8-3]).
constraints(15, [5-4], [6-6, 8-3]).
constraints(9, [5-2], [6-6, 8-5]).
constraints(11, [5-4], [6-6, 8-5]).
constraints(13, [5-4], [6-6, 8-5]).
constraints(15, [5-4], [6-6, 8-5]).
constraints(9, [5-3], [6-6, 8-7]). 
constraints(11, [5-4], [6-6, 8-7]). 
constraints(13, [5-4], [6-6, 8-7]). 
constraints(15, [5-4], [6-6, 8-7]). 

constraints(11, [5-6], [1-2, 6-3]). 
constraints(13, [5-6], [1-2, 6-3]). 
constraints(15, [5-6], [1-2, 6-3]). 
constraints(11, [5-6], [1-2, 6-5]).
constraints(13, [5-6], [1-2, 6-5]).
constraints(15, [5-6], [1-2, 6-5]).
constraints(11, [5-6], [1-2, 6-6]).
constraints(13, [5-6], [1-2, 6-6]).
constraints(15, [5-6], [1-2, 6-6]).
constraints(9, [5-6], [1-2, 8-3]).
constraints(11, [5-6], [1-2, 8-3]).
constraints(13, [5-6], [1-2, 8-3]).
constraints(15, [5-6], [1-2, 8-3]).
constraints(11, [5-6], [1-2, 8-5]).
constraints(13, [5-6], [1-2, 8-5]).
constraints(15, [5-6], [1-2, 8-5]).
constraints(11, [5-6], [1-2, 8-7]). 
constraints(13, [5-6], [1-2, 8-7]). 
constraints(15, [5-6], [1-2, 8-7]). 

constraints(11, [5-6], [1-4, 6-3]). 
constraints(13, [5-6], [1-4, 6-3]). 
constraints(15, [5-6], [1-4, 6-3]). 
constraints(11, [5-6], [1-4, 6-5]).
constraints(13, [5-6], [1-4, 6-5]).
constraints(15, [5-6], [1-4, 6-5]).
constraints(11, [5-6], [1-4, 6-6]).
constraints(13, [5-6], [1-4, 6-6]).
constraints(15, [5-6], [1-4, 6-6]).
constraints(11, [5-6], [1-4, 8-3]).
constraints(13, [5-6], [1-4, 8-3]).
constraints(15, [5-6], [1-4, 8-3]).
constraints(11, [5-6], [1-4, 8-5]).
constraints(13, [5-6], [1-4, 8-5]).
constraints(15, [5-6], [1-4, 8-5]).
constraints(11, [5-6], [1-4, 8-7]).
constraints(13, [5-6], [1-4, 8-7]).
constraints(15, [5-6], [1-4, 8-7]). 

constraints(11, [5-6], [1-7, 7-3]). 
constraints(13, [5-6], [1-7, 7-3]). 
constraints(15, [5-6], [1-7, 7-3]). 
constraints(11, [5-6], [1-7, 7-5]).
constraints(13, [5-6], [1-7, 7-5]).
constraints(15, [5-6], [1-7, 7-5]).
constraints(11, [5-6], [1-7, 7-6]).
constraints(13, [5-6], [1-7, 7-6]).
constraints(15, [5-6], [1-7, 7-6]).
constraints(11, [5-6], [1-7, 9-3]).
constraints(13, [5-6], [1-7, 9-3]).
constraints(15, [5-6], [1-7, 9-3]).
constraints(11, [5-6], [1-7, 9-5]).
constraints(13, [5-6], [1-7, 9-5]).
constraints(15, [5-6], [1-7, 9-5]).
constraints(11, [5-6], [1-7, 9-7]).
constraints(13, [5-6], [1-7, 9-7]).
constraints(15, [5-6], [1-7, 9-7]). 

constraints(11, [5-6], [6-3, 8-3]).
constraints(13, [5-6], [6-3, 8-3]).
constraints(15, [5-6], [6-3, 8-3]).
constraints(11, [5-6], [6-3, 8-5]).
constraints(13, [5-6], [6-3, 8-5]).
constraints(15, [5-6], [6-3, 8-5]).
constraints(11, [5-6], [6-3, 8-7]).  
constraints(13, [5-6], [6-3, 8-7]).  
constraints(15, [5-6], [6-3, 8-7]).  

constraints(11, [5-6], [6-5, 8-3]).
constraints(13, [5-6], [6-5, 8-3]).
constraints(15, [5-6], [6-5, 8-3]).
constraints(11, [5-6], [6-5, 8-5]).
constraints(13, [5-6], [6-5, 8-5]).
constraints(15, [5-6], [6-5, 8-5]).
constraints(11, [5-6], [6-5, 8-7]). 
constraints(13, [5-6], [6-5, 8-7]). 
constraints(15, [5-6], [6-5, 8-7]). 

constraints(11, [5-6], [6-6, 8-3]).
constraints(13, [5-6], [6-6, 8-3]).
constraints(15, [5-6], [6-6, 8-3]).
constraints(11, [5-6], [6-6, 8-5]).
constraints(13, [5-6], [6-6, 8-5]).
constraints(15, [5-6], [6-6, 8-5]).
constraints(11, [5-6], [6-6, 8-7]). 
constraints(13, [5-6], [6-6, 8-7]). 
constraints(15, [5-6], [6-6, 8-7]). 

constraints(_, [7-5], [1-2, 6-3]). 
constraints(_, [7-5], [1-2, 6-5]).
constraints(9, [7-3], [1-2, 6-6]).
constraints(11, [7-5], [1-2, 6-6]).
constraints(13, [7-5], [1-2, 6-6]).
constraints(15, [7-5], [1-2, 6-6]).
constraints(9, [7-3], [1-2, 8-3]).
constraints(11, [7-5], [1-2, 8-3]).
constraints(13, [7-5], [1-2, 8-3]).
constraints(15, [7-5], [1-2, 8-3]).
constraints(11, [7-5], [1-2, 8-5]).
constraints(13, [7-5], [1-2, 8-5]).
constraints(15, [7-5], [1-2, 8-5]).
constraints(_, [7-5], [1-2, 8-7]). 

constraints(11, [7-5], [1-4, 6-3]). 
constraints(13, [7-5], [1-4, 6-3]). 
constraints(15, [7-5], [1-4, 6-3]). 
constraints(_, [7-5], [1-4, 6-5]).
constraints(9, [7-2], [1-4, 6-6]).
constraints(11, [7-5], [1-4, 6-6]).
constraints(13, [7-5], [1-4, 6-6]).
constraints(15, [7-5], [1-4, 6-6]).
constraints(9, [7-2], [1-4, 8-3]).
constraints(11, [7-5], [1-4, 8-3]).
constraints(13, [7-5], [1-4, 8-3]).
constraints(15, [7-5], [1-4, 8-3]).
constraints(9, [7-2], [1-4, 8-5]).
constraints(11, [7-5], [1-4, 8-5]).
constraints(13, [7-5], [1-4, 8-5]).
constraints(15, [7-5], [1-4, 8-5]).
constraints(9, [7-5], [1-4, 8-6]).
constraints(11, [7-5], [1-4, 8-7]).
constraints(13, [7-5], [1-4, 8-7]).
constraints(15, [7-5], [1-4, 8-7]). 

constraints(11, [7-5], [1-7, 7-3]). 
constraints(13, [7-5], [1-7, 7-3]). 
constraints(15, [7-5], [1-7, 7-3]). 
constraints(11, [7-5], [1-7, 7-5]).
constraints(13, [7-5], [1-7, 7-5]).
constraints(15, [7-5], [1-7, 7-5]).
constraints(11, [7-5], [1-7, 7-6]).
constraints(13, [7-5], [1-7, 7-6]).
constraints(15, [7-5], [1-7, 7-6]).
constraints(11, [7-5], [1-7, 9-3]).
constraints(13, [7-5], [1-7, 9-3]).
constraints(15, [7-5], [1-7, 9-3]).
constraints(11, [7-5], [1-7, 9-5]).
constraints(13, [7-5], [1-7, 9-5]).
constraints(15, [7-5], [1-7, 9-5]).
constraints(11, [7-5], [1-7, 9-7]).
constraints(13, [7-5], [1-7, 9-7]).
constraints(15, [7-5], [1-7, 9-7]). 

constraints(9, [7-3], [6-3, 8-3]).
constraints(11, [7-5], [6-3, 8-3]).
constraints(13, [7-5], [6-3, 8-3]).
constraints(15, [7-5], [6-3, 8-3]).
constraints(9, [7-2], [6-3, 8-5]).
constraints(11, [7-5], [6-3, 8-5]).
constraints(13, [7-5], [6-3, 8-5]).
constraints(15, [7-5], [6-3, 8-5]).
constraints(11, [7-5], [6-3, 8-7]).  
constraints(13, [7-5], [6-3, 8-7]). 
constraints(15, [7-5], [6-3, 8-7]). 

constraints(11, [7-5], [6-5, 8-3]).
constraints(13, [7-5], [6-5, 8-3]).
constraints(15, [7-5], [6-5, 8-3]).
constraints(11, [7-5], [6-5, 8-5]).
constraints(13, [7-5], [6-5, 8-5]).
constraints(15, [7-5], [6-5, 8-5]).
constraints(_, [7-5], [6-5, 8-7]). 

constraints(11, [7-5], [6-6, 8-3]).
constraints(13, [7-5], [6-6, 8-3]).
constraints(15, [7-5], [6-6, 8-3]).
constraints(9, [7-3], [6-6, 8-5]).
constraints(11, [7-5], [6-6, 8-5]).
constraints(13, [7-5], [6-6, 8-5]).
constraints(15, [7-5], [6-6, 8-5]).
constraints(9, [7-4], [6-6, 8-7]). 
constraints(11, [7-5], [6-6, 8-7]).
constraints(13, [7-5], [6-6, 8-7]).
constraints(15, [7-5], [6-6, 8-7]). 

% ######## 2 Column - 2 Row ############## 
constraints(11, [2-2, 5-4], [1-2, 6-3]).
constraints(13, [2-2, 5-4], [1-2, 6-3]).
constraints(15, [2-2, 5-4], [1-2, 6-3]).
constraints(11, [2-2, 5-6], [1-2, 6-3]).
constraints(13, [2-2, 5-6], [1-2, 6-3]).
constraints(15, [2-2, 5-6], [1-2, 6-3]).
constraints(11, [2-2, 7-5], [1-2, 6-3]).
constraints(13, [2-2, 7-5], [1-2, 6-3]).
constraints(15, [2-2, 7-5], [1-2, 6-3]).
constraints(11, [2-2, 7-7], [1-2, 6-3]).
constraints(13, [2-2, 7-7], [1-2, 6-3]).
constraints(15, [2-2, 7-7], [1-2, 6-3]).

constraints(11, [2-4, 5-4], [1-2, 6-3]).
constraints(13, [2-4, 5-4], [1-2, 6-3]).
constraints(15, [2-4, 5-4], [1-2, 6-3]).
constraints(11, [2-4, 5-6], [1-2, 6-3]).
constraints(13, [2-4, 5-6], [1-2, 6-3]).
constraints(15, [2-4, 5-6], [1-2, 6-3]).
constraints(11, [2-4, 7-5], [1-2, 6-3]).
constraints(13, [2-4, 7-5], [1-2, 6-3]).
constraints(15, [2-4, 7-5], [1-2, 6-3]).
constraints(11, [2-4, 7-7], [1-2, 6-3]).
constraints(12, [2-4, 7-7], [1-2, 6-3]).
constraints(13, [2-4, 7-7], [1-2, 6-3]). 

constraints(11, [2-6, 5-4], [1-2, 6-3]).
constraints(13, [2-6, 5-4], [1-2, 6-3]).
constraints(15, [2-6, 5-4], [1-2, 6-3]).
constraints(11, [2-6, 5-6], [1-2, 6-3]).
constraints(13, [2-6, 5-6], [1-2, 6-3]).
constraints(15, [2-6, 5-6], [1-2, 6-3]).
constraints(11, [2-6, 7-5], [1-2, 6-3]).
constraints(13, [2-6, 7-5], [1-2, 6-3]).
constraints(15, [2-6, 7-5], [1-2, 6-3]).
constraints(11, [2-6, 7-7], [1-2, 6-3]).
constraints(12, [2-6, 7-7], [1-2, 6-3]).
constraints(13, [2-6, 7-7], [1-2, 6-3]). 

constraints(11, [5-4, 7-2], [1-2, 6-3]).
constraints(13, [5-4, 7-3], [1-2, 6-3]).
constraints(11, [5-4, 7-5], [1-2, 6-3]).
constraints(13, [5-4, 7-5], [1-2, 6-3]).
constraints(15, [5-4, 7-5], [1-2, 6-3]).
constraints(15, [5-4, 7-6], [1-2, 6-3]).
constraints(11, [5-4, 7-7], [1-2, 6-3]).
constraints(13, [5-4, 7-7], [1-2, 6-3]). 
constraints(15, [5-4, 7-7], [1-2, 6-3]). 

constraints(11, [5-6, 7-2], [1-2, 6-3]).
constraints(13, [5-6, 7-3], [1-2, 6-3]).
constraints(11, [5-6, 7-5], [1-2, 6-3]).
constraints(13, [5-6, 7-5], [1-2, 6-3]).
constraints(15, [5-6, 7-5], [1-2, 6-3]).
constraints(15, [5-6, 7-6], [1-2, 6-3]).
constraints(11, [5-6, 7-7], [1-2, 6-3]).
constraints(13, [5-6, 7-7], [1-2, 6-3]). 
constraints(15, [5-6, 7-7], [1-2, 6-3]). 

constraints(11, [2-2, 5-4], [1-2, 6-5]).
constraints(13, [2-2, 5-4], [1-2, 6-5]).
constraints(15, [2-2, 5-4], [1-2, 6-5]).
constraints(11, [2-2, 5-6], [1-2, 6-5]).
constraints(13, [2-2, 5-6], [1-2, 6-5]).
constraints(15, [2-2, 5-6], [1-2, 6-5]).
constraints(11, [2-2, 7-5], [1-2, 6-5]).
constraints(13, [2-2, 7-5], [1-2, 6-5]).
constraints(15, [2-2, 7-5], [1-2, 6-5]).
constraints(11, [2-2, 7-7], [1-2, 6-5]).
constraints(13, [2-2, 7-7], [1-2, 6-5]).
constraints(15, [2-2, 7-7], [1-2, 6-5]).

constraints(11, [2-4, 5-4], [1-2, 6-5]).
constraints(13, [2-4, 5-4], [1-2, 6-5]).
constraints(15, [2-4, 5-4], [1-2, 6-5]).
constraints(11, [2-4, 5-6], [1-2, 6-5]).
constraints(13, [2-4, 5-6], [1-2, 6-5]).
constraints(15, [2-4, 5-6], [1-2, 6-5]).
constraints(11, [2-4, 7-5], [1-2, 6-5]).
constraints(13, [2-4, 7-5], [1-2, 6-5]).
constraints(15, [2-4, 7-5], [1-2, 6-5]).
constraints(11, [2-4, 7-7], [1-2, 6-5]).
constraints(12, [2-4, 7-7], [1-2, 6-5]).
constraints(13, [2-4, 7-7], [1-2, 6-5]). 

constraints(11, [2-6, 5-4], [1-2, 6-5]).
constraints(13, [2-6, 5-4], [1-2, 6-5]).
constraints(15, [2-6, 5-4], [1-2, 6-5]).
constraints(11, [2-6, 5-6], [1-2, 6-5]).
constraints(13, [2-6, 5-6], [1-2, 6-5]).
constraints(15, [2-6, 5-6], [1-2, 6-5]).
constraints(11, [2-6, 7-5], [1-2, 6-5]).
constraints(13, [2-6, 7-5], [1-2, 6-5]).
constraints(15, [2-6, 7-5], [1-2, 6-5]).
constraints(11, [2-6, 7-7], [1-2, 6-5]).
constraints(12, [2-6, 7-7], [1-2, 6-5]).
constraints(13, [2-6, 7-7], [1-2, 6-5]). 

constraints(11, [5-4, 7-2], [1-2, 6-5]).
constraints(13, [5-4, 7-3], [1-2, 6-5]).
constraints(11, [5-4, 7-5], [1-2, 6-5]).
constraints(13, [5-4, 7-5], [1-2, 6-5]).
constraints(15, [5-4, 7-5], [1-2, 6-5]).
constraints(15, [5-4, 7-6], [1-2, 6-5]).
constraints(11, [5-4, 7-7], [1-2, 6-5]).
constraints(13, [5-4, 7-7], [1-2, 6-5]). 
constraints(15, [5-4, 7-7], [1-2, 6-5]). 

constraints(11, [5-6, 7-2], [1-2, 6-5]).
constraints(13, [5-6, 7-3], [1-2, 6-5]).
constraints(11, [5-6, 7-5], [1-2, 6-5]).
constraints(13, [5-6, 7-5], [1-2, 6-5]).
constraints(15, [5-6, 7-5], [1-2, 6-5]).
constraints(15, [5-6, 7-6], [1-2, 6-5]).
constraints(11, [5-6, 7-7], [1-2, 6-5]).
constraints(13, [5-6, 7-7], [1-2, 6-5]). 
constraints(15, [5-6, 7-7], [1-2, 6-5]). 

constraints(11, [2-2, 5-4], [1-2, 6-6]).
constraints(13, [2-2, 5-4], [1-2, 6-6]).
constraints(15, [2-2, 5-4], [1-2, 6-6]).
constraints(11, [2-2, 5-6], [1-2, 6-6]).
constraints(13, [2-2, 5-6], [1-2, 6-6]).
constraints(15, [2-2, 5-6], [1-2, 6-6]).
constraints(11, [2-2, 7-5], [1-2, 6-6]).
constraints(13, [2-2, 7-5], [1-2, 6-6]).
constraints(15, [2-2, 7-5], [1-2, 6-6]).
constraints(11, [2-2, 7-7], [1-2, 6-6]).
constraints(13, [2-2, 7-7], [1-2, 6-6]).
constraints(15, [2-2, 7-7], [1-2, 6-6]).

constraints(11, [2-4, 5-4], [1-2, 6-6]).
constraints(13, [2-4, 5-4], [1-2, 6-6]).
constraints(15, [2-4, 5-4], [1-2, 6-6]).
constraints(11, [2-4, 5-6], [1-2, 6-6]).
constraints(13, [2-4, 5-6], [1-2, 6-6]).
constraints(15, [2-4, 5-6], [1-2, 6-6]).
constraints(11, [2-4, 7-5], [1-2, 6-6]).
constraints(13, [2-4, 7-5], [1-2, 6-6]).
constraints(15, [2-4, 7-5], [1-2, 6-6]).
constraints(11, [2-4, 7-7], [1-2, 6-6]).
constraints(12, [2-4, 7-7], [1-2, 6-6]).
constraints(13, [2-4, 7-7], [1-2, 6-6]). 

constraints(11, [2-6, 5-4], [1-2, 6-6]).
constraints(13, [2-6, 5-4], [1-2, 6-6]).
constraints(15, [2-6, 5-4], [1-2, 6-6]).
constraints(11, [2-6, 5-6], [1-2, 6-6]).
constraints(13, [2-6, 5-6], [1-2, 6-6]).
constraints(15, [2-6, 5-6], [1-2, 6-6]).
constraints(11, [2-6, 7-5], [1-2, 6-6]).
constraints(13, [2-6, 7-5], [1-2, 6-6]).
constraints(15, [2-6, 7-5], [1-2, 6-6]).
constraints(11, [2-6, 7-7], [1-2, 6-6]).
constraints(12, [2-6, 7-7], [1-2, 6-6]).
constraints(13, [2-6, 7-7], [1-2, 6-6]). 

constraints(11, [5-4, 7-2], [1-2, 6-6]).
constraints(13, [5-4, 7-3], [1-2, 6-6]).
constraints(11, [5-4, 7-5], [1-2, 6-6]).
constraints(13, [5-4, 7-5], [1-2, 6-6]).
constraints(15, [5-4, 7-5], [1-2, 6-6]).
constraints(15, [5-4, 7-6], [1-2, 6-6]).
constraints(11, [5-4, 7-7], [1-2, 6-6]).
constraints(13, [5-4, 7-7], [1-2, 6-6]). 
constraints(15, [5-4, 7-7], [1-2, 6-6]). 

constraints(11, [5-6, 7-2], [1-2, 6-6]).
constraints(13, [5-6, 7-3], [1-2, 6-6]).
constraints(11, [5-6, 7-5], [1-2, 6-6]).
constraints(13, [5-6, 7-5], [1-2, 6-6]).
constraints(15, [5-6, 7-5], [1-2, 6-6]).
constraints(15, [5-6, 7-6], [1-2, 6-6]).
constraints(11, [5-6, 7-7], [1-2, 6-6]).
constraints(13, [5-6, 7-7], [1-2, 6-6]). 
constraints(15, [5-6, 7-7], [1-2, 6-6]). 

constraints(11, [2-2, 5-4], [1-2, 8-3]).
constraints(13, [2-2, 5-4], [1-2, 8-3]).
constraints(15, [2-2, 5-4], [1-2, 8-3]).
constraints(9, [2-3, 5-6], [1-2, 8-3]).
constraints(11, [2-2, 5-6], [1-2, 8-3]).
constraints(13, [2-2, 5-6], [1-2, 8-3]).
constraints(15, [2-2, 5-6], [1-2, 8-3]).
constraints(11, [2-2, 7-5], [1-2, 8-3]).
constraints(13, [2-2, 7-5], [1-2, 8-3]).
constraints(15, [2-2, 7-5], [1-2, 8-3]).
constraints(9, [2-3, 7-6], [1-2, 8-3]).
constraints(11, [2-2, 7-7], [1-2, 8-3]).
constraints(13, [2-2, 7-7], [1-2, 8-3]).
constraints(15, [2-2, 7-7], [1-2, 8-3]).

constraints(11, [2-4, 5-4], [1-2, 8-3]).
constraints(13, [2-4, 5-4], [1-2, 8-3]).
constraints(15, [2-4, 5-4], [1-2, 8-3]).
constraints(11, [2-4, 5-6], [1-2, 8-3]).
constraints(13, [2-4, 5-6], [1-2, 8-3]).
constraints(15, [2-4, 5-6], [1-2, 8-3]).
constraints(11, [2-4, 7-5], [1-2, 8-3]).
constraints(13, [2-4, 7-5], [1-2, 8-3]).
constraints(15, [2-4, 7-5], [1-2, 8-3]).
constraints(11, [2-4, 7-7], [1-2, 8-3]).
constraints(12, [2-4, 7-7], [1-2, 8-3]).
constraints(13, [2-4, 7-7], [1-2, 8-3]). 

constraints(11, [2-6, 5-4], [1-2, 8-3]).
constraints(13, [2-6, 5-4], [1-2, 8-3]).
constraints(15, [2-6, 5-4], [1-2, 8-3]).
constraints(11, [2-6, 5-6], [1-2, 8-3]).
constraints(13, [2-6, 5-6], [1-2, 8-3]).
constraints(15, [2-6, 5-6], [1-2, 8-3]).
constraints(11, [2-6, 7-5], [1-2, 8-3]).
constraints(13, [2-6, 7-5], [1-2, 8-3]).
constraints(15, [2-6, 7-5], [1-2, 8-3]).
constraints(11, [2-6, 7-7], [1-2, 8-3]).
constraints(12, [2-6, 7-7], [1-2, 8-3]).
constraints(13, [2-6, 7-7], [1-2, 8-3]). 

constraints(11, [5-4, 7-2], [1-2, 8-3]).
constraints(13, [5-4, 7-3], [1-2, 8-3]).
constraints(11, [5-4, 7-5], [1-2, 8-3]).
constraints(13, [5-4, 7-5], [1-2, 8-3]).
constraints(15, [5-4, 7-5], [1-2, 8-3]).
constraints(15, [5-4, 7-6], [1-2, 8-3]).
constraints(11, [5-4, 7-7], [1-2, 8-3]).
constraints(13, [5-4, 7-7], [1-2, 8-3]). 
constraints(15, [5-4, 7-7], [1-2, 8-3]). 

constraints(11, [5-6, 7-2], [1-2, 8-3]).
constraints(13, [5-6, 7-3], [1-2, 8-3]).
constraints(11, [5-6, 7-5], [1-2, 8-3]).
constraints(13, [5-6, 7-5], [1-2, 8-3]).
constraints(15, [5-6, 7-5], [1-2, 8-3]).
constraints(15, [5-6, 7-6], [1-2, 8-3]).
constraints(11, [5-6, 7-7], [1-2, 8-3]).
constraints(13, [5-6, 7-7], [1-2, 8-3]). 
constraints(15, [5-6, 7-7], [1-2, 8-3]). 

constraints(11, [2-2, 5-4], [1-2, 8-5]).
constraints(13, [2-2, 5-4], [1-2, 8-5]).
constraints(15, [2-2, 5-4], [1-2, 8-5]).
constraints(11, [2-2, 5-6], [1-2, 8-5]).
constraints(13, [2-2, 5-6], [1-2, 8-5]).
constraints(15, [2-2, 5-6], [1-2, 8-5]).
constraints(11, [2-2, 7-5], [1-2, 8-5]).
constraints(13, [2-2, 7-5], [1-2, 8-5]).
constraints(15, [2-2, 7-5], [1-2, 8-5]).
constraints(11, [2-2, 7-7], [1-2, 8-5]).
constraints(13, [2-2, 7-7], [1-2, 8-5]).
constraints(15, [2-2, 7-7], [1-2, 8-5]).

constraints(11, [2-4, 5-4], [1-2, 8-5]).
constraints(13, [2-4, 5-4], [1-2, 8-5]).
constraints(15, [2-4, 5-4], [1-2, 8-5]).
constraints(11, [2-4, 5-6], [1-2, 8-5]).
constraints(13, [2-4, 5-6], [1-2, 8-5]).
constraints(15, [2-4, 5-6], [1-2, 8-5]).
constraints(11, [2-4, 7-5], [1-2, 8-5]).
constraints(13, [2-4, 7-5], [1-2, 8-5]).
constraints(15, [2-4, 7-5], [1-2, 8-5]).
constraints(11, [2-4, 7-7], [1-2, 8-5]).
constraints(12, [2-4, 7-7], [1-2, 8-5]).
constraints(13, [2-4, 7-7], [1-2, 8-5]). 

constraints(11, [2-6, 5-4], [1-2, 8-5]).
constraints(13, [2-6, 5-4], [1-2, 8-5]).
constraints(15, [2-6, 5-4], [1-2, 8-5]).
constraints(11, [2-6, 5-6], [1-2, 8-5]).
constraints(13, [2-6, 5-6], [1-2, 8-5]).
constraints(15, [2-6, 5-6], [1-2, 8-5]).
constraints(11, [2-6, 7-5], [1-2, 8-5]).
constraints(13, [2-6, 7-5], [1-2, 8-5]).
constraints(15, [2-6, 7-5], [1-2, 8-5]).
constraints(11, [2-6, 7-7], [1-2, 8-5]).
constraints(12, [2-6, 7-7], [1-2, 8-5]).
constraints(13, [2-6, 7-7], [1-2, 8-5]). 

constraints(11, [5-4, 7-2], [1-2, 8-5]).
constraints(13, [5-4, 7-3], [1-2, 8-5]).
constraints(11, [5-4, 7-5], [1-2, 8-5]).
constraints(13, [5-4, 7-5], [1-2, 8-5]).
constraints(15, [5-4, 7-5], [1-2, 8-5]).
constraints(15, [5-4, 7-6], [1-2, 8-5]).
constraints(11, [5-4, 7-7], [1-2, 8-5]).
constraints(13, [5-4, 7-7], [1-2, 8-5]). 
constraints(15, [5-4, 7-7], [1-2, 8-5]). 

constraints(11, [5-6, 7-2], [1-2, 8-5]).
constraints(13, [5-6, 7-3], [1-2, 8-5]).
constraints(11, [5-6, 7-5], [1-2, 8-5]).
constraints(13, [5-6, 7-5], [1-2, 8-5]).
constraints(15, [5-6, 7-5], [1-2, 8-5]).
constraints(15, [5-6, 7-6], [1-2, 8-5]).
constraints(11, [5-6, 7-7], [1-2, 8-5]).
constraints(13, [5-6, 7-7], [1-2, 8-5]). 
constraints(15, [5-6, 7-7], [1-2, 8-5]). 

constraints(11, [2-2, 5-4], [1-2, 8-7]).
constraints(13, [2-2, 5-4], [1-2, 8-7]).
constraints(15, [2-2, 5-4], [1-2, 8-7]).
constraints(11, [2-2, 5-6], [1-2, 8-7]).
constraints(13, [2-2, 5-6], [1-2, 8-7]).
constraints(15, [2-2, 5-6], [1-2, 8-7]).
constraints(11, [2-2, 7-5], [1-2, 8-7]).
constraints(13, [2-2, 7-5], [1-2, 8-7]).
constraints(15, [2-2, 7-5], [1-2, 8-7]).
constraints(11, [2-2, 7-7], [1-2, 8-7]).
constraints(13, [2-2, 7-7], [1-2, 8-7]).
constraints(15, [2-2, 7-7], [1-2, 8-7]).

constraints(11, [2-4, 5-4], [1-2, 8-7]).
constraints(13, [2-4, 5-4], [1-2, 8-7]).
constraints(15, [2-4, 5-4], [1-2, 8-7]).
constraints(11, [2-4, 5-6], [1-2, 8-7]).
constraints(13, [2-4, 5-6], [1-2, 8-7]).
constraints(15, [2-4, 5-6], [1-2, 8-7]).
constraints(11, [2-4, 7-5], [1-2, 8-7]).
constraints(13, [2-4, 7-5], [1-2, 8-7]).
constraints(15, [2-4, 7-5], [1-2, 8-7]).
constraints(11, [2-4, 7-7], [1-2, 8-7]).
constraints(12, [2-4, 7-7], [1-2, 8-7]).
constraints(13, [2-4, 7-7], [1-2, 8-7]). 

constraints(11, [2-6, 5-4], [1-2, 8-7]).
constraints(13, [2-6, 5-4], [1-2, 8-7]).
constraints(15, [2-6, 5-4], [1-2, 8-7]).
constraints(11, [2-6, 5-6], [1-2, 8-7]).
constraints(13, [2-6, 5-6], [1-2, 8-7]).
constraints(15, [2-6, 5-6], [1-2, 8-7]).
constraints(11, [2-6, 7-5], [1-2, 8-7]).
constraints(13, [2-6, 7-5], [1-2, 8-7]).
constraints(15, [2-6, 7-5], [1-2, 8-7]).
constraints(11, [2-6, 7-7], [1-2, 8-7]).
constraints(12, [2-6, 7-7], [1-2, 8-7]).
constraints(13, [2-6, 7-7], [1-2, 8-7]). 

constraints(11, [5-4, 7-2], [1-2, 8-7]).
constraints(13, [5-4, 7-3], [1-2, 8-7]).
constraints(11, [5-4, 7-5], [1-2, 8-7]).
constraints(13, [5-4, 7-5], [1-2, 8-7]).
constraints(15, [5-4, 7-5], [1-2, 8-7]).
constraints(15, [5-4, 7-6], [1-2, 8-7]).
constraints(11, [5-4, 7-7], [1-2, 8-7]).
constraints(13, [5-4, 7-7], [1-2, 8-7]). 
constraints(15, [5-4, 7-7], [1-2, 8-7]). 

constraints(11, [5-6, 7-2], [1-2, 8-7]).
constraints(13, [5-6, 7-3], [1-2, 8-7]).
constraints(11, [5-6, 7-5], [1-2, 8-7]).
constraints(13, [5-6, 7-5], [1-2, 8-7]).
constraints(15, [5-6, 7-5], [1-2, 8-7]).
constraints(15, [5-6, 7-6], [1-2, 8-7]).
constraints(11, [5-6, 7-7], [1-2, 8-7]).
constraints(13, [5-6, 7-7], [1-2, 8-7]). 
constraints(15, [5-6, 7-7], [1-2, 8-7]). 

constraints(11, [2-2, 5-4], [1-4, 6-3]).
constraints(13, [2-2, 5-4], [1-4, 6-3]).
constraints(15, [2-2, 5-4], [1-4, 6-3]).
constraints(11, [2-2, 5-6], [1-4, 6-3]).
constraints(13, [2-2, 5-6], [1-4, 6-3]).
constraints(15, [2-2, 5-6], [1-4, 6-3]).
constraints(11, [2-2, 7-5], [1-4, 6-3]).
constraints(13, [2-2, 7-5], [1-4, 6-3]).
constraints(15, [2-2, 7-5], [1-4, 6-3]).
constraints(11, [2-2, 7-7], [1-4, 6-3]).
constraints(13, [2-2, 7-7], [1-4, 6-3]).
constraints(15, [2-2, 7-7], [1-4, 6-3]).

constraints(11, [2-4, 5-4], [1-4, 6-3]).
constraints(13, [2-4, 5-4], [1-4, 6-3]).
constraints(15, [2-4, 5-4], [1-4, 6-3]).
constraints(11, [2-4, 5-6], [1-4, 6-3]).
constraints(13, [2-4, 5-6], [1-4, 6-3]).
constraints(15, [2-4, 5-6], [1-4, 6-3]).
constraints(11, [2-4, 7-5], [1-4, 6-3]).
constraints(13, [2-4, 7-5], [1-4, 6-3]).
constraints(15, [2-4, 7-5], [1-4, 6-3]).
constraints(11, [2-4, 7-7], [1-4, 6-3]).
constraints(12, [2-4, 7-7], [1-4, 6-3]).
constraints(13, [2-4, 7-7], [1-4, 6-3]). 

constraints(11, [2-6, 5-4], [1-4, 6-3]).
constraints(13, [2-6, 5-4], [1-4, 6-3]).
constraints(15, [2-6, 5-4], [1-4, 6-3]).
constraints(11, [2-6, 5-6], [1-4, 6-3]).
constraints(13, [2-6, 5-6], [1-4, 6-3]).
constraints(15, [2-6, 5-6], [1-4, 6-3]).
constraints(11, [2-6, 7-5], [1-4, 6-3]).
constraints(13, [2-6, 7-5], [1-4, 6-3]).
constraints(15, [2-6, 7-5], [1-4, 6-3]).
constraints(11, [2-6, 7-7], [1-4, 6-3]).
constraints(12, [2-6, 7-7], [1-4, 6-3]).
constraints(13, [2-6, 7-7], [1-4, 6-3]). 

constraints(11, [5-4, 7-2], [1-4, 6-3]).
constraints(13, [5-4, 7-3], [1-4, 6-3]).
constraints(11, [5-4, 7-5], [1-4, 6-3]).
constraints(13, [5-4, 7-5], [1-4, 6-3]).
constraints(15, [5-4, 7-5], [1-4, 6-3]).
constraints(15, [5-4, 7-6], [1-4, 6-3]).
constraints(11, [5-4, 7-7], [1-4, 6-3]).
constraints(13, [5-4, 7-7], [1-4, 6-3]). 
constraints(15, [5-4, 7-7], [1-4, 6-3]). 

constraints(11, [5-6, 7-2], [1-4, 6-3]).
constraints(13, [5-6, 7-3], [1-4, 6-3]).
constraints(11, [5-6, 7-5], [1-4, 6-3]).
constraints(13, [5-6, 7-5], [1-4, 6-3]).
constraints(15, [5-6, 7-5], [1-4, 6-3]).
constraints(15, [5-6, 7-6], [1-4, 6-3]).
constraints(11, [5-6, 7-7], [1-4, 6-3]).
constraints(13, [5-6, 7-7], [1-4, 6-3]). 
constraints(15, [5-6, 7-7], [1-4, 6-3]). 

constraints(11, [2-2, 5-4], [1-4, 6-5]).
constraints(13, [2-2, 5-4], [1-4, 6-5]).
constraints(15, [2-2, 5-4], [1-4, 6-5]).
constraints(11, [2-2, 5-6], [1-4, 6-5]).
constraints(13, [2-2, 5-6], [1-4, 6-5]).
constraints(15, [2-2, 5-6], [1-4, 6-5]).
constraints(11, [2-2, 7-5], [1-4, 6-5]).
constraints(13, [2-2, 7-5], [1-4, 6-5]).
constraints(15, [2-2, 7-5], [1-4, 6-5]).
constraints(11, [2-2, 7-7], [1-4, 6-5]).
constraints(13, [2-2, 7-7], [1-4, 6-5]).
constraints(15, [2-2, 7-7], [1-4, 6-5]).

constraints(11, [2-4, 5-4], [1-4, 6-5]).
constraints(13, [2-4, 5-4], [1-4, 6-5]).
constraints(15, [2-4, 5-4], [1-4, 6-5]).
constraints(_, [2-4, 5-6], [1-4, 6-5]).
constraints(11, [2-4, 7-5], [1-4, 6-5]).
constraints(13, [2-4, 7-5], [1-4, 6-5]).
constraints(15, [2-4, 7-5], [1-4, 6-5]).
constraints(11, [2-4, 7-7], [1-4, 6-5]).
constraints(12, [2-4, 7-7], [1-4, 6-5]).
constraints(13, [2-4, 7-7], [1-4, 6-5]). 

constraints(11, [2-6, 5-4], [1-4, 6-5]).
constraints(13, [2-6, 5-4], [1-4, 6-5]).
constraints(15, [2-6, 5-4], [1-4, 6-5]).
constraints(11, [2-6, 5-6], [1-4, 6-5]).
constraints(13, [2-6, 5-6], [1-4, 6-5]).
constraints(15, [2-6, 5-6], [1-4, 6-5]).
constraints(11, [2-6, 7-5], [1-4, 6-5]).
constraints(13, [2-6, 7-5], [1-4, 6-5]).
constraints(15, [2-6, 7-5], [1-4, 6-5]).
constraints(11, [2-6, 7-7], [1-4, 6-5]).
constraints(12, [2-6, 7-7], [1-4, 6-5]).
constraints(13, [2-6, 7-7], [1-4, 6-5]). 

constraints(11, [5-4, 7-2], [1-4, 6-5]).
constraints(13, [5-4, 7-3], [1-4, 6-5]).
constraints(11, [5-4, 7-5], [1-4, 6-5]).
constraints(13, [5-4, 7-5], [1-4, 6-5]).
constraints(15, [5-4, 7-5], [1-4, 6-5]).
constraints(15, [5-4, 7-6], [1-4, 6-5]).
constraints(11, [5-4, 7-7], [1-4, 6-5]).
constraints(13, [5-4, 7-7], [1-4, 6-5]). 
constraints(15, [5-4, 7-7], [1-4, 6-5]). 

constraints(11, [5-6, 7-2], [1-4, 6-5]).
constraints(13, [5-6, 7-3], [1-4, 6-5]).
constraints(11, [5-6, 7-5], [1-4, 6-5]).
constraints(13, [5-6, 7-5], [1-4, 6-5]).
constraints(15, [5-6, 7-5], [1-4, 6-5]).
constraints(15, [5-6, 7-6], [1-4, 6-5]).
constraints(11, [5-6, 7-7], [1-4, 6-5]).
constraints(13, [5-6, 7-7], [1-4, 6-5]). 
constraints(15, [5-6, 7-7], [1-4, 6-5]). 

constraints(11, [2-2, 5-4], [1-4, 6-6]).
constraints(13, [2-2, 5-4], [1-4, 6-6]).
constraints(15, [2-2, 5-4], [1-4, 6-6]).
constraints(11, [2-2, 5-6], [1-4, 6-6]).
constraints(13, [2-2, 5-6], [1-4, 6-6]).
constraints(15, [2-2, 5-6], [1-4, 6-6]).
constraints(11, [2-2, 7-5], [1-4, 6-6]).
constraints(13, [2-2, 7-5], [1-4, 6-6]).
constraints(15, [2-2, 7-5], [1-4, 6-6]).
constraints(11, [2-2, 7-7], [1-4, 6-6]).
constraints(13, [2-2, 7-7], [1-4, 6-6]).
constraints(15, [2-2, 7-7], [1-4, 6-6]).

constraints(11, [2-4, 5-4], [1-4, 6-6]).
constraints(13, [2-4, 5-4], [1-4, 6-6]).
constraints(15, [2-4, 5-4], [1-4, 6-6]).
constraints(11, [2-4, 5-6], [1-4, 6-6]).
constraints(13, [2-4, 5-6], [1-4, 6-6]).
constraints(15, [2-4, 5-6], [1-4, 6-6]).
constraints(11, [2-4, 7-5], [1-4, 6-6]).
constraints(13, [2-4, 7-5], [1-4, 6-6]).
constraints(15, [2-4, 7-5], [1-4, 6-6]).
constraints(11, [2-4, 7-7], [1-4, 6-6]).
constraints(12, [2-4, 7-7], [1-4, 6-6]).
constraints(13, [2-4, 7-7], [1-4, 6-6]). 

constraints(11, [2-6, 5-4], [1-4, 6-6]).
constraints(13, [2-6, 5-4], [1-4, 6-6]).
constraints(15, [2-6, 5-4], [1-4, 6-6]).
constraints(11, [2-6, 5-6], [1-4, 6-6]).
constraints(13, [2-6, 5-6], [1-4, 6-6]).
constraints(15, [2-6, 5-6], [1-4, 6-6]).
constraints(11, [2-6, 7-5], [1-4, 6-6]).
constraints(13, [2-6, 7-5], [1-4, 6-6]).
constraints(15, [2-6, 7-5], [1-4, 6-6]).
constraints(11, [2-6, 7-7], [1-4, 6-6]).
constraints(12, [2-6, 7-7], [1-4, 6-6]).
constraints(13, [2-6, 7-7], [1-4, 6-6]). 

constraints(11, [5-4, 7-2], [1-4, 6-6]).
constraints(13, [5-4, 7-3], [1-4, 6-6]).
constraints(11, [5-4, 7-5], [1-4, 6-6]).
constraints(13, [5-4, 7-5], [1-4, 6-6]).
constraints(15, [5-4, 7-5], [1-4, 6-6]).
constraints(15, [5-4, 7-6], [1-4, 6-6]).
constraints(11, [5-4, 7-7], [1-4, 6-6]).
constraints(13, [5-4, 7-7], [1-4, 6-6]). 
constraints(15, [5-4, 7-7], [1-4, 6-6]). 

constraints(11, [5-6, 7-2], [1-4, 6-6]).
constraints(13, [5-6, 7-3], [1-4, 6-6]).
constraints(11, [5-6, 7-5], [1-4, 6-6]).
constraints(13, [5-6, 7-5], [1-4, 6-6]).
constraints(15, [5-6, 7-5], [1-4, 6-6]).
constraints(15, [5-6, 7-6], [1-4, 6-6]).
constraints(11, [5-6, 7-7], [1-4, 6-6]).
constraints(13, [5-6, 7-7], [1-4, 6-6]). 
constraints(15, [5-6, 7-7], [1-4, 6-6]). 

constraints(11, [2-2, 5-4], [1-4, 8-3]).
constraints(13, [2-2, 5-4], [1-4, 8-3]).
constraints(15, [2-2, 5-4], [1-4, 8-3]).
constraints(11, [2-2, 5-6], [1-4, 8-3]).
constraints(13, [2-2, 5-6], [1-4, 8-3]).
constraints(15, [2-2, 5-6], [1-4, 8-3]).
constraints(11, [2-2, 7-5], [1-4, 8-3]).
constraints(13, [2-2, 7-5], [1-4, 8-3]).
constraints(15, [2-2, 7-5], [1-4, 8-3]).
constraints(11, [2-2, 7-7], [1-4, 8-3]).
constraints(13, [2-2, 7-7], [1-4, 8-3]).
constraints(15, [2-2, 7-7], [1-4, 8-3]).

constraints(11, [2-4, 5-4], [1-4, 8-3]).
constraints(13, [2-4, 5-4], [1-4, 8-3]).
constraints(15, [2-4, 5-4], [1-4, 8-3]).
constraints(11, [2-4, 5-6], [1-4, 8-3]).
constraints(13, [2-4, 5-6], [1-4, 8-3]).
constraints(15, [2-4, 5-6], [1-4, 8-3]).
constraints(11, [2-4, 7-5], [1-4, 8-3]).
constraints(13, [2-4, 7-5], [1-4, 8-3]).
constraints(15, [2-4, 7-5], [1-4, 8-3]).
constraints(11, [2-4, 7-7], [1-4, 8-3]).
constraints(12, [2-4, 7-7], [1-4, 8-3]).
constraints(13, [2-4, 7-7], [1-4, 8-3]). 

constraints(11, [2-6, 5-4], [1-4, 8-3]).
constraints(13, [2-6, 5-4], [1-4, 8-3]).
constraints(15, [2-6, 5-4], [1-4, 8-3]).
constraints(11, [2-6, 5-6], [1-4, 8-3]).
constraints(13, [2-6, 5-6], [1-4, 8-3]).
constraints(15, [2-6, 5-6], [1-4, 8-3]).
constraints(11, [2-6, 7-5], [1-4, 8-3]).
constraints(13, [2-6, 7-5], [1-4, 8-3]).
constraints(15, [2-6, 7-5], [1-4, 8-3]).
constraints(11, [2-6, 7-7], [1-4, 8-3]).
constraints(12, [2-6, 7-7], [1-4, 8-3]).
constraints(13, [2-6, 7-7], [1-4, 8-3]). 

constraints(11, [5-4, 7-2], [1-4, 8-3]).
constraints(13, [5-4, 7-3], [1-4, 8-3]).
constraints(11, [5-4, 7-5], [1-4, 8-3]).
constraints(13, [5-4, 7-5], [1-4, 8-3]).
constraints(15, [5-4, 7-5], [1-4, 8-3]).
constraints(15, [5-4, 7-6], [1-4, 8-3]).
constraints(11, [5-4, 7-7], [1-4, 8-3]).
constraints(13, [5-4, 7-7], [1-4, 8-3]). 
constraints(15, [5-4, 7-7], [1-4, 8-3]). 

constraints(11, [5-6, 7-2], [1-4, 8-3]).
constraints(13, [5-6, 7-3], [1-4, 8-3]).
constraints(11, [5-6, 7-5], [1-4, 8-3]).
constraints(13, [5-6, 7-5], [1-4, 8-3]).
constraints(15, [5-6, 7-5], [1-4, 8-3]).
constraints(15, [5-6, 7-6], [1-4, 8-3]).
constraints(11, [5-6, 7-7], [1-4, 8-3]).
constraints(13, [5-6, 7-7], [1-4, 8-3]). 
constraints(15, [5-6, 7-7], [1-4, 8-3]). 

constraints(11, [2-2, 5-4], [1-4, 8-5]).
constraints(13, [2-2, 5-4], [1-4, 8-5]).
constraints(15, [2-2, 5-4], [1-4, 8-5]).
constraints(11, [2-2, 5-6], [1-4, 8-5]).
constraints(13, [2-2, 5-6], [1-4, 8-5]).
constraints(15, [2-2, 5-6], [1-4, 8-5]).
constraints(11, [2-2, 7-5], [1-4, 8-5]).
constraints(13, [2-2, 7-5], [1-4, 8-5]).
constraints(15, [2-2, 7-5], [1-4, 8-5]).
constraints(11, [2-2, 7-7], [1-4, 8-5]).
constraints(13, [2-2, 7-7], [1-4, 8-5]).
constraints(15, [2-2, 7-7], [1-4, 8-5]).

constraints(11, [2-4, 5-4], [1-4, 8-5]).
constraints(13, [2-4, 5-4], [1-4, 8-5]).
constraints(15, [2-4, 5-4], [1-4, 8-5]).
constraints(11, [2-4, 5-6], [1-4, 8-5]).
constraints(13, [2-4, 5-6], [1-4, 8-5]).
constraints(15, [2-4, 5-6], [1-4, 8-5]).
constraints(11, [2-4, 7-5], [1-4, 8-5]).
constraints(13, [2-4, 7-5], [1-4, 8-5]).
constraints(15, [2-4, 7-5], [1-4, 8-5]).
constraints(11, [2-4, 7-7], [1-4, 8-5]).
constraints(12, [2-4, 7-7], [1-4, 8-5]).
constraints(13, [2-4, 7-7], [1-4, 8-5]). 

constraints(11, [2-6, 5-4], [1-4, 8-5]).
constraints(13, [2-6, 5-4], [1-4, 8-5]).
constraints(15, [2-6, 5-4], [1-4, 8-5]).
constraints(11, [2-6, 5-6], [1-4, 8-5]).
constraints(13, [2-6, 5-6], [1-4, 8-5]).
constraints(15, [2-6, 5-6], [1-4, 8-5]).
constraints(11, [2-6, 7-5], [1-4, 8-5]).
constraints(13, [2-6, 7-5], [1-4, 8-5]).
constraints(15, [2-6, 7-5], [1-4, 8-5]).
constraints(11, [2-6, 7-7], [1-4, 8-5]).
constraints(12, [2-6, 7-7], [1-4, 8-5]).
constraints(13, [2-6, 7-7], [1-4, 8-5]). 

constraints(11, [5-4, 7-2], [1-4, 8-5]).
constraints(13, [5-4, 7-3], [1-4, 8-5]).
constraints(11, [5-4, 7-5], [1-4, 8-5]).
constraints(13, [5-4, 7-5], [1-4, 8-5]).
constraints(15, [5-4, 7-5], [1-4, 8-5]).
constraints(15, [5-4, 7-6], [1-4, 8-5]).
constraints(11, [5-4, 7-7], [1-4, 8-5]).
constraints(13, [5-4, 7-7], [1-4, 8-5]). 
constraints(15, [5-4, 7-7], [1-4, 8-5]). 

constraints(11, [5-6, 7-2], [1-4, 8-5]).
constraints(13, [5-6, 7-3], [1-4, 8-5]).
constraints(11, [5-6, 7-5], [1-4, 8-5]).
constraints(13, [5-6, 7-5], [1-4, 8-5]).
constraints(15, [5-6, 7-5], [1-4, 8-5]).
constraints(15, [5-6, 7-6], [1-4, 8-5]).
constraints(11, [5-6, 7-7], [1-4, 8-5]).
constraints(13, [5-6, 7-7], [1-4, 8-5]). 
constraints(15, [5-6, 7-7], [1-4, 8-5]). 

constraints(11, [2-2, 5-4], [1-4, 8-7]).
constraints(13, [2-2, 5-4], [1-4, 8-7]).
constraints(15, [2-2, 5-4], [1-4, 8-7]).
constraints(11, [2-2, 5-6], [1-4, 8-7]).
constraints(13, [2-2, 5-6], [1-4, 8-7]).
constraints(15, [2-2, 5-6], [1-4, 8-7]).
constraints(11, [2-2, 7-5], [1-4, 8-7]).
constraints(13, [2-2, 7-5], [1-4, 8-7]).
constraints(15, [2-2, 7-5], [1-4, 8-7]).
constraints(11, [2-2, 7-7], [1-4, 8-7]).
constraints(13, [2-2, 7-7], [1-4, 8-7]).
constraints(15, [2-2, 7-7], [1-4, 8-7]).

constraints(11, [2-4, 5-4], [1-4, 8-7]).
constraints(13, [2-4, 5-4], [1-4, 8-7]).
constraints(15, [2-4, 5-4], [1-4, 8-7]).
constraints(11, [2-4, 5-6], [1-4, 8-7]).
constraints(13, [2-4, 5-6], [1-4, 8-7]).
constraints(15, [2-4, 5-6], [1-4, 8-7]).
constraints(11, [2-4, 7-5], [1-4, 8-7]).
constraints(13, [2-4, 7-5], [1-4, 8-7]).
constraints(15, [2-4, 7-5], [1-4, 8-7]).
constraints(11, [2-4, 7-7], [1-4, 8-7]).
constraints(12, [2-4, 7-7], [1-4, 8-7]).
constraints(13, [2-4, 7-7], [1-4, 8-7]). 

constraints(11, [2-6, 5-4], [1-4, 8-7]).
constraints(13, [2-6, 5-4], [1-4, 8-7]).
constraints(15, [2-6, 5-4], [1-4, 8-7]).
constraints(11, [2-6, 5-6], [1-4, 8-7]).
constraints(13, [2-6, 5-6], [1-4, 8-7]).
constraints(15, [2-6, 5-6], [1-4, 8-7]).
constraints(11, [2-6, 7-5], [1-4, 8-7]).
constraints(13, [2-6, 7-5], [1-4, 8-7]).
constraints(15, [2-6, 7-5], [1-4, 8-7]).
constraints(11, [2-6, 7-7], [1-4, 8-7]).
constraints(12, [2-6, 7-7], [1-4, 8-7]).
constraints(13, [2-6, 7-7], [1-4, 8-7]). 

constraints(11, [5-4, 7-2], [1-4, 8-7]).
constraints(13, [5-4, 7-3], [1-4, 8-7]).
constraints(11, [5-4, 7-5], [1-4, 8-7]).
constraints(13, [5-4, 7-5], [1-4, 8-7]).
constraints(15, [5-4, 7-5], [1-4, 8-7]).
constraints(15, [5-4, 7-6], [1-4, 8-7]).
constraints(11, [5-4, 7-7], [1-4, 8-7]).
constraints(13, [5-4, 7-7], [1-4, 8-7]). 
constraints(15, [5-4, 7-7], [1-4, 8-7]). 

constraints(11, [5-6, 7-2], [1-4, 8-7]).
constraints(13, [5-6, 7-3], [1-4, 8-7]).
constraints(11, [5-6, 7-5], [1-4, 8-7]).
constraints(13, [5-6, 7-5], [1-4, 8-7]).
constraints(15, [5-6, 7-5], [1-4, 8-7]).
constraints(15, [5-6, 7-6], [1-4, 8-7]).
constraints(11, [5-6, 7-7], [1-4, 8-7]).
constraints(13, [5-6, 7-7], [1-4, 8-7]). 
constraints(15, [5-6, 7-7], [1-4, 8-7]). 

constraints(11, [2-2, 5-4], [1-7, 7-3]).
constraints(13, [2-2, 5-4], [1-7, 7-3]).
constraints(15, [2-2, 5-4], [1-7, 7-3]).
constraints(11, [2-2, 5-6], [1-7, 7-3]).
constraints(13, [2-2, 5-6], [1-7, 7-3]).
constraints(15, [2-2, 5-6], [1-7, 7-3]).
constraints(11, [2-2, 7-5], [1-7, 7-3]).
constraints(13, [2-2, 7-5], [1-7, 7-3]).
constraints(15, [2-2, 7-5], [1-7, 7-3]).
constraints(11, [2-2, 7-7], [1-7, 7-3]).
constraints(13, [2-2, 7-7], [1-7, 7-3]).
constraints(15, [2-2, 7-7], [1-7, 7-3]).

constraints(11, [2-4, 5-4], [1-7, 7-3]).
constraints(13, [2-4, 5-4], [1-7, 7-3]).
constraints(15, [2-4, 5-4], [1-7, 7-3]).
constraints(11, [2-4, 5-6], [1-7, 7-3]).
constraints(13, [2-4, 5-6], [1-7, 7-3]).
constraints(15, [2-4, 5-6], [1-7, 7-3]).
constraints(11, [2-4, 7-5], [1-7, 7-3]).
constraints(13, [2-4, 7-5], [1-7, 7-3]).
constraints(15, [2-4, 7-5], [1-7, 7-3]).
constraints(11, [2-4, 7-7], [1-7, 7-3]).
constraints(12, [2-4, 7-7], [1-7, 7-3]).
constraints(13, [2-4, 7-7], [1-7, 7-3]). 

constraints(11, [2-6, 5-4], [1-7, 7-3]).
constraints(13, [2-6, 5-4], [1-7, 7-3]).
constraints(15, [2-6, 5-4], [1-7, 7-3]).
constraints(11, [2-6, 5-6], [1-7, 7-3]).
constraints(13, [2-6, 5-6], [1-7, 7-3]).
constraints(15, [2-6, 5-6], [1-7, 7-3]).
constraints(11, [2-6, 7-5], [1-7, 7-3]).
constraints(13, [2-6, 7-5], [1-7, 7-3]).
constraints(15, [2-6, 7-5], [1-7, 7-3]).
constraints(11, [2-6, 7-7], [1-7, 7-3]).
constraints(12, [2-6, 7-7], [1-7, 7-3]).
constraints(13, [2-6, 7-7], [1-7, 7-3]). 

constraints(11, [5-4, 7-2], [1-7, 7-3]).
constraints(13, [5-4, 7-3], [1-7, 7-3]).
constraints(11, [5-4, 7-5], [1-7, 7-3]).
constraints(13, [5-4, 7-5], [1-7, 7-3]).
constraints(15, [5-4, 7-5], [1-7, 7-3]).
constraints(15, [5-4, 7-6], [1-7, 7-3]).
constraints(11, [5-4, 7-7], [1-7, 7-3]).
constraints(13, [5-4, 7-7], [1-7, 7-3]). 
constraints(15, [5-4, 7-7], [1-7, 7-3]). 

constraints(11, [5-6, 7-2], [1-7, 7-3]).
constraints(13, [5-6, 7-3], [1-7, 7-3]).
constraints(11, [5-6, 7-5], [1-7, 7-3]).
constraints(13, [5-6, 7-5], [1-7, 7-3]).
constraints(15, [5-6, 7-5], [1-7, 7-3]).
constraints(15, [5-6, 7-6], [1-7, 7-3]).
constraints(11, [5-6, 7-7], [1-7, 7-3]).
constraints(13, [5-6, 7-7], [1-7, 7-3]). 
constraints(15, [5-6, 7-7], [1-7, 7-3]). 

constraints(11, [2-2, 5-4], [1-7, 7-5]).
constraints(13, [2-2, 5-4], [1-7, 7-5]).
constraints(15, [2-2, 5-4], [1-7, 7-5]).
constraints(11, [2-2, 5-6], [1-7, 7-5]).
constraints(13, [2-2, 5-6], [1-7, 7-5]).
constraints(15, [2-2, 5-6], [1-7, 7-5]).
constraints(11, [2-2, 7-5], [1-7, 7-5]).
constraints(13, [2-2, 7-5], [1-7, 7-5]).
constraints(15, [2-2, 7-5], [1-7, 7-5]).
constraints(11, [2-2, 7-7], [1-7, 7-5]).
constraints(13, [2-2, 7-7], [1-7, 7-5]).
constraints(15, [2-2, 7-7], [1-7, 7-5]).

constraints(11, [2-4, 5-4], [1-7, 7-5]).
constraints(13, [2-4, 5-4], [1-7, 7-5]).
constraints(15, [2-4, 5-4], [1-7, 7-5]).
constraints(11, [2-4, 5-6], [1-7, 7-5]).
constraints(13, [2-4, 5-6], [1-7, 7-5]).
constraints(15, [2-4, 5-6], [1-7, 7-5]).
constraints(11, [2-4, 7-5], [1-7, 7-5]).
constraints(13, [2-4, 7-5], [1-7, 7-5]).
constraints(15, [2-4, 7-5], [1-7, 7-5]).
constraints(11, [2-4, 7-7], [1-7, 7-5]).
constraints(12, [2-4, 7-7], [1-7, 7-5]).
constraints(13, [2-4, 7-7], [1-7, 7-5]). 

constraints(11, [2-6, 5-4], [1-7, 7-5]).
constraints(13, [2-6, 5-4], [1-7, 7-5]).
constraints(15, [2-6, 5-4], [1-7, 7-5]).
constraints(11, [2-6, 5-6], [1-7, 7-5]).
constraints(13, [2-6, 5-6], [1-7, 7-5]).
constraints(15, [2-6, 5-6], [1-7, 7-5]).
constraints(11, [2-6, 7-5], [1-7, 7-5]).
constraints(13, [2-6, 7-5], [1-7, 7-5]).
constraints(15, [2-6, 7-5], [1-7, 7-5]).
constraints(11, [2-6, 7-7], [1-7, 7-5]).
constraints(12, [2-6, 7-7], [1-7, 7-5]).
constraints(13, [2-6, 7-7], [1-7, 7-5]). 

constraints(11, [5-4, 7-2], [1-7, 7-5]).
constraints(13, [5-4, 7-3], [1-7, 7-5]).
constraints(11, [5-4, 7-5], [1-7, 7-5]).
constraints(13, [5-4, 7-5], [1-7, 7-5]).
constraints(15, [5-4, 7-5], [1-7, 7-5]).
constraints(15, [5-4, 7-6], [1-7, 7-5]).
constraints(11, [5-4, 7-7], [1-7, 7-5]).
constraints(13, [5-4, 7-7], [1-7, 7-5]). 
constraints(15, [5-4, 7-7], [1-7, 7-5]). 

constraints(11, [5-6, 7-2], [1-7, 7-5]).
constraints(13, [5-6, 7-3], [1-7, 7-5]).
constraints(11, [5-6, 7-5], [1-7, 7-5]).
constraints(13, [5-6, 7-5], [1-7, 7-5]).
constraints(15, [5-6, 7-5], [1-7, 7-5]).
constraints(15, [5-6, 7-6], [1-7, 7-5]).
constraints(11, [5-6, 7-7], [1-7, 7-5]).
constraints(13, [5-6, 7-7], [1-7, 7-5]). 
constraints(15, [5-6, 7-7], [1-7, 7-5]). 

constraints(11, [2-2, 5-4], [1-7, 9-3]).
constraints(13, [2-2, 5-4], [1-7, 9-3]).
constraints(15, [2-2, 5-4], [1-7, 9-3]).
constraints(11, [2-2, 5-6], [1-7, 9-3]).
constraints(13, [2-2, 5-6], [1-7, 9-3]).
constraints(15, [2-2, 5-6], [1-7, 9-3]).
constraints(11, [2-2, 7-5], [1-7, 9-3]).
constraints(13, [2-2, 7-5], [1-7, 9-3]).
constraints(15, [2-2, 7-5], [1-7, 9-3]).
constraints(11, [2-2, 7-7], [1-7, 9-3]).
constraints(13, [2-2, 7-7], [1-7, 9-3]).
constraints(15, [2-2, 7-7], [1-7, 9-3]).

constraints(11, [2-4, 5-4], [1-7, 9-3]).
constraints(13, [2-4, 5-4], [1-7, 9-3]).
constraints(15, [2-4, 5-4], [1-7, 9-3]).
constraints(11, [2-4, 5-6], [1-7, 9-3]).
constraints(13, [2-4, 5-6], [1-7, 9-3]).
constraints(15, [2-4, 5-6], [1-7, 9-3]).
constraints(11, [2-4, 7-5], [1-7, 9-3]).
constraints(13, [2-4, 7-5], [1-7, 9-3]).
constraints(15, [2-4, 7-5], [1-7, 9-3]).
constraints(11, [2-4, 7-7], [1-7, 9-3]).
constraints(12, [2-4, 7-7], [1-7, 9-3]).
constraints(13, [2-4, 7-7], [1-7, 9-3]). 

constraints(11, [2-6, 5-4], [1-7, 9-3]).
constraints(13, [2-6, 5-4], [1-7, 9-3]).
constraints(15, [2-6, 5-4], [1-7, 9-3]).
constraints(11, [2-6, 5-6], [1-7, 9-3]).
constraints(13, [2-6, 5-6], [1-7, 9-3]).
constraints(15, [2-6, 5-6], [1-7, 9-3]).
constraints(11, [2-6, 7-5], [1-7, 9-3]).
constraints(13, [2-6, 7-5], [1-7, 9-3]).
constraints(15, [2-6, 7-5], [1-7, 9-3]).
constraints(11, [2-6, 7-7], [1-7, 9-3]).
constraints(12, [2-6, 7-7], [1-7, 9-3]).
constraints(13, [2-6, 7-7], [1-7, 9-3]). 

constraints(11, [5-4, 7-2], [1-7, 9-3]).
constraints(13, [5-4, 7-3], [1-7, 9-3]).
constraints(11, [5-4, 7-5], [1-7, 9-3]).
constraints(13, [5-4, 7-5], [1-7, 9-3]).
constraints(15, [5-4, 7-5], [1-7, 9-3]).
constraints(15, [5-4, 7-6], [1-7, 9-3]).
constraints(11, [5-4, 7-7], [1-7, 9-3]).
constraints(13, [5-4, 7-7], [1-7, 9-3]). 
constraints(15, [5-4, 7-7], [1-7, 9-3]). 

constraints(11, [5-6, 7-2], [1-7, 9-3]).
constraints(13, [5-6, 7-3], [1-7, 9-3]).
constraints(11, [5-6, 7-5], [1-7, 9-3]).
constraints(13, [5-6, 7-5], [1-7, 9-3]).
constraints(15, [5-6, 7-6], [1-7, 9-3]).
constraints(11, [5-6, 7-7], [1-7, 9-3]).
constraints(13, [5-6, 7-7], [1-7, 9-3]). 
constraints(15, [5-6, 7-7], [1-7, 9-3]). 

constraints(11, [2-2, 5-4], [1-7, 9-5]).
constraints(13, [2-2, 5-4], [1-7, 9-5]).
constraints(15, [2-2, 5-4], [1-7, 9-5]).
constraints(11, [2-2, 5-6], [1-7, 9-5]).
constraints(13, [2-2, 5-6], [1-7, 9-5]).
constraints(15, [2-2, 5-6], [1-7, 9-5]).
constraints(11, [2-2, 7-5], [1-7, 9-5]).
constraints(13, [2-2, 7-5], [1-7, 9-5]).
constraints(15, [2-2, 7-5], [1-7, 9-5]).
constraints(11, [2-2, 7-7], [1-7, 9-5]).
constraints(13, [2-2, 7-7], [1-7, 9-5]).
constraints(15, [2-2, 7-7], [1-7, 9-5]).

constraints(11, [2-4, 5-4], [1-7, 9-5]).
constraints(13, [2-4, 5-4], [1-7, 9-5]).
constraints(15, [2-4, 5-4], [1-7, 9-5]).
constraints(11, [2-4, 5-6], [1-7, 9-5]).
constraints(13, [2-4, 5-6], [1-7, 9-5]).
constraints(15, [2-4, 5-6], [1-7, 9-5]).
constraints(11, [2-4, 7-5], [1-7, 9-5]).
constraints(13, [2-4, 7-5], [1-7, 9-5]).
constraints(15, [2-4, 7-5], [1-7, 9-5]).
constraints(11, [2-4, 7-7], [1-7, 9-5]).
constraints(12, [2-4, 7-7], [1-7, 9-5]).
constraints(13, [2-4, 7-7], [1-7, 9-5]). 

constraints(11, [2-6, 5-4], [1-7, 9-5]).
constraints(13, [2-6, 5-4], [1-7, 9-5]).
constraints(15, [2-6, 5-4], [1-7, 9-5]).
constraints(11, [2-6, 5-6], [1-7, 9-5]).
constraints(13, [2-6, 5-6], [1-7, 9-5]).
constraints(15, [2-6, 5-6], [1-7, 9-5]).
constraints(11, [2-6, 7-5], [1-7, 9-5]).
constraints(13, [2-6, 7-5], [1-7, 9-5]).
constraints(15, [2-6, 7-5], [1-7, 9-5]).
constraints(11, [2-6, 7-7], [1-7, 9-5]).
constraints(12, [2-6, 7-7], [1-7, 9-5]).
constraints(13, [2-6, 7-7], [1-7, 9-5]). 

constraints(11, [5-4, 7-2], [1-7, 9-5]).
constraints(13, [5-4, 7-3], [1-7, 9-5]).
constraints(11, [5-4, 7-5], [1-7, 9-5]).
constraints(13, [5-4, 7-5], [1-7, 9-5]).
constraints(15, [5-4, 7-5], [1-7, 9-5]).
constraints(15, [5-4, 7-6], [1-7, 9-5]).
constraints(11, [5-4, 7-7], [1-7, 9-5]).
constraints(13, [5-4, 7-7], [1-7, 9-5]). 
constraints(15, [5-4, 7-7], [1-7, 9-5]). 

constraints(11, [5-6, 7-2], [1-7, 9-5]).
constraints(13, [5-6, 7-3], [1-7, 9-5]).
constraints(11, [5-6, 7-5], [1-7, 9-5]).
constraints(13, [5-6, 7-5], [1-7, 9-5]).
constraints(15, [5-6, 7-6], [1-7, 9-5]).
constraints(11, [5-6, 7-7], [1-7, 9-5]).
constraints(13, [5-6, 7-7], [1-7, 9-5]). 
constraints(15, [5-6, 7-7], [1-7, 9-5]). 

constraints(11, [2-2, 5-4], [1-7, 9-7]).
constraints(13, [2-2, 5-4], [1-7, 9-7]).
constraints(15, [2-2, 5-4], [1-7, 9-7]).
constraints(11, [2-2, 5-6], [1-7, 9-7]).
constraints(13, [2-2, 5-6], [1-7, 9-7]).
constraints(15, [2-2, 5-6], [1-7, 9-7]).
constraints(11, [2-2, 7-5], [1-7, 9-7]).
constraints(13, [2-2, 7-5], [1-7, 9-7]).
constraints(15, [2-2, 7-5], [1-7, 9-7]).
constraints(11, [2-2, 7-7], [1-7, 9-7]).
constraints(13, [2-2, 7-7], [1-7, 9-7]).
constraints(15, [2-2, 7-7], [1-7, 9-7]).

constraints(11, [2-4, 5-4], [1-7, 9-7]).
constraints(13, [2-4, 5-4], [1-7, 9-7]).
constraints(15, [2-4, 5-4], [1-7, 9-7]).
constraints(11, [2-4, 5-6], [1-7, 9-7]).
constraints(13, [2-4, 5-6], [1-7, 9-7]).
constraints(15, [2-4, 5-6], [1-7, 9-7]).
constraints(11, [2-4, 7-5], [1-7, 9-7]).
constraints(13, [2-4, 7-5], [1-7, 9-7]).
constraints(15, [2-4, 7-5], [1-7, 9-7]).
constraints(11, [2-4, 7-7], [1-7, 9-7]).
constraints(12, [2-4, 7-7], [1-7, 9-7]).
constraints(13, [2-4, 7-7], [1-7, 9-7]). 

constraints(11, [2-6, 5-4], [1-7, 9-7]).
constraints(13, [2-6, 5-4], [1-7, 9-7]).
constraints(15, [2-6, 5-4], [1-7, 9-7]).
constraints(11, [2-6, 5-6], [1-7, 9-7]).
constraints(13, [2-6, 5-6], [1-7, 9-7]).
constraints(15, [2-6, 5-6], [1-7, 9-7]).
constraints(11, [2-6, 7-5], [1-7, 9-7]).
constraints(13, [2-6, 7-5], [1-7, 9-7]).
constraints(15, [2-6, 7-5], [1-7, 9-7]).
constraints(11, [2-6, 7-7], [1-7, 9-7]).
constraints(12, [2-6, 7-7], [1-7, 9-7]).
constraints(13, [2-6, 7-7], [1-7, 9-7]). 

constraints(11, [5-4, 7-2], [1-7, 9-7]).
constraints(13, [5-4, 7-3], [1-7, 9-7]).
constraints(11, [5-4, 7-5], [1-7, 9-7]).
constraints(13, [5-4, 7-5], [1-7, 9-7]).
constraints(15, [5-4, 7-5], [1-7, 9-7]).
constraints(15, [5-4, 7-6], [1-7, 9-7]).
constraints(11, [5-4, 7-7], [1-7, 9-7]).
constraints(13, [5-4, 7-7], [1-7, 9-7]). 
constraints(15, [5-4, 7-7], [1-7, 9-7]). 

constraints(11, [5-6, 7-2], [1-7, 9-7]).
constraints(13, [5-6, 7-3], [1-7, 9-7]).
constraints(11, [5-6, 7-5], [1-7, 9-7]).
constraints(13, [5-6, 7-5], [1-7, 9-7]).
constraints(15, [5-6, 7-6], [1-7, 9-7]).
constraints(11, [5-6, 7-7], [1-7, 9-7]).
constraints(13, [5-6, 7-7], [1-7, 9-7]). 
constraints(15, [5-6, 7-7], [1-7, 9-7]). 

constraints(11, [2-2, 5-4], [6-3, 8-3]).
constraints(13, [2-2, 5-4], [6-3, 8-3]).
constraints(15, [2-2, 5-4], [6-3, 8-3]).
constraints(11, [2-2, 5-6], [6-3, 8-3]).
constraints(13, [2-2, 5-6], [6-3, 8-3]).
constraints(15, [2-2, 5-6], [6-3, 8-3]).
constraints(11, [2-2, 7-5], [6-3, 8-3]).
constraints(13, [2-2, 7-5], [6-3, 8-3]).
constraints(15, [2-2, 7-5], [6-3, 8-3]).
constraints(11, [2-2, 7-7], [6-3, 8-3]).
constraints(13, [2-2, 7-7], [6-3, 8-3]).
constraints(15, [2-2, 7-7], [6-3, 8-3]).

constraints(11, [2-4, 5-4], [6-3, 8-3]).
constraints(13, [2-4, 5-4], [6-3, 8-3]).
constraints(15, [2-4, 5-4], [6-3, 8-3]).
constraints(11, [2-4, 5-6], [6-3, 8-3]).
constraints(13, [2-4, 5-6], [6-3, 8-3]).
constraints(15, [2-4, 5-6], [6-3, 8-3]).
constraints(11, [2-4, 7-5], [6-3, 8-3]).
constraints(13, [2-4, 7-5], [6-3, 8-3]).
constraints(15, [2-4, 7-5], [6-3, 8-3]).
constraints(11, [2-4, 7-7], [6-3, 8-3]).
constraints(12, [2-4, 7-7], [6-3, 8-3]).
constraints(13, [2-4, 7-7], [6-3, 8-3]). 

constraints(11, [2-6, 5-4], [6-3, 8-3]).
constraints(13, [2-6, 5-4], [6-3, 8-3]).
constraints(15, [2-6, 5-4], [6-3, 8-3]).
constraints(11, [2-6, 5-6], [6-3, 8-3]).
constraints(13, [2-6, 5-6], [6-3, 8-3]).
constraints(15, [2-6, 5-6], [6-3, 8-3]).
constraints(11, [2-6, 7-5], [6-3, 8-3]).
constraints(13, [2-6, 7-5], [6-3, 8-3]).
constraints(15, [2-6, 7-5], [6-3, 8-3]).
constraints(11, [2-6, 7-7], [6-3, 8-3]).
constraints(12, [2-6, 7-7], [6-3, 8-3]).
constraints(13, [2-6, 7-7], [6-3, 8-3]). 

constraints(11, [5-4, 7-2], [6-3, 8-3]).
constraints(13, [5-4, 7-3], [6-3, 8-3]).
constraints(11, [5-4, 7-5], [6-3, 8-3]).
constraints(13, [5-4, 7-5], [6-3, 8-3]).
constraints(15, [5-4, 7-5], [6-3, 8-3]).
constraints(15, [5-4, 7-6], [6-3, 8-3]).
constraints(11, [5-4, 7-7], [6-3, 8-3]).
constraints(13, [5-4, 7-7], [6-3, 8-3]). 
constraints(15, [5-4, 7-7], [6-3, 8-3]). 

constraints(11, [5-6, 7-2], [6-3, 8-3]).
constraints(13, [5-6, 7-3], [6-3, 8-3]).
constraints(11, [5-6, 7-5], [6-3, 8-3]).
constraints(13, [5-6, 7-5], [6-3, 8-3]).
constraints(15, [5-6, 7-5], [6-3, 8-3]).
constraints(15, [5-6, 7-6], [6-3, 8-3]).
constraints(11, [5-6, 7-7], [6-3, 8-3]).
constraints(13, [5-6, 7-7], [6-3, 8-3]). 
constraints(15, [5-6, 7-7], [6-3, 8-3]). 

constraints(11, [2-2, 5-4], [6-3, 8-5]).
constraints(13, [2-2, 5-4], [6-3, 8-5]).
constraints(15, [2-2, 5-4], [6-3, 8-5]).
constraints(11, [2-2, 5-6], [6-3, 8-5]).
constraints(13, [2-2, 5-6], [6-3, 8-5]).
constraints(15, [2-2, 5-6], [6-3, 8-5]).
constraints(11, [2-2, 7-5], [6-3, 8-5]).
constraints(13, [2-2, 7-5], [6-3, 8-5]).
constraints(15, [2-2, 7-5], [6-3, 8-5]).
constraints(11, [2-2, 7-7], [6-3, 8-5]).
constraints(13, [2-2, 7-7], [6-3, 8-5]).
constraints(15, [2-2, 7-7], [6-3, 8-5]).

constraints(11, [2-4, 5-4], [6-3, 8-5]).
constraints(13, [2-4, 5-4], [6-3, 8-5]).
constraints(15, [2-4, 5-4], [6-3, 8-5]).
constraints(11, [2-4, 5-6], [6-3, 8-5]).
constraints(13, [2-4, 5-6], [6-3, 8-5]).
constraints(11, [2-4, 7-5], [6-3, 8-5]).
constraints(13, [2-4, 7-5], [6-3, 8-5]).
constraints(15, [2-4, 7-5], [6-3, 8-5]).
constraints(11, [2-4, 7-7], [6-3, 8-5]).
constraints(12, [2-4, 7-7], [6-3, 8-5]).
constraints(13, [2-4, 7-7], [6-3, 8-5]). 

constraints(11, [2-6, 5-4], [6-3, 8-5]).
constraints(13, [2-6, 5-4], [6-3, 8-5]).
constraints(15, [2-6, 5-4], [6-3, 8-5]).
constraints(11, [2-6, 5-6], [6-3, 8-5]).
constraints(13, [2-6, 5-6], [6-3, 8-5]).
constraints(15, [2-6, 5-6], [6-3, 8-5]).
constraints(11, [2-6, 7-5], [6-3, 8-5]).
constraints(13, [2-6, 7-5], [6-3, 8-5]).
constraints(15, [2-6, 7-5], [6-3, 8-5]).
constraints(11, [2-6, 7-7], [6-3, 8-5]).
constraints(12, [2-6, 7-7], [6-3, 8-5]).
constraints(13, [2-6, 7-7], [6-3, 8-5]). 

constraints(11, [5-4, 7-2], [6-3, 8-5]).
constraints(13, [5-4, 7-3], [6-3, 8-5]).
constraints(11, [5-4, 7-5], [6-3, 8-5]).
constraints(13, [5-4, 7-5], [6-3, 8-5]).
constraints(15, [5-4, 7-5], [6-3, 8-5]).
constraints(15, [5-4, 7-6], [6-3, 8-5]).
constraints(11, [5-4, 7-7], [6-3, 8-5]).
constraints(13, [5-4, 7-7], [6-3, 8-5]). 
constraints(15, [5-4, 7-7], [6-3, 8-5]). 

constraints(11, [5-6, 7-2], [6-3, 8-5]).
constraints(13, [5-6, 7-3], [6-3, 8-5]).
constraints(11, [5-6, 7-5], [6-3, 8-5]).
constraints(13, [5-6, 7-5], [6-3, 8-5]).
constraints(15, [5-6, 7-5], [6-3, 8-5]).
constraints(15, [5-6, 7-6], [6-3, 8-5]).
constraints(11, [5-6, 7-7], [6-3, 8-5]).
constraints(13, [5-6, 7-7], [6-3, 8-5]). 
constraints(15, [5-6, 7-7], [6-3, 8-5]). 

constraints(11, [2-2, 5-4], [6-3, 8-7]).
constraints(13, [2-2, 5-4], [6-3, 8-7]).
constraints(15, [2-2, 5-4], [6-3, 8-7]).
constraints(11, [2-2, 5-6], [6-3, 8-7]).
constraints(13, [2-2, 5-6], [6-3, 8-7]).
constraints(15, [2-2, 5-6], [6-3, 8-7]).
constraints(11, [2-2, 7-5], [6-3, 8-7]).
constraints(13, [2-2, 7-5], [6-3, 8-7]).
constraints(15, [2-2, 7-5], [6-3, 8-7]).
constraints(11, [2-2, 7-7], [6-3, 8-7]).
constraints(13, [2-2, 7-7], [6-3, 8-7]).
constraints(15, [2-2, 7-7], [6-3, 8-7]).

constraints(11, [2-4, 5-4], [6-3, 8-7]).
constraints(13, [2-4, 5-4], [6-3, 8-7]).
constraints(15, [2-4, 5-4], [6-3, 8-7]).
constraints(11, [2-4, 5-6], [6-3, 8-7]).
constraints(13, [2-4, 5-6], [6-3, 8-7]).
constraints(15, [2-4, 5-6], [6-3, 8-7]).
constraints(11, [2-4, 7-5], [6-3, 8-7]).
constraints(13, [2-4, 7-5], [6-3, 8-7]).
constraints(15, [2-4, 7-5], [6-3, 8-7]).
constraints(11, [2-4, 7-7], [6-3, 8-7]).
constraints(12, [2-4, 7-7], [6-3, 8-7]).
constraints(13, [2-4, 7-7], [6-3, 8-7]). 

constraints(11, [2-6, 5-4], [6-3, 8-7]).
constraints(13, [2-6, 5-4], [6-3, 8-7]).
constraints(15, [2-6, 5-4], [6-3, 8-7]).
constraints(11, [2-6, 5-6], [6-3, 8-7]).
constraints(13, [2-6, 5-6], [6-3, 8-7]).
constraints(15, [2-6, 5-6], [6-3, 8-7]).
constraints(11, [2-6, 7-5], [6-3, 8-7]).
constraints(13, [2-6, 7-5], [6-3, 8-7]).
constraints(15, [2-6, 7-5], [6-3, 8-7]).
constraints(11, [2-6, 7-7], [6-3, 8-7]).
constraints(12, [2-6, 7-7], [6-3, 8-7]).
constraints(13, [2-6, 7-7], [6-3, 8-7]). 

constraints(11, [5-4, 7-2], [6-3, 8-7]).
constraints(13, [5-4, 7-3], [6-3, 8-7]).
constraints(11, [5-4, 7-5], [6-3, 8-7]).
constraints(13, [5-4, 7-5], [6-3, 8-7]).
constraints(15, [5-4, 7-5], [6-3, 8-7]).
constraints(15, [5-4, 7-6], [6-3, 8-7]).
constraints(11, [5-4, 7-7], [6-3, 8-7]).
constraints(13, [5-4, 7-7], [6-3, 8-7]). 
constraints(15, [5-4, 7-7], [6-3, 8-7]). 

constraints(11, [5-6, 7-2], [6-3, 8-7]).
constraints(13, [5-6, 7-3], [6-3, 8-7]).
constraints(11, [5-6, 7-5], [6-3, 8-7]).
constraints(13, [5-6, 7-5], [6-3, 8-7]).
constraints(15, [5-6, 7-5], [6-3, 8-7]).
constraints(15, [5-6, 7-6], [6-3, 8-7]).
constraints(11, [5-6, 7-7], [6-3, 8-7]).
constraints(13, [5-6, 7-7], [6-3, 8-7]). 
constraints(15, [5-6, 7-7], [6-3, 8-7]). 

constraints(11, [2-2, 5-4], [6-5, 8-3]).
constraints(13, [2-2, 5-4], [6-5, 8-3]).
constraints(15, [2-2, 5-4], [6-5, 8-3]).
constraints(11, [2-2, 5-6], [6-5, 8-3]).
constraints(13, [2-2, 5-6], [6-5, 8-3]).
constraints(15, [2-2, 5-6], [6-5, 8-3]).
constraints(11, [2-2, 7-5], [6-5, 8-3]).
constraints(13, [2-2, 7-5], [6-5, 8-3]).
constraints(15, [2-2, 7-5], [6-5, 8-3]).
constraints(11, [2-2, 7-7], [6-5, 8-3]).
constraints(13, [2-2, 7-7], [6-5, 8-3]).
constraints(15, [2-2, 7-7], [6-5, 8-3]).

constraints(11, [2-4, 5-4], [6-5, 8-3]).
constraints(13, [2-4, 5-4], [6-5, 8-3]).
constraints(15, [2-4, 5-4], [6-5, 8-3]).
constraints(11, [2-4, 5-6], [6-5, 8-3]).
constraints(13, [2-4, 5-6], [6-5, 8-3]).
constraints(15, [2-4, 5-6], [6-5, 8-3]).
constraints(11, [2-4, 7-5], [6-5, 8-3]).
constraints(13, [2-4, 7-5], [6-5, 8-3]).
constraints(15, [2-4, 7-5], [6-5, 8-3]).
constraints(11, [2-4, 7-7], [6-5, 8-3]).
constraints(12, [2-4, 7-7], [6-5, 8-3]).
constraints(13, [2-4, 7-7], [6-5, 8-3]). 

constraints(11, [2-6, 5-4], [6-5, 8-3]).
constraints(13, [2-6, 5-4], [6-5, 8-3]).
constraints(15, [2-6, 5-4], [6-5, 8-3]).
constraints(11, [2-6, 5-6], [6-5, 8-3]).
constraints(13, [2-6, 5-6], [6-5, 8-3]).
constraints(15, [2-6, 5-6], [6-5, 8-3]).
constraints(11, [2-6, 7-5], [6-5, 8-3]).
constraints(13, [2-6, 7-5], [6-5, 8-3]).
constraints(15, [2-6, 7-5], [6-5, 8-3]).
constraints(11, [2-6, 7-7], [6-5, 8-3]).
constraints(12, [2-6, 7-7], [6-5, 8-3]).
constraints(13, [2-6, 7-7], [6-5, 8-3]). 

constraints(11, [5-4, 7-2], [6-5, 8-3]).
constraints(13, [5-4, 7-3], [6-5, 8-3]).
constraints(11, [5-4, 7-5], [6-5, 8-3]).
constraints(13, [5-4, 7-5], [6-5, 8-3]).
constraints(15, [5-4, 7-5], [6-5, 8-3]).
constraints(15, [5-4, 7-6], [6-5, 8-3]).
constraints(11, [5-4, 7-7], [6-5, 8-3]).
constraints(13, [5-4, 7-7], [6-5, 8-3]). 
constraints(15, [5-4, 7-7], [6-5, 8-3]). 

constraints(11, [5-6, 7-2], [6-5, 8-3]).
constraints(13, [5-6, 7-3], [6-5, 8-3]).
constraints(11, [5-6, 7-5], [6-5, 8-3]).
constraints(13, [5-6, 7-5], [6-5, 8-3]).
constraints(15, [5-6, 7-5], [6-5, 8-3]).
constraints(15, [5-6, 7-6], [6-5, 8-3]).
constraints(11, [5-6, 7-7], [6-5, 8-3]).
constraints(13, [5-6, 7-7], [6-5, 8-3]). 
constraints(15, [5-6, 7-7], [6-5, 8-3]). 

constraints(11, [2-2, 5-4], [6-5, 8-5]).
constraints(13, [2-2, 5-4], [6-5, 8-5]).
constraints(15, [2-2, 5-4], [6-5, 8-5]).
constraints(11, [2-2, 5-6], [6-5, 8-5]).
constraints(13, [2-2, 5-6], [6-5, 8-5]).
constraints(15, [2-2, 5-6], [6-5, 8-5]).
constraints(11, [2-2, 7-5], [6-5, 8-5]).
constraints(13, [2-2, 7-5], [6-5, 8-5]).
constraints(15, [2-2, 7-5], [6-5, 8-5]).
constraints(11, [2-2, 7-7], [6-5, 8-5]).
constraints(13, [2-2, 7-7], [6-5, 8-5]).
constraints(15, [2-2, 7-7], [6-5, 8-5]).

constraints(11, [2-4, 5-4], [6-5, 8-5]).
constraints(13, [2-4, 5-4], [6-5, 8-5]).
constraints(15, [2-4, 5-4], [6-5, 8-5]).
constraints(11, [2-4, 5-6], [6-5, 8-5]).
constraints(13, [2-4, 5-6], [6-5, 8-5]).
constraints(15, [2-4, 5-6], [6-5, 8-5]).
constraints(11, [2-4, 7-5], [6-5, 8-5]).
constraints(13, [2-4, 7-5], [6-5, 8-5]).
constraints(15, [2-4, 7-5], [6-5, 8-5]).
constraints(11, [2-4, 7-7], [6-5, 8-5]).
constraints(12, [2-4, 7-7], [6-5, 8-5]).
constraints(13, [2-4, 7-7], [6-5, 8-5]). 

constraints(11, [2-6, 5-4], [6-5, 8-5]).
constraints(13, [2-6, 5-4], [6-5, 8-5]).
constraints(15, [2-6, 5-4], [6-5, 8-5]).
constraints(11, [2-6, 5-6], [6-5, 8-5]).
constraints(13, [2-6, 5-6], [6-5, 8-5]).
constraints(15, [2-6, 5-6], [6-5, 8-5]).
constraints(11, [2-6, 7-5], [6-5, 8-5]).
constraints(13, [2-6, 7-5], [6-5, 8-5]).
constraints(15, [2-6, 7-5], [6-5, 8-5]).
constraints(11, [2-6, 7-7], [6-5, 8-5]).
constraints(12, [2-6, 7-7], [6-5, 8-5]).
constraints(13, [2-6, 7-7], [6-5, 8-5]). 

constraints(11, [5-4, 7-2], [6-5, 8-5]).
constraints(13, [5-4, 7-3], [6-5, 8-5]).
constraints(11, [5-4, 7-5], [6-5, 8-5]).
constraints(13, [5-4, 7-5], [6-5, 8-5]).
constraints(15, [5-4, 7-5], [6-5, 8-5]).
constraints(15, [5-4, 7-6], [6-5, 8-5]).
constraints(11, [5-4, 7-7], [6-5, 8-5]).
constraints(13, [5-4, 7-7], [6-5, 8-5]). 
constraints(15, [5-4, 7-7], [6-5, 8-5]). 

constraints(11, [5-6, 7-2], [6-5, 8-5]).
constraints(13, [5-6, 7-3], [6-5, 8-5]).
constraints(11, [5-6, 7-5], [6-5, 8-5]).
constraints(13, [5-6, 7-5], [6-5, 8-5]).
constraints(15, [5-6, 7-5], [6-5, 8-5]).
constraints(15, [5-6, 7-6], [6-5, 8-5]).
constraints(11, [5-6, 7-7], [6-5, 8-5]).
constraints(13, [5-6, 7-7], [6-5, 8-5]). 
constraints(15, [5-6, 7-7], [6-5, 8-5]). 

constraints(11, [2-2, 5-4], [6-5, 8-7]).
constraints(13, [2-2, 5-4], [6-5, 8-7]).
constraints(15, [2-2, 5-4], [6-5, 8-7]).
constraints(11, [2-2, 5-6], [6-5, 8-7]).
constraints(13, [2-2, 5-6], [6-5, 8-7]).
constraints(15, [2-2, 5-6], [6-5, 8-7]).
constraints(11, [2-2, 7-5], [6-5, 8-7]).
constraints(13, [2-2, 7-5], [6-5, 8-7]).
constraints(15, [2-2, 7-5], [6-5, 8-7]).
constraints(11, [2-2, 7-7], [6-5, 8-7]).
constraints(13, [2-2, 7-7], [6-5, 8-7]).
constraints(15, [2-2, 7-7], [6-5, 8-7]).

constraints(11, [2-4, 5-4], [6-5, 8-7]).
constraints(13, [2-4, 5-4], [6-5, 8-7]).
constraints(15, [2-4, 5-4], [6-5, 8-7]).
constraints(11, [2-4, 5-6], [6-5, 8-7]).
constraints(13, [2-4, 5-6], [6-5, 8-7]).
constraints(15, [2-4, 5-6], [6-5, 8-7]).
constraints(11, [2-4, 7-5], [6-5, 8-7]).
constraints(13, [2-4, 7-5], [6-5, 8-7]).
constraints(15, [2-4, 7-5], [6-5, 8-7]).
constraints(11, [2-4, 7-7], [6-5, 8-7]).
constraints(12, [2-4, 7-7], [6-5, 8-7]).
constraints(13, [2-4, 7-7], [6-5, 8-7]). 

constraints(11, [2-6, 5-4], [6-5, 8-7]).
constraints(13, [2-6, 5-4], [6-5, 8-7]).
constraints(15, [2-6, 5-4], [6-5, 8-7]).
constraints(11, [2-6, 5-6], [6-5, 8-7]).
constraints(13, [2-6, 5-6], [6-5, 8-7]).
constraints(15, [2-6, 5-6], [6-5, 8-7]).
constraints(11, [2-6, 7-5], [6-5, 8-7]).
constraints(13, [2-6, 7-5], [6-5, 8-7]).
constraints(15, [2-6, 7-5], [6-5, 8-7]).
constraints(11, [2-6, 7-7], [6-5, 8-7]).
constraints(12, [2-6, 7-7], [6-5, 8-7]).
constraints(13, [2-6, 7-7], [6-5, 8-7]). 

constraints(11, [5-4, 7-2], [6-5, 8-7]).
constraints(13, [5-4, 7-3], [6-5, 8-7]).
constraints(11, [5-4, 7-5], [6-5, 8-7]).
constraints(13, [5-4, 7-5], [6-5, 8-7]).
constraints(15, [5-4, 7-5], [6-5, 8-7]).
constraints(15, [5-4, 7-6], [6-5, 8-7]).
constraints(11, [5-4, 7-7], [6-5, 8-7]).
constraints(13, [5-4, 7-7], [6-5, 8-7]). 
constraints(15, [5-4, 7-7], [6-5, 8-7]). 

constraints(11, [5-6, 7-2], [6-5, 8-7]).
constraints(13, [5-6, 7-3], [6-5, 8-7]).
constraints(11, [5-6, 7-5], [6-5, 8-7]).
constraints(13, [5-6, 7-5], [6-5, 8-7]).
constraints(15, [5-6, 7-5], [6-5, 8-7]).
constraints(15, [5-6, 7-6], [6-5, 8-7]).
constraints(11, [5-6, 7-7], [6-5, 8-7]).
constraints(13, [5-6, 7-7], [6-5, 8-7]). 
constraints(15, [5-6, 7-7], [6-5, 8-7]). 

constraints(11, [2-2, 5-4], [6-6, 8-3]).
constraints(13, [2-2, 5-4], [6-6, 8-3]).
constraints(15, [2-2, 5-4], [6-6, 8-3]).
constraints(11, [2-2, 5-6], [6-6, 8-3]).
constraints(13, [2-2, 5-6], [6-6, 8-3]).
constraints(15, [2-2, 5-6], [6-6, 8-3]).
constraints(11, [2-2, 7-5], [6-6, 8-3]).
constraints(13, [2-2, 7-5], [6-6, 8-3]).
constraints(15, [2-2, 7-5], [6-6, 8-3]).
constraints(11, [2-2, 7-7], [6-6, 8-3]).
constraints(13, [2-2, 7-7], [6-6, 8-3]).
constraints(15, [2-2, 7-7], [6-6, 8-3]).

constraints(11, [2-4, 5-4], [6-6, 8-3]).
constraints(13, [2-4, 5-4], [6-6, 8-3]).
constraints(15, [2-4, 5-4], [6-6, 8-3]).
constraints(11, [2-4, 5-6], [6-6, 8-3]).
constraints(13, [2-4, 5-6], [6-6, 8-3]).
constraints(15, [2-4, 5-6], [6-6, 8-3]).
constraints(11, [2-4, 7-5], [6-6, 8-3]).
constraints(13, [2-4, 7-5], [6-6, 8-3]).
constraints(15, [2-4, 7-5], [6-6, 8-3]).
constraints(11, [2-4, 7-7], [6-6, 8-3]).
constraints(12, [2-4, 7-7], [6-6, 8-3]).
constraints(13, [2-4, 7-7], [6-6, 8-3]). 

constraints(11, [2-6, 5-4], [6-6, 8-3]).
constraints(13, [2-6, 5-4], [6-6, 8-3]).
constraints(15, [2-6, 5-4], [6-6, 8-3]).
constraints(11, [2-6, 5-6], [6-6, 8-3]).
constraints(13, [2-6, 5-6], [6-6, 8-3]).
constraints(15, [2-6, 5-6], [6-6, 8-3]).
constraints(11, [2-6, 7-5], [6-6, 8-3]).
constraints(13, [2-6, 7-5], [6-6, 8-3]).
constraints(15, [2-6, 7-5], [6-6, 8-3]).
constraints(11, [2-6, 7-7], [6-6, 8-3]).
constraints(12, [2-6, 7-7], [6-6, 8-3]).
constraints(13, [2-6, 7-7], [6-6, 8-3]). 

constraints(11, [5-4, 7-2], [6-6, 8-3]).
constraints(13, [5-4, 7-3], [6-6, 8-3]).
constraints(11, [5-4, 7-5], [6-6, 8-3]).
constraints(13, [5-4, 7-5], [6-6, 8-3]).
constraints(15, [5-4, 7-5], [6-6, 8-3]).
constraints(15, [5-4, 7-6], [6-6, 8-3]).
constraints(11, [5-4, 7-7], [6-6, 8-3]).
constraints(13, [5-4, 7-7], [6-6, 8-3]). 
constraints(15, [5-4, 7-7], [6-6, 8-3]). 

constraints(11, [5-6, 7-2], [6-6, 8-3]).
constraints(13, [5-6, 7-3], [6-6, 8-3]).
constraints(11, [5-6, 7-5], [6-6, 8-3]).
constraints(13, [5-6, 7-5], [6-6, 8-3]).
constraints(15, [5-6, 7-5], [6-6, 8-3]).
constraints(15, [5-6, 7-6], [6-6, 8-3]).
constraints(11, [5-6, 7-7], [6-6, 8-3]).
constraints(13, [5-6, 7-7], [6-6, 8-3]). 
constraints(15, [5-6, 7-7], [6-6, 8-3]). 

constraints(11, [2-2, 5-4], [6-6, 8-5]).
constraints(13, [2-2, 5-4], [6-6, 8-5]).
constraints(15, [2-2, 5-4], [6-6, 8-5]).
constraints(11, [2-2, 5-6], [6-6, 8-5]).
constraints(13, [2-2, 5-6], [6-6, 8-5]).
constraints(15, [2-2, 5-6], [6-6, 8-5]).
constraints(11, [2-2, 7-5], [6-6, 8-5]).
constraints(13, [2-2, 7-5], [6-6, 8-5]).
constraints(15, [2-2, 7-5], [6-6, 8-5]).
constraints(11, [2-2, 7-7], [6-6, 8-5]).
constraints(13, [2-2, 7-7], [6-6, 8-5]).
constraints(15, [2-2, 7-7], [6-6, 8-5]).

constraints(11, [2-4, 5-4], [6-6, 8-5]).
constraints(13, [2-4, 5-4], [6-6, 8-5]).
constraints(15, [2-4, 5-4], [6-6, 8-5]).
constraints(11, [2-4, 5-6], [6-6, 8-5]).
constraints(13, [2-4, 5-6], [6-6, 8-5]).
constraints(15, [2-4, 5-6], [6-6, 8-5]).
constraints(11, [2-4, 7-5], [6-6, 8-5]).
constraints(13, [2-4, 7-5], [6-6, 8-5]).
constraints(15, [2-4, 7-5], [6-6, 8-5]).
constraints(11, [2-4, 7-7], [6-6, 8-5]).
constraints(12, [2-4, 7-7], [6-6, 8-5]).
constraints(13, [2-4, 7-7], [6-6, 8-5]). 

constraints(11, [2-6, 5-4], [6-6, 8-5]).
constraints(13, [2-6, 5-4], [6-6, 8-5]).
constraints(15, [2-6, 5-4], [6-6, 8-5]).
constraints(11, [2-6, 5-6], [6-6, 8-5]).
constraints(13, [2-6, 5-6], [6-6, 8-5]).
constraints(15, [2-6, 5-6], [6-6, 8-5]).
constraints(11, [2-6, 7-5], [6-6, 8-5]).
constraints(13, [2-6, 7-5], [6-6, 8-5]).
constraints(15, [2-6, 7-5], [6-6, 8-5]).
constraints(11, [2-6, 7-7], [6-6, 8-5]).
constraints(12, [2-6, 7-7], [6-6, 8-5]).
constraints(13, [2-6, 7-7], [6-6, 8-5]). 

constraints(11, [5-4, 7-2], [6-6, 8-5]).
constraints(13, [5-4, 7-3], [6-6, 8-5]).
constraints(11, [5-4, 7-5], [6-6, 8-5]).
constraints(13, [5-4, 7-5], [6-6, 8-5]).
constraints(15, [5-4, 7-5], [6-6, 8-5]).
constraints(15, [5-4, 7-6], [6-6, 8-5]).
constraints(11, [5-4, 7-7], [6-6, 8-5]).
constraints(13, [5-4, 7-7], [6-6, 8-5]). 
constraints(15, [5-4, 7-7], [6-6, 8-5]). 

constraints(11, [5-6, 7-2], [6-6, 8-5]).
constraints(13, [5-6, 7-3], [6-6, 8-5]).
constraints(11, [5-6, 7-5], [6-6, 8-5]).
constraints(13, [5-6, 7-5], [6-6, 8-5]).
constraints(15, [5-6, 7-5], [6-6, 8-5]).
constraints(15, [5-6, 7-6], [6-6, 8-5]).
constraints(11, [5-6, 7-7], [6-6, 8-5]).
constraints(13, [5-6, 7-7], [6-6, 8-5]). 
constraints(15, [5-6, 7-7], [6-6, 8-5]). 

constraints(11, [2-2, 5-4], [6-6, 8-7]).
constraints(13, [2-2, 5-4], [6-6, 8-7]).
constraints(15, [2-2, 5-4], [6-6, 8-7]).
constraints(11, [2-2, 5-6], [6-6, 8-7]).
constraints(13, [2-2, 5-6], [6-6, 8-7]).
constraints(15, [2-2, 5-6], [6-6, 8-7]).
constraints(11, [2-2, 7-5], [6-6, 8-7]).
constraints(13, [2-2, 7-5], [6-6, 8-7]).
constraints(15, [2-2, 7-5], [6-6, 8-7]).
constraints(11, [2-2, 7-7], [6-6, 8-7]).
constraints(13, [2-2, 7-7], [6-6, 8-7]).
constraints(15, [2-2, 7-7], [6-6, 8-7]).

constraints(11, [2-4, 5-4], [6-6, 8-7]).
constraints(13, [2-4, 5-4], [6-6, 8-7]).
constraints(15, [2-4, 5-4], [6-6, 8-7]).
constraints(11, [2-4, 5-6], [6-6, 8-7]).
constraints(13, [2-4, 5-6], [6-6, 8-7]).
constraints(15, [2-4, 5-6], [6-6, 8-7]).
constraints(11, [2-4, 7-5], [6-6, 8-7]).
constraints(13, [2-4, 7-5], [6-6, 8-7]).
constraints(15, [2-4, 7-5], [6-6, 8-7]).
constraints(11, [2-4, 7-7], [6-6, 8-7]).
constraints(12, [2-4, 7-7], [6-6, 8-7]).
constraints(13, [2-4, 7-7], [6-6, 8-7]). 

constraints(11, [2-6, 5-4], [6-6, 8-7]).
constraints(13, [2-6, 5-4], [6-6, 8-7]).
constraints(15, [2-6, 5-4], [6-6, 8-7]).
constraints(11, [2-6, 5-6], [6-6, 8-7]).
constraints(13, [2-6, 5-6], [6-6, 8-7]).
constraints(15, [2-6, 5-6], [6-6, 8-7]).
constraints(11, [2-6, 7-5], [6-6, 8-7]).
constraints(13, [2-6, 7-5], [6-6, 8-7]).
constraints(15, [2-6, 7-5], [6-6, 8-7]).
constraints(11, [2-6, 7-7], [6-6, 8-7]).
constraints(12, [2-6, 7-7], [6-6, 8-7]).
constraints(13, [2-6, 7-7], [6-6, 8-7]). 

constraints(11, [5-4, 7-2], [6-6, 8-7]).
constraints(13, [5-4, 7-3], [6-6, 8-7]).
constraints(11, [5-4, 7-5], [6-6, 8-7]).
constraints(13, [5-4, 7-5], [6-6, 8-7]).
constraints(15, [5-4, 7-5], [6-6, 8-7]).
constraints(15, [5-4, 7-6], [6-6, 8-7]).
constraints(11, [5-4, 7-7], [6-6, 8-7]).
constraints(13, [5-4, 7-7], [6-6, 8-7]). 
constraints(15, [5-4, 7-7], [6-6, 8-7]). 

constraints(11, [5-6, 7-2], [6-6, 8-7]).
constraints(13, [5-6, 7-3], [6-6, 8-7]).
constraints(11, [5-6, 7-5], [6-6, 8-7]).
constraints(13, [5-6, 7-5], [6-6, 8-7]).
constraints(15, [5-6, 7-5], [6-6, 8-7]).
constraints(15, [5-6, 7-6], [6-6, 8-7]).
constraints(11, [5-6, 7-7], [6-6, 8-7]).
constraints(13, [5-6, 7-7], [6-6, 8-7]). 
constraints(15, [5-6, 7-7], [6-6, 8-7]). 
