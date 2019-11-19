# Создание
git init

# Индексирование
git add .

# Коммит
git commit -m "GGWP"

# При изменении файлы, но ты хочешь чтобы результат вошел в предыдущий коммит
git commit --ammend

# Удаление коммита
git reset --hard HEAD~1
git reset --hard <commit-hash>

# Удалить индекс
git rm 
git rm -f
git reset HEAD <file>

# Вернуть к первоначальному индексу модифицированный файл
git checkout -- <file>

# Псевдонимы
git config --global alias.co checkout
git config --global alias.ci commit

# Теги
git tag <name>

# Удаленный репозиторий
git remote add <псевдноим> <url>
git clone <url>
git fetch 
git push
git pull
git remote show

# Просмотр истории коммитов
git log

# Просмотр изменений 
git diff

# Создание ветки 
git branch <name>

# Просмотр указателя веток
git log --oneline --decorate

# Переключение ветки
git checkout

# Просмотр истории коммитов и ветвления проекта
git log --oneline --decorate --graph --all

# Создание или (и) переключение на новую ветку
git checkout -b <name>
git branch <name>
git checkout <name>

# Удаление ветки
git branch -d <name>

# Просмотр конфилкта слияния
git status

# Графический инструмент разрешения конфликтов
git mergetool

# Список веток
git branch

# Последний коммит каждой из веток
git branch -v

# Ветки, слитые с текущей веткой или не слитые 
git branch --merged
git branch --no-merged

# Удаление ветки простое и принудительное
git branch -d <name>
git branch -D <name>

# Переименование удаленной ветки при клонировании
git clone -o <name>

# Синхронизация с сервером "тянем данные с сервера в локаль"
git fetch <name server>

# Добавление нового сервера
git remote add <name>

# Название по умолчанию для удаленной ветки - 
origin 

# для локальной ветки - 
master

# Отправка ветки на сервер
git push origin <branch name>

# Отпарвка ветки на сервер на определенную ветку
git push origin <local branch name>:<remote branch name>

# Кеш учетных данных чтобы не вводить каждый раз пароль
git config --global credential.helper cache

# Создание локальной ветки на основе удаленной ветки
git checkout -b <local branch name> origin/<remote branch name>

# Отслеживание определенной локальной ветки
git checkout --track <remote server>/<remote branch name>

# Настройка локальной ветки на удаленную ветку или изменение upstream отслеживаемой ветки
git branch -u origin/<branch name>
git branch --set-upstream-to origin/<branch name>

# Сокращения upstream
@{upstream}
@{u}
# Если отслеживается origin/master то можно использовать для слияния...
git merge @{u} 
# вместо 
git merge origin/master 

# Список локальных веток с информацией сравнения их с удаленными ветками и отслеживаемыми удаленными ветками  
# Информация берется из кеша и но не обращается к серверам
git branch -vv
# Чтобы получить актуальную информацию по веткам необходимо перед этим сделать ..
git fetch --all

# Загрузка изменений с сервера, но не изменяет директорию
git fetch

# Загрузка изменений с сервера и затем слияние делает команда...
git pull

# Слияние локальных данных с данными с сервера 
git merge

# Удаление ветки на сервере 
git push origin --delete <branch name>

# Перебазирование - взять все изменения, которые были зафиксированы в одной ветке и применить
# их к другой ветке
git rebase <branch name>