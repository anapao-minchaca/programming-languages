/*
Practicing lists

Ana Paola Minchaca
2021-12-11
*/

% length of a list
len(List, Len) :- len(List, 0, Len).
% Base case of an empty list
len([], Acc, Acc).
% Recursive rule
len([_Head|Tail], Acc, Len) :-
    Acc1 is Acc + 1,
    len(Tail, Acc1, Len).

% Add all the values in a list
my_sum_list(List, Len) :- my_sum_list(List, 0, Len).
% Base case of an empty list
my_sum_list([], Acc, Acc).
% Recursive rule
my_sum_list([Head|Tail], Acc, Len) :-
    number(Head),
    !,
    Acc1 is Acc + Head,
    my_sum_list(Tail, Acc1, Len).
my_sum_list([Head|Tail], Acc, Len) :-
    % Negating the result of number(Head)
    % True only if Prolog could not prove that Head is a number
    \+ number(Head),
    Acc1 is Acc + 1,
    my_sum_list(Tail, Acc1, Len).

% append two lists to create a new one with the contents of both
my_append([], List2, List2).
my_append([Head|Tail], List2, [Head|Temp]) :-
    my_append(Tail, List2, Temp).


