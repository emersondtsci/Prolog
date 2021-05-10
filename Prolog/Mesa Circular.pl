%fatos
direita(maria,joao).
direita(jose,maria).
direita(julia,jose).
direita(jorge,julia).
direita(ana,jorge).
direita(iris,ana).
direita(joao,iris).

%regras

%X esta a esquerda de Y se Y esta á direita de X
esquerda(X, Y) :- direita(Y,X).

%X é vizinho de Y e Z se X esta a direita Z e Y esta a esquerda de Z 
%e Y esta a direita de Z e X esta a esquerda de Z e com X e Y e Z diferentes  
vizin(X, Y, Z) :- direita(X, Z),esquerda(Y, Z); direita(Y, Z), esquerda(X, Z), X\==Y, Z\==Y, X\==Z.

%X esta ao lado de Y se X esta a direita de Y ou X esta a esquerda de Y 
ao_lado(X,Y) :- direita(X,Y); esquerda(X,Y).


%Consultas
%direita(X,Y).
%esquerda(X,Y).
%vizin(X,Y,Z).
%ao_lado(X,Y)
