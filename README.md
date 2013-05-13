iln2rcr_pm
==========

iln2rcr.pm


Package perl d'interogation du webservice Abes iln2rcr.


DESCRIPTION
Package perl d'interogation du webservice Abes iln2rcr.
A partir de iln2rcr (Abes), renvoie la liste des bibliothèques (RCR) d'un réseau (ILN).

Aucun parser n'est utilisé, pour éviter les procédures d'installation de package,
pas toujours possibles sur les machines en production.



UTILISATION

Utilisation du package depuis un script .pl
Accepte un ILN en parametre ($iln)
Renvoie le résultat sous forme de liste @liste_rcr

Dans le programme .pl :
my $iln = "26";
my @liste_rcr = iln2rcr::iln2($iln);
print @liste_rcr;

LICENCE

GNU/GPL

