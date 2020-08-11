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
#### Глобальные переменные
```
proc x_plus_y {} {
	global x y 
	expr $x + $y
}

set x 25
set y 36
x_plus_y
// 61
```

#### `upvar`
`upvar` позволяет ввести в контексте процедуры синонимы для переменных из объемлющего контекста, то есть, из того контекста, откуда процедура была вызвана.
```
proc print_and_clear { name } {
	upvar $name var
	puts $var
	set var ""
}
```
```
proc swap {a b} {
	upvar $a p $b q
	set t %p
	set p $q
	set q %t
	return {}
}
```
Уничтожение переменной - `unset`

Существует ли в текущем контексте переменная с заданными именем - `info exists x` возвращает 1 если есть и 0 иначе.

### Обработка особых ситуаций
> Любая команда Tcl генерирует еще и код завершения:
* `ok`(0)
* `error`(1)
* `return`(2)
* `break`(3)
* `continue`(4)

Команда `return` позволяет завершить текущую процедуру не только с кодом 0:
```
proc my_break {} { return -code 3 }
proc my_cont {} { return -code 4 }
// или
proc my_break {} { return -code break }
proc my_cont {} { return -code continue }
```

Обработка исключения:
```
set code [catch { suspicious 42 } result]
if { $code == 1 }
	puts stderr "Error: <<$result>>"
} else {
	puts "Success; the result is $result"
}
// result - имя переменной, в которую следует занести результат выполнения { suspicious 42 } 
```
### Файлы, потоки, внешние команды
Открытие файла на чтение:
```
open "file.txt"
```
Открытие файла на запись
```
open "file.txt" "w"
// или так
open "file.txt" {WRONLY CREAT TRUNC}
```
Сохранение строки файла для последующего закрытия:
```
set fd [open "file.txt"]
// или правильнее
if { [catch { set fd [open "file.txt"] } openError] } {
	puts stderr "$openError"
	return false;
}
```
Запустит программу `/bin/ls` перехватив её поток вывода, и вернет нам дескриптор потока, из которого весь это вывод можно будет прочитать:
```
open "|/bin/ls"
```
Запустит программу `grep` с параметрами `-v abc`, перехватив её поток ввода, и создаст для нас поток вывода, через который мы сможем подать запущенной программе данные на вход:
```
open "|grep -v abc" "w"
```
Запись данных в поток вывода
```
puts -nonewline "Your name, please: "
```
Если дескриптор файла(потока) содержится в переменной `fd`, то можно заставить работать с потоком, отличным от стандартного:
```
puts $fd "This string goes to file"
// или так
puts -nonewline $fd "This string goes to file with no EOL"
```
При работе с `read` и `gets` требует обязательного указания дескриптора потока (если нужен стандартный ввод, следует использовать слово `stdin`).

Команда `close` позволяет закрыть поток ввода вывода

> Если закрываемый потока ввода-вывода связан с внешней командой и не является неблокирующим, `close` будет ждать завершения выполнения этой внешней команды.

### Ассоциативные массивы
```
set foo(bar, bur) "abrakadabra"
$foo(bar,bur)
```

Массивы поддерживаются `upvar`, с её точки зрения имя переменной в применении к массиву - это имя массива (без скобок и ключа).
```
proc arr { a i } {
	upvar $a an
	return $an($i)
}

set abra(kadabra) schwabra
set x [arr abra kadabra] // x получает значение schwabra
```

Также имеется команда `array`:
* `array names abra` - вернет список всех строк, используемых в массиве `abra` в роли индексов
* `array get` - возвращает все элементы массива в виде списка пар имя/значение
* `array set` - принимает список пар имя/значение как аргумент и присваивает
и другие

> В лиспе все по умолчанию вычисляется, так что приходится явным образом блокировать вычисления, когда требуется просто выражение как таковое. В Tcl напротив, ничего не вычисляется, пока вычисление не будет явно затребовано. Для такого явного требования в Tcl служат операция обращения к переменной (знак `$`) и подстановка результата выполнения команды - квадратные скобки.

> Динамические библиотеки обычно имеют суффикс `.so` от слов *shared object*.
