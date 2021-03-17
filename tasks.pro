% Author: Bohdan Sokolovskyi

%%%%% utils %%%%%
% gcd
gcd(X, Y, D) :-
    X < Y,
    Y1 is Y - X,
    gcd(X, Y1, D).

gcd(X, Y, D) :-
    X > Y,
    X1 is X - Y,
    gcd(X1, Y, D).

gcd(X,X,X).

% contain element in list
contain(H, [H|_]).
contain(X, [H|T]) :-
    H \= X,
    contain(X, T).

% length of list
len(Lst, Res) :-
    length_aux(Lst, 0, Res).

length_aux([], Buff, Buff).
length_aux([_|T], Buff, Res) :-
    New_buff is Buff + 1,
    length_aux(T, New_buff, Res).
    

%%%%% Fibonacci Sequence %%%%%
fib(0, 0).
fib(1, 1).
fib(N,Res) :-
    N > 0,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, Res1),
    fib(N2, Res2),
    Res is Res1 + Res2;
    N < 0,
    write("N is less then 0!"),
    nl.

%%%%% is prime numbers %%%%%
is_prime_nums(X, Y) :-
    X =< 0, write("X is less or equal 0!"),nl;
    Y =< 0, write("Y is less or equal 0!"),nl;
    gcd(X,Y,1).

%%%%% Eular phinction PHI %%%%%

%%%%% goldbach %%%%%%


%%%%% nth elm of list %%%%
nth([H|T], Idx, Res) :-
    nth_aux([H|T], Res, Idx).

nth_aux([H|_], H, 0).
nth_aux(Lst, _, Idx) :-
    len(Lst, LenRes),
    LenRes < Idx, write("Out of range of list!"),nl,!,fail.
nth_aux([_|T], Res, Idx) :-
    Idx < 0, write("Idx must be positive!"),nl;
    New_idx is Idx - 1,
    nth_aux(T, New_res, New_idx),
    Res is New_res.

%%%%% dups list %%%%%

%%%%% split list %%%%%%

%%%%% mult list %%%%%%

%%%%% conjunction %%%%%
    

%%%%% adjacent %%%%%
adjacent(X, Y, [X|[Y|_]]).
adjacent(X, Y, [Y|[X|_]]).
adjacent(X, Y, [_|T]):-
    adjacent(X, Y, T).
