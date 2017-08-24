use Test2::V0 -no_srand => 1;
use Test::DZil;
use Dist::Zilla::Plugin::PkgConfig;
use List::Util qw( first );
use JSON::MaybeXS qw( decode_json );

subtest 'basic' => sub {

  my $tzil = Builder->from_config({ dist_root => 'corpus/Foo-XS' }, {
    add_files => {
      'source/dist.ini' => simple_ini(
        { name => 'Foo-XS' },
        [ 'GatherDir'  => {} ],
        [ 'MakeMaker' => {} ],
        [ 'MetaJSON'   => {} ],
        [ 'PkgConfig' => {} ],
      ),
    },
  });

  $tzil->build;

  subtest 'meta' => sub {

    my $meta = decode_json((first { $_->name eq 'META.json' } @{ $tzil->files })->content);

    is(
      $meta->{dynamic_config},
      T(),
      'dynamic config is set in META.json',
    );

  };
  
  subtest 'installer' => sub {
  
    my($file) = first { $_->{name} eq 'Makefile.PL' } @{ $tzil->files };
    
    ok $file, 'has a Makefile.PL';
    note $file->content;
  
  };

};

done_testing
