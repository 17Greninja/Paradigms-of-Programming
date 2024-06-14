len([],0).
len([_|T],N) :- len(T,M), N  is M+1.
my_append([],Q,Q).
my_append([H | P], Q, [H | R]) :- my_append(P, Q, R).
my_prefix(X,Z) :- my_append(X,_,Z).
my_suffix(Y,Z) :- my_append(_,Y,Z).
partition([],[],[]):-!.
partition([H],[H],[]):-!.
partition(L,P,S) :- my_prefix(P,L), my_suffix(S,L), len(L,N), M is div(N,2), len(P,M), K is N-M, len(S,K),!.