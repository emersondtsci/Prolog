%fatos
homem(abraham).
homem(clancy).
homem(herb).
homem(homer).
homem(bart).

mulher(mona).
mulher(jackie).
mulher(marge).
mulher(patty).
mulher(selma).
mulher(lisa).
mulher(maggie).
mulher(ling).

progenitor(abraham, herb).
progenitor(abraham, homer).
progenitor(mona, herb).
progenitor(mona, homer).

progenitor(clancy, marge).
progenitor(clancy, patty).
progenitor(clancy, selma).
progenitor(jackie, marge).
progenitor(jackie, patty).
progenitor(jackie, selma).

progenitor(selma, ling).

progenitor(homer, bart).
progenitor(homer, lisa).
progenitor(homer, maggie).
progenitor(marge, bart).
progenitor(marge, lisa).
progenitor(marge, maggie).


%regras

%quem é pai de quem
pai(X, Y) :- homem(X), progenitor(X, Y).
%quem é pai de quem
mae(X, Y) :- mulher(X), progenitor(X, Y).

%quem são os pais de quem
pais(X, M, P) :- mae(M, X), pai(P, X).

%quem é filho de quem
filho(X, Y) :- homem(X), progenitor(Y, X).
%quem é filha de quem
filha(X, Y) :- mulher(X), progenitor(Y, X).

%quem é irmão de quem
irmao(X, Y) :- homem(X), pais(X, M, P), pais(Y, M, P), X\==Y.
%quem é irmã de quem
irma(X, Y) :- mulher(X), pais(X, M, P), pais(Y, M, P), X\==Y.

%quem são irmãos
irmaos(X,Y) :- pais(X, K, J), pais(Y, K, J), X\==Y.

%quem é primo de quem
primo(X, Y) :- homem(X), progenitor(Z, X), progenitor(R, Y), irmaos(Z,R),R\==Z.
%quem é prima de quem
prima(X, Y) :- mulher(X), progenitor(Z, X), progenitor(R, Y), irmaos(Z,R), R\==Z.

%quem é avô de quem
avo(X, Y) :- homem(X), progenitor(X,Z), progenitor(Z,Y).
%quem é avó de quem
avoo(X, Y) :- mulher(X), progenitor(X, Z), progenitor(Z, Y).

%quem é tio de quem
tio(X, Y) :- homem(X), irmaos(X,Z), progenitor(Z, Y).
%quem é tia de quem
tia(X, Y) :- mulher(X), progenitor(Z, Y), irmaos(X,Z).

%Consultas

%mulher(X).
%progenitor(X,selma).
%mae(X,Y).
%filho(bart,X).
%irmaos(X,Y).
%tio(X,Y).
%tia(patty,Y).
%primo(X,Y).
%avo(X,Y).
