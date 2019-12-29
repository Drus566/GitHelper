


# Table of Contents
1. [Base](#Base)
1.2 [Comments](###Multiline)
1.3 [Terminal output](##Terminal output)

# Base
## Comments
### Multiline
```
=begin
comment 
=end
```
## Terminal output
### Output for array
`print`
## Variables and constants
### Global
`$pass = 'qwerty'`
### Constant
`PI = 3.14`
### Parallel assignment
`a = b = c = 42`
### Multiple assignment
`a,b,c = 0, 9, 3`
## Handle errors
```
begin
  raise NoMemoryError, 'Out of memory'
rescue NoMemoryError => exception_variable
  puts 'Error OnMemoryError', exception_variable
else 
  puts 'Code perform without errors'
ensure
  puts 'Code perform in anyway'
end
```
## Arifmetic operations
### Exponent
`2 ** 5` => 32
## Strings
* `string1 = %q[Escapes any quotation marks, but doesn't understend \n]`
* `string = %q(things)`
* `string2 = %Q[Escapes any quotation marks and understend \n]`
* `array_of_strings = %w(apple orange coconut)`
### Command of linux 
* ``` string3 = `ls -a` ```
### Documents
``` 
text = <<MARKER
marker
may be
any
MARKER
```
### Gsub
```
"hello".gsub(/[aeiou]/, '*')                  # => "h*ll*"
"hello".gsub(/([aeiou])/, '<\1>')             # => "h<e>ll<o>"
"hello".gsub(/./) {|s| s.ord.to_s + ' '}      # => "104 101 108 108 111 "
"hello".gsub(/(?<foo>[aeiou])/, '{\k<foo>}')  # => "h{e}ll{o}"
'hello'.gsub(/[eo]/, 'e' => 3, 'o' => '*')    # => "h3ll*"
```
### Note
* `String methods ending with "!" modify an existing string`
## Symbols
### Create
`array_of_symbols = %i(a b c)`
## Array
### Create
* `empty_arr = Array.new(5)` => [nil,nil,nil,nil,nil]
* `true_arr = Array.new(5,true)` => [true,true,true,true,true]
### Get element
* `my_array.[] 1` => get element with index 1
* `my_array.valuest_at(1,2,3,1..2)`
* `my_array.take(3)`
### Add
* `test_array.push(3)` => in end
* `test_array.unshift(5)` => in begin
* `test_array.insert(3, 32, 90)` => in 3 position
### Delete
* `array.pop` => last element
* `array.shift` => first element
* `array.delete_at(4)` => indicated position
* `array.delete(2)` => concrete value
* `array.compact` => delete nil
* `array.uniq` => delete duplicate values
### Sample
* `p a.sample(2) # => 2 случайных элемента`
## Logic expressions
* `!0` => false
* `1 <=> 1` => 0, values are equal
* `1 <=> 2` => -1, left value less
* `2 <=> 1` => 1, left value greater
## Control structures
### conditions
* `x = if a > 0 then b else c end
* `x == 1 ? puts 'true' : puts 'false'`
### case
```
period = 2.3
case period
  when 0 
    puts 'beginner'
  when 0..1
    puts 'junior'
  when 1..3 
    puts 'middle'
  else
    puts 'super!'
end
```
```
case 20
when 1..20
  puts "Between 1 & 20"
when 21..40
  puts "Between 21 & 40"
else
  puts "Not within a valid range"
end
```
## Cycles
### while
```
counter = 1
while counter <= 5
  puts "iteration #{counter}"
  counter += 1
end
```
### until 
```
counter = 0
until counter == 5
  puts 'values of counter #{counter}'
  counter += 1
end
```
### loop
```
loop do
  # code..
  break if condition
end

loop do
  # code..
  break unless anticondition
end
```
### times, upto
```
n.times do |i|
  # code...
end

0.upto(n) do |i|
  # code... 
end
```
### for, each_index
```
for i in 0..10 do
  # code...
end

list.each_index do |i|
  # code...
end
```
## Enumerators
### Get summ of all elements
* `(5..10).reduce(:+)`                 => 45
* `(5..10).inject {|sum, n| sum + n}`   => 45
### Create array
* `(1..4).map { |i| i*i }` => [1,4,9,16]
* `(1..4).collect { "cat" }` => ["cat","cat","cat","cat"]
### Each, select, reject, map
``` 
a = [1, 3, 4, 7, 8, 10]
a.each { |num| print num } # => 1347810 (нет новой строки)
puts # => (с новой строки)

new_arr = a.select { |num| num > 4 }
p new_arr # => [7, 8, 10]
new_arr = a.select { |num| num < 10 }
           .reject{ |num| num.even? }
p new_arr # => [1, 3, 7]

# Умножить каждый элемент на 3, создав новый массив
new_arr = a.map {|x| x * 3}
p new_arr # => [3, 9, 12, 21, 24, 30]
```
### Flatten
```
s = [ 1, 2, 3 ]           #=> [1, 2, 3]
t = [ 4, 5, 6, [7, 8] ]   #=> [4, 5, 6, [7, 8]]
a = [ s, t, 9, 10 ]       #=> [[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10]
a.flatten                 #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a = [ 1, 2, [3, [4, 5] ] ]
a.flatten(1)
```
## Functions
``` 
def double(x)
  x*2
end

double double 4 # => 16
```
### splat operator(list of parameters in one array)
```
def foo(*array)
  print array
end

foo("arg1",2,false) # => ["arg1", 2, false]
```
### yield (function get block of code though yield)
```
def surround
  puts "{"
  yield
  puts "}"
end

surround { puts 'hello world' }
```
## Regular expressions
### create
`regular_expression = %r([0-9])`
### match
```
"aaaa1".match?(/[0-9]/) # => true
"".match?(/[0-9]/) # => false
```
## Range
### include?, max, ===
```
some_range = 1..3
puts some_range.max # => 3
puts some_range.include? 2 # => true

puts (1...10) === 5.3 # => true
puts ('a'...'r') === "r" # => false (конец исключается)

p ('k'..'z').to_a.sample(2) # => ["k", "w"]
# или другой случайный массив с двумя буквами из диапазона
```
### letters
`'a' .. 'z'`
### include, exclude
* `1..5` include 5
* `1...5` exclude 5
### Note
* Can convert to array `to_a`
## Hash
### Confusing between hash and block
```
# Скажем, у вас есть хэш
a_hash = { :one => "one" }

# Затем вы выводите его
puts a_hash # => {:one=>"one"}

# Если вы попытаетесь сделать это за один шаг - вы получите SyntaxError
# puts { :one => "one" }

# Ruby путается и думает, что {} является блоком!!!

# Чтобы обойти это, вы можете использовать скобки
puts ({ :one => "one" }) # => {:one=>"one"}

# Или вообще отбросить {}... 
puts one: "one" # => {:one=>"one"}
```
# OOP
## Variables
`@@` - variable of class
`@` - variable of instance 
```
class Human
  @@species = "H.sappiens" # variable of class
  NAME = "Humas Class" # constant of class
  
  def initialize(name, age = 0)
    @name = name # variables of instance
    @age = age
  end
  
  def species # getter for @@species
    @@species 
  end
  
  def name=(name) # setter for @name
    @name = name 
  end
  
  def name # getter for @name
    @name
  end
  
  attr_reader :name, :age # getters for variables of instace
  attr_writers :name, :age # setters for variables of instace
  attr_accessor :name, :age # include getters and setters 
  
  def self.say # method of class, call method Human.say
    puts 'ggwp'
  end
end
```
## Inheritance
```
class Doctor < Human
  def examinePatient 
    # ...
  end
  
  def method1 # override parent method
    super.method1() # call parent method
    # ... 
  end
end
```
## Modules
```
module ModuleExample 
  def foo
    'foo'
  end
end
```
### include
```
class Person
  include ModuleExample
end

Person.foo # => error
Person.new.foo # => 'foo'
```
### extend
```
class Book
  extend ModuleExample
end

Book.foo # => 'foo'
Book.foo.new # => error
```
## Self methods of class
```
class MathFunctions 

  def self.double(var) 
    var * 2 
  end 
  
  class << self  
    def some_method
      puts 'ggwp'
    end 
  end
  
end 

def MathFunctions.triple(var)
  var * 3 
end

puts MathFunctions.double 5 # => 10 
puts MathFunctions.triple(3) # => 9 
puts MathFunctions.some_method # => 'ggwp' 
```
## Area
### Methods of current area
`local_variables`
### Constants
```
module Test
  PI = 3.14
  class Test2
    def what_is_pi
      puts PI
    end
  end
end
Test::Test2.new.what_is_pi # => 3.14

module MyModule
  MyConstant = 'Внешняя константа'
  class MyClass
    puts MyConstant # => Внешняя константа
    MyConstant = 'Внутренняя константа'
    puts MyConstant # => Внутренняя константа
  end

  # остается неизменной вне области
  puts MyConstant # => Внешняя константа
end
```
### Private access
```
class Person
  def initialize(age)
  	self.age = age # Валидно - исключение
  	puts my_age
  	# puts self.my_age # Не валидно
  	                   # Нельзя использовать self на любом другом получателе
  end

  private 
    def my_age
    	@age
    end
    def age=(age)
      @age = age
    end
end

Person.new(24) # => 24
```


