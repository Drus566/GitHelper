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
### Arifmetic operations
## Exponent
`2 ** 5` => 32
## Strings
* `string1 = %q[Escapes any quotation marks, but doesn't understend \n]`
* `string2 = %Q[Escapes any quotation marks and understend \n]`
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
## Logic expressions
* `!0` => false
* `1 <=> 1` => 0, values are equal
* `1 <=> 2` => -1, left value less
* `2 <=> 1` => 1, left value greater
## each and etc enumerators
### Get summ of all elements
* `(5..10).reduce(:+)`                 => 45
* `(5..10).inject {|sum, n| sum + n}`   => 45
### Create array
* `(1..4).map { |i| i*i }` => [1,4,9,16]
* `(1..4).collect { "cat" }` => ["cat","cat","cat","cat"]


