
mmm(aaa).
man(X):-mmm(X),write(X).
pr1:-functor(a(b,c,d),F,N),write(F),nl,write(N).
pr2:-functor(X,pr,2),write(X).
pr3:-read(A),steal_predicat(A,B),write(B),call(B).
steal_predicat(A,B):-functor(A,F,N),functor(B,F,N).
pr4(Y):-read(A),functor(A,F,N),arg(1,A,X),write(F),write(X),
		name(F,List),name(X,Arg),append(List,[40],X1),append(X1,Arg,X2),
		append(X2,[41],X3),name(X4,X3),asserta(X4),man(Y).
		
		
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

pr5:-read_str(A,N),name(Term,A),call(dynamic pr/1),asserta(pr(Term)),listing(pr).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

build_all_razm_p:-
		read_str(A,N),read(K),b_a_rp(A,K,[]).
		
b_a_rp(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

build_all_razm:-
		read_str(A,N),read(K),b_a_r(A,[]).
in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).
b_a_r([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,Perm):-in_list_exlude(A,El,A1),b_a_r(A1,[El|Perm]).


sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,K,B):-read(X),append(B,[X],B1),K1 is K+1,r_list(A,N,K1,B1).

pr_subset:-read(N),r_list(A,N),sub_set(B,A),write(B),nl,fail.
