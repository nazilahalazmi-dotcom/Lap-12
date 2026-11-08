% Lab 10 - Graphs
% Finding paths between different cities
% Directed graph facts

edge('Makkah', 'Madinah').
edge('Madinah', 'Makkah').

edge('Makkah', 'Riyadh').

edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Tabuk', 'Taif').
edge('Taif', 'Tabuk').

edge('Taif', 'Dammam').

edge('Al-Qatif', 'Madinah').
edge('Al-Qatif', 'Dammam').
edge('Dammam', 'Al-Qatif').

edge('Dammam', 'Riyadh').
edge('Riyadh', 'Dammam').

% Find a path between two cities

travel(From, To, Path) :-
    path(From, To, [From], ReversePath),
    reverse(ReversePath, Path).

% Base case: starting city is the destination

path(X, X, Visited, Visited).

% Recursive case: move to a connected city
% without visiting the same city again

path(X, Y, Visited, Path) :-
    edge(X, Z),
    \+ member(Z, Visited),
    path(Z, Y, [Z|Visited], Path).