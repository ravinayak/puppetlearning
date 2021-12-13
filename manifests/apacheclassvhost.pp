class apacheclassvhost(
)
{

  Class{ 'apache': }
  apache::vhost { 'acme.com':
    ensure        => absent,
    port          =>  8080,
    docroot       => '/var/www/user',
    docroot_owner => 'www-data',
    docroot_group => 'www-data',
  }
  apache::vhost { 'netflix.org':
    ensure        => absent,
    port          => 8080,
    docroot       => '/var/www/usr',
    docroot_owner => 'www-data',
    docroot_group => 'www-data',
  }
}
Class { 'apacheclassvhost': }
# class typesystem(
#   String $x36,
#   Enum['a', 'z', 'c', 'd', 'e', 'f', 'g'] $x37,
#   Pattern[/a*b*/,/ab/,/[[:digit:]]+/,/[[:alnum]]+/] $x41,
#   Optional[String] $y51,
#   Variant[Array[Integer],String] $y52,
#   $y53 = undef,
# ){
#   $x38 = $x36 =~ String
#   $x39 = $x36 =~ Enum
#   $x40 = $x36 =~ Enum['car', 'bus', 'truck']
#   Enum['a', 'z', 'c', 'f', 'e', 'g', 'd'].each |$x| {
#     notice("Value of Enum is :: ${x}")
#   }
#   $x42 = 'aaabbb' =~ Pattern[/a*b*/,/ab/,/[[:digit:]]+/,/[[:alnum]]+/] # string can match any of the specified regular expressions in the pattern
#   $x43 = 'ab' =~ Pattern[/a*b*/,/ab/,/[[:digit:]]+/,/[[:alnum]]+/]
#   $x44 = '1234' =~ Pattern[/a*b*/,/ab/,/[[:digit:]]+/,/[[:alnum]]+/]
#   $x45 = 'ab123cd' =~ Pattern[/a*b*/,/ab/,/[[:digit:]]+/,/[[:alnum]]+/]
#   notice("Class Params :: The values interpolated are :: ${x38} -- ${x39} -- ${x40} -- ${x40} -- ${x41} -- ${x42} -- ${x43} -- ${x44} -- ${x45}")
#   notice("Class Params :: ${y51} -- ${y52} -- ${y53}")
# }

# Class{ 'typesystem':
#   x36 => 'anvv',
#   x37 => 'a',
#   x41 => 'abbcc',
#   y51 => 'cde',
#   y52 => [1,2,3,4],
#   y53 => {'a' => 123, 1 => 'tom' }
# }
