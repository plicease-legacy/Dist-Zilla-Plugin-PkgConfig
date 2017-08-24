use strict;
use warnings;
use 5.014;

package Dist::Zilla::Plugin::PkgConfig {

  use Moose;
  use namespace::autoclean;

  # ABSTRACT: Probe for XS libs using pkg-config

  __PACKAGE__->meta->make_immutable;
}

1;