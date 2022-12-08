% 1. Pertenece

pertenece(X, [X|L]).
pertenece(X, [Y|L]):- pertenece(X,L)

% 2. size
size([],0). % Si es una lista vacia regresa cero
size([_|XS],U):- size(XS,T), U is T+1.
% Separa la lista y va contando los elementos hasta que llega 
% a una lista vacia

% 3. Concatenación 
concatena([], L, L).
concatena([X|L1], L2, [X|L3]) :- concatena(L1, L2, L3).

% 4. Eliminar
elimina(X, [X|Xs], Xs). % si el elemento a eliminar es el primero, regresa la cola
elimina(X, [Y|Ys], [Y|R]):-
          elimina(X, Ys, R).

% 5. Agregar un elemento a una lista
agregar(E,L,[E|L]). % agrega el elemento E a la nueva lista Y
agregar(E,[X|Y],[X|Z]):-agregar(E,Y,Z).

% 6. Pares e impares
separar([],[],[]).
    separar([X|XS],[X|T1],T2):- X mod 2 =:= 0,separar(XS,T1,T2).
    separar([X|XS],T1,[X|T2]):-separar(XS,T1,T2).

% 7. Ascendente
ascendente([X]).
    ascendente([X1,X2|TAIL]):- X1 =< X2, ascendente([X2|TAIL]).

% 8. Descendente
 descendente([X]).
    descendente([X1,X2|TAIL]):- X1 >= X2, descendente([X2|TAIL]).

% 9. aplanar
aplanar([],[]).
aplanar([X|R],[X|P]):-atomic(X),aplanar(R,P).
aplanar([X|R],P):-not atomic(X),aplanar(X,P-X),
        aplanar(R,P-R),append(P-X,P-R,P).

% 10. Menor que Head
menorHead([],[]).
menorHead([_],[]).
menorHead([X1,X2|Tail],[X2|L]):-X1>X2, menorHead([X1|Tail],L).
% Busca los elemntos menores al head y los 
menorHead([X1,X2|Tail],L):- X1<X2, menorHead([X1|Tail],L).

% 11. Mayor que Head 
mayorHead([],[]).
mayorHead([_],[]).
mayorHead([X1,X2|Tail],[X2|L]):-X1<X2, mayorHead([X1|Tail],L).
mayorHead([X1,X2|Tail],L):- X1>X2, mayorHead([X1|Tail],L).

% 12. Invertir
invertir([],[]).
invertir([H|T],L) :- invertir(T,Z), append(Z,[H],L).