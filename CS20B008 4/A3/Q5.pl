natural_number(0).
natural_number(s(X)):-natural_number(X).
plus(0,Y,Y).
plus(s(X),Y,s(Z)) :- plus(X,Y,Z).
mult(_,0,0):-!.
mult(X,s(Y),Z) :- mult(X,Y,K), plus(K,X,Z).