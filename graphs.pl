read_str(A):-get0(X),r_str(X,A,[]).

del_1st([H|T],T).

r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).

get_graph_edges(V,E):-get_V(V),write(V),nl,write("Edges"),get_edges(V,E).
get_V(V):-read(N),write("Vertexes"),nl,N1 is N+1,get_V(V1,N1),del_1st(V1,V).
get_V([],0):-!.
get_V([H|T],N):-read_str(X),name(H,X),N1 is N-1,get_V(T,N1).

get_edges(V,E):-read(M),get0(X),get_edges(V,E,[],M,0).
get_edges(V,E,E,M,M):-!.
get_edges(V,E,Edges,M,Count):-get_edge(V,Edge),append(Edges,[Edge],E1),
							Count1 is Count+1,get_edges(V,E,E1,M,Count1).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

append1([],X,X):-!.
append1([H|T],X,[H |Z]):-append1(T,X,Z).							

check_vertex([V1|_],V1):-!.
check_vertex([_|T],V1):-check_vertex(T,V1).
							
get_edge(V,[V1,V2]):-write("Edge"),nl,read_str(X),name(V1,X),check_vertex(V,V1),
						read_str(Y),name(V2,Y),check_vertex(V,V2).

gamilton:-get_graph_edges(V,E),gamilton(V,E).

gamilton(V,E):-b_a_r(V,W,Way),way_check(Way,E),write(Way).

way_check([H|T],E):-append1([H|T],[H],Way),w_c(Way,E).
w_c([_],_):-!.
w_c([V1,V2|T],E):-in_list(E,[V1,V2]),w_c([V2|T],E).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

b_a_r([],Perm1,Perm1).
b_a_r(A,Perm,Perm1):-in_list_exlude(A,El,A1),b_a_r(A1,[El|Perm],Perm1).

euler:-get_graph_edges(V,E),euler(V,E).
euler(V,E):-b_a_r(E,W,Way),way_edge_check(Way),write(Way).
way_edge_check([H|T]):-append1([H|T],[H],Way),w_e_c(Way).
w_e_c([_]):-!.
w_e_c([[_,X]|[[X|Y]|Tail]]):-w_e_c([[X|Y]|Tail]).


euler_N:-get_graph_edges(V,E),euler_N(V,E).
euler_N(V,E):-b_a_r(E,W,Way),way_edge_check_N(Way),write(Way).
way_edge_check_N([H|T]):-append1([H|T],[H],Way),w_e_c_N(Way).
w_e_c_N([_]):-!.
w_e_c_N([[_,X]|[[X,Y]|Tail]]):-w_e_c_N([[X,Y]|Tail]).
w_e_c_N([[_,X]|[[Y,X]|Tail]]):-w_e_c_N([[X,Y]|Tail]).

in_list1([El|_],El):-!.
in_list1([_|T],El):-in_list1(T,El).
raskras(K):-get_graph_edges(V,E),make_ar(K,C),raskras(V,E,C,[],Itog),write(Itog).
make_ar(0,[]):-!.
make_ar(K,[K|Tail]):-K1 is K-1,make_ar(K1,Tail).
raskras([],_,C,Itog,Itog).
raskras([V|Vtail],E,C,Ras,Itog):-
	in_list(C,Color),check_color(V,E,Color,Ras),append1(Ras,[[V,Color]],Ras1),
	raskras(Vtail,E,C,Ras1,Itog).

check_color(_,_,_,[]):-!.
check_color(V,E,C1,[[_,C2]|Tail]):-C1\=C2,check_color(V,E,C1,Tail),!.
check_color(V,E,Col,[[Ver,Col]|Tail]):-
	not(in_list1(E,[V,Ver])),not(in_list1(E,[Ver,V])),
	check_color(V,E,Col,Tail).

make_way:-
	get_graph_edges(V,E),write("Otkuda"),nl,read_str(X),name(I,X),
	write("Kuda"),nl,read_str(X),name(S,X),make_way(V,E,I,S,[],


