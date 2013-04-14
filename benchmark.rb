require 'benchmark'

class MethodMissing
  def method_missing(name, *args)
    return super unless (name =~ /a_method/)
  end
end

class MethodMissingMemo
  def method_missing(name, *args)
    return super unless (name =~ /a_method/)
    self.class.class_eval do
      define_method name do
        nil
      end
    end
  end
end

class DefMethod
  def self.add_method name
    define_method name do |*args|
      nil
    end
  end

  add_method :a_method
end

class DefMethodEval
  def self.add_method name
    eval """
      def #{name}
        nil
      end
    """
  end
  add_method :a_method
end

class Normal
  def a_method
    nil
  end
end

def bench
  m1 = MethodMissing.new
  m2 = MethodMissingMemo.new
  m3 = DefMethod.new
  m4 = DefMethodEval.new
  m5 = Normal.new


  Benchmark.bm do |x|
    x.report {50000.times {m1.a_method}}
    x.report {50000.times {m2.a_method}}
    x.report {50000.times {m3.a_method}}
    x.report {50000.times {m4.a_method}}
    x.report {50000.times {m5.a_method}}
  end
end
