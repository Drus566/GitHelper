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

## each and etc enumerators
### Get summ of all elements
* `(5..10).reduce(:+)`                 => 45
* `(5..10).inject {|sum, n| sum + n}`   => 45
### Create array
* `(1..4).map { |i| i*i }` => [1,4,9,16]
* `(1..4).collect { "cat" }` => ["cat","cat","cat","cat"]


