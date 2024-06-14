len([],0).
len([_|T],N) :- len(T,M), N  is M+1.
pack([],[]) :- !.
pack([H],[[H]]):- !.
pack([H,H|T],[[H|T1]|T2]) :- !,pack([H|T],[T1|T2]).
pack([H,H1|T],[[H]|T1]) :- H\=H1, pack([H1|T],T1).

encode(L,LL) :- pack(L,PL), myfunc(PL,LL).
myfunc([],[]):- !.
myfunc([[A|T2]|T],[[N,A]|T1]) :- len([A|T2],N),myfunc(T,T1).