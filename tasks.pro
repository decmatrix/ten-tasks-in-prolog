% Author: Bohdan Sokolovskyi

%%%%% utils %%%%%
gcd(X, Y, D) :-
    X < Y,
    Y1 is Y - X,
    gcd(X, Y1, D).

gcd(X, Y, D) :-
    X > Y,
    X1 is X - Y,
    gcd(X1, Y, D).

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
    X < 0, write("X is less then 0!"), nl;
    Y < 0, write("Y is less then 0!"), nl;
    gcd(X, Y, D), D = 1.
