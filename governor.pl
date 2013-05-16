:- include('world.pl').

main :- init_engarde.

init_engarde :-
	init_areas,
	init_positions.

init_areas :-
	init_player_houses,
	init_dame_houses,
	init_club_houses,
	init_regiment_houses.

init_player_houses :-
	forall(player(Code, Description, _, _, _, _, _, _, _, _),
	       assertz(area(Code, [ 'House of ', Description]))).
init_dame_houses :-
	forall(dame(Code, Description, _, _, _, _, _),
	       assertz(area(Code, [ 'House of the Dame ', Description ]))).
init_club_houses :-
	forall(club(Code, Description, _, _, _, _, _),
	       assertz(area( Code, [ 'The great club ', Description ]))).
init_regiment_houses :-
	forall(regiment(Code, Description, _, _, _, _, _, _, _),
	       assertz(area( Code, [ 'The magnificent location of the ', Description ]))).

init_positions :-
	init_player_positions,
	init_dame_positions.

player_origin_position(PlayerCode, AreaDescription) :-
	player(PlayerCode, _, _, _, _, _, _, _, _, _),
	area(PlayerCode, AreaDescription).

init_player_positions :-
	forall(player_origin_position(PlayerCode, AreaDescription),
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

respond([]):-
  write('.'),nl,nl.
respond([H|T]):-
  write(H),
  respond(T).