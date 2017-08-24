use strict;
use warnings;
use 5.014;

package Dist::Zilla::Plugin::PkgConfig {

  use Moose;
  use namespace::autoclean;

  # ABSTRACT: Probe for XS libs using pkg-config

  with 'Dist::Zilla::Role::FileMunger';
  with 'Dist::Zilla::Role::MetaProvider';

  sub munge_files
  {
    my($self) = @_;
  }
  
  sub metadata {
    my($self) = @_;
    my %meta = ( dynamic_config => 1 );
    \%meta;
  }
  
  __PACKAGE__->meta->make_immutable;
}

1;
