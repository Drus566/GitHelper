# Содержание

5. [Копаем глубже](#5)
* 5.2 [Основы Action Mailbox](#5.5)

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

### Конфигурация <a name="5.5.3"></a>
### Примеры <a name="5.5.4"></a>
### Уничтожение InboundEmails <a name="5.5.5"></a>
### Работа с Action Mailbox при разработке <a name="5.5.6"></a>
### Тестирование почтовых ящиков <a name="5.5.7"></a>
