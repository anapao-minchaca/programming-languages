/*
Rules to compute the factorial of a number

Ana Paola Minchaca 
2021-11-09
*/

% base case (fact)
% using the 'cut' (!) to stop backtracking
factorial(0, 1) :- !.

% recursive case (rule)
factorial(N, R) :- 
    N > 0,
    N1 is N - 1,
    factorial(N1, T),
    R is N * T. 

% Tail recursion
% Call the relation that has an accumulator
fact(N, R) :- fact(N, 1, R).
% Relation using accumulator for tail recursion
% Use the same variable to give a value to the result
fact(0, A, A) :- !.
fact(N, A, R) :-
    N > 0,
    N1 is N - 1,
    A1 is A * N,
    fact(N1, A1, R).