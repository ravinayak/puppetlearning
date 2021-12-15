class lookup {
  $users_hash = lookup('accounts::users')
  $groups = lookup('groups')
  notice($groups)
  $groups.each |$group| {
    notice($group[0])
    notice($group[1])
  }
  lookup('garima', String)
  # notice($users_hash)
}
Class { 'lookup': }
