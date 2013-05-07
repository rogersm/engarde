consult('engarde.pl').

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
	player(Code, Description, _, _, _, _, _, _, _, _),
	asserta(area(Code, [ 'House of ', Description])).
init_dame_houses :-
	dame(Code, Description, _, _, _, _, _),
	asserta(area(Code, [ 'House of the Dame ', Description ])).
init_club_houses :-
	club(Code, Description, _, _, _, _, _),
	asserta(area( Code, [ 'The great club ', Description ])).
init_regiment_houses :-
	regiment(Code, Description, _, _, _, _, _, _, _),
	asserta(area( Code, [ 'The magnificent location of the ', Description ])).
	
init_positions :-
	init_player_positions,
	init_dame_positions.

init_player_positions :-
	player(PlayerCode, _, _, _, _, _, _, _, _, _),
	area(AreaCode, AreaDescription),
	PlayerCode == AreaCode,
	assertz(position(PlayerCode, area(AreaCode, AreaDescription))).

init_dame_positions :-
	dame(DameCode, _, _, _, _, _, _),
	area(AreaCode, AreaDescription),
	DameCode == AreaCode,
	assertz(position(DameCode, area(AreaCode, AreaDescription))).

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