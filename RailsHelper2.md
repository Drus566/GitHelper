# Содержание

5. [Копаем глубже](#5)
* 5.5 [Основы Action Mailbox](#5.5)
* * 5.5.1 [Что такое Action Mailbox?](#5.5.1)
* * 5.5.2 [Настройка](#5.5.2)
* * 5.5.3 [Создание задания](#5.5.3)
* * 5.5.4 [Выполнение заданий](#5.5.4)
* * 5.5.5 [Очереди](#5.5.5)
* * 5.5.6 [Колбэки](#5.5.6)
* * 5.5.7 [Action Mailer](#5.5.7)
* * 5.5.8 [Интернационализация](#5.5.8)
* * 5.5.9 [Поддерживаемые типы аргументов](#5.5.9)
* * 5.5.10 [Исключения](#5.5.10)
* * 5.5.10 [Тестирование заданий](#5.5.11)
* 5.6 [Основы Active Job](#5.6)
* * 5.6.1 [Что такое Active Job?](#5.6.1)
* * 5.6.2 [Назначение Active Job](#5.6.2)
* * 5.6.3 [Создание задания](#5.6.3)
* * 5.6.4 [Выполнение заданий](#5.6.4)
* * 5.6.5 [Очереди](#5.6.5)
* * 5.6.6 [Колбэки](#5.6.6)
* * 5.6.7 [Action Mailer](#5.6.7)
* * 5.6.8 [Интернационализация](#5.6.8)
* * 5.6.9 [Поддерживаемые типы аргументов](#5.6.9)
* * 5.6.10 [Исключения](#5.6.10)
* * 5.6.11 [Тестирование заданий](#5.6.11)
* 5.7 [Обзор Active Storage](#5.7.1)
* * 5.7.1 [Что такое Active Storage?](#5.7.1)
* * 5.7.2 [Установка](#5.7.2)
* * 5.7.3 [Прикрепление файлов к записям](#5.7.3)
* * 5.7.4 [Удаление прикрепленных файлов](#5.7.4)
* * 5.7.5 [Создание ссылок на файлы](#5.7.5)
* * 5.7.6 [Скачивание файлов](#5.7.6)
* * 5.7.7 [Преобразование изображений](#5.7.7)
* * 5.7.8 [Предварительный просмотр файлов](#5.7.8)
* * 5.7.9 [Прямые загрузки](#5.7.9)
* * 5.7.10 [Очистка файлов сохраненных во время системных тестов](#5.7.10)
* * 5.7.11 [Отбрасывание (удаление) файлов, сохраненных во время интеграционных тестов](#5.7.11)
* * 5.7.12 [Реализация поддержки других облачных сервисов](#5.7.12)


# Копаем глубже <a name="5"></a>
## Основы Action Mailbox <a name="5.5"></a>
Это руководство предоставляет вам все, что нужно для того, чтобы начать получать письма в вашем приложении.

### Что такое Action Mailbox? <a name="5.5.1"></a>
Action Mailbox маршрутизирует входящие письма в подобные контроллеру ящики для обработки в Rails. Он поставляется с ингрессом для Mailgun, Mandrill, Postmark и SendGrid. Также можно обрабатывать входящие письма напрямую, с помощью встроенных ингрессов Exim, Postfix и Qmail.

Входящие письма преобразуются в записи `InboundEmail` с помощью Active Record и отслеживания жизненного цикла, оригинальные письма хранятся в облачном хранилище с помощью Active Storage, и данные обрабатываются с последующим их уничтожением по умолчанию.

Эти входящие письма асинхронно маршрутизируются с помощью Active Job на один или несколько выделенных ящиков, которые способны непосредственно взаимодействовать с остальной частью вашей доменной модели.

### Настройка <a name="5.5.2"></a>
Установите миграции, необходимые для `InboundEmail`, и убедитесь, что Active Storage настроен:
```
$ bin/rails action_mailbox:install
$ bin/rails db:migrate
```

#### Exim

Сообщите Action Mailbox принимать письма от релея SMTP:
```
# config/environments/production.rb
config.action_mailbox.ingress = :relay
```
Сгенерируйте сложный пароль, который Action Mailbox может использовать для аутентификации запросов к ингрессу релея.

Используйте `bin/rails credentials:edit` чтобы добавить пароль в зашифрованные учетные данные вашего приложения под именем `action_mailbox.ingress_password`, по которому Action Mailbox автоматически найдет его:
```
action_mailbox:
  ingress_password: ...
```
Альтернативно можно предоставить пароль в переменной среды `RAILS_INBOUND_EMAIL_PASSWORD`.

Настройте Exim передавать входящие письма в `bin/rails action_mailbox:ingress:exim`, предоставив URL ингресса релея и `INGRESS_PASSWORD`, созданный ранее. Если ваше приложение находится по адресу `https://example.com`, полная команда будет выглядеть так:
```
bin/rails action_mailbox:ingress:exim URL=https://example.com/rails/action_mailbox/relay/inbound_emails INGRESS_PASSWORD=...
```

#### Mailgun

Передайте Action Mailbox ваш ключ Mailgun API, таким образом он сможет аутентифицировать запросы к ингрессу Mailgun.

Используйте `bin/rails credentials:edit`, чтобы добавить ключ API в зашифрованные учетные данные вашего приложения под именем `action_mailbox.mailgun_api_key`, по которому Action Mailbox автоматически найдет его:
```
action_mailbox:
  mailgun_api_key: ...
```
Альтернативно можно предоставить ключ API в переменной среды `MAILGUN_INGRESS_API_KEY`.

Сообщите Action Mailbox принимать письма от Mailgun:
```
# config/environments/production.rb
config.action_mailbox.ingress = :mailgun
```
Настройте Mailgun перенаправлять входящие письма в `/rails/action_mailbox/mailgun/inbound_emails/mime`. Если ваше приложение находится по адресу `https://example.com`, нужно указать полный URL `https://example.com/rails/action_mailbox/mailgun/inbound_emails/mime`.


#### Mandrill

Передайте Action Mailbox ваш ключ Mandrill API, таким образом он сможет аутентифицировать запросы к ингрессу Mandrill.

Используйте `bin/rails credentials:edit` чтобы добавить ключ API в зашифрованные учетные данные вашего приложения под именем `action_mailbox.mandrill_api_key`, по которому Action Mailbox автоматически найдет его:
```
action_mailbox:
  mandrill_api_key: ...
```
Альтернативно можно предоставить ключ API в переменной среды `MANDRILL_INGRESS_API_KEY`.

Сообщите Action Mailbox принимать письма от Mandrill:
```
# config/environments/production.rb
config.action_mailbox.ingress = :mandrill
```
Настройте Mandrill перенаправлять входящие письма в `/rails/action_mailbox/mandrill/inbound_emails`. Если ваше приложение находится по адресу `https://example.com`, нужно указать полный URL `https://example.com/rails/action_mailbox/mandrill/inbound_emails`.

#### Postfix

Сообщите Action Mailbox принимать письма от релея SMTP:
```
# config/environments/production.rb
config.action_mailbox.ingress = :relay
```
Сгенерируйте сложный пароль, который Action Mailbox может использовать для аутентификации запросов к ингрессу релея.

Используйте `bin/rails credentials:edit` чтобы добавить пароль в зашифрованные учетные данные вашего приложения под именем `action_mailbox.ingress_password`, по которому Action Mailbox автоматически найдет его:
```
action_mailbox:
  ingress_password: ...
```
Альтернативно можно предоставить пароль в переменной среды `RAILS_INBOUND_EMAIL_PASSWORD`.

Настройте Postfix передавать входящие письма в `bin/rails action_mailbox:ingress:postfix`, предоставив URL ингресса релея и `INGRESS_PASSWORD`, созданный ранее. Если ваше приложение находится по адресу `https://example.com`, полная команда будет выглядеть так:
```
$ bin/rails action_mailbox:ingress:postfix URL=https://example.com/rails/action_mailbox/relay/inbound_emails INGRESS_PASSWORD=...
```

#### Postmark

Сообщите Action Mailbox принимать письма от Postmark:
```
# config/environments/production.rb
config.action_mailbox.ingress = :postmark
```
Сгенерируйте сложный пароль, который Action Mailbox может использовать для аутентификации запросов к ингрессу Postmark.

Используйте `bin/rails credentials:edit` чтобы добавить пароль в зашифрованные учетные данные вашего приложения под именем `action_mailbox.ingress_password`, по которому Action Mailbox автоматически найдет его:
```
action_mailbox:
  ingress_password: ...
```
Альтернативно можно предоставить пароль в переменной среды `RAILS_INBOUND_EMAIL_PASSWORD`.

Настройте веб-хук входящих Postmark, чтобы перенаправлять входящие письма в `/rails/action_mailbox/postmark/inbound_emails` с именем пользователя actionmailbox и созданным ранее паролем. Если ваше приложение находится по адресу `https://example.com`, нужно указать в настройках Postmark следующий полный URL:
```
https://actionmailbox:PASSWORD@example.com/rails/action_mailbox/postmark/inbound_emails
```
> При настройке веб-хука входящих Postmark, убедитесь, что вы включили "Include raw email content in JSON payload". Action Mailbox нужно исходное содержимое email для работы.

#### Qmail

Сообщите Action Mailbox принимать письма от релея SMTP:
```
# config/environments/production.rb
config.action_mailbox.ingress = :relay
```
Сгенерируйте сложный пароль, который Action Mailbox может использовать для аутентификации запросов к ингрессу релея.

Используйте `bin/rails credentials:edit` чтобы добавить пароль в зашифрованные учетные данные вашего приложения под именем `action_mailbox.ingress_password`, по которому Action Mailbox автоматически найдет его:
```
action_mailbox:
  ingress_password: ...
```
Альтернативно можно предоставить пароль в переменной среды `RAILS_INBOUND_EMAIL_PASSWORD`.

Настройте `Qmail` передавать входящие письма в `bin/rails action_mailbox:ingress:qmail`, предоставив URL ингресса релея и `INGRESS_PASSWORD`, созданный ранее. Если ваше приложение находится по адресу `https://example.com`, полная команда будет выглядеть так:
```
bin/rails action_mailbox:ingress:qmail URL=https://example.com/rails/action_mailbox/relay/inbound_emails INGRESS_PASSWORD=...
```

#### SendGrid

Сообщите Action Mailbox принимать письма от SendGrid:
```
# config/environments/production.rb
config.action_mailbox.ingress = :sendgrid
```
Сгенерируйте сложный пароль, который Action Mailbox может использовать для аутентификации запросов к ингрессу SendGrid.

Используйте `bin/rails credentials:edit` чтобы добавить пароль в зашифрованные учетные данные вашего приложения под именем `action_mailbox.ingress_password`, по которому Action Mailbox автоматически найдет его:
```
action_mailbox:
  ingress_password: ...
```
Альтернативно можно предоставить пароль в переменной среды `RAILS_INBOUND_EMAIL_PASSWORD`.

Настройте SendGrid Inbound Parse передавать входящие письма в `/rails/action_mailbox/sendgrid/inbound_emails` с именем пользователя `actionmailbox` и ранее созданным паролем. Если ваше приложение находится по адресу `https://example.com`, нужно настроить SendGrid следующим URL:
```
https://actionmailbox:PASSWORD@example.com/rails/action_mailbox/sendgrid/inbound_emails
```
> При настройке веб хука SendGrid Inbound Parse, убедитесь, что включили флажок с надписью “Post the raw, full MIME message.” Action Mailbox для работы требует исходное сообщение MIME.

### Примеры <a name="5.5.4"></a>

Настройте простой роутинг:
```
# app/mailboxes/application_mailbox.rb
class ApplicationMailbox < ActionMailbox::Base
  routing /^save@/i     => :forwards
  routing /@replies\./i => :replies
end
```
Затем настройте почтовый ящик:
```
# Создайте новый почтовый ящик
$ bin/rails generate mailbox forwards
```
```
# app/mailboxes/forwards_mailbox.rb
class ForwardsMailbox < ApplicationMailbox
  # Колбэки, указывающие предусловия обработки
  before_processing :require_projects

  def process
    # Запишите перенаправление на единственный проект, или…
    if forwarder.projects.one?
      record_forward
    else
      # …вовлеките второй Action Mailer, чтобы спросить, в какой проект это нужно направить.
      request_forwarding_project
    end
  end

  private
    def require_projects
      if forwarder.projects.none?
        # Мспользуйте Action Mailers для возврата входящих писем отправителю – это прервет обработку
        bounce_with Forwards::BounceMailer.no_projects(inbound_email, forwarder: forwarder)
      end
    end

    def record_forward
      forwarder.forwards.create subject: mail.subject, content: mail.content
    end

    def request_forwarding_project
      Forwards::RoutingMailer.choose_project(inbound_email, forwarder: forwarder).deliver_now
    end

    def forwarder
      @forwarder ||= User.find_by(email_address: mail.from)
    end
end
```
### Уничтожение InboundEmails <a name="5.5.5"></a>

По умолчанию InboundEmail, которое было успешно обработано, будет уничтожено через 30 дней. Это удостоверяет, что вы не храните данные людей вынужденно, после того, как они могли закрыть свой аккаунт или удалить свое содержимое. Цель в том, что после обработки письма, вы должны извлечь все нужные данные и преобразовать их в модели домена и содержимое на вашей стороне в приложении. InboundEmail просто остается в системе на некоторое время для предоставления возможности отладки и криминалистики.

Фактическое уничтожение выполняется с помощью `IncinerationJob`, которая запланирована на запуск через `config.action_mailbox.incinerate_after`. Это значение по умолчанию установлено `30.days`, но его можно изменить в настройках production.rb. (Отметьте, что это планируемое будущее уничтожение полагается на возможность вашей очереди задач хранить задачи на такой промежуток времени.)

### Работа с Action Mailbox при разработке <a name="5.5.6"></a>

Полезно иметь возможность тестирования входящих писем при разработке без фактического отправления и получения реальных писем. Для этого есть вспомогательный контроллер, смонтированный на `/rails/conductor/action_mailbox/inbound_emails`, дающий перечень всех InboundEmail в системе, состояние их обработки, а также форму для создания нового InboundEmail.

### Тестирование почтовых ящиков <a name="5.5.7"></a>

Пример:
```
class ForwardsMailboxTest < ActionMailbox::TestCase
  test "directly recording a client forward for a forwarder and forwardee corresponding to one project" do
    assert_difference -> { people(:david).buckets.first.recordings.count } do
      receive_inbound_email_from_mail \
        to: 'save@example.com',
        from: people(:david).email_address,
        subject: "Fwd: Status update?",
        body: <<~BODY
          --- Begin forwarded message ---
          From: Frank Holland <frank@microsoft.com>

          What's the status?
        BODY
    end

    recording = people(:david).buckets.first.recordings.last
    assert_equal people(:david), recording.creator
    assert_equal "Status update?", recording.forward.subject
    assert_match "What's the status?", recording.forward.content.to_s
  end
end
```


## Основы Active Job <a name="5.6"></a>
Это руководство даст вам все, что нужно, чтобы начать создавать, ставить в очередь и выполнять фоновые задания.

### Что такое Active Job? <a name="5.6.1"></a>
Active Job - это фреймворк для объявления заданий и их запуска на разных бэкендах для очередей. Эти задания могут быть чем угодно, от регулярно запланированных чисток до списаний с карт или рассылок. В общем, всем, что может быть выделено в небольшие работающие части и запускаться параллельно.

### Назначение Active Job <a name="5.6.2"></a>

Главным является то, что он обеспечивает, что у всех приложений на Rails имеется встроенная инфраструктура для заданий. Затем у нас могут появиться особенности фреймворка или других гемов, созданных на его основе, позволяющие не заботится об отличиях в API между различными исполнителями заданий, такими как Delayed Job и Resque. Подбор бэкенда для очередей станет более оперативной работой. Вы сможете переключаться между ними без необходимости переписывать свои задания.

> По умолчанию, Rails поставляется с асинхронной реализацией очереди, запускающей задания с помощью пула тредов внутри процесса. Задания будут запущены асинхронно, но любые задания в очереди будут потеряны при перезагрузке.

### Создание задания <a name="5.6.3"></a>
#### Создание задания
Active Job предоставляет генератор Rails для создания заданий. Следующая команда создаст задание в `app/jobs` (а также тестовый случай в `test/jobs`):
```
$ bin/rails generate job guests_cleanup
invoke  test_unit
create    test/jobs/guests_cleanup_job_test.rb
create  app/jobs/guests_cleanup_job.rb
```
Также можно создать задание, которое будет запущено в определенной очереди:
```
$ bin/rails generate job guests_cleanup --queue urgent
```
Если не хотите использовать генератор, можно создать файл очереди в `app/jobs`, просто убедитесь, что он наследуется от `ApplicationJob`.

Вот как выглядит задание:
```
class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(*guests)
    # Сделать что-нибудь позже
  end
end
```
Отметьте, что можно определить perform с любым количеством аргументов.

#### Помещение задания в очередь

Поместить задание в очередь можно так:
```
# Помещенное в очередь задание выполнится, как только освободится система очередей.
GuestsCleanupJob.perform_later guest
```
```
# Помещенное в очередь задание выполнится завтра в полдень.
GuestsCleanupJob.set(wait_until: Date.tomorrow.noon).perform_later(guest)
```
```
# Помещенное в очередь задание выполнится через неделю.
GuestsCleanupJob.set(wait: 1.week).perform_later(guest)
```
```
# `perform_now` и `perform_later` вызывают `perform`, поэтому
# можно передать столько аргументов, сколько определено в последнем.
GuestsCleanupJob.perform_later(guest1, guest2, filter: 'some_filter')
```
Вот и все!

### Выполнение заданий <a name="5.6.4"></a>

Чтобы поместить задание в очередь и выполнить его в production, необходимо настроить бэкенд для очереди, т.е. нужно решить, какую стороннюю библиотеку для очереди Rails будет использовать. Rails предоставляет только внутрипроцессную систему очереди, хранящую задания в памяти. Если процесс упадет, или машина будет перезагружена, тогда в асинхронном бэкенде по умолчанию все оставшиеся задания будут потеряны. Это может быть нормальным для маленьких приложений или некритичных заданий, но для большей части серьезных приложений нужно подобрать персистентный бэкенд.

#### Бэкенды

У Active Job есть встроенные адаптеры для различных бэкендов очередей (Sidekiq, Resque, Delayed Job и другие). Чтобы получить актуальный список адаптеров, обратитесь к документации API по ActiveJob::QueueAdapters.

#### Настройка бэкенда

Настроить бэкенд — это просто:
```
# config/application.rb
module YourApp
  class Application < Rails::Application
    # Убедитесь, что гем адаптера добавлен в Gemfile, и что выполнены
    # инструкции по установке и развертыванию адаптера.
    config.active_job.queue_adapter = :sidekiq
  end
end
```
Также можно настроить бэкенд для отдельного задания.
```
class GuestsCleanupJob < ApplicationJob
  self.queue_adapter = :resque
  #....
end

# Теперь ваше задание будет использовать `resque` в качестве адаптера бэкенда очереди,
# переопределяя тот, что был настроен в `config.active_job.queue_adapter`.
```

#### Запуск бэкенда

Поскольку задания запускаются параллельно с вашим Rails приложением, большинство библиотек для работы с очередями требуют запуска специфичного для библиотеки сервиса очередей (помимо старта Rails приложения) для обработки заданий. Обратитесь к документации по библиотеке за инструкциями по запуску бэкенда очереди.

Вот неполный список документации:
* Sidekiq
* Resque
* Sneakers
* Sucker Punch
* Queue Classic
* Delayed Job
* Que 


### Очереди <a name="5.6.5"></a>

Большая часть адаптеров поддерживает несколько очередей. С помощью Active Job можно запланировать, что задание будет выполнено в определенной очереди:
```
class GuestsCleanupJob < ApplicationJob
  queue_as :low_priority
  #....
end
```
Можно задать префикс для имени очереди для всех заданий с помощью `config.active_job.queue_name_prefix` в `application.rb`:
```
# config/application.rb
module YourApp
  class Application < Rails::Application
    config.active_job.queue_name_prefix = Rails.env
  end
end

# app/jobs/guests_cleanup_job.rb
class GuestsCleanupJob < ApplicationJob
  queue_as :low_priority
  #....
end

# Теперь ваше задание запустится в очереди production_low_priority в среде
# production и в staging_low_priority в среде staging
```
Также можно настроить префикс на уровне задания.
```
class GuestsCleanupJob < ApplicationJob
  queue_as :low_priority
  self.queue_name_prefix = nil
  #....
end

# Теперь очередь задания не будет иметь префикс, переопределяя то,
# что было настроено в `config.active_job.queue_name_prefix`.
```
Разделитель префикса имени очереди по умолчанию `'_'`. Его можно изменить, установив `config.active_job.queue_name_delimiter` в `application.rb`:
```
# config/application.rb
module YourApp
  class Application < Rails::Application
    config.active_job.queue_name_prefix = Rails.env
    config.active_job.queue_name_delimiter = '.'
  end
end

# app/jobs/guests_cleanup_job.rb
class GuestsCleanupJob < ApplicationJob
  queue_as :low_priority
  #....
end

# Теперь ваше задание запустится в очереди production.low_priority в среде
# production и в staging.low_priority в среде staging
```
Если хотите больше контроля, в какой очереди задание будет запущено, можно передать опцию `:queue` в `#set`:
```
MyJob.set(queue: :another_queue).perform_later(record)
```
Чтобы контролировать очередь на уровне задания, можно передать блок в `#queue_as`. Блок будет выполнен в контексте задания (таким образом, у вас будет доступ к `self.arguments`), и он должен вернуть имя очереди:
```
class ProcessVideoJob < ApplicationJob
  queue_as do
    video = self.arguments.first
    if video.owner.premium?
      :premium_videojobs
    else
      :videojobs
    end
  end

  def perform(video)
    # Делаем обработку видео
  end
end

ProcessVideoJob.perform_later(Video.last)
```
> Убедитесь, что ваш бэкенд для очередей "слушает" имя вашей очереди. Для некоторых бэкендов необходимо указать очереди, которые нужно слушать.

### Колбэки <a name="5.6.6"></a>

Active Job предоставляет хуки для включения логики на протяжение жизненного цикла задания. Подобно другим колбэкам в Rails, можно реализовывать колбэки как обычные методы и использовать макрос-метод класса, чтобы зарегистрировать их в качестве колбэков:
```
class GuestsCleanupJob < ApplicationJob
  queue_as :default

  around_perform :around_cleanup

  def perform
    # Отложенное задание
  end

  private
    def around_cleanup
      # Делаем что-то перед perform
      yield
      # Делаем что-то после perform
    end
end
```
Макрос-методы класса также могут принимать блок. Рассмотрите возможность использования этого макроса, если код внутри блока настолько короток, что он помещается в одну строчку. Например, можно отправлять показатели для каждого помещенного в очередь задания.
```
class ApplicationJob < ActiveJob::Base
  before_enqueue { |job| $statsd.increment "#{job.class.name.underscore}.enqueue" }
end
```
#### Доступные колбэки
* `before_enqueue`
* `around_enqueue`
* `after_enqueue`
* `before_perform`
* `around_perform`
* `after_perform`

### Action Mailer <a name="5.6.7"></a>

Одним из обычных заданий в современном веб-приложении является рассылка писем за пределами цикла запроса-отклика, чтобы пользователь не ждал. Active Job интегрируется с Action Mailer, поэтому рассылать письма асинхронно очень просто:
```
# Если хотите отправить письмо сейчас, используйте #deliver_now
UserMailer.welcome(@user).deliver_now

# Если хотите отправить письмо через Active Job, используйте #deliver_later
UserMailer.welcome(@user).deliver_later
```
> Использование асинхронной очереди из задач Rake (например, для отправки электронной почты с помощью `.deliver_later`), как правило, не будет работать, потому что Rake, вероятно, завершится, в результате чего пул тредов внутри процесса будет удален до того, как любой/все из `.deliver_later` писем будут обработаны. Чтобы избежать этой проблемы, используйте `.deliver_now` или запустите персистентную очередь в development режиме.

### Интернационализация <a name="5.6.8"></a>

Каждое задание использует настройку `I18n.locale` при создании. Это полезно, если вы отправляете письма асинхронно:
```
I18n.locale = :eo

UserMailer.welcome(@user).deliver_later # Email будет локализован в Эсперанто.
```

### Поддерживаемые типы аргументов <a name="5.6.9"></a>

ActiveJob по умолчанию поддерживает следующие типы аргументов:
* Базовые типы (`NilClass`, `String`, `Integer`, `Float`, `BigDecimal`, `TrueClass`, `FalseClass`)
* `Symbol`
* `Date`
* `Time`
* `DateTime`
* `ActiveSupport::TimeWithZone`
* `ActiveSupport::Duration`
* `Hash` (Ключи должны быть типа `String` или `Symbol`)
* `ActiveSupport::HashWithIndifferentAccess`
* `Array` 

#### GlobalID

Active Job поддерживает GlobalID для параметров. Это позволяет передавать объекты Active Record в ваши задания, вместо пар класс/id, которые нужно затем десериализовать вручную. Раньше задания выглядели так:
```
class TrashableCleanupJob < ApplicationJob
  def perform(trashable_class, trashable_id, depth)
    trashable = trashable_class.constantize.find(trashable_id)
    trashable.cleanup(depth)
  end
end
```
Теперь можно просто сделать так:
```
class TrashableCleanupJob < ApplicationJob
  def perform(trashable, depth)
    trashable.cleanup(depth)
  end
end
```
Это работает с любым классом, в который подмешан `GlobalID::Identification`, который по умолчанию был подмешан в классы Active Record.

#### Сериализаторы

Можно расширить список поддерживаемых типов для аргументов. Для этого необходимо определить свой собственный сериализатор.
```
class MoneySerializer < ActiveJob::Serializers::ObjectSerializer
  # Проверяем, должен ли argument быть сериализован с использованием этого сериализатора.
  def serialize?(argument)
    argument.is_a? Money
  end

  # Преобразование объекта к более простому представителю, используя поддерживаемые типы объектов.
  # Рекомендуемым представителем является хэш с определенным ключом. Ключи могут быть только базового типа.
  # Необходимо вызвать `super`, чтобы добавить собственный тип сериализатора в хэш.
  def serialize(money)
    super(
      "amount" => money.amount,
      "currency" => money.currency
    )
  end

  # Преобразование сериализованного значения в надлежащий объект.
  def deserialize(hash)
    Money.new(hash["amount"], hash["currency"])
  end
end
```
и добавить этот сериализатор в список:
```
Rails.application.config.active_job.custom_serializers << MoneySerializer
```

### Исключения <a name="5.6.10"></a>

Active Job предоставляет способ отлова исключений, возникших во время выполнения задания:

```
class GuestsCleanupJob < ApplicationJob
  queue_as :default

  rescue_from(ActiveRecord::RecordNotFound) do |exception|
    # Сделать что-то с этим исключением
  end

  def perform
    # Отложенное задание
  end
end
```
Если исключение не будет поймано внутри задания, например, как показано выше, тогда задание будет помечено как "неудачное".


#### Повторная отправка или отмена неудачных заданий

Неудачное задание не будет повторено, если не настроено обратное.

Также возможно повторить отправку или отменить задание, если во время выполнения было вызвано исключение.

Например:
```
class RemoteServiceJob < ApplicationJob
  retry_on CustomAppException # по умолчанию, ожидание: 3 сек., попыток: 5

  discard_on ActiveJob::DeserializationError

  def perform(*args)
    # Может быть вызвано CustomAppException или ActiveJob::DeserializationError
  end
end
```
Более подробную информацию смотрите в документации по API для `ActiveJob::Exceptions`.

#### Десериализация

GlobalID позволяет сериализовать полностью объекты Active Record, переданные в `#perform`.

Если переданная запись была удалена после того, как задание было помещено в очередь, но до того, как метод `#perform` был вызван, Active Job вызовет исключение `ActiveJob::DeserializationError`.

### Тестирование заданий <a name="5.6.11"></a>

Вы можете найти подробные инструкции о том, как тестировать ваши задания в руководстве Тестирование приложений на Rails.


## Обзор Active Storage <a name="5.7"></a>

### Что такое Active Storage? <a name="5.7.1"></a>
Active Storage облегчает загрузку файлов в облачные хранилища данных, такие как Amazon S3, Google Cloud Storage или Microsoft Azure Storage, и прикрепляет эти файлы к объектам Active Record. Он поставляется с локальным на основе диска сервисом для разработки и тестирования, и поддерживает отзеркаливание (mirroring) файлов в подчиненных сервисах для резервного копирования и миграций.

Используя Active Storage приложение может преобразовывать изображения при загрузке с помощью ImageMagick, генерировать изображение файла, который не является изображением, такого, например, как PDF или видео, и извлекать метаданные из произвольных файлов.

### Установка <a name="5.7.2"></a>
Active Storage использует две таблицы в базе данных приложения названные `active_storage_blobs` и `active_storage_attachments`. После создания нового приложения (или апгрейда приложения до Rails 5.2), нужно запустить `rails active_storage:install`, чтобы сгенерировать миграцию, которая создает эти таблицы. Используйте `rails db:migrate` для запуска миграций.

> `active_storage_attachments` это полиморфная соединительная таблица, хранящая имена ваших классов моделей. Если имена ваших классов моделей меняются, необходимо запустить миграцию на эту таблицу, чтобы обновить соответствующие `record_type` новым именем вашего класса модели.

> Если используются UUID вместо чисел в качестве первичного ключа моделей, необходимо изменить тип столбца `record_id` для таблицы `active_storage_attachments` в соответствующей сгенерированной миграции.

Сервисы Active Storage объявляются в `config/storage.yml`. Для каждого сервиса, используемого в приложении, стоит указать имя и необходимую конфигурацию. В нижеприведенном примере объявляются три сервиса с именами `local`, `test` и `amazon`:
```
local:
  service: Disk
  root: <%= Rails.root.join("storage") %>

test:
  service: Disk
  root: <%= Rails.root.join("tmp/storage") %>

amazon:
  service: S3
  access_key_id: ""
  secret_access_key: ""
  bucket: ""
  region: "" # e.g. 'us-east-1'
```
Скажите Active Storage, какой сервис использовать, установив `Rails.application.config.active_storage.service`. Поскольку каждая среда, скорее всего, использует различные сервисы, рекомендуется делать это отдельно для каждого окружения. Чтобы использовать сервис диска из предыдущего примера в среде разработки, нужно добавить следующее в `config/environments/development.rb`:
```
# Хранение файлов локально.
config.active_storage.service = :local
```
Чтобы использовать сервис Amazon S3 в production, необходимо добавить следующее в `config/environments/production.rb`:
```
# Хранить файлы в Amazon S3.
config.active_storage.service = :amazon
```
Чтобы использовать тестовый сервис при тестировании, добавьте следующее в `config/environments/test.rb`:
```
# Хранить загруженные файлы в локальной файловой системе во временной директории.
config.active_storage.service = :test
```

#### Сервис `Disk`

Объявление сервиса `Disk` в `config/storage.yml`:
```
local:
  service: Disk
  root: <%= Rails.root.join("storage") %>
```

#### Сервис `Amazon S3`

Объявление сервиса `S3` в `config/storage.yml`:
```
amazon:
  service: S3
  access_key_id: ""
  secret_access_key: ""
  region: ""
  bucket: ""
```
Кроме того, необходимо добавить гем `aws-sdk-s3` в Gemfile:
```
gem "aws-sdk-s3", require: false
```
> Основные особенности Active Storage требуют следующих прав доступа: `s3:ListBucket`, `s3:PutObject`, `s3:GetObject` и `s3:DeleteObject`. Если есть дополнительные опции загрузки, сконфигурированные также как и настройка ACL, тогда могут потребоваться дополнительные права доступа.

> Если необходимо использовать переменные среды, стандартные файлы конфигурации SDK, профили, профили экземпляров IAM или роли задач, можно опустить ключи `access_key_id`, `secret_access_key` и `region` в приведенном выше примере. Сервис Amazon S3 поддерживает все опции аутентификации, описанные в документации AWS SDK.

#### Сервис Microsoft Azure Storage

Объявление сервиса Azure Storage в `config/storage.yml`:
```
azure:
  service: AzureStorage
  storage_account_name: ""
  storage_access_key: ""
  container: ""
```
Кроме того, необходимо добавить гем `azure-storage` в Gemfile:
```
gem "azure-storage", require: false
```

#### Сервис Google Cloud Storage

Объявление сервиса Google Cloud Storage в `config/storage.yml`:
```
google:
  service: GCS
  credentials: <%= Rails.root.join("path/to/keyfile.json") %>
  project: ""
  bucket: ""
```
Опционально можно предоставить хэш `credentials` вместо пути к `keyfile`:
```
google:
  service: GCS
  credentials:
    type: "service_account"
    project_id: ""
    private_key_id: <%= Rails.application.credentials.dig(:gcs, :private_key_id) %>
    private_key: <%= Rails.application.credentials.dig(:gcs, :private_key).dump %>
    client_email: ""
    client_id: ""
    auth_uri: "https://accounts.google.com/o/oauth2/auth"
    token_uri: "https://accounts.google.com/o/oauth2/token"
    auth_provider_x509_cert_url: "https://www.googleapis.com/oauth2/v1/certs"
    client_x509_cert_url: ""
  project: ""
  bucket: ""
```
Кроме того, необходимо добавить гем `google-cloud-storage` в Gemfile:
```
gem "google-cloud-storage", "~> 1.11", require: false
```

#### Сервис Mirror

Существует возможность синхронизировать несколько сервисов, определив сервис отзеркаливания. Сервис отзеркаливания копирует загрузки и удаляет из двух или более подчиненных сервисов.

Сервисы отзеркаливания предназначены для временного использования в течение миграции между сервисами в `production`. Можно начать отзеркаливание в новый сервис, скопировав существующие файлы со старого сервиса на новый, а затем полностью перейти на новый сервис.

Отзеркаливание не атомарно. Возможно, что загрузка будет успешной на основном сервисе и неуспешной на любом из подчиненных сервисов. Перед окончательным переходом на новый сервис, убедитесь, что все файлы были скопированы.

Определим каждый из требуемых сервисов, как описано выше. Будем ссылаться на них с помощью сервиса отзеркаливания.
```
s3_west_coast:
  service: S3
  access_key_id: ""
  secret_access_key: ""
  region: ""
  bucket: ""

s3_east_coast:
  service: S3
  access_key_id: ""
  secret_access_key: ""
  region: ""
  bucket: ""

production:
  service: Mirror
  primary: s3_east_coast
  mirrors:
    - s3_west_coast
```
Хотя все вторичные сервисы получают загрузки, скачивания всегда обрабатываются основным сервисом.

Сервисы отзеркаливания совместимы с прямой загрузкой. Новые файлы загружаются непосредственно в основной сервис. Когда напрямую загруженный файл прикрепляется к записи, в очередь помещается фоновое задание для копирования его во вторичные сервисы.

### Прикрепление файлов к записям <a name="5.7.3"></a>
#### `has_one_attached`
Макрос `has_one_attached` устанавливает сопоставление (mapping) один-к-одному между записями и файлами. Каждая запись может содержать один прикрепленный файл.

Например, предположим, что в приложении имеется модель `User`. Если необходимо, чтобы у каждого пользователя был аватар, нужно определить модель `User` следующим образом:
```
class User < ApplicationRecord
  has_one_attached :avatar
end
```
Далее можно создать пользователя с аватаром:
```
<%= form.file_field :avatar %>

class SignupController < ApplicationController
  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email_address, :password, :avatar)
    end
end
```
Вызов `avatar.attach` прикрепляет аватар к существующему пользователю:
```
user.avatar.attach(params[:avatar])
```
Вызов `avatar.attached?` определяет, есть ли у конкретного пользователя аватар:
```
user.avatar.attached?
```

#### `has_many_attached`

Макрос `has_many_attached` устанавливает отношение один-ко-многим между записями и файлами. У каждой записи может быть много прикрепленных файлов.

Например, предположим, что в приложении имеется модель `Message`. Если необходимо, чтобы у каждого сообщения было много изображений, нужно определить модель Message следующим образом:
```
class Message < ApplicationRecord
  has_many_attached :images
end
```
Далее можно создать сообщение с изображениями:
```
class MessagesController < ApplicationController
  def create
    message = Message.create!(message_params)
    redirect_to message
  end

  private
    def message_params
      params.require(:message).permit(:title, :content, images: [])
    end
end
```
Вызов `images.attach` добавляет новые изображения к существующему сообщению:
```
@message.images.attach(params[:images])
```
Вызов `images.attached?` определяет, есть ли у конкретного сообщения какие-либо изображения:
```
@message.images.attached?
```

#### Прикрепление объектов `File/IO`

Иногда необходимо прикрепить файл, который не поступает через HTTP-запрос. Например, может понадобиться прикрепить файл, сгенерированный на диске, или загрузить файл из введенного пользователем URL. Также можно захотеть прикрепить файл фикстур в тесте модели. Чтобы сделать это, предоставьте хэш, содержащий как минимум открытый объект IO и имя файла:
```
@message.image.attach(io: File.open('/path/to/file'), filename: 'file.pdf')
```
Когда это возможно, предоставьте тип содержимого. Active Storage пытается определить тип содержимого файла по его данным. Если он не может этого сделать, он возвращает тип содержимого, которое предоставляется.
```
@message.image.attach(io: File.open('/path/to/file'), filename: 'file.pdf', content_type: 'application/pdf')
```
Можно пропустить определение типа содержимого из данных, передав `identify: false` вместе с `content_type`.
```
@message.image.attach(
  io: File.open('/path/to/file'),
  filename: 'file.pdf',
  content_type: 'application/pdf',
  identify: false
)
```
Если не предоставляется тип содержимого и `Active Storage` не может автоматически определить тип содержимого файла, по умолчанию используется `application/octet-stream`.

### Удаление прикрепленных файлов <a name=5.7.4"></a>

Чтобы удалить прикрепленный файл из модели, необходимо вызвать purge на нем. Удаление может быть выполнено в фоновом режиме, если приложение использует `Active Job`. `purge` удаляет `blob` и файл из сервиса хранения.
```
# Синхронно уничтожить аватар и фактические файлы ресурса.
user.avatar.purge

# Асинхронно уничтожить связанные модели и фактические файлы ресурса с помощью Active Job.
user.avatar.purge_later
```

### Создание ссылок на файлы <a name="5.7.5"></a>

Сгенерируем постоянный URL для `blob`, который указывает на приложение. При доступе возвращается редирект на фактическую конечную точку сервиса. Эта косвенная адресация (indirection) отделяет публичный URL от фактического, и позволяет, например, отзеркаливание прикрепленных файлов в разных сервисах для высокой доступности. Перенаправление имеет HTTP-прекращение 5 минут.
```
url_for(user.avatar)
```
Чтобы создать ссылку для скачивания, необходимо использовать хелпер `rails_blob_{path|url}`. С помощью этого хелпера можно установить `disposition`.
```
rails_blob_path(user.avatar, disposition: "attachment")
```
Для предотвращения атак XSS, ActiveStorage принудительно устанавливает заголовок `Content-Disposition` как "attachment" для некоторых типов файлов. Чтобы изменить это поведение, смотрите доступные конфигурационные опции в Конфигурирование приложений на Rails.

Если необходимо создать ссылку из-за пределов содержимого контроллера/вьюхи (фоновые задания, задания Cron и т.д.), можно получить доступ к `rails_blob_path` следующим образом:
```
Rails.application.routes.url_helpers.rails_blob_path(user.avatar, only_path: true)
```
### Скачивание файлов <a name="5.7.6"></a>

Иногда необходимо обработать `blob` после его загрузки - например, чтобы преобразовать его в другой формат. Используйте `ActiveStorage::Blob#download` для чтения двоичных данных `blob` в памяти:
```
binary = user.avatar.download
```
Возможно, может понадобиться загрузить `blob` в файл на диске, чтобы внешняя программа могла работать с ним (например, антивирусный сканер или транскодер медиа). Используйте `ActiveStorage::Blob#open`, чтобы загрузить `blob` в `tempfile` на диске:
```
message.video.open do |file|
  system '/path/to/virus/scanner', file.path
  # ...
end
```

### Преобразование изображений <a name="5.7.7"></a>

Чтобы создать вариацию изображения, следует вызвать `variant` на `Blob`. Также возможно передать любое преобразование методу, поддерживаемому процессором. Процессором по умолчанию является `MiniMagick`, но также можно использовать `Vips`.

Чтобы включить варианты, добавьте гем image_processing в Gemfile:
```
gem 'image_processing', '~> 1.2'
```
Когда браузер обращается к URL варианта, Active Storage будет лениво преобразовывать исходный `blob` в указанный формат и перенаправлять его к новому месту расположения сервиса.
```
<%= image_tag user.avatar.variant(resize_to_limit: [100, 100]) %>
```
Чтобы переключиться на процессор `Vips`, необходимо добавить следующее в `config/application.rb`:
```
# Используйте Vips для обработки вариантов.
config.active_storage.variant_processor = :vips
```

### Предварительный просмотр файлов <a name="5.7.8"></a>

Некоторые файлы, который не являются изображениями, могут быть предварительно просмотрены: то есть они могут быть представлены как изображения. Например, видеофайл можно предварительно просмотреть, извлекая его первый кадр. Из коробки `Active Storage` поддерживает предварительный просмотр видео и документов PDF.
```
<ul>
  <% @message.files.each do |file| %>
    <li>
      <%= image_tag file.preview(resize_to_limit: [100, 100]) %>
    </li>
  <% end %>
</ul>
```
Для извлечения превью необходимы сторонние приложения, `FFmpeg` для видео и `muPDF` для `PDF`, а на `macOS` также `XQuartz` и `Poppler`. Эти библиотеки не предоставляются Rails. Необходимо установить их самостоятельно, чтобы использовать встроенные средства предварительного просмотра. Перед установкой и использованием стороннего программного обеспечения убедитесь, что понимаете последствия лицензирования этого.


### Прямые загрузки <a name="5.7.9"></a>

Active Storage со встроенной библиотекой JavaScript поддерживает загрузку прямо от клиента в облако.

#### Установка прямой загрузки
* Включите `activestorage.js` в комплект JavaScript приложения.

Используя файлопровод:
```
//= require activestorage
```
Используя пакет npm:
```
require("@rails/activestorage").start()
```
* Установите в true значение `direct_upload` поля для загрузки файла.
```
<%= form.file_field :attachments, multiple: true, direct_upload: true %>
```
* Вот и все! Загрузки начинаются с момента отправки формы.

#### События JavaScript прямой загрузки
```
Имя события 	Цель события 	Данные события (event.detail) 	Описание
direct-uploads:start 	<form> 	None 	Форма, содержащая файлы для прямой загрузки полей была отправлена.
direct-upload:initialize 	<input> 	{id, file} 	Вызывается для каждого файла после отправки формы.
direct-upload:start 	<input> 	{id, file} 	Прямая загрузка начинается.
direct-upload:before-blob-request 	<input> 	{id, file, xhr} 	Перед тем, как сделать запрос к приложению для прямой загрузки метаданных.
direct-upload:before-storage-request 	<input> 	{id, file, xhr} 	Перед тем, как сделать запрос на сохранение файла.
direct-upload:progress 	<input> 	{id, file, progress} 	По мере прогресса сохранения файлов.
direct-upload:error 	<input> 	{id, file, error} 	Произошла ошибка. Отображается alert, если это событие не отменено.
direct-upload:end 	<input> 	{id, file} 	Прямая загрузка закончилась.
direct-uploads:end 	<form> 	None 	Все прямые загрузки закончились.
```

#### Пример

Также можно использовать эти события, чтобы показывать ход загрузки.
```
direct-uploads
```
Чтобы показать загруженные файлы в форме:
```
// direct_uploads.js

addEventListener("direct-upload:initialize", event => {
  const { target, detail } = event
  const { id, file } = detail
  target.insertAdjacentHTML("beforebegin", `
    <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
      <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
      <span class="direct-upload__filename">${file.name}</span>
    </div>
  `)
})

addEventListener("direct-upload:start", event => {
  const { id } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.remove("direct-upload--pending")
})

addEventListener("direct-upload:progress", event => {
  const { id, progress } = event.detail
  const progressElement = document.getElementById(`direct-upload-progress-${id}`)
  progressElement.style.width = `${progress}%`
})

addEventListener("direct-upload:error", event => {
  event.preventDefault()
  const { id, error } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.add("direct-upload--error")
  element.setAttribute("title", error)
})

addEventListener("direct-upload:end", event => {
  const { id } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.add("direct-upload--complete")
})
```
Добавление стилей:
```
/* direct_uploads.css */

.direct-upload {
  display: inline-block;
  position: relative;
  padding: 2px 4px;
  margin: 0 3px 3px 0;
  border: 1px solid rgba(0, 0, 0, 0.3);
  border-radius: 3px;
  font-size: 11px;
  line-height: 13px;
}

.direct-upload--pending {
  opacity: 0.6;
}

.direct-upload__progress {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  opacity: 0.2;
  background: #0076ff;
  transition: width 120ms ease-out, opacity 60ms 60ms ease-in;
  transform: translate3d(0, 0, 0);
}

.direct-upload--complete .direct-upload__progress {
  opacity: 0.4;
}

.direct-upload--error {
  border-color: red;
}

input[type=file][data-direct-upload-url][disabled] {
  display: none;
}
```


#### Интеграция с библиотеками или фреймворками

Если необходимо использовать особенность прямой загрузки из фреймворка JavaScript или необходима интеграция собственных решений перетаскивания (drag-and-drop), для этой цели можно использовать класс DirectUpload. Получив файл из выбранной библиотеки, создайте экземпляр DirectUpload и вызовите его метод create. Этот метод принимает колбэк для вызова, когда загрузка завершена.
```
import { DirectUpload } from "@rails/activestorage"

const input = document.querySelector('input[type=file]')

// Привязка к сбрасыванию (drop) файла - используйте ondrop на родительском элементе или используйте библиотеку, такую как Dropzone
const onDrop = (event) => {
  event.preventDefault()
  const files = event.dataTransfer.files;
  Array.from(files).forEach(file => uploadFile(file))
}

// Привязка к обычному выбору файла
input.addEventListener('change', (event) => {
  Array.from(input.files).forEach(file => uploadFile(file))
  // можно очистить выбранные файлы из поля ввода
  input.value = null
})

const uploadFile = (file) => {
  // форма требует file_field direct_upload: true, который предоставляет data-direct-upload-url
  const url = input.dataset.directUploadUrl
  const upload = new DirectUpload(file, url)

  upload.create((error, blob) => {
    if (error) {
      // Обрабатываем ошибку
    } else {
      // Добавьте соответствующим образом названное скрытое поле в форму со значением blob.signed_id, чтобы идентификаторы blob были переданы в обычном потоке загрузки
      const hiddenField = document.createElement('input')
      hiddenField.setAttribute("type", "hidden");
      hiddenField.setAttribute("value", blob.signed_id);
      hiddenField.name = input.name
      document.querySelector('form').appendChild(hiddenField)
    }
  })
}
```
Если необходимо отслеживать ход загрузки файла, можно передать третий параметр в конструктор DirectUpload. Во время загрузки DirectUpload вызовет метод directUploadWillStoreFileWithXHR объекта. Затем можно привязать свой собственный обработчик прогресса на XHR.
```
import { DirectUpload } from "@rails/activestorage"

class Uploader {
  constructor(file, url) {
    this.upload = new DirectUpload(this.file, this.url, this)
  }

  upload(file) {
    this.upload.create((error, blob) => {
      if (error) {
        // Обрабатываем ошибку
      } else {
        // Добавьте соответствующим образом названное скрытое поле в форму со значением of blob.signed_id
      }
    })
  }

  directUploadWillStoreFileWithXHR(request) {
    request.upload.addEventListener("progress",
      event => this.directUploadDidProgress(event))
  }

  directUploadDidProgress(event) {
    // Используйте event.loaded и event.total, чтобы обновить индикатор процесса
  }
}
```


### Очистка файлов сохраненных во время системных тестов <a name="5.7.10"></a>

Системные тесты очищают тестовые данные, откатывая транзакцию. Поскольку уничтожение никогда не вызывается на объекте, прикрепленные файлы никогда не очищаются. Если необходимо очистить файлы, можно сделать это в колбэке after_teardown. Выполнение этого здесь гарантирует, что все соединения, созданные во время теста, будут завершены и не будет получено сообщение об ошибке из Active Storage, в котором говорится, что он не может найти файл.
```
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  def remove_uploaded_files
    FileUtils.rm_rf("#{Rails.root}/storage_test")
  end

  def after_teardown
    super
    remove_uploaded_files
  end
end
```
Если системные тесты проверяют удаление модели с прикрепленными файлами, и используется Active Job, необходимо установить тестовую среду для использования встроенного адаптера очереди, поэтому задание на purge выполняется немедленно, а не когда-нибудь потом.

Также можно использовать отдельное определение сервиса для тестовой среды, чтобы тесты не удаляли файлы, созданные во время разработки.
```
# Использование встроенной обработки задания, чтобы все произошло немедленно
config.active_job.queue_adapter = :inline

# Отдельное хранилище файлов в тестовой среде
config.active_storage.service = :local_test
```

### Отбрасывание (удаление) файлов, сохраненных во время интеграционных тестов <a name="5.7.11"></a>

Подобно системным тестам, файлы, загруженные во время интеграционных тестов, не будут автоматически очищены. Если необходимо очистить файлы, можно сделать это в колбэке after_teardown. Выполнение этого здесь гарантирует, что все созданные во время теста соединения будут завершены и не будет получено сообщение об ошибке из Active Storage, в котором говорится, что невозможно найти файл.
```
module RemoveUploadedFiles
  def after_teardown
    super
    remove_uploaded_files
  end

  private

  def remove_uploaded_files
    FileUtils.rm_rf(Rails.root.join('tmp', 'storage'))
  end
end

module ActionDispatch
  class IntegrationTest
    prepend RemoveUploadedFiles
  end
end
```

### Реализация поддержки других облачных сервисов <a name="5.7.12"></a>

Если необходимо поддерживать облачный сервис, отличный от имеющихся, необходимо, необходимо реализовать Service. Каждый сервис расширяет `ActiveStorage::Service`, реализуя методы, требуемые для загрузки и скачивания файлов в облако
