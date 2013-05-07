% player( name, sibling_rank, rank, orphan-p, funds, allowance, father_title, title, soclvl).
player('Jean Luc d\'Quintillon', first, nobleman, no, 500, 100, marquis, marquis, 8).

% club(abbreviation, name, min_soc_lvl, dues, status_pts_month, house_limit, gambling_divisor).

club(eo, 'L\'Epée D\'Or', 12, 30, 8, 9999, 500).
club(ch, 'Les Chasseurs', 9, 20, 6, 200, 300).
club(gm, 'Le Garde Montante', 7, 20, 5, 250, 300).
club(tb, 'Les Tuiles Bleues', 7, 15, 4, 150, 200).
club(ca, 'Le Crapaud et l\'Apricot', 5, 10, 3, 100, 150).
club(pr, 'Phillippe Le Rouge', 3, 5, 2, 50, 100).


% dame(num, name, soc_lvl, [attributes], lover, husband, num_kids).

dame( 1, 'Christine Daé', 12, [beautiful, rich], jlh, none, 0).
dame( 2, 'Charlotte Mousse', 22, [rich, married], none, oda, 3).
dame( 3, 'Silvie Cristelle', 4, [beautiful], none, none, 0).
dame( 4, 'Marie Bonbon', 5, [beautiful], none, none, 0).
dame( 5, 'Ivonne Marceau', 3, [rich], none, none, 0).
dame( 6, 'Mussette d\'Envion', 9, [rich, married], none, none, 1).
dame( 7, 'Josephine Bidette', 5, [], none, none, 0).
dame( 8, 'Victorie Labelle', 14, [], none, none, 0).
dame( 9, 'Magdalene du Croissant', 20, [beautiful, rich], none, none, 0).
dame( 10, 'Constance Lacroix', 20, [rich, married], none, jlm, 0).
dame( 11, 'Giovanna Pascalli', 7, [], none, none, 0).
dame( 12, 'Turandot de Lagarde', 12, [beautiful], none, none, 0).
dame( 13, 'Claudette Gorloise', 8, [beautiful], none, none, 0).
dame( 14, 'Juliette DeClaude', 5, [], none, none, 0).
dame( 15, 'Francine Davelet', 4, [rich], none, none, 0).
dame( 16, 'Georgette d\'Avignon', 15, [rich], gdf, none, 0).
dame( 17, 'Charlotte Pézet', 7, [beautiful, rich], cbc, none, 0).
dame( 18, 'Cosette Lamoire', 16, [influential], none, none, 0).
dame( 19, 'Louise Codolon', 15, [beautiful], none, none, 1).
dame( 20, 'Evelyne Garabedien', 16, [beautiful, rich], jpr, none, 0).
dame( 21, 'Marie-Claire Gassol', 7, [], pch, none, 0).
dame( 22, 'Claire Lagaine', 11, [beautiful], none, none, 0).
dame( 23, 'Justine de Sade', 15, [beautiful], none, none, 0).
dame( 24, 'Michelle Gillette', 8, [], none, none, 0).
dame( 25, 'Isabelle Girard', 11, [], none, none, 0).
dame( 26, 'Marianne Bientôt', 6, [rich], none, none, 0).
dame( 27, 'Lili Montparnasse', 11, [beautiful, married], none, ldp, 1).
dame( 28, 'Natasha Kinski', 13, [], none, none, 0).
dame( 29, 'Melissa Gilbert', 7, [beautiful], none, none, 0).
dame( 30, 'Ute Hoffmann', 13, [], none, none, 0).
dame( 31, 'Isabel d\'Artois', 7, [], none, none, 0).
dame( 32, 'Eleonor d\'Yberville', 18, [beautiful, rich], jlb, none, 0).

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
