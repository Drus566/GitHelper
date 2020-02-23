# Содержание
1. [С чего начать](#1)
* 1.1 [Rails для начинающих](#1.1)
* * 1.1.1 [Что такое Rails](#1.1.1)
* * 1.1.2 [Создание Rails приложения](#1.1.2)
* * 1.1.3 [Hello Rails](#1.1.3)
* * 1.1.4 [Безопасность Rails](#1.1.4)
* * 1.1.5 [Что дальше](#1.1.5)
2. [Модели](#2)
* 2.1 [Основы Active Record](#2.1)
* * 2.1.1 [Что такое Active record](#2.1.1)
* * 2.1.2 [Соглашения над конфигурацией](#2.1.2)
* * 2.1.3 [Создание моделей Active record](#2.1.3)
* * 2.1.4 [Переопределение соглашений о конфигурации](#2.1.4)
* * 2.1.5 [CRUD операции](#2.1.5)
* * 2.1.6 [Валидации](#2.1.6)
* * 2.1.7 [Колбэки](#2.1.7)
* * 2.1.8 [Миграции](#2.1.8)
* 2.2 [Миграции Active Record](#2.2)
* * 2.2.1 [Обзор миграции](#2.2.1)
* * 2.2.2 [Создание миграции](#2.2.2)
* * 2.2.3 [Написание миграции](#2.2.3)
* * 2.2.4 [Запуск миграции](#2.2.4)
* * 2.2.5 [Изменение существующих миграций](#2.2.5)
* * 2.2.6 [Выгрузка схемы](#2.2.6)
* * 2.2.7 [Active Record и ссылочная целостность](#2.2.7)
* * 2.2.8 [Миграции и сиды](#2.2.8)
* * 2.2.9 [Старые миграции](#2.2.9)
* 2.3 [Валидации](#2.3)
* * 2.3.1 [Обзор валидаций](#2.3.1)
* * 2.3.2 [Валидационные хелперы](#2.3.2)
* * 2.3.3 [Общие опции валидаций](#2.3.3)
* * 2.3.4 [Строгие валидации](#2.3.4)
* * 2.3.5 [Условная валидация](#2.3.5)
* * 2.3.6 [Выполнение собственных валидаций](#2.3.6)
* * 2.3.7 [Работаем с ошибками валидации](#2.3.7)
* * 2.3.8 [Отображение ошибок валидации во вьюхах](#2.3.8)
* 2.4 [Колбэки](#2.4)
* * 2.4.1 [Жизненный цикл объекта](#2.4.1)
* * 2.4.2 [Обзор колбэков](#2.4.2)
* * 2.4.3 [Доступные колбэки](#2.4.3)
* * 2.4.4 [Запуск колбэков](#2.4.4)
* * 2.4.5 [Пропуск колбэков](#2.4.5)
* * 2.4.6 [Прерывание выполнения](#2.4.6)
* * 2.4.7 [Колбэки для отношений](#2.4.7)
* * 2.4.8 [Условные колбэки](#2.4.8)
* * 2.4.9 [Классы колбэков](#2.4.9)
* * 2.4.10 [Транзакционные колбэки](#2.4.10)
* 2.5 [Связи (ассоциации)](#2.5)
* * 2.5.1 [Зачем нужны связи?](#2.5.1)
* * 2.5.2 [Типы связей](#2.5.2)
* * 2.5.3 [Полезные советы и предупреждения](#2.5.3)
* * 2.5.4 [Подробная информация по связи belongs_to](#2.5.4)
* * 2.5.5 [Подробная информация по связи has_one](#2.5.5)
* * 2.5.6 [Подробная информация по связи has_many](#2.5.6)
* * 2.5.7 [Подробная информация по связи has_and_belongs_to_many](#2.5.7)
* * 2.5.8 [Подробная информация по колбэкам и расширениям связи](#2.5.8)
* * 2.5.9 [Наследование с единой таблицей (STI)](#2.5.9)

3. [Вьюхи](#3)
4. [Контроллеры](#4)
5. [Копаем глубже](#5)
* 5.1 [Безопасность приложений на Rails](#5.1)
* 5.11 [Командная строка Rails](#5.11)
6. [Расширяем Rails](#6)
* 6.5 [Rails для API приложений](#6.5)
7. [Вносим вклад](#7)
8. [Дополнительно](#8)

> В rus rails имеется множество ссылок, на ресурсы по связанным темам прямо в тексте, которые здесь не отображены.

# C чего начать <a name="1"></a>
## Rails для начинающих <a name="1.1"></a>
### Что такое Rails <a name="1.1.1"></a>
Если изучите "The Rails Way", то, возможно, откроете в себе значительное увеличение производительности. Если будете упорствовать и переносить старые привычки с других языков в разработку на Rails, и попытаетесь использовать шаблоны, изученные где-то еще, ваш опыт разработки будет менее счастливым.

Философия Rails включает два важных ведущих принципов:
* Don't Repeat Yourself: DRY — это принцип разработки ПО, который гласит, что "Каждый кусочек информации должен иметь единственное, неизбыточное, авторитетное представление в системе". Не пишите одну и ту же информацию снова и снова, код будет легче поддерживать, и он будет более расширяемым и менее ошибочным.
* Convention Over Configuration: у Rails есть мнения о наилучших способах делать множество вещей в веб-приложении, и по умолчанию выставлены эти соглашения, вместо того, чтобы заставлять вас по мелочам править многочисленные конфигурационные файлы. 
### Создание Rails приложения <a name="1.1.2"></a>
Для установки Rails используйте команду `gem install`, представленную RubyGems:
```
gem install rails
```
Создание приложения:
```
rails new blog
```
Это создаст приложение на Rails с именем Blog в директории blog и установит гемы, зависимости от которых упомянуты в Gemfile при использовании `bundle install`.
> При использовании Windows Subsystem for Linux, имеются некоторые ограничения на сообщения файловой системы, означающие, что следует отключить гемы spring и listen, что можно сделать, запустив `rails new blog --skip-spring --skip-listen`.

Можно посмотреть все возможные опции командной строки, которые принимает билдер приложения на Rails, запустив rails new -h.

Директория
| Файл/Папка | Назначение |
|------------|------------|
| app/ | Содержит контроллеры, модели, вьюхи, хелперы, рассыльщики, каналы, задания и ассеты вашего приложения. Мы рассмотрим эту папку подробнее далее. |
| bin/ | Содержит Rails скрипты которые стартуют ваше приложение, также директория может содержать другие скрипты которые вы используете для настройки, обновления, деплоя или запуска. |
| config/ | Конфигурации маршрутов, базы данных вашего приложения, и т.д. Более подробно это раскрыто в Конфигурирование приложений на Rails |
| config.ru | Конфигурация Rack для серверов, основанных на Rack, используемых для запуска приложения. Подробнее о Rack смотрите на сайте Rack. |
| db/ | Содержит текущую схему вашей базы данных, а также миграции базы данных. |
| Gemfile Gemfile.lock | Эти файлы позволяют указать, какие зависимости от гемов нужны для вашего приложения на Rails. Эти файлы используются гемом Bundler. Подробнее о Bundler смотрите на сайте Bundler. |
| lib/ | Внешние модули для вашего приложения. |
| log/ | Файлы логов приложения. |
| package.json | Этот файл позволяет указать, какие зависимости npm необходимы для приложения Rails. Этот файл используется Yarn. Подробнее о Yarn смотрите на сайте Yarn. |
| public/ | Единственная папка, которая доступна извне как есть. Содержит статичные файлы и скомпилированные ассеты. |
| Rakefile | Этот файл находит и загружает задачи, которые могут быть запущены в командной строке. Определенная задача доступна во всех компонентах Rails. Вместо изменения Rakefile, можно добавить свои собственные задачи, добавив файлы в директорию lib/tasks приложения. |
| README.md | Это вводный мануал для вашего приложения. Его следует отредактировать, чтобы рассказать остальным, что ваше приложение делает, как его настроить, и т.п. |
| storage/ | Файлы Active Storage для сервиса Disk. Это раскрывается в руководстве Обзор Active Storage. |
| test/ | Юнит-тесты, фикстуры и прочий аппарат тестирования. Это раскрывается в руководстве Тестирование приложений на Rails |
| tmp/ | Временные файлы (такие как файлы кэша и pid) |
| vendor/ | Место для кода сторонних разработчиков. В типичном приложении на Rails включает внешние гемы. |
| .gitignore | Этот файл сообщает git, какие файлы (явно или по шаблону) ему следует игнорировать. Подробнее об игнорировании файлов смотрите GitHub - Ignoring files. |
| .ruby-version | Этот файл содержит дефолтную версию Ruby |
### Hello rails <a name="1.1.3"></a>
Запуск `rails server`
> Если вы используете Windows, вы должны передавать скрипты из папки bin непосредственно в интерпретатор Ruby, то есть ruby bin\rails server.

Веб сервер по умолчанию - puma

> Сжатие ассетов JavaScript требует среды выполнения JavaScript в вашей системе, и его отсутствие приведет к ошибке execjs во время сжатия ассетов. Обычно macOS и Windows поставляются с установленной средой выполнения JavaScript. therubyrhino - рекомендованная среда выполнения для пользователей JRuby, она добавляется в Gemfile, если приложение генерируется под JRuby. Можно узнать все о поддерживаемых средах выполнения в ExecJS

`Ctrl + C` - остановка сервера
В режиме development, Rails в основном не требует остановки сервера; все изменения, которые Вы делаете в файлах, автоматически подхватываются сервером.

`rails routes` - выводит в терминал все пути 
Основной form builder для Rails представлен методом хелпера по имени `form_with`
```
<%= form_with scope: :article, url: articles_path, local: true do |form| %>
<%= form_with scope: :article, local: true do |form| %>
```
ПРИМЕЧАНИЕ: По умолчанию form_with отправляет формы с использованием Ajax, тем самым не осуществляя редирект всей страницы. Чтобы облегчить чтение данного руководства, мы отключили это с помощью `local: true`.
#### Создание статей
При отправке формы, ее поля будут посланы в Rails как параметры. К этим параметрам можно обратиться из экшнов контроллера, как правило, для выполнения определенных задач. Чтобы увидеть, на что похожи эти параметры, измените экшн create так:
```
def create
  render plain: params[:article].inspect
end
```
Метод params возвращает объект ActionController::Parameters, позволяющий получать доступ к ключам хэша с использованием или строк, или символов.
> Давайте рассмотрим в качестве примера URL: http://www.example.com/?username=dhh&email=dhh@email.com. В этом URL, params[:username] будет равен "dhh" и params[:email] будет равен "dhh@email.com".

Если еще раз отправить форму, вы увидите что-то вроде следующего:
`<ActionController::Parameters {"title"=>"First Article!", "text"=>"This is my first article."} permitted: false>`

#### Создание модели Article
`rails generate model Article title:string text:text`
создаст:
```
class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
```
Миграция в бд `rails db:migrate`
Если хотите выполнить миграции в другой среде, например в production, следует явно передать ее при вызове команды: `rails db:migrate RAILS_ENV=production`

Rails имеет ряд защитных мер, помогающих писать безопасные приложения, и вы только что столкнулись с одной из них. Она называется strong parameters и требует, чтобы мы указали Rails, какие именно параметры разрешено передавать в экшны нашего контроллера.

Нам нужно определить разрешенные параметры нашего контроллера, чтобы предотвратить ошибочное массовое назначение. В этом случае, мы хотим и разрешить, и затребовать параметры title и text для правильного использования в create. Синтаксис для этого представлен методами `require` и `permit`. Изменение затрагивает одну строчку в экшне create:
```
private
  def article_params
    params.require(:article).permit(:title, :text)
  end
```
> Если вам нужна ссылка на экшн того же контроллера, не нужно определять опцию :controller, так как Rails по умолчанию использует текущий контроллер.

В режиме development (с которым вы работаете по умолчанию), Rails перегружает ваше приложение с каждым запросом браузера, так что не нужно останавливать и перезапускать веб-сервер при внесении изменений.
`pluralize` это хелпер rails, принимающий число и строку как аргументы. Если число больше одного, строка будет автоматически склонено во множественном числе.
Rails автоматически оборачивает поля, содержащие ошибку, в div с классом `field_with_errors`. Можно определить правило CSS, чтобы сделать их выделяющимися.
Передача объекта статьи в метод `form_with` автоматически установит URL для отправки формы отредактированной статьи. Эта опция сообщает Rails, что мы хотим, чтобы эта форма была отправлена с помощью PATCH, метода HTTP, от которого ожидается, что он используется для обновления ресурсов в соответствии с протоколом REST.
Также, передача объекта модели в `form_with`, наподобие `model: @article` во вьюхе редактирования выше, заставит хелпер формы заполнить поля формы соответствующими значениями объекта. Передача в пространство имен символа, такая как `scope: :article`, что было сделано во вьюхе new, только создаст пустые поля формы.
> Не обязательно передавать все атрибуты в update. К примеру, если был вызван `@article.update(title: 'A new title')`, Rails обновит только атрибут title, оставив все другие атрибуты нетронутыми.
Хелперы, в том числе `form with` https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-form_with-label-Resource-oriented+style
`rails generate model Comment commenter:string body:text article:references`
Ключевое слово `(:references)`, использованное в команде bash, это специальный тип данных для моделей. Он создает новый столбец в вашей базе данных с именем представленной модели с добавленным _id, который может содержать числовые значения. Чтобы лучше понять, проанализируйте файл db/schema.rb после выполнения миграции.

В дополнение к модели, Rails также сделал миграцию для создания соответствующей таблицы базы данных:
```
class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end

  end
end
```
Строчка `t.references` создает числовой столбец с именем `article_id`, индекс для него, и ограничение внешнего ключа, указывающего на столбец id таблицы `articles`.

#### Добавляем маршрут для комментариев
```
resources :articles do
  resources :comments
end
```
`<%= form_with(model: [ @article, @article.comments.build ], local: true) do |form| %>`
```
<%= link_to 'Destroy Comment', [comment.article, comment],
               method: :delete,
               data: { confirm: 'Are you sure?' } %>
```
#### Удаление связанных объектов
`has_many :comments, dependent: :destroy`
### Безопасность <a name="1.1.4"></a>
Если вы опубликуете свой блог онлайн, любой сможет добавлять, редактировать и удалять статьи или удалять комментарии.

Rails предоставляет базовую аутентификационную систему HTTP, которая хорошо работает в этой ситуации.

В ArticlesController нам нужен способ блокировать доступ к различным экшнам, если пользователь не аутентифицирован. Тут мы можем использовать метод Rails `http_basic_authenticate_with`, разрешающий доступ к требуемым экшнам, если метод позволит это.

Чтобы использовать систему аутентификации, мы определим ее вверху нашего ArticlesController в app/controllers/articles_controller.rb. В нашем случае, мы хотим, чтобы пользователь был аутентифицирован для каждого экшна, кроме index и show, поэтому напишем так:
```
class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end
```
Мы также хотим позволить только аутентифицированным пользователям удалять комментарии, поэтому в CommentsController (app/controllers/comments_controller.rb) мы напишем:
```
class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    # ...
  end
```
Теперь, если попытаетесь создать новую статью, то встретитесь с вызовом базовой аутентификации HTTP.
### Что дальше? <a name="1.1.5"></a>
тут ссылки на ресурсы в оригинале на RusRails 

# Модели <a name="2"></a>
## Основы Active record <a name="2.1"></a>
<a href="https://api.rubyonrails.org/classes/ActiveRecord/Base.html#class-ActiveRecord::Base-label-Single+table+inheritance">Active Record Documentation</a>
### Что такое Active record <a name="2.1.1"></a>
Active Record это M в MVC - модель - которая является слоем в системе, ответственным за представление бизнес-логики и данных. Active Record упрощает создание и использование бизнес-объектов, данные которых требуют персистентного хранения в базе данных. Сама по себе эта реализация паттерна Active Record является описанием системы ORM (Object Relational Mapping).

Active Record был описан Martin Fowler в его книге Patterns of Enterprise Application Architecture. В Active Record объекты содержат и персистентные данные, и поведение, которое работает с этими данными. Active Record исходит из мнения, что обеспечение логики доступа к данным как части объекта покажет пользователям этого объекта то, как читать и писать в базу данных

Object Relational Mapping (объектно-реляционное отображение), обычно упоминающееся как аббревиатура ORM, это техника, соединяющая сложные объекты приложения с таблицами в системе управления реляционными базами данных.

Active Record предоставляет нам несколько механизмов, наиболее важными из которых являются способности для:
* Представления моделей и их данных.
* Представления связей между этими моделями.
* Представления иерархий наследования с помощью связанных моделей.
* Валидации моделей до того, как они станут персистентными в базе данных.
* Выполнения операций с базой данных в объектно-ориентированном стиле. 
### Соглашения над конфигурацией <a name="2.1.2"></a>
Идея в том, что в большинстве случаев вы настраиваете свои приложения одинаковым образом, и этот способ должен быть способом по умолчанию. Таким образом, явная конфигурация потребуется только тогда, когда вы не следуете соглашениям по какой-то причине.
* Таблица базы данных - Множественная форма со словами, разделенными знаком подчеркивания (т.е., book_clubs).
* Класс модели - Единственное число с первой прописной буквой в каждом слове (т.е., BookClub).

| Модель / Класс | Таблица / Схема |
|----------------|-----------------|
| Article        |	articles       | 
| LineItem       |  line_items     |
| Deer           |  deers          |
| Mouse          |	mice           |
| Person         |  people         |

#### Cоглашения схемы
Active Record использует соглашения о именовании для столбцов в таблицах базы данных, зависящих от назначения этих столбцов.
* Внешние ключи - Эти поля должны именоваться по образцу singularized_table_name_id (т.е., item_id, order_id). Это поля, которые ищет Active Record при создании связей между вашими моделями.
* Первичные ключи - По умолчанию Active Record использует числовой столбец с именем id как первичный ключ таблицы. Этот столбец будет автоматически создан при использовании миграций Active Record для создания таблиц. 

Также имеются некоторые опциональные имена столбцов, добавляющие дополнительные особенности для экземпляров Active Record:
* created_at - Автоматически будут установлены текущие дата и время при изначальном создании записи.
* updated_at - Автоматически будут установлены текущие дата и время всякий раз, когда обновляется запись.
* lock_version - Добавляет оптимистическую блокировку к модели.
* type - Указывает, что модель использует Single Table Inheritance.
* (association_name)_type - Хранит тип для полиморфных связей.
* **(table_name)_count - Используется для кэширования количества принадлежащих по связи объектов. Например, столбец comments_count в классе Article, у которого может быть несколько связанных экземпляров Comment, закэширует количество существующих комментариев для каждой статьи.**

> Хотя эти имена столбцов опциональны, фактически они зарезервированы Active Record. Избегайте зарезервированных ключевых слов, если вы не желаете дополнительной функциональности. Например, type - это зарезервированное слово для определения таблицы, использующей наследование с единой таблицей (STI). Если вы не используете STI, попытайтесь использовать аналогичное слово, такое как "context", которое также может аккуратно описать данные, которые вы моделируете

### Создание моделей Active Record <a name="2.1.3"></a>
Создавать модели Active Record очень просто. Все, что необходимо сделать, - это создать подкласс ApplicationRecord, и готово:
```
class Product < ApplicationRecord
end
```
Это создаст модель Product, **связав ее с таблицей products в базе данных**. Сделав так, также появится способность связать столбцы каждой строки этой таблицы с атрибутами экземпляров вашей модели. Допустим, что таблица products была создана с использованием такого выражения SQL (или одно из его расширений):
```
CREATE TABLE products (
   id int(11) NOT NULL auto_increment,
   name varchar(255),
   PRIMARY KEY  (id)
);
```
Вышеуказанная схема объявляет таблицу с двумя столбцами: id и name. Каждая строка этой таблицы представляет собой определенный продукт с этими двумя параметрами. Таким образом, можно написать подобный код:
```
p = Product.new
p.name = "Some Book"
puts p.name # "Some Book"
```
### Переопределение соглашений об именовании <a name="2.1.4"></a>
Но что, если вы следуете другому соглашению по именованию или используете новое приложение Rails со старой базой данных? Не проблема, можно просто переопределить соглашения по умолчанию.

ApplicationRecord наследуется от `ActiveRecord::Base`, который определяет ряд полезных методов. Можно использовать метод `ActiveRecord::Base.table_name=` для указания имени таблицы, которая должна быть использована:
```
class Product < ApplicationRecord
  self.table_name = "my_products"
end
```
Если так сделать, нужно вручную определить имя класса, содержащего фикстуры (my_products.yml), используя метод set_fixture_class в определении теста:
```
class ProductTest < ActiveSupport::TestCase
  set_fixture_class my_products: Product
  fixtures :my_products
  ...
end
```
Также возможно переопределить столбец, который должен быть использован как первичный ключ таблицы, с помощью метода `ActiveRecord::Base.primary_key=`:
```
class Product < ApplicationRecord
  self.primary_key = "product_id"
end
```
### CRUD: Чтение и запись данных <a name="2.1.5"></a>
CRUD это сокращение для четырех глаголов, используемых для описания операций с данными: Create (создать), Read (прочесть), Update (обновить) и Delete (удалить). Active Record автоматически создает методы, позволяющие приложению читать и воздействовать на данные, хранимые в своих таблицах.
Если предоставлен блок и `create`, и `new` передадут новый объект в этот блок для инициализации:
```
user = User.new do |u|
  u.name = "David"
  u.occupation = "Code Artist"
end
```
Возвратит первого пользователя с именем David
```
david = User.find_by(name: 'David')
```
Найдет всех пользователей с именем David, которые Code Artists, и сортирует их по created_at в обратном хронологическом порядке:
```
users = User.where(name: 'David', occupation: 'Code Artist').order(created_at: :desc)
```
<a href="http://rusrails.ru/active-record-query-interface">Подробнее в интерфейсе запросов Active Record</a>

Обновление:
```
user = User.find_by(name: 'David')
user.update(name: 'Dave')
```
Это наиболее полезно, когда необходимо обновить несколько атрибутов за раз. Если, с другой стороны, необходимо обновить несколько записей за раз, полезен метод класса update_all:
```
User.update_all "max_login_attempts = 3, must_change_password = 'true'"
```
Более того, после получения, объект Active Record может быть уничтожен, что уберет его из базы данных.
```
user = User.find_by(name: 'David')
user.destroy
```
Если необходимо удалить сразу несколько записей, можно использовать метод destroy_all:
```
# найти и удалить всех пользователей с именем David
User.where(name: 'David').destroy_all

# удалить всех пользователей
User.destroy_all
```
### Валидации <a name="2.1.6"></a>
Active Record позволяет проверять состояние модели до того, как она будет записана в базу данных.
Валидация - это очень важный вопрос, который нужно рассмотреть при сохранении в базу данных, поэтому методы `save` и `update` учитывают ее при запуске: они возвращают `false`, когда валидация проваливается, и фактически они не выполняют каких-либо операций с базой данных. Каждый из этих методов имеет пару с восклицательным знаком (`save!` и `update!`), которые строже в том, что они вызывают исключение `ActiveRecord::RecordInvalid` если валидация провалится. Краткий пример:
```
class User < ApplicationRecord
  validates :name, presence: true
end

user = User.new
user.save  # => false
user.save! # => ActiveRecord::RecordInvalid: Validation failed: Name can't be blank
```
<a href="http://rusrails.ru/active-record-validations">Валидации Active record</a>
### Колбэки <a name="2.1.7"></a>
Колбэки Active Record разрешают присоединить код к определенным событиям в жизненном цикле ваших моделей. Это позволяет добавить поведение модели, прозрачно выполнив код, когда эти события произойдут, например, когда вы создадите новую запись, обновите его, удалите его и так далее. Подробнее о колбэках можно прочитать в руководстве <a href="http://rusrails.ru/active-record-callbacks">Колбэки Active Record</a>.
### Миграции <a name="2.1.8"></a>
Rails предоставляет DSL для управления схемой базы данных, называемый миграциями. Миграции хранятся в файлах, выполняемых для любой базы данных, которую **поддерживает Active Record, с использованием `rake`**. Вот миграция, создающая таблицу:
```
class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.text :description
      t.references :publication_type
      t.integer :publisher_id
      t.string :publisher_type
      t.boolean :single_issue

      t.timestamps
    end
    add_index :publications, :publication_type_id
  end
end
```
Rails отслеживает, какие файлы переданы в базу данных, и представляет возможность отката. Чтобы фактически создать таблицу, нужно запустить rails `db:migrate`, **а чтобы ее откатить rails `db:rollback`**.
> Отметьте, что вышеприведенный код не зависит от базы данных: он выполнится в MySQL, PostgreSQL, Oracle и иных. 

## Миграции Active Record <a name="2.2"></a>
Миграции - это особенность Active Record, позволяющая изменять схему вашей базы данных время от времени.
### Обзор миграций <a name="2.2.1"></a>
В базах данных, поддерживающих транзакции с выражениями, изменяющими схему, миграции оборачиваются в транзакцию. Если база данных это не поддерживает, и миграция проваливается, части, которые прошли успешно, не будут откачены назад. Вам нужно произвести откат вручную.
> Некоторые запросы не могут быть запущены в транзакции. Если ваш адаптер поддерживает транзакции DDL, можно использовать `disable_ddl_transaction!` для их отключения для отдельной миграции.

Если хотите миграцию для чего-то, что Active Record не знает, как обратить, вы можете использовать `reversible`
```
class ChangeProductsPrice < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :products do |t|
        dir.up   { t.change :price, :string }
        dir.down { t.change :price, :integer }
      end
    end
  end
end
```
С другой стороны, можно использовать `up` и `down` вместо `change`:
```
class ChangeProductsPrice < ActiveRecord::Migration[5.0]
  def up
    change_table :products do |t|
      t.change :price, :string
    end
  end

  def down
    change_table :products do |t|
      t.change :price, :integer
    end
  end
end
```
### Создание миграции <a name="2.2.2"></a>
#### Создание автономной миграции
Миграции хранятся как файлы в директории `db/migrate`, один файл на каждый класс. Имя файла имеет вид `YYYYMMDDHHMMSS_create_products.rb`, это означает, что временная метка UTC идентифицирует миграцию, затем идет знак подчеркивания, затем идет имя миграции, где слова разделены подчеркиваниями. Имя класса миграции содержит буквенную часть названия файла, но уже в формате `CamelCase` (т.е. слова пишутся слитно, каждое слово начинается с большой буквы). Например, `20080906120000_create_products.rb` должен определять класс `CreateProducts`, а `20080906120001_add_details_to_products.rb` должен определять `AddDetailsToProducts`. Rails использует эту метку, чтобы определить, какая миграция должна быть запущена и в каком порядке, так что если вы копируете миграции из другого приложения или генерируете файл сами, будьте более бдительны.

**Пустая миграция**:
```
rails generate migration AddPartNumberToProducts
```
Это создаст правильно названную пустую миграцию:
```
class AddPartNumberToProducts < ActiveRecord::Migration[5.0]
  def change
  end
end
```
**Обычное поле столбец**.
```
rails generate migration AddPartNumberToProducts part_number:string
или
rails generate migration AddDetailsToProducts part_number:string price:decimal
```
генерирует
```
class AddPartNumberToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :part_number, :string
  end
end

и

class AddDetailsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :part_number, :string
    add_column :products, :price, :decimal
  end
end
```
**Индекс** на новый столбец, вы можете сделать это так
```
rails generate migration AddPartNumberToProducts part_number:string:index
```
генерирует
```
class AddPartNumberToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :part_number, :string
    add_index :products, :part_number
  end
end
```
**Удаление столбца**
```
rails generate migration RemovePartNumberFromProducts part_number:string
```
генерирует
```
class RemovePartNumberFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :part_number, :string
  end
end
```
**Cоздание таблицы** 
```
rails generate migration CreateProducts name:string part_number:string
```
генерирует
```
class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :part_number

      t.timestamps
    end
  end
end
```
**Столбец references** <a href="https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-add_reference">Документация</a>
```
rails generate migration AddUserRefToProducts user:references
```
генерирует 
```
class AddUserRefToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :user, foreign_key: true
  end
end
```
**Соединительная таблица**
```
rails generate migration CreateJoinTableCustomerProduct customer product
```
генерирует
```
class CreateJoinTableCustomerProduct < ActiveRecord::Migration[5.0]
  def change
    create_join_table :customers, :products do |t|
      # t.index [:customer_id, :product_id]
      # t.index [:product_id, :customer_id]
    end
  end
end
```
> Как всегда, то, что было сгенерировано, является всего лишь стартовой точкой. Вы можете добавлять и убирать строки, как считаете нужным, отредактировав файл `db/migrate/YYYYMMDDHHMMSS_add_details_to_products.rb`.
#### Генераторы модели
Генераторы модели и скаффолда создадут миграции, подходящие для создания новой модели.
```
rails generate model Product name:string description:text
```
-> 
```
class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
```
#### Передача модификаторов
```
rails generate migration AddDetailsToProducts 'price:decimal{5,2}' supplier:references{polymorphic}
```
->
```
class AddDetailsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price, :decimal, precision: 5, scale: 2
    add_reference :products, :supplier, polymorphic: true
  end
end
```
### Написание миграции <a name="2.2.3"></a>
#### Создание таблицы
По умолчанию `create_table` создаст первичный ключ, названный `id`. Вы можете изменить имя первичного ключа с помощью опции `:primary_key` (не забудьте также обновить соответствующую модель), или, если вы вообще не хотите первичный ключ, можно указать опцию `id: false`. Если нужно передать базе данных специфичные опции, вы можете поместить фрагмент SQL в опцию `:options`. Например:
```
create_table :products, options: "ENGINE=BLACKHOLE" do |t|
  t.string :name, null: false
end
```
добавит `ENGINE=BLACKHOLE` к SQL выражению, используемому для создания таблицы.
Также можно передать опцию `:comment` с любым описанием для таблицы, которое будет сохранено в самой базе данных, и может быть просмотрено с помощью инструментов администрирования базы данных
#### Создание соединительной таблицы
**Миграционный метод** `create_join_table` создает соединительную таблицу HABTM (has and belongs to many, многие ко многим).
```
create_join_table :products, :categories
```
что создаст таблицу categories_products с двумя столбцами по имени `category_id` и `product_id`. У этих столбцов есть опция `:null`, установленная в `false` по умолчанию. Это может быть переопределено опцией `:column_options:`
```
create_join_table :products, :categories, column_options: { null: true }
```

**По умолчанию**, имя соединительной таблицы получается как соединение первых двух аргументов, переданных в `create_join_table`, в алфавитном порядке. Чтобы настроить имя таблицы, передайте опцию `:table_name:`
```
create_join_table :products, :categories, table_name: :categorization
```
создает таблицу `categorization`

**По умолчанию** `create_join_table` создаст два столбца без опций, но можно определить эти опции с использованием опции `:column_options`. Например,
```
create_join_table :products, :categories, column_options: { null: true }
```
создаст `product_id` и `category_id` с опцией `:null` равной `true`.
`create_join_table` также принимает блок, который можно использовать для добавления индексов (которые по умолчанию не создаются) или дополнительных столбцов:
```
create_join_table :products, :categories do |t|
  t.index :product_id
  t.index :category_id
end
```
#### Изменение таблиц
```
change_table :products do |t|
  t.remove :description, :name
  t.string :part_number
  t.index :part_number
  t.rename :upccode, :upc_code
end
```
удаляет столбцы `description` и `name`, создает строковый столбец `part_number` и добавляет индекс на него. Наконец, он переименовывает столбец `upccode`.
#### Изменение столбцов
```
change_column :products, :part_number, :text
```
Он меняет тип столбца `part_number` в таблице products на `:text`. Отметьте, что команда `change_column` — необратима.

**Кроме** `change_column`, методы `change_column_null` и `change_column_default` используются чтобы изменить ограничение не-null или значение столбца по умолчанию.
```
change_column_null :products, :name, false
change_column_default :products, :approved, from: true, to: false
```
Это настроит поле `:name` в products быть NOT NULL столбцом и изменит значение по умолчанию для поля `:approved` с `true` на `false`.

Также можно написать предыдущую миграцию `change_column_default` как `change_column_default :products, :approved, false`, но, в отличие от предыдущего примера, это сделало бы вашу миграцию необратимой
#### Модификаторы столбца
Модификаторы столбца могут быть применены при создании или изменении столбца:
* `limit` Устанавливает максимальный размер полей `string/text/binary/integer`.
* `precision` Определяет точность для полей `decimal`, определяющую общее количество цифр в числе.
* `scale` Определяет масштаб для полей `decimal`, определяющий количество цифр после запятой.
* `polymorphic` Добавляет столбец `type` для связей `belongs_to`.
* `null` Позволяет или запрещает значения `NULL` в столбце.
* `default` Позволяет установить значение по умолчанию для столбца. Отметьте, что если вы используете динамическое значение (такое как дату), значение по умолчанию будет вычислено лишь один раз (т.е. на дату, когда миграция будет применена).
* `comment` Добавляет комментарий для столбца.
Некоторые адаптеры могут поддерживать дополнительные опции; за подробностями обратитесь к документации API конкретных адаптеров.
> С помощью командной строки нельзя указать null и default
#### Внешние ключи
Хотя это и не требуется, вы можете захотеть добавить ограничения внешнего ключа для обеспечения ссылочной целостности.
```
add_foreign_key :articles, :authors
```
Это добавит новый внешний ключ к столбцу `author_id` таблицы `articles`. Ключ ссылается на столбец `id` таблицы `authors`. Если имена столбцов не могут быть произведены из имен таблиц, можно использовать опции `:column` и `:primary_key`.
Rails сгенерирует имя для каждого внешнего ключа, начинающееся с `fk_rails_` плюс 10 символов, которые детерминировано генерируются на основе `from_table` и `column`. Также есть опция `:name`, если хотите указать другое имя.

> Active Record поддерживает внешние ключи только для отдельных столбцов. Чтобы использовать составные внешние ключи, требуются `execute` и `structure.sql`.

**Убрать внешний ключ** также просто:
```
# позволим Active Record выяснить имя столбца
remove_foreign_key :accounts, :branches

# уберем внешний ключ для определенного столбца
remove_foreign_key :accounts, column: :owner_id

# уберем внешний ключ по имени
remove_foreign_key :accounts, name: :special_fk_name
```
#### Когда хелперов недостаточно
Если хелперов, предоставленных Active Record, недостаточно, можно использовать метод `execute` для выполнения произвольного SQL:
```
Product.connection.execute("UPDATE products SET price = 'free' WHERE 1=1")
```
Больше подробностей и примеров отдельных методов содержится в документации по API. В частности, документация для `ActiveRecord::ConnectionAdapters::SchemaStatements` (который обеспечивает методы, доступные в методах `up`, `down` и `change`), `ActiveRecord::ConnectionAdapters::TableDefinition` (который обеспечивает методы, доступные у объекта, переданного методом `create_table`) и `ActiveRecord::ConnectionAdapters::Table` (который обеспечивает методы, доступные у объекта, переданного методом `change_table`).
#### Использование метода change
Метод `change` это основной метод написания миграций. Он работает в большинстве случаев, когда `Active Record` знает, как обратить миграцию автоматически. На текущий момент метод change поддерживает только эти определения миграции:
* `add_column`
* `add_foreign_key`
* `add_index`
* `add_reference`
* `add_timestamps`
* `change_column_default` (необходимо указать опции :from и :to)
* `change_column_null`
* `create_join_table`
* `create_table`
* `disable_extension`
* `drop_join_table`
* `drop_table` (необходимо указать блок)
* `enable_extension`
* `remove_column` (необходимо указать тип)
* `remove_foreign_key` (необходимо указать вторую таблицу)
* `remove_index`
* `remove_reference`
* `remove_timestamps`
* `rename_column`
* `rename_index`
* `rename_table` 

`change_table` также является обратимым, пока блок не вызывает `change`, `change_default` или `remove`.

`remove_column` обратима, если предоставить тип столбца третьим аргументом. Также предоставьте опции оригинального столбца, иначе Rails не сможет в точности пересоздать этот столбец при откате:
```
remove_column :posts, :slug, :string, null: false, default: ''
```
**Если вы нуждаетесь в использовании иных методов**, следует использовать `reversible` или писать методы `up` и `down` вместо метода `change`.
#### Использование `reversible`
 Вы можете использовать reversible, чтобы указать что делать когда запускается миграция и когда она требует отката.
 ```
 class ExampleMigration < ActiveRecord::Migration
  def change
    create_table :distributors do |t|
      t.string :zipcode
    end

    reversible do |dir|
      dir.up do
        # добавим ограничение CHECK
        execute <<-SQL
          ALTER TABLE distributors
            ADD CONSTRAINT zipchk
              CHECK (char_length(zipcode) = 5) NO INHERIT;
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE distributors
            DROP CONSTRAINT zipchk
        SQL
      end
    end

    add_column :users, :home_page_url, :string
    rename_column :users, :email, :email_address
  end
end
```
Использование `reversible` гарантирует, что инструкции выполнятся в правильном порядке. Если предыдущий пример миграции откатывается, `down` блок начнёт выполнятся после того как столбец `home_page_url` будет удалён и перед перед тем как произойдёт удаление таблицы `distributors`.

Иногда миграция будет делать то, что просто необратимо; например, она может уничтожить некоторые данные. В таких случаях, вы можете вызвать `ActiveRecord::IrreversibleMigration` в вашем `down` блоке. Если кто-либо попытается отменить вашу миграцию, будет отображена ошибка, что это не может быть выполнено.
#### Использование методов `up/down`
По аналогии с верхним примером 
```
class ExampleMigration < ActiveRecord::Migration[5.0]
  def up
    create_table :distributors do |t|
      t.string :zipcode
    end

    #добавляем ограничение CHECK
    execute <<-SQL
      ALTER TABLE distributors
        ADD CONSTRAINT zipchk
        CHECK (char_length(zipcode) = 5);
    SQL

    add_column :users, :home_page_url, :string
    rename_column :users, :email, :email_address
  end

  def down
    rename_column :users, :email_address, :email
    remove_column :users, :home_page_url

    execute <<-SQL
      ALTER TABLE distributors
        DROP CONSTRAINT zipchk
    SQL

    drop_table :distributors
  end
end
```
#### Возвращение к предыдущим миграциям
```
require_relative '20121212123456_example_migration'

class FixupExampleMigration < ActiveRecord::Migration[5.0]
  def change
    revert ExampleMigration

    create_table(:apples) do |t|
      t.string :variety
    end
  end
end
```
Метод `revert` также может принимать блок. Это может быть полезно для отката выбранной части предыдущих миграций. Для примера, давайте представим, что `ExampleMigration` закоммичена, а позже мы решили, что было бы лучше использовать валидации `Active Record`, вместо ограничения `CHECK`, для проверки `zipcode`.
```
class DontUseConstraintForZipcodeValidationMigration < ActiveRecord::Migration[5.0]
  def change
    revert do
      reversible do |dir|
        dir.up do
          # добавим ограничение CHECK
          execute <<-SQL
            ALTER TABLE distributors
              ADD CONSTRAINT zipchk
                CHECK (char_length(zipcode) = 5);
          SQL
        end
        dir.down do
          execute <<-SQL
            ALTER TABLE distributors
              DROP CONSTRAINT zipchk
          SQL
        end
      end

      # The rest of the migration was ok
    end
  end
end
```
Подобная миграция также может быть написана без использования `revert`, но это бы привело к ещё нескольким шагам: изменение порядка (следования) `create table` и `reversible`, замена `create_table` на `drop_table` и в конечном итоге изменение `up` на `down` и наоборот. Обо всём этом уже позаботился `revert`.

> Если необходимо добавить ограничения `CHECK`, как в вышеуказанных примерах, нужно использовать `structure.sql` в качестве метода для выгрузки.
### Запуск миграций <a name="2.2.4"></a>
`rails db:migrate` запускает метод `change` или `up` для всех миграций, которые еще не были запущены. 3апуск команды `db:migrate` также вызывает команду `db:schema:dump`, которая обновляет ваш файл `db/schema.rb` в соответствии со структурой вашей базы данных.
Если вы определите целевую версию, `Active Record` запустит требуемые миграции (методы `up`, `down` или `change`), пока не достигнет требуемой версии. Версия это числовой префикс у файла миграции. Например, чтобы мигрировать к версии `20080906120000`, запустите:
```
$ rails db:migrate VERSION=20080906120000
```
Если миграция назад, это запустит метод `down` для всех миграций до, но не включая, `20080906120000`.
#### Откат
```
$ rails db:rollback
```
Если нужно отменить несколько миграций, можно указать параметр `STEP`:
```
$ rails db:rollback STEP=3
```
Команда `db:migrate:redo` это ярлык для выполнения отката, а затем запуска миграции снова.
```
rails db:migrate:redo STEP=3
```
#### Установка базы данных
Команда `rails db:setup` создаст базу данных, загрузит схему и инициализирует ее с помощью данных `seed`.
#### Сброс базы данных
Команда `rails db:reset` удалит базу данных и установит ее заново. Функционально это эквивалентно `rails db:drop db:setup`.
> Это не то же самое, что запуск всех миграций. Будет использовано только текущее содержимое файла `db/schema.rb` или `db/structure.sql`. Если миграцию откатить невозможно, `rails db:reset` может не помочь вам.
#### Запуск определенных миграций
Если необходимо запустить определённую миграцию вверх или вниз, это делают команды `db:migrate:up` и `db:migrate:down`. Просто укажите подходящую версию и у соответствующей миграции будет вызван метод `change`, `up` или `down`, например:
```
$ rails db:migrate:up VERSION=20080906120000
```
#### Запуск миграций в различных средах
По умолчанию запуск `rails db:migrate` запустится в окружении `development`.
```
rails db:migrate RAILS_ENV=test
```
#### Изменение вывода результата запущенных миграций
Метод             |	Назначение
------------------|---------------
suppress_messages | Принимает блок как аргумент и запрещает любой вывод, сгенерированный этим блоком.
say 	            | Принимает сообщение как аргумент и выводит его как есть. Может быть передан второй булевый аргумент для указания, нужен отступ или нет.
say_with_time     | Выводит текст вместе с продолжительностью выполнения блока. Если блок возвращает число, предполагается, что это количество затронутых строк.

Например, эта миграция:
```
class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    suppress_messages do
      create_table :products do |t|
        t.string :name
        t.text :description
        t.timestamps
      end
    end

    say "Created a table"

    suppress_messages {add_index :products, :name}
    say "and an index!", true

    say_with_time 'Waiting for a while' do
      sleep 10
      250
    end
  end
end
```
сгенерирует следующий результат
```
==  CreateProducts: migrating =================================================
-- Created a table
   -> and an index!
-- Waiting for a while
   -> 10.0013s
   -> 250 rows
==  CreateProducts: migrated (10.0054s) =======================================
```
Если хотите, чтобы Active Record ничего не выводил, запуск `rails db:migrate VERBOSE=false` запретит любой вывод.

### Изменение существующих миграций <a name="2.2.5"></a>
Периодически вы будете делать ошибки при написании миграции. Если вы уже запустили миграцию, вы не сможете просто отредактировать миграцию и запустить ее снова: Rails посчитает, что он уже выполнял миграцию, и ничего не сделает при запуске `rails db:migrate`. Вы должны откатить миграцию (например, с помощью `rails db:rollback`), отредактировать миграцию и затем запустить `rails db:migrate` для запуска исправленной версии.

В целом, редактирование существующих миграций не хорошая идея. Вы создадите дополнительную работу себе и своим коллегам, и вызовете море головной боли, если существующая версия миграции уже была запущена в `production`. Вместо этого, следует написать новую миграцию, выполняющую требуемые изменения. Редактирование только что сгенерированные миграции, которая еще не была закоммичена в систему контроля версий (или, хотя бы, не ушла дальше вашей рабочей машины) относительно безвредно.

Метод `revert` может быть очень полезным при написании новой миграции для возвращения предыдущей в целом или какой то части.

### Выгрузка схемы <a name="2.2.6"></a>
#### Для чего нужны файлы схемы?
Миграции, какими бы не были они мощными, не являются авторитетным источником для схемы базы данных. База данных остается авторитетным источником. По умолчанию Rails генерирует `db/schema.rb`, которая пытается охватить текущее состояние схемы базы данных.

Она имеет тенденцию быть более быстрой и менее подверженной ошибкам, связанным с созданием нового экземпляра базы данных приложения, загружая файл схемы через `rails db:schema:load`, чем при повторном воспроизведении всей истории миграций. Старые миграции могут работать неправильно, если эти миграции используют изменения внешних зависимостей или полагаются на код приложения, который развивается отдельно от этих миграций.

Файлы схемы также полезны, если необходимо быстро посмотреть, какие атрибуты есть у объекта Active Record. Эта информация не содержится в коде модели и часто распределена по нескольким миграциям, но собрана воедино в файле схемы.
#### Типы выгрузок схемы
Формат выгрузки схемы, сгенерированный Rails, управляется настройкой `config.active_record.schema_format` в `config/application.rb`. Форматом по умолчанию является `:ruby`, но также он может быть установлен в `:sql`.

Если выбрано `:ruby`, тогда схема хранится в `db/schema.rb`. Посмотрев в этот файл, можно увидеть, что он очень похож на одну большую миграцию:
```
ActiveRecord::Schema.define(version: 2008_09_06_171750) do
  create_table "authors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "part_number"
  end
end
```
Во многих случаях этого достаточно. Этот файл создается путем проверки базы данных и описывает свою структуру, используя `create_table`, `add_index` и так далее.

`db/schema.rb` не может описать все, что может поддерживать база данных, например триггеры, последовательности, хранимые процедуры, ограничения `CHECK` и так далее. Отметьте, в то время как в миграциях можно выполнить произвольные выражения SQL, эти выражения не смогут быть воспроизведены выгрузчиком схемы. Если используете подобные особенности, необходимо установить формат схемы как `:sql`, чтобы получить точный файл схемы, который будет полезен для создания новых экземпляров базы данных.

Когда формат схемы установлен в `:sql`, структура базы данных будет выгружена с помощью инструмента, предназначенного для этой базы данных в `db/structure.sql`. Например, для PostgreSQL используется утилита `pg_dump`. Для MySQL и MariaDB этот файл будет содержать результат SHOW CREATE TABLE для разных таблиц.

Чтобы загрузить схему из `db/structure.sql`, запустите `rails db:structure:load`. Загрузка этого файла осуществляется путем выполнения содержащихся в нем выражений SQL. По определению создастся точная копия структуры базы данных.
#### Выгрузки схем и управление версиями
Поскольку файлы схемы обычно используются для создания новых баз данных, настоятельно рекомендуется проверять файл схемы в системе управления версиями.

Конфликты слияния могут возникать в файле схемы, когда две ветки модифицируют схему. Для разрешения этих конфликтов, запустите `rails db:migrate`, чтобы восстановить файл схемы.
### Active Record и ссылочная целостность <a name="2.2.7"></a>
Способ Active Record требует, чтобы логика была в моделях, а не в базе данных. По большому счету, функции, такие как триггеры или ограничения, которые переносят часть логики обратно в базу данных, не используются активно.

Валидации, такие как `validates :foreign_key, uniqueness: true`, это один из способов, которым ваши модели могут соблюдать ссылочную целостность. Опция :dependent в связях позволяет моделям автоматически уничтожать дочерние объекты при уничтожении родителя. Подобно всему, что работает на уровне приложения, это не может гарантировать ссылочной целостности, таким образом кто-то может добавить еще и внешние ключи как ограничители ссылочной целостности в базе данных.

Хотя Active Record не предоставляет каких-либо инструментов для работы напрямую с этими функциями, метод `execute` может использоваться для выполнения произвольного SQL.
### Миграции и сиды <a name="2.2.8"></a>
Основным назначением миграции Rails является запуск команд, последовательно модифицирующих схему. Миграции также могут быть использованы для добавления или модифицирования данных. Это полезно для существующей базы данных, которую нельзя удалить и пересоздать, такой как база данных на `production`.
```
class AddInitialProducts < ActiveRecord::Migration[5.0]
  def up
    5.times do |i|
      Product.create(name: "Product ##{i}", description: "A product.")
    end
  end

  def down
    Product.delete_all
  end
end
```
Чтобы добавить изначальные данные в базу данных после создания, в Rails имеется встроенная особенность 'seeds', которая делает процесс быстрым и простым. Это особенно полезно при частой перезагрузке базы данных в средах разработки и тестирования. Этой особенностью легко начать пользоваться: просто заполните `db/seeds.rb` некоторым кодом Ruby и запустите `rails db:seed`:
```
5.times do |i|
  Product.create(name: "Product ##{i}", description: "A product.")
end
```
В основном, это более чистый способ настроить базу данных для пустого приложения.
### Старые миграции <a name="2.2.9"></a>
`db/schema.rb` или `db/structure.sql` это снимок текущего состояния вашей базы данных и авторитетный источник для восстановления этой базы данных. Поэтому возможно удалить старые файлы миграций.

Когда вы удалите файлы миграций в директории `db/migrate/`, любая среда, в которой `rails db:migrate` была запущена, когда эти файлы еще существовали, будет хранить ссылки на временные метки миграций во внутренней таблице Rails по имени `schema_migrations`. Эта таблица используется для отслеживания, была ли миграция выполнена в указанной среде.

Если вы запустите команду `rails db:migrate:status`, которая отображает статус (`up` или `down`) каждой миграции, вы увидите `********** NO FILE **********`, отображенный рядом с каждым удаленным файлом миграции, который однажды был запущен в указанной среде, но больше не найден в директории db/migrate/.
## Валидации <a name="2.3"></a>
### Обзор валидаций <a name="2.3.1"></a>
```
class Person < ApplicationRecord
  validates :name, presence: true
end

Person.create(name: "John Doe").valid? # => true
Person.create(name: nil).valid? # => false
```
#### Зачем использовать валидации?
Есть несколько способов валидации данных, прежде чем они будут сохранены в вашу базу данных, включая ограничения, встроенные в базу данных, валидации на клиентской части и валидации на уровне контроллера. Вкратце о плюсах и минусах:
* Ограничения базы данных и/или хранимые процедуры делают механизмы валидации зависимыми от базы данных, что делает тестирование и поддержку более трудными. Однако, если ваша база данных используется другими приложениями, валидация на уровне базы данных может безопасно обрабатывать некоторые вещи (такие как уникальность в нагруженных таблицах), которые затруднительно выполнять по-другому.
* Валидации на клиентской части могут быть очень полезны, но в целом ненадежны, если используются в одиночку. Если они используют JavaScript, они могут быть пропущены, если JavaScript отключен в клиентском браузере. Однако, если этот способ комбинировать с другими, валидации на клиентской части могут быть удобным способом предоставить пользователям немедленную обратную связь при использовании вашего сайта.
* Валидации на уровне контроллера заманчиво делать, но это часто приводит к громоздкости и трудности тестирования и поддержки. Во всех случаях, когда это возможно, держите свои контроллеры 'тощими', тогда с вашим приложением будет приятно работать в долгосрочной перспективе. 

Выбирайте их под свои определенные специфичные задачи. Общее мнение команды Rails состоит в том, что валидации на уровне модели - наиболее подходящий вариант во многих случаях.
#### Когда происходит валидация?
Создание и сохранение новой записи посылает операцию `SQL INSERT` базе данных. Обновление существующей записи вместо этого посылает операцию `SQL UPDATE`. Валидации обычно запускаются до того, как эти команды посылаются базе данных. Если любая из валидаций проваливается, объект помечается как недействительный и Active Record не выполняет операцию `INSERT` или `UPDATE`. Это помогает избежать хранения невалидного объекта в базе данных. Можно выбирать запуск специфичных валидаций, когда объект создается, сохраняется или обновляется.

Есть разные методы изменения состояния объекта в базе данных. Некоторые методы вызывают валидации, некоторые нет. Это означает, что возможно сохранить в базу данных объект с недействительным статусом, если вы будете не внимательны.

Следующие методы вызывают валидацию, и сохраняют объект в базу данных только если он валиден:
* `create`
* `create!`
* `save`
* `save!`
* `update`
* `update!`

Версии с восклицательным знаком (т.е. `save!`) **вызывают исключение**, если запись недействительна. Невосклицательные версии не вызывают: `save` и `update` возвращают `false`, `create` **возвращает объект**.
#### Пропуск валидаций
Следующие методы пропускают валидации, и сохраняют объект в базу данных, независимо от его валидности. Их нужно использовать осторожно.
* `decrement!`
* `decrement_counter`
* `increment!`
* `increment_counter`
* `toggle!`
* `touch`
* `update_all`
* `update_attribute`
* `update_column`
* `update_columns`
* `update_counters`

Заметьте, что `save` также имеет способность пропустить валидации, если передать `validate: false` как аргумент. Этот способ нужно использовать осторожно.
```
save(validate: false) 
```
#### `valid?` или `invalid?`
Вы также можете запускать эти валидации самостоятельно. `valid?` вызывает ваши валидации и возвращает `true`, если ни одной ошибки не было найдено у объекта, иначе `false`.
```
class Person < ApplicationRecord
  validates :name, presence: true
end

Person.create(name: "John Doe").valid? # => true
Person.create(name: nil).valid? # => false
```
После того, как Active Record выполнит валидации, все найденные ошибки будут доступны в методе экземпляра `errors.messages`, возвращающем коллекцию ошибок.
`invalid?` это просто антипод `valid?`.
#### `errors[]`
Чтобы проверить, является или нет конкретный атрибут объекта валидным, можно использовать `errors[:attribute]`, который возвращает массив со всеми ошибками атрибута, когда нет ошибок по определенному атрибуту, возвращается пустой массив.
#### `errors.details`
Чтобы проверить, какие валидации упали на невалидном атрибуте, можно использовать `errors.details[:attribute]`. Он возвращает массив хэшей с ключом `:error`, чтобы получить символ валидатора:
```
class Person < ApplicationRecord
  validates :name, presence: true
end

>> person = Person.new
>> person.valid?
>> person.errors.details[:name] # => [{error: :blank}]
```
### Валидационные хелперы <a name="2.3.2"></a>
Каждый хелпер принимает произвольное количество имен атрибутов, поэтому в одной строчке кода можно добавить валидации одинакового вида для нескольких атрибутов.

Они все принимают опции `:on` и `:message`, которые определяют, когда валидация должна быть запущена, и какое сообщение должно быть добавлено в коллекцию `errors`, если она провалится. Опция `:on` принимает одно из значений `:create` или `:update`. Для каждого валидационного хелпера есть свое сообщение об ошибке по умолчанию. Эти сообщения используются, если не определена опция `:message`.
#### `acceptance`
Этот метод проверяет, что чекбокс в пользовательском интерфейсе был нажат, когда форма была подтверждена.
```
class Person < ApplicationRecord
  validates :terms_of_service, acceptance: true
end
```
Эта проверка выполнится, только если `terms_of_service` не `nil`.
Можно передать произвольное сообщение с помощью опции `message`.
```
class Person < ApplicationRecord
  validates :terms_of_service, acceptance: { message: 'must be abided' }
end
```
Также он может получать опцию `:accept`, которая определяет допустимые значения, которые будут считаться принятыми. По умолчанию это "1", но его можно изменить.
```
class Person < ApplicationRecord
  validates :eula, acceptance: { accept: ['TRUE', 'accepted'] }
end
```
Эта валидация очень специфична для веб-приложений, и ее принятие не нужно записывать куда-либо в базу данных. Если у вас нет поля для него, хелпер всего лишь создаст виртуальный атрибут. Если поле существует в базе данных, опция `accept` должна быть установлена или включать `true`, а иначе эта валидация не будет выполнена.
#### `validates_associated`
Этот хелпер можно использовать, когда у вашей модели есть связи с другими моделями, и их также нужно проверить на валидность. Когда вы пытаетесь сохранить свой объект, будет вызван метод `valid?` для каждого из связанных объектов.
```
class Library < ApplicationRecord
  has_many :books
  validates_associated :books
end
```
Эта валидация работает со всеми типами связей.

> Не используйте `validates_associated` на обоих концах ваших связей, они будут вызывать друг друга в бесконечном цикле.

Для `validates_associated` сообщение об ошибке по умолчанию следующее "is invalid". Заметьте, что каждый связанный объект имеет свою собственную коллекцию `errors`; ошибки не добавляются к вызывающей модели.
#### `confirmation`
Этот хелпер можно использовать, если у вас есть два текстовых поля, из которых нужно получить полностью идентичное содержание.
Например, вы хотите подтверждение адреса электронной почты или пароля. Эта валидация создает виртуальный атрибут, имя которого равно имени подтверждаемого поля с добавлением "confirmation".
```
class Person < ApplicationRecord
  validates :email, confirmation: true
end
```
В вашем шаблоне вьюхи нужно использовать что-то вроде этого:
```
<%= text_field :person, :email %>
<%= text_field :person, :email_confirmation %>
```
Эта проверка выполняется, только если `email_confirmation` не равно `nil`. Чтобы требовать подтверждение, нужно добавить еще проверку на существование проверяемого атрибута (мы рассмотрим presence чуть позже):
```
class Person < ApplicationRecord
  validates :email, confirmation: true
  validates :email_confirmation, presence: true
end
```
Также имеется опция `:case_sensitive`, которую используют, чтобы определить, должно ли ограничение подтверждения быть чувствительным к регистру. Эта опция по умолчанию `true`.
```
class Person < ApplicationRecord
  validates :email, confirmation: { case_sensitive: false }
end
```
#### `exclusion`
Этот хелпер проводит валидацию того, что значения атрибутов не включены в указанный набор. Фактически, этот набор может быть любым перечисляемым объектом.
```
class Account < ApplicationRecord
  validates :subdomain, exclusion: { in: %w(www us ca jp),
    message: "%{value} is reserved." }
end
```
Хелпер exclusion имеет опцию `:in`, которая получает набор значений, которые не должны приниматься проверяемыми атрибутами. Опция `:in` имеет псевдоним `:within`, который используется для тех же целей. Этот пример использует опцию `:message`, чтобы показать вам, как можно включать значение атрибута.
#### `format`
Этот хелпер проводит валидацию значений атрибутов, тестируя их на соответствие указанному регулярному выражению, которое определяется с помощью опции `:with`.
```
class Product < ApplicationRecord
  validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
end
```
В качестве альтернативы можно потребовать, чтобы указанный атрибут не соответствовал регулярному выражению, используя опцию `:without`.
#### `inclusion`
Этот хелпер проводит валидацию значений атрибутов на включение в указанный набор. Фактически этот набор может быть любым перечисляемым объектом.
```
class Coffee < ApplicationRecord
  validates :size, inclusion: { in: %w(small medium large),
    message: "%{value} is not a valid size" }
end
```
#### `length`
```
class Person < ApplicationRecord
  validates :name, length: { minimum: 2 }
  validates :bio, length: { maximum: 500 }
  validates :password, length: { in: 6..20 }
  validates :registration_number, length: { is: 6 }
end
```
Возможные опции ограничения длины такие:
* `:minimum` - атрибут не может быть меньше определенной длины.
* `:maximum` - атрибут не может быть больше определенной длины.
* `:in` (или `:within`) - длина атрибута должна находиться в указанном интервале. Значение этой опции должно быть интервалом.
* `:is` - длина атрибута должна быть равной указанному значению. 

Значение сообщения об ошибке по умолчанию зависит от типа выполняемой валидации длины. Можно переопределить эти сообщения, используя опции `:wrong_length`, `:too_long` и `:too_short`, и `%{count}` как местозаполнитель (placeholder) числа, соответствующего длине используемого ограничения. Можете использовать опцию `:message` для определения сообщения об ошибке.
```
class Person < ApplicationRecord
  validates :bio, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }
end
```
Отметьте, что сообщения об ошибке по умолчанию во множественном числе (т.е., "is too short (minimum is %{count} characters)"). По этой причине, когда `:minimum` равно 1, следует предоставить собственное сообщение или использовать вместо него `presence: true`. Когда `:in` или `:within` имеют как нижнюю границу 1, следует или предоставить собственное сообщение, или вызвать `presence` перед `length`.
#### `numericality`
Этот хелпер проводит валидацию того, что ваши атрибуты имеют только числовые значения. По умолчанию, этому будет соответствовать возможный знак первым символом, и следующее за ним целочисленное или с плавающей запятой число. Чтобы определить, что допустимы только целочисленные значения, установите `:only_integer` в `true`.

Если установить `:only_integer` в `true`, тогда будет использоваться регулярное выражение
```
/\A[+-]?\d+\z/
```
для проведения валидации значения атрибута. В противном случае, он будет пытаться конвертировать значение в число, используя `Float`.
```
class Player < ApplicationRecord
  validates :points, numericality: true
  validates :games_played, numericality: { only_integer: true }
end
```

Кроме `:only_integer`, хелпер `validates_numericality_of` также принимает следующие опции для добавления ограничений к приемлемым значениям:
* `:greater_than` - определяет, что значение должно быть больше, чем значение опции.
* `:greater_than_or_equal_to` - определяет, что значение должно быть больше или равно значению опции.
* `:equal_to` - определяет, что значение должно быть равно значению опции.
* `:less_than` - определяет, что значение должно быть меньше, чем значение опции. 
* `:less_than_or_equal_to` - определяет, что значение должно быть меньше или равно значению опции.
* `:other_than` - определяет, что значение должно отличаться от представленного значения.
* `:odd` - определяет, что значение должно быть нечетным, если установлено true.
* `:even` - определяет, что значение должно быть четным, если установлено true.

> По умолчанию `numericality` не допускает значения `nil`. Чтобы их разрешить, можно использовать опцию `allow_nil: true`.
#### `presence`
Этот хелпер проводит валидацию того, что определенные атрибуты не пустые. Он использует метод `blank?` для проверки того, является ли значение или `nil`, или пустой строкой (это строка, которая или пуста, или состоит из пробелов).
```
class Person < ApplicationRecord
  validates :name, :login, :email, presence: true
end
```
Если хотите быть уверенным, **что связь существует**, нужно проверить, существует ли сам связанный объект, а не внешний ключ, используемый для связи.
```
class LineItem < ApplicationRecord
  belongs_to :order
  validates :order, presence: true
end
```
Для того, чтобы **проверять связанные записи**, чье присутствие необходимо, нужно определить опцию `:inverse_of` для связи:
```
class Order < ApplicationRecord
  has_many :line_items, inverse_of: :order
end
```
При проведении валидации существования объекта, связанного отношением `has_one` или `has_many`, будет проверено, что объект ни `blank?`, ни `marked_for_destruction?`.

Так как `false.blank?` это `true`, если хотите **провести валидацию существования булева поля**, нужно использовать одну из следующих валидаций:
```
validates :boolean_field_name, inclusion: { in: [true, false] }
validates :boolean_field_name, exclusion: { in: [nil] }
```
При использовании одной из этих валидаций, вы можете быть уверены, что значение не будет `nil`, которое в большинстве случаев преобразуется в `NULL` значение.
#### `absence`
Этот хелпер проверяет, что указанные атрибуты отсутствуют. Он использует метод `present?` для проверки, что значение является либо `nil`, либо пустой строкой (то есть либо нулевой длины, либо состоящей из пробелов).
```
class Person < ApplicationRecord
  validates :name, :login, :email, absence: true
end
```
Если хотите **убедиться, что отсутствует связь**, необходимо проверить, что отсутствует сам связанный объект, а не внешний ключ, используемый для связи.
```
class LineItem < ApplicationRecord
  belongs_to :order
  validates :order, absence: true
end
```
Чтобы проверять связанные объекты, отсутствие которых требуется, для связи необходимо указать опцию `:inverse_of`:
```
class Order < ApplicationRecord
  has_many :line_items, inverse_of: :order
end
```
Если проверяете отсутствие объекта, связанного отношением `has_one` или `has_many`, он проверит, что объект и не `present?`, и не `marked_for_destruction?`.

Поскольку `false.present?` является `false`, если хотите проверить отсутствие булева поля, следует использовать `validates :field_name, exclusion: { in: [true, false] }`
#### `uniqueness`
Этот хелпер проводит валидацию того, что значение атрибута уникально, перед тем, как объект будет сохранен. Он не создает условие уникальности в базе данных, следовательно, может произойти так, что два разных подключения к базе данных создадут две записи с одинаковым значением для столбца, который вы подразумеваете уникальным. Чтобы этого избежать, нужно создать индекс `unique` на оба столбцах в вашей базе данных.
```
class Account < ApplicationRecord
  validates :email, uniqueness: true
end
```
Валидация производится путем SQL-запроса в таблицу модели, поиска существующей записи с тем же значением атрибута.

Имеется опция `:scope`, которую можно использовать для определения одного и более атрибутов, используемых для ограничения проверки уникальности:
```
class Holiday < ApplicationRecord
  validates :name, uniqueness: { scope: :year,
    message: "should happen once per year" }
end
```
Если хотите создать ограничение на уровне базы данных, чтобы предотвратить возможные нарушения валидации уникальности с помощью опции `:scope`, необходимо создать индекс уникальности на обоих столбцах базы данных.
Также имеется опция `:case_sensitive`, которой можно определить, будет ли ограничение уникальности чувствительно к регистру или нет. Опция по умолчанию равна `true`.
```
class Person < ApplicationRecord
  validates :name, uniqueness: { case_sensitive: false }
end
```
> Отметьте, что некоторые базы данных настроены на выполнение чувствительного к регистру поиска в любом случае.
#### `validates_with`
```
class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.first_name == "Evil"
      record.errors[:base] << "This person is evil"
    end
  end
end

class Person < ApplicationRecord
  validates_with GoodnessValidator
end
```
> Ошибки, добавляемые в `record.errors[:base]` относятся к состоянию записи в целом, а не к определенному атрибуту.
Хелпер `validates_with` принимает класс или список классов для использования в валидации. Для `validates_with` нет сообщения об ошибке по умолчанию. Следует вручную добавлять ошибки в коллекцию errors записи в классе валидатора.

Для применения метода validate, необходимо иметь определенным параметр record, который является записью, проходящей валидацию.

Подобно всем другим валидациям, `validates_with` принимает опции `:if`, `:unless` и `:on`. Если передадите любые другие опции, они будут переданы в класс валидатора как `options`:
```
class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if options[:fields].any?{|field| record.send(field) == "Evil" }
      record.errors[:base] << "This person is evil"
    end
  end
end

class Person < ApplicationRecord
  validates_with GoodnessValidator, fields: [:first_name, :last_name]
end
```
Отметьте, что валидатор будет инициализирован только один раз на протяжении всего жизненного цикла приложения, а не при каждом запуске валидации, поэтому будьте аккуратнее с использованием переменных экземпляра в нем.

Если ваш валидатор настолько сложный, что вы хотите использовать переменные экземпляра, вместо него проще использовать обычные объекты Ruby:
```
class Person < ApplicationRecord
  validate do |person|
    GoodnessValidator.new(person).validate
  end
end

class GoodnessValidator
  def initialize(person)
    @person = person
  end

  def validate
    if some_complex_condition_involving_ivars_and_private_methods?
      @person.errors[:base] << "This person is evil"
    end
  end

  # ...
end
```
#### `validates_each`
Этот хелпер помогает провести валидацию атрибутов с помощью блока кода. Он не имеет предопределенной валидационной функции. Вы должны создать ее, используя блок, и каждый атрибут, указанный в `validates_each`, будет протестирован в нем. В следующем примере нам не нужны имена и фамилии, начинающиеся с маленькой буквы.
```
class Person < ApplicationRecord
  validates_each :name, :surname do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
end
```
Блок получает запись, имя атрибута и значение атрибута. Вы можете делать что угодно для проверки валидности данных внутри блока. Если валидация проваливается, следует добавить сообщение об ошибке в модель, которое делает ее невалидной.
### Общие опции валидаций <a name="2.3.3"></a>
#### `:allow_nil`
Опция `:allow_nil` пропускает валидацию, когда проверяемое значение равно `nil`.
```
class Coffee < ApplicationRecord
  validates :size, inclusion: { in: %w(small medium large),
    message: "%{value} is not a valid size" }, allow_nil: true
end
```
#### `:allow_blank`

Опция `:allow_blank` подобна опции `:allow_nil`. Эта опция пропускает валидацию, если значение атрибута `blank?`, например `nil` или пустая строка.
```
class Topic < ApplicationRecord
  validates :title, length: { is: 5 }, allow_blank: true
end

Topic.create(title: "").valid?  # => true
Topic.create(title: nil).valid? # => true
```
#### `:message`
Значение `String` в `:message` может опционально содержать любые из `%{value}`, `%{attribute}` и `%{model}`, которые будут динамически заменены, когда валидация провалится. Эта замена выполняется, если используется гем `I18n`, и местозаполнитель должен полностью совпадать, пробелы не допускаются.

Значение `Proc` в `:message` задается с двумя аргументами: проверяемым объектом и хэшем с ключами `:model`, `:attribute` и `:value`.
```
class Person < ApplicationRecord
  # Жестко закодированное сообщение
  validates :name, presence: { message: "must be given please" }

  # Сообщение со значением с динамическим атрибутом. %{value} будет заменено
  # фактическим значением атрибута. Также доступны %{attribute} и %{model}.
  validates :age, numericality: { message: "%{value} seems wrong" }

  # Proc
  validates :username,
    uniqueness: {
      # object = person object being validated
      # data = { model: "Person", attribute: "Username", value: <username> }
      message: ->(object, data) do
        "Hey #{object.name}!, #{data[:value]} is taken already! Try again #{Time.zone.tomorrow}"
      end
    }
end
```
#### `:on`
Используйте `on: :create`, для запуска валидации только когда создается новая запись, или `on: :update`, для запуска валидации когда запись обновляется.
```
class Person < ApplicationRecord
  # будет возможно обновить email с дублирующим значением
  validates :email, uniqueness: true, on: :create

  # будет возможно создать запись с нечисловым возрастом
  validates :age, numericality: true, on: :update

  # по умолчанию (проверяет и при создании, и при обновлении)
  validates :name, presence: true
end
```
`on:` также можно использовать для **определения пользовательского контекста**. Пользовательские контексты должны быть явно включены с помощью передачи имени контекста в `valid?`, `invalid?` или `save`.
```
class Person < ApplicationRecord
  validates :email, uniqueness: true, on: :account_setup
  validates :age, numericality: true, on: :account_setup
end

person = Person.new
```
`person.valid?(:account_setup)` выполнит обе валидации без сохранения модели. И `person.save(context: :account_setup)` перед сохранением валидирует `person` в контексте `account_setup`. При явном включении модель валидируется только валидациями только этого контекста и валидациями без контекста.

### Строгие валидации <a name="2.3.4"></a>
Также можно определить валидации строгими, чтобы они вызывали `ActiveModel::StrictValidationFailed`, когда объект невалиден.
```
class Person < ApplicationRecord
  validates :name, presence: { strict: true }
end

Person.new.valid?  # => ActiveModel::StrictValidationFailed: Name can't be blank
```
Также возможно передать собственное исключение в опцию `:strict`.
```
class Person < ApplicationRecord
  validates :token, presence: true, uniqueness: true, strict: TokenGenerationException
end

Person.new.valid?  # => TokenGenerationException: Token can't be blank
```
### Условная валидация <a name="2.3.5"></a>
#### Использование символа с `:if` и `:unless`
```
class Order < ApplicationRecord
  validates :card_number, presence: true, if: :paid_with_card?

  def paid_with_card?
    payment_type == "card"
  end
end
```
#### Использование `Proc` с `:if` и `:unless`
Использование объекта `Proc` дает возможность написать встроенное условие вместо отдельного метода. Этот вариант лучше всего подходит для однострочного кода.
```
class Account < ApplicationRecord
  validates :password, confirmation: true,
    unless: Proc.new { |a| a.password.blank? }
end
```
#### Группировка условных валидаций `with_options`
```
class User < ApplicationRecord
  with_options if: :is_admin? do |admin|
    admin.validates :password, length: { minimum: 10 }
    admin.validates :email, presence: true
  end
end
````
Во все валидации внутри `with_options` будет автоматически передано условие `if: :is_admin?`
#### Объединение условий валидации
С другой стороны, может использоваться массив, когда несколько условий определяют, должна ли произойти валидация. Более того, в одной и той же валидации можно применить и `:if:`, и `:unless`.
```
class Computer < ApplicationRecord
  validates :mouse, presence: true,
                    if: [Proc.new { |c| c.market.retail? }, :desktop?],
                    unless: Proc.new { |c| c.trackpad.present? }
end
```
Валидация выполнится только тогда, когда все условия `:if` и ни одно из условий `:unless` будут вычислены со значением `true`.
### Выполнение собственных валидаций <a name="2.3.6"></a>
#### Собственные валидаторы
Собственные валидаторы это классы, наследуемые от `ActiveModel::Validator`. Эти классы должны реализовать метод `validate`, принимающий запись как аргумент и выполняющий валидацию на ней. Собственный валидатор вызывается с использованием метода `validates_with`
```
class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.name.starts_with? 'X'
      record.errors[:name] << 'Need a name starting with X please!'
    end
  end
end
 
class Person
  include ActiveModel::Validations
  validates_with MyValidator
end
```
Простейшим способом добавить собственные валидаторы для валидации отдельных атрибутов является наследуемость от `ActiveModel::EachValidator`. В этом случае класс собственного валидатора должен реализовать метод `validate_each`, принимающий три аргумента: запись, атрибут и значение. Это будут соответствующие экземпляр, атрибут, который будет проверяться и значение атрибута в переданном экземпляре:
```
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)`[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Person < ApplicationRecord
  validates :email, presence: true, email: true
end
```
Как показано в примере, можно объединять стандартные валидации со своими произвольными валидаторами.
#### Собственные методы
Метод `valid?` проверит, что коллекция ошибок пуста. поэтому ваши собственные методы валидации должны добавить ошибки в нее, когда вы хотите, чтобы валидация провалилась:
```
class Invoice < ApplicationRecord
  validate :expiration_date_cannot_be_in_the_past,
    :discount_cannot_be_greater_than_total_value

  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end

  def discount_cannot_be_greater_than_total_value
    errors.add(:discount, "can't be greater than total value") if
      discount > total_value
  end
end
```
По умолчанию такие валидации будут выполнены каждый раз при вызове `valid?` или сохранении объекта. Но также возможно контролировать, когда выполнять собственные валидации, передав опцию `:on` в метод `validate`, с ключами: `:create` или `:update`.
```
class Invoice < ApplicationRecord
  validate :active_customer, on: :create

  def active_customer
    errors.add(:customer_id, "is not active") unless customer.active?
  end
end
```
### Работаем с ошибками валидации <a name="2.3.7"></a>
#### `errors`
Возвращает экземпляр класса `ActiveModel::Errors`, содержащий все ошибки. Каждый ключ это имя атрибута и значение это массив строк со всеми ошибками.
```
class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
end

person = Person.new
person.valid? # => false
person.errors.messages
 # => {:name=>["can't be blank", "is too short (minimum is 3 characters)"]}

person = Person.new(name: "John Doe")
person.valid? # => true
person.errors.messages # => []
```
#### `errors[]`
Он возвращает массив строк со всеми сообщениями об ошибке для заданного атрибута, каждая строка с одним сообщением об ошибке. Если нет ошибок, относящихся к атрибуту, возвратится пустой массив.
```
class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
end

person = Person.new(name: "John Doe")
person.valid? # => true
person.errors[:name] # => []

person = Person.new(name: "JD")
person.valid? # => false
person.errors[:name] # => ["is too short (minimum is 3 characters)"]

person = Person.new
person.valid? # => false
person.errors[:name]
 # => ["can't be blank", "is too short (minimum is 3 characters)"]
```
#### `errors.add`
Метод add позволяет добавлять сообщение об ошибке, относящейся к определенному атрибуту. Он принимает в качестве аргументов атрибут и сообщение об ошибке.

Метод `errors.full_messages` (или его эквивалент `errors.to_a`) возвращает сообщения об ошибках в дружелюбном формате с именем атрибута с прописной буквы, предшествующим каждому сообщению, как показано в следующем примере.
```
class Person < ApplicationRecord
  def a_method_used_for_validation_purposes
    errors.add(:name, "cannot contain the characters !@#%*()_-+=")
  end
end

person = Person.create(name: "!@#")

person.errors[:name]
 # => ["cannot contain the characters !@#%*()_-+="]

person.errors.full_messages
 # => ["Name cannot contain the characters !@#%*()_-+="]
```
Эквивалентом `errors#add` является использование `<<` для добавления сообщения к массиву `errors.messages` атрибута:
```
  class Person < ApplicationRecord
    def a_method_used_for_validation_purposes
      errors.messages[:name] << "cannot contain the characters !@#%*()_-+="
    end
  end

  person = Person.create(name: "!@#")

  person.errors[:name]
   # => ["cannot contain the characters !@#%*()_-+="]

  person.errors.to_a
   # => ["Name cannot contain the characters !@#%*()_-+="]
```
#### `errors.details`
Можно указать тип валидатора в возвращаемом хэше подробностей об ошибке `detail` с помощью метода `errors.add`.
```
class Person < ApplicationRecord
  def a_method_used_for_validation_purposes
    errors.add(:name, :invalid_characters)
  end
end

person = Person.create(name: "!@#")

person.errors.details[:name]
# => [{error: :invalid_characters}]
```
Чтобы расширить хэш подробностей об ошибке `details`, добавив, к примеру, недопустимые символы, можно передать дополнительные ключи в `errors.add`.
```
class Person < ApplicationRecord
  def a_method_used_for_validation_purposes
    errors.add(:name, :invalid_characters, not_allowed: "!@#%*()_-+=")
  end
end

person = Person.create(name: "!@#")

person.errors.details[:name]
# => [{error: :invalid_characters, not_allowed: "!@#%*()_-+="}]
```
Все встроенные в Rails валидаторы заполняют хэш details соответствующим типом валидатора.
#### `errors[:base]`
Можете добавлять сообщения об ошибках, которые относятся к состоянию объекта в целом, а не к отдельному атрибуту. Этот метод можно использовать, если вы хотите сказать, что объект невалиден, независимо от значений его атрибутов. Поскольку `errors[:base]` массив, можете просто добавить строку к нему, и она будет использована как сообщение об ошибке.
```
class Person < ApplicationRecord
  def a_method_used_for_validation_purposes
    errors[:base] << "This person is invalid because ..."
  end
end
```
#### `errors.clear`
Метод `clear` используется, когда вы намеренно хотите очистить все сообщения в коллекции errors. Естественно, вызов `errors.clear` для невалидного объекта фактически не сделает его валидным: сейчас коллекция `errors` будет пуста, но в следующий раз, когда вы вызовете `valid?` или любой метод, который пытается сохранить этот объект в базу данных, валидации выполнятся снова. Если любая из валидаций провалится, коллекция errors будет заполнена снова.
```
class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
end

person = Person.new
person.valid? # => false
person.errors[:name]
 # => ["can't be blank", "is too short (minimum is 3 characters)"]

person.errors.clear
person.errors.empty? # => true

person.save # => false

person.errors[:name]
 # => ["can't be blank", "is too short (minimum is 3 characters)"]
```
#### `errors.size`
Метод `size` возвращает количество сообщений об ошибке для объекта.
```
class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
end

person = Person.new
person.valid? # => false
person.errors.size # => 2

person = Person.new(name: "Andrea", email: "andrea@example.com")
person.valid? # => true
person.errors.size # => 0
```
### Отображение ошибок валидации во вьюхах <a name="2.3.8"></a>
Как только вы создали модель и добавили валидации, если эта модель создается с помощью веб-формы, то вы, возможно хотите отображать сообщение об ошибке, когда одна из валидаций проваливается.

Поскольку каждое приложение обрабатывает подобные вещи по-разному, в Rails нет какого-то хелпера вьюхи для непосредственной генерации этих сообщений. Однако, благодаря богатому набору методов, Rails в целом дает способ взаимодействия с валидациями, очень просто создать свой собственный. Кроме того, при генерации скаффолда, Rails поместит некоторый ERB в `_form.html.erb`, генерируемый для отображения полного списка ошибок этой модели.

Допустим, у нас имеется модель, сохраненная в переменную экземпляра @article, это выглядит следующим образом:
```
<% if @article.errors.any? %>
  <div id="error_explanation">
    <h2><%= pluralize(@article.errors.count, "error") %> prohibited this article from being saved:</h2>
    <ul>
    <% @article.errors.full_messages.each do |msg| %>
      <li><%= msg %></li>
    <% end %>
    </ul>
  </div>
<% end %>
```
Более того, при использовании хелперов форм Rails для создания форм, когда у поля происходит ошибка валидации, генерируется дополнительный `<div>` вокруг содержимого.
```
<div class="field_with_errors">
 <input id="article_title" name="article[title]" size="30" type="text" value="">
</div>
```
Этот `div` можно стилизовать по желанию. К примеру, дефолтный скаффолд, который генерирует Rails, добавляет это правило CSS:
```
.field_with_errors {
  padding: 2px;
  background-color: red;
  display: table;
}
```
## Колбэки Active Record <a name="2.4"></a>
### Жизненный цикл объекта <a name="2.4.1"></a>
В результате обычных операций приложения на Rails, объекты могут быть созданы, обновлены и уничтожены. Active Record дает возможность вмешаться в этот жизненный цикл объекта, таким образом, вы можете контролировать свое приложение и его данные.

Валидации позволяют вам быть уверенными, что только валидные данные хранятся в вашей базе данных. Колбэки позволяют вам переключать логику до или после изменения состояния объекта.
### Обзор колбэков <a name="2.4.2"></a>
#### Регистрация колбэков 
Для того, чтобы использовать доступные колбэки, их нужно зарегистрировать. Можно реализовать колбэки как обычные методы, а затем использовать макро-методы класса для их регистрации в качестве колбэков.
```
class User < ApplicationRecord
  validates :login, :email, presence: true

  before_validation :ensure_login_has_a_value

  private
    def ensure_login_has_a_value
      if login.nil?
        self.login = email unless email.blank?
      end
    end
end
```
**Макро-методы** класса также могут получать блок. Их следует использовать, если код внутри блока такой короткий, что помещается в одну строчку.
```
class User < ApplicationRecord
  validates :login, :email, presence: true

  before_create do
    self.name = login.capitalize if name.blank?
  end
end
```
Колбэки также могут быть зарегистрированы на выполнение **при определенных событиях жизненного цикла**:
```
class User < ApplicationRecord
  before_validation :normalize_name, on: :create

  # :on также принимает массив
  after_validation :set_location, on: [ :create, :update ]

  private
    def normalize_name
      self.name = name.downcase.titleize
    end

    def set_location
      self.location = LocationService.query(self)
    end
end
```
Считается **хорошей практикой** объявлять методы колбэков как `private`. Если их оставить `public`, они могут быть вызваны извне модели и нарушить принципы инкапсуляции объекта.
### Доступные колбэки <a name="2.4.3"></a>
Вот список всех доступных колбэков Active Record, перечисленных в том порядке, в котором они вызываются в течение соответствующих операций:
#### Создание объекта
* `before_validation`
* `after_validation`
* `before_save`
* `around_save`
* `before_create`
* `around_create`
* `after_create`
* `after_save`
* `after_commit/after_rollback` 
#### Обновление объекта
* `before_validation`
* `after_validation`
* `before_save`
* `around_save`
* `before_update`
* `around_update`
* `after_update`
* `after_save`
* `after_commit/after_rollback` 
#### Уничтожение объекта
* `before_destroy`
* `around_destroy`
* `after_destroy`
* `after_commit/after_rollback` 
> `after_save` запускается и при создании, и при обновлении, но всегда после более специфичных колбэков `after_create` и `after_update`, независимо от порядка, в котором выполняются макро-вызовы.
> Колбэк `before_destroy` должен быть размещен перед связями `dependent: :destroy` (или использовать опцию `prepend: true`), чтобы убедиться, что они выполняются до того, как записи будут удалены с помощью `dependent: :destroy`.

#### `after_initialize` и `after_find`
**Колбэк `after_initialize`** вызывается всякий раз, когда возникает экземпляр объекта Active Record, или непосредственно при использовании new, или когда запись загружается из базы данных. Он может быть полезен, чтобы избежать необходимости напрямую переопределять метод Active Record `initialize`.
**Колбэк `after_find`** будет вызван всякий раз, когда Active Record загружает запись из базы данных. `after_find` вызывается перед `after_initialize`, если они оба определены.
У колбэков `after_initialize` и `after_find` **нет пары `before_*`**, но они могут быть зарегистрированы подобно другим колбэкам Active Record.
```
class User < ApplicationRecord
  after_initialize do |user|
    puts "You have initialized an object!"
  end

  after_find do |user|
    puts "You have found an object!"
  end
end

>> User.new
You have initialized an object!
=> #<User id: nil>

>> User.first
You have found an object!
You have initialized an object!
=> #<User id: 1>
```
#### `after_touch`
Колбэк `after_touch` будет вызван, когда на объекте Active Record вызван `touch`.
```
class User < ApplicationRecord
  after_touch do |user|
    puts "You have touched an object"
  end
end

>> u = User.create(name: 'Kuldeep')
=> #<User id: 1, name: "Kuldeep", created_at: "2013-11-25 12:17:49", updated_at: "2013-11-25 12:17:49">

>> u.touch
You have touched an object
=> true
```
Он может быть **использован совместно с `belongs_to`**:
```
class Employee < ApplicationRecord
  belongs_to :company, touch: true
  after_touch do
    puts 'An Employee was touched'
  end
end

class Company < ApplicationRecord
  has_many :employees
  after_touch :log_when_employees_or_company_touched

  private
  def log_when_employees_or_company_touched
    puts 'Employee/Company was touched'
  end
end

>> @employee = Employee.last
=> #<Employee id: 1, company_id: 1, created_at: "2013-11-25 17:04:22", updated_at: "2013-11-25 17:05:05">

# вызывает @employee.company.touch
>> @employee.touch
Employee/Company was touched
An Employee was touched
=> true
```
### Запуск колбэков <a name="2.4.4"></a>
Следующие методы запускают колбэки:
* `create`
* `create!`
* `destroy`
* `destroy!`
* `destroy_all`
* `save`
* `save!`
* `save(validate: false)`
* `toggle!`
* `touch`
* `update_attribute`
* `update`
* `update!`
* `valid?` 

Дополнительно, **колбэк `after_find` запускается** следующими поисковыми методами:
* `all`
* `first`
* `find`
* `find_by`
* `find_by_*`
* `find_by_*!`
* `find_by_sql`
* `last` 

Колбэк **`after_initialize` запускается** всякий раз, **когда инициализируется** новый объект класса.

> Методы `find_by_*` и `find_by_*!` это динамические методы поиска, генерируемые автоматически для каждого атрибута.
### Пропуск колбэков <a name="2.4.5"></a>

Подобно валидациям, также возможно пропустить колбэки, используя следующие методы.
* `decrement`
* `decrement_counter`
* `delete`
* `delete_all`
* `increment`
* `increment_counter`
* `toggle`
* `update_column`
* `update_columns`
* `update_all`
* `update_counters` 

Однако, эти методы нужно использовать осторожно, поскольку важные бизнес-правила и логика приложения могут содержаться в колбэках. Пропуск их без понимания возможных последствий может привести к невалидным данным.
### Прерывание выполнения <a name="2.4.6"></a>
Как только вы зарегистрировали новые колбэки в своих моделях, они будут поставлены в очередь на выполнение. Эта очередь включает все валидации вашей модели, зарегистрированные колбэки и операции с базой данных для выполнения.

Вся цепочка колбэков упаковывается в операцию. **Если любой колбэк вызывает исключение, выполняемая цепочка прерывается** и запускается `ROLLBACK`. Чтобы преднамеренно остановить цепочку, используйте:
```
throw :abort
```
> Вызов произвольного исключения может прервать код, который предполагает, что save и тому подобное не будут провалены подобным образом. Исключение `ActiveRecord::Rollback` чуть точнее сообщает Active Record, что происходит откат. Он подхватывается изнутри, но не перевызывает исключение.
> Любое исключение, кроме `ActiveRecord::Rollback` или `ActiveRecord::RecordInvalid`, будет перевызвано Rails после того, как прервется цепочка колбэков. Вызов исключения, отличного от `ActiveRecord::Rollback` или `ActiveRecord::RecordInvalid`, может сломать код, который не ожидает, что методы, такие как `save` и `update` (которые обычно пытаются вернуть `true` или `false`) вызовут исключение.
### Колбэки для отношений <a name="2.4.7"></a>
Колбэки работают с отношениями между моделями, и даже могут быть определены ими. Представим пример, где пользователь имеет много статей. Статьи пользователя должны быть уничтожены, если уничтожается пользователь. Давайте добавим колбэк `after_destroy` в модель `User` через ее отношения с моделью `Article`.
```
class User < ApplicationRecord
  has_many :articles, dependent: :destroy
end

class Article < ActiveRecord::Base
  after_destroy :log_destroy_action

  def log_destroy_action
    puts 'Article destroyed'
  end
end

>> user = User.first
=> #<User id: 1>
>> user.articles.create!
=> #<Article id: 1, user_id: 1>
>> user.destroy
Article destroyed
=> #<User id: 1>
```
### Условные колбэки <a name="2.4.8"></a>
#### Использование `:if` и `:unless` с `Symbol`
При использовании такой формы регистрации, также возможно зарегистрировать несколько различных предикатов, которые будут вызваны, чтобы проверить, должен ли выполняться колбэк.
```
class Order < ApplicationRecord
  before_save :normalize_card_number, if: :paid_with_card?
end
```
#### Использование `:if` и `:unless` с `Proc`
Этот вариант больше всего подходит при написании коротких методов, обычно однострочных.
```
class Order < ApplicationRecord
  before_save :normalize_card_number,
    if: Proc.new { |order| order.paid_with_card? }
end
```
#### Составные условия для колбэков
```
class Comment < ApplicationRecord
  after_create :send_email_to_author, if: :author_wants_emails?,
    unless: Proc.new { |comment| comment.article.ignore_comments? }
end
```
### Классы колбэков <a name="2.4.9"></a>
Вот пример, где создается класс с колбэком `after_destroy` для модели `PictureFile`:
```
class PictureFileCallbacks
  def after_destroy(picture_file)
    if File.exist?(picture_file.filepath)
      File.delete(picture_file.filepath)
    end
  end
end
```
При объявлении внутри класса, как выше, методы колбэка получают объект модели как параметр. Теперь можем использовать класс колбэка в модели:
```
class PictureFile < ApplicationRecord
  after_destroy PictureFileCallbacks.new
end
```
Заметьте, что нам нужно создать экземпляр нового объекта `PictureFileCallbacks`, после того, как объявили наш колбэк как отдельный метод. Это особенно полезно, если колбэки используют состояние экземпляра объекта. Часто, однако, более подходящим является объявление его в качестве метода класса.
```
class PictureFileCallbacks
  def self.after_destroy(picture_file)
    if File.exist?(picture_file.filepath)
      File.delete(picture_file.filepath)
    end
  end
end
```
Если метод колбэка объявляется таким образом, нет необходимости создавать экземпляр объекта `PictureFileCallbacks`.
```
class PictureFile < ApplicationRecord
  after_destroy PictureFileCallbacks
end
```
Внутри своего колбэк-класса можно создать сколько угодно колбэков.
### Транзакционные колбэки <a name="2.4.10"></a>
Имеются два дополнительных колбэка, которые включаются по завершению транзакции базы данных: `after_commit` и `after_rollback`. Эти колбэки очень похожи на колбэк `after_save`, за исключением того, что они не выполняются пока изменения в базе данных не будут подтверждены или обращены. Они наиболее полезны, когда вашим моделям Active Record необходимо взаимодействовать с внешними системами, не являющимися частью транзакции базы данных.

Рассмотрим, допустим, предыдущий пример, где модели `PictureFile` необходимо удалить файл после того, как запись уничтожена. Если что-либо вызовет исключение после того, как был вызван колбэк `after_destroy`, и транзакция откатывается, файл будет удален и модель останется в противоречивом состоянии. Например, предположим, что `picture_file_2` в следующем коде не валидна, и метод `save!` вызовет ошибку.
```
PictureFile.transaction do
  picture_file_1.destroy
  picture_file_2.save!
end
```
Используя колбэк `after_commit`, можно учесть этот случай.
```
class PictureFile < ApplicationRecord
  after_commit :delete_picture_file_from_disk, on: :destroy

  def delete_picture_file_from_disk
    if File.exist?(filepath)
      File.delete(filepath)
    end
  end
end
```
> Опция `:on` определяет, когда будет запущен колбэк. Если не предоставить опцию `:on`, колбэк будет запущен для каждого экшна.

Так как принято использовать колбэк `after_commit` только при создании, обновлении или удалении, есть псевдонимы для этих операций:
* `after_create_commit`
* `after_update_commit`
* `after_destroy_commit` 
```
class PictureFile < ApplicationRecord
  after_destroy_commit :delete_picture_file_from_disk

  def delete_picture_file_from_disk
    if File.exist?(filepath)
      File.delete(filepath)
    end
  end
end
```
> Колбэки `after_commit` и `after_rollback` вызываются для всех созданных, обновленных или удаленных моделей внутри блока транзакции. Однако, если какое-либо исключение вызовется в одном из этих колбэков, это исключение всплывет, и любые оставшиеся методы `after_commit` или `after_rollback` не будут выполнены. По сути, если код вашего колбэка может вызвать исключение, нужно для него вызвать `rescue`, и обработать его в колбэке, чтобы позволить запуститься другим колбэкам.

> При одновременном **использовании `after_create_commit` и `after_update_commit`** в одной и той же модели сработает только колбэк, **определенный последним**, переопределив все остальные.

```
class User < ApplicationRecord
  after_create_commit :log_user_saved_to_db
  after_update_commit :log_user_saved_to_db

  private
  def log_user_saved_to_db
    puts 'User was saved to database'
  end
end

# ничего не выводит
>> @user = User.create

# обновление @user
>> @user.save
=> User was saved to database
```
Чтобы зарегистрировать **колбэки как для create, так и для update** экшнов, используйте **`after_commit`**.
```
class User < ApplicationRecord
  after_commit :log_user_saved_to_db, on: [:create, :update]
end
```


## Связи (ассоциации) <a name="2.5"></a>


# Вьюхи <a name="3"></a>
# Контроллеры <a name="4"></a>
# Копаем глубже <a name="5"></a>
## Безопасность приложений Rails <a name="5.1"></a>
### Что такое сессии
Сессии позволяют приложению поддерживать пользовательское состояние, пока пользователи взаимодействуют с приложением. Например, сессии позволяют пользователю быть аутентифицированным единожды и оставаться таким во всех будущих запросах.
Если у пользователя уже есть активная сессия, Rails использует существующую сессию. В противном случае будет создана новая сессия.
### Угон сессии
Перехват куки в незащищенной сети. Беспроводная LAN может быть примером такой сети. В незашифрованной беспроводной LAN очень легко прослушивать трафик всех присоединенных клиентов. Для создателя веб-приложений это означает, что необходимо предоставить безопасное соединение через SSL. В Rails 3.1 и позже это может быть выполнено с помощью принуждения к соединению SSL в файле конфигурации приложения: 
`config.force_ssl = true`
### Хранение сессии 
Rails использует ActionDispatch::Session::CookieStore в качестве хранилища сессии по умолчанию.
`CookieStore` Rails сохраняет хэш сессии в куки на стороне клиента. Сервер получает хэш сессии из куки и устраняется необходимость в ID сессии.
`CookieStore` использует <a href="https://api.rubyonrails.org/classes/ActionDispatch/Cookies/ChainedCookieJars.html#method-i-encrypted">зашифрованные</a> куки, чтобы предоставить безопасное, зашифрованное место расположения для хранения данных сессии.
> Ключ шифрования, а также ключ верификации, используемый для подписанных куки, получены из конфигурационного значения secret_key_base.

Секретные ключи должны быть длинными и случайными. Используйте `rails secret` для получения новых уникальных секретных ключей.
Также важно использовать различные значения соли для зашифрованных и подписанных куки.

В test и development средах приложения получают `secret_key_base` из имени приложения. В других средах должен использоваться случайный ключ, присутствующий в `config/credentials.yml.enc`, показанный здесь в дешифрованном состоянии:
```
secret_key_base: 492f...
```
> Если секретные ключи вашего приложения могли быть скомпрометированы, настоятельно рекомендуется изменить секретный ключ. Изменение `secret_key_base` прекратит текущие активные сессии.
### Ротация зашифрованных и подписанных конфигураций куки
Ротация идеально подходит для изменения конфигураций куки и обеспечения того, что старые куки не сразу стали недействительны.

Например, чтобы изменить дайджест, используемый для подписанных куки с SHA1 на SHA256, необходимо сперва назначить новое конфигурационное значение:
```
Rails.application.config.action_dispatch.signed_cookie_digest = "SHA256"
```
Теперь добавьте ротацию для старого дайджеста SHA1, чтобы существующие куки были бесшовно апгрейднуты до нового дайджеста SHA256.
```
Rails.application.config.action_dispatch.cookies_rotations.tap do |cookies|
  cookies.rotate :signed, digest: "SHA1"
end
```
Для получения дополнительной информации о ротации ключа с зашифрованными и подписанными сообщениями, а также о различных опциях, которые принимает метод `rotate`, обратитесь, пожалуйста, к документации по <a href="https://api.rubyonrails.org/classes/ActiveSupport/MessageEncryptor.html">MessageEncryptor API</a> и <a href="https://api.rubyonrails.org/classes/ActiveSupport/MessageVerifier.html">MessageVerifier API</a>.
## Командная строка Rails <a name="5.11"></a>

# Расширяем Rails <a name="6"></a>
## Используем Rails для API приложений <a name="6.5"></a>
### Что такое API приложение
Вместо использования Rails для генерации HTML, взаимодействующего с сервером с помощью форм и ссылок, многие разработчики трактуют их веб-приложения как всего лишь клиент API, созданный из HTML с помощью JavaScript, обращающегося к JSON API.
### Зачем использовать Rails для JSON API?
Давайте посмотрим на некоторые вещи, которые Rails предоставляет из коробки и которые применимы к API-приложениям.

На уровне промежуточных программ:
* Перезагрузка: приложения Rails поддерживают прозрачную перезагрузку. Это работает, даже если ваше приложение становится большим и рестарт сервера для каждого запроса становится неприемлемым.
* Режим разработки: приложения Rails идут с разумными значениями по умолчанию для разработки, что делает разработку приятной без ущерба производительности для production.
* Тестовый режим: то же самое, что и для режима разработки.
* Логирование: приложения Rails логируют каждый запрос с уровнем детализации, приемлемым для текущего режима. Логи Rails в development включают информацию о среде запроса, запросах в базу данных и основную информацию о производительности.
* Безопасность: Rails обнаруживает и мешает исполнению IP-спуфинга, и безопасным способом обрабатывает криптографические сигнатуры в атаках по времени. Не знаете, что такое IP-спуфинг или атака по времени? Вот-вот!
* Парсинг параметров: Хотите устанавливать ваши параметры как JSON вместо URL-кодированной строки? Без проблем. Rails декодирует JSON и сделает его доступным в params. Хотите использовать вложенные URL-кодированные параметры? Это тоже работает.
* Условный GETs: Rails поддерживает условный GET (ETag и Last-Modified), обрабатывая заголовки запроса и возвращая правильный отклик и код статуса. Все, что нужно, это использовать проверку stale? в вашем контроллере, и Rails позаботится обо всех деталях HTTP.
* Запросы HEAD: Rails прозрачно конвертирует запросы HEAD в GET, и возвращает только заголовки тем же образом. Это позволяет HEAD надежно работать во всех API Rails.

Очевидно, что хотя вы и можете это создать сами в терминах существующих промежуточных программ Rack, этот список демонстрирует стек промежуточных программ Rails по умолчанию, представляющий большую ценность, даже если вы "просто генерируете JSON".

На уровне Action Pack:

* Ресурсный роутинг: Если вы создаете RESTful JSON API, вам захочется использовать роутер Rails. Чистое и общепринятое сопоставление от HTTP к контроллерам означает, что не нужно тратить время, думая, как смоделировать ваш API в терминах HTTP.
* Генерация URL: Обратной стороной роутинга является генерация URL. Хороший API, основанный на HTTP, включает URL (в качестве примера смотрите GitHub Gist API).
* Отклики с заголовками и редиректами: `head :no_content` и `redirect_to user_url(current_user)` очень удобны. Конечно, заголовки отклика можно добавить руками, но зачем?
* Кэширование: Rails предоставляет кэширование страниц, экшнов и фрагментов. Кэширование фрагментов особенно полезно при создании вложенных объектов JSON.
* __Базовая, дайджестная и токенная аутентификация__: Rails поставляется с поддержкой из коробки трех типов аутентификации HTTP.
* Инструментарий: в Rails имеется инструментальный API, запускающий зарегистрированные обработчики для множества событий, таких как обработка экшна, отсылка файла или данных, перенаправление и запросы к базе данных. Полезная нагрузка о каждом событии приходит с соответствующими параметрами (для события обработки экшна полезная нагрузка включает контроллер, экшн, параметры, формат запроса, метод запроса и полный путь запроса).
* Генераторы: Часто удобно сгенерировать ресурс и получить модель, контроллер, заготовки для тестов и роутов, созданные одной командой, для дальнейшей доработки. То же самое для миграций и остального.
* Плагины: Многие сторонние библиотеки поставляются с поддержкой Rails, что уменьшает или устраняет стоимость настройки и внедрения библиотеки во фреймворк. Это включает вещи, такие как переопределение генераторов по умолчанию, добавление задач Rake и принятие выбора в Rails (такого как логгер и кэширующий бэкенд). 
Конечно, процесс загрузки Rails также соединяет воедино все зарегистрированные компоненты. Например, процесс загрузки Rails это то, что использует файл `config/database.yml` при конфигурации Active Record.
> Краткая версия: можно не задумываться, какие части Rails все еще применимы, даже если вы уберете уровень представления, ответом будет - большая часть из них.
### Базовая конфигурация
#### Генерация приложения 
```
rails new my_api --api
```
Это сделает три основных вещи:
* Сконфигурирует приложение, чтобы оно запускало более ограниченный набор промежуточных программ, чем обычно. В частности, оно не включит по умолчанию какие-либо промежуточные программы, полезные для браузерных приложений (такие как поддержка куки).
* Унаследует ApplicationController от `ActionController::API` вместо `ActionController::Base`. Как и в случае с промежуточными программами, это выкинет все модули Action Controller, предоставляющие функциональность, в основном используемую браузерными приложениями.
* Сконфигурирует генераторы, чтобы они пропускали генерацию вьюх, хелперов и ассетов при генерации нового ресурса
#### Изменение существующего приложения
В `config/application.rb` добавьте следующую строчку в самый верх определения класса Application:
```
config.api_only = true
```
В `config/environments/development.rb` установите `config.debug_exception_response_format`, чтобы настроить формат, используемый в откликах, когда происходит ошибка в режиме development.

Чтобы отрендерить страницу HTML с отладочной информацией, используйте значение :default
```
config.debug_exception_response_format = :default
```
Чтобы отрендерить отладочную информацию, сохранив формат отклика, используйте значение :api
```
config.debug_exception_response_format = :api
```
По умолчанию `config.debug_exception_response_format` установлен :api, когда `config.api_only` установлен true.

Наконец, в `app/controllers/application_controller.rb` вместо:

```
class ApplicationController < ActionController::Base
end
```
сделайте:
```
class ApplicationController < ActionController::API
end
```
### Выбор промежуточных программ
API-приложение поставляется со следующими промежуточными программами по умолчанию:
* `Rack::Sendfile`
* `ActionDispatch::Static`
* `ActionDispatch::Executor`
* `ActiveSupport::Cache::Strategy::LocalCache::Middleware`
* `Rack::Runtime`
* `ActionDispatch::RequestId`
* `ActionDispatch::RemoteIp`
* `Rails::Rack::Logger`
* `ActionDispatch::ShowExceptions`
* `ActionDispatch::DebugExceptions`
* `ActionDispatch::Reloader`
* `ActionDispatch::Callbacks`
* `ActiveRecord::Migration::CheckPending`
* `Rack::Head`
* `Rack::ConditionalGet`
* `Rack::ETag`

Другие плагины, включая Active Record, могут добавлять дополнительные промежуточные программы. В основном, эти промежуточные программы безразличны к типу создаваемого приложения, и имеют смысл в API-приложении Rails.

Можно получить список всех промежуточных программ вашего приложения с помощью:
```
rails middleware
```
#### Использование кэширующей промежуточной программы

По умолчанию Rails добавит промежуточную программу, предоставляющую хранилище кэша, основанного на конфигурации вашего приложения (по умолчанию memcache). Это означает, что встроенный кэш HTTP будет полагаться на нее.

Например, используя метод `stale?`:
```
def show
  @post = Post.find(params[:id])

  if stale?(last_modified: @post.updated_at)
    render json: @post
  end
end
```
Вызов `stale?` сравнит заголовок `If-Modified-Since` в запросе с `@post.updated_at`. Если заголовок новее, чем время последнего модифицирования, этот экшн вернет отклик "304 Not Modified". В противном случае, он отрендерит отклик и включит в него заголовок `Last-Modified`.

Обычно этот механизм используется отдельно для каждого клиента. Кэширующая промежуточная программа позволяет распределять этот кэширующий механизм между клиентами. Можно включить межклиентское кэширование в вызове `stale?`:
```
def show
  @post = Post.find(params[:id])

  if stale?(last_modified: @post.updated_at, public: true)
    render json: @post
  end
end
```
Это означает, что кэширующая промежуточная программа сохранит значение `Last-Modified` для URL в кэше Rails, и добавит заголовок `If-Modified-Since` в любой последующий входящий запрос к этому URL.

Воспринимайте это как кэширование страниц в семантике HTTP.
#### Использование Rack::Sendfile
При использовании метода `send_file` в контроллере Rails, он устанавливает заголовок `X-Sendfile`. `Rack::Sendfile` ответственен за фактическую отсылку файла.

Если ваш фронтенд сервер поддерживает ускоренную отсылку файла, `Rack::Sendfile` переложит работу по фактической отсылке файла на фронтенд сервер.
Можно настроить имя заголовка, которое использует ваш фронтенд сервер для этой цели, с помощью `config.action_dispatch.x_sendfile_header` в соответствующем среде конфигурационном файле.
<a href="https://rubydoc.info/github/rack/rack/master/Rack/Sendfile">Подробнее о send_file</a>
Вот несколько значений этого заголовка для некоторых популярных серверов, которые, как только эти серверы будут настроены, добавят поддержку для ускоренной отсылки файла:
```
# Apache и lighttpd
config.action_dispatch.x_sendfile_header = "X-Sendfile"

# Nginx
config.action_dispatch.x_sendfile_header = "X-Accel-Redirect"
```
Убедитесь, что сконфигурировали на своем сервере поддержку этих опций в соответствии с инструкциями в документации `Rack::Sendfile`
#### Использование ActionDispatch::Request
`ActionDispatch::Request#params` примет параметры от клиента в формате JSON и сделает их доступными в контроллере внутри `params`.

Для его использования клиенту нужно сделать запрос с кодированными в JSON параметрами и указать `Content-Type` как `application/json`.

Вот пример на jQuery:
```
jQuery.ajax({
  type: 'POST',
  url: '/people',
  dataType: 'json',
  contentType: 'application/json',
  data: JSON.stringify({ person: { firstName: "Yehuda", lastName: "Katz" } }),
  success: function(json) { }
});
```
ActionDispatch::Request увидит Content-Type и вашими параметрами будут:
```
{ :person => { :firstName => "Yehuda", :lastName => "Katz" } }
```
####  Другие промежуточные программы
Rails поставляется с рядом других промежуточных программ, которые вы, возможно, захотите использовать в API-приложении, особенно если одним из клиентов вашего API является браузер:
* `Rack::MethodOverride`
* `ActionDispatch::Cookies`
* `ActionDispatch::Flash`
Для управления сессией:
* `ActionDispatch::Session::CacheStore`
* `ActionDispatch::Session::CookieStore`
* `ActionDispatch::Session::MemCacheStore`

Любые из этих промежуточных программ могут быть добавлены с помощью:
```
config.middleware.use Rack::MethodOverride
```
#### Удаление промежуточных программ
Если вы не хотите использовать промежуточную программу, которая включена по умолчанию в набор промежуточных программ для API, ее можно убрать с помощью:
```
config.middleware.delete ::Rack::Sendfile
```
Учтите, что удаление этих промежуточных программ удалит поддержку для определенных особенностей в Action Controller.
### Выбор модулей контроллера
API-приложение (использующее `ActionController::API`) по умолчанию поставляется со следующими модулями:
* `ActionController::UrlFor`: Делает доступными url_for и подобные хелперы.
* `ActionController::Redirecting`: Поддержка для redirect_to.
* `AbstractController::Rendering` и `ActionController::ApiRendering`: Базовая поддержка для рендеринга.
* `ActionController::Renderers::All`: Поддержка для `render :json` и сотоварищей.
* `ActionController::ConditionalGet`: Поддержка для `stale?`.
* `ActionController::BasicImplicitRender`: Убеждается, что возвращен пустой отклик, если нет явного.
* `ActionController::StrongParameters`: Поддержка для фильтрации параметров в сочетании с массовым назначением Active Model.
* `ActionController::DataStreaming`: Поддержка для `send_file` и `send_data`.
* `AbstractController::Callbacks`: Поддержка для `before_action` и подобных хелперов.
* `ActionController::Rescue: Поддержка для rescue_from.
* `ActionController::Instrumentation`: Поддержка для инструментальных хуков, определенных Action Controller (подробности относительно этого смотрите в руководстве Инструментарий Active Support).
* `ActionController::ParamsWrapper`: Оборачивает хэш параметров во вложенный хэш, таким образом, к примеру, не нужно указывать корневые элементы при посылка запросов POST.
* `ActionController::Head`: Поддержка возврата отклика без тела сообщения, только заголовки 
Другие плагины могут добавлять дополнительные модули. Список всех модулей, включенных в `ActionController::API` можно получить в консоли rails:
```
$ rails c
>> ActionController::API.ancestors - ActionController::Metal.ancestors
=> [ActionController::API,
    ActiveRecord::Railties::ControllerRuntime,
    ActionDispatch::Routing::RouteSet::MountedHelpers,
    ActionController::ParamsWrapper,
    ... ,
    AbstractController::Rendering,
    ActionView::ViewPaths]
```
#### Добавление других модулей
Все модули Action Controller знают о зависимых модулях, поэтому можно свободно включать любые модули в контроллеры, и будут включены и настроены все зависимости.

Некоторые распространенные модули, которые вы, возможно, захотите добавить:
* `AbstractController::Translation`: Поддержка для методов локализации l и перевода t.
* Поддержка для базовой, дайджестной или токенной аутентификации HTTP:
  1. `ActionController::HttpAuthentication::Basic::ControllerMethods` <a href="https://apidock.com/rails/v3.2.1/ActionController/HttpAuthentication/Basic">подробнее</a>,
  2. `ActionController::HttpAuthentication::Digest::ControllerMethods`,
  3. `ActionController::HttpAuthentication::Token::ControllerMethods` <a href="https://apidock.com/rails/v6.0.0/ActionController/HttpAuthentication/Token">Подробнее</a>
* `ActionView::Layouts`: Поддержка для макетов при рендеринге.
* `ActionController::MimeResponds`: Поддержка для respond_to.
* `ActionController::Cookies`: Поддержка для cookies, что включает поддержку для подписанных и зашифрованных куки. Он требует промежуточную программу для куки.
* `ActionController::Caching:` Поддержка кэширования вьюх для контроллера API. Отметьте, что нужно вручную указать хранилище кэша внутри контроллера подобно следующему: `ruby class ApplicationController < ActionController::API include ::ActionController::Caching self.cache_store = :mem_cache_store end` Rails не передает эту конфигурацию автоматически. 

Лучшим местом для добавления модулей является `ApplicationController`, но вы также можете добавить модули в отдельные контроллеры.

# Вносим вклад <a name="7"></a>

# Дополнительно <a name="8"></a>
## Все подряд
### task_desire_api
Модели:
```
rails g model User login:string:uniq password_digest name sign
rails g model Article head:string announcement:string content:text status:boolean user:references
```
Контроллеры:
```
rails g controller Articles create update destroy
```
### Задачи Rake
* `rake db:create` - Cоздать баду данных
* `rake db:drop` - Удалить базу данных
* `rake db:migrate` - Запустить миграцию базы
* `rake db:rollback` - Откатить миграцию данных к предыдущему состоянию
* `rake db:schema:dump` - Построение файла schema.rb на основе текущей структуры базы данных
* `rake db:schema:load` - Восстановление структуры базы данных из schema.rb
* `rake db:seed` - Запускает скрипт db/seed.rb который по идее должен заполнить базу первоначальными данными
* `rake db:setup` - Запустит поочереди create, schema:load, seed
* `rake db:structure:dump` - Сделает дамп структуры в db/structue.sql
* `rake db:structure:load` - Восстановит базу из db/structue.sql

