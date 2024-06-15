# LLAP-Situation-Calculus
A logic-based agent using Prolog to solve a simplified version of a planning problem akin to the LLAP agent described previously. The agent reasons using situation calculus and aims to construct specific types of buildings under simplified conditions.

# Description
In this project you will be implementing a logic-based version of the LLAP agent. This agent reasons using the situation calculus. The project will be implemented in Prolog. We make the following simplifying assumptions:
a) Your goal is to construct one type-1 building and one type-2 building.
b) There is no prosperity level.
c) There is no budget limit (no money in general).
d) There is no wait action.
e) When requesting a resource in one situation, it arrives immediately in the next situation. To correctly implement this agent, you need to follow the following steps.
a) KB.pl, containing a sample knowledge base with the initial state of the world. Do not add anything to this file, and create
 a new Prolog file LLAP.pl in which you will write your implementation. LLAP.pl
 must be in the same directory in which KB.pl lies. Import KB.pl at the beginning
 of LLAP.pl using
 :- include(’KB.pl’).
