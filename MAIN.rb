# Создание
git init
# Индексирование
git add .
# Коммит
git commit -m "GGWP"
# При изменении файлы, но ты хочешь чтобы результат вошел в предыдущий коммит
git commit --ammend
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
