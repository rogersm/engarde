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

dame( cd, 'Christine Daé', 12).
dame( cm, 'Charlotte Mousse', 22).
dame( sc, 'Silvie Cristelle', 4).
dame( mb, 'Marie Bonbon', 5).
dame( im, 'Ivonne Marceau', 3).
dame( mde, 'Mussette d''Envion', 9).
dame( jb, 'Josephine Bidette', 5).
dame( vl, 'Victorie Labelle', 14).
dame( mdc, 'Magdalene du Croissant', 20).
dame( cl, 'Constance Lacroix', 20.
dame( gp, 'Giovanna Pascalli', 7).
dame( tdl, 'Turandot de Lagarde', 12).
dame( cg, 'Claudette Gorloise', 8).
dame( jdc, 'Juliette DeClaude', 5).
dame( fdv, 'Francine Davelet', 4).
dame( gdv, 'Georgette d''Avignon', 15).
dame( cp, 'Charlotte Pézet', 7).
dame( cl, 'Cosette Lamoire', 16).
dame( lc, 'Louise Codolon', 15).
dame( eg, 'Evelyne Garabedien', 16).
dame( mcg, 'Marie-Claire Gassol', 7).
dame( cl, 'Claire Lagaine', 11).
dame( jds, 'Justine de Sade', 15).
dame( mg, 'Michelle Gillette', 8).
dame( ig, 'Isabelle Girard', 11).
dame( mb, 'Marianne Bientôt', 6).
dame( lm, 'Lili Montparnasse', 11).
dame( nk, 'Natasha Kinski', 13).
dame( mg, 'Melissa Gilbert', 7).
dame( uh, 'Ute Hoffmann', 13).
dame( ida, 'Isabel d''Artois', 7).
dame( edy, 'Eleonor d''Yberville', 18).

beautiful(cd).
rich(cd).
rich(cm).
rich(im).
rich(mde).
rich(mdc).
rich(cl).
rich( fdv ).
rich( gdv ).
rich( cp ).
rich( eg ).
rich( mb ).
rich( edy ).
beautiful(tdl).
beautiful(cg).
beautiful(cp).
beautiful(lc).
beautiful(eg).
beautiful(cl).
beautiful(jds).
beautiful(lm).
beautiful(mg).
beautiful(edy).
beutiful(mb).
beutiful(mdc).
influential(cl).




lover( jlh, cd ).
lover( gdf, gdv ).
lover( cbc, cp ).
lover( jpr, eg ).
lover( pch, mcg ).
lover( jlb, edy ).
married( oda, cm ).
married( jlm, cl ).
married( ldp, lm ).
kids( none, mde, 1 ).
kids( none, lc, 1 ).
kids( ldp, lm, 1).

is_married( X ) :- is_married(X, _).
is_married( X, Y ) :- married(X, Y); married(Y, X).
is_lover( X ) :- is_lover(X, _).
is_lover( X, Y ) :- lover(X, Y); lover(Y, X).
has_kids( X, Num ) :- kids( X, _, Num); kids(_, X, Num).



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
