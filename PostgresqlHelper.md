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

## Linux Фишечки
### Создать строку  
`select 'hello world;`
### Создать столбец с строкой
`select 'hello world' as col1;`
### Создать таблицу 
`create table test_table as select 'hello world' as col1;`
> Создается по умолчанию в схеме `public`
### Выбор записи из таблицы 
`select * from test_table;`
### Создание юзера 
`CREATE USER drug;`
### Создание пароля для юзера
`\password drug`
### Просмотр ролей 
`\du`
### Подключение к удаленной базе данных
`psql -U drug -d postgres -h 127.0.0.1 -W`
### Выдача прав на работу с таблицей 
`grant select on table test_table to drug;`
### Создание схемы
`create schema secret`
### Выдача прав на работу со схемой
`grant usage on schema secret to drug;`
