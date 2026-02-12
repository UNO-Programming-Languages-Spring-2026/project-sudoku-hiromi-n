% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
% Add Initial state to current run
sudoku(X, Y, N) :- initial(X, Y, N).

% Generator. For every cell X,Y between 1 and 9, we assign it 1 number between 1 and 9
{ sudoku(X,Y, N) : N = 1..4 } = 1 :- X=1..4, Y=1..4 .

% Constraint. Dissallows cells in row X from having the same number
:- sudoku(X, Y, N), sudoku(X, Y', N), not Y=Y'.

% Constraint. Dissallows cells in column Y from having the same number
:- sudoku(X, Y, N), sudoku(X', Y, N), not X=X'.

% Constraint. Cannot have the same number for each group.
:- sudoku(X, Y, N), sudoku(X', Y', N), (X,Y) != (X',Y'),
(( (X-1)/2)*2 + (Y-1)/2) = (( (X'-1)/2)*2 + (Y'-1)/2).

