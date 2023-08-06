of_int(0,0):-!.
of_int(X,s(Y)) :- Z is X-1,of_int(Z,Y).
to_int(0,0):-!.
to_int(s(X),Y) :- to_int(X,Z),Y is Z+1.