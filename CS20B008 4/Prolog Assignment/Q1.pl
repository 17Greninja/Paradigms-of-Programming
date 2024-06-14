my_append([],Q,Q).
my_append([H | P], Q, [H | R]) :- my_append(P,Q,R).
reverse([],[]).
reverse([H|T],X) :- reverse(T,Y),my_append(Y,[H],X).