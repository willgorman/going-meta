# If we use def + eval, we no longer
# have a closure and objects in the local
# scope are not retained by our new method
class DefineMethod
  some_large_object =
    "Hi, I'm a large object"

  method_name = :a_method
  class_eval "
    def #{method_name}
      puts some_large_object
    end
  "
end

DefineMethod.new.a_method
# => NameError: undefined local variable
# => or method 'some_large_object'