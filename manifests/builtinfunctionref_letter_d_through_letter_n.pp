class puppetlearning::builtinfunctionref_letter_d_through_letter_n{
  # NOTE: Function calls 
  $x=[1, 2, [1, 2, [1, 2, [1, 2, 3]]]]
  $y={
    'users' => {
      'nick' => {
        'uid'=> {
          'gid' => 23,
        }
      }
    }
  }

  # fail(123)
  notice('---------------------------------------------------------------------------------------')
  # dig prevents us from undef errors, in a way, it acts as a guard against undef
  notice($x.dig(1))
  notice($x.dig(2, 2, 2))
  notice($y.dig('users', 'nick'))
  notice($y.dig('users', 'nick', 'uid', 'gid'))
  notice($y.dig('users', 'sick', 'pid', 'gid'))

  notice('---------------------------------------------------------------------------------------')
  # Downcase function is one of the functions in puppet which works recursively on all elements of a nested data structure
  $z=['RoN', 'AppLLE', [['JonDICHosta']]]
  $a={
    'UseRS' => {
      'NIcK' => {
        'JoN' => ['RoN', 'AppLLE', [['JonDICHosta']]]
      }
    }
  }
  notice("${'HeLlO'.downcase}")
  notice("${z.downcase}")
  notice("${a.downcase}")

  # each function when used with a lambda that consumes 1 parameter:
  # a. Array: element in array
  # b. Hash: Value in Hash

  # each function when used with a lambda that consumes 2 parameters
  # a. Array: index, element
  # b. Hash: key, value

  emerg('This is emergency level logging')

  $z.each |$item| { notice($item) }
  $z.each |$index, $item| { notice("${item} -- ${index}") }
  notice('---------------------------------------------------------------------------------------')
  # Empty array, Hash and empty strings return true on empty test; empty strings means no character
  notice({}.empty)
  notice([].empty)
  notice(''.empty)

  err('This is an example of an err function')

  # Most file functions can take absolute path as well as relative path. Absolute path allows us to load a file from anywhere on 
  # disk, where as relative path allows us to load a file from file location relative to modules. However, when using absolute paths
  # the file must exist already and not be created in the same file where we are using file function to load, else it gives not found
  # error.
  # here file is being used as a resource
  #
  notice('---------------------------------------------------------------------------------------')
  $file_absolute_path='/codetestfiles/samplefiletoload.txt'
  file{ $file_absolute_path:
    ensure  => file,
    content => 'This file is being created to test load of file from absolute path',
  }
  # Here file is being used as a function
  # by default, file function expects to load a file from a module within the base directory from where it is being called, it does 
  # not use *puppet:///* protocol
  # file function consumes a single input, or a string of inputs but not an array or a comma separated list
  $module_file = 'gppuppet/samplefile.txt'
  notice('---------------------------------------------------------------------------------------')
  notice(file($file_absolute_path))
  notice(file($module_file))
  notice(file('gppuppet/notexistent1.txt', 'gppuppet/samplefile.txt', 'puppetlearning/motd.txt'))


  # filter method, like *each* method, also consumes 1 or 2 parameters, for 1 parameter, it only passes value, for two parameters it
  # passes both (index or key) and value
  # Short Circuit operators like *&&* *||* do not work with logical boolean expressions in Puppet, instead use *and/or* 
  $even_odd_filter = [1,3,2,4,8,11,13,15,17,10,23,12,16,18,20]
  notice($even_odd_filter.filter |$element| { $element % 2 == 0 })
  $even_odd_hash = { 'x' => 'rasberry', 'y' => 'zero', 'z' => 'strawberry', 'a' => 'cherry', 'b' => 'aPPle' }
  notice($even_odd_hash.filter |$key, $value| { $key =~ /[xyzabeio]/ and $value =~ /erry$/ })

  # file function finds the file and returns its content, whereas find_file is designed to find files and so is find_template
  # Any function which searches for a file specifically will return the location - path of the file.
  # all functions that search for something such as file, take, more than 1 input, and return the 1st found file in that list
  # Search functions such as a. find_file c. find_template can consume both types of input:
  #   a. Array of file names
  #   b. Single file name as a string
  #   c. Multiple file names as a comma separated list [ Equivalent to an Array ]
  notice('---------------------------------------------------------------------------------------')
  $file_path_single = 'gppuppet/samplefile.txt'
  # Here 1st input is not found, 2nd and 3rd inputs exist but because 2nd input is found 1st, it is located and returned. 3rd is
  # ignored
  #
  $file_path_array = ['gppuppet/non-existent-path', 'gppuppet/samplefile.txt', 'puppetlearning/motd.txt']
  $file_path_str = $file_path_array.join(',')
  [$file_path_single, $file_path_array, $file_path_str].each |$file_param_in_different_format| {
    notice(find_file($file_param_in_different_format))
  }
  $template_path = find_template('gppuppet/templating_file_2.epp')
  notice('---------------------------------------------------------------------------------------')
  $arr = [1,2,3,[4,5],[[6,7,[8,0]]]]
  notice($arr.flatten)

  $fqdn_val = fqdn_rand(15, 'seed_str')
  notice("val :: ${fqdn_val}")

  # get function can be thought of as a brother of *dig* function. Both *dig* and *get* functions attempt to obtain the value at a 
  # specific position within a nested data structure. Difference being that dig uses indices of array to find value for a given 
  # key while get function uses *dot notation*. *dot notation* serves as the *navigation string*,
  # default values and error handling lambda can be provided as 2nd and 3rd parameters
  # Ex: 2.3.2 (navigation string) for array, it means, 
  #   Call input array as *a* where a = [1,2,[1,2,3,[5,7,9]]].get('2.3.2', 'default_when_get_returns_undef')
  #   x (say) = Element at 2nd position within the given array - *a* = [1,2,[1,2,3,[5,7,9]]]
  #   y (say) = Element at 3rd position within the array - *x* = [1,2,3,[5,7,9]]
  #   z (say) = Element at 2nd position within the aray - *y* = [5,7,9] 
  #   Answer from above calculations = 9
  # We can use the same explanation as given above for hashes once we replace (given array by given hash)
  #
  notice('---------------------------------------------------------------------------------------')
  notice($facts.get('os.family'))
  notice([1,2,[1,2,3,[5,7,9]]].get('2.3.2', 'default_when_get_returns_undef'))
  notice([1,2,[1,2,3,[5,7,9]]].get('2.3.5', 'default_when_get_returns_undef'))

  $z1 = {
    'red' => {
      'white' => {
        'black' => 'orange'
      }
    }
  }

  # Errors must not be *evaluation error*. If we use following example, 
  #   [1,2, 'blue', 3] => '2.1.3' navigation string results in an evaluation error because there is no collection at 2nd position 
  #   in the array, it is a single element - a string. This will not cause error lambda to be called, instead it will cause evaluation
  #   error.
  #
  notice('---------------------------------------------------------------------------------------')
  notice($z1.get('red.white.black'))
  [1,2, ['blue']].get('2.color') |$error| {
    notice("Walked path is ${error}")
  }

  # group_by is a very useful method because it allows us to group elements within an array or a hash based on the results of a lambda
  # resulting in creation of an absolutely new collection from given input. This can be thought of a transformation operation which 
  # has the potential to transform a specific input into a new collection
  #
  # group_by groups elements on the basis of result of a boolean expression. We can get an entirely new collection using group_by
  # rules of single parameter in usage of array and hash are same for group_by as with other iterative functions
  #
  # Input: Array    # of Parameters = 1
  # Values passed to parameter = 1; Data Type of Value passed = Single Element; Value passed to parameter = Element of Array
  # Input : Hash    # of Parameters = 1
  # Values passed to parameter = 1; Value passed to parameter = Single 2-element array: [key, value] => 0th pos = key, 1st pos = value
  #
  # Input: Array    # of Parameters = 2
  # Values passed to parameter = 2; Data Type of Value passed = Single element; Values passed = <Index, Element of Array>
  # Input: Hash     # of Parameters = 2
  # Values passed to parameter = 2; Data Type of Value passed = Single element; Values passed = <key, value>
  #
  notice('---------------------------------------------------------------------------------------')

  $x1 = { 1 => ['a', 'b'], 2 => [ 'c', 'd', 'e', 'f'] }

  $x2 = [1, 2, 3, 4, 5]
  $res1 = $x1.group_by |$key_val| { $key_val[0] %2 == 0 }
  # here boolean expression results in true/false, hence elements of hash are grouped by true/false

  $res2 = $x1.group_by |$key, $val| { $val.length }
  # here length of value corresponding to key in hash is used to group elements, so we see a new hash with keys - 2 and *d*

  $res3 = $x2.group_by |$index, $val| { $index % 2 == 0 }
  notice("Results :: ${res1}   --     ${res2}     ---     ${res3}")


  # Index function differs from iterative functions in 1 aspect and only 1 aspect, rest everything is same, 
  # Difference: When we pass 1 parameter to index function for a Hash, instead of a single 2 element array, only value for key
  # is passed
  # Name *index* itself suggests that this is another search function, where we search for a value and return *index* of that value
  # in the data structure, meaning - position or key that corresponds to that value and not the actual value
  # In this sense, if it has to find a value in an iterable object like array or a hash, it must iterate over that data structure
  # We can also use a lambda but in such a case, result of the execution of lambda is returned
  # Index function can also be used to search for a sequence of characters in a string, in this case, the starting position where
  # the sequence of characters begins is returned as the result of calling the function
  #
  notice('---------------------------------------------------------------------------------------')
  notice('abcdefghijk'.index('fghi'))
  notice($x1.index(['a', 'b']))
  notice($x2.index(5))
  $res_arr_index = $x2.index |$param| { $param + 2 } # this example does not have any semantic value
  $res_hash_index = $x1.index |$value| { $value == ['a', 'b']} # Returns index of ['a', 'b'] in $x1 = (hash => index = key ) 1
  notice($res_arr_index)
  notice($res_hash_index)


  notice('---------------------------------------------------------------------------------------')
  notice($x1.keys()) # For arrays, this method does not work, only for hashes, because hashes have keys

  notice('---------------------------------------------------------------------------------------')
  $x_lstrip = "\n\t    abcdef"
  notice($x_lstrip.lstrip)

  notice('---------------------------------------------------------------------------------------')
  $x_undef=undef
  # lest can be thought of as a guard against *undef*, if any value amounts to undef, instead of failing at that point,
  # using lest returns false which can be used as a boolean equivalent to take decisiions
  # lest must be used with a lambda, when lest is supplied with any argument, it either returns the argument or calls lambda
  # 
  # In the following example with *.* operator, if lest were not defined, $data would simply return undef
  # Also note that normally in Puppet code we use *and/or* logical operators instead of *&&/||* operators, but with lest we should
  # use *||* operator
  #
  lest($x_undef) || { print_hello() }
  $data = { a => [b, c]}
  # Commenting out code for it will fail the catalog compilation
  #notice $data.dig('a', 3).then |$x| { $x + 2}.lest || { fail('no vlaue for $data[a][b][c]') }
  notice('---------------------------------------------------------------------------------------')

  # Match function is used for matching patterns against a string. We can use capture groups to capture matching parts of string
  # Match function differs from *=~* in the sense that *=~* operator only returns boolean - true/false while with match function
  # we get matching parts of string
  # What is even more interesting about match function is that it matches elements of an array and results grouped by index positions
  $str_match = 'ras12345berry4368abcde'
  $result_match = $str_match.match(/([ras]+)(\d+)(berry)(\d+)([a-e]+)/)
  notice($result_match)

  $matches = ['abc123', 'def456'].match(/([a-z]+)(\d+)/)
  notice($matches)


  notice('---------------------------------------------------------------------------------------')
  # max function and min function both have following similarities:
  # 1. Strings are retained and not converted into numeric form even if it is possible, Ex: '0888' is a string
  #    in octal form but it is not converted into decimal
  # 2. Lexicographic order determines if 1 value is greater than the other. 'a' < 'b'
  # 3. max function takes multiple arguments and not an array, so convert array into multiple values using * operator
  notice(max(1))
  notice(max(1,2))
  notice(max('0777', 512)) # Here string characters have higher lexicographic value as compared to integers for comparison: 0777
  notice(max('abc', 1234)) # Result: abc
  notice(max(0777, 512))
  notice(max('aa', 'ab'))
  notice(max(['a'], ['b']))

  notice('---------------------------------------------------------------------------------------')
  notice(module_directory('gppuppet'))
}

function print_hello() {
  notice('hello')
}
include puppetlearning::builtinfunctionref_letter_d_through_letter_n
