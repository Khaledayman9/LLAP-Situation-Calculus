:- include('KB.pl').
%:- include('KB2.pl').

%initial_state
state(F, M , E, false, false, s0):-
	(food(F), materials(M) , energy(E)).

state(F, M, E, B1, B2, result(A,S)):-
	(A = reqf, state(F1, M, E, B1, B2, S), F is F1 + 1);
	(A = reqm, state(F, M1, E, B1, B2, S), M is M1 + 1);
	(A = reqe, state(F, M, E1, B1, B2, S), E is E1 + 1);
	(A = b1, state(F1, M1, E1, false, B2, S), build1(L,P,R), F1 >= L, M1 >= P, E1>= R,
	F is (F1 - L), M is (M1 - P), E is (E1 - R), B1 = true);
	(A = b2, state(F1, M1, E1, B1, false, S), build2(L,P,R), F1 >= L, M1 >= P, E1>= R,
	F is (F1 - L), M is (M1 - P), E is (E1 - R), B2 = true).

%goal_condition	
goal1(S):-
	state(_,_,_,true,true,S).
	
ids(X,L):-
	(call_with_depth_limit(goal1(X),L,R), number(R));
	(call_with_depth_limit(goal1(X),L,R), R=depth_limit_exceeded, L1 is L+1, ids(X,L1)).
	
goal(S):-
	ids(S,1).
	
