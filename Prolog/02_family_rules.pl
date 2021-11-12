/*
Rules for realtionships within a family:
    brothers(X, Y)
    brother(X, Y)
    syster(X, Y)
    grandfather(X, Y)
    grandmother(X, Y)
    grandchild(X, Y)
    granddaughter(X, Y)
    uncle(X, Y)
    aunt(X, Y)
Gilberto Echeverria
06/10/2020
*/

%%%% RULES %%%%
siblings(X, Y) :-
    mother(Z, X),
    mother(Z, Y),
    father(W, X),
    father(W, Y),
    X \= Y.

sister(X, Y) :-
    female(X),
    siblings(X, Y).

brother(X, Y) :-
    male(X),
    siblings(X, Y).

% Maternal grandmother
grandmother(X, Y) :-
    mother(X, Z),
    mother(Z, Y).

% Paternal grandfather
grandmother(X, Y) :-
    mother(X, Z),
    father(Z, Y).

grandfather(X, Y) :-
    father(X, Z),
    mother(Z, Y).

grandfather(X, Y) :-
    father(X, Z),
    father(Z, Y).

aunt(X, Y) :-
    sister(X, Z),
    mother(Z, Y).

aunt(X, Y) :-
    sister(X, Z),
    father(Z, Y).

