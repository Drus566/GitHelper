### Скрипт
```
#!usr/bin/tclsh
# hello.tcl
puts "Hello, world"

chmod +x hello.tcl
./hello.tcl
```

### Скрипт универсальный, следует только указать место расположения интерператора в PATH
```
#!/bin/sh
# hello2.tcl \
exec tclsh "$0" $@"

puts "Hello, world"
```
`$0` - Первый аргумент(название программы)
`$@` - Строка, составленная из всех аргументов командной строки

### Примеры синтаксиса
```
puts "Hello, world" ; puts "Good bye, world" 

// КОмментарий
puts "Hello" ; # this will print 'Hello'

// Выведет решетку
puts #

% expr 2*3
// 6
% expr "10 + 20"
// 30
% expr "10 + 20" + 30
// 60
% expr "10 + 20" "+ 30"
// 60
%
```

#### Печатает значение выражения 
> Работает внутри двойных ковычек
```
puts [expr 10+20]
```

> `exec` перехватыевает вывод внешних команд.

### Идентификаторы
```
set x 25
set str "ggwp"
set n [expr n+1]
```
Обращение к переменной (узнать значение по имени) - `puts $str`,`puts "the value is $x"

Строку, разделенную пробелами `tcl` рассматривает как список:
```
set str "ggwp glhf"
lindex %str 1 // выдаст glhf
```
или с кавычками
```
set str "abra \"schwab ra\" kadabra"
lindex $str 1 // выдаст shwab ra
```
Переменные аргументов:
* `argc` - число(количество параметров командной строки)
* `argv` - список параметров командной строки
* `argv0` - имя программы

> Фигурный скобки - это строка. Внутри фигурных скобок все символы обозначают сами себя.

```
set b 100
set tt [if $b "puts YES ; expr 10" "puts NO ; expr 20"]
puts "result is $tt"
// если b != 0 , то выведет 10, иначе 20
```

Циклы
```
set n 0 
while { $n < $argc } {
  puts "parameter $n is [lindex $argv $n]"
  set n [expr $n + 1]
}
```

```
for { set n 0 } { $n < $argc } { set n [expr $n + 1] } {
  puts "Parameter $n is [lindex $argv $n]"
}
// или
for { set n 0 } { $n < $argc } { incr n } {
  puts "Parameter $n is [lindex $argv $n]"
}
```

#### foreach
```
foreach a $argv {
  puts "We've got $a as a command line argument"
}
```

Перебор списка (по 3 элемента)
```
set greek {
  alpha beta gamma delta epsilon zeta eta
  theta iota kappa lambda mu nu xi omicron
  pi rho sigma tau upsilon phi chi psi omega
}
foreach { x y z } $greek {
  puts "$x $y $z"
}
```
Перебор списка (по 2 элемента)
```
#!/usr/bin/tclsh
# list1.tcl
set digits {0 1 2 3 4 5 6 7 8 9}
set dignames {
	zero one two three four
	five six seven eight nine
}
foreach d $digits n $dignames {
	puts "$d read ''$n''"
}
```

### Процедуры и видимость переменных
```
proc hello {} {
	puts "Hello, world"
}
// или
proc "hello" "" "puts \"Hello, world\""
proc greet {name} {
	puts "Hello, dear $name, I'm pleased to meet you!"
}

greet Vasya
greet {G W}
greet "Mister X"

Hello, dear Vasya, I'm pleased to meet you!
Hello, dear G W, I'm pleased to meet you!
Hello, dear Mister X, I'm pleased to meet you!
```

```
proc quad {x} { expr $x * $x }
// то же самое
proc quad {x} {
	return [expr $x * $x]
}
```

