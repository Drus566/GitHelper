# Content
1. [Base](#base)
   1. [Comments](#comments)
   2. [Terminal output](#terminal_output)
   3. [Variables and constants](#variables_and_constants)
   4. [Handle error](#handle_error)
   5. [Arifmetic operations](#arifmetic_operations)
   6. [Strings](#strings)
   7. [Symbols](#symbols)
   8. [Arrays](#arrays)
   9. [Logic expressions](#logic_expressions)
   10. [Control structures](#control_structures)
   11. [Cycles](#cycles)
   12. [Enumerators](#enumerators)
   13. [Functions](#functions)
   14. [Regular expressions](#regular_expressions)
   15. [Ranges](#ranges)
   16. [Hashes](#hashes)
   17. [Files](#files)
   18. [Blocks](#blocks)
   19. [Triggers](#triggers)
   20. [Methods](#methods)
   21. [Random](#random)
   22. [Matrices](#matrices)
2. [OOP](#oop)
   1. [Variables](#variables)
   2. [Inheritance](#inheritance)
   3. [Modules](#modules)
   4. [Self methods](#self_methods)
   5. [Area](#area)
   
# Base <a name="base"></a>
## Comments <a name="comments"></a>
### Multiline
```
=begin
comment 
=end
```
## Terminal output <a name="terminal_output"></a>
### Output for array
`print`
## Variables and constants <a name="variables_and_constants"></a>
### Global
`$pass = 'qwerty'`
### Constant
`PI = 3.14`
### Parallel assignment
`a = b = c = 42`
### Multiple assignment
`a,b,c = 0, 9, 3`
## Handle errors <a name="handle_error"></a>
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
## Arifmetic operations <a name="arifmetic_operations"></a>
### Exponent
`2 ** 5` => 32
## Strings  <a name="strings"></a>
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
### Правила (они же регулярные выражения) работы со строками.
* Символьный класс
```
/[абвгде]/    #=> простое перечисление символов
/[а-яА-ЯЁё]/  #=> все русские буквы
/[0-9a-z]/    #=> цифры и строчная латиница
/[^0-9]/      #=> все символы, кроме цифр
```
* Квантификатор
```
/\w{3}/           #=> три латинских буквы или цифры
/\d{1, 3}/        #=> одна, две или три цифры
/[а-яА-ЯЁё]{3,}/  #=> русское слово длиной три символа и больше
```
* Альтернатива
```
/(жы|шы)/            #=> или "жы", или "шы"
/(\w+|[а-яА-Я]+)/    #=> или слово на латинице, или русское
```
* Группировка
```
"2+7*3".gsub(/(\d+)\*(\d+)/){ $1.to_i * $2.to_i }    #=> "2+21"
```
* Фиксирующая директива
```
/^\d+/    #=> строка начинается с числа
/\w+$/    #=> последнее слово на латинице или число
/^$/      #=> пустая строка
```
* Модификатор
```
/(hello|world)/i    #=> или "hello", или "world". Причём независимо от регистра
/\s+/mix            #=> несколько подряд идущих пробельных символов
```
Игнорирование регистра работает только для латиницы. 
* Правильное разбиение
```
"Раз, два, три!".split(/[, \.?!]+/)    #=> ["Раз", "два", "три"]
```
Разбиение называется «правильным» тогда, когда в качестве аргумента метода .split используется правило.
* Правильная замена
Методы .sub и .gsub совместно с правилами становятся итераторами, которые последовательно обрабатывают каждое совпадение с правилом. 
```
"Жыло-было шыбко шыпящее жывотное".gsub(/(ж|ш)ы/){ $1 + "и" }
    #=> "Жыло-было шибко шипящее животное"
```
* Правильный поиск
```
"Раз, два, три!".scan(/[А-Яа-я]+/)    #=> ["Раз", "два", "три"]
```
```
"Раз, два, три!".scan(/[, \.;:!]+/)    #=> [", ", ", ", "!"]
```
```
"Раз, два, три!"[/[А-Яа-я]+/]    #=> "Раз"
```
### Gsub
Метод .sub производит только одну замену, а .gsub — все возможные. 
```
string = "жыло-было шыбко шыпящее жывотное"
string.sub("жы", "жи")                      #=> "жило-было шыбко шыпящее жывотное"
string.gsub("жы", "жи")                     #=> "жило-было шыбко шыпящее животное"
string.gsub("жы", "жи").gsub("шы", "ши")    #=> "жило-было шибко шипящее животное"
```
```
"hello".gsub(/[aeiou]/, '*')                  # => "h*ll*"
"hello".gsub(/([aeiou])/, '<\1>')             # => "h<e>ll<o>"
"hello".gsub(/./) {|s| s.ord.to_s + ' '}      # => "104 101 108 108 111 "
"hello".gsub(/(?<foo>[aeiou])/, '{\k<foo>}')  # => "h{e}ll{o}"
'hello'.gsub(/[eo]/, 'e' => 3, 'o' => '*')    # => "h3ll*"
```
### Scan
```
string = "жыло-было шыбко шыпящее жывотное"
string.scan("шы")                                  #=> ["шы", "шы"]
string.scan("шы").size                             #=> 2
string.scan("жы").size                             #=> 2
string.scan("жы").size + string.scan("шы").size    #=> 4
```
### Addition
```
string = "едем"
string += ", "
string *= 3
string               #=> "едем, едем, едем, "
```
### Преобразование к двоичному представлению
```
my_number = 123
puts "В двоичном виде: %b" % my_number    #=> В двоичном виде: 1111011
```
Мы задействовали метод % (аналог sprintf в Си), который осуществляет форматирование строки́.
```
my_number = 123
puts "В двоичном виде: #{my_number.to_s(2)}"    #=> В двоичном виде: 1111011
```
### Преобразовать строку в массив, разбив её по разделителю
```
cuckoo_talk = "Ку-ку! Ку-ку! Ку-ку! Ку-ку! Ку-ку! Ку-ку! Ку-ку! … Ку-ку! Ку-ку! "
(cuckoo_talk / " ").size    #=> 100
```
### Split
```
"Ку-ку".split('-')    #=> ["Ку", "ку"]
"Ку-ку".split('y')    #=> ["К", "-к"]
```
### Join
```
["Ку", "ку"].join('-')     #=> "Ку-ку"
["Ку", "ку"].join(', ')    #=> "Ку, ку"
["Ку", "ку"].join          #=> "Куку"
["Ку", "ку"].to_s          #=> "Куку"
```
Метод .join, вызванный без разделителя, даёт такой же результат, как и метод .to_s.
```
["Ку", "ку"] * '-'    #=> "Ку-ку"
["Ку", "ку"] * 3      #=> ["Ку", "ку", "Ку", "ку", "Ку", "ку"]
```
### Получение подстрок
```
string = "Во дворе дрова, а в дровах трава!"
string[27..-1]     #=> "трава!"
string[27...-1]    #=> "трава"
string[9...14]     #=> "дрова"
string[9..13]      #=> "дрова"
```
```
string = "Во дворе дрова, а в дровах трава!"
string[3..3]    #=> "д"
string[3]       #=> 190
```
Если мы указываем не диапазон, а число, то метод [] выдаёт нам не символ, а его целочисленный код. 
```
string = "Во дворе дрова, а в дровах трава!"
string[3]     #=> 190
string[3].chr #=> "д"
```
Для преобразования целочисленного кода обратно в символ, используется метод .chr.
В последних версиях Ruby код string[3] уже выдает искомую "д" и без использования метода .chr.
### Строка-перевёртыш
```
"Алукард.".reverse
    #=> ".дракулА"
```
### Методы преобразования к строке
Ruby сам преобразует типы для некоторых простых операций. Например, при включении строки в другую он воспользуется имеющимся у объекта методом .to_s:
```
class Container
  def to_s
     "контейнер"
  end
end

cont = Container.new

p "Это #{cont}"    #=> "Это контейнер"
```
Если нужно, чтобы ваши объекты упорядочивались и сравнивались с обычными строками, следует применять примесь Comparable и единственный специальный метод to_str. Наличие этого метода у вашего объекта — знак для Ruby, что для сравнения следует применять не встроенный в String метод, а ваш.
```
class Container
    include Comparable
    def to_str
        "контейнер"
    end

    def to_s
        "контейнер"
    end

    def <=>(other)
        to_s <=> other.to_s
    end
end

cont = Container.new

"контейнер" == cont    #=> true
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
## Symbols <a name="symbols"></a>
### Create
`array_of_symbols = %i(a b c)`
## Arrays <a name="arrays"></a>
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
## Logic expressions <a name="logic_expressions"></a>
* `!0` => false
* `1 <=> 1` => 0, values are equal
* `1 <=> 2` => -1, left value less
* `2 <=> 1` => 1, left value greater
## Control structures <a name="control_structures"></a>
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
## Cycles <a name="cycles"></a>
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
## Enumerators <a name="enumerators"></a>
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
## Functions <a name="functions"></a>
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
## Regular expressions <a name="regular_expressions"></a>
### create
`regular_expression = %r([0-9])`
### match
```
"aaaa1".match?(/[0-9]/) # => true
"".match?(/[0-9]/) # => false
```
## Ranges <a name="ranges"></a>
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
## Hashes <a name="hashes"></a>
### Create
* Из одномерного массива
```
array = [1, 4, 5, 3, 2, 2]
Hash[*array]                  #=> {1=>4, 5=>3, 2=>2}
```
* Из двумерного массива
```
array = [[1, 4], [5, 3], [2, 2]]
Hash[*array.flatten]                #=> {1=>4, 5=>3, 2=>2}
```
```
array = [[1, 5, 2], [4, 3, 2]]
Hash[*array.transpose.flatten]    #=> {1=>4, 5=>3, 2=>2}
```
* Нет данных
```
hash = {}
hash[1] = 4
hash[5] = 3
hash[2] = 2
hash           #=> {1=>4, 5=>3, 2=>2}
```
* Известен только тип значений
```
hash = Hash.new("")
hash["песенка про зайцев"] += "В тёмно-синем лесу, "
hash["песенка про зайцев"] += "где трепещут осины"
hash    #=> {"песенка про зайцев"=>"В темно-синем лесу, где трепещут осины"}
```
```
hash = Hash.new(0)
hash["зарплата"] += 60
hash["зарплата"] *= 21
hash      #=> {"зарплата"=>1260}
```
* Всё известно и дано
```
{"март"=>400, "январь"=>350, "февраль"=>200}  #=> на выходе такой же текст
{fox: 1, wolf: 2, dragon: 3}                  #=> {:fox=>1, :wolf=>2, :dragon=>3} обратите внимание на знак ':', он говорит что fox - это не строка, 
                                              #   а чтото вроде перечисления (Enum), как в языке Си.
```
### Получение массива значений и массива ключей
```
{1=>4, 5=>3, 2=>2}.keys      #=> [1, 2, 5]
{1=>4, 5=>3, 2=>2}.values    #=> [4, 3, 2]
```
### Размер ассоциативного массива
```
hash = {5=>1, 1=>3, 2=>4, 3=>1, 4=>1}
hash.size                                #=> 5
```
количество пар вида ключ=>значение
### Удаление пары по ключу
```
hash = {5=>1, 1=>3, 2=>4, 3=>1, 4=>1}
hash.delete(5)                           #=> 1
hash                                     #=> {1=>3, 2=>4, 3=>1, 4=>1}
hash.delete(5)                           #=> nil
```
Ему передаётся ключ от пары, которую следует удалить.
### Удаление произвольной пары
```
hash = {5=>3, 1=>6, 3=>2}
hash.shift                   #=> [5, 3]
hash                         #=> {1=>6, 3=>2}
```
### Слияние двух массивов
```
hash1 = {3 => "a", 4 => "c"}
hash2 = {5 => "r", 7 => "t"}
hash1.merge!(hash2)                   #=> {5=>"r", 7=>"t", 3=>"a", 4=>"c"}
```
Если во втором массиве ключ будет совпадать с каким-либо ключем из первого массива, значение будет заменено на значение из второго массива. 
### Преобразовать в индексный массив
```
hash = {"гаечный ключ"=>10, "разводной ключ"=>22}
hash.to_a    #=> [["гаечный ключ", 10], ["разводной ключ", 22]]
```
### Упорядочение хеша
* sort
```
hash = {"гаечный ключ"=>4, "разводной ключ"=>10}
hash.sort    #=> [["гаечный ключ", 4], ["разводной ключ", 10]]
```
* sort_by
```
hash = {"гаечный ключ"=>4, "разводной ключ"=>10}
hash.sort_by{ |key, value| value } #=> [["гаечный ключ", 4], ["разводной ключ", 10]]
```
### Поиск максимальной/минимальной пары
```
hash = {"гаечный ключ"=>10, "разводной ключ"=>22}
# по ключу
hash.max    #=> ["разводной ключ", 22]
hash.min    #=> ["гаечный ключ"  , 10]
```
```
hash = {"гаечный ключ"=>10, "разводной ключ"=>22}
hash.max_by{ |key, value| value }  # по значению                   #=> ["разводной ключ", 22]
hash.min_by{ |array| array[0] }    # по ключу                  #=> ["гаечный ключ"  , 10]
```
### Логические методы
* Хеш пустой?
```
empty_hash  = {}
filled_hash = {"гаечный"=>20, "замочный"=>"английский", "разводной"=>34}

empty_hash  == {}    #=> true
filled_hash == {}    #=> false
```
```
empty_hash  = {}
filled_hash = {"гаечный"=>20, "замочный"=>"английский", "разводной"=>34}

empty_hash .size.zero?    #=> true
filled_hash.size.zero?    #=> false
```
```
empty_hash  = {}
filled_hash = {"гаечный"=>20, "замочный"=>"английский", "разводной"=>34}

empty_hash .empty?    #=> true
filled_hash.empty?    #=> false
```
* Есть такой ключ?
```
pocket = {"гаечный"=>20, "замочный"=>"английский", "разводной"=>34}
pocket.keys.include?("гаечный")    #=> true
```
```
pocket = {"гаечный"=>20, "замочный"=>"английский", "разводной"=>34}
pocket.key?("гаечный")    #=> true
```
```
pocket = {"гаечный"=>20, "замочный"=>"английский", "разводной"=>34}
pocket.include?("гаечный")    #=> true
```
Этот же вопрос можно задать методами: .member? и .has_key?. 
### Есть такое значение?
```
pocket = {"гаечный"=>20, "замочный"=>"английский", "разводной"=>34}
pocket.value?("английский")    #=> true
```
Задать вопрос «Есть такое значение?» можно не только при помощи метода .value?, но и при помощи более длинного .has_value?.
### Итераторы
```
hash = {"гаечный ключ"=>4, "разводной ключ"=>10}

hash.find_all{ |array| array[1] < 5 }
    #=> [["гаечный ключ", 4]]

hash.map { |array| "#{array[0]} на #{array[1]}" }
    #=> ["гаечный ключ на 4", "разводной ключ на 10"]

hash.inject(0){ |result, array| result + array[1] }
    #=> 14
```
```
hash = {"гаечный ключ"=>4, "разводной ключ"=>10}

hash.find_all{ |key, value| value < 5 }
    #=> [["гаечный ключ", 4]]

hash.map{ |key, value| "#{key} на #{value}" }
    #=> ["гаечный ключ на 4", "разводной ключ на 10"]

hash.inject(0){ |result, key, value| result + value }
    #=> Ошибка в методе "+": невозможно сложить nil и число типа Fixnum
hash.inject(0){ |result, (key, value)| result + value }
    #=> 14
```
### Замена ключей на значения
```
hash = {"первый ключ"=>4, "второй ключ"=>5}
hash.invert                                    #=> {4=>"первый ключ", 5=>"второй ключ"}
```
Поскольку ключи в ассоциативных массивах уникальны, то ключи с одинаковыми значениями будут отброшены:
```
hash = {"первый ключ"=>10, "второй ключ"=>10}
hash.invert                                      #=> {10=>"второй ключ"}
```
Небольшая хитрость: hash.invert.invert возвратит нам хеш с уникальными значениями.
### Обновление пары
```
array = [1, 2, 1, 2, 3, 2, 1, 2, 4, 5]
array.inject({}){ |result, i| result.update({i=>1}){ |key, old, new| old + new } }
    #=> {5=>1, 1=>3, 2=>4, 3=>1, 4=>1}
```
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
* Одному программисту надоело писать hash["key"] и он захотел сделать так, чтобы можно было написать hash.key. 
```
class Hash
    def method_missing(id)
        self[id.id2name]
    end
end

hash = {"hello"=>"привет", "bye"=>"пока"}
hash.hello    #=> "привет"
hash.bye      #=> "пока"
```
Естественно, что ключи в таком хеше могут содержать только латиницу, символ подчёркивания и цифры (везде, кроме первого символа). Иначе говоря, удовлетворять всем требованиям, которые мы предъявляем к именам методов и именам переменных. 
## Files <a name="files"></a>
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
### Чтение при помощи класса IO
```
config = IO.read('config.yaml')
config.class    #=> String
```
Для чтения файла целиком используется метод .read. Он считывает весь файл в виде строки. Во время его использования не сто́ит задумываться об открытии/закрытии файла, так как эти операции скрыты внутри метода. 
При считывании «двоичных файлов» в операционных системах фирмы Microsoft использовать данный способ нельзя, так как файл будет считан не до конца. Следует использовать универсальный способ работы с файлами.
### Перенаправление потока
* Перенаправление потока ввода с клавиатуры
```
$stdin = File.open('входные данные.txt')
```
* Сохранение вывода в файл
```
$stdout = File.open('выходные данные.txt', 'w')
$stderr = File.open('сообщения об ошибках.txt', 'a')
```
### Универсальный способ работы с файлами
Универсальным способом я назвал способ с использованием метода File.open. Дело в том, что при помощи него можно осуществлять не только считывание, запись и перезапись, но и закрытие файлов (чего нельзя сделать при использовании способа с переменными $stdout, $stdin и $stderr). Это позволяет несколько раз (за время выполнения программы) осуществлять операции открытия-закрытия файла. В виду того, что эта возможность нужна далеко не всегда, то и используется этот способ только тогда, когда использование всех предыдущих невозможно. 
* Чтение из файла входные данные.txt при помощи универсального метода будет выглядеть следующим образом: 
```
string = File.open('входные данные.txt', 'r'){ |file| file.read }
```
или 
```
string = File.open('входные данные.txt'){ |file| file.read }
```
* Если необходимо записать данные, то нужно использовать модификатор доступа a (добавление к концу файла) или w (запись в файл с его предварительной очисткой). Запись данных в файл осуществляется методами puts, write и так далее. 
```
File.open('выходные данные.txt', 'w'){ |file| file.write string }
File.open('выходные данные.txt', 'a'){ |file| file.puts  string }
```
Замыкание метода .open (то есть фигурные скобки) нужен для того, чтобы при выходе из замыкания автоматически осуществлять закрытие файла. 
### Удаление файла
```
File.delete("example.txt")  #=> Файл был удалён (не помещён в корзину, как во многих операционных системах!)
```
## Blocks <a name="blocks"></a>
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
## Triggers <a name="triggers"></a>
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
## Methods <a name="methods"></a>
### «Поглощение» аргументов метода
```
def sum(*members)
    members[0] + members[1]
end

sum(10, 2) #=> 12
```
### Операторы
```
class Broom
    def+(another)
        12 + another
    end
end

whisk = Broom.new
whisk + 10    #=> 22
```
### Свои методы с замыканиями
```
def twice
    yield "и раз"
    yield "и два"
end

twice { |words| puts "!!! " + words }    #=> !!! и раз
                                         #=> !!! и два
```
```
def twice(&closure)
    yield "и раз"
    yield "и два"
end

twice    #=> Ошибка LocalJumpError - отсутствует замыкание
```
```
def func(a, &closure)
    return a if a
    yield "и раз"
    yield "и два"
end

func true     #=> true
func false    #=> LocalJumpError: no block given
```
```
def func(a, &closure)
    return a if a
    closure ||= lambda{ |words| puts "!!! " + words }
    closure.call("и раз")
    closure.call("и два")
end

func true     #=> true
func false    #=> !!! и раз
              #=> !!! и два

func(false){ |words| puts "??? " + words }    #=> ??? и раз
                                              #=> ??? и два
```
Здесь lambda — пустая функция, а closure.call — явный способ вызова замыкания на выполнение.

Замыкание можно также передать другому методу, просто указав его как последний аргумент с амперсандом:
```
def writing_to(file, &closure)
    File.open(file, 'w', &closure)
end
```
```
class Array
  def inject2 ( buf )
    self.map do |e|
      buf = yield(buf,e)
    end
    buf
  end
end
 
p [1,2,3].inject2(10){|b,e| b + e} #=> 16
p [1,2,3].inject(10){|b,e| b + e}  #=> 16
```
### Примеры замыканий
```
connected{ download_email }
```
В данном случае мы пишем только замыкание с download_email, все заботы по открытию (а главное — закрытию) соединения возьмёт на себя метод connected:
```
def connected
    connect_to_internet
    result = yield
    disconnect
    result
end
```
В данном случае мы сохраняем то, что вернуло замыкание, в метод, закрываем соединение и возвращаем результат замыкания как свой собственный.

Чаще всего о методах, принимающих замыкания, можно говорить как о деепричастном обороте — например, «соединившись», «внутри_транзакции», «с файлом», «трижды».

Если воспользоваться встроенной проверкой исключений, то метод принимает такой вид:
```
def connected
    connect_to_internet
    begin
        result = yield
    ensure
        disconnect
    end
    result
end
```
Тогда, даже если метод вызовет ошибку, соединение всё равно будет закрыто. 
## Random <a name="random"></a>
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
## Matrices <a name="matrices"></a>
### Create
```
require 'matrix'
Matrix[[1, -2, 3], [3, 4, -5], [2, 4, 1]]
```
### Как послать в матрицу двумерный массив?
```
require 'matrix'
array = [[1, -2, 3], [3, 4, -5], [2, 4, 1]]
Matrix[*array]
```
### Как изменить элемент матрицы?
```
require 'matrix'
matrix =  Matrix[[1, -2, 3], [3, 4, -5], [2, 4, 1]]
matrix[0, 0] = 5
p matrix 
```
### Методы работы с матрицами
* Вычисление определителя (.det) 
* Вычисление обратной матрицы (.inv)
* Поиск минора матрицы (.minor)
* Преобразование матрицы в массив (.to_a) 
* Умножение (*) 
* Сложение (+) 
* Вычитание (-) 
* Деление (/)
И другие
### Векторы
```
require 'matrix'
array = [1, 2, 3, 4, 5]
vector = Vector[*array]
p vector + vector    #=> Vector[2, 4, 6, 8, 10]
p array + array      #=> [1, 2, 3, 4, 5, 1, 2, 3, 4, 5]
```
Обратите внимание, что Vector создаётся точно также, как и матрица. По сути, вектор — это матрица, которая состоит лишь из одной строки. А матрица, в свою очередь, — это массив векторов. 
# OOP <a name="oop"></a>
## Variables <a name="variables"></a>
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
## Inheritance <a name="inheritance"></a>
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
## Modules <a name="modules"></a>
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
## Self methods <a name="self_methods"></a>
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
## Area <a name="area"></a>
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


