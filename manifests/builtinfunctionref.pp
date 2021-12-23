  class puppetlearning::builtinfunctionref {
    #contain 'puppetlearning::containclassesdir::containclass1undeclared'
    # contain 'puppetlearning::containclassesdir::containclass2declared'
    
    # In this example, contain does not work because classes are not in module layout that they will be auto lodaded
    # Using contain throws an error - Could not find class. 
    # classes that are not in modules are not autoloaded and therefore cannot be referenced

    # Testin contain in gppuppet module
  }

  function functionwitha(){
    $x=7.5
    $y=-8.5
    $z=-12
    notice("Using abs method gives us the magnitude of each variable:: ${abs($x)} -- ${abs($y)} -- ${abs($z)}")
    notice("This uses alert function :: ${alert('hi there')}")
    $evenarr=[2,4,6,8,10]
    $oddarr=[1,3,5,7,9]
    $evenatendarr=[1,3,5,7,9,12]
    $res1=$evenarr.all |$element| { $element%2 == 0 }
    $res2=$oddarr.all |$element| { $element%2 ==0 }
    $res3=$evenarr.any |$element| { $element%2 == 0 }
    $res4=$oddarr.any |$element| { $element%2 == 0 }
    $res5=$evenatendarr.any |$element| { $element%2 == 0 }
    notice("Even Array tested for even with all :: ${res1}")
    notice("Odd Array tested for even with all :: ${res2}")
    notice("Even Array tested for even with any :: ${res3}")
    notice("Odd Array tested for even with any :: ${res4}")
    notice("EvenAtEnd Array tested for even with any :: ${res5}")
  }

  function functionwithbreak(){
    $nested_arr= [ [ [ 3, 4, 5 ], [ 6, 7 ] ], [ [ 8, 9 ], [ 10, 11 ] ] ]
    $nested_arr.each |$index1, $element1| {
      $element1.each |$index2, $element2| {
        $element2.each |$index3, $element3 | {
          # break: If you break here, no element will be displayed
          notice($element3)
          break
        }
        notice('I am outside break: Level 2')
      }
      notice('I am outside break: Level 1')
    }
    notice('I am outside nested loops')
  # This function clearly shows us that break only breaks from the current loop and not all loops, control is shifted to the next 
  # iteration for current loop. More accuratley, break actuall breaks current execution of current loop. control moves to next iteration 
  # of current loop
  # Output of current function:
    # Notice: Scope(Class[main]): 3
    # Notice: Scope(Class[main]): 4
    # Notice: Scope(Class[main]): 5
    # Notice: Scope(Class[main]): I am outside break: Level 2
    # Notice: Scope(Class[main]): 6
    # Notice: Scope(Class[main]): 7
    # Notice: Scope(Class[main]): I am outside break: Level 2
    # Notice: Scope(Class[main]): I am outside break: Level 1
    # Notice: Scope(Class[main]): 8
    # Notice: Scope(Class[main]): 9
    # Notice: Scope(Class[main]): I am outside break: Level 2
    # Notice: Scope(Class[main]): 10
    # Notice: Scope(Class[main]): 11
    # Notice: Scope(Class[main]): I am outside break: Level 2
    # Notice: Scope(Class[main]): I am outside break: Level 1
    # Notice: Scope(Class[main]): I am outside nested loops

  }

  # In order to call a function, we must provide name of function as a string (1st argument), and remaining arguments should be same as 
  # the arguments we would have supplied to the function. Look at the call made to functionwithcall below using *call* function

  function functionwithcall(
    String $name,
    Integer $int,
    Variant[Array,Hash] $var,
  ){
    notice($name)
    notice($int)
    notice($var)
  }

  function functionwithstringman(){
    $camel_case = 'camel_case_with_nothing'
    $capitalize = 'howisthat?'
    notice($camel_case.camelcase())
    notice($capitalize.capitalize())
    # camelcase function removes all underscores and capitalizes 1st word of each word after underscore
    # camel_case_with_nothing: CamelCaseWithNothing

    $chomp_ex = "hello\r\n" # Contains newline, record, tab and a whitespace
    # chomp only removes a. \r\n b. \r c. \n from the end of a string. It does not remove other whitespace characters
    # a. tab b. single or multiple whitespace characters c. \n\r (this is a little weird but record separator followed by new line is
    # removed: \r\n)
    $chop_ex = 'string'
    notice($chomp_ex.chomp())
    notice($chop_ex.chop())
  }

  function functionwithc(){
    # ceiling function works only with float numbers, any integer input to ceiling or floor function simply returns that integer
    # To convert any data strucuture(such as array) to a Hash, the data strucutre must have even number of elements
    # compare function is meaningful for both strings and numbers, for strings, we consider the *lexicographic* order
    # Strings + Hashes : Can be converted to Array
    # When using if statement, the entire boolean expression must be wrapped inside (....):
    #   the format is : if(<boolean-expression>): if ($index+1) < $x.length is incorrect: if(($index+1) < $x.length)
    # convert_to is similar to calling new(type, value): however, it is more readable and can be chained from left to right

    notice("Ceiling function :: 6.5 -> ${ceiling(6.5)}; 6.7 -> ${ceiling(6.7)}; 6.3 -> ${ceiling(6.3)}")
    $hash_var = { 'ron' => 12, 'sun' => 13, 'sat' => 14 }
    notice("convert_to from hash to array :: ${hash_var.convert_to(Array)}")

    $z='abcd'.convert_to(Array).reduce([1,2,3,4,5,6]) |$res, $val| { $res << $val }.convert_to(Hash)
    # To convert an array to hash or any other data structure, the data structure must have an even number of elements in it
    notice($z)

    $x=[1, 3, 13, -80, -100, -250, 200, 41, 68, 68]
    $x.each |$index, $value| {
      if(($index+1) < $x.length){
        notice $value.compare($x[$index+1])
      }
    }
    $ab = new(Array, 'abc')
    $bc = new(Hash, [1,2])
    notice($ab)
    notice($bc)
  }

function functiontocreateresources(){
  $users = {
    'nick' => {
      ensure => present,
      uid    => 1008571,
    },
    'tom' => {
      ensure => present,
      uid    => 1008572,
    }
  }
  $files = {
    '/codetestfiles/functiontest1.txt' => {
      ensure => file,
      owner  => 'nick',
    },
    '/codetestfiles/functiontest2.txt' => {
      ensure => file,
      owner  => 'tom',
    }
  }
  notice('calling create resources function')
  create_resources('user', $users)
  create_resources('file', $files)
  exec {'/usr/bin/ls -al /codetestfiles/functiontest1.txt':
    path      => ['/usr/bin', '/usr/sbin', '/bin'],
    logoutput => true
  }
  crit('This is a critical logging')
}


# Calls made to function here
# functionwitha()
# functionwithbreak()
# call('functionwithcall', 'Ron',  10, [12, 13, 14])
# functionwithstringman()
# functionwithc()
# functiontocreateresources()

Class { 'puppetlearning::builtinfunctionref': }
