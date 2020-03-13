% #birth facts

% #last generation (8 pieces)
birth(li_hua, male, 2012, li_ba, yu_ma).
birth(li_wa, female, 2013, li_ba, yu_ma).

birth(zhou_yi, male, 2011, zhou_ba, zhou_ma).
birth(zhou_er, male, 2012, zhou_ba, zhou_ma).
birth(zhou_san, female, 2014, zhou_ba, zhou_ma).

birth(wang_yi, male, 2012, wang_ba, wang_ma).
birth(wang_er, male, 2011, wang_ba, wang_ma).
birth(wang_san, female, 2010, wang_ba, wang_ma).

% #third generation (6 pieces)
birth(yu_ma, female, 1995, zhou_ye, zhou_nai).
birth(zhou_ba, male, 1992, zhou_ye, zhou_nai).
birth(wang_ba, male, 1990, zhou_ye, zhou_nai).

birth(li_ba, male, 1980, lia, lib).
birth(zhou_ma, female, 1985, zhoua, zhoub).
birth(wang_ma, female, 1989, wanga, wangb).

% #second generation (2pieces)

birth(zhou_ye, male, 1950, zhou_zu, zhou_zunai).
birth(zhou_nai, female, 1952, wang_zu, wang_zunai).

% #first generation (4 pieces)
birth(zhou_zu, male, 1920, zhouc, zhoud).
birth(zhou_zunai, female, 1923, zhoue, zhouf).

birth(wang_zu, male, 1923, zhoug, zhouh).
birth(wang_zunai, female, 1925, zhoui, zhouj).


% death facts
death(zhou_zu,1950).
death(zhou_zunai,1960).
death(wang_zu,1963).
death(wang_zunai,1970).
death(zhou_ye,1990).

% divorce facts
divorce(li_ba,yu_ma,2015).
divorce(yu_ma,li_ba,2015).

divorce(wang_zu,wang_zunai,2016).
divorce(wang_zunai,wang_zu,2016).

%# ==============================================
%# Define the rules for states
%# birth(li_hua, male, 2012, li_ba, yu_ma).

% #gender facts
male(X) :- birth(X,male,_,_,_).
female(X) :- birth(X,female,_,_,_).

%# spouse 1
spouse(X,Y) :- birth(_, _, _, X, Y).
spouse(Y,X) :- spouse(X,Y).

%# parent 2
parent(X,Y) :- birth(Y,_,_,X,_).
parent(X,Y) :- birth(Y,_,_,_,X).

%# child 3
child(X,Y,Z) :- birth(X,_,Z,Y,_).
child(X,Y,Z) :- birth(X,_,Z,_,Y).

%# single 4
single(X) :-  \+ (birth(_,_,_,X,_)), \+ (birth(_,_,_,_,X)).

%# married 5
married(X) :- birth(_,_,_,X,_).
married(X) :- birth(_,_,_,_,X).

%# widowed 6
widowed(X,Z) :- birth(X,female,_,_,_) , spouse(X,Y) , death(Y,Z).

%# divorced 7
divorced(X,Y,Z) :- divorce(X,Y,Z).

%# -----relationship-----------

%# father 1
father(X,Y) :- parent(X,Y) , male(X).

%# mother 2
mother(X,Y) :- parent(X,Y) , female(X).

%# grandparent 3
grandparent(X,Y) :- parent(X,A),parent(A,Y).

%# grandmother 4
grandmother(X,Y) :- parent(X,A),parent(A,Y),female(X).

%# grandfather 5
grandfather(X,Y) :- parent(X,A),parent(A,Y),male(X).

%# grandgrandparent 6
grandgrandparent(X,Y) :- parent(X,A),parent(A,B),parent(B,Y).

%# grandgrandfather 7
grandgrandfather(X,Y) :- parent(X,A),parent(A,B),parent(B,Y),male(X).

%# grandgrandfather 8
grandgrandmother(X,Y) :- parent(X,A),parent(A,B),parent(B,Y),female(Y).

%# brother 9
brother(X,Y) :- grandparent(A,X),grandparent(A,Y),male(X),male(Y).

%# sister 10
sister(X,Y) :- grandparent(A,X),grandparent(A,Y),female(X),female(Y).

%# aunt 11
aunt(X,Y) :- grandparent(A,Y),parent(A,X),female(X).
aunt(X,Y) :- grandparent(A,Y),spouse(X,B),parent(A,B),female(X).

%# uncle 12
uncle(X,Y) :- grandparent(A,Y),parent(A,X),male(X).
uncle(X,Y) :- grandparent(A,Y),spouse(X,B),parent(A,B),male(X).

%# cousin 13
cousin(X,Y) :- uncle(Y,X).

%# ex_wife 14
ex_wife(X,Y) :- divorce(X,Y,_),female(X).

%# ex_husband 15
ex_husband(X,Y) :- divorce(X,Y,_),male(X).

%# grandson 16
grandson(X,Y) :- grandparent(Y,X),male(X).

%# granddaughter 17
granddaughter(X,Y) :- grandparent(Y,X),female(X).

%# daughter 18
daughter(X,Y) :- parent(Y,X),female(X).

%# son 19
% son(X,Y) :- parent(Y,X),male(X).

%# grandgrandson 20
grandgrandson(X,Y) :- grandgrandparent(Y,X),male(X).




