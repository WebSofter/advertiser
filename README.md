

### Клонируем исходники с GitHub
$ git clone git@github.com:WebSofter/advertiser.git


### Задаем алиасы
$ alias python=python3
$ alias pip=pip3

### Ставим Postgress 12
$ sudo apt update
$ sudo apt -y install vim bash-completion wget
$ sudo apt -y upgrade
$ sudo reboot
$ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
$ echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee /etc/apt/sources.list.d/pgdg.list
$ sudo apt update
$ sudo apt -y install postgresql-12 postgresql-client-12

#### Импорт БД Postgress(Если это необходимо)
$ psql 
> CREATE DATABASE "advertiser" WITH OWNER "advertiser" ENCODING 'UTF8' LC_COLLATE = 'ru_RU.UTF-8' LC_CTYPE = 'ru_RU.UTF-8' TEMPLATE = template0;
> -f advertiser.sql advertiser

#### Создаем нового юзера Postgress
$ sudo su - postgres
$ psql -c "alter user postgres with password '123456'"
$ psql
$ \conninfo

#### Проверка
$ systemctl status postgresql.service
$ systemctl status postgresql@12-main.service
$ systemctl is-enabled postgresql

### Ставим зависимости Django - проекта
$ python -m pip install --upgrade --user pip setuptools virtualenv

#### создаем виртуальнео окружение python
$ python -m virtualenv env
$ source venv/bin/activate

$ pip install -r requirements.txt 
$ python3 manage.py migrate
$ python3 runserver 0.0.0.0:8000

#### при необходимости обновляем пакеты
$ pip install pip-review
$ pip-review --local --interactive

**нужно будет еще учитывать системные требования модулей Django и пакеты Ubuntu, 
которых затребует Django  которых потребуется установить, анализируя консоль вывода ошибок Django
Пример:
0). Ставим инструменты разработки Python
$ apt-get install python-dev
1). Если в  процессе появляется ошибка, связанная с компиляцией pycairo для Linux, то выполняем
$ sudo apt-get install libcairo2-dev libjpeg-dev libgif-dev
$ pip install pycairo
**

#### Настройка Firewall для Django
$ sudo ufw allow 8000


### Ставим Nginx
$ sudo apt update
$ sudo apt install nginx
#Прописываем в конфигурации сайта Nginx
    location / { 
        try_files $uri $uri/ /index.html;
    }

#### Настройка Firewall для Nginx
$ sudo ufw allow 'Nginx HTTP'

$ sudo ufw allow 80
$ sudo ufw allow 443

### Настройка Node.js и фронта
$ cd frontend
$ npm install -g npm@latest
$ rm packahe-lock.json
$ npm install
$ npm run serve|build

#### Настройка Firewall для Vue
$ sudo ufw allow 4545

8. Вечный запуск менеджером процессов PM2
$ npm install pm2 -g
$ pm2 start backend/advertiser/start.sh --name django
$ pm2 start frontend/start.json --name vue
$ pm2 list|start|restart|stop|delete


### Ставим Ubuntu на локалку или VirtualBox(в настройках сети указываем "Сетевой адаптер")

1. Настройка Firewall и SSH-доступа к серверу
$ sudo ufw enable
$ sudo ufw default deny incoming
$ sudo ufw default allow outgoing
$ sudo ufw app list
$ sudo ufw allow ssh
$ sudo ufw allow 22
$ sudo ufw allow 2222

$ sudo apt install net-tools
$ ifconfig
$ 10.0.2.15 panel.loc
$ ssh-copy-id panel.loc





















