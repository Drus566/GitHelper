### Установка 11 версии
```
sudo apt install postgresql-11 libpq-dev
```
### Вход в Postgresql
```
psql -d имя_базы_данных -U имя_пользователя -W
psql -h удаленный_хост -d имя_базы_данных -U имя_пользователя -
```
### Стандартный администраторский вход
```
sudo -u postgres psql -U postgres
sudo -u postgres psql
```
### Создание пользователя chris
```
sudo -u postgres createuser chris -s
```
### Вход в терминал psql
```
sudo -u postgres psql
```
### Команды терминала psql
```
\dt – показать все таблицы
\q – выход из терминала psql
\dn – показать все схемы
\du – показать всех пользователей
\d имя_таблицы - показать информацию о таблице
\password chris - установка пароля для пользователя chris 
```
