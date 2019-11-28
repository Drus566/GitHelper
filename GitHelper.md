### Создание
git init

### Индексирование
git add .

### Коммит
git commit -m "GGWP"

### При изменении файла, но ты хочешь чтобы результат вошел в предыдущий коммит
git commit --ammend

### Удаление коммита
git reset --hard HEAD~1
git reset --hard <commit-hash>

### Восстановление коммита
git reflog
...видим список удаленных коммитов, выбираем нужный 
git reset --hard <commit-hash>
...или
git reset hard HEAD@{<commit-number>}


### Удалить индекс
git rm 
git rm -f
git reset HEAD <file>

### Вернуть к первоначальному индексу модифицированный файл
git checkout -- <file>

### Псевдонимы
git config --global alias.co checkout
git config --global alias.ci commit

### Теги
git tag <name>

### Удаленный репозиторий
git remote add <псевдноим> <url>
git clone <url>
git fetch 
git push
git pull
git remote show

### Просмотр истории коммитов
git log

### Просмотр изменений 
git diff
git diff --cached
git diff --staged

### Создание ветки 
git branch <name>

### Просмотр указателя веток
git log --oneline --decorate

### Переключение ветки
git checkout

### Просмотр истории коммитов и ветвления проекта
git log --oneline --decorate --graph --all

### Создание или (и) переключение на новую ветку
git checkout -b <name>
git branch <name>
git checkout <name>

### Удаление ветки
git branch -d <name>

### Просмотр конфилкта слияния
git status

### Графический инструмент разрешения конфликтов
git mergetool

### Список веток
git branch

### Последний коммит каждой из веток
git branch -v

### Ветки, слитые с текущей веткой или не слитые 
git branch --merged
git branch --no-merged

### Удаление ветки простое и принудительное
git branch -d <name>
git branch -D <name>

### Переименование удаленной ветки при клонировании
git clone -o <name>

### Синхронизация с сервером "тянем данные с сервера в локаль"
git fetch <name server>

### Добавление нового сервера
git remote add <name>

### Название по умолчанию для удаленной ветки - 
origin 

### для локальной ветки - 
master

### Отправка ветки на сервер
git push origin <branch name>

### Отпарвка ветки на сервер на определенную ветку
git push origin <local branch name>:<remote branch name>

### Кеш учетных данных чтобы не вводить каждый раз пароль
git config --global credential.helper cache

### Создание локальной ветки на основе удаленной ветки
git checkout -b <local branch name> origin/<remote branch name>

### Отслеживание определенной локальной ветки
git checkout --track <remote server>/<remote branch name>

### Настройка локальной ветки на удаленную ветку или изменение upstream отслеживаемой ветки
git branch -u origin/<branch name>
git branch --set-upstream-to origin/<branch name>

### Сокращения upstream
@{upstream}
@{u}
### Если отслеживается origin/master то можно использовать для слияния...
git merge @{u} 
### вместо 
git merge origin/master 

### Список локальных веток с информацией сравнения их с удаленными ветками и отслеживаемыми удаленными ветками  
### Информация берется из кеша и но не обращается к серверам
git branch -vv
### Чтобы получить актуальную информацию по веткам необходимо перед этим сделать ..
git fetch --all

### Загрузка изменений с сервера, но не изменяет директорию
git fetch

### Загрузка изменений с сервера и затем слияние делает команда...
git pull

### Слияние локальных данных с данными с сервера 
git merge

### Удаление ветки на сервере 
git push origin --delete <branch name>

### Перебазирование - взять все изменения, которые были зафиксированы в одной ветке и применить
### их к другой ветке
git rebase <branch name>

### Если есть мастер ветка, от нее ответвление тематической ветки, сделан в тематической ветке коммит,
### и от это тематической ветки еще одно ответвление, в которой вы делаете коммиты, то чтобы 
### внести изменения из последней тематической ветки в мастер ветку, а первую тематическую ветку не трогать
git rebase --onto master <тематическая ветка 1> <тематическая ветка 2>
git checkout master
git merge <тематическая ветка 2>

### Перемещение тематической ветки на ветку master без предварительного переключения на тематическую ветку
git rebase master <тематическая ветка>
git checkout master
git merge <тематическая ветка>

## Не перемещайте коммиты, уже отправленные в публичный репозиторий

### https://stackoverflow.com/questions/2472254/when-should-i-use-git-pull-rebase
### Однако иногда - по какой-либо причине - вы думаете, что на самом деле было бы лучше, если бы эти два - ### удаленный и локальный - были одной ветвью. Как в SVN. Именно здесь вступает в игру git pull --rebase. ### Вы больше не объединяетесь - вы фактически делаете коммит поверх удаленной ветви.
git pull --rebase

### Клонирование локального репозитория 
git clone /opt/git/project.git
git clone file:///opt/git/project.git (медленнее, т.к работает как с сетевым протоколом)

### Добавление локального репозитория в существующий проект
git remote add local_proj /opt/git/project.git

### Клонирование по HTTPS
git clone https://example.com/gitproject.git

### Клонирование по SSH
git clone ssh://user@server/project.git
git clone user@server:project.git

### Клонирование вашего репозитория и создание нового голого репозитория
git clone --bare my_project my_project.git (наподобие $ cp -Rf my_project/.git my_project.git)

### Добавление нового репозитория на сервер в директорию"/opt/git", копированием голого репозитория
scp -r my_project.git user@git.example.com:/opt/git

### Клонирование с opt/git
git clone user@git.example.com:/opt/git/my_project.git

### Добавление права на запись в репозиторий для группы на сервере
ssh user@git.example.com
cd /opt/git/my_project.git
git init --bare --shared

### Каталог хранения ssh ключей
cd ~/.ssh 
ls (ищем id_dsa или id_rsa и соответствующий .pub файл, где хранится открытый ключ)

### Создание ssh ключей
ssh-keygen

### Создание пользователя гит и каталога .ssh для него
sudo adduser git
su git
cd 
mkdir .ssh && chmod 700 .ssh
touch .ssh/authorized_keys && chmod 600 .ssh/authorized_keys

### Добавление открытых ключей SSH разработчика в файл authorized_keys 
cat /tmp/id_rsa.john.pub >> ~/.ssh/authorized_keys
cat /tmp/id_rsa.josie.pub >> ~/.ssh/authorized_keys
cat /tmp/id_rsa.jessica.pub >> ~/.ssh/authorized_keys

### Создание пустого репозитория для пользователей
cd /opt/git
mkdir project.git
cd project.git
git init --bare

### Список ненужных пробелов перед коммитом
git diff --check

### Если изменения касаются одного файла, то это для частичного добавления файлов в индекс
git add --patch

### История коммитов 
git log --no-merges

### Слияние изменений с сервера
git fetch origin
git merge origin/master

### Отображение списков коммитов, которые существуют в последней ветке, но отсутствуют в первой 
git log --no-merges <имя верхней ветки>..<имя последней ветки>

### Создание ветки базируясь на мастер ветке сервера
git checkout -b featureB origin/master

### Отправка изменений из локальной ветки featureB в ветку featureBee на сервере (спецификация ссылок)
git push -u origin featureB:featureBee

### Просмотр изменений, которые сделаны сторонним разработчиком в origin/featureA, и сливание веток
git fetch origin
git log featureA..origin/featureA
git checkout featureA
git merge origin/featureA

### Работа с публичным проектом
git clone (url)
cd project
git checkout -b featureA
...work
git commit
...делаем форк публичного проекта
git remote add myfork (url)
git push -u myfork featureA
...далее уведомляем сопровождающего публичного проекта, например через git request-pull
git request-pull origin/master myfork
...вывод команды отправляется сопровождающему публичного проекта

### Перебазирование в случае конфликтного слияния сопровождающего публичного проекта
git checkout featureA
git rebase origin/master
git push -f myfork featureA

### Перебазирование в случае конфликтного слияния сопровождающего публичного проекта с помощью создания новой ветки
git checkout -b featureBv2 origin/master
git merge --no-commit --squash featureB
...change implementation
git commit
git push myfork featureBv2
> Опция --squash берет все изменения из указанной ветки, объединяет их и создаёт новый коммит в текущей ветке без создания коммита слияния. Опция --no-commit указывает Git не создавать новый коммит автоматически. Это возволит взять изменения из другой ветки, внести дополнительные изменения и только потом создать новый коммит.

### Создание файлов в формате mbox для рассылки по email, оборачивает каждый коммит в email сообщение
git checkout -b topicA
...work
git commit
git format-patch -M origin/master
> Флаг -M указывает Git искать переименования
> Eсли добавить текст между строкой --- и началом патча (строка diff --git), то разработчики увидят его, но применяться он не будет.

### Пространство имен для веток
git branch sc/ruby_client master
> sc - это сокращение от имени того, кто проделал работу
...или при создании сразу переключится на тематическую ветку
git checkout -b sc/ruby_client master

### Применение патча, переданного по почте (если патч создан git diff или unix командой diff)
git apply /tmp/patch-ruby-client.patch

### Проверка патча до его фактического применения 
git apply --check 0001-seeing-if-this-helps-the-gem.patch

### Применение патча, сгененрированного командой format-patch
git am 0001-limit-log-function.patch

### При конфилктах патчинга с помощью git am, можно в ручную исправить их, проиндексировать и ввести команду
git am --resolved

### Для трехстороннего слияни
git am -3 0001-seeing-if-gem.patch

### Интерактивный режим git am, задается вопрос о дальнейших действиях перед патчем
git am -3 -i mbox

### Тестирование репозитория, добавив удаленный репозиторий и получив изменения из ветки локально
git remote add jessica git://github.com/jessica/myproject.git
git fetch jessica
git checkout -b rubyclient jessica/ruby-client

### Однократное выполнение, ссылка на репозиторий сохранена не будет
git pull (url)

### Проделанная работа только из тематической ветки, относительно общего родителя с веткой master
git diff master...contrib

### Выборочное применение изменений
git cherry-pick <commit>
...применение коммита к ветке мастер, будет создан новый коммит

### Переиспользование записанного разрешения (rerere) сохраняет набор образов до и после успешного слияния, а также разрешает конфликты самостоятельно, если аналогичные конфликты уже были разрешены ранее
git config --global rerere.enabled true 
> После этого любое разрешение конфликта слияния будет записано на случай повторного использования

### Обращение к кешу rerere напрямую
git rerere

### Добавление тега и цифровой подписи для нег, чтобы можно было откатится до этого коммита
git tag -s v1.5 -m 'my signed 1.5 tag'

### Публичные ключи
gpg --list-keys

### Создание нового объекта в бд гит, возвращает sha-1 этого объекта
gpg -a --export F721C45A | git hash-object -w --stdin 

### Установка тега на объект в бд гит с помощью sha-1
git tag -a maintainer-pgp-pub <sha1>

### Тег станет общедоступным, все кто захочет проверить подпись, могут импортировать публичный ключ
git push --tags

### Получение ключа из репозитория 
git show maintainer-pgp-pub | gpg --import
> После этого можно проверять цифровую подпись ваших тэгов. Кроме этого, вы можете включить дополнительные инструкции по проверке вашей подписи в сообщение тэга, которое будет отображаться каждый раз при вызове команды git show <tag>

### Читаемые имена коммитов
git describe <имя ветки> <имя коммита>

### Создание архива состояния кода
git archive master --prefix='project/' | gzip > `git describe master`.tar.gz
...или зип
git archive master --prefix='project/' --format=zip > `git describe master`.zip

### С помощью команды git shortlog можно быстро получить список изменений, внесенных в проект с момента последнего релиза или предыдущей рассылки. Она собирает все коммиты в заданном интервале
git shortlog --no-merges master --not v1.0.1

### Суммарные изменения, которые будут включены в основную ветку при слиянии тематической ветки
git diff master...<branch>

> Возможно, ваш следующий вопрос будет “Как мне сослаться на предыдущий запрос слияния?”. Оказывается, существует много способов ссылаться на другие вещи практически везде, где у вас есть права записи на GitHub. Давайте начнём с перекрестных ссылок для запросов слияния или проблем. Всем запросам слияния и проблемам присваиваются уникальные номера в пределах проекта. Например, у вас не может быть запроса на слияние с номером #3 и проблемы с номером #3. Если вы хотите сослаться на любой запрос слияния или проблему из другого места, просто добавьте #<num> в коментарий или описание. Так же можно указывать более конкретно, если проблема или запрос слияния находятя где-то ещё; пишите username#<num> если ссылаетесь на проблему или запрос слияния, находящиеся в ответвленном репозитории, или username/repo#<num> если ссылаетесь на другой репозиторий.

### Список всех веток и тегов на удаленном сервера
git ls-remote https://github.com/schacon/blink

### Получение ссылок напрямую
git fetch origin refs/pull/958/head
> Далее, вы можете слить изменения в нужную ветку при помощи команды git merge FETCH_HEAD, однако сообщение коммита слияния будет выглядеть немного странно. Так же это становится утомительным, если вы просматриваете много запросов на слияние.






