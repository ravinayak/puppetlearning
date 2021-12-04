include stdlib
include includecheck
#include basicresourcetypes
$ensure_value = 'absent'
Class { 'basicresourcetypes::groupresourcetype':
  ensure_val => 'present',
  users      => [
    {
      name   => 'test-user-1',
      uid    => 3001,
      groups => 'group3',
      gid    => 1015,
    },
    {
      name   => 'test-user-2',
      uid    => 3002,
      groups => 'group1',
      gid    => 1016
    },
    {
      name   => 'test-user-3',
      uid    => 3003,
      groups => 'group2',
      gid    => 1017
    }
  ]
}
