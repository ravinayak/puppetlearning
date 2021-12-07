include basicresourcetypes
tidy { 'tidytmp1-dir':
  path    => '/tmp/tidy-tmp-1',
  matches => ['*.tmp*','*.pdf*','*.temp*', '*.txt*'],
  age     => '1s',
  type    => 'atime',
  recurse => 1,
}
tidy { 'tidytmp2-dir':
  path      => '/tmp/tidy-tmp-2',
  matches   => ['*.tmp*','*.pdf*'],
  size      => '1k',
  age       => '1s',
  type      => 'atime',
  max_files => 50,
  recurse   => 1,
}
tidy { 'tidytmp3-dir':
  path    => '/tmp/tidy-tmp-3',
  matches => ['*.tmp*', '*.temp*', '*.txt*'],
  size    => '1k',
  recurse => 5,
  rmdirs  => true,
}
tidy { 'tidytmp4-dir':
  path    => '/tmp/tidy-tmp-4',
  recurse => 1,
  rmdirs  => true,
}
