class A
 def call_private
  a_private
 end

 private
 def a_private
  p "this is a_private method"
 end
end

a = A.new
a.call_private
a.a_private # 外からは呼び出せない