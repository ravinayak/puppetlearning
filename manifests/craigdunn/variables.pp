include stdlib
$user='rahul'
$firstname='Rahul'
$lastname='Dichosta'
$comment="${firstname} ${lastname}"
$y=12
$z=1.9
$a='Ravi'
$b=1.25
notice("Here are the values interpolated: ${y} - ${z} - ${a} - ${b}")
user{$user:
  ensure  => absent,
  comment => $comment,
}
file{'/etc/ntp.conf':
  ensure => absent,
}
#$var=123
#$var='123'
# notice("Data Type :: ${Type[$comment]}")
notice("Facts top level variable :: ${facts['os']['release']['full']}")
notice("Trusted top level variable :: ${trusted['certname']}")

class craigdunn::variables(
  String $str,
  Integer $int,
  Float $float,
  Numeric $numeric,
  Boolean $bool,
  Array $arr,
  Enum['rat', 'cat', 'zebra', 'lion'] $enum,
  Hash $hash,
  Regexp $regexp,
  Undef $und,
  Type $type1_type,
  Type[Integer] $type2_integer,
  Type[String[1,100]] $type3_string_1_100,
  Type[Resource] $type4_resource,
  Type[User] $type5_user,
  Type[Integer[1,10]] $type6_integer_1_10,
  Array[String] $arr_str,
  Hash[String,Integer] $hash_str_key_val_int,
  Any $any_type,
  Variant[String, Undef] $variant_str_undef,
  Pattern[/a/,/(\w)+a.*/,/abc*/] $pattern,
  Scalar $scalar,
  Data $data,
  Collection $collection,
){
  notice("The variables are interpolated as: ${str} -- ${int} -- ${float} -- ${numeric} -- ${bool} -- ${arr} -- ${enum} -- ${hash} -- ${regexp}")
  notice("The variables are interpolated as: ${und} -- ${type1_type} -- ${type2_integer} -- ${type3_string_1_100} -- ${type4_resource}")
  notice("The variables are interpolated as: ${type5_user} -- ${type6_integer_1_10} -- ${arr_str} -- ${hash_str_key_val_int}")
}
# pry()
Class{ 'craigdunn::variables':
  str                     => 'Hey there I am a string being passed through resource declaration of a class',
  int                     => 3,
  float                   => 3.5,
  numeric                 => 4.5,
  bool                    => true,
  arr                     => [1,2,3,4,5, 'is there', true],
  enum                    => 'lion',
  hash                    => { 'a' => 123, 'b' => 'Hi There'},
  regexp                  => /(\w)+abc$/,
  und                     => undef,
  type1_type              => String,
  type2_integer           => Integer[1,10],
  type3_string_1_100      => String[3,80],
  type4_resource          => File['/etc/ntp.conf'],
  type5_user              => User,
  type6_integer_1_10      => Integer[4,7],
  arr_str                 => ['los', 'angeles', 'san'],
  hash_str_key_val_int    => { 'los' => 10, 'angeles' => 50, 'min' => 100 },
  any_type                => 2.5,
  variant_str_undef       => undef,
  pattern                 => 'aabc',
  scalar                  => true,
  collection              => {'s' => 'here we go', 12 => 'ridiculous'},
  data                    => 12,
}
