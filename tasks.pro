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

% concat list
concat_lsts([], L2, L2).

concat_lsts(L1, [], L1).

concat_lsts([H|T], L2, Res) :-
    concat_lsts(T, L2, Res2),
    Res = [H|Res2].

% repeat N times
repeat_n_times(Elm, 1, [Elm]).

repeat_n_times(_, 0, []).

repeat_n_times(Elm, N, Res) :-
    N < 0, write("N must be a positive number!"),nl;

    Next_N is N - 1,
    repeat_n_times(Elm, Next_N, Res2),
    Res = [Elm|Res2].
%%%%%%%%%%%%%%%
    

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
    write("N is less then 0!"),nl.

%%%%% is prime numbers %%%%%
is_prime_nums(X, Y, F) :-
    X =< 0, true = F, write("X is less or equal 0!"),nl;
    
    Y =< 0, true = F, write("Y is less or equal 0!"),nl;
    
    gcd(X,Y,1).

%%%%% Eular phinction PHI %%%%%
phi(0, 0).

phi(1, 0).

phi(M, Res) :-
    M < 0, write("M must be a positive!"),nl;

    To is M - 1,
    phi_aux(M, To, 1, Res).

phi_aux(_, 0, _, 1).
phi_aux(_, 1, Res, Res).
phi_aux(From, To, Buff, Res) :-
    is_prime_nums(From, To, false),
    Next_to is To - 1,
    New_buff is Buff + 1,
    phi_aux(From, Next_to, New_buff, Res);
    
    Next_to is To - 1,
    phi_aux(From, Next_to, Buff, Res).

%%%%% goldbach %%%%%%
goldbach(N, X1, X2) :-
    N < 0, write("N must be a positive!"),nl;

    Next_N is N - 1,
    goldbach_aux(N, Next_N, X1, X2).

goldbach_aux(_, 0, 0, 0).

goldbach_aux(N, Next_N, X1, X2) :-
    Next_N > 0,
    search_number(Next_N, 2),
    X2 is N - Next_N,
    search_number(X2, 2),
    X1 is N - X2;

    Buff is Next_N - 1,
    goldbach_aux(N, Buff, X1, X2).


search_number(0, _).

search_number(1, _).

search_number(X, X).

search_number(X, N) :-
    Res is X mod N,
    0 \= Res,
    Next_N is N + 1,
    search_number(X, Next_N).

%%%%% nth elm of list %%%%
nth([H|T], Idx, Res) :-
    nth_aux([H|T], Res, Idx).

nth_aux([H|_], H, 0).

nth_aux(Lst, _, Idx) :-
    len(Lst, LenRes),
    LenRes < Idx, write("Out of range of list!"),nl,!,fail.

nth_aux([_|T], Res, Idx) :-
    Idx < 0, write("Idx must be a positive!"),nl;
    New_idx is Idx - 1,
    nth_aux(T, New_res, New_idx),
    Res is New_res.

%%%%% dups list %%%%%
dups([], _, []).

dups([H|T], N, Res) :-
    N < 0, write("N must be a positive!"),nl;

    dups(T, N, Res2),
    repeat_n_times(H, N, Res_of_repeats),
    concat_lsts(Res_of_repeats, Res2, Res).

%%%%% split list %%%%%%
split(_, [], [], []).

split(Middle, [H|T], L1, L2) :-
    H > Middle,
    split(Middle, T, L1_1, L2_1),
    L1 = L1_1,
    L2 = [H|L2_1];
    
    H < Middle,
    split(Middle, T, L1_1, L2_1),
    L1 = [H|L1_1],
    L2 = L2_1;
    
    split(Middle, T, L1, L2);

%%%%% factors list %%%%%%
factors(0,[0]).

factors(1,[1]).

factors(Num, Res) :-
    Num > 0,
    factors_aux(Num, Num, Res);
    
    write("Num must be a positive number!"),nl.

factors_aux(_, 1, [1]).

factors_aux(Divident, Divisor, Res) :-
    Divisor < 1;
    
    Buff is Divident mod Divisor,
    0 = Buff,
    Divisor2 is Divisor - 1,
    factors_aux(Divident, Divisor2, Res2),
    Res = [Divisor|Res2];
    
    Buff is Divident mod Divisor,
    0 \= Buff,
    Divisor2 is Divisor - 1,
    factors_aux(Divident, Divisor2, Res2),
    Res = Res2.   


%%%%% intersection %%%%%
intersection([],_,[]).
intersection([H|T], Lst2, Res) :-
    contain(H, Lst2),
    intersection(T, Lst2, Res2),
    Res = [H|Res2];
    
    intersection(T,Lst2,Res).

%%%%% adjacent %%%%%
adjacent(X, Y, [X,Y|_]).
adjacent(X, Y, [Y,X|_]).
adjacent(X, Y, [_|T]):-
    adjacent(X, Y, T).
