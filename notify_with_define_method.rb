class Loquacious
  def self.def_notify_method(name, &block)
    define_method name do |*args|
      puts "Going to #{name}"
      block.call(*args)
      puts "Done with #{name}"
    end
  end

  def_notify_method :say_hi do |name|
    puts "hi, #{name}"
  end
end