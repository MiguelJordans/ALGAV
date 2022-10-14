soma([], 0) :- !.
soma([H|T], S) :-
    soma(T, S1),
    S is H+S1.

quantElem([], 0) :- !.
quantElem([_|T], Q) :-
    quantElem(T, Q1),
    Q is Q1+1.

media([H|L], M) :-
    soma([H|L], RS),
    quantElem([H|L], RQ),
    M is RS/RQ.

menor([X],X):- !.
menor([H|T],N):-
              menor(T,N1),(
              (N1 > H),
              N is H;
              N is N1),
              !.


contEle([],0,0):-!.
contEle([H|T],P,I):-
                  contEle(T,P1,I1),
                  X is H mod 2,
                  ((X \== 0,
                   !,
                   I is I1 + 1,
                   P is P1);
                   (P is P1 +1,
                    I is I1)).


menorElemLista([],[]):-!.
menorElemLista([H|T],[D|L]):-
                     menor([H|T],N),
                     !,
                     createList([H|T],[D|L],N).

createList([],[],_):-!.
createList([_|T],[D|L],N):-
                         D is N,
                         createList(T,L).

membro(X,[X|_]).
membro(X,[_|L]):- membro(X,L).

saber_iguais([]):-fail.
saber_iguais([H|T]):-
    membro(H,T),!,saber_iguais(T).

%d

apaga1(_,[],[]).
apaga1(X,[X|L],L):-!.
apaga1(X,[Y|L],[Y|M]):- apaga1(X,L,M).

menor_frente(L,L1):- menor(L,M), apaga(M,L,L2), L1 = [M|L2], !.

concatena([ ],L,L).
concatena([A|B],C,[A|D]):-concatena(B,C,D).

inverte(L,LI):- inverte1(L,[ ],LI).
inverte1([ ],L,L).
inverte1([X|L],L2,L3):- inverte1(L,[X|L2],L3).

apaga(_,[ ],[ ]).
apaga(X,[X|L],M):-!,apaga(X,L,M).
apaga(X,[Y|L],[Y|M]):-apaga(X,L,M).


substitui(_,_,[],[]):- !.
substitui(X,Y,[Z|L],[Z|L1]):- substitui(X,Y,L,L1).
substitui(X,Y,[X|L],[Y|L1]):- !,substitui(X,Y,L,L1).

insere(X,1,L,[X|L]):-!.
insere(X,N,[H|T],[H|T1]):- N1 is N-1, insere(X,N1,T,T1).


difList([],[],_).
difList([_|T1],[_|T2],R):-
    T1 \== T2,
    (\+ member(T1,R),
     difList(T1,T2,R)
    ;
    \+ member(T2,R),
    difList(T1,T2,R)
    ).















