# When using define_method, be aware that the closure
# used for the body of the method will contain references
# to anything in the scope where it is defined for the
# lifetime of the closure.  Since the closure is bound
# to a method on a class, that will probably be the lifetime
# of the program
class DefineMethod
  some_large_object =
    "Hi, I'm a large object"

  define_method :a_method do
    puts some_large_object
  end
end

DefineMethod.new.a_method
# => "Hi, I'm a large object"