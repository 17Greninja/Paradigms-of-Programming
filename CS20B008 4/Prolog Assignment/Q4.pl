natural_number(0).
natural_number(s(X)):-natural_number(X).

plus(s(0),Y,s(Y)):-!.
plus(0,Y,Y):-!.
plus(s(X),Y,s(Z)) :- plus(X,Y,Z).