# Содержание
 - `repo_init.sh` - bash-скрипт для инициации репозитория Git курсов JavaRush.com. Каждый курс сохраняется в свой собственный репозиторий. Курс состоит из 10+ уровней, нумерующихся с **1**. 
Задачи курса имеют единый сквозной номер, включающий номер курса. 

```sh
Скрипт выполняет следующее:
 - создает файл описания проекта README_JAVARUSH.md в текущей папке.
 - копирует файл лицензии и файл исключений git из `./templates` в текущую папку.
 - инициирует репозиторий git в текущей папке и делает первый коммит.
 - связывает векту с новым `origin` удаленным репозиторием GitHub и делает сохранение - `push` в удаленный репозиторий.

Необходимо исправить `repo_init.sh` в соответствии с новым проектом: прописать правильное название нового проекта и репозитория
и главное - правильную ссылку на репозиторий в GitHub. Скопировать `repo_init.sh` в корневую папку проекта и запустить.
```
 
 - `./templates/licence.md` - файл с лицензией для исходного кода решения задачь курса. Применяется свободная лицензия СС С0. Файл копируется в корневую папку проекта/репозитория.

 - `./templates/.gitignore` - файл для игнорирования хранения в git некоторых проектных файлов (шаблон). Копируется в проектную курневую папку.
