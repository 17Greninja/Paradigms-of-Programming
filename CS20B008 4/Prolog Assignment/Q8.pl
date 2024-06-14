merge([],X,X):-!.
merge(X,[],X):-!.
merge([H1|T1],[H2|T2],[H1|T]) :- H1<H2, merge(T1,[H2|T2],T),!.
merge([H1|T1],[H2|T2],[H2|T]) :- H1>=H2, merge([H1|T1],T2,T).