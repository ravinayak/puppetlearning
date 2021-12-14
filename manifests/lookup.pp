class lookup {
  $users_arr = lookup('accounts::users')
  $groups = lookup('groups')
  notice($groups)
  notice($users_arr)
}
Class { 'lookup': }
