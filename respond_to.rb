class Foo
  def method_missing name
    return name == :miss || super
  end
end

foo = Foo.new

foo.miss # => true

foo.respond_to? :miss # => false

class Foo
  def respond_to? name
    return name == :miss || super
  end
end

foo.method :miss
# => NameError: undefined method
#    'miss' for class 'Foo'

class Foo
  def respond_to_missing? name, *args
    return name == :miss || super
  end
end

foo.method :miss
# => #<Method: Foo#miss>

Foo.instance_methods.grep(/miss/)
# => [:method_missing,
#     :respond_to_missing?]

class Foo
  def respond_to? name
    return name == :miss || super
  end

  def method_missing name
    return super unless\
      respond_to? name
    true
  end
end