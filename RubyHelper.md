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
### Addition
```
string = "едем"
string += ", "
string *= 3
string               #=> "едем, едем, едем, "
```
### Note
* `String methods ending with "!" modify an existing string`
* `[1,2,3,4].to_s(2) показывает в какую систему счисления переводить или sprintf("%b", start_number)` 
*  Получить значение N-го двоичного разряда данного целого числа: 
``` 
start_number, N = 1234, 5
puts start_number[N]
```
* Поменять целочисленные значения двух переменных без использования третьей переменной:
```
number_one, number_two = 134, 234
number_one, number_two = number_two, number_one
```
* Округлить число с плавающей запятой до двух разрядов: 
```
puts sprintf("%.2f", float_integer).to_f 
float_integer.round 3 
```
* Проверка на анаграмму палиндрома
```
"АБАВБА".chars.group_by { |l| l }.count { |k, v| v.size.odd? } <= 1
```
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
* 
```
array = [1, 2, 3]
array += [4, 5]
array #=> [1, 2, 3, 4, 5]
```
### Delete
* `array.pop` => last element
* `array.shift` => first element
* `array.delete_at(4)` => indicated position
* `array.delete(2)` => concrete value
* `array.compact` => delete nil
* `array.uniq` => delete duplicate values
* `[1, 1, 2, 2, 3, 3, 3, 4, 5] - [1, 2, 4]` # => [3, 3, 3, 5]
### Sample
* `p a.sample(2) # => 2 случайных элемента`
### Двумерные массивы
* Для Ruby двумерный массив — это не более чем массив, содержащий одномерные массивы. Вот несколько примеров двумерных массивов:
```
[[1], [2, 3], [4]]                                        # разная длина элементов-массивов
[[1, 2], [3, 4]]                                          # одинаковая длина
[["прива", "Привет"], ["пока", "Всего хорошего"]]         # двумерный массив (классика)
[["прива", "Привет"], [1, ["пока", "Всего хорошего"]]]    # гибрид двух-трёх-мерного массива
```
* Двумерность массива средствами языка не отслеживается. Вполне могут возникнуть гибриды разномерных массивов.
* Подмассивы внутри двумерного массива могут иметь произвольную длину.
* Элементы из двумерного массива достаются последовательно: сначала элемент-массив, потом элемент.
### Максимальный\минимальный элемент
```
["у", "попа", "была", "собака"].max                           #=> "у"      максимальный по значению
["у", "попа", "была", "собака"].max_by{ |elem| elem.size }    #=> "собака" максимальный по размеру строки
["у", "попа", "была", "собака"].min                           #=> "была" минимальный по значению
["у", "попа", "была", "собака"].min_by{ |elem| elem.size }    #=> "у"    минимальный по размеру строки
```
### Упорядочивание
```
["у", "попа", "была", "собака"].sort
    #=> ["была", "попа", "собака", "у"] сортировка по значению
["у", "попа", "была", "собака"].sort_by{ |elem| elem.size }
    #=> ["у", "попа", "была", "собака"] сортировка по размеру строки
```
* Двумерные массивы
```
[[1,0], [16,6], [2,1], [4,5],[4,0],[5,6]].sort_by {|elem| elem[1]}
 #=> [[1, 0], [4, 0], [2, 1], [4, 5], [16, 6], [5, 6]] сортировка "внешних" элементов по значению "внутренних"
[[1,0], [16,6], [2,1], [4,5],[4,0],[5,6]].sort_by {|elem| elem[0]}
 #=> [[1, 0], [2, 1], [4, 0], [4, 5], [5, 6], [16, 6]]
 ```
### Пересечение | и объединение & множеств
* | `[1, 2, 3, 4, 5, 5, 6] | [0, 1, 2, 3, 4, 5, 7]    #=> [1, 2, 3, 4, 5, 6, 0, 7]`
* &  При пересечении двух массивов, из первого удаляются все элементы, отсутствующие во втором. А из второго, отсутствующие в первом. При этом относительный порядок остающихся элементов первого массива сохраняется. 
` [1, 2, 3, 4, 5, 5, 6] & [0, 2, 1, 3, 5, 4, 7]    #=> [1, 2, 3, 4, 5] ` 
* Всё просто. Важно лишь помнить, что | и & не изменяют ни первый, ни второй исходные массивы. Они через описанные процедуры создают новый массив. Чтобы тот не уехал от вас, нужно присвоить его; но не себе, а переменной, приготовленной слева от =.
* В итоге пересечения или объединения множеств получается массив, не содержащий дубликатов.
### Flatten
```
array = [[1, 2], [3, 4]]
array.flatten.max           #=> 4
```
### Удаление неопределённых (nil) элементов (compact)
```
array = [1, nil, 2, nil, 3]
array.compact                  #=> [1, 2, 3]
```
### Транспонирование - для получения транспонированной матрицы из исходной нужно каждую строчку исходной матрицы записать в виде столбца в том же порядке. 
```
array2D = [[1, 2], [3, 4]]
array2D.transpose.map{ |array| array.max }    #=> [3, 4]
```
### Логические методы
```
array = [1, 2, 2, 3]
puts array.methods.grep(/\?$/).sort
```
### Отбор элементов по признаку
* find_all
```
array = [1, 2, 3, 4, 5]
array.find_all{ |elem| elem % 2 == 0 }    #=> [2, 4]
```
* zero?
```
(elem % 2).zero?
(elem & 1).zero?
(elem[0]).zero?    # Этот вариант круче всех
```
* even?, odd?
```
array = [1, 2, 3, 4, 5]
array.find_all{ |elem| elem.even? }    #=> [2, 4]
```
### Суммирование/произведение/агрегация элементов
* inject
```
array = [1, 2, 3, 4, 5]
array.inject(0){ |result, elem| result + elem }    #=> 15
```
Ноль следует расшифровывать как result = 0 перед началом работы итератора, то есть это начальное значение переменной result (переменной промежуточного результата). Вычисление факториала: 
``` 
n = 9
(1..n).to_a.inject(){ |one, two| one * two }    #=> 362880
```
### Разбиение надвое
```
one, two = array.partition{ |x| (x % 3).zero? }
one                                                #=> [3, 6, 9]
two                                                #=> [1, 2, 4, 5, 7, 8]
```
### Логические итераторы
* all?
```
array = [1, 2, 2, 3]
array.all?{ |elem| elem > 2 }    #=> false
```
* any?
```
array = [1, 2, 2, 3]
array.any?{ |elem| elem > 2 }    #=> true
```
### Note
* Если потребуется написание своего класса, который работает, как описанные массивы, то возникают некоторые тонкости. Дело в том, что реализация всех описанных методов займёт жуткое количество времени и сил. На самом деле, для реализации большинства описанных методов, достаточно реализовать .each. Где это может понадобиться? Например, вы реализуете класс, который умеет читать из файла записи определённой структуры. Основную его логику занимает именно чтение нужного формата, кеширование, разбор, десериализация и тому подобное. Просто реализуйте .each и включите в ваш класс примесь Enumerable. В нём находится реализация методов, таких как .inject, .each_with_index и тому подобные.
* `empty?` обратный этому методу - `any?` 
* При использовании цепочек методов каждый должен быть с восклицательным знаком, иначе разорвётся цепочка копирований.
```
array = [1, 2, 3, 4, 5, nil]
array.compact.map!{ |elem| elem**2 }   #=> [1, 4, 9, 16, 25]
array           #=> [1, 2, 3, 4, 5, nil]
array.compact!.map!{ |elem| elem**2 }  #=> [1, 4, 9, 16, 25]
array           #=> [1, 4, 9, 16, 25]
```
* Генерация пароля:
```
symbols = ["a".."z", "A".."Z", "0".."9"].map{ |range| range.to_a }.flatten
puts (0...8).map{ symbols.sample }.join
```
* Перемешать упорядочанный массив
```
array = [1, 2, 3, 4, 5, 6, 7]
array.sort_by{ rand }            #=> перемешанный массив
```
* Выстроить элементы массива по убыванию без использования .reverse: 
```
array = [2, 1, 3, 5, 6, 7, 4]
array.sort{ |x, y| y <=> x }     #=> [7, 6, 5, 4, 3, 2, 1]
```
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
or
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
or
```
name = 'Fisher'
case name # вторая особенность
  when /fish/i then puts "Есть что-то рыбное"
  when 'Смит' then puts "Ваше имя Смит"
end
```
### === 
```
if /lan/ === "language"
  puts "Тройной знак равенства"
end
# => Тройной знак равенства

if "language" === "language"
  puts "тоже работает"
end
# => тоже работает

if Integer === 21
  puts "21 является целым числом"
end
# => 21 является целым числом
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
or
```
def max(one_param, *numbers, another)
  numbers.max
end

puts max("что-то", 6, 31, -5, "еще") # => 31
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
* Объекты, имеющие `.succ` называют последовательными: этим методом можно по текущему элементу достоверно определить следующий. 
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
### Note
* update
```
array = [1, 2, 1, 2, 3, 2, 1, 2, 4, 5]
array.inject({}){ |result, i| result.update({ i=>1 }){ |key, old, new| old+new }}
     #=> {5=>1, 1=>3, 2=>4, 3=>1, 4=>1}
```
## File
### Read
```
File.foreach ( 'test.txt' ) do |line|
  puts line
  p line
  p line.chomp # отсекает символ новой строки
  p line.split # массив слов строки
end
```
### Reading an unknown file
```
begin

  File.foreach ( 'do_not_exist.txt' ) do |line|
    puts line.chomp
  end

rescue Exception => e
  puts e.message
  puts "Давайте притворимся, что этого не было"
end
```
or
```
if File.exist? 'test.txt'

  File.foreach( 'test.txt' ) do |line|
    puts line.chomp
  end

end
```
### Write 
```
File.open("test1.txt", "w") do |file|
  file.puts "Первая строка"
  file.puts "Вторая строка"
end
```
## Blocks
### Impilicit block
```
def two_times_implicit
  return "Нет блока" unless block_given?
  yield
  yield
end

puts two_times_implicit { print "Привет " } # => "Привет Привет"
puts two_times_implicit # => Нет блока
```
### Explicit block
```
def two_times_explicit (&i_am_a_block)
  return "Нет блока" if i_am_a_block.nil?
  i_am_a_block.call
  i_am_a_block.call
end

puts two_times_explicit # => Нет блока
two_times_explicit { puts "Привет" } # => Привет
                                     # => Привет
```
## Triggers
```
if (condition1)..(condition2)
  # do something
end
```
Идея в том, что если первое условие истинно, то переключается невидимый рычаг, и с этого момента условие будет выполняться, пока второе условие тоже не станет истинным. Пример:
```
(1..20).each do |i|
  puts i if (i == 3)..(i == 15)
end
```

Оно напечатает все числа с 3 до 15, но если 15 будет пропущено в цикле, то оно так и продолжит печатать.

## Random
### 0-99 and 0.0-1.0
```
rand(100)    #=> 86
rand         #=> 0.599794231588021
```
### srand
```
srand 123
Array.new(5){ rand(100) }    #=> [66, 92, 98, 17, 83]
```
Если вы выполните данную программу у себя, то получите тот же самый массив. 123 — номер «случайной» последовательности. Измените его и массив изменится! Если вызвать srand без параметра или не вызывать его вообще, то номер «случайной» последовательности выбирается случайным образом. 
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


