pack([],[]) :- !.
pack([H],[[H]]):- !.
pack([H,H|T],[[H|T1]|T2]) :- !,pack([H|T],[T1|T2]).
pack([H,H1|T],[[H]|T1]) :- H\=H1, pack([H1|T],T1),!.