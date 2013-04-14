class MyClass
  def attribute
    @attribute
  end

  def attribute= attribute
    @attribute = attribute
  end
end

class MyClass
  attr_accessor :attribute
end