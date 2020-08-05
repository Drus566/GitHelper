## C++
### Конструкторы
`File(){ fd = -1; }`
### Конструкторы преобразования 
Конструктор, который получает на вход один параметр, имеющий тип, отличный от описываемого.
### Дескрукторы
`~File() { if(fd!=-1) close(fd); }`
### Ссылки
`int &r`
### Константные ссылки
`const int &r`

> Слева от присваивания, а ровно и в дргуих модифицирующих случаях могут применятсься ссылки и только они, если же ссылка применяется в выражении, в котором требуется значение, то ссылка автоматически преобразуется к своему значению (т.е. выполняется извлечение из памяти).

### Константные методы
```
class C1 {
  void method(int a, int b) const
};
```
> Он заведомо не может изменить состояние объекта (значение его полей).

> При написании программ рекомендуется все методы, которые по своему смыслу не должны изменять состояние объекта, обязательно помечать как константные, тем самым разрешая вызывать их для константных объектов

### Операции работы с динамической памятью
Создание:
```
int *p  ;
p = new int;

Complex *p;
p = new Complex(2.4, 7.12);

int *p = new int[200] // массив из 200 чисел
```
Удаление:
```
delete p;
delete [] p; // удаление массива
```
### Конструктор копирования
```
class Cls1 {
  int *p;
public:  
  Cls1() { p = new int[20]; }
  Cls1(const Cls1& a) { // конструктор копирования
    p = new int[20];
    for(int i=0; i<20; i++)
      p[i] = a.p[i];
  }
  ~Cls1() { delete [] p; }
};
```
### Временные и анонимные объекты
```
t = z * Complex(0,1);
```
> Временные и анонимные объекты существуют до момента окончания вычисления выражения, содержащего их, после чего удаляются. Но если временный или анонимный объект был использован в качестве инициализатора ссылки, то такой объект будет существовать до тех пор, пока существует ссылка.

> На временный или анонимный объект нельзя ссылаться неконстантной ссылкой.

> Используйте модификатор `const` для всех ссылок, для которых это возможно.

### Значение параметров по умолчанию
```
void f(int a = 3, const char *b = "string", int c = 5);
```
Пример конструктора по умолчанию, преобразования и обычного конструктора от двух аргументов:
```
Complex(double a_re = 0, double a_im = 0) { re = a_re; im = a_im; } 
```
Такой конструктор может быть вызван и без параметров, то есть как конструктор по умолчанию, и с одним параметром типа `double`, то есть как конструктор преобразования из `double` в `Complex`.

### Описание метода вне класса. Области видимости.

```
class C1 {
  public:
    C1();
    void f(int a, int b);
    int g(const char *str) const;
  };
 
 C1::C1()
 {
  // тело конструктора 
 }
 
 void C1::f(int a, int b)
 {
  // тело метода f
 }
 
 int C1::g(const char *str) const
 {
  // тело метода g
 }
```

> Вызов глобальной функции `func` из программы в классе, где также есть метод `func`, можно осуществить так -`::func`.


### Подставляемые функции (inline)
```
inline int f(int x)
{
//
}
```

### Инициализация членов класса в конструкторе 
```
class A {
//...
public:
  A(int x, int y) { /.../ }
};

class B {
  A a;
public:
  B::B() : a(2, 3) {/.../} // инициализация членов класса в конструкторе
  // ...
};
```
> Инициализаторы полей должны следовать в списке после двоеточия в том же порядке, в котором сами поля описаны в классе.

```
class Complex {
  double re, im;
public:
  Complex(double a_re, double a_im) : re(a_re), im(a_im) {}
  Complex(double a_re) : re(a_re), im(0) {}
  Complex() : re(0), im(0) {}
  //...
```

### Перегрузка операций простыми функциями
```
Complex operator+(const Complex& a, const Complex& b)
{
  return Complex(a.GetRe() + b.GetRe(), a.GetIm() + b.GetIm());
}

Complex z, t;
z = t + 0.5;
z = 0.5 + t;

// Выражение a + b компилятор пытается превратить в одно из следующих выражений
a.operator+(b)
operator+(a,b)
```
### Дружественные функции и классы
Все детали реализации класса или структуры будут доступны 
```
class Complex {
  friend Complex operator+(const Complex&, const Complex&);
  //..
}
Complex operator+(const Complex& a, const Complex& b)
{
  return Complex(a.re + b.re, a.im + b.im);
}
```
Дружественной может быть и обычная функция
```
class Cls1 {
  friend void f(int, const char*);
  //...
};

void f(int, const char *)
{
    // используются закрытые поля Cls1
}
```
Можно сделать дружественной целый класс 
```
class A {
  friend class B;
};
```

### Переопределение операций присваивания
```
class Complex {
  const Complex& operator=(const Complex& c)
    { re = c.re; im = c.im; return *this; }
  const Complex& operator+=(const Complex& c)
    { re += c.re; im += c.im; return *this; }
};
```
Или ничего не возвращая:
```
class Complex {
  void operator=(const Complex& c)
    { re = c.re; im = c.im; }
  void operator+=(const Complex& c)
    { re += c.re; im += c.im; }
```
Аргумент операции присваивания не обязан иметь тот же тип, что и описываемый класс:
```
class Complex {
  void operator=(double x) { re = x; im = 0; }
};
```

### Методы, возникшие неявно
> Конструктор копирования неявно генерируется для любого класса или структуры, в которых программист не описал конструктор копирования явно.

> Конструктор по умолчанию генерируется неявно, если программист не описал в структуре или классе вообще ни одного конструктора.

> Если в некотором классе A не описать явным образом операцию присваивания с параметром, имеющим тот же тип А или ссылку на него, то компилятор неявно создаст операцию со следующим профилем:
```
class A {
  // ...
  A& A::operator=(const A& other);
  // ...
};
```

> Для запрета копирования объекта некоторого класса, необходимо описать конструктор копирования объекта класса в приватной части класса
```
class A {
  // ...
private: 
  void operator=(const A& ref) {} // no assign
};
```
### Переопределение операции индексирования
```
int& IntArray::operator[](unsigned int idx)
{
  if(idx >= size)
    Resize(idx);
  return p[idx];
}
```
### Переопределение операций ++ и --
```
class A {
public: 
  void operator++() { printf("first\n"); }
  void operator--() { printf("second\n"); }
  void operator++(int) { printf("third\n"); }
  void operator--(int) { printf("fourth\n"); }
};

A a;
++a; // first
a++; // third
--a; // second
a--; // fourth
```
Возвращение значений:
```
class MyInt {
  int i;
public: 
  MyInt(int x) : i(x) {}
  const MyInt& operator++() { i++; return *this; }
  MyInt operator++(int)
    { MyInt tmp(*this); i++; return tmp; } 
  // ...
```
### Переопределение операции ->
```
s1* operator->() const { return p; }
```
### Переопределение операции вызова функции
```
void operator()() {}
```
### Переопределение операции преобразования типа
Операция неявного преобразования типов определяется методом, имя которого состоит из слова `operator` и имени типа, к которому будет происходить преобразование.
```
class A {
  // ...
public:
  // ...
  operator int() const { /* ... */ }
};

A a;
int x;
// ...
x = a;
```
### Статические поля и методы
Переменные и методы, доступные только ищ класса и/или воспринимаются как его часть, но, с другой стороны, не привязаны ни к какому из объектов и могут использоваться даже когда ни одного объекта данного класса не существует - **такие члены класса называются статическими (static)**.

> Время жизни статической переменной совпадает с временем жизни работы программы (как у глобальных переменных).

```
class A {
  // ...
  static int the_static_field;
  // ...
};
```
Чтобы завершить создание статического поля, нужно вне заголовка класса поместить его описание:
```
int A::the_static_field = 0;
```
Обращение:
```
A a;
a.the_static_field = 15;
A::the_static_field = 15;
```

> Использование статических полей рекомендуется в одной ситуации: когда такое поле представляет собой константу, то есть его значение никогда не изменяется во время работы программы.

**Статический метод** - это особый вид функции-метода, которая, являясь методом класса и имея доступ к его закрытми деталям реализации, при этом вызывается независимо от объектов класса.

```
class Cls {
  //...
  static int TheStaticMethod(int a, int b);
  //...
};

Cls::TheStaticMethod(5, 15); 
Cls c;
c.TheStaticMethod(5, 15);
```
### Возбуждение исключений
```
unsigned int line_count_in_file(count char *file_name)
{
  FILE *f = fopen(file_name, "r");
  if(!f)
    throw "couldnt open the file"; // возбуждение исключения
  int n = 0;
  int c = 0;
  while ((c = fgetc(f)) != EOF)
    if(c == '\n')
      n++;
  fclose(f);
  return n;
}
```
### Обработка исключений
В данном случае ловим исключение `const char*`, а не просто `char*`, поскольку именно такой тип (адрес константы типа `char`) имеет в Си и Си++ строковый литерал. Если убирать модификатор `const`, исключение поймано не будет.
```
#include <stdio.h>

unsigned int line_count_in_file(const char *file_name);

int main(int argc, char **argv)
{
  if(argc<2) {
    fprintf(stderr, "No file name\n");
    return 1;
  }
  try {
    int res = line_count_in_file(argv[1]);
    printf("The file %s contains %d lines\n", argv[1], res);
  }
  catch(const char *exception) {
    fprintf(stderr, "Exception (string): %s\n", exception);
    return 1;
  }
  return 0;
}
```
> В этом примере исключение может возникнуть в функции, из `try` блока, но также может возникнуть в функции, вызванной из `line_count_in_file` прямо или косвенно на любую глубину. 

```
try {
  //...
}
catch(const char *x) {
  //...
}
catch(int x) {
  //...
}
```
> Если исключение не поймано ни одним из обработчиков, оно выбрасывается дальше, как если бы фрагмент кода, в котором исключение возникло, вовсе не был обрамлен никаким `try` блоком.

### Обработчики с многоточием
Ловит произвольное исключение вне зависимости от его типа
```
int main()
{
  try {
    // код 
    return 0;
  }
  catch(const char *x) {
    fprintf(stderr, "Exception (string): %s\n", x);
  }
  catch(int x) {
    fprintf(stderr, "Exception (int): %d\n", x);
  }
  catch(...) {
    fprintf(stderr, "Something strange caught\n");
  }
  return 1;
}
```
Освобождение памяти при возникновения исключения:
```
void f(int n)
{
  int *p = new int[n];
  try {
    // остальной код функции
  }
  catch(...) {
    delete[] p;
    throw; // бросает исключение дальше
  }
  delete[] p;
}
```
### Объект класса в роли исключения
Тот объект, который поймается в обработчике исключения, заведомо не может быть тем же экземпляром объекта, который фигурировал в операторе `throw`, и является его копией. Поэтому практически всегда в классе, используемом для исключений, описывают конструктор копирования.
```
class FileException {
  int err_code;
  char *filename;
  char *comment;
public:
  FileException(const char *fn, const char *cmt);
  FileException(const FileException& other);
  ~FileException();
  const char *GetName() const { return filename; }
  const char *GetComment() const { return comment; }
  int GetErrno() const { return err_code; }
private:
  static char *strdup(const char *str);
};
```
### Автоматическая очистка 
Компилятор гарантирует вызов деструкторов для всех локальных объектов, у которых деструкторы есть, прежде чем функция завершится - по исключению ли или обычным путем. **Это называется автоматической очисткой**.

### Преобразование типов исключений
Любой тип может быть преобразован к ссылке на этот тип, если оператор `throw` использует выражение `A`, то такое исключение может быть обработано `catch` блоком вида `catch(A &ref)`.


### Наследование структур и полиморфизм адресов
С++ разрешает неявное преобразование адреса переменной порожденного типа в адрес объекта родительского типа.
```
student s1;
person *p;
p = &s1;
person &ref = s1;
```
### Методы и защита при наследовании
Все свойства класса А будут доступны для объектов класса В отовсюду.
```
class B : public A {
  // ...
};
```
Из методов класса С, будут доступны для объекта класса, а остальная программа не будет знать, что класс С унаследован от А.
```
class C : private A {
  // ...
};
```
### Конструирование и деструкция наследника
```
class A {
  // ...
public:
  A(int p, int q) { // ... }
  // ...
};

class B : public A {
  int i;
public:
  B();
  // ...
};
```
Конструктор:
```
B::B() : A(2,3), i(4)
{
  // ...
}
```
### Виртуальные функции
Виртуальным методом задается реакция объекта класса на некоторый тип сообщений в случае, если:
* предполагается, что у данного класса будут классы потомки
* объекты классов-потомков будут способны получать сообщения того же типа
* объекты некоторых или всех потомков будут реагировать на эти сообщения иначе, чем это делает объект класса-предка.

```
class Pixel {
protected:
  double x, t;
  int color;
public: 
  Pixel(double ax, double ay, int acolor)
    : x(ax), y(ay), color(acolor) {}
  virtual ~Pixel() {}
  virtual void Show();
  virtual void Hide();
  void Move(double nx, double ny);
};

class Circle : public Pixel {
  double radius;
public:
  Circle(double x, double y, double rad, int color)
    : Pixel(x, y, color), radius(rad) {}
  virtual ~Circle() {}
  virtual void Show();
  virtual void Hide();
};
```
> Функции совпадающие по профилю с виртуальными функциями базового класса, объявляются виртуальными автоматически.

**Чисто виртуальная функция**
```
class A {
  // ...
  virtual void f() = 0;
  // ...
};
```
Видя на месте тела функции специальную лексическую последовательность `= 0`, компилятор воспринимает функцию как чисто виртуальную.

> Класс, в которым есть хотя бы одна чисто виртуальная функция, называется **абстрактным классом**. Компилятор не позволяет создавать объекты абстрактных классов.

> Если в порожденном классе не описывается хотя бы одна из функций, объявленных в базовом классе как чисто виртуальные, компилятор считает, что функция осталась чисто виртуальной. Такой класс-потомок считается абстрактным, как и его предок.

### Виртуальность в конструкторах и деструкторах
Во время выполнения тела конструктора вызываются те виртуальные функции, которые описаны для данного класса, вне зависимости от того, объект какого класса на самом деле конструируется.

### Наследование ради конструктора
Чтобы не приходилось каждый раз для представления квадрата писать шесть строк кода, можно описать класс, в котором будет только конструктор.
```
class Square : public PolygonalChain {
public: 
  Square(double x, double y, double a, int color) : PolygonalChain(x, y, color)
  {
    AddVertex(0, 0);
    AddVertex(0, 0);
    AddVertex(0, 0);
    AddVertex(0, 0);
    AddVertex(0, 0);
    AddVertex(0, 0);
  }
};
```

### Виртуальный деструктор
В классе, имеющем хотя бы одну виртуальную функцию, деструктор объявляется виртуальным. Если мы не объявляем деструктор класса как виртуальный, компилятор производит жесткий вызов деструктора по типу указателя, минуя таблицу виртуальных методов.

> Объект деструктора как виртуального практически не приводит к расходу памяти


### Виртуальность в конструкторах и деструкторах
Во время выполнения тела конструктора вызываются те виртуальные функции, которые описаны для данного класса, вне зависимости от того, объект какого класса на самом деле конструируется.

### Приватные деструкторы и защищенные методы
Этот эффект иногда используют, чтобы создать тип объекта, всегда размещаемого в динамической памяти, обычно такие объекты удаляют сами себя. Например:
```
class A {
  ~A() {} // no destruction
public: 
  // ...
  void Disappear() { delete this; }
};
```
> Приватный деструктор полностью исключает наследование от такого класса, если только заранее не описать всех наследников в качестве друзей. Напротив `protected` предполагает что наш класс будет использоваться для наследников.

### Перегрузка функций и сокрытие имен
```
class A {
public:
  void f(int a, int b);
};
class B : public A {
  double f; // метод f(int, int) теперь скрыт
};
```
Вызвать `f` сразу не сможем
```
B b;
b.f(2, 3); // ОШИБКА, метод f скрыт
b.A::f(2, 3); // все впорядке
```

> Перегрузка имен функций действует только в рамках одной области видимости:
```
class A {
public:
  void f(int a, int b);
};
class B : public A {
  double f(const char *str); // метод f(int, int) теперь скрыт
};

B b;
double t = b.f("abraraa"); // все ок
b.f(2, 3);  // ошибка
b.A::f(2, 3); // все впорядке.
```

### Вызов в обход механизма виртуальности 
```
class A {
public: 
  virtual void f() { printf("first\n"); }
  void g() { f(); } // вызывается метод f в зависимости от фактического типа объекта
  void h() { A::f(); } // всегда вызывается f из класса A
};

class B : public A {
public:
  virtual void f() { printf("second\n"); }
};

B b;
b.g(); // "second"
b.h(); // "first"
b.f(); // "second"
b.A::f(); // "first"

A *pa = &b;
pa->f(); // "second"
pa->A::f(); // "first"
```

### Операции приведения
Пример на Си:
```
int x;
char *p = (char*)&x;
```
В Си++ вводятся четыре операции, предназначенные для преобразования типа выражения. Эти операции имеют достаточно нетривиальный синтаксис, сначала записывается ключевое слово, задающее операцию (`static_cast`, `dynamic_cast`, `const_cast`, `reinterpret_cast`), затем в угловых скобках ставится имя нового типа и, наконец, в круглых скобках записывается само выражение, тип которого необходимо изменить, например:
```
Square *sp = static_cast<Square*>(scene[i]);
```
### Иерархии исключений
```
class A { / ... / };
class B : public A { / ... / };
```
обработчик вида `catch(const A& ex) { / ... / }` сможет ловить исключения обоих типов, т.е. результат как оператора `throw A(...);`, так и `throw B(...);`.

### Шаблоны
Шаблоны представляют собой еще один вид полиморфизма - так называемый параметрический полиморфизм. Шаблоны - проявление метапрограммирования

### Шаблоны функций
```
template <class T>
void sort(T *array, int len)
{
  for(int start = 0; ; start++) {
    bool done = true;
    for(int i=len-2; i>=start; i--)
      if(array[i+1] < array[i]) {
        T tmp = array[i];
        array[i] = array[i+1];
        array[i+1] = tmp;
        done = false;
      }
    if(done)
      break;
  }
}

int a[30]
sort<int>(a, 30);

sort(a, 30) // компилятор автоматически догадывается что тип int (автоматический вывод аргументов шаблона)
```
### Специализация шаблонов
```
template<>
bool sort_less<const char*>(const char *a, const char *b)
{
  return strcmp(a, b) < 0;
}
```
Для компилятора это означает примерно следующее: Будь любезен, шаблон `sort_less` для случая `sort_less<const char*>` обрабатывай в соответствии с вот этим текстом шаблона, а не с каким-либо иным.


**Частичная специализация**:
```
template <class A, class B>
class Cls {
  // ...
};

template <class X>
class Cls<X, int> {
  // ...
};
```
или
```
template <class Z>
class Foo {
   // ...
};

template <class T>
class Foo<T*> {
  // ...
};
```
> Для шаблонов функций частичная специализация запрещена.

### Константы в роли параметров шаблонов
```
template <class T>
class Array {
  T *p;
  T init;
  unsigned int size;
public:
  Array(T in) : p(0), init(in), size(0) {}
  ~Array() { if(p) delete[] p; }
  T& operator[](unsigned int idx) {
    if(idx >= size) Resize(idx);
    return p[idx];
  }
  int Size() const { return size; }
private:
  void Resize(unsigned int required_index) {
    unsigned int new_size = size==0 ? 8 : size;
    while(new_size <= required_index)
      new_size *= 2;
    T *new_array = new T[new_size];
    for(unsigned int i = 0; i < new_size; i++)
      new_array[i] = i < size ? p[i] : init;
    if(p) delete[] p;
    p = new_array;
    size = new_size;
  }
  
  // запретим копирование и присваивание 
  void operator=(const Array<T>& ref) {}
  Array(const Array<T>& ref) {}
};

template <class T, T init_val, int dim>
class MultiMatrix {
  Array<MultiMatrix<T, init_val, dim-1>*> arr;
public:
  MultiMatrix() : arr(0) {}
  ~MultiMatrix() {
    for(int i=0; i < arr.Size(); i++)
      if(arr[i]) delete arr[i];
  }
  MultiMatrix<T, init_val, dim-1>&
  operator[](unsigned int idx) {
    if(!arr[idx])
      arr[idx] = new MultiMatrix<T, init_val, dim-1>;
    return *arr[idx];
  }
};

template <class T, T init_val>
class MultiMatrix<T, init_val, 1> : public Array<T> {
  MultiMatrix() : Array<T>(init_val) {}
};

int main()
{
  MultiMatrix<int, -1, 5> mm;
  mm[3][4][5][2][7] = 193;
  mm[2][2][2][2][2] = 251;
  printf("%d %d %d %d\n",
    mm[3][4][5][2][7], mm[2][2][2][2][2],
    mm[0][1][2][3][4], mm[1][2][3][2][1]);
  return 0;
}
// Вывод
193 251 -1 -1
```

### Тела функций в заголовке класса
В заголовке класса могут присутствовать тела функций-членов, весь код которых состоит из одной строки, реже - из двух, в исключительных случаях - из трех строк. Описания функций-членов большего объема следует выносить за пределы описания класса.

### Пример TCP
```
class FdHandler {
  int fd;
  bool own_fd;
public:
  FdHandler(int a_fd, bool own = true)
    : fd(a_fd), own_fd(own) {}
  virtual ~FdHandler();
  virtual void Handle(bool r, bool w) = 0;
  int GetFd() const { return fd; }
  virtual bool WantRead() const { return true; }
  virtual bool WantWrite() const { return false; }
};

FdHandler::~FdHandler()
{
  if(own_fd)
  close(fd);
}

class EventSelector {
  FdHandler **fd_array;
  int fd_array_len;
  int max_fd;
  bool quit_flag;
public:
  EventSelector() : fd_array(0), quit_flag(false) {}
  ~EventSelector();
  void Add(FdHandler *h);
  bool Remove(FdHandler *h);
  void BreakLoop() { quit_flag = true; }
  void Run();
};

EventSelector::~EventSelector()
{
  if(fd_array)
    delete[] fd_array;
}

void EventSelector::Add(FdHandler *h)
{
  int i;
  int fd = h->GetFd();
  if(!fd_array) {
    fd_array_len = fd > 15 ? fd + 1 : 16;
    fd_array = new FdHandler*[fd_array_len];
    for(i = 0; i < fd_array_len; i++)
      fd_array[i] = 0
    max_fd = -1;
  }
  if(fd_array_len <= fd) {
    FdHandler **tmp = new FdHandler*[fd+1];
    for(i = 0; i <= fd; i++)
      tmp[i] = i < fd_array_len ? fd_array[i] : 0;
    fd_array_len = fd + 1;
    delete[] fd_array;
    fd_array = tmp;
  }
  if(fd > max_fd)
    max_fd = fd;
  fd_array[fd] = h;
}

bool EventSelector::Remove(FdHandler *h)
{
  int fd = h->GetFd();
  if(fd >= fd_array_len || fd_array[fd] != h)
    return false;
  fd_array[fd] = 0;
  if(fd == max_fd) {
    while(max_fd >= 0 && !fd_array[max_fd])
      max_fd--;
  }
  return true;
}

void EventSelector::Run()
{
  quit_flag = false;
  do {
    int i;
    fd_set rds, wrs;
    FD_ZERO(&rds);
    FD_ZERO(&wrs);
    for(i = 0; i <= max_fd; i++) {
      if(fd_array[i]) {
        if(fd_array[i]->WantRead())
          FD_SET(i, &rds);
        if(fd_array[i]->WantWrite())
          FD_SET(i, &wrs);
      }
    }
    int res = select(max_fd + 1, &rds, &wrs, 0, 0);
    if(res < 0) { 
      if(errno == EINTR)
        continue;
      else
        break;
    }
    if(res > 0) {
      for(i = 0; i <= max_fd; i++) {
        if(!fd_array[i])
          continue;
        bool r = FD_ISSET(i, &rds);
        bool w = FD_ISSET(i, &wrs);
        if(r || w)
          fd_array[i]->Handle(r, w);
      }
    }
  } while(!quit_flag);
}

class ChatSession : FdHandler {
  friend class ChatServer;
  char buffer[max_line_length + 1];
  int buf_used;
  bool ignoring;
  char *name;
  ChatServer *the_master;
  
  ChatSession(ChatServer *a_master, int fd);
  ~ChatSession();
  void Send(const char *msg);
  virtual void Handle(bool r, bool w);
  void ReadAndIgnore();
  void ReadAndCheck();
  void CheckLines();
  void ProcessLine(const char *str);
};

class ChatServer : public FdHandler {
  EventSelector *the_selector;
  struct item {
    ChatSession *s;
    item *next;
  };
  item *first;
  ChatServer(EventSelector *sel, int fd);
public:
  ~ChatServer();
  static ChatServer *Start(EventSelector *sel, int port);
  void RemoveSession(ChatSession *s);
  void SendAll(const char *msg, ChatSession *except = 0);
private:
  virtual void Handle(bool r, bool w);
};

ChatServer *ChatServer::Start(EventSelector *sel, int port)
{
  int ls, opt, res;
  struct sockaddr_in addr;
  ls = socket(AF_INET, SOCK_STREAM, 0);
  if(ls == -1)
    return 0;
  opt = 1;
  setsockopt(ls, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt));
  addr.sin_family = AF_INET;
  addr.sin_addr.s_addr = htonl(INADDR_ANY):
  addr.sin_port = htons(port);
  res = bind(ls, (struct sockaddr*) &addr, sizeof(addr));
  if(res == -1)
    return 0;
  res = listen(ls, qlen_for_listen);
  if(res == -1)
    return 0;
  return new ChatServer(sel, ls);
}

ChatServer::ChatServer(EventSelector *sel, int fd)
  : FdHandler(fd, true), the_selector(sel), first(0)
{
  the_selector->Add(this);
}
ChatServer::~ChatServer()
{
  while(first) {
    item *tmp = first;
    first = first->next;
    the_selector->Remove(tmp->s);
    delete tmp->s;
    delete tmp;
  }
  the_selector->Remove(this);
}

void ChatServer::Handle(bool r, bool w)
{
  if(!r) // must not happen
    return;
  int sd;
  struct sockaddr_in addr;
  socklen_t len = sizeof(addr);
  sd = accept(GetFd(), (struct sockaddr*) &addr, &len);
  if(sd == -1)
    return;
  item *p = new item;
  p->next = first;
  p->s = new ChatSession(this, sd);
  first = p;
  the_selector->Add(p->s);
}

void ChatServer::RemoveSession(ChatSession *s)
{
  the_selector->Remove(s);
  item **p;
  for(p = &first; *p; p = &((*p)->next)) {
    if((*p)->s == s) {
      item *tmp = *p;
      *p = tmp->next;
      delete tmp->s;
      delete tmp;
      return;
    }
  }
}

void ChatServer::SendAll(const char *msg, ChatSession *except)
{
  item *p;
  for(p = first; p; p = p->next)
    if(p->s != except)
      p->s->Send(msg);
}

void ChatSession::Send(const char *msg)
{
  write(GetFd(), msg, strlen(msg));
}

ChatSession::ChatSession(ChatServer *a_master, int fd)
  : FdHandler(fd, true), buf_used(0), ignoring(false),
  name(0), the_master(a_master)
{
  Send("Your name please: ");
}

ChatSession::~ChatSession()
{ 
  if(name)
    delete[] name;
}

static const char welcome_msg[] = 
  "Welcome to the chat, you are known as ";
static const char entered msg[] = " has entered the chat";
static const char left_msg[] = " has left the chat";

void ChatSession::Handle(bool r, bool w)
{
  if(!r) // should never happen
    return;
  if(buf_used >= (int)sizeof(buffer)) {
    buf_used = 0;
    ignoring = true;
  }
  if(ignoring)
    ReadAndIgnore();
  else
    ReadAndCheck();
}

void ChatSession::ReadAndIgnore()
{
  int rc = read(GetFd(), buffer, sizeof(buffer));
  if(rc < 1) {
    the_master->RemoveSession(this);
    return;
  }
  int i;
  for(i = 0; i < rc; i++) {
    if(buffer[i] == '\n') { // stop ignoring !
      int rest = rc - i - 1;
      if(rest > 0)
        memmove(buffer, buffer + i + 1, rest);
      buf_used = rest;
      ignoring = 0;
      CheckLines();
    }
  }
}

void ChatSession::ReadAndCheck()
{
  int rc = 
    read(GetFd(), buffer+buf_used, sizeof(buffer)-buf_used);
  if(rc < 1) {
    if(name) {
      int len = strlen(name);
      char *lmsg = new char[len + sizeof(left_msg) + 2];
      sprintf(lmsg, "%s%s\n", name, left_msg);
      the_master->SendAll(lmsg, this);
      delete[] lmsg;
    }
    the_master->RemoveSession(this);
    return;
  }
  buf_used += rc;
  CheckLines();
}

void ChatSession::CheckLines()
{
  if(buf_used <= 0)
    return;
  int i;
  for(i = 0; i < buf_used; i++) {
    if(buffer[i] == '\n') {
      buffer[i] = 0;
      if(i > 0 && buffer[i-1] == '\r')
        buffer[i-1] = 0;
      ProcessLine(buffer);
      int rest = buf_used - i - 1;
      memmove(buffer, buffer + i + 1, rest);
      buf_used = rest;
      CheckLines();
      return;
    }
  }
}

void ChatSession::ProcessLine(const char *str)
{
  int len = strlen(str);
  if(!name) {
    name = new char[len+1];
    strcpy(name, str);
    char *wmsg = new char[len + sizeof(welcome_msg) + 2];
    sprintf(wmsg, "%s%s\n", welcome_msg, name);
    Send(wmsg);
    delete[] wmsg;
    char *emsg = new char[len + sizeof(entered_msg) + 2];
    sprintf(emsg, "%s%s\n", name, entered_msg);
    the_master->SendAll(emsg, this);
    delete[] emsg;
    return;
  }
  int nl = strlen(name);
  char *msg = new char[nl + len + 5];
  sprintf(msg, "<%s> %s\n", name, str);
  the_master->SendAll(msg);
  delete[] msg;
}

static int port = 7777;

int main()
{
  EventSelector *selector = new EventSelector;
  ChatServer *serv = ChatServer::Start(selector, port);
  if(!serv) {
    perror("server");
    return 1;
  }
  selector->Run();
  return 0;
}
```

