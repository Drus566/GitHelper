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
