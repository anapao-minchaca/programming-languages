/*
HW 9: Prolog predicates that work with lists

Ana Paola Minchaca 
2021-11-12
*/

/*
    FUNCTIONS: in_list
    INPUT: a list and an element
    OUTPUT: true or false, depending if the element can be found
*/

% if the element is at the head of a list
in_list([Head|_], Head) :- !.
% if the element is at the tail of the list
in_list([_|Tail], Head) :-
    in_list(Tail, Head).

/*
    FUNCTIONS: element_at
    INPUT: an index, a list, variable to generate list
    OUTPUT: list containing the numbers in the fibonacci sequence
*/

% we find the element
element_at(0, [Head|_], Head) :- !.
% index is positive, we iterate normally
element_at(N, [_|Tail], Head) :-
    N >= 0,
    N1 is N-1,
    element_at(N1, Tail, Head),
    !.
% if index is negative, calculate length and sum it to the index, this way we can iterate 
element_at(N, L, Head) :-
    N < 0,
    length(L, L1),
    N1 is L1 + N,
    N1 >= 0,
    element_at(N1, L, Head),
    !.

/*
    FUNCTIONS: range
    INPUT: starting, ending, increment, variable to generate list
    OUTPUT: list of numbers from start to finisg
*/

% if the increment is positive and start is higher or equals the end
range(Start, End, Step, []) :-
    Start >= End,
    Step > 0,
    !.
range(Start, End, Step, [Start|Tail]) :-
    Start > End,
    Next is Start + Step,
    range(Next, End, Step, Tail),
    !.
% if the increment is negative and start is smaller or equals the end
range(Start, End, Step, []) :-
    Start =< End,
    Step < 0,
    !.
range(Start, End, Step, [Start|Tail]) :-
    Start < End,
    Next is Start + Step,
    range(Next, End, Step, Tail),
    !.

/*
    FUNCTIONS: remove_doubles
    INPUT: a list, variable to generate list
    OUTPUT: list without contiguous duplicated elements
*/

% case for empty list
remove_doubles([], []).
% case where tail doesn't start with the head, remove doubles
% also case with single element list
remove_doubles([Head|Tail], [Head|Tail1]) :-
    Tail \= [Head|_],
    remove_doubles(Tail, Tail1),
    !.
% case when tail starts with the head, include it when removing doubles
remove_doubles([Head, Head|Tail], R) :-
    remove_doubles([Head|Tail], R),
    !.

/*
    FUNCTIONS: fibonacci
    INPUT: a positive integer, variable to generate list
    OUTPUT: list containing the numbers in the fibonacci sequence
*/

% base case with 0
fibonacci(0, [0]) :- !.
% base case with 1
fibonacci(1, [0, 1]) :- !.
% all other cases that aren't 0 or 1
fibonacci(N, F) :-
    N > 1,
    fibonacci(N, R, 1, [1, 0]),
    % reverse the results
    reverse(R, F).

fibonacci(N, R, N, R).
fibonacci(N, R, N1, [X, Y |Fs]) :-
    N > N1,
    N2 is N1 + 1,
    Z is X + Y,
    % use tail recursion to make the list
    fibonacci(N, R, N2, [Z, X, Y|Fs]),
    !.

fibonacci1(0, [0]).
fibonacci1(1, [1,0]).
fibonacci1(N, [R,X,Y|Zs]) :-
    N > 1,
    N1 is N - 1,
    fibonacci1(N1, [X,Y|Zs]),
    R is X + Y.