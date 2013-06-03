:- include('world_db.pl').
:- dynamic position/2.

main :- init_engarde.

init_engarde :-
	init_positions.

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

