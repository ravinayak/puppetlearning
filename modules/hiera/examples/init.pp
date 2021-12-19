class { 'hiera':
  datadir   => '/codetestfiles/puppetlabs/puppet/hieradata',
  hierarchy => [
    '%{environment}/%{calling_class}',
    '%{environment}',
    'common',
  ],
}
