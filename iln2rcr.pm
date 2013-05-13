#!/usr/bin/perl
package iln2rcr;
use strict;
use warnings;
use LWP::Simple;	# get(url)



# ~~~~~~~ VERSIONS~~~~~~~~
# 15.03.2013 : Création.
# 04.04.2013 : Doc
# ~~~~~~~ VERSIONS~~~~~~~~
#
# romain.vanel@gmail.com
# rugbis@ujf-grenoble.fr



=head1 NAME
iln2rcr.pm
=cut

=head1 DESCRIPTION
Package perl d'interogation du webservice Abes iln2rcr.
A partir de iln2rcr (Abes), renvoie la liste des bibliothèques (RCR) d'un réseau (ILN).

Aucun parser n'est utilisé, pour éviter les procédures d'installation de package,
pas toujours possibles sur les machines en production.

=cut

=head1 UTILISATION

Utilisation du package depuis un script .pl
Accepte un ILN en parametre ($iln)
Renvoie le résultat sous forme de liste @liste_rcr

Dans le programme .pl :
my $iln = "26";
my @liste_rcr = iln2rcr::iln2($iln);
print @liste_rcr;

=cut

=head1 LICENCE

GNU/GPL

=cut


#------------------------------------------------------------------------------
sub iln2 {

my ($iln_a_chercher) = @_ ;

#URL Abes iln2rcr
my $url_abes_iln2rcr_basique = "http://www.idref.fr/services/iln2rcr/";

my $url_creee = $url_abes_iln2rcr_basique . $iln_a_chercher;
my $page_iln = &downloader_de_page($url_creee);
  if ($page_iln) {
    my $rcr_trouve = chercheur_iln($page_iln);
    my @liste_de_rcr = split(/,/,$rcr_trouve);
    return @liste_de_rcr;
  }
  else {
  	return ;
  }
;
}

#------------------------------------------------------------------------------
sub downloader_de_page {
  my ($url) = @_ ;
  if (my $page = get($url)) {
  	 return $page;
	}
    else {
      return 0;
    };
} 

#------------------------------------------------------------------------------
sub chercheur_iln {
my ($page_iln2rcr) = @_ ;
   $page_iln2rcr =~ s/<rcr>([0-9]+)<\/rcr>/$1\n/g;
   $page_iln2rcr =~ s/.*>//g;
   $page_iln2rcr =~ s/\n\n//g;
   $page_iln2rcr =~ s/\n/,/g;
return $page_iln2rcr;
};	

1;