odnogrupniki(prihodko,doncov).
p(a,b,c,d,e,f).
odnogrupniki(doncov,blinnikov).
odnogrupniki(doncov,postnov).
odnogrupniki(doncov,kozel).
odnogrupniki(blinnikov,tolstikov).
p(doncov,b,c,d,e,f).
nok(X,Y,Z):-nod(X,Y,D),Z is X*Y/D.
nod(X,0,X):-!.
nod(X,Y,Z):-R is X mod Y,nod(Y,R,Z).
in(X,[X|_]).
in(X,[_|T]):-in(X,T).
cn2(S,C):-in(X,S),in(Y,S),append([X],[Y],C).

