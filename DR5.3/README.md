Домашняя работа к занятию "5.3. Введение. Экосистема. Архитектура. Жизненный цикл Docker контейнера"

Задача 1

Сценарий выполения задачи:

• создайте свой репозиторий на https://hub.docker.com; 

• выберете любой образ, который содержит веб-сервер Nginx;

• создайте свой fork образа;

• реализуйте функциональность: запуск веб-сервера в фоне с индекс-страницей, содержащей HTML-код ниже: 
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I’m DevOps Engineer!</h1>
</body>
</html>
Опубликуйте созданный форк в своем репозитории и предоставьте ответ в виде ссылки на https://hub.docker.com/username_repo.

Ответ: 

https://hub.docker.com/r/skan23121981/ng












Задача 2

Посмотрите на сценарий ниже и ответьте на вопрос: "Подходит ли в этом сценарии использование Docker контейнеров или лучше подойдет виртуальная машина, физическая машина? Может быть возможны разные варианты?"
Детально опишите и обоснуйте свой выбор.

Ответ:


Сценарий:

• Высоконагруженное монолитное java веб-приложение;

физический сервер, так как  высоконагруженное необходим физический доступ, без использования гипервизора ВМ. Монолитное — значит, в микросервисах не реализуемо без изменения кода.
    
• Nodejs веб-приложение
    
для веб-приложения достаточно использовать Docker.

• Мобильное приложение c версиями для Android и iOS

Docker не был создан для подобного рода вещей, а именно запуска графических приложений, приложение в докере не имеет GUI. Поэтому виртуалка.

• Шина данных на базе Apache Kafka

 подходит как Docker так и ВМ.
 
• Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana
     
 elasticsearch лучше на ВМ отказоустойчевость на уровне кластера, 
      logstash и kibana можно и в Docker и в ВМ
       
• Мониторинг-стек на базе Prometheus и Grafana

 Prometheus -весь стек можно развернуть с использованием контейнеров, масштабируемый сбор данных, не зависящий от распределенного хранилища, системы не хранят как таковых данных, создан для распределенных систем и инфраструктур, можно резвернуть с Docker. По Grafana так же предпочтительнее Docker. 
 
• MongoDB, как основное хранилище данных для java-приложения

 используем ВМ, хранить БД с данными в контейнере не подходит.
      
• Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry.

 GitLab хорошо поддерживает Docker и позволяет подключать собственные системы хранения образов (GitLab Registry), А также отслеживать статус выполнения работ по проекту и управлять развернутыми версиями приложения, позволяя при необходимости откатиться на прошлую в один клик. Используем Docker.                                  
      
 Задача 3
       
• Запустите первый контейнер из образа centos c любым тэгом в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера; 

• Запустите второй контейнер из образа debian в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера; 

• Подключитесь к первому контейнеру с помощью docker exec и создайте текстовый файл любого содержания в /data; 

• Добавьте еще один файл в папку /data на хостовой машине; 

• Подключитесь во второй контейнер и отобразите листинг и содержание файлов в /data контейнера. 
     
Ответ: 
      
   ![изображение](https://user-images.githubusercontent.com/91260493/153066093-e2f4acf6-3ab4-4876-9568-661e89b59a41.png)
   

