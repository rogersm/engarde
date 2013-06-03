% player( name, sibling_rank, rank, orphan-p, funds, allowance, father_title, title, soclvl).
player(jldq, 'Jean Luc d''Quintillon', first, nobleman, no, 500, 100, marquis, marquis, 8).
player(mdo, 'Marc d''Orc', first, nobleman, yes, 500, 100, duke, duke, 9).

% club(abbreviation, name, min_soc_lvl, dues, status_pts_month, house_limit, gambling_divisor).

club(eo, 'L''Epée D''Or', 12, 30, 8, 9999, 500).
club(ch, 'Les Chasseurs', 9, 20, 6, 200, 300).
club(gm, 'Le Garde Montante', 7, 20, 5, 250, 300).
club(tb, 'Les Tuiles Bleues', 7, 15, 4, 150, 200).
club(ca, 'Le Crapaud et l''Apricot', 5, 10, 3, 100, 150).
club(pr, 'Phillippe Le Rouge', 3, 5, 2, 50, 100).


% dame(num, name, soc_lvl, [attributes], lover, husband, num_kids).

dame( chd, 'Christine Daé', 12, [beautiful, rich], jlh, none, 0).
dame( chm, 'Charlotte Mousse', 22, [rich], none, oda, 3).
dame( sic, 'Silvie Cristelle', 4, [beautiful], none, none, 0).
dame( mab, 'Marie Bonbon', 5, [beautiful], none, none, 0).
dame( ivm, 'Ivonne Marceau', 3, [rich], none, none, 0).
dame( mue, 'Mussette d''Envion', 9, [rich], none, none, 1).
dame( job, 'Josephine Bidette', 5, [], none, none, 0).
dame( vil, 'Victorie Labelle', 14, [], none, none, 0).
dame( mac, 'Magdalene du Croissant', 20, [beautiful, rich], none, none, 0).
dame( col, 'Constance Lacroix', 20, [rich], none, jlm, 0).
dame( gip, 'Giovanna Pascalli', 7, [], none, none, 0).
dame( tul, 'Turandot de Lagarde', 12, [beautiful], none, none, 0).
dame( clg, 'Claudette Gorloise', 8, [beautiful], none, none, 0).
dame( jud, 'Juliette DeClaude', 5, [], none, none, 0).
dame( frd, 'Francine Davelet', 4, [rich], none, none, 0).
dame( gea, 'Georgette d''Avignon', 15, [rich], gdf, none, 0).
dame( chp, 'Charlotte Pézet', 7, [beautiful, rich], cbc, none, 0).
dame( col, 'Cosette Lamoire', 16, [influential], none, none, 0).
dame( loc, 'Louise Codolon', 15, [beautiful], none, none, 1).
dame( evg, 'Evelyne Garabedien', 16, [beautiful, rich], jpr, none, 0).
dame( mag, 'Marie-Claire Gassol', 7, [], pch, none, 0).
dame( cll, 'Claire Lagaine', 11, [beautiful], none, none, 0).
dame( jus, 'Justine de Sade', 15, [beautiful], none, none, 0).
dame( mig, 'Michelle Gillette', 8, [], none, none, 0).
dame( isg, 'Isabelle Girard', 11, [], none, none, 0).
dame( mab, 'Marianne Bientôt', 6, [rich], none, none, 0).
dame( lim, 'Lili Montparnasse', 11, [beautiful], none, ldp, 1).
dame( nak, 'Natasha Kinski', 13, [], none, none, 0).
dame( meg, 'Melissa Gilbert', 7, [beautiful], none, none, 0).
dame( uth, 'Ute Hoffmann', 13, [], none, none, 0).
dame( isa, 'Isabel d''Artois', 7, [], none, none, 0).
dame( ely, 'Eleonor d''Yberville', 18, [beautiful, rich], jlb, none, 0).

married_not_player( Dame_id, Name ) :-
	dame(Dame_id, Name, _, Attributes, _, Husband, _),
	member(married, Attributes),
	Husband == none.

% regiment(abbreviation, name, arm, col, tcol, [majs], [capts], [ncos], [soldiers])

regiment(gr, 'Guardia Real', infantery, none, none, [jlh], [], [],[]).
regiment(mdr, 'Mosqueteros del Rey', infantery,  none, none, [], [], [],[]).
regiment(gc, 'Guardia del Cardenal', infantery, none, none, [], [], [],[]).
regiment(gd, 'Guardia de Dragones', cavalry, none, none, [], [], [],[]).
regiment(cdr, 'Carabineros de la Reina', cavalry, none, none, [], [], [],[]).
regiment(cpc,'Coraceros del Príncipe de Condé', cavalry, none, none, [], [], [],[]).
regiment(cdd, 'Coraceros del Delfín', cavalry, none, none, [], [], [],[edr]).
regiment(ddm, 'Dragones del Gran Duque Maximiliano', cavalry, none, none, [], [], [],[]).
regiment(dpl, 'Dragones Ligeros de la Princesa Luisa', cavalry, none, none, [], [], [],[]).
regiment(mr, 'Marines Reales', infantery, none, none, [], [], [],[]).
regiment(mdp, 'Mosqueteros de la Picardía', infantery, none, none, [], [], [],[]).
regiment(r13, '13 Regimiento de Fusileros', infantery, none, none, [], [], [],[]).
regiment(r53, '53 Regimiento de Fusileros', infantery, none, none, [], [], [],[]).
regiment(r27, '27 Regimiento de Mosqueteros', infantery, none, none, [], [], [],[]).
regiment(r4, '4º Regimiento de Arcabuceros', infantery, none, none, [], [], [],[]).
regiment(r69, '69 Regimiento de Arcabuceros', infantery, none, none, [], [], [],[]).
regiment(rgc, 'Regimiento de Cadetes de la Gascuña', infantery, none, none, [], [], [],[]).
regiment(rcm, 'Regimiento de Cazadores de Montaña', infantery, none, none, [], [], [],[]).

area(jldq, ['House of ', 'Jean Luc d\'Quintillon']).
area(mdo, ['House of ', 'Marc d\'Orc']).
area(cda, ['House of the Dame ', 'Christine Daé']).
area(cmo, ['House of the Dame ', 'Charlotte Mousse']).
area(scr, ['House of the Dame ', 'Silvie Cristelle']).
area(mbo, ['House of the Dame ', 'Marie Bonbon']).
area(ima, ['House of the Dame ', 'Ivonne Marceau']).
area(med, ['House of the Dame ', 'Mussette d\'Envion']).
area(jbi, ['House of the Dame ', 'Josephine Bidette']).
area(vlb, ['House of the Dame ', 'Victorie Labelle']).
area(mdc, ['House of the Dame ', 'Magdalene du Croissant']).
area(col, ['House of the Dame ', 'Constance Lacroix']).
area(gpa, ['House of the Dame ', 'Giovanna Pascalli']).
area(tdl, ['House of the Dame ', 'Turandot de Lagarde']).
area(cgo, ['House of the Dame ', 'Claudette Gorloise']).
area(jdc, ['House of the Dame ', 'Juliette DeClaude']).
area(fda, ['House of the Dame ', 'Francine Davelet']).
area(gda, ['House of the Dame ', 'Georgette d\'Avignon']).
area(cpp, ['House of the Dame ', 'Charlotte Pézet']).
area(cla, ['House of the Dame ', 'Cosette Lamoire']).
area(lco, ['House of the Dame ', 'Louise Codolon']).
area(ega, ['House of the Dame ', 'Evelyne Garabedien']).
area(mcg, ['House of the Dame ', 'Marie-Claire Gassol']).
area(cll, ['House of the Dame ', 'Claire Lagaine']).
area(jds, ['House of the Dame ', 'Justine de Sade']).
area(mgg, ['House of the Dame ', 'Michelle Gillette']).
area(igg, ['House of the Dame ', 'Isabelle Girard']).
area(mdb, ['House of the Dame ', 'Marianne Bientôt']).
area(lmo, ['House of the Dame ', 'Lili Montparnasse']).
area(nki, ['House of the Dame ', 'Natasha Kinski']).
area(mgi, ['House of the Dame ', 'Melissa Gilbert']).
area(uho, ['House of the Dame ', 'Ute Hoffmann']).
area(ida, ['House of the Dame ', 'Isabel d\'Artois']).
area(edy, ['House of the Dame ', 'Eleonor d\'Yberville']).
area(eo, ['The great club ', 'L\'Epée D\'Or']).
area(ch, ['The great club ', 'Les Chasseurs']).
area(gm, ['The great club ', 'Le Garde Montante']).
area(tb, ['The great club ', 'Les Tuiles Bleues']).
area(ca, ['The great club ', 'Le Crapaud et l\'Apricot']).
area(pr, ['The great club ', 'Phillippe Le Rouge']).
area(gr, ['The magnificent location of the ', 'Guardia Real']).
area(mdr, ['The magnificent location of the ', 'Mosqueteros del Rey']).
area(gc, ['The magnificent location of the ', 'Guardia del Cardenal']).
area(gd, ['The magnificent location of the ', 'Guardia de Dragones']).
area(cdr, ['The magnificent location of the ', 'Carabineros de la Reina']).
area(cpc, ['The magnificent location of the ', 'Coraceros del Príncipe de Condé']).
area(cdd, ['The magnificent location of the ', 'Coraceros del Delfín']).
area(ddm, ['The magnificent location of the ', 'Dragones del Gran Duque Maximiliano']).
area(dpl, ['The magnificent location of the ', 'Dragones Ligeros de la Princesa Luisa']).
area(mr, ['The magnificent location of the ', 'Marines Reales']).
area(mdp, ['The magnificent location of the ', 'Mosqueteros de la Picardía']).
area(r13, ['The magnificent location of the ', '13 Regimiento de Fusileros']).
area(r53, ['The magnificent location of the ', '53 Regimiento de Fusileros']).
area(r27, ['The magnificent location of the ', '27 Regimiento de Mosqueteros']).
area(r4, ['The magnificent location of the ', '4º Regimiento de Arcabuceros']).
area(r69, ['The magnificent location of the ', '69 Regimiento de Arcabuceros']).
area(rgc, ['The magnificent location of the ', 'Regimiento de Cadetes de la Gascuña']).
area(rcm, ['The magnificent location of the ', 'Regimiento de Cazadores de Montaña']).

