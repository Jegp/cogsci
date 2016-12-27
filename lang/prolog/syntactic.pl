% nano syntax

% --------- language -------------

s --> ss,[and],s.
s --> ss.
ss --> np,vp.
vp --> [is],adj.
vp --> [smiles].
np --> [sue].
np --> [bob].
adj --> [belgian].
adj --> [angry].

% --------- the end -------------

% nano semantics

% --------- model -------------

means(sue,e1).
means(bob,e2).

means(smiles,[e1,e2]).
means(angry,[e1]).
means(belgian,[e2]).

% --------- the end -------------


% first order propositional logic

% --------- evaluation -------------

eval(S):- s(S,[]), semeval(S); write('no!').

semeval(In):-
  append(L1,[is,A|L2],In),
  append(L1,[A|L2],Out),
  semeval(Out).
semeval(In):-
  append(L1,[A,B|L2],In),
  append(L1,[1|L2],Out),
  means(A,Asem), means(B,Bsem),
  ( member(Asem,Bsem); member(Bsem,Asem) ),
  semeval(Out).
semeval(In):-
  append(L1,[1,and,1|L2],In),
  append(L1,[1|L2],Out),
  semeval(Out).
semeval([1]):- write('yes!').

% --------- the end -------------
