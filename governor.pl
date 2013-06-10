:- include('world_db.pl').
:- dynamic position/2.

main :- init_engarde.

init_engarde :-
	init_positions,
	write('Welcome to the en garde processor'),
	nl,
	nl,
	command_loop.

init_positions :-
	init_pc_positions,
	init_dame_positions.

pc_origin_position(PlayerCode, AreaDescription) :-
	pc(PlayerCode, _, _, _, _, _, _, _, _, _),
	area(PlayerCode, AreaDescription).

init_pc_positions :-
	forall(pc_origin_position(PlayerCode, AreaDescription),
	       assertz(position(PlayerCode, area(PlayerCode, AreaDescription)))).

dame_origin_position(DameCode, AreaDescription) :-
	dame(DameCode, _, _, _, _, _, _),
	area(DameCode, AreaDescription).

init_dame_positions :-
	forall(dame_origin_position(DameCode, AreaDescription),
	       assertz(position(DameCode, area(DameCode, AreaDescription)))).

%%
%% Commands
%%

quit :- write('good bye'),
	nl.

save :- write('database saved'),
	nl.

goto(Player, Area) :-
	can_go(Player, Area),
	moveto(Player, Area),
	respond([Player, ' moved']),
	look(Area).

can_go(_, Area) :-
	area(Area, _).

moveto(Player, AreaCode) :-
	area(AreaCode, Description),
	retract(position(Player, _)),
	assertz(position(Player, area(AreaCode, Description))).

look(AreaCode) :-
	area(AreaCode, Description),
	write('You can see: '), nl,
	respond(Description),nl.

whereis(Code, Description) :-
	position(Code, area(AreaCode, Description)).

% respond simplifies writing a mixture of literals and variables

respond([]) :-
  write('.'),nl,nl.
respond([H|T]) :-
  write(H),
  respond(T).

% PC and dames relations

married(PlayerCode, DameCode) :-
	pc(PlayerCode, _, _, _, _, _, _, _, _, _),
	dame(DameCode, _, _, _, _, PlayerCode, _), !.

married(DameCode, PlayerCode) :-
	pc(PlayerCode, _, _, _, _, _, _, _, _, _),
	dame(DameCode, _, _, _, _, PlayerCode, _), !.

lover(PlayerCode, DameCode) :-
	pc(PlayerCode, _, _, _, _, _, _, _, _, _),
	dame(DameCode, _, _, _, PlayerCode, _, _), !.

lover(DameCode, PlayerCode) :-
	pc(PlayerCode, _, _, _, _, _, _, _, _, _),
	dame(DameCode, _, _, _, PlayerCode, _, _), !.

dame_is(Dame, Attribute) :-
	dame(Dame, _, _, Attributes, _, _, _),
	member(Attribute, Attributes).

rich(Dame) :- dame_is(Dame, rich).
influential(Dame) :- dame_is(Dame, influential).
beautiful(Dame) :- dame_is(Dame, beautiful).


%%
%% Application loop
%%
command_loop :-
	repeat,
	get_command(X),
	do(X),
	(turnapplied ; X == quit).

do(goto(X)) :- goto(X), !.


get_command(C) :-
	readlist(L),
	command(X, L, []),
	C =.. X, !.

get_command(_) :-
	respond(['I don''t understand, try again or type help']),fail.


command([Pred, Arg]) --> verb(Type, Pred), nounphrase(Type, Arg).
command([Pred]) --> verb(intran, Pred).
command([goto, Arg]) --> noun(go_place, Arg).

verb(go_place, goto) --> go_verb.
verb(thing, V) --> tran_verb(V).
verb(intran, V) --> intran_verb(V).

go_verb --> [go].
go_verb --> [go, to].
go_verb --> [g].

tran_verb(visit) --> [visit].
intran_verb(inventory) --> [inventory].
intran_verb(inventory) --> [i].
intran_verb(look) --> [look].
intran_verb(look) --> [look,around].
intran_verb(look) --> [l].
intran_verb(quit) --> [quit].
intran_verb(quit) --> [exit].
intran_verb(save) --> [save].
intran_verb(nshelp) --> [help].
intran_verb(hint) --> [hint].

nounphrase(Type,Noun) --> det,noun(Type,Noun).
nounphrase(Type,Noun) --> noun(Type,Noun).
look :- write('You''re looking'), nl.

det --> [the].
det --> [a].

%%
%% Input/Output routines for text inteface.
%%
%%


% readlist - read a list of words, based on a Clocksin & Mellish
% example.

readlist(L):-
  write('engarde> '),
  read_word_list(L).

read_word_list([W|Ws]) :-
  get0(C),
  readword(C, W, C1),       % Read word starting with C, C1 is first new
  restsent(C1, Ws), !.      % character - use it to get rest of sentence

restsent(C,[]) :- lastword(C), !. % Nothing left if hit last-word marker
restsent(C,[W1|Ws]) :-
  readword(C,W1,C1),        % Else read next word and rest of sentence
  restsent(C1,Ws).

readword(C,W,C1) :-         % Some words are single characters
  single_char(C),           % i.e. punctuation
  !,
  name(W, [C]),             % get as an atom
  get0(C1).
readword(C, W, C1) :-
  is_num(C),                % if we have a number --
  !,
  number_word(C, W, C1, _). % convert it to a genuine number
readword(C,W,C2) :-         % otherwise if character does not
  in_word(C, NewC),         % delineate end of word - keep
  get0(C1),                 % accumulating them until
  restword(C1,Cs,C2),       % we have all the word
  name(W, [NewC|Cs]).       % then make it an atom
readword(C,W,C2) :-         % otherwise
  get0(C1),
  readword(C1,W,C2).        % start a new word

restword(C, [NewC|Cs], C2) :-
  in_word(C, NewC),
  get0(C1),
  restword(C1, Cs, C2).
restword(C, [], C).


single_char(0',).
single_char(0';).
single_char(0':).
single_char(0'?).
single_char(0'!).
single_char(0'.).


in_word(C, C) :- C >= 0'a, C =< 0'z.
in_word(C, L) :- C >= 0'A, C =< 0'Z, L is C + 32.
in_word(0'',0'').
in_word(0'-,0'-).

% Have character C (known integer) - keep reading integers and build
% up the number until we hit a non-integer. Return this in C1,
% and return the computed number in W.

number_word(C, W, C1, Pow10) :-
  is_num(C),
  !,
  get0(C2),
  number_word(C2, W1, C1, P10),
  Pow10 is P10 * 10,
  W is integer(((C - 0'0) * Pow10) + W1).

number_word(C, 0, C, 0.1).



is_num(C) :-
  C =< 0'9,
  C >= 0'0.

% These symbols delineate end of sentence

lastword(10).   % end if new line entered
lastword(0'.).
lastword(0'!).
lastword(0'?).
