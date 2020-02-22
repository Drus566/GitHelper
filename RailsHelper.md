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
* * 2.1.1 []
* 2.2 [Миграции Active Record](#2.2)
* * 2.2.1 asd
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
### Что такое Active record
Active Record это M в MVC - модель - которая является слоем в системе, ответственным за представление бизнес-логики и данных. Active Record упрощает создание и использование бизнес-объектов, данные которых требуют персистентного хранения в базе данных. Сама по себе эта реализация паттерна Active Record является описанием системы ORM (Object Relational Mapping).

Active Record был описан Martin Fowler в его книге Patterns of Enterprise Application Architecture. В Active Record объекты содержат и персистентные данные, и поведение, которое работает с этими данными. Active Record исходит из мнения, что обеспечение логики доступа к данным как части объекта покажет пользователям этого объекта то, как читать и писать в базу данных

Object Relational Mapping (объектно-реляционное отображение), обычно упоминающееся как аббревиатура ORM, это техника, соединяющая сложные объекты приложения с таблицами в системе управления реляционными базами данных.

Active Record предоставляет нам несколько механизмов, наиболее важными из которых являются способности для:
* Представления моделей и их данных.
* Представления связей между этими моделями.
* Представления иерархий наследования с помощью связанных моделей.
* Валидации моделей до того, как они станут персистентными в базе данных.
* Выполнения операций с базой данных в объектно-ориентированном стиле. 
### Соглашения над конфигурацией
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

### Создание моделей Active Record
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
### Переопределение соглашений об именовании
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
### CRUD: Чтение и запись данных
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
### Валидации
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
### Колбэки
Колбэки Active Record разрешают присоединить код к определенным событиям в жизненном цикле ваших моделей. Это позволяет добавить поведение модели, прозрачно выполнив код, когда эти события произойдут, например, когда вы создадите новую запись, обновите его, удалите его и так далее. Подробнее о колбэках можно прочитать в руководстве <a href="http://rusrails.ru/active-record-callbacks">Колбэки Active Record</a>.
### Миграции
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
### Обзор миграций
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
### Создание миграции
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
### Написание миграции
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
### Запуск миграций

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

