class puppetlearning::builtinfunctionref_defined{
  # Defined function works with following
  # 1. class/definedtype: Class/DefinedType must be in module for the function to work, this is because, a class or a defined type
  #                       will get autoloaded only in autoload module layout. If you have a class or define type, defined within 
  #                       same repository outside module, then despite of being defined, defined function returns false since they
  #                       are not autoloaded
  # 2. BuiltIn/Custom RsourceTypes: This will always return true because their definitions exist and can be verified
  # 3. Variable: Works even when variable is assigned a value of *undef*
  # 4. Defined function tests for definition, and not declaration or what value is assigned during definition. So even if a variable
  #    is assigned a value of undef, it works
  # 5. Defined function does depend upon *evaluation order* and therefore it may not be very reliable to use inside modules. This is
  #    because a module's classes may be loaded in any order unless explicitly  specified through stages. This means if we define 
  #    - defined function - in 1 class expecting it to work assuming that the other class will get loaded post the current one, we 
  #    could easily mkae mistakes
  # 6. Evaluation Order within file is acceptable design but not outside orders
  #

  debug('This is a debug function call')
  # A class or a defined type must be defined as top level resource outside a module
  # Inside a module, a defined type can be defined inside a class, even if it is not a top level resource, it will work
  # This means the following will not work:
  # define definedtypetest(){}: Will not work in puppetlearning repository
  # but it will work in module gppuppet installed in this repository

  $testfile_before_definition = defined(File['/codetestfiles/definedfiletest.txt'])
  notice("This should be false, defined tests before file definition, evaluation order matters :: ${testfile_before_definition}")
  file {'/codetestfiles/definedfiletest.txt':
    ensure => file,
  }
  # define puppetlearning::builtinfunctionref_d_h::definedtypetest(){
  #   notice('defined type works with defined')
  # # }
  # if defined('definedtypetest'){
  #   notice('defined type works with defined')
  # }
  if defined('gppuppet::containtest') {
    notice('class works with defined')
  }

  # Single quote must be used with variables to avoid Interpolation issues
  $x=undef
  if defined('$x'){
    notice('variable works with defined')
  }
  if defined('file'){
    notice('Resources built into Puppet will also work')
  }
  # User Resource is built into Puppet, hence defined always returns true
  if defined('user'){
    notice('user resource is not present, hence it will not be printed')
  }
  if defined(File['/codetestfiles/definedfiletest.txt']){
    notice('Resource Reference works with defined')
  }
  if defined('gppuppet::containtest'){
    notice('Module class works with defined')
  }
  if defined('gppuppet::containtest1'){
    notice('Module class works with defined - this will not be printed because no such class exists')
  }
  $test = defined(gppuppet::advancedresourcetypes::advancedresourcetypesdefaults::defaultsdefinedtypewithinclass)
  notice($test)
}
include puppetlearning::builtinfunctionref_defined
