my_append([],Q,Q).
my_append([H | P], Q, [H | R]) :- my_append(P, Q, R).
my_flatten([],[]) :- !.
my_flatten([L|LL],FL) :- !,my_flatten(L,HL), my_flatten(LL,TL), my_append(HL,TL,FL).
my_flatten(L,[L]) :- !.