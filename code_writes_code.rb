# This isn't what we mean with "code that writes code"
klass = "Foo"

code = <<-CODE
  class #{klass}
    def method
      puts "Why?"
    end
  end
CODE

File.open("#{klass}.rb", 'w') { |f|
  f.write(code)
}



