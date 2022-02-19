$a_num_1=Numeric(true)
$a_num_2=Numeric('0xFF') # Base is determined by prefix of String, 0xFF => 0x: Hexadecimal
$a_num_3=Numeric('010') # 010 => 0: Octal
$a_num_4=Numeric('3.14') # No prefix => Decimal
$a_num_5=Numeric('10') # No prefix => Decimal
$a_num_6=Numeric('0b10') # 0b10 => 0b: Binary
# $a_num_7=Numeric("true") # this cannot be converted, because parameter is a string

notice("The values are: ${a_num_1} -- ${a_num_2} -- ${a_num_3} -- ${a_num_4} -- ${a_num_5} -- ${a_num_6}")

$x1=Integer[1,10] > Integer[2,8]
$x2=Integer[1,10] > Integer[0,5]
$x3=Integer[1,10] == Integer[2,3]
$x4=Integer[1,10] >= Integer[1,10]
$x5=Integer[1,10] > Integer[1,10]
$x6=Integer[1,10] == Integer[1,10]

notice("The values are :: ${x1} -- ${x2} -- ${x3} -- ${x4} -- ${x5} -- ${x6}")

$value=2
if($value =~ Integer[1,10]) {
  notice('value tests true against Integer[1,10]')
}
$x7=$value?
  {
    Integer => 'I am an integer',
    Integer[1,10] => 'I am an Integer[1,10]',
    default => 'No Values matched, hence defaulting',
  }
$x8=$value?
  {
    Integer[4,10] => 'I am an Integer[4,10]',
    Integer[2,10] => 'I am an Integer[1,10]',
    default => 'No Values matched, hence defaulting',
  }
  $x9=$value?
  {
    Integer[4,10] => 'I am an Integer[4,10]',
    Integer[0,1] => 'I am an Integer[0,1]',
    default => 'No Values matched, hence defaulting',
  }
  notice("Values of selector expression: ${x7} -- ${x8} -- ${x9}")

Integer[1,5].each |$x| {notice("The values of x are :: ${x}")}
# Unbound Range: Infinite: Integer[1,default].each |$x| {notice("The values interpolated are :: ${x}")}
$x10=Integer('3')
$x11=Integer('0XFF', 16)
$x12=Integer('0xFF')
$x13=Integer(true)
$x14=Integer(false)
$x15=Integer('010')
$x16=Integer('0B10')
# $x17=Integer('0XFF', 10) Error because prefix and base given are incompatible
notice("The values interpolated are :: ${x10} -- ${x11} -- ${x12} -- ${x13} -- ${x14} -- ${x15} -- ${x16}")

$x17=Float(true)
$x18=Float('0XFF')
$x19=Float('0B10')
$x20=Float(255)
$x21=Float('3.14')

notice("The values interpolated are :: ${x17} -- ${x18} -- ${x19} -- ${x20} -- ${x21}")

$x22=TimeSpan(13.5)
$x23=TimeSpan({days => 4})
$x24=TimeSpan(4,0,0,2)
$x25=TimeSpan('13.20')
# $x26=TimeSpan('10:03.5', '%M%S.%L') # Some Issue with format specifiers
# $x27=TimeSpan('10:03.5', '%M%S.%N')

notice("The values interpolated are :: ${x22} -- ${x23} -- ${x24} -- ${x25}")

$x26=TimeStamp(1473150899)
$x27=TimeStamp({string=>'2015', format=>'%Y'})
$x28=TimeStamp('Wed Aug 24 12:13:14 2016', '%c')
#$x29=TimeStamp('Wed Aug 24 12:13:14 2016 PDT', '%c $Z')

notice("The values interpolated are :: ${x26} -- ${x27} -- ${x28}")

$x30='abc' =~ String[1] # Strings of size >= 1
$x31='abc' =~ String[1,2]
$size=Integer[1,2]
$x32='abc' =~ String[$size] # String[Integer[1,2]] => String[>=1 <=2]
$x33=['a', 'b', 'c'] =~ Array[Pattern[/[a-z]/]] # Array which consists of patterns that can match any string between a and z.
$x34=['a', 'b', '%#'] =~ Array[Pattern[/[a-z]/]]
$x35='aaaabbbb' =~/\Aab*\Z/
notice("The values interpolated are :: ${x30} -- ${x31} -- ${size} -- ${x32} -- ${x33} -- ${x34} -- ${x35}")
class puppetlearning::typesystem(
  String $x36,
  Enum['a', 'z', 'c', 'd', 'e', 'f', 'g'] $x37,
  Pattern[/a*b*/,/ab/,/[[:digit:]]+/,/[[:alnum]]+/] $x41,
  Optional[String] $y51,
  Variant[Array[Integer],String] $y52,
  $y53 = undef,
){
  $x38 = $x36 =~ String
  $x39 = $x36 =~ Enum
  $x40 = $x36 =~ Enum['car', 'bus', 'truck']
  Enum['a', 'z', 'c', 'f', 'e', 'g', 'd'].each |$x| {
    notice("Value of Enum is :: ${x}")
  }
  $x42 = 'aaabbb' =~ Pattern[/a*b*/,/ab/,/[[:digit:]]+/,/[[:alnum]]+/] # string can match any of the specified regular expressions in the pattern
  $x43 = 'ab' =~ Pattern[/a*b*/,/ab/,/[[:digit:]]+/,/[[:alnum]]+/]
  $x44 = '1234' =~ Pattern[/a*b*/,/ab/,/[[:digit:]]+/,/[[:alnum]]+/]
  $x45 = 'ab123cd' =~ Pattern[/a*b*/,/ab/,/[[:digit:]]+/,/[[:alnum]]+/]
  notice("Class Params :: The values interpolated are :: ${x38} -- ${x39} -- ${x40} -- ${x40} -- ${x41} -- ${x42} -- ${x43} -- ${x44} -- ${x45}")
  notice("Class Params :: ${y51} -- ${y52} -- ${y53}")
  notice('End of class----------------------------------------------')
}

Class{ 'puppetlearning::typesystem':
  x36 => 'anvv',
  x37 => 'a',
  x41 => 'abbcc',
  y51 => 'cde',
  y52 => [1,2,3,4],
  y53 => {'a' => 123, 1 => 'tom' }
}

$x46 = Boolean('true')
$x47 = Boolean('yes')
$x48 = Boolean('y')
$x49 = Boolean('false')
$x50 = Boolean('no')
$x51 = Boolean('n')
$x52 = Boolean(0.0)
$x53 = Boolean(0)
$x54 = Boolean(1.0)
$x55 = Boolean(53)
$x56 = Boolean > Boolean(true)
$x57 = true =~ Boolean
notice("The values interpolated are :: ${x46} -- ${x47} -- ${x48} -- ${x49} -- ${x50} -- ${x51} -- ${x52} -- ${x53} -- ${x54} -- ${x55}")
notice("Values interpolated are :: ${x56} -- ${57}")

$x58 = SemVer('1.2.3')
$x59 = SemVer('1.7.5')
$x64 = SemVer('2.0.0')
$x65 = SemVer('2.3.5')
$x60 = SemVer[SemVerRange('>=1.0.0 <2.0.0'), SemVerRange('>=3.0.0 <4.0.0')]
$x61 = $x58 =~ $x60
$x62 = $x59 =~ $x60
$x63 = $x64 =~ $x60
$x66 = $x65 =~ $x60
notice("The Values interpolated are :: ${x58} -- ${x59} -- ${x60} -- ${x61} -- ${x62} -- ${x63} -- ${x66}")

$x67 = Binary('YWJj')
notice("The values interpolated are :: ${x67}")

$x68 = URI('http://www.example.com')
$x69 = URI({scheme => 'http', host => 'wwww.example.com', port => 8080, path => '/path/dir'})
$x70 = URI('http://bob:pwd@www.example.com:23/a/b?x=2#frag1')
$x71 = URI('abc:maroon:fish:baby')
notice("The Values interpolated are :: ${x68} -- ${x69}")
notice("The Values interpolated are :: ${x70.scheme} -- ${x70.host} -- ${x70.port} --- ${x70.path} -- ${x70.query} -- ${x70.fragment}")
notice("The Values interpolated are :: ${x71.scheme} -- ${x71.opaque}")

$x72 = URI('http://example.com/a/b/')
$x73 = URI('/c/d')
notice($x72+$x73) # URI('http://example.com/c/d')

$x74 = URI('c/d')
notice($x72+$x74) # URI('http://example.com/a/b/c/d')

$x75 = URI('https://example.com/a/b')
notice($x75+$x74) # URI('http://example.com/a/c/d')

$x76 = URI[scheme => Enum[http,https,true], query => Undef, fragment => Undef]
$x77 = URI('http://example.com/a/b') =~ $x76
$x78 = URI('http://example.com/a/b?x=y') =~ $x76
$x79 = URI('http://example.com/a/b#l22') =~ $x76

$x80 = URI[host => NotUndef, path => NotUndef]
$x81 = URI('http://example.com/a/b') =~ $x80
$x82 = URI('http://example.com') =~ $x80
$x83 = URI('file:///etc/passwd') =~ $x80

$x84 = URI[path => /^\//]
$x85 = URI('/a/b') =~ $x84
$x86 = URI('a/b') =~ $x84

$x87 = URI('http://example.com') # path in this case is NOT Undef but seems to be an empty string
$x88 = URI('file:///etc/passwd') # host in this case is NOT Undef but seems to be an empty string
$x89 = $x87.path =~ String
$x90 = $x88.host =~ String

notice("The Values interpolated are :: ${x77} -- ${x78} -- ${x79} -- ${x81} -- ${x82} -- ${x83} -- ${x85} -- ${x86}")
notice("The Values interpolated are :: ${x89} -- ${x90}")


$x91 = Array({})
$x92 = Array({scheme => 'http', host => 'www.example.com', port => 80, path => '/a/b'})
$x93 = Array[Float,1,2] # What does this return?
$x94 = [1,21,15,16,35,25,20]
$x95 = Array(45,true)
$x96 = Array(5,false)
$x97 = { 'scheme' => 'http', 'host' => 'www.example.com', 'port' => 80}
$x98 = Array($x97)
notice("The Values interpolated are :: ${x91.empty} -- ${x92} -- ${x93} -- ${x95} -- ${x96} -- ${x98}}")

$y1 = Hash[0,0]
$y2 = {} =~ $y1
$y3 = [1,2,3,4,5,6,7,8]
$y4 = Hash($y3)
$y5 = {'a' => 'ab', 'b' => 'cd', 'c' => 'ef' }
$y6 = {'d' => 'gh', 'e' => 'ij', 'b' => 'cd', 1 => 'hello'}
$y7 = $y5 + $y6
notice("The Values interpolated are :: ${y2} -- ${y4} -- ${y7}")

$y8 = [1,2,3]
$y9 = { 'a' => 123, 'b' => 'Tom' }
$y12 = { 1 => 'Tom', 'b' => 'Mercy' }
$y10 = $y8 =~ Collection[1,3]
$y11 = $y9 =~ Collection[3]
$y13 = $y12 =~ Collection[2]
notice("The values interpolated are :: ${y10} -- ${y11} -- ${y13}")

$y14 = [1000, 1100, 1200, 1500, 2500]
$y15 = ['tom', 'mercy', 'popkins', 'bed']
$y16 = {1 => 'tom', 2 => 'jerry', 3 => 'rockstar' }
$y20 = undef
$y17 = $y14 =~ Variant[Array[Integer[1000, 2500]], Array[Integer[3000, 5000]]]
$y18 = $y15 =~ Variant[Array[String[3]], Undef]
$y19 = $y16 =~ Variant[Hash[Integer[1], String[3]], Array[Integer[1,3]]]
$y21 = $y20 =~ Variant[String[3], Undef]
notice("The Values interpolated are :: ${y17} -- ${y18} -- ${y19} -- ${y21}")

$y22 = $y8 =~ NotUndef[Array]
$y23 = $y9 =~ NotUndef[Hash]
$y24 =  URI('http://example.com/a/b') =~ NotUndef[URI]
$y25 = 'abc' =~ NotUndef[String]
notice("The Values interpolated are :: ${y22} -- ${y23} -- ${y24} -- ${y25}")

