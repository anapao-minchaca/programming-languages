/* 
First example in prolog

Ana Paola Minchaca
2021-11-05
*/

% Fact
% socrates is a man
man(socrates).
man(plato).

% Rule
% X is mortal if X is a man
mortal(X) :- man(X).