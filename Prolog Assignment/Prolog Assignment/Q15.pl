myIsPrime(2):-!.
myIsPrime(X) :- myfunc(X,2).
myfunc(X,X).
myfunc(X,2) :- !,not(0 is X mod 2), Y is 3,myfunc(X,Y).
myfunc(X,Y) :- not(0 is X mod Y), K is Y+1,myfunc(X,K).
prime_factors(1,[]):-!.
prime_factors(X,[X]):-myIsPrime(X),!.
prime_factors(N,L) :- Z is 2,getPrimes(N,L,Z).
getPrimes(1,[],_):-!.
getPrimes(N,[H|T],H) :- 0 is N mod H,Y is N // H,!, getPrimes(Y,T,H).
getPrimes(N,T,H) :- X is H+1,getPrimes(N,T,X).