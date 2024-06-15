# LLAP-Situation-Calculus
A logic-based agent using Prolog to solve a simplified version of a planning problem akin to the LLAP agent described previously. The agent reasons using situation calculus and aims to construct specific types of buildings under simplified conditions.

# Description
Implementing a logic-based version of the LLAP agent. This agent reasons using the situation calculus. The project will be implemented in Prolog. We make the following simplifying assumptions:

a) The goal is to construct one type-1 building and one type-2 building.

b) There is no prosperity level.

c) There is no budget limit (no money in general).

d) There is no wait action.

e) When requesting a resource in one situation, it arrives immediately in the next situation. 

To correctly implement this agent, We need to follow the following steps.

a) KB.pl, containing a sample knowledge base with the initial state of the world. 

b)  LLAP.pl in which you will write your implementation. LLAP.pl must be in the same directory in which KB.pl lies. Import KB.pl at the beginning of LLAP.pl using:
```plaintext
 :- include(’KB.pl’).
```
c) Come up with fluents (predicate symbols whose denotations change across situations) to describe the state of the world. For each fluent, write a successor-state axiom in LLAP.pl. It is recommended to have a maximum of two fluents and, hence, a maximum of two successor-state axioms. Whenever possible, it is preferable to use built-in predicates rather than defining your own. 
 
d) Write a predicate goal(S) and use it to query the agent’s KB to generate a plan that can be followed to construct one type-1 building and one type-2 building. The result of the query should be a situation described as the result of doing some sequence of actions from the initial situation s0.

Important Note: You might write your successor state axioms correctly, yet when you query your KB, your program might run forever. This is because Prolog uses DFS to implement backward chaining, and we know that DFS is incomplete. To solve this issue, consider using the built-in predicate call_with_depth_limit[^1]. This predicate does depth limited search to backchain on the query provided as the first argument of the predicate. You can use this built-in predicate to implement another predicate to do iterative deepening search when solving for goal(S). In this way, you will guarantee that you will reach a solution (if there is one) since iterative deepening search is complete. Here is one way to implement IDS in Prolog. (You can write it in any way you like.)
```plaintext
 ids(X,L):
(call_with_depth_limit(myPredicate(X),L,R), number(R));
 (call_with_depth_limit(myPredicate(X),L,R), R=depth_limit_exceeded,
 L1 is L+1, ids(X,L1)).
```
[^1]: [Predicate call_with_depth_limit](http://www.swi-prolog.org/pldoc/man?predicate=call_with_depth_limit/3)


# Example
-  Knowledge base (KB.pl):
```plaintext
 food(1).
 materials(0).
 energy(2).
 build1(1,2,1).
 build2(4,1,2).
```
- Query1:
```plaintext
 goal(S).
 ```
- Output1:
```plaintext
 S = result(b1, result(reqf, result(reqm, result(reqm, result(reqe, result(b2, result(reqf, result(reqf, result(reqf, result(reqm, s0)))))))))).
```
  
- Query2:
```plaintext
 goal(result(b1, result(reqf, result(reqm, result(reqm, result(reqe, result(b2, result(reqf, result(reqf, result(reqf, result(reqm, s0))))))))))).
```
- Output2: ```plaintext
          true.
          ```
- Query3: ```plaintext
          goal(result(b1, result(reqf, result(reqm, result(b2, result(reqf, result(reqm,result(reqm, result(reqf, result(reqe, result(reqf, s0))))))))))).
          ```
- Output3: ```plaintext
           true.
           ```
- Query4: ```plaintext
          goal(result(b2, result(reqf, result(reqf, result(reqf, result(reqf, result(reqm, result(reqe, result(b1, result(reqm, result(reqm, s0))))))))))).
          ```
- Output4: ```plaintext
          true.
          ```
- Query5: ```plaintext
           goal(result(b1, result(reqf, s0))).
          ```
- Output5: ```plaintext
           false.
           ```
